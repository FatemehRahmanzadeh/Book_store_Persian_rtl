from rest_framework import serializers

from payments.models import (Basket, CashOff, DiscountCode, Order, OrderItem,
                             PercentOff)


class DiscountCodeSerializer(serializers.ModelSerializer):
    """
    سریالایزر مربوط به تخفیف کد. نیاز است که فیلدهای مربوط به روابط بین مدل ها مشخص شود.
    :param: creator: یک رابطه یک به چند بین تخفیف و کاربران مدیر یا کارمند به عنوان ایجادکننده تخفیف وجود دارد
    :param: editors: یک رابطه چند به چند بین تخفیف و کاربران مدیر یا کارمند به عنوان ویرایش کننده تخفیف وجود دارد
    """
    creator = serializers.PrimaryKeyRelatedField()
    editors = serializers.PrimaryKeyRelatedField(many=True)

    class Meta:
        model = DiscountCode
        fields = '__all__'


class PercentOffSerializer(serializers.ModelSerializer):
    creator = serializers.PrimaryKeyRelatedField()
    editors = serializers.PrimaryKeyRelatedField(many=True)

    class Meta:
        model = PercentOff
        fields = '__all__'


class CashOffSerializer(serializers.ModelSerializer):
    creator = serializers.PrimaryKeyRelatedField()
    editors = serializers.PrimaryKeyRelatedField(many=True)

    class Meta:
        model = CashOff
        fields = '__all__'


class BasketSerializer(serializers.ModelSerializer):
    customer = serializers.PrimaryKeyRelatedField()

    class Meta:
        model = Basket
        fields = '__all__'


class OrderSerializer(serializers.ModelSerializer):
    discount = serializers.PrimaryKeyRelatedField()
    delivery_address = serializers.PrimaryKeyRelatedField()
    basket = serializers.PrimaryKeyRelatedField()

    class Meta:
        model = Order
        fields = '__all__'


class OrderItemSerializer(serializers.ModelSerializer):
    order = serializers.PrimaryKeyRelatedField()
    book = serializers.PrimaryKeyRelatedField()

    class Meta:
        model = OrderItem
        fields = '__all__'
