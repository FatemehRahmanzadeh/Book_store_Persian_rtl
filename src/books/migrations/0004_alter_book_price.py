# Generated by Django 3.2.6 on 2021-08-17 08:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('books', '0003_alter_book_slug'),
    ]

    operations = [
        migrations.AlterField(
            model_name='book',
            name='price',
            field=models.BigIntegerField(verbose_name='قیمت'),
        ),
    ]