from django.contrib.auth import get_user_model
from django.db import models


class DiscountCode(models.Model):
    STATUS = [('E', 'منقضی شده'), ('V', 'معتبر')]
    TYPE = [('Ch', 'نقدی'), ('P', 'درصدی')]
    title = models.CharField(verbose_name='عنوان', max_length=100)
    type = models.CharField(verbose_name='نوع', max_length=2, choices=TYPE)
    creator = models.ForeignKey(get_user_model(), verbose_name='ایجادکننده', on_delete=models.DO_NOTHING,
                                related_name='disObj_registrar')
    editors = models.ManyToManyField(get_user_model(), verbose_name='ویرایشگر', related_name='disObj_editor')
    percent_off = models.IntegerField(verbose_name='مقدار درصدی', blank=True, null=True)
    cash_off = models.IntegerField(verbose_name='مقدار نقدی', blank=True, null=True)
    code = models.CharField(verbose_name='کد تخفیف', max_length=100, blank=True, null=True)
    deadline = models.DateTimeField(verbose_name='اعتبار تا', blank=True, null=True)
    status = models.CharField(verbose_name='وضعیت', max_length=2, choices=STATUS, default='')

    class Meta:
        ordering = ['deadline']
        verbose_name = 'تخفیف کددار'
        verbose_name_plural = 'تخفیف های کددار'

    def __str__(self):
        return f'{self.title} discount is valid until {self.deadline}'


class PercentOff(models.Model):
    STATUS = [('E', 'منقضی شده'), ('V', 'معتبر')]
    title = models.CharField(verbose_name='عنوان', max_length=100)
    creator = models.ForeignKey(get_user_model(), verbose_name='ایجادکننده', on_delete=models.DO_NOTHING,
                                related_name='percent_registrar')
    editors = models.ManyToManyField(get_user_model(), verbose_name='ویرایشگر', related_name='percent_editor')
    percent_off = models.IntegerField(verbose_name='مقدار درصدی', blank=True, null=True)
    deadline = models.DateTimeField(verbose_name='اعتبار تا', blank=True, null=True)
    status = models.CharField(verbose_name='وضعیت', max_length=2, choices=STATUS, default='')

    class Meta:
        verbose_name = 'تخفیف درصدی'
        verbose_name_plural = 'تخفیف های درصدی'


class CashOff(models.Model):
    STATUS = [('E', 'منقضی شده'), ('V', 'معتبر')]
    title = models.CharField(verbose_name='عنوان', max_length=100)
    creator = models.ForeignKey(get_user_model(), verbose_name='ایجادکننده', on_delete=models.DO_NOTHING,
                                related_name='cash_registrar')
    editors = models.ManyToManyField(get_user_model(), verbose_name='ویرایشگر', related_name='cash_editor')
    cash_off = models.IntegerField(verbose_name='مقدار نقدی', blank=True, null=True)
    deadline = models.DateTimeField(verbose_name='اعتبار تا', blank=True, null=True)
    status = models.CharField(verbose_name='وضعیت', max_length=2, choices=STATUS, default='')

    class Meta:
        verbose_name = 'تخفیف نقدی'
        verbose_name_plural = 'تخفیف های نقدی'


class Basket(models.Model):
    customer = models.ForeignKey(get_user_model(), verbose_name='مشتری', on_delete=models.DO_NOTHING,
                                 related_name='customer_basket')
    created_at = models.DateTimeField(verbose_name='زمان ایجاد', auto_now_add=True)
    discount = models.ForeignKey(DiscountCode, verbose_name='تخفیف',
                                 on_delete=models.DO_NOTHING,
                                 related_name='discount_baskets',
                                 blank=True, null=True)

    class Meta:
        verbose_name = 'سبدخرید'
        verbose_name_plural = 'سبدهای خرید مشتریان'

    def get_basket_price(self):
        orders_price = sum(self.basket_orders.get_order_price())
        if self.discount:
            if self.discount.type == 'C':
                return orders_price - self.discount.cash_off

            elif self.discount.type == 'P':
                return orders_price * (100 - self.discount.percent_off) / 100

        else:
            return orders_price

    def __str__(self):
        return f'basket of {self.customer.email}'


class Order(models.Model):
    STATUS = [('R', 'ثبت شده'), ('O', 'سفارش')]
    book = models.ForeignKey('books.Book', verbose_name='کتاب', on_delete=models.DO_NOTHING, related_name='orders')
    basket = models.ForeignKey(Basket, verbose_name='سبد خرید سفارش', on_delete=models.CASCADE,
                               related_name='basket_orders')
    quantity = models.IntegerField(verbose_name='تعداد', default=1)
    status = models.CharField(verbose_name='وضعیت سفارش', max_length=2, choices=STATUS, default='O')

    class Meta:
        verbose_name = 'سفارش'
        verbose_name_plural = 'سفارشات'

    def get_order_price(self):
        if self.book.percent_off:
            order_price = self.quantity * int(self.book.price * (100 - self.book.percent_off.percent_off) / 100)
        elif self.book.max_cash_off:
            order_price = self.quantity * (self.book.price - self.book.max_cash_off.cash_off)
        else:
            order_price = self.quantity * self.book.price
        return order_price

    def __str__(self):
        return f'{self.status}'
