from django.contrib.auth.signals import user_logged_in
from django.dispatch import receiver
from orders.models import DefaultBasket


@receiver(user_logged_in)
def log_user_login(sender, user, request, **kwargs):
    if DefaultBasket.objects.filter(customer=user).exists():
        pass
    else:
        DefaultBasket.objects.create(customer=user)


