from django.shortcuts import render
from django.urls.base import reverse
from django.views.generic.detail import DetailView
from django.views.generic import ListView
from django.views.generic.edit import FormView
from products.models import *
from products.forms import ReviewForm
# from django.http import JsonResponse
from .filters import *
from order.views import *
from order.models import *

from django.shortcuts import render
import requests




class ProductDetailView(FormView,DetailView):
    form_class = ReviewForm
    model = Product
    template_name = 'product-details.html'
    success_url = reverse_lazy("products:shop")

    def form_valid(self, form):
        form.save()
        result = super().form_valid(form)
        return result

    def get_queryset(self):
        return super().get_queryset()

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['comments'] = Review.objects.filter(comment__isnull=True)
        context['object'] = Review.objects.filter(rate=0).order_by("?").first()
        return context





class ShopView(ListView):
    model = Product
    template_name = 'shop.html'
    success_url = 'product_detail'

    def get(self, request, *args, **kwargs):
        self.object_list = self.get_queryset()
        url = 'http://api.openweathermap.org/data/2.5/weather?q={}&units=imperial&appid=91239bdb1a8907a56ecff7cbd55e2ea4'
        city = 'Baku'

        cities = City.objects.all()

        weather_data = []

        for city in cities:
            r = requests.get(url.format(city)).json()
            city_weather = {
                'temperature' : r['main']['temp'],
                }
            Celsius = ((city_weather['temperature'] - 32) * 5) //9
            city_weather = {
                    'city' : city,
                    'temperature' : Celsius,
                    'description' : r['weather'][0]['description'],
                    'icon' : r['weather'][0]['icon'],
                    }

        
        weather_data.append(city_weather)

        if Celsius <= 10.00:
            print("winter")
            product_list = Product.objects.order_by('-winter')
        elif  Celsius <= 20.00:
            print("autumn")
            product_list = Product.objects.order_by('-autumn')
        elif Celsius <= 25.00:
            print("spring")
            product_list = Product.objects.order_by('-spring')
        elif Celsius <= 50.00:
            print("summer")
            product_list = Product.objects.order_by('-summer')
        else:
            product_list = Product.objects.all()

        context = {
            'object': SortBy.objects.all(),
            'weather_data': weather_data,
            'product_list':product_list,
        }
        return self.render_to_response(context)

    

    
