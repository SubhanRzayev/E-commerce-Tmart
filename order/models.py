from django.db import models
from accounts.models import User
from products.models import Product
from django.utils import timezone
from django.contrib.auth import get_user_model

User = get_user_model()


class Order(models.Model):
    #relation
    customer = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    #information
    date_ordered = models.DateTimeField(default=timezone.now)
    complete = models.BooleanField(default=False)
    transaction_id = models.CharField(max_length=100, null=True)
    
    
    if customer is 'null':
        def __str__(self):
            return str(self.id)
    else:
        def __str__(self):
            return self.customer.username

    @property
    def shipping(self):
        shipping = False
        orderitems = self.orderitem_set.all()
        for i in orderitems:
            if i.product.digital == False:
                shipping = True
        return shipping  

    #Total price
    @property
    def get_cart_total(self):
        orderitems = self.orderitem_set.all()
        total = sum([item.get_total for item in orderitems])
        return total
    
    #Total items
    @property
    def get_cart_items(self):
        orderitems = self.orderitem_set.all()
        total = sum([item.quantity for item in orderitems])
        return total
    

class OrderItem(models.Model):
    #relation
    product = models.ForeignKey(Product, on_delete=models.SET_NULL, null=True)
    order = models.ForeignKey(Order, on_delete=models.SET_NULL, null=True)
    #information
    quantity = models.IntegerField(default=0, null=True, blank=True)
    date_added = models.DateTimeField(default=timezone.now)

    # def __str__(self):
    #     return self.product.title

    @property
    def get_total(self):
        if self.product.discount_price and self.product.sale == 0:
            total = self.product.discount_price * self.quantity
            return total
        elif self.product.discount_price == 0.00 and self.product.sale:
            # price product.price product.sale  
            price  = self.product.price * (100 - self.product.sale) // 100
            total =  price * self.quantity
            return total
        elif self.product.discount_price == 0.00 and self.product.sale == 0:
            total = self.product.price * self.quantity
            return total
        else:
            total = self.product.price * self.quantity
            return total

class ShippingAddress(models.Model):
    #relation
    customer = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    order = models.ForeignKey(Order, on_delete=models.SET_NULL, null=True)
    address = models.CharField(max_length=200, null=False)
    city = models.CharField(max_length=200, null=False)
    state = models.CharField(max_length=200, null=True, blank=True)
    zipcode = models.CharField(max_length=200, null=False)
    companyname = models.CharField(max_length=100, null=True, blank=True)
    date_added = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return self.address

