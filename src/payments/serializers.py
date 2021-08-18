from rest_framework import serializers

from payments.models import DiscountCode, PercentOff, CashOff, Basket, Order, OrderItem


class DiscountCodeSerializer(serializers.ModelSerializer):
    class Meta:
        model = DiscountCode
        fields = '__all__'


class PercentOffSerializer(serializers.ModelSerializer):
    class Meta:
        model = PercentOff
        fields = '__all__'


class CashOffSerializer(serializers.ModelSerializer):
    class Meta:
        model = CashOff
        fields = '__all__'


class BasketSerializer(serializers.ModelSerializer):
    class Meta:
        model = Basket
        fields = '__all__'


class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = '__all__'


class OrderItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderItem
        fields = '__all__'
