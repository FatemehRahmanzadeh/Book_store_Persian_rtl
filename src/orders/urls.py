# from rest_framework import routers
#
# from orders.views import OrderViewSet

# router = routers.DefaultRouter()
# router.register('create_order', OrderViewSet, basename='create_order')
# urlpatterns = router.urls
from django.urls import path
from django.views.generic import TemplateView

from orders import discount_views
from orders.views import OrderRegister, create, last_uncheck_orders, CustomerOrderHistory, OrderDetail, OrderDelete

urlpatterns = [
    path('create-order/', create, name='create-order'),
    path('<int:pk>/send-order/', OrderRegister.as_view(), name='order-send'),
    path('last-order/', last_uncheck_orders, name='last-order'),
    path('<int:pk>/detail/', OrderDetail.as_view(), name='order-detail'),
    path('<int:pk>/delete/', OrderDelete.as_view(), name='order-delete'),
    path('basket/<int:pk>/', CustomerOrderHistory.as_view(), name='all-basket-orders'),
    path('all-orders/registered/', TemplateView.as_view( template_name='payments/orders/all_orders.html'), name='all-reg-orders'),
    path('all-orders/unregistered/', TemplateView.as_view(template_name='payments/orders/all_not_reg_orders.html'), name='all-not-reg-orders'),
    # تخفیف ها
    path('discounts/cods/', discount_views.DiscountCodeList.as_view(), name='all-discount-cods'),
    path('discounts/create/code/', discount_views.CreateDiscountCode.as_view(), name='create-code'),
    path('discounts/code/<int:pk>/edit/', discount_views.EditDiscountCode.as_view(), name='edit-code'),
    path('discounts/code/<int:pk>/delete/', discount_views.DeleteDiscountCode.as_view(), name='delete-code'),
    path('discounts/percent/', discount_views.PercentOffList.as_view(), name='all-discount-percents'),
    path('discounts/create/percent/', discount_views.CreatePercentOff.as_view(), name='create-percent'),
    path('discounts/percent/<int:pk>/edit/', discount_views.EditPercentOff.as_view(), name='edit-percent'),
    path('discounts/percent/<int:pk>/delete/', discount_views.DeletePercentOff.as_view(), name='delete-percent'),
    path('discounts/cash/', discount_views.CashOffList.as_view(), name='all-discount-cash'),
    path('discounts/create/cash/', discount_views.CreateCashOff.as_view(), name='create-cash'),
    path('discounts/cash/<int:pk>/edit/', discount_views.EditCashOff.as_view(), name='edit-cash'),
    path('discounts/cash/<int:pk>/delete/', discount_views.DeleteCashOff.as_view(), name='delete-cash'),
]
