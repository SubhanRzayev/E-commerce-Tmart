from django.db import models
from django.db.models.deletion import CASCADE
from django.contrib.auth import get_user_model
from django.urls.base import reverse, reverse_lazy
from django.utils import timezone

User = get_user_model()

class Category(models.Model):
    """
    Category model's save all blogs catagories
    """
    #information
    category = models.CharField(max_length=50,default='All')

    class Meta:
        verbose_name = 'Category'
        verbose_name_plural = 'Categories'


    def __str__(self):
        return self.category

class Tag(models.Model):
    """
    Tag model's save Blog's tags.
    """
    #information
    tag = models.CharField(max_length=50)

    def __str__(self):
        return self.tag


class Blog(models.Model):
    #relation
    category = models.ManyToManyField('Category',db_index=True,)
    tags = models.ManyToManyField('Tag',db_index=True)
    author = models.ForeignKey(User,on_delete=models.CASCADE,related_name='blog_posts',blank=True,null=True)

    #information
    title = models.CharField(max_length=200)
    slug = models.CharField(max_length=300, verbose_name='Slug', unique=True, blank=True, null=True)
    cover_image = models.ImageField(upload_to='media/category_images/')
    description = models.TextField(max_length=500)
    is_published = models.BooleanField(default=False)

    #moderations
    created_at = models.DateTimeField(default=timezone.now)
    update_at = models.DateTimeField(auto_now=True)
   

    def __str__(self):
        return self.title


    def get_absolute_url(self):
        return reverse('blog:blog_detail',args=[self.slug])

    
    def get_comments(self):
        return self.comments.filter(parent=None).filter(active=True)
        


class Comment(models.Model):    
    #relation
    blog = models.ForeignKey('Blog', db_index=True,on_delete=models.CASCADE,related_name='comments',
                                                                null=True, blank=True)
    parent = models.ForeignKey('self',db_index=True, null=True, blank=True,
                                            related_name='replies', on_delete=models.CASCADE)

    #information
    name = models.CharField(max_length=40)
    email = models.EmailField(max_length=80)
    message = models.TextField(max_length=500)
    active = models.BooleanField(default=True)
    #moderations
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(auto_now=True)


    def __str__(self):
        return self.name

    def get_comments(self):
        return Comment.objects.filter(parent=self).filter(active=True)