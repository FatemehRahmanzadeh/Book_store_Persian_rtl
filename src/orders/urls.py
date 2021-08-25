# from rest_framework import routers
#
# from orders.views import OrderViewSet

# router = routers.DefaultRouter()
# router.register('create_order', OrderViewSet, basename='create_order')
# urlpatterns = router.urls
from django.urls import path
from orders.views import OrderRegister, create, last_uncheck_orders

urlpatterns = [
    path('create-order/', create, name='create-order'),
    path('<int:pk>/send-order/', OrderRegister.as_view(), name='order-send'),
    path('last-order/', last_uncheck_orders, name='last-order'),
]
