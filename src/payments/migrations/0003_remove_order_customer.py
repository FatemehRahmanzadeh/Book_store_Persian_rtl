# Generated by Django 3.2.6 on 2021-08-18 20:27

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('payments', '0002_alter_basket_options'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='order',
            name='customer',
        ),
    ]