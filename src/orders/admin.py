from django.contrib import admin, messages
from django.utils import timezone
from django.utils.html import format_html
from django.utils.translation.trans_null import ngettext

from .forms import DiscountCodeForm
from .models import DefaultBasket, CashOff, DiscountCode, Order, OrderItem, PercentOff


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    fields = ['discount', 'delivery_address', 'status', 'basket']
    actions = ['set_status_delivered']
    readonly_fields = ['created_at', 'get_order_price']
    list_display = ['basket', 'status', 'get_order_price', 'created_at']
    list_editable = ['status']

    @admin.action(description='سفارش های انتخابی تحویل شده است')
    def set_status_delivered(self, request, queryset):
        updated = queryset.update(status='D')
        self.message_user(request, ngettext(
            '%d سفارش با موفقیت بروز شد.',
            '%d سفارشات با موفقیت بروز شدند.',
            updated,
        ) % updated, messages.SUCCESS)


@admin.register(OrderItem)
class OrderItemAdmin(admin.ModelAdmin):
    fields = ['book', 'order', 'quantity']
    list_display = ['book', 'quantity', 'get_item_price']
    list_editable = ['quantity']


@admin.register(DiscountCode)
class DiscountCodeAdmin(admin.ModelAdmin):
    fields = ['title', 'type', 'percent_off', 'cash_off', 'min_price_off', 'code', 'start', 'end', 'status']
    readonly_fields = ['creator', 'last_edited_by']
    actions = ['postpone']
    list_display = ['title', 'code', 'type', 'start', 'end', 'status']
    list_editable = ['status', 'code']

    @admin.action(description='تخفیف های انتخابی رایک هفته تمدید کن')
    def postpone(self, request, queryset):
        updated = queryset.update(end=timezone.now() + timezone.timedelta(weeks=1))
        self.message_user(request, ngettext(
            '%d تخفیف تا هفته آینده تمدید شد.',
            '%d تخفیف ها تا هفته آینده تمدید شدند.',
            updated,
        ) % updated, messages.SUCCESS)

    date_hierarchy = 'end'

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name in ['creator', 'last_edited_by']:
            # انتخاب کاربر درخواست دهنده به عنوان ایجادککنده یا ویرایشگر کتاب
            kwargs['initial'] = request.user.id
            # تغییر فیلد به فقط خواندنی
            kwargs['disabled'] = True


@admin.register(PercentOff)
class PercentOffAdmin(admin.ModelAdmin):
    fields = ['title', 'percent_off', 'start', 'end', 'status']
    readonly_fields = ['creator', 'percent_off', 'last_edited_by']
    actions = ['postpone']
    list_display = ['title', 'start', 'end', 'status']
    list_editable = ['status']

    @admin.action(description='تخفیف های انتخابی رایک هفته تمدید کن')
    def postpone(self, request, queryset):
        updated = queryset.update(end=timezone.now() + timezone.timedelta(weeks=1))
        self.message_user(request, ngettext(
            '%d تخفیف تا هفته آینده تمدید شد.',
            '%d تخفیف ها تا هفته آینده تمدید شدند.',
            updated,
        ) % updated, messages.SUCCESS)

    date_hierarchy = 'end'


admin.site.register(CashOff)
admin.site.register(DefaultBasket)
