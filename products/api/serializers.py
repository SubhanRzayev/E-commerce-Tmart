from django.db import models
from django.db.models import fields, manager
from django.http.response import FileResponse
from products.models import *
from rest_framework import request, serializers

from django.db.models import fields
from rest_framework import serializers
from products.models import Category

from order.models import *

class ColorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Color
        fields = (
            'color',
        )

class SortBySerializer(serializers.ModelSerializer):
    class Meta:
        model = SortBy
        fields = (
            'sortby',
        )

class SizeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Size
        fields = (
            'size',
        )

class PriceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Price
        fields = (
            'price',
        )

class ProductSerializer(serializers.ModelSerializer):
    discount_price = serializers.SerializerMethodField()

    class Meta:
        model = Product
        fields = (
            'title', 
            'price', 
            'discount_price',
            'cover_image', 
            'description',
            'video',
            'sale', 
            'sale_time', 
            'is_published',
            'prices_range',
            'sizes',
            'sortsby',
            'colors',
        )

    read_only_fields = ('is_active', 'is_staff')

    def get_discount_price(self, obj):
        if obj.sale != 0 and obj.discount_price == 0.00:
            return obj.price * (100 - obj.sale) // 100
        return obj.discount_price



class ProductListSerializer(ProductSerializer):
    colors = ColorSerializer(many=True)
    prices_range = PriceSerializer(many=True)
    sizes = SizeSerializer(many=True)
    sortsby = SortBySerializer(many=True)


class CategorySerializer(serializers.ModelSerializer):
    category = ProductSerializer()
    class Meta:
        model = Category
        fields = (
            'title',
            'category',
            'products',
            'image',
        )

class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = (
            'customer',
            'date_ordered',
            'complete',
            'transaction_id',
        )


class OrderItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderItem
        fields = (
            'product',
            'order',
            'quantity',
            'date_added',
        )


class OrderItemListSerializer(OrderItemSerializer):
    product = ProductSerializer(many=False)
    order = OrderSerializer(many=False)


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = (
            'id',
            'title',
            'image'
        )


class CategoryListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = (
            'id',
            'title',
            'image',
        )

    
