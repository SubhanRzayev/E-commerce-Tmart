
from django.contrib import admin
from blog.models import Category, Blog, Comment, Tag

from django.forms import SelectMultiple
from django.db import models


class CommentInlineAdmin(admin.TabularInline):
    model = Comment

admin.site.register(Category)

@admin.register(Blog)
class BlogAdmin(admin.ModelAdmin):
    list_display = ('title','slug','author','cover_image' ,'description', 'is_published', 'created_at', 'update_at',)
    list_filter = ('title', 'is_published',)
    search_fields = ('title',) 
    formfield_overrides = {
        models.ManyToManyField: {'widget': SelectMultiple(attrs={'size':'50', 'style': 'height:200px;color:blue;width:300px'})},
    }


@admin.register(Comment)
class CommentAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'message','created_at','active')
    list_filter = ('name','message','created_at')
    search_fields = ('name','email',)
    inlines = (CommentInlineAdmin,)


@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    list_display = ('tag',)
