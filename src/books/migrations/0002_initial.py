# Generated by Django 3.2.6 on 2021-08-11 14:17

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('books', '0001_initial'),
        ('payments', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='book',
            name='max_cash_off',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='cash_disc', to='payments.cashoff', verbose_name='تخفیف نقدی'),
        ),
        migrations.AddField(
            model_name='book',
            name='percent_off',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='percent_disc', to='payments.percentoff', verbose_name='درصد تخفیف'),
        ),
        migrations.AddConstraint(
            model_name='book',
            constraint=models.UniqueConstraint(fields=('title', 'authors'), name='unique_book'),
        ),
    ]
