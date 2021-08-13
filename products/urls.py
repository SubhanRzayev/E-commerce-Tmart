from django.urls import path
from products.views import *


app_name = 'products'

urlpatterns = [
    path("product-detail/<slug:slug>/", ProductDetailView.as_view(), name='product_detail'),
    path("shop/", ShopView.as_view(), name='shop'),
    # path("rate/", rate_image, name='rate-view'),
    # path("shortby/", search, name='shortBy'),
    # path("color/", color, name='color'),
] 