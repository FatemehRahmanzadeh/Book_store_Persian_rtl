from django.urls import path

from .views import About, Contact, HomePage

urlpatterns = [
    path('', HomePage.as_view(), name='home'),
    path('about-us/', About.as_view(), name='about'),
    path('contact-us/', Contact.as_view(), name='contact'),
]