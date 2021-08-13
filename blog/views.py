from django.http import request
from django.http.response import HttpResponseRedirect
from django.template.defaultfilters import title
from django.views.generic import ListView,DetailView
from django.views.generic.base import TemplateView
from blog.forms import CommentForm
from django.shortcuts import render,redirect,get_object_or_404
from .models import Blog,Comment,Tag,Category
from django.contrib import messages
from django.views.generic.edit import BaseCreateView, CreateView, FormMixin,ModelFormMixin
from django.urls import reverse

    
class BlogView(ListView):
    model = Blog
    template_name = 'blog.html'
    success_url = 'blog-detail'


class BlogDetailView(FormMixin,DetailView):
    model = Blog
    template_name = 'blog-details.html'
    form_class = CommentForm



    def get_context_data(self,**kwargs):
        context = super(BlogDetailView,self).get_context_data(**kwargs)
        context['blog'] = get_object_or_404(Blog, slug = self.kwargs['slug'])
        context['blogs'] = Blog.objects.filter(slug = id).first() 
        context["all_tags"] = Tag.objects.all()
        context["all_categories"] = Category.objects.all()
        context["all_post"] = Blog.objects.all()[:3]
        context['all_category_count'] = Blog.objects.filter(category__isnull=False).count()
        context["form"] = self.get_form()
        
        return context


    
    def post(self, request, **kwargs):
        self.object = self.get_object()
        form = self.get_form()
        
        if form.is_valid():
            form.save()
            return self.form_valid(form)
        else:
            return self.form_invalid(form)
        return super().post(request,  **kwargs)


    def form_valid(self, form):
        form.instance.blog=get_object_or_404(Blog, slug = self.kwargs['slug'])
        form.save()
        return super().form_valid(form)
        
            
    def get_success_url(self):
        return reverse("blog:blog_detail",kwargs={"slug":self.object.slug}) 
        
    

class ReplyPageView(CreateView,ModelFormMixin):
    model = Blog
    template_name = 'blog-details.html'
    form_class = CommentForm


    def form_valid(self,form):
        blog_id = self.request.POST.get('blog_id')  
        form.instance.blog=get_object_or_404(Blog, id = blog_id)

        parent_id = self.request.POST.get('parent')  
        blog_url = self.request.POST.get('blog_url')

        reply = form.save(commit=False)
        reply.blog = Blog.objects.get(id=blog_id)
        reply.parent = Comment.objects.get(id=parent_id)
        
        
        reply.save()
        return super().form_valid(form)
        

    
    
    def get_success_url(self):
        return reverse("blog:blog_detail", kwargs={"slug":self.object.blog.slug}) 



