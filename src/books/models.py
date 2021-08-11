from django.contrib.auth import get_user_model
from django.db import models


class Category(models.Model):
    name = models.CharField(verbose_name='نام دسته',max_length=100)
    creator = models.ForeignKey(get_user_model(),verbose_name='ایجادکننده', on_delete=models.DO_NOTHING, related_name='catObj_registrar')
    editors = models.ManyToManyField(get_user_model(), verbose_name='ویرایشگر', related_name='catObj_editor')
    created_at = models.DateTimeField(verbose_name='زمان ایجاد',auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name='زمان بروزرسانی',auto_now=True)

    def __str__(self):
        return f'{self.name}'


class Book(models.Model):
    title = models.CharField(verbose_name='عنوان',max_length=150)
    categories = models.ManyToManyField(Category,verbose_name='دسته ها', related_name='book_categories')
    created_at = models.DateTimeField(verbose_name='زمان ایجاد',auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name='زمان بروزرسانی',auto_now=True)
    creator = models.ForeignKey(get_user_model(), verbose_name='ایجادکننده',on_delete=models.DO_NOTHING, related_name='bookObj_registrar')
    editors = models.ManyToManyField(get_user_model(),verbose_name='ویرایشگر', related_name='bookObj_editor')
    authors = models.CharField(verbose_name='نویسنده',max_length=200)
    description = models.TextField(verbose_name='درباره کتاب',max_length=700, blank=True, null=True)
    quantity = models.IntegerField(verbose_name='تعداد')
    price = models.FloatField(verbose_name='قیمت')
    image = models.ImageField(verbose_name='عکس',upload_to='./images/books', blank=True, null=True)
    percent_off = models.ForeignKey('payments.PercentOff',verbose_name='درصد تخفیف', on_delete=models.DO_NOTHING, related_name='percent_disc')
    max_cash_off = models.ForeignKey('payments.CashOff', verbose_name='تخفیف نقدی', on_delete=models.DO_NOTHING, related_name='cash_disc')

    class Meta:
        ordering = ['title']
        constraints = [
            models.UniqueConstraint(fields=['title', 'authors'], name='unique_book')
        ]
        verbose_name = 'کتاب'
        verbose_name_plural = 'کتاب ها'

    def __str__(self):
        return f'{self.title} - {self.id}'