from django.db import models
from django.utils.translation import gettext_lazy as _
from django.db.models.fields import CharField, DateTimeField, EmailField, TextField, BooleanField, DateTimeField
from django.contrib.auth.models import AbstractUser
from order.models import *

class Subscriber(models.Model):
    """
    this is Email accounts
    """

    email = models.EmailField(max_length=50)
    is_active = models.BooleanField(default=True, blank=True)

    #moderations
    created_at = models.DateTimeField(auto_now=True,blank=True)
    updated_at = models.DateTimeField(auto_now_add=True,blank=True)

    def __str__(self):
        return self.email

class Contact(models.Model):
    name =  models.CharField(max_length=50)
    email = models.EmailField(max_length=80)
    subject = models.CharField(max_length=80)
    message = models.TextField(max_length=1000)

    #moderations
    created_at = models.DateTimeField(auto_now=True,blank=True)


    def __str__(self):
        return self.name

class Team(models.Model):
    """
    Team model's team member's photos.
    """
    #information
    image = models.ImageField(upload_to='product_image',default='IMG.JPG')
    full_name =  models.CharField(max_length=100)
    

    def __str__(self):
        return self.full_name