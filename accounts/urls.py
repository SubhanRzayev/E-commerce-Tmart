from django.urls import path
from django.urls.resolvers import RegexPattern
from django.urls.conf import re_path
from accounts.views import *
from accounts.forms import *
from django.contrib.auth import views as auth_views
from . import views

app_name = 'accounts'

urlpatterns = [
    path("login-register/", RegisterView.as_view(), name="login-register"),
    path('login/',CustomLoginView.as_view(),name = "login"),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('confirmation/<str:uidb64>/<str:token>/', activate, name='confirmation'),
    path('reset-password/<str:uidb64>/<str:token>/',
            CustomPasswordResetConfirmView.as_view(), name='reset-password'),
    path('forget-password/', CustomPasswordResetView.as_view(), name='password-reset-view'),
    path('change-password/', PasswordsChangeView.as_view(template_name='change-password.html'), name='password-change-view'),
    path('password-success/', views.password_success, name="password_success"),
]


