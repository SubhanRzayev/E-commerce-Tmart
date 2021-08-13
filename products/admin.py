from django.contrib import admin
from django.contrib.admin.filters import ListFilter
from django.contrib.admin.helpers import AdminErrorList
from django.db import models
from products.models import Product, Image, Category, Review, Color, SortBy, Size, Price, City
from modeltranslation.admin import TranslationAdmin
from django.forms import SelectMultiple


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('title', 'price', 'discount_price',  'slug' ,'cover_image', 'sale',  'is_published','updated_at', 'get_colors_color',)
    list_filter = ('title', 'price', 'sale', 'digital', 'sale_time', 'is_published', 'updated_at')
    search_fields = ('title','price', 'sale', 'sale_time')
    ordering = ('title', 'price', 'sale', 'sale_time', 'created_at','updated_at')
    formfield_overrides = {
        models.ManyToManyField: {'widget': SelectMultiple(attrs={'size':'50', 'style': 'height:200px;color:black;width:300px'})},
    }
    

    def get_colors_color(self, obj):
        if obj.colors:
            return ','.join(obj.colors.values_list('color', flat=True))
        else:
            return 'Not Available'

    get_colors_color.sort_description = 'Colors'


    fieldsets = (
        ('Information', {
            'fields': ('title', 'price', 'discount_price', 'digital','winter','spring','autumn','summer', 'slug' ,'video', 'cover_image', 'description','sale', 'sale_time', 'is_published',   )
        }),
        ('Relations', {
            'fields': ('colors', 'prices_range', 'sizes', 'sortsby',)
        }),
    )
    

@admin.register(Review)
class ReviewAdmin(admin.ModelAdmin):
    list_display = ('name','email','rate', 'message', 'is_published','created_at','updated_at')
    list_filter = ('name','is_published','created_at','updated_at')
    search_fields = ('name',)
    ordering = ('name','created_at','updated_at')


admin.site.register([Image,Color,SortBy,Size,Price,City])

class CategoryAdmin(TranslationAdmin):
   
    formfield_overrides = {
        models.ManyToManyField: {'widget': SelectMultiple(attrs={'size':'50', 'style': 'height:200px;color:black;width:300px'})},
    }
admin.site.register(Category,CategoryAdmin)     

