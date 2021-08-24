from django.contrib.auth.models import AnonymousUser

from orders.models import DefaultBasket, OrderItem


def default_basket(request):
    if isinstance(request.user, AnonymousUser):
        return {'item_cnt': 0, 'default_basket': [], 'unchecked': []}

    def_basket = DefaultBasket.objects.get(customer=request.user).basket_orders,
    unchecked = DefaultBasket.objects.filter(customer=request.user, basket_orders__status='O')
    all_unchecked_items = OrderItem.objects.filter(order__status='O', order__basket__customer=request.user)
    cnt = all_unchecked_items.count()
    return {'default_basket': def_basket, 'item_cnt': cnt, 'unchecked': unchecked}
