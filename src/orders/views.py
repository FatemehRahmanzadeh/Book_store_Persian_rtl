from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic import UpdateView

from orders.forms import OrderUpdateForm
from orders.models import DefaultBasket, Order, OrderItem
from session_basket.shopping_basket import Basket


class OrderRegister(LoginRequiredMixin, UpdateView):
    """
    برای نهایی کردن سفارش، اعمال تخفیف و وارد کردن آدرس تحویل سفارش
    """
    model = Order
    template_name = 'payments/orders/order-finalize.html'
    # fields = ('discount', 'delivery_address',)
    form_class = OrderUpdateForm
    success_url = reverse_lazy('home')

    def get_form_kwargs(self):
        """
        به منظور اورراید کردن کوئری ست مربوط به آدرس کاربر. فقط کاربر آدرس های خودش را ببیند.
        از آنجا که فیلد ریکوئست به صورت پیشفرض در فرم وجود ندارد باید آن را از ویو به فرم بدهیم .
        """
        kwargs = super(OrderRegister, self).get_form_kwargs()
        kwargs['user'] = self.request.user
        return kwargs

    def form_valid(self, form):
        """
        وقتی کاربر آدرس و کد تخفیفش را وارد کرد تغییرات ایجاد شده را به دیتابیس اعمال می کند.
        """
        self.order_register_confirm()
        return super(OrderRegister, self).form_valid(form)

    def order_register_confirm(self):
        """
        بعد از اینکه مشتری آدرس تحویل و کد تخفیف را وارد کرد، فیلد استاتوس را از حالت سفارش به ثبت شده تغییر می دهد.
        """
        self.object.status = 'R'
        # items = self.object.order_items.all()
        items = OrderItem.objects.filter(order__basket__customer=self.request.user)
        for item in items:
            if item.book.quantity > item.quantity:
                msg = item.book.update_quantity(item.quantity)
            if item.book.quantity == 0:
                return HttpResponse('<h1>متاسفانه کتاب موجود نیست</h1>')
            else:
                return HttpResponse('<h1>کتاب به تعداد درخواست موجود نیست.</h1>')


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
    return HttpResponseRedirect("/")


@login_required
def last_uncheck_orders(request):
    """
    نمایش سفارشات بعد از لاگین و خواندن آن ها از دیتابیس بجای سشن
    """
    unchecked = Order.objects.filter(basket__customer=request.user, status='O').last()
    if unchecked:
        items = unchecked.order_items.all()
        data = {'items': items, 'unchecked': unchecked}
    else:
        data = {'items': {}, 'unchecked': {}}
    return render(request, 'payments/orders/order_summary.html', data)

