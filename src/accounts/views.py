from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponse, JsonResponse
from django.shortcuts import redirect
from django.urls import reverse
from django.views import View
from django.views.generic import CreateView, UpdateView, DetailView, TemplateView

from accounts.forms import AddressForm, CustomerProfileForm
from accounts.models import Address, CustomerProxy


class AddressCreateView(LoginRequiredMixin, CreateView):
    model = Address
    form_class = AddressForm
    template_name = 'account/create-address.html'

    def form_valid(self, form):
        """
         اتوماتیک یوزر فعال به عنوان صاحب آدرس انتخاب شود .
        """
        instance = form.save(commit=False)
        instance.customer = self.request.user
        instance.save()

        if self.request.is_ajax():
            return JsonResponse({'success': True, 'address': instance}, status=201)
        return redirect(reverse('home'))

    def form_invalid(self, form):
        if self.request.is_ajax():
            return JsonResponse({'success': False, 'errors': form.errors}, status=400)
        return super().form_invalid(form)


class AddressUpdateView(LoginRequiredMixin, UpdateView):
    model = Address
    form_class = AddressForm
    template_name = 'account/create-address.html'

    def form_valid(self, form):
        """
        اتوماتیک یوزر فعال به عنوان صاحب آدرس انتخاب شود
        """
        form.instance.user = self.request.user
        return super().form_valid(form)


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


class StaffDashboard(TemplateView):
    template_name = 'account/staff_dashboard.html'


class CustomerPanel(DetailView):
    """
    صفحه کاربری مشتری
    """
    model = CustomerProxy
    template_name = 'account/customer_dashboard.html'


class CustomerUpdateView(UpdateView):
    """
    ویرایش اطلاعات کاربر
    """
    model = CustomerProxy
    form_class = CustomerProfileForm
    template_name = 'account/customer_update.html'
    success_url = 'customer-panel'

    def get_form_kwargs(self):
        """
        به منظور اورراید کردن کوئری ست مربوط به آدرس کاربر. فقط کاربر آدرس های خودش را ببیند.
        از آنجا که فیلد ریکوئست به صورت پیشفرض در فرم وجود ندارد باید آن را از ویو به فرم بدهیم .
        """
        kwargs = super(CustomerUpdateView, self).get_form_kwargs()
        kwargs['user'] = self.request.user
        return kwargs

