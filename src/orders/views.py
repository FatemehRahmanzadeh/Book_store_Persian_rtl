from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import TemplateView


class OrderForm(LoginRequiredMixin, TemplateView):
    template_name = 'payments/orders/order-finalize.html'
