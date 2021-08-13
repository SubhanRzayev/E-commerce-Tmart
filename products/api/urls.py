from rest_framework import views
from products.api.views import *
from django.urls import path
from . import views
# from products.api.serializers import RegisterSerializer
from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from products.api.views import *

app_name = 'products'

urlpatterns = [
    path('products/', ProductsAPIView.as_view(), name='post'),
    path('products/<int:pk>/', ProductAPIView.as_view(), name='get'),
    path('filtered-products/', CteagoryProdactListView.as_view(),name = 'categories'),
    path('all/', ProductFilterAllAPIView.as_view(), name='all'),
    path('latest/', ProductFilterLatestAPIView.as_view(), name='latest'),
    path('sale/', ProductFilterSaleAPIView.as_view(), name='sale'),

]
urlpatterns = format_suffix_patterns(urlpatterns)
