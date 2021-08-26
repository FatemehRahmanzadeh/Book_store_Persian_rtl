from django import forms
from django.utils.translation import gettext_lazy as _
from accounts.models import Address
from orders.models import Order


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

    class Meta:
        model = Order
        fields = ['delivery_address']

    def __init__(self, *args, **kwargs):
        self.user = kwargs.pop('user')
        super(OrderUpdateForm, self).__init__(*args, **kwargs)
        self.fields['delivery_address'].queryset = Address.objects.filter(customer=self.user)
