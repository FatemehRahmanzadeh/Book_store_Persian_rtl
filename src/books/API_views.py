import django_filters.rest_framework
from rest_framework import filters, generics

from books.models import Book
from books.serialiers import BookSerializer


class BookListView(generics.ListAPIView):
    queryset = Book.objects.all()
    serializer_class = BookSerializer
    filter_backends = [filters.SearchFilter]
    search_fields = ['title', 'authors']