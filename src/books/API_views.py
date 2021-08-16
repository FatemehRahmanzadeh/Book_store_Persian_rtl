from rest_framework import filters, generics

from books.filters import DynamicSearchFilter
from books.models import Book
from books.serialiers import BookSerializer


class BookListAPIView(generics.ListCreateAPIView):
    queryset = Book.objects.all()
    serializer_class = BookSerializer
    # filter_backends = [filters.SearchFilter]
    filter_backends = (DynamicSearchFilter,)
    search_fields = ['title', 'authors']
