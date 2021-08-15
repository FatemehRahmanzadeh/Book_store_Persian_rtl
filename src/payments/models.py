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
    min_price_off = models.BigIntegerField('حداقل قیمت')
    code = models.CharField(verbose_name='کد تخفیف', max_length=100, blank=True, null=True)
    start = models.DateTimeField(verbose_name='زمان شروع', blank=True, null=True)
    end = models.DateTimeField(verbose_name='زمان پایان', blank=True, null=True)
    status = models.CharField(verbose_name='وضعیت', max_length=2, choices=STATUS, default='')

    class Meta:
        ordering = ['end']
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
    start = models.DateTimeField(verbose_name='زمان شروع', blank=True, null=True)
    end = models.DateTimeField(verbose_name='زمان پایان', blank=True, null=True)
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
    min_price_off = models.BigIntegerField('حداقل قیمت')
    start = models.DateTimeField(verbose_name='زمان شروع', blank=True, null=True)
    end = models.DateTimeField(verbose_name='زمان پایان', blank=True, null=True)
    status = models.CharField(verbose_name='وضعیت', max_length=2, choices=STATUS, default='')

    class Meta:
        verbose_name = 'تخفیف نقدی'
        verbose_name_plural = 'تخفیف های نقدی'


class Basket(models.Model):
    customer = models.OneToOneField(get_user_model(),
                                    verbose_name='مشتری',
                                    on_delete=models.DO_NOTHING,
                                    related_name='customer_basket')

    class Meta:
        verbose_name = 'سبد خرید مشتری'
        verbose_name_plural = 'سبدهای خرید مشتریان'


class Order(models.Model):
    STATUS = [('R', 'ثبت شده'), ('O', 'سفارش'), ('D', 'تحویل')]
    customer = models.ForeignKey(get_user_model(), verbose_name='مشتری', on_delete=models.DO_NOTHING,
                                 related_name='customer_orders')
    created_at = models.DateTimeField(verbose_name='زمان ایجاد', auto_now_add=True)
    discount = models.ForeignKey(DiscountCode, verbose_name='تخفیف',
                                 on_delete=models.DO_NOTHING,
                                 related_name='discount_orders',
                                 blank=True, null=True)
    delivery_address = models.ForeignKey('accounts.Address',
                                         verbose_name='آدرس سفارش',
                                         on_delete=models.DO_NOTHING,
                                         related_name='order_addresses')
    status = models.CharField(verbose_name='وضعیت سفارش', max_length=2, choices=STATUS, default='O')
    basket = models.ForeignKey(Basket, verbose_name='سبد خرید',
                               on_delete=models.DO_NOTHING,
                               related_name='basket_orders')

    class Meta:
        verbose_name = 'سفارش'
        verbose_name_plural = 'سفارش های مشتریان'

    def get_order_price(self):
        order_price = sum(self.order_items.get_item_price())
        if self.discount:
            if self.discount.type == 'C' and order_price >= self.discount.min_price_off:
                return order_price - self.discount.cash_off

            elif self.discount.type == 'P':
                return order_price * (100 - self.discount.percent_off) / 100

        else:
            return order_price

    def __str__(self):
        return f'سفارش مربوط به {self.customer.slug}'


class OrderItem(models.Model):
    book = models.ForeignKey('books.Book', verbose_name='کتاب', on_delete=models.DO_NOTHING, related_name='orders')
    order = models.ForeignKey(Order, verbose_name='سفارش مربوطه', on_delete=models.CASCADE,
                              related_name='order_items')
    quantity = models.IntegerField(verbose_name='تعداد', default=1)

    class Meta:
        verbose_name = 'مورد سفارش'
        verbose_name_plural = 'موارد سفارش'

    def get_item_price(self):
        book_final_price = self.book.get_final_price()
        item_price = book_final_price * self.quantity
        return item_price

    def __str__(self):
        return f'مورد مربوط به{self.order.customer.email}'
