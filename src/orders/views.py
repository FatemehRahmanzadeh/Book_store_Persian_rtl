from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic import UpdateView

from accounts.models import Address
from books.models import Book
from orders.forms import OrderUpdateForm
from orders.models import DefaultBasket, Order, OrderItem, DiscountCode
from session_basket.shopping_basket import Basket


class OrderUpdate(LoginRequiredMixin, UpdateView):
    """
    برای نهایی کردن سفارش، اعمال تخفیف و وارد کردن آدرس تحویل سفارش
    """
    model = Order
    template_name = 'payments/orders/order-finalize.html'
    # fields = ('discount', 'delivery_address',)
    form_class = OrderUpdateForm
    success_url = reverse_lazy('home')

    def form_valid(self, form):
        self.order_register_confirm()
        return super(OrderUpdate, self).form_valid(form)

    def order_register_confirm(self):
        """
        بعد از اینکه مشتری آدرس تحویل و کد تخفیف را وارد کرد، فیلد استاتوس را از حالت سفارش به ثبت شده تغییر می دهد.
        """
        order = self.object.status = 'R'
        items = OrderItem.objects.filter(order__basket__customer=self.request.user)
        for item in items:
            if item.book.quantity > item.quantity:
                item.book.quantity = item.book.quantity - item.quantity
                item.book.save()
            else:
                return 'کتاب به تعداد درخواست موجود نیست.'


@login_required
def create(request, *args, **kwargs):
    """
    ایجاد آبجکت از اوردر و اوردر آیتم با خواندن آن ها از سشن و وارد کردن آن ها به دیتا بیس
    """
    basket_session = Basket(request)
    if len(basket_session) > 0:
        default_basket = DefaultBasket.objects.get(customer=request.user)
        order = Order.objects.create(basket=default_basket)
        for item in basket_session:
            OrderItem.objects.create(order=order, book=item['book'], quantity=item['quantity'])
    return JsonResponse({'msg': 'ok'})


@login_required
def last_uncheck_orders(request):
    """
    نمایش سفارشات بعد از لاگین و خواندن آن ها از دیتابیس بجای سشن
    """
    unchecked = Order.objects.filter(status='O').last()
    items = unchecked.order_items.all()
    return render(request, 'payments/orders/order_summary.html', {'items': items, 'unchecked': unchecked})
