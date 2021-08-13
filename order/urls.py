from django.urls import path
from order.views import *
from products.signals import *
from . import views
app_name = 'order'

urlpatterns = [
    path("cart/", CartView.as_view(), name='cart'),
    path("wishlist/", WishlistView.as_view(), name='wishlist'),
    path("checkout/", CheckoutView.as_view(), name='checkout'),

    path("product-detail/<int:id>/update-item/", updateItem, name='update_item'),
    path('deletefromcart/<int:id>/',deletefromcart,name='deletefromcart'),
    path('deletefromwishlist/<int:id>/',deletefromwishlist,name='deletefromwishlist'),
    path("process-order/",processOrder,name='process-order'),

]


