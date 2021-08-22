# from django.contrib.auth.mixins import PermissionRequiredMixin, LoginRequiredMixin
# from rest_framework.decorators import action
# from rest_framework.response import Response
# from rest_framework.viewsets import GenericViewSet
#
# from session_basket.shopping_basket import Basket
# from orders import serializers
# from orders.models import Order, OrderItem, DefaultBasket
#
#
# class OrderViewSet(LoginRequiredMixin, GenericViewSet):
#
#     def get_queryset(self, *args, **kwargs):
#         request = self.request
#         return Order.objects.filter(basket__customer=request.user)
#
#     @action(methods=['POST'],
#             detail=False, url_name='create_order',
#             url_path='create_order',
#             serializer_class=serializers.OrderSerializer)
#     def create_order(self, request, *args, **kwargs):
#         session_basket = Basket(request)
#         default_basket = DefaultBasket.objects.get(customer=request.user)
#         data = {
#             'delivery_address': request.POST.get('address'),
#             'basket': default_basket,
#         }
#         order = serializers.OrderSerializer(data=data)
#         order.is_valid(raise_exception=True)
#         order.save()
#         for item in session_basket:
#             OrderItem.objects.create(order=order, book__id=item['book'], quantity=item['quantity'])
#
#         return Response(data={"meta": {"success": True, "code": 201, }, "result": order.data})
# **************************************************************************************************************
from django.http import JsonResponse
from rest_framework import generics, filters
from rest_framework.permissions import IsAuthenticated
from orders.models import Order, DefaultBasket, OrderItem
from orders.serializers import OrderSerializer
from session_basket.shopping_basket import Basket


class OrderListAPIView(generics.ListCreateAPIView):
    permission_classes = (IsAuthenticated,)
    serializer_class = OrderSerializer()
    filter_backends = (filters.SearchFilter,)

    def get_queryset(self, *args, **kwargs):
        request = self.request
        return Order.objects.filter(basket__customer=request.user)

    def create(self, request, *args, **kwargs):
        session_basket = Basket(request)
        if len(session_basket) > 0:
            default_basket = DefaultBasket.objects.get(customer=request.user)
            data = {
                'delivery_address': request.POST.get('address'),
                'basket': default_basket,
            }
            order = OrderSerializer(data=data)
            order.is_valid(raise_exception=True)
            order.save()
            for item in session_basket:
                OrderItem.objects.create(order=order, book__id=item['book'], quantity=item['quantity'])
            msg = 'سبد خرید ذخیره شد'
            response = JsonResponse({'msg': msg, 'ser': order})
        else:
            msg = 'سبد خرید شما خالی است.'

            response = JsonResponse({'msg': msg})
        return response

