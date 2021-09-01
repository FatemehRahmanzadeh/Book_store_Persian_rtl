from bootstrap_modal_forms.generic import BSModalCreateView
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.db import IntegrityError
from django.http import JsonResponse, HttpResponse
from django.shortcuts import redirect, render
from django.urls import reverse_lazy
from django.views.generic import CreateView, UpdateView, DetailView, TemplateView, DeleteView

from accounts.forms import AddressForm, CustomerProfileForm, CustomUserCreationForm
from accounts.models import Address, CustomerProxy, CustomUser
from accounts.serializers import AddressSerializer


class SignUpView(BSModalCreateView):
    """
        برای ایجاد مودال ثبت نام
    """
    model = CustomUser
    form_class = CustomUserCreationForm
    template_name = 'account/signup_modal.html'
    success_message = 'Success: خوش آمدید :)'
    success_url = reverse_lazy('home')


class AddressCreateView(LoginRequiredMixin, CreateView):
    model = Address
    form_class = AddressForm
    template_name = 'account/address/create-address.html'

    def form_valid(self, form):
        """
         اتوماتیک یوزر فعال به عنوان صاحب آدرس انتخاب شود .
        """
        instance = form.save(commit=False)
        instance.customer = self.request.user
        if instance.is_default:
            self.request.user.set_default_address(instance)

        if not self.request.user.user_addresses.filter(is_default=True):
            instance.is_default = True
        instance.save()
        if self.request.is_ajax():
            return JsonResponse({'success': True, 'address': instance}, status=201)
            # پاسخی که در ان پاپ آپ آدرس بسته شود و آپشن به لیست آدرس های سفارش اضافه شود

        # if self.request.path_info == '/%i/send-order/':
        return HttpResponse(
            '<script>opener.closePopup(window, "%s", "%s", "#addr_id");</script>' % (instance.pk, instance))
        # else:
        #     return redirect(reverse_lazy('accounts:customer-panel', args=[str(self.request.user.slug)]))

    def form_invalid(self, form):
        if self.request.is_ajax():
            return JsonResponse({'success': False, 'errors': form.errors}, status=400)
        return super().form_invalid(form)


class AddressUpdateView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    """
    ویرایش آدرس کاربر
    """
    model = Address
    form_class = AddressForm
    template_name = 'account/address/create-address.html'

    def form_valid(self, form):
        """
        اتوماتیک یوزر فعال به عنوان صاحب آدرس انتخاب شود
        """
        form.instance.customer = self.request.user
        return super().form_valid(form)

    def test_func(self):
        obj = self.get_object()
        return obj.customer == self.request.user


class DeleteAddress(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    """
    حذف آدرس کاربر
    """
    model = Address
    template_name = 'account/address/delete_address.html'

    def test_func(self):
        obj = self.get_object()
        return obj.customer == self.request.user

    def get_success_url(self):
        return reverse_lazy('accounts:customer-panel', args=[str(self.request.user.slug)])

    def delete(self, request, *args, **kwargs):
        if self.request.is_ajax:
            address = self.get_object()
            if not address.is_default:
                try:
                    address.delete()
                    return JsonResponse({"success": True, "msg": "آدرس با موفقیت حذف شد"})
                except IntegrityError:
                    return JsonResponse({"success": False, "error": "شما اجازه حذف آدرس سفارش را ندارید!"})
            else:
                return JsonResponse({"success": False, "error": "شما اجازه حذف آدرس اصلی را ندارید!"})
        else:
            return super(DeleteAddress, self).delete(request, *args, **kwargs)


class StaffDashboard(TemplateView):
    template_name = 'account/staff_dashboard.html'


class CustomerPanel(DetailView):
    """
    صفحه کاربری مشتری
    """
    model = CustomUser
    template_name = 'account/customer_dashboard.html'


class CustomerUpdateView(UpdateView):
    """
    ویرایش اطلاعات کاربر
    """
    model = CustomUser
    form_class = CustomerProfileForm
    template_name = 'account/customer_update.html'

    def get_form_kwargs(self):
        """
        به منظور اورراید کردن کوئری ست مربوط به آدرس کاربر. فقط کاربر آدرس های خودش را ببیند.
        از آنجا که فیلد ریکوئست به صورت پیشفرض در فرم وجود ندارد باید آن را از ویو به فرم بدهیم .
        """
        kwargs = super(CustomerUpdateView, self).get_form_kwargs()
        kwargs['user'] = self.request.user
        return kwargs

    def form_valid(self, form):
        """
        وقتی کاربر فرم را ارسال کرد در این متد آدرس پیشفرضش را تغییر می دهیم.
        """
        default_address_id = self.request.POST.get('default_address')
        default_address = self.request.user.user_addresses.get(id=default_address_id)
        print(default_address)
        self.request.user.set_default_address(default_address)
        return super(CustomerUpdateView, self).form_valid(form)

    def get_success_url(self):
        return reverse_lazy('accounts:customer-panel', args=[str(self.object.slug)])


@login_required()
def login_redirects(request):
    """
    با توجه به اینکه کاربر مشتری است یا کارمند یا مدیر تصمیم میگیرد به کدام صفحه هدایت شود
    """

    if request.user.is_superuser:
        return redirect("/admin/")
    if request.user.is_staff:
        return redirect("accounts:staff-panel", str(request.user.slug))
    else:
        return redirect("create-order")


def get_user_addresses(request):
    """
    نمایش همه آدرس های کاربر
    """
    try:
        addresses = Address.objects.filter(customer=request.user)
        addresses_ser = AddressSerializer(addresses, many=True)
        if request.is_ajax():
            return JsonResponse({'addresses': addresses_ser.data})
        else:
            return render(request, 'account/address/addresses.html', {'addresses': addresses})
    except Address.DoesNotExist:
        if request.is_ajax():
            return JsonResponse({'msg': 'هیچ آدرسی پیدا نشد'})
        else:
            return HttpResponse('<h1 class="text-danger">هیچ آدرسی پیدا نشد!</h1>')
