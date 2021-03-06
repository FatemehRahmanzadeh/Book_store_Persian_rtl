from books.models import Book, Category


def categories(request):
    return {
        'categories': Category.objects.all().exclude(book_categories__isnull=True),
        'empty_categories': Category.objects.filter(book_categories__isnull=True),
    }


def books(request):
    return {
        'books': Book.actives.all(),
        'all-books': Book.objects.all()
    }
