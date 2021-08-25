from django import forms
from django.utils import timezone
from django.utils.translation import gettext_lazy as _

from accounts.models import Address
from orders.models import Order, DiscountCode


class AddressChoice(forms.ModelChoiceField):
    default_error_messages = {
        'invalid_choice': _('لطفاٌ گزینه مناسب را برای آدرس خود انتخاب کنید'),
    }
    model = Address
    unique_fields = {id}


class OrderUpdateForm(forms.ModelForm):
    """
    فرم ثبت سفارش مشتری.
    """
    default_address = Address.objects.filter(is_default=True)
    delivery_address = AddressChoice(queryset=Address.objects.all(), required=True, initial=default_address)
    discount = forms.ModelChoiceField(queryset=DiscountCode.objects.filter(end__gte=timezone.now()), widget=forms.Select, required=False)

    class Meta:
        model = Order
        fields = ['delivery_address', 'discount']

    def __init__(self, *args, **kwargs):
        self.user = kwargs.pop('user')
        super(OrderUpdateForm, self).__init__(*args, **kwargs)
        self.fields['delivery_address'].queryset = Address.objects.filter(customer=self.user)

    # def clean(self):
    #     """
    #     بررسی کد تخفیف از نظر اعتبار و صحیح بودن کد
    #     """
    #     super(OrderUpdateForm, self).clean()
    #     order_discounts = DiscountCode.objects.all()
    #     disc_cods = [_.code for _ in order_discounts]
    #     discount = self.cleaned_data.get('discount')
    #     if discount:
    #         # check_discount = DiscountCode.objects.get(id=discount.id)
    #         if discount not in disc_cods:
    #             self._errors['discount'] = self.error_class([
    #                 'کد معتبر نیست'])
    #         elif discount.end <= timezone.now():
    #             self._errors['discount'] = self.error_class([
    #                 'این کد منقضی شده است'])
    #     else:
    #         pass
    #     return self.cleaned_data
