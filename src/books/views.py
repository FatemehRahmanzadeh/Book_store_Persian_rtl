from django.db.models import Q
from django.views.generic import ListView, DetailView

from books.models import Book


class Search(ListView):
    model = Book
    template_name = 'search.html'
    paginate_by = 10

    def get_queryset(self):
        query = self.request.GET.get('query')
        return Book.objects.filter(Q(title__icontains=query) | Q(authors__icontains=query))


class BookDetail(DetailView):
    model = Book
    template_name = 'book-detail.html'