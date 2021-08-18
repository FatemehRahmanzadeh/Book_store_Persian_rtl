from django.db.models import Q
from rest_framework import generics
from rest_framework.decorators import api_view
from rest_framework.permissions import AllowAny
from rest_framework.response import Response

from books.filters import DynamicSearchFilter
from books.models import Book
from books.serialiers import BookSerializer


class BookListAPIView(generics.ListAPIView):
    queryset = Book.objects.all()
    permission_classes = (AllowAny,)
    serializer_class = BookSerializer
    filter_backends = (DynamicSearchFilter,)
    search_fields = ['title', 'authors']


@api_view(['POST'])
def search(request):
    query = request.data.get('query', '')

    if query:
        books = Book.objects.filter(Q(title__icontains=query) | Q(authors__icontains=query))
        serializer = BookSerializer(books, many=True)
        return Response(serializer.data)
    else:
        return Response({"books": []})