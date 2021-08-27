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
        self.items = kwargs.pop('items')
        super(OrderUpdateForm, self).__init__(*args, **kwargs)
        self.fields['delivery_address'].queryset = Address.objects.filter(customer=self.user)

    def clean(self, *args, **kwargs):
        """
        افزودن ارور نداشتن موجودی کتاب
        """
        cleaned_data = super(OrderUpdateForm, self).clean()
        for item in self.items:
            if not item.check_item_quantity():
                raise forms.ValidationError(
                    " موجود نیست{}متاسفانه لطفاٌ خرید خود را اصلاح کنید.".format(item.book.title)
                )
        return cleaned_data



