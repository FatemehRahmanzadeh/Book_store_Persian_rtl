# Generated by Django 3.2.6 on 2021-08-24 09:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('books', '0002_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='book',
            name='image',
            field=models.ImageField(blank=True, default='../static/image.png', upload_to='./images/books', verbose_name='عکس'),
        ),
    ]