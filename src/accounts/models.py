from django.contrib.auth import get_user_model
from django.contrib.auth.models import AbstractUser
from django.db import models

from BookStore import settings


class Customer(models.Model):
    user = models.OneToOneField(
        get_user_model(), on_delete=models.CASCADE)

    class Meta:
        verbose_name = 'مشتری'
        verbose_name_plural = 'مشتریان'

    def __str__(self):
        return self.user.name


class Address(models.Model):
    customer = models.ForeignKey(Customer, verbose_name='صاحب آدرس',
                                 on_delete=models.CASCADE,
                                 related_name='customer_addresses')
    province = models.CharField(verbose_name='استان', max_length=200)
    city = models.CharField(verbose_name='شهر', max_length=200)
    street = models.CharField(verbose_name='خیابان', max_length=200)
    details = models.CharField(verbose_name='جزییات آدرس', max_length=300)
    postcode = models.CharField(verbose_name='کدپستی', max_length=10)
