from django.urls import path

from payments import views
# from payments.views import OrderSummary


urlpatterns = [
    # path('order-summary/', OrderSummary.as_view(), name='summary'),
    path('add-to-basket/', views.add_to_basket, name='add_to_basket'),
    path('baske-summary/', views.basket_summary, name='summary'),
]