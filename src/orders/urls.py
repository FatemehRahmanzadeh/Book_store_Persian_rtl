# from rest_framework import routers
#
# from orders.views import OrderViewSet

# router = routers.DefaultRouter()
# router.register('create_order', OrderViewSet, basename='create_order')
# urlpatterns = router.urls
from django.urls import path
from orders.views import OrderUpdate, create

urlpatterns = [
    path('create-order/', create, name='create-order'),
    path('<int:pk>/', OrderUpdate.as_view(), name='order-send'),
]
