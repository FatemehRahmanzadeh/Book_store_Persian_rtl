from django.contrib.auth import get_user_model
from rest_framework import serializers

from accounts.models import Address
from books.models import Book
from orders.models import (DefaultBasket, CashOff, DiscountCode, Order, OrderItem,
                           PercentOff)


class DiscountCodeSerializer(serializers.ModelSerializer):
    """
    سریالایزر مربوط به تخفیف کد. نیاز است که فیلدهای مربوط به روابط بین مدل ها مشخص شود.
    :param: creator: یک رابطه یک به چند بین تخفیف و کاربران مدیر یا کارمند به عنوان ایجادکننده تخفیف وجود دارد
    :param: editors: یک رابطه چند به چند بین تخفیف و کاربران مدیر یا کارمند به عنوان ویرایش کننده تخفیف وجود دارد
    """

    creator = serializers.PrimaryKeyRelatedField(queryset=get_user_model().objects.all())
    editors = serializers.PrimaryKeyRelatedField(queryset=get_user_model().objects.all(), many=True)

    class Meta:
        model = DiscountCode
        fields = '__all__'


class PercentOffSerializer(serializers.ModelSerializer):
    creator = serializers.PrimaryKeyRelatedField(queryset=get_user_model().objects.all())
    editors = serializers.PrimaryKeyRelatedField(queryset=get_user_model().objects.all(), many=True)

    class Meta:
        model = PercentOff
        fields = '__all__'


class CashOffSerializer(serializers.ModelSerializer):
    creator = serializers.PrimaryKeyRelatedField(queryset=get_user_model().objects.all())
    editors = serializers.PrimaryKeyRelatedField(queryset=get_user_model().objects.all(), many=True)

    class Meta:
        model = CashOff
        fields = '__all__'


class BasketSerializer(serializers.ModelSerializer):
    customer = serializers.PrimaryKeyRelatedField(queryset=get_user_model().objects.all())

    class Meta:
        model = DefaultBasket
        fields = '__all__'


class OrderSerializer(serializers.ModelSerializer):
    discount = serializers.PrimaryKeyRelatedField(queryset=DiscountCode.objects.all())
    delivery_address = serializers.PrimaryKeyRelatedField(queryset=Address.objects.all())
    basket = serializers.PrimaryKeyRelatedField(queryset=DefaultBasket.objects.all())

    class Meta:
        model = Order
        fields = '__all__'


class OrderItemSerializer(serializers.ModelSerializer):
    order = serializers.PrimaryKeyRelatedField(queryset=Order.objects.all())
    book = serializers.PrimaryKeyRelatedField(queryset=Book.objects.all())

    class Meta:
        model = OrderItem
        fields = '__all__'
