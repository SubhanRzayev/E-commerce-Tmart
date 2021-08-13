from django.db.models import query
from core.models import *
from core.forms import ContactForm
from django.shortcuts import render
from products.models import Category,SortBy
from .forms import ContactForm
from django.views.generic import CreateView, TemplateView, ListView, CreateView
from django.contrib.auth.mixins import LoginRequiredMixin
from blog.models import  Tag, Blog, Comment
from core.filters import ProductFilter
from django.urls.base import reverse_lazy


class SearchView(TemplateView):
    model = Product
    template_name = 'results.html'
   
    
    
    def get_context_data(self, **kwargs):
        context = super(SearchView,self).get_context_data(**kwargs)
        query = self.request.GET.get('q')

        context['all_products'] = Product.objects.all().filter(title__icontains=query)
        context['all_blogs'] = Blog.objects.all().filter(title__icontains=query)
        
        return context



class AboutView(ListView):
    model = Category
    template_name = 'about.html'


class IndexView(ListView):
    model = Category
    template_name = 'index.html'
    success_url =reverse_lazy('core:index')


    def get(self, request, *args, **kwargs):
        self.object_list = self.get_queryset()
        product_list = Product.objects.all() 
        product_filter = ProductFilter(request.GET, queryset=product_list)
        print('here', self.model)
        context = {
            'filter': product_filter,
            'object': SortBy.objects.all(),
            'category_list': Category.objects.filter(category__isnull=True).filter(is_published=True),
            'sort_by': SortBy.objects.order_by('sortby')[0:10],
            'blog_posts': Blog.objects.filter(is_published=True).order_by('created_at')[:3],
        }
        return self.render_to_response(context)


class ContactView(LoginRequiredMixin, CreateView):
    model = Contact
    form_class = ContactForm
    template_name = 'contact.html'
    success_url = reverse_lazy("core:contact")


class TeamView(ListView):
    model = Team
    template_name = 'team.html'
    success_url = 'core:team'
    catagories = Team.objects.all()

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['team_members'] = Team.objects.all()
        return context  