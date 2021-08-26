from django.contrib.auth.models import AnonymousUser

from orders.models import DefaultBasket


def default_basket(request):
    if isinstance(request.user, AnonymousUser):
        return {'item_cnt': 0, 'default_basket': [], 'unchecked': []}

    def_basket = DefaultBasket.objects.get(customer=request.user)
    unchecked = def_basket.basket_orders.all().last()
    unchecked_items = unchecked.order_items.all()
    cnt = sum(_.quantity for _ in unchecked_items)
    return {'default_basket': def_basket, 'item_cnt': cnt, 'unchecked': unchecked}
