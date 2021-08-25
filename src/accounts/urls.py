from django.urls import path

from accounts import views

app_name = 'accounts'
urlpatterns = [
    # path('addresses/', AddressListAPIView.as_view(), 'addresses'),
    path('address/create/', views.AddressCreateView.as_view(), name='address-create'),
    path('address/<int:pk>/update/', views.AddressUpdateView.as_view(), name='address-update'),
]
