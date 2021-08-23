# Generated by Django 3.2.6 on 2021-08-22 20:35

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='CustomUser',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('username', models.CharField(blank=True, max_length=254, null=True, unique=True, verbose_name='نام کاربری')),
                ('email', models.EmailField(max_length=254, unique=True, verbose_name='ایمیل')),
                ('first_name', models.CharField(blank=True, max_length=254, null=True, verbose_name='نام')),
                ('last_name', models.CharField(blank=True, max_length=254, null=True, verbose_name='نام خانوادگی')),
                ('is_staff', models.BooleanField(default=False, verbose_name='کارمند')),
                ('is_superuser', models.BooleanField(default=False, verbose_name='مدیر')),
                ('is_active', models.BooleanField(default=True, verbose_name='فعال')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='آخرین ورود')),
                ('date_joined', models.DateTimeField(auto_now_add=True, verbose_name='تاریخ ثبت نام')),
                ('slug', models.SlugField(max_length=100)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Address',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is_default', models.BooleanField(default=False, verbose_name='آدرس اصلی')),
                ('province', models.CharField(max_length=200, verbose_name='استان')),
                ('city', models.CharField(max_length=200, verbose_name='شهر')),
                ('street', models.CharField(max_length=200, verbose_name='خیابان')),
                ('details', models.CharField(max_length=300, verbose_name='جزییات آدرس')),
                ('postcode', models.CharField(max_length=10, verbose_name='کدپستی')),
                ('customer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='user_addresses', to=settings.AUTH_USER_MODEL, verbose_name='صاحب آدرس')),
            ],
            options={
                'verbose_name': 'آدرس',
                'verbose_name_plural': 'آدرس ها',
            },
        ),
        migrations.CreateModel(
            name='AdminProxy',
            fields=[
            ],
            options={
                'verbose_name': 'مدیر',
                'verbose_name_plural': 'مدیران',
                'proxy': True,
                'indexes': [],
                'constraints': [],
            },
            bases=('accounts.customuser',),
        ),
        migrations.CreateModel(
            name='CustomerProxy',
            fields=[
            ],
            options={
                'verbose_name': 'مشتری',
                'verbose_name_plural': 'مشتریان',
                'proxy': True,
                'indexes': [],
                'constraints': [],
            },
            bases=('accounts.customuser',),
        ),
        migrations.CreateModel(
            name='StaffProxy',
            fields=[
            ],
            options={
                'verbose_name': 'کارمند',
                'verbose_name_plural': 'کارمندان',
                'proxy': True,
                'indexes': [],
                'constraints': [],
            },
            bases=('accounts.customuser',),
        ),
    ]
