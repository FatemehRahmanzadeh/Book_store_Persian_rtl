from django.contrib.auth.models import AnonymousUser
from django.utils import timezone

from orders.models import DefaultBasket, Order


def default_basket(request):
    if isinstance(request.user, AnonymousUser):
        return {'item_cnt': 0, 'default_basket': [], 'unchecked': [], 'all_orders': []}

    def_basket = DefaultBasket.objects.get(customer=request.user)
    all_orders = def_basket.basket_orders.all()
    unchecked = def_basket.basket_orders.filter(status='O').last()
    if unchecked:
        unchecked_items = unchecked.order_items.all()
        cnt = sum(_.quantity for _ in unchecked_items)
        return {'default_basket': def_basket, 'item_cnt': cnt, 'unchecked': unchecked, 'all_orders': all_orders}
    else:
        return {'item_cnt': 0, 'default_basket': def_basket, 'unchecked': [], 'all_orders': all_orders}


def all_orders(request):
    registered = Order.objects.filter(status='R')
    ordered = Order.objects.filter(status='O')
    new_orders = Order.objects.filter(created_at__day=timezone.now().day)
    return {'all_registered': registered, 'all_ordered':ordered, 'all_new_orders':new_orders}
