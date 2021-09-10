from django import forms
from django.utils.translation import gettext_lazy as _
from jalali_date.fields import JalaliDateTimeField

from accounts.models import Address
from books.models import Book
from orders.models import Order, DiscountCode, PercentOff, CashOff
from bootstrap_datepicker_plus import DateTimePickerInput
from jalali_date.widgets import AdminSplitJalaliDateTime
from jalali_date.fields import SplitJalaliDateTimeField


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
    delivery_address = AddressChoice(queryset=Address.objects.all(),
                                     required=True, initial=default_address,
                                     widget=forms.Select
                                     (attrs={'id': "addr_id"}))

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


class DiscountCodeForm(forms.ModelForm):
    class Meta:
        model = DiscountCode
        fields = '__all__'
        exclude = ['last_edited_by', 'creator']

    def __init__(self, *args, **kwargs):
        """
        override datetime fields to use jalali datetime and jalali datetime picker
        """
        super(DiscountCodeForm, self).__init__(*args, **kwargs)
        self.fields['start'] = SplitJalaliDateTimeField(label='زمان شروع', widget=AdminSplitJalaliDateTime)
        self.fields['end'] = SplitJalaliDateTimeField(label='زمان پایان', widget=AdminSplitJalaliDateTime)


class PercentOffForm(forms.ModelForm):
    class Meta:
        model = PercentOff
        fields = '__all__'
        exclude = ['last_edited_by', 'creator']

    def __init__(self, *args, **kwargs):
        super(PercentOffForm, self).__init__(*args, **kwargs)
        queryset = Book.objects.all()
        self.fields['discount_books'] = forms.ModelMultipleChoiceField(queryset=queryset, label='کتاب های شامل تخفیف')
        self.fields['start'] = SplitJalaliDateTimeField(label='زمان شروع', widget=AdminSplitJalaliDateTime)
        self.fields['end'] = SplitJalaliDateTimeField(label='زمان پایان', widget=AdminSplitJalaliDateTime)

    def save(self, *args, **kwargs):
        """
        برای اعمال تخفیف به کتاب های انتخاب شده در فرم لازم است این متد اوراید شود. چون به صورت پیشفرض فیلدی برای کوئری معکوس در مدل-فرم وجود ندارد
        """
        self.instance.save()
        for book in self.cleaned_data.get('discount_books'):
            print(book)
            book.update_discount(self.instance)
            print(book.get_final_price())
        return super(PercentOffForm, self).save(*args, **kwargs)


class CashOffForm(forms.ModelForm):
    class Meta:
        model = CashOff
        fields = '__all__'
        exclude = ['last_edited_by', 'creator']
        widgets = {
            'start': DateTimePickerInput(),
            'end': DateTimePickerInput(),
        }

    def __init__(self, *args, **kwargs):
        super(CashOffForm, self).__init__(*args, **kwargs)
        queryset = Book.objects.all()
        self.fields['discount_books'] = forms.ModelMultipleChoiceField(queryset=queryset, label='کتاب های شامل تخفیف')
        self.fields['start'] = SplitJalaliDateTimeField(label='زمان شروع', widget=AdminSplitJalaliDateTime)
        self.fields['end'] = SplitJalaliDateTimeField(label='زمان پایان', widget=AdminSplitJalaliDateTime)

    def save(self, *args, **kwargs):
        self.instance.save()
        for book in self.cleaned_data.get('discount_books'):
            print(book)
            book.update_discount(self.instance)
            print(book.get_final_price())
        return super(CashOffForm, self).save(*args, **kwargs)
