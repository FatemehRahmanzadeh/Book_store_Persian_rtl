from django.urls import path

from books import views
from books.API_views import BookListAPIView, search


urlpatterns = [
    path('API/book-list/', BookListAPIView.as_view(), name='API-books'),
    path('search/', views.Search.as_view(), name='search'),
    # path('search/', search, name='search'),
    path('<str:slug>/detail/', views.BookDetail.as_view(), name='detail'),
    path('new-book/', views.CreateBook.as_view(), name='create-book'),
    path('book-list/', views.BookList.as_view(), name='book-list'),
    path('<str:slug>/delete/', views.DeleteBookView.as_view(), name='delete-book'),
    path('<str:slug>/edit/', views.EditBook.as_view(), name='edit-book'),
    path('categories/', views.CategoryView.as_view(), name='categories'),
    path('categories/new/', views.CreateCategory.as_view(), name='new-category'),
    path('categories/<str:slug>/delete/', views.DeleteCategoryView.as_view(), name='delete-category'),
    path('categories/<str:slug>/edit/', views.EditCategoryView.as_view(), name='edit-category'),
    path('categories/<str:slug>/detail/', views.CategoryDetail.as_view(), name='category_detail'),
]