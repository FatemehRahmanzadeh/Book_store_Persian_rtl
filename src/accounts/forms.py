from django import forms

from accounts.models import Address


class AddressForm(forms.ModelForm):
    class Meta:
        model = Address
        fields = "__all__"
        exclude = ('customer',)