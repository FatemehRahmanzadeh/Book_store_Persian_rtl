from django.contrib.auth import get_user_model
from django.contrib.auth.models import (AbstractBaseUser, BaseUserManager,
                                        PermissionsMixin)
from django.db import models
from django.template.defaultfilters import slugify
from django.utils import timezone

from accounts.utils import get_random_code


class UserManager(BaseUserManager):

    def _create_user(self, email, password, is_staff, is_superuser, **extra_fields):
        if not email:
            raise ValueError('Users must have an email address')
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
    slug = models.SlugField(max_length=100)
    USERNAME_FIELD = 'email'
    EMAIL_FIELD = 'email'
    REQUIRED_FIELDS = []

    objects = UserManager()

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.__initial_first_name = self.first_name
        self.__initial_last_name = self.last_name

    def save(self, *args, **kwargs):
        to_slug = self.slug
        if self.first_name != self.__initial_first_name or self.last_name != self.__initial_last_name or self.slug == "":
            if self.first_name and self.last_name:
                to_slug = slugify(str(self.first_name) + " " + str(self.last_name))
                ex = CustomUser.objects.filter(slug=to_slug).exists()
                while ex:
                    to_slug = slugify(to_slug + " " + str(get_random_code()))
                    ex = CustomUser.objects.filter(slug=to_slug).exists()
            else:
                to_slug = str(self.email)
        self.slug = to_slug
        super().save(*args, **kwargs)

    def get_absolute_url(self):
        return "/accounts/%s/" % self.slug


class CustomerProxy(CustomUser):
    class Meta:
        proxy = True
        verbose_name = 'مشتری'
        verbose_name_plural = 'مشتریان'


class StaffProxy(CustomUser):
    class Meta:
        proxy = True
        verbose_name = 'کارمند'
        verbose_name_plural = 'کارمندان'


class AdminProxy(CustomUser):
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
        return self.customer.username

    def get_absolute_url(self):
        return "/accounts/%i/" % self.pk
