from django.urls import path
from books import views
from books.API_views import BookListAPIView, search
from books.views import CategoryDetail, CategoryView

urlpatterns = [
    path('API/book-list/', BookListAPIView.as_view(), name='API-books'),
    path('search/', views.Search.as_view(), name='search'),
    # path('search/', search, name='search'),
    path('<str:slug>/detail', views.BookDetail.as_view(), name='detail'),
    path('categories/', CategoryView.as_view(), name='categories'),
    path('<str:slug>/detail/', CategoryDetail.as_view(), name='category_detail'),
]