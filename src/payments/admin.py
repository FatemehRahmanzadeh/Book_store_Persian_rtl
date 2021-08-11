from django.contrib import admin
from .models import PercentOff, CashOff, DiscountCode, Order, Basket

admin.site.register(DiscountCode)
admin.site.register(PercentOff)
admin.site.register(CashOff)
admin.site.register(Order)
admin.site.register(Basket)
