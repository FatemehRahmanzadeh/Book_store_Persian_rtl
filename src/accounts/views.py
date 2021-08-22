from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import CreateView

from accounts.models import Address


class AddressCreateView(LoginRequiredMixin, CreateView):
    model = Address
    template_name = 'account/create-address.html'
    fields = ['customer', 'is_default', 'province', 'city', 'street', 'details', 'postcode']
