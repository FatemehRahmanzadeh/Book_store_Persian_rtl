from django.urls import path
from books.API_views import BookListAPIView

urlpatterns = [
    path('API/book-list/', BookListAPIView.as_view(), name='API-books'),
]