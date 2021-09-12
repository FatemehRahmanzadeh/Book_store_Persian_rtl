from autoslug import AutoSlugField
from django.contrib.auth import get_user_model
from django.contrib.auth.models import (AbstractBaseUser, BaseUserManager,
                                        PermissionsMixin)
from django.db import models
from django.utils import timezone


class UserManager(BaseUserManager):

    def _create_user(self, email, password, is_staff, is_superuser, **extra_fields):
        if not email:
            raise ValueError('برای ثبت نام وارد کردن ایمیل لازم است.')
        now = timezone.now()
        email = self.normalize_email(email)
        user = self.model(
            email=email,
            is_staff=is_staff,
            is_active=True,
            is_superuser=is_superuser,
            last_login=now,
            date_joined=now,
            **extra_fields
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password, **extra_fields):
        user = self._create_user(email, password, True, True, **extra_fields)
        user.save(using=self._db)
        return user


class CustomUser(AbstractBaseUser, PermissionsMixin):
    username = models.CharField(verbose_name='نام کاربری', max_length=254, unique=True, null=True, blank=True)
    email = models.EmailField(verbose_name='ایمیل', max_length=254, unique=True)
    first_name = models.CharField(verbose_name='نام', max_length=254, null=True, blank=True)
    last_name = models.CharField(verbose_name='نام خانوادگی', max_length=254, null=True, blank=True)
    is_staff = models.BooleanField(verbose_name='کارمند', default=False)
    is_superuser = models.BooleanField(verbose_name='مدیر', default=False)
    is_active = models.BooleanField(verbose_name='فعال', default=True)
    last_login = models.DateTimeField(verbose_name='آخرین ورود', null=True, blank=True)
    date_joined = models.DateTimeField(verbose_name='تاریخ ثبت نام', auto_now_add=True)
    slug = AutoSlugField(unique=True)
    USERNAME_FIELD = 'email'
    EMAIL_FIELD = 'email'
    REQUIRED_FIELDS = []

    objects = UserManager()

    def get_absolute_url(self):
        return "/accounts/%s/" % self.slug

    def __str__(self):
        return f'{self.email}'

    def get_default_address(self):
        """
        آدرس پیشفرض کاربر را برمی گرداند
        """
        return self.user_addresses.get(is_default=True)

    def set_default_address(self, addr):
        """
        انتخاب آدرس اصلی کاربر از بین آدرس ها
        """
        addresses = self.user_addresses.all()
        if len(addresses) > 1:
            for _ in addresses:
                if _ == addr:
                    _.is_default = True
                    _.save()
                else:
                    _.is_default = False
                    _.save()


class CustomerProxy(CustomUser):
    class Meta:
        proxy = True
        verbose_name = 'مشتری'
        verbose_name_plural = 'مشتریان'


class StaffProxy(CustomUser):
    is_staff = True

    # staff_code = models.CharField(verbose_name='کد کارمند', max_length=10)

    class Meta:
        proxy = True
        verbose_name = 'کارمند'
        verbose_name_plural = 'کارمندان'


class AdminProxy(CustomUser):
    is_staff = True
    is_superuser = True

    class Meta:
        proxy = True
        verbose_name = 'مدیر'
        verbose_name_plural = 'مدیران'


class Address(models.Model):
    customer = models.ForeignKey(get_user_model(), verbose_name='صاحب آدرس',
                                 on_delete=models.CASCADE,
                                 related_name='user_addresses')
    is_default = models.BooleanField('آدرس اصلی', default=False)
    province = models.CharField(verbose_name='استان', max_length=200)
    city = models.CharField(verbose_name='شهر', max_length=200)
    street = models.CharField(verbose_name='خیابان', max_length=200)
    details = models.CharField(verbose_name='جزییات آدرس', max_length=300)
    postcode = models.CharField(verbose_name='کدپستی', max_length=10)

    class Meta:
        verbose_name = 'آدرس'
        verbose_name_plural = 'آدرس ها'

    def __str__(self):
        return f'{self.city}  (کدپستی: {self.postcode})'

    def get_absolute_url(self):
        return "/accounts/address/%i/" % self.pk

    def change_default(self):
        if self.is_default:
            self.is_default = False
        else:
            self.is_default = True
        return self.is_default
