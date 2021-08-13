from django.db import models
from django.db.models.fields.files import ImageField
from django.utils import timezone
from django.contrib.auth import get_user_model
from django.utils.html import TRAILING_PUNCTUATION_CHARS
from django.core.validators import MaxLengthValidator, MinLengthValidator
from django.utils.translation import gettext_lazy as _
from django.urls import reverse_lazy
# from accounts.models import User
User = get_user_model()

class Product(models.Model):
    """
    Product model's save all products main info
    """
    #relation
    prices_range = models.ManyToManyField('Price', db_index=True, related_name='+', blank=True)
    sizes = models.ManyToManyField('Size', db_index=True, blank=True, related_name='product_size')
    sortsby = models.ManyToManyField('SortBy', db_index=True, blank=True, related_name='product_filter')
    colors = models.ManyToManyField('Color', db_index=True, related_name='product_color')
    

    #information
    title = models.CharField(max_length=50)
    slug = models.CharField(max_length=300, verbose_name='Slug', unique=True, blank=True, null=True)
    price = models.DecimalField(default = 0.00, max_digits=7, decimal_places=2)
    quantity = models.IntegerField(default=1, null=True, blank=True)
    discount_price = models.DecimalField(default = 0.00, max_digits=7, decimal_places=2, blank=True, null=True)
    winter = models.BooleanField(default=False)
    spring = models.BooleanField(default=False)
    autumn = models.BooleanField(default=False)
    summer = models.BooleanField(default=False)
    cover_image =  models.ImageField(upload_to='product_cover_image')
    description = models.TextField(max_length=1000,default='Write your text')
    stock = models.BooleanField(default=False,)
    digital = models.BooleanField(default=False,null=True, blank=True)
    video = models.TextField(max_length=200, default='https:something/something/...') 
    sale = models.IntegerField(default=0, blank=True, null=True)
    sale_time = models.DateField(blank=True, null=True)
    is_published = models.BooleanField(default=False, blank=True)

    #moderations
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True, null=True, blank=True)

    def __str__(self):
        return self.title
    
    # def save(self, *args, **kwargs):
    #     self.slug = self.title
    #     return super(Product, self).save(**kwargs)


    @property
    def new_price(self):
        if self.discount_price:
            return self.discount_price
        elif self.discount_price == 0.00 and self.sale != 0:
            return self.price * (100 - self.sale) // 100
        elif self.discount_price == 0.00 and self.sale == 0:
            return self.price * self.quantity
        else:
            return self.price

    @property
    def get_total(self):
        if self.discount_price:
            total = self.discount_price * self.quantity
            return total
        elif self.discount_price == 0.00 and self.sale != 0:
            x = self.price * (100 - self.sale) // 100
            return x * self.quantity
        elif self.discount_price == 0.00 and self.sale == 0:
            total = self.price * self.quantity
            return total
        # discount_price and sale 
        else:
            total = self.discount_price * self.quantity
            return total

   

    def get_absolute_url(self):
        return reverse_lazy('products:product_detail', kwargs={
            'slug': self.slug
        })


class Image(models.Model):
    """
    Image model's save 4 photos which one are left side.
    """
    #relation
    product = models.ForeignKey('Product',db_index=True, on_delete=models.CASCADE, null=True , blank=True, related_name='product_image')
    #information
    image = models.ImageField(upload_to='product_image',default='IMG.JPG')

    # if image:
    #     def __str__(self):
    #         return self.product


class Review(models.Model):
    """
    Review model's save all coments about product.
    """
    #relation
    product = models.ForeignKey('Product',db_index=True, on_delete=models.CASCADE, blank=True,null=True,related_name='review')
    comment = models.ForeignKey('self', db_index=True, related_name='comments', on_delete=models.CASCADE, blank=True,null=True)
    #information
    rate = models.IntegerField(default=0,blank=True,null=True)
    name = models.CharField(max_length=50)
    email = models.EmailField(max_length=80)
    message = models.TextField(max_length=500)
    is_published = models.BooleanField(default=False)

    #moderations
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(auto_now=True)

    # def __str__(self):
    #     return self.name
    
    def __str__(self):
        if self.comment:
            return f"{self.comment} > {self.name}"
        return self.name

    # def avarage_rating(self):
    #     b = list(self.rate.values_list('rate', flat=True))
    #     print(b)
    #     c = sum(b)/len(b)
    #     return c

    
    

    


class Category(models.Model):
    """
    Category model's save all products Catecogories and Sub-Catecories. 
    Ex: Men's Fashion, Women's Fashion, Electronics, Hot Sale, T-Shirt, Jeans...
    """
    #relation
    category = models.ForeignKey('self', db_index=True, blank=True, null=True,
                                       related_name='categories', on_delete=models.CASCADE)
    products = models.ManyToManyField('Product', db_index=True, default="Something",blank=True, related_name='product_categories')

    #information
    title = models.CharField(max_length=50)
    image = models.ImageField(upload_to='home_category_images',default='IMG.JPG',blank=True,null=True)
    is_published = models.BooleanField(default=False)
    
    #moderations
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


    class Meta:
        verbose_name = _('Category')
        verbose_name_plural = _('Categories')

    def __str__(self):
        if self.category:
            return f"{self.category.title} > {self.title}"
        return self.title

    

class Color(models.Model):
    """
    Color model's save all products colors. 
    Ex: Red, Yellow, Green...
    """
    #information
    color = models.CharField(max_length=50)
    is_published = models.BooleanField(default=False, blank=True)

    def __str__(self):
        return self.color


class SortBy(models.Model):
    """
    SortBy model's sorted by products to their categories.
    Ex: Default, Accessoires, Bags, Chair...
    """
    #information
    sortby = models.CharField(max_length=70)

    def __str__(self):
        return self.sortby

    class Meta:
        verbose_name = 'SortBy'
        verbose_name_plural = 'SortsBy'



class Size(models.Model):
    """
    Size model's save all products sizes. 
    Ex: S, M , L , 36, 37, 38...
    """
    #information
    size = models.TextField(max_length=50)


    def __str__(self):
        return self.size


class Price(models.Model):
    """
    Price model's save all products price range. 
    Ex: 0.00$ - 50.0$ , 50.00$ - 100.0$, 100.00$ - 150.0$ ...
    """
    #information
    price = models.CharField(max_length=50, default='0.00$ - 50.00$')

    def __str__(self):
        return self.price 


class City(models.Model):
    """
    City model's save all citys. 
    Ex: Baku...
    """
    #information
    city = models.CharField(max_length=100)

    def __str__(self):
        return self.city 
    
    class Meta:
        verbose_name_plural = 'cities'