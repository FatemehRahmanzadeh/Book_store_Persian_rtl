from django.urls import path
from books.API_views import BookListView

urlpatterns = [
    path('API/book-list/', BookListView.as_view(), name='API-books'),
]#