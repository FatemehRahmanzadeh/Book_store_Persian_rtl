# from rest_framework import routers
#
# from orders.views import OrderViewSet

# router = routers.DefaultRouter()
# router.register('create_order', OrderViewSet, basename='create_order')
# urlpatterns = router.urls
from django.urls import path

from orders import API_views

urlpatterns = [
    path('api/orders/', API_views.OrderListAPIView.as_view(), name='orders'),
    path('api/orders/', API_views.OrderListAPIView.as_view(), name='order-send'),
]
