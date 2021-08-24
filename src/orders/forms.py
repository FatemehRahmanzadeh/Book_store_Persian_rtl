from django import forms
from django.utils import timezone
from django.utils.translation import gettext_lazy as _

from accounts.models import Address
from orders.models import Order, DiscountCode


class AddressChoice(forms.ModelChoiceField):
    default_error_messages = {
        'invalid_choice': _('لطفاٌ گزینه مناسب را برای آدرس خود انتخاب کنید'),
    }


class OrderUpdateForm(forms.ModelForm):
    """
    فرم ثبت سفارش مشتری.
    """
    delivery_address = AddressChoice(queryset=Address.objects.all(), required=True)

    class Meta:
        model = Order
        fields = ['delivery_address', 'discount']

    # def clean(self):
    #     """
    #     بررسی کد تخفیف از نظر اعتبار و صحیح بودن کد
    #     """
    #     super(OrderUpdateForm, self).clean()
    #     order_discounts = DiscountCode.objects.all()
    #     disc_cods = [_.code for _ in order_discounts]
    #     discount = self.cleaned_data.get('discount')
    #     if discount:
    #         check_discount = DiscountCode.objects.get(code=discount)
    #         if discount not in disc_cods:
    #             self._errors['discount'] = self.error_class([
    #                 'کد معتبر نیست'])
    #         elif check_discount.end <= timezone.now():
    #             self._errors['discount'] = self.error_class([
    #                 'این کد منقضی شده است'])
    #     else:
    #         pass
    #     return self.cleaned_data
