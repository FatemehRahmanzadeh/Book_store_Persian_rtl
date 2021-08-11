from django.db.models import Manager


class PercentOffManager(Manager):
    def get_queryset(self):
        return super(PercentOffManager, self).get_queryset().filter(type='P')


class CashOffManager(Manager):
    def get_queryset(self):
        return super(CashOffManager, self).get_queryset().filter(type='Ch')
