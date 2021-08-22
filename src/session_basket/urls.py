from django.urls import path

from session_basket import views


urlpatterns = [
    # path('order-summary/', OrderSummary.as_view(), name='summary'),
    path('add-to-basket/', views.add_to_basket, name='add_to_basket'),
    path('baske-summary/', views.basket_summary, name='summary'),
    path('delete-from-session_basket/', views.basket_delete, name='delete'),
    path('update-session_basket/', views.basket_update, name='update'),
]