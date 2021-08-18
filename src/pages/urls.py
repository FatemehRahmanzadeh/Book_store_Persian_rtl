from .views import HomePage, About, Contact
from django.urls import path

urlpatterns = [
    path('', HomePage.as_view(), name='home'),
    path('about-us/', About.as_view(), name='about'),
    path('contact-us/', Contact.as_view(), name='contact'),
]