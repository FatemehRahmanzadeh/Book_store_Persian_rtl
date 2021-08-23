from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.shortcuts import redirect
from django.urls import reverse_lazy, reverse
from django.views.generic import UpdateView

import session_basket.views
from books.models import Book
from orders.models import DefaultBasket, Order, OrderItem
from session_basket.shopping_basket import Basket


class OrderUpdate(LoginRequiredMixin, UpdateView):
    """
    برای نهایی کردن سفارش، اعمال تخفیف و وارد کردن آدرس تحویل سفارش
    """
    model = Order
    template_name = 'payments/orders/order-finalize.html'
    fields = ['discount', 'delivery_address']

    def get_form_class(self, form_class=None):
        """
        فیلتر کردن اطلاعات آدرس بر اساس کاربر که هر کاربر تنها آدرس های مربوط به خود را ببیند
        """

        form = super(OrderUpdate, self).get_form(form_class)
        form.fields["delivery_address"].queryset = self.request.user.user_addresses.all()
        return form


@login_required
def create(request, *args, **kwargs):
    basket_session = Basket(request)
    if len(basket_session) > 0:
        default_basket = DefaultBasket.objects.get(customer=request.user)
        order = Order.objects.create(basket=default_basket)
        for item in basket_session:
            OrderItem.objects.create(order=order, book=item['book'], quantity=item['quantity'])
        msg = 'سبد خرید ذخیره شد'
    else:
        msg = 'سبد خرید شما خالی است.'

    # response = JsonResponse({'msg': msg})
    return msg

