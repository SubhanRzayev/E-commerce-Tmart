from typing import ContextManager
from django.http import JsonResponse
from django.urls.base import reverse_lazy
from django.http import JsonResponse, request
from django.views.generic.edit import CreateView
from django.views.generic.list import ListView
from order.models import *
from accounts.models import User
from products.models import Category, Product 
from order.models import ShippingAddress
from order.forms import ShippingAddres
from django.contrib import messages 
from django.shortcuts import redirect, render
import json
from django.contrib.auth.mixins import LoginRequiredMixin

from products.signals import *
import datetime
from django.views.generic import ListView

User = get_user_model()

class WishlistView(ListView):
    model = Order
    template_name = 'wishlist.html'
    success_url = 'order:wishlist'


class CartView(ListView):
    model = Order
    template_name = 'cart.html'
    success_url = 'order:cart'



class CheckoutView(LoginRequiredMixin,CreateView):
    model = Order
    template_name = 'checkout.html'
    success_url = reverse_lazy('order:checkout')
    form_class= ShippingAddres

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        customer =  self.request.user       
        order, created = Order.objects.get_or_create(customer=customer, complete=False)

        context['items'] = order.orderitem_set.all()
        context['order'] = Order.objects.get_or_create(customer=customer, complete=False)
        context['cartItems'] = order.get_cart_items
        context['get_cart_total'] = order.get_cart_total
        return context
    
    
    def form_valid(self,form):
        form.save()
        messages.info(request,'Muracietiniz qebul olundu')
        return super().form_valid(form)

 
def processOrder(request):
    transaction_id = datetime.datetime.now().timestamp()
    data = json.loads(request.body)

    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer=customer, complete=False)
        total = float(data['form']['total'])
        order.transaction_id = transaction_id

        if total == order.get_cart_total:
            order.complete = True
        order.save()

        if order.shipping == True:
            ShippingAddress.objects.create(
                order = order,
                customer = customer,
                address = data['shipping']['address'],
                city = data['shipping']['city'],
                state = data['shipping']['state'],
                zipcode = data['shipping']['zipcode'],
                companyname = data['shipping']['companyname'], 
                )
    
    else:
        print('User is not logged in ..')

    return JsonResponse('Payment complete',safe=False)

def updateItem(request, id):
    data = json.loads(request.body)
    productId = data['productId']
    action = data['action']

    customer = request.user
    product = Product.objects.get(id=productId)
    order, created = Order.objects.get_or_create(customer=customer, complete=False)

    orderItem, created = OrderItem.objects.get_or_create(order=order, product=product)

    if action == 'add':
        orderItem.quantity = (orderItem.quantity + 1)
        print('it is the add func')
    elif action == 'remove':
        orderItem.quantity = (orderItem.quantity - 1)
    

    orderItem.save()

    if orderItem.quantity <= 0:
        orderItem.delete()

    return JsonResponse('Item was added/removed', safe=False)   


def deletefromcart(request,id):
    customer = request.user
    
    OrderItem.objects.filter(product__id=id, order__customer=customer).delete()
    messages.success(request,"Product is deleted")
    return redirect('order:cart')


def deletefromwishlist(request,id):
    customer = request.user
    
    OrderItem.objects.filter(product__id=id, order__customer=customer).delete()
    messages.success(request,"Product is deleted")
    return redirect('order:wishlist')
