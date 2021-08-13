from django.db.models.aggregates import Avg
from django.template import Library
from products.models import *
from order.models import *
from django.shortcuts import render



register = Library() 

# @register.simple_tag
# def get_color(limit=None):
#     return Color.objects.filter(is_published=True)[0:limit]

@register.simple_tag
def price(price,sale):
    return price * (100 - sale) // 100

@register.simple_tag
def cart(request):
    if request.user.is_authenticated:
        customer =  request.user
        order, created = Order.objects.get_or_create(customer=customer, complete=False)
        items = order.orderitem_set.all()
        print(items)
        cartItems=order.get_cart_items
    else:
        items = []
        order = {'get_cart_total':0, 'get_cart_items':0, 'shipping':False}
        cartItems=order['get_cart_items']

    context = {
        "items":items,
        "order":order,
        'cartItems':cartItems,
    }
    return context


@register.simple_tag
def footer_categories():
    return Category.objects.filter(category__isnull=True).order_by('created_at')[:7]

@register.simple_tag
def rating():
    if Review.objects.filter(rate__isnull=False) is True:
        a = Review.objects.filter(rate__isnull=False)
        x = 0
        for i in a:
            x += i.rate
        
        y = x / len(a)
        return y

@register.simple_tag
def navbar_photos():
    return Product.objects.filter(cover_image__isnull=False).filter(is_published=True).order_by('created_at')[:8]

# http://api.exchangeratesapi.io/v1/latest?access_key=d60d201f55aefa20a89e01241957efb4&base=USD&symbols=EUR&amount=25

