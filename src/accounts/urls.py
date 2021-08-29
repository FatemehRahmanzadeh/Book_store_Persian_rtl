from django.urls import path

from accounts import views

app_name = 'accounts'
urlpatterns = [
    path('signup/', views.SignUpView.as_view(), name='signup-modal'),
    path('address/create/', views.AddressCreateView.as_view(), name='address-create'),
    path('address/<int:pk>/update/', views.AddressUpdateView.as_view(), name='address-update'),
    path('address/<int:pk>/delete/', views.DeleteAddress.as_view(), name='address-delete'),
    path('address/', views.get_user_addresses, name='user-addresses'),
    path('<str:slug>/staff/', views.StaffDashboard.as_view(), name='staff-panel'),
    path('redirects/', views.login_redirects, name='redirects'),
    path('<str:slug>/panel/', views.CustomerPanel.as_view(), name='customer-panel'),
    path('<str:slug>/edit/', views.CustomerUpdateView.as_view(), name='customer-edit'),
]
