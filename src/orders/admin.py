from django.contrib import admin

from .models import DefaultBasket, CashOff, DiscountCode, Order, OrderItem, PercentOff

admin.site.register(DiscountCode)
admin.site.register(PercentOff)
admin.site.register(CashOff)
admin.site.register(Order)
admin.site.register(DefaultBasket)
admin.site.register(OrderItem)
