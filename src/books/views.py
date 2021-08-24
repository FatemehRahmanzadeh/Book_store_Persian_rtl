from django.db.models import Q
from django.views.generic import DetailView, ListView

from books.models import Book, Category


class Search(ListView):
    model = Book
    template_name = 'books/search.html'
    paginate_by = 10

    def get_queryset(self):
        query = self.request.GET.get('query')
        if query.isdigit():
            return Book.actives.filter(Q(price__lte=query))
        return Book.actives.filter(Q(title__icontains=query) | Q(authors__icontains=query))


class BookDetail(DetailView):
    model = Book
    template_name = 'books/book-detail.html'


class CategoryView(ListView):
    model = Category
    template_name = 'books/category-list.html'
    paginate_by = 10
    def get_queryset(self):
        return super(CategoryView, self).get_queryset().exclude(book_categories__isnull=True)


class CategoryDetail(DetailView):
    model = Category
    template_name = 'books/search.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        slug = self.kwargs.get('slug')
        try:
            context['object_list'] = Book.objects.filter(categories__slug=slug)
        except Book.DoesNotExist:
            context['object_list'] = None
        return context
