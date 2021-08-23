from django.contrib.auth.signals import user_logged_in, user_logged_out, user_login_failed
from django.dispatch import receiver
from orders.models import DefaultBasket, Order
from session_basket.shopping_basket import Basket


@receiver(user_logged_in)
def log_user_login(sender, user, request, **kwargs):
    if DefaultBasket.objects.filter(customer=user).exists():
        pass
    else:
        DefaultBasket.objects.create(customer=user)
        return 'session_basket created'


