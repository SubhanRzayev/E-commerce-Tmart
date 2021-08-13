from rest_framework import views
from accounts.api.views import *
from django.urls import path
from . import views
from accounts.api.serializer import RegisterSerializer
from accounts.views import RegisterView
app_name = 'accounts'

urlpatterns = [
    path('register/', views.RegisterView.as_view(), name='auth_register'),

]
