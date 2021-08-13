"""Tmart URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls.i18n import i18n_patterns
from django.contrib import admin
from django.urls import include, path
from django.conf.urls.static import static
from django.conf import settings
from rest_framework.authtoken import views
from accounts.api.views import CustomAuthToken

urlpatterns = [
    path('jet/', include('jet.urls', 'jet')),  # Django JET URLS
    path('admin/', admin.site.urls),
    path('i18n/', include('django.conf.urls.i18n')),
    path('api/',include('products.api.urls', namespace='categories_api')),
    path('api/',include('core.api.urls', namespace='subscribe_api')),
    path('api/auth/',include('accounts.api.urls', namespace='register_api')),
    path('', include('core.urls',namespace='core')),
    path('', include('products.urls', namespace='products')),    
    path('', include('order.urls', namespace='order')),
    path('', include('accounts.urls', namespace='accounts')),
    path('', include('blog.urls', namespace='blog')),
    path('api/', include('products.api.urls', namespace='products_api')),
    path('api/', include('accounts.api.urls', namespace='accounts_api')),
    path('social-auth/', include('social_django.urls', namespace="social")),
    # path('api-auth/', include('rest_framework.urls')),
    path('api-token-auth/', CustomAuthToken.as_view())



]  + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

urlpatterns += i18n_patterns(
    path('', include('core.urls', namespace='core_language')),
)

