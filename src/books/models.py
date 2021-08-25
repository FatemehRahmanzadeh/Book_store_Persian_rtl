from django.contrib.auth import get_user_model
from django.db import models

from books.managers import BookManager


class Category(models.Model):
    name = models.CharField(verbose_name='نام دسته', max_length=100)
    creator = models.ForeignKey(get_user_model(),
                                verbose_name='ایجادکننده',
                                on_delete=models.DO_NOTHING,
                                related_name='catObj_registrar')

    last_edit_by = models.ForeignKey(get_user_model(),
                                     verbose_name='آخرین ویرایش توسط',
                                     on_delete=models.DO_NOTHING,
                                     related_name='catObj_editor',
                                     blank=True, null=True)

    created_at = models.DateTimeField(verbose_name='زمان ایجاد', auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name='زمان بروزرسانی', auto_now=True)
    slug = models.SlugField(max_length=60)

    class Meta:
        verbose_name = 'دسته بندی'
        verbose_name_plural = 'دسته بندی ها'

    def __str__(self):
        return f'{self.name}'

    def save(self, *args, **kwargs):
        book_slug = f'{self.name}'
        self.slug = book_slug
        return super().save(*args, **kwargs)

    def get_absolute_url(self):
        return "/categories/%s/" % self.slug


class Book(models.Model):
    ACTIVE = [('A', 'فعال'), ('D', 'غیرفعال')]
    title = models.CharField(verbose_name='عنوان', max_length=150)
    categories = models.ManyToManyField(Category, verbose_name='دسته ها', related_name='book_categories')
    created_at = models.DateTimeField(verbose_name='زمان ایجاد', auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name='زمان بروزرسانی', auto_now=True)
    creator = models.ForeignKey(get_user_model(),
                                verbose_name='ایجادکننده',
                                on_delete=models.DO_NOTHING,
                                related_name='bookObj_registrar')

    last_edit_by = models.ForeignKey(get_user_model(),
                                     verbose_name='آخرین ویرایش توسط',
                                     on_delete=models.DO_NOTHING,
                                     related_name='bookObj_editor', blank=True, null=True)

    authors = models.CharField(verbose_name='نویسنده', max_length=200)
    description = models.TextField(verbose_name='درباره کتاب', max_length=700, blank=True, null=True)
    quantity = models.IntegerField(verbose_name='تعداد')
    price = models.BigIntegerField(verbose_name='قیمت')
    image = models.ImageField(verbose_name='عکس', upload_to='./images/books', blank=True, default='../static/images/image.png')
    percent_off = models.ForeignKey('orders.PercentOff',
                                    verbose_name='درصد تخفیف',
                                    on_delete=models.DO_NOTHING,
                                    related_name='percent_disc',
                                    blank=True, null=True)

    max_cash_off = models.ForeignKey('orders.CashOff',
                                     verbose_name='تخفیف نقدی',
                                     on_delete=models.DO_NOTHING,
                                     related_name='cash_disc',
                                     blank=True, null=True)
    is_active = models.CharField(verbose_name='در دسترس', max_length=1, choices=ACTIVE, default='A')
    slug = models.SlugField(max_length=100, null=True, blank=True)

    objects = models.Manager()
    actives = BookManager()

    class Meta:
        ordering = ['title']
        constraints = [
            models.UniqueConstraint(fields=['title', 'authors'], name='unique_book')
        ]
        verbose_name = 'کتاب'
        verbose_name_plural = 'کتاب ها'

    def __str__(self):
        return f'{self.title} - {self.id}'

    def save(self, *args, **kwargs):
        book_slug = f'{self.title}by {self.authors}'
        self.slug = book_slug
        return super().save(*args, **kwargs)

    def get_final_price(self):
        if self.percent_off:
            final_price = int(self.price * (100 - self.percent_off.percent_off) / 100)
        elif self.max_cash_off and self.price >= self.max_cash_off.min_price_off:
            final_price = self.price - self.max_cash_off.cash_off
        else:
            final_price = self.price
        return final_price

    def get_absolute_url(self):
        return "/books/%s/" % self.slug

    def update_quantity(self, number):
        if number < self.quantity:
            return self.quantity - number
        else:
            return 'موجودی کافی نیست'
