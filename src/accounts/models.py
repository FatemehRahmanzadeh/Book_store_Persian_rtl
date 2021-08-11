from django.contrib.auth import get_user_model
from django.contrib.auth.models import AbstractUser, Group
from django.db import models


# class CustomUser(AbstractUser):
#     ADMIN = 1
#     STAFF = 2
#     CUSTOMER = 3
#     ROLES = [(ADMIN, 'مدیر'), (STAFF, 'کارمند'), (CUSTOMER, 'مشتری')]
#     role = models.PositiveSmallIntegerField(verbose_name='سمت کاربر', choices=ROLES, blank=True, null=True)
#
#     class Meta:
#         verbose_name = 'کاربر'
#         verbose_name_plural = 'کاربران'

    # def get_user_address(self):
    #     return self.customer_addresses


class Address(models.Model):
    customer = models.ForeignKey(get_user_model(), verbose_name='صاحب آدرس',
                                 on_delete=models.CASCADE,
                                 related_name='customer_addresses')
    province = models.CharField(verbose_name='استان', max_length=200)
    city = models.CharField(verbose_name='شهر', max_length=200)
    street = models.CharField(verbose_name='خیابان', max_length=200)
    details = models.CharField(verbose_name='جزییات آدرس', max_length=300)
    postcode = models.CharField(verbose_name='کدپستی', max_length=10)

    class Meta:
        verbose_name = 'آدرس'
        verbose_name_plural = 'آدرس ها'

    def __str__(self):
        return self.postcode
