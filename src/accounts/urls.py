from django.urls import path

from accounts import views

app_name = 'accounts'
urlpatterns = [
    # path('addresses/', AddressListAPIView.as_view(), 'addresses'),
    path('address/create/', views.AddressCreateView.as_view(), name='address-create'),
    path('address/<int:pk>/update/', views.AddressUpdateView.as_view(), name='address-update'),
    path('<str:slug>/staff/', views.StaffDashboard.as_view(), name='staff-panel'),
    path('redirects/', views.login_redirects, name='redirects'),
    path('<str:slug>/panel/', views.CustomerPanel.as_view(), name='customer-panel'),
    path('<str:slug>/edit/', views.CustomerUpdateView.as_view(), name='customer-edit'),
]
