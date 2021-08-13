from django.urls import path
from .views import *
from . import views


app_name = 'blog'

urlpatterns = [
    path('blog/',BlogView.as_view(),name = 'blog'),
    path('blog-detail/<slug:slug>/',BlogDetailView.as_view(),name = 'blog_detail'),
    path('comment/reply/', ReplyPageView.as_view(), name="reply"),
     
]
