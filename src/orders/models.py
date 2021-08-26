from django.contrib.auth import get_user_model
from django.db import models
from django.utils import timezone


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
        return f'{self.title} تا  {self.end} فعال است'

    def discount_is_valid(self):
        """
        بررسی تخفیف از نظر اوضعیت اعتبار و زمان انقضا
        """
        if self.status == 'E' or self.end <= timezone.now():
            return False

        else:
            return True

    def add_order(self, order, user):
        """
        اعمال تخفیف به سفارش.
        :return: اگز تخفیف مجاز بود سفارش به لیست سفارشات این تخفیف اضافه می شود و 1 برمیگرداند.
        اگر تخفیف از نظر زمان و یا فعال بودن معتبر نبود 3 برمیگرداند
        اگر مبلغ سفارش از حداقل مبلغ شامل تخفیف کمتر بود 2 بر می گرداند
        """
        if self.discount_is_valid():
            if order.get_order_price() >= self.min_price_off:
                user_orders = user.customer_basket.basket_orders.all().filter(discount__isnull=False)
                user_discs = [_.discount.id for _ in user_orders]
                if self.id in user_discs:
                    return 0
                self.discount_orders.add(order)
                self.save()
                return 1
            else:
                return 2
        else:
            return 3


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


class DefaultBasket(models.Model):
    """
    این سبد خرید مشتری بعد از لاگین است که رفتارهای مشتری در سایت را مدیریت میکند. مثل افزودن و حذف کالا از سفارش،
    """
    customer = models.OneToOneField(get_user_model(),
                                    verbose_name='مشتری',
                                    on_delete=models.DO_NOTHING,
                                    related_name='customer_basket')

    class Meta:
        verbose_name = 'سبد خرید مشتری'
        verbose_name_plural = 'سبدهای خرید مشتریان'

    def __str__(self):
        return f'{self.customer.slug}'

    def add(self, book, qty):
        book_id = book.id
        current_order = self.basket_orders.filter(status='O').last()
        if current_order:
            items = current_order.order_items.all()
            print(items)

            if book_id in [b.book.id for b in items]:
                item = items.get(book__id=book_id)
                item.quantity = qty
                item.save()
            else:
                OrderItem.objects.create(order=current_order, book=book, quantity=qty)
            print('current', current_order)
            return current_order
        else:
            new_order = Order.objects.create(basket=self)
            OrderItem.objects.create(order=new_order, book=book, quantity=qty)
            print('new', new_order)
            return new_order

    def update(self, item, qty):
        """
        اعمال تغییر در تعداد آیتم انتخابی با زدن دکمه بروزرسانی در سبد خرید.
        """
        current_order = self.basket_orders.filter(status='O').last()
        item = current_order.order_items.all().get(id=item)
        item.quantity = qty
        item.save()
        return current_order

    def delete_item(self, item_id):
        """
        حذف آیتم انتخابی از سبد خرید و سفارش
        """
        current_order = self.basket_orders.get(order_items__id=item_id)
        item = current_order.order_items.all().get(id=item_id)
        if item:
            item.delete()
        return current_order


class Order(models.Model):
    STATUS = [('R', 'ثبت شده'), ('O', 'سفارش'), ('D', 'تحویل')]

    created_at = models.DateTimeField(verbose_name='زمان ایجاد', auto_now_add=True)
    discount = models.ForeignKey(DiscountCode, verbose_name='تخفیف',
                                 on_delete=models.DO_NOTHING,
                                 related_name='discount_orders',
                                 blank=True, null=True)
    delivery_address = models.ForeignKey('accounts.Address',
                                         verbose_name='آدرس سفارش',
                                         on_delete=models.DO_NOTHING,
                                         related_name='order_addresses', blank=True, null=True)
    status = models.CharField(verbose_name='وضعیت سفارش', max_length=2, choices=STATUS, default='O')
    basket = models.ForeignKey(DefaultBasket, verbose_name='سبد خرید',
                               on_delete=models.DO_NOTHING,
                               related_name='basket_orders')

    class Meta:
        verbose_name = 'سفارش'
        verbose_name_plural = 'سفارش های مشتریان'

    def get_absolute_url(self):
        return "/orders/%i/" % self.pk

    def get_order_price(self):
        order_price = sum(_.get_item_price() for _ in self.order_items.all())
        if self.discount:
            if self.discount.type == 'Ch' and order_price >= self.discount.min_price_off:
                order_price -= self.discount.cash_off

            elif self.discount.type == 'P':
                order_price *= (100 - self.discount.percent_off) / 100

        return order_price

    def __str__(self):
        return f'سفارش مربوط به {self.basket.customer.slug}'


class OrderItem(models.Model):
    """
    مدل مربوط به اقلام سفارش مشتری. هر مورد دارای یک کتاب و تعداد آن است. به عبارتی اگر سفارش را یک جدول فرض کنیم
    ، آبجکت های این کلاس سطرهای آن جدول را تشکیل می دهند.
    """
    book = models.ForeignKey('books.Book', verbose_name='کتاب', on_delete=models.DO_NOTHING, related_name='orders')
    order = models.ForeignKey(Order, verbose_name='سفارش مربوطه', on_delete=models.CASCADE,
                              related_name='order_items')
    quantity = models.IntegerField(verbose_name='تعداد', default=1)

    class Meta:
        verbose_name = 'مورد سفارش'
        verbose_name_plural = 'موارد سفارش'

    def get_item_price(self):
        """
        محاسبه قیمت هر مورد با توجه به تعداد درخواستی مشتری
        """
        book_final_price = self.book.get_final_price()
        item_price = book_final_price * self.quantity
        return item_price

    def __str__(self):
        return f'مورد مربوط به{self.order.basket.customer}'

    def check_item_quantity(self):
        """
        بررسی می کند که آیا تعداد کتاب ها موجو است یا خیر
        """
        if self.quantity <= self.book.quantity:
            return True
        else:
            return False