from django.db.models import Manager


class BookManager(Manager):

    def get_queryset(self):
        return super(BookManager, self).get_queryset().filter(is_active='A')
