from django import forms
from django.contrib.auth.forms import UserChangeForm, ReadOnlyPasswordHashField

from accounts.models import Address, CustomerProxy
from django.utils.translation import gettext, gettext_lazy as _


class AddressForm(forms.ModelForm):
    class Meta:
        model = Address
        fields = "__all__"
        exclude = ('customer',)


class CustomerProfileForm(UserChangeForm):
    class Meta:
        model = CustomerProxy
        fields = ['first_name', 'last_name', 'username', 'email']
        exclude = ['password']

    def __init__(self, *args, **kwargs):
        self.user = kwargs.pop('user')
        super(CustomerProfileForm, self).__init__(*args, **kwargs)
        queryset = Address.objects.filter(customer=self.user)
        self.fields['address'] = forms.ModelChoiceField(queryset=queryset,
                                                        initial=queryset.get(is_default=True),
                                                        label='آدرس')

    password = ReadOnlyPasswordHashField(
        label=_("Password"),
        help_text=_(
            'رمز عبور کاربران به صورت رمزنگاری شده ذخیره می شود و قابل رویت نیست. برای تغییر رمز خود از .'
            '<a href="http://127.0.0.1:8001/accounts/password/change/">این لینک</a> اقدام کنید.'
        ),
    )