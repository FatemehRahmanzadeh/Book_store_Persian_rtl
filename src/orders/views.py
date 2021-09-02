from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.http import HttpResponseRedirect, JsonResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic import UpdateView, DetailView, DeleteView, TemplateView

from orders.forms import OrderUpdateForm
from orders.models import DefaultBasket, Order, OrderItem, DiscountCode
from session_basket.shopping_basket import Basket


class OrderDetail(LoginRequiredMixin, UserPassesTestMixin, DetailView):
    """
        برای نمایش جزییات هر سفارش مشتری
    """
    model = Order
    template_name = 'payments/orders/order_summary.html'
    context_object_name = 'last_unchecked'

    def get_context_data(self, **kwargs):
        context = super(OrderDetail, self).get_context_data()
        context['items'] = self.object.order_items.all()
        return context

    def test_func(self):
        """
        برای اینکه هر مشتری فقط سفارشات مربوط به خودش را ببیند
        """
        obj = self.get_object()
        return obj.basket.customer == self.request.user


class OrderDelete(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    """
        حذف سفارش مشتری
    """
    model = Order
    template_name = 'payments/orders/order_delete.html'

    def get_context_data(self, **kwargs):
        context = super(OrderDelete, self).get_context_data()
        context['items'] = self.object.order_items.all()
        return context

    def test_func(self):
        """
        برای اینکه هر مشتری فقط سفارشات مربوط به خودش را حذف کند نه دیگری را
        """
        obj = self.get_object()
        return obj.basket.customer == self.request.user

    def get_success_url(self):
        return reverse_lazy('all-basket-orders', args=[str(self.object.basket.pk)])


class CustomerOrderHistory(LoginRequiredMixin, UserPassesTestMixin, DetailView):
    """
    کلاس ویو برای نشان دادن تمام سفارشات مشتری
    """
    model = DefaultBasket
    template_name = 'payments/orders/all_customer_orders.html'

    def test_func(self):
        """
        برای اینکه هر مشتری فقط سفارشات مربوط به خودش را ببیند
        """
        obj = self.get_object()
        return obj.customer == self.request.user

    def get_context_data(self, **kwargs):
        context = super(CustomerOrderHistory, self).get_context_data()
        context['registered'] = self.object.get_registered_orders()
        context['ordered'] = self.object.get_ordered_orders()
        return context


class OrderRegister(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    """
    برای نهایی کردن سفارش، اعمال تخفیف و وارد کردن آدرس تحویل سفارش
    """
    model = Order
    template_name = 'payments/orders/order-finalize.html'
    form_class = OrderUpdateForm
    success_url = reverse_lazy('home')

    def test_func(self):
        """
        برای اینکه هر مشتری فقط سفارشات مربوط به خودش را ثبت کند
        """
        obj = self.get_object()
        return obj.basket.customer == self.request.user

    def get_form_kwargs(self):
        """
        به منظور اورراید کردن کوئری ست مربوط به آدرس کاربر. فقط کاربر آدرس های خودش را ببیند.
        از آنجا که فیلد ریکوئست به صورت پیشفرض در فرم وجود ندارد باید آن را از ویو به فرم بدهیم .
        """
        kwargs = super(OrderRegister, self).get_form_kwargs()
        kwargs['user'] = self.request.user
        kwargs['items'] = self.object.order_items.all()
        return kwargs

    def form_valid(self, form):
        """
        وقتی کاربر آدرس و کد تخفیفش را وارد کرد تغییرات ایجاد شده را به دیتابیس اعمال می کند.
        """

        self.order_register_confirm()
        return super(OrderRegister, self).form_valid(form)

    def form_invalid(self, form):

        if self.request.is_ajax():
            if self.request.POST.get('action') == 'post':
                disc_code = self.request.POST.get('disc_code')
                order = self.object
                print('order price view before', order.get_order_price())
                if disc_code:
                    try:
                        discount = DiscountCode.objects.get(code=disc_code)
                        valid_status = discount.add_order(order, self.request.user)
                    except DiscountCode.DoesNotExist:
                        valid_status = 5
                else:
                    valid_status = 4
                msg = {0: 'شما قبلا از این تخفیف استفاده کرده اید',
                       1: 'تخفیف اعمال شد',
                       2: 'مبلغ سفارش شامل تخفیف نمی باشد',
                       3: 'تخفیف منقضی شده است',
                       4: 'هیچ کد تحفیفی وارد نشده است',
                       5: 'کد تخفیف اشتباه است!'}
                print('order price view after', order.get_order_price())
                return JsonResponse({'total': order.get_order_price(), 'msg': msg[valid_status]})
        return super().form_invalid(form)

    def order_register_confirm(self):
        """
        بعد از اینکه مشتری آدرس تحویل و کد تخفیف را وارد کرد، فیلد استاتوس را از حالت سفارش به ثبت شده تغییر می دهد.
        """
        self.object.status = 'R'
        items = self.object.order_items.all()
        for item in items:
            item.book.update_quantity(item.quantity)


class RegisteredList(LoginRequiredMixin, UserPassesTestMixin, TemplateView):
    """
    نمایش همه سفارشهای ثبت شده مشتریان برای کارمند
    """
    template_name = 'payments/orders/all_orders.html'

    def test_func(self):
        return self.request.user.is_staff


class UnRegisteredList(LoginRequiredMixin, UserPassesTestMixin, TemplateView):
    """
    نمایش همه سفارشهای ثبت نشده مشتریان برای کارمند
    """
    template_name = 'payments/orders/all_not_reg_orders.html'

    def test_func(self):
        return self.request.user.is_staff


@login_required
def create(request, *args, **kwargs):
    """
    ایجاد آبجکت از اوردر و اوردر آیتم با خواندن آن ها از سشن و وارد کردن آن ها به دیتا بیس
    """
    basket_session = Basket(request)
    if len(basket_session) > 0:
        default_basket = DefaultBasket.objects.get(customer=request.user)
        try:
            current_order = default_basket.basket_orders.filter(status='O').last()
            current_items = current_order.order_items.all()
        except Order.DoesNotExist:
            current_order = Order.objects.create(basket=default_basket)
            current_items = []
        for item in basket_session:
            if current_items and item['book'] in [_.book for _ in current_items.all()]:
                item_save = current_items.get(book=item['book'])
                item_save.quantity += item['quantity']
                item_save.save()
            else:
                OrderItem.objects.create(order=current_order, book=item['book'], quantity=item['quantity'])
    return HttpResponseRedirect("/")


@login_required
def last_uncheck_orders(request):
    """
    نمایش سفارشات بعد از لاگین و خواندن آن ها از دیتابیس بجای سشن
    """
    last_unchecked = Order.objects.filter(basket__customer=request.user, status='O').last()
    if last_unchecked:
        items = last_unchecked.order_items.all()
        data = {'items': items, 'last_unchecked': last_unchecked}
    else:
        data = {'items': {}, 'last_unchecked': {}}
    return render(request, 'payments/orders/order_summary.html', data)

# @login_required
# def order_discount_check(request):
#     """
#     برای چک کردن اینکه تخفیف معتبر است یا خیر و اعمال تخفیف به سبد خرید
#     """
#     if request.POST.get('action') == 'post':
#         disc_code = request.POST.get('disc_code')
#         order_id = int(request.POST.get('order_id'))
#         order = Order.objects.get(id=order_id)
#         print('order:', order)
#         print('order id:', order_id)
#         valid = order.valid_discount(disc_code)
#         if valid:
#             msg = 'تخفیف اعمال شد'
#         else:
#             msg = 'تخفیف معتبر نیست'
#         return JsonResponse({'total': order.get_order_price(), 'msg': msg})
