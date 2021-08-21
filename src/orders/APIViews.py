from rest_framework.generics import ListCreateAPIView

from payments.models import Order
from payments.serializers import OrderSerializer


class OrderListAPIView(ListCreateAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
