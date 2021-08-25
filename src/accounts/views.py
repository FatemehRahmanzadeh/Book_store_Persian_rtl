from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponse, JsonResponse
from django.shortcuts import redirect
from django.urls import reverse
from django.views.generic import CreateView, UpdateView

from accounts.forms import AddressForm
from accounts.models import Address


class AddressCreateView(LoginRequiredMixin, CreateView):
    model = Address
    form_class = AddressForm
    template_name = 'account/create-address.html'

    # fields = ['is_default', 'province', 'city', 'street', 'details', 'postcode']

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

    # fields = ['is_default', 'province', 'city', 'street', 'details', 'postcode']

    def form_valid(self, form):
        """
        اتوماتیک یوزر فعال به عنوان صاحب آدرس انتخاب شود
        """
        form.instance.user = self.request.user
        return super().form_valid(form)
