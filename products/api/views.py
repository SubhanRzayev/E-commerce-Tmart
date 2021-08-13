from rest_framework import generics
from accounts.tasks import send_confirmation_mail
from typing import ClassVar
from rest_framework.decorators import api_view
from django.http.response import Http404, JsonResponse
from products.models import Product, Category
from rest_framework.views import APIView    
from products.api.serializers import *
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import AllowAny, IsAuthenticatedOrReadOnly
from rest_framework.generics import ListAPIView, ListCreateAPIView

from order.models import *
from django.db.models import Q


class ProductsAPIView(APIView):
    def get(self, *args, **kwargs):
        product = Product.objects.all()
        serializer = ProductListSerializer(product, many=True, context={'request': self.request})
        return JsonResponse(data=serializer.data, safe=False)
    
    def post(self, *args, **kwargs):
        product_data = self.request.data
        serializer = ProductSerializer(data=product_data)
        serializer.is_valid(raise_exception=True)
        serializer.save() 
        return JsonResponse(data=serializer.data, safe=False, status=201)

    def put(self, request,pk, *args, **kwargs):
        product = self.get_object(filter(pk=kwargs.get('pk')))
        serializer = ProductSerializer(product, data=request.data)


class CategoriesAPIView(APIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    def get(self,*args, **kwargs):
        categories = Category.objects.all()
        serializers = CategoryListSerializer(categories,many = True,context = {'request':self.request})
        return JsonResponse(data = serializers.data,safe = False)

    def post(self, *args, **kwargs):
        category_data = self.request.data
        serializer =CategorySerializer(data =category_data)
        serializer.is_valid(raise_exception = True)
        serializer.save()
        return JsonResponse(data = serializer.data,safe =False,status = 201)



class CteagoryProdactListView(generics.ListAPIView):

    serializer_class = ProductSerializer
    queryset = Product.objects.all()
    
    def get_queryset(self):
        qs = super().get_queryset()
        price = self.request.query_params.get('price')
        return qs.filter(price__iexact=price)



class CategoryAPIView(APIView):

    def get(self, *args, **kwargs):
        category = Category.objects.filter(pk=kwargs.get('pk')).first()
        if not category:
            raise Http404
        serializer = CategorySerializer(category)
        return JsonResponse(data=serializer.data, safe=False)
    
    def put(self, request, *args, **kwargs):
        category = Category.objects.filter(pk=kwargs.get('pk')).first()
        serializer = CategorySerializer(category, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class ProductAPIView(APIView):
    # permission_classes = (IsAuthenticatedOrReadOnly)
    def get(self, *args, **kwargs):
        product = Product.objects.filter(pk=kwargs.get('pk')).first()
        if not product:
            raise Http404
        serializer = ProductListSerializer(product, context={'request': self.request})
        return JsonResponse(data=serializer.data, safe=False)

    def put(self, *args, **kwargs):
        product = Product.objects.filter(pk=kwargs.get('pk')).first()
        if not product:
            raise Http404
        serializer = ProductSerializer(data=self.request.data, instance=product , context={'request': self.request})
        serializer.is_valid(raise_exception=True)
        serializer.save() 
        return JsonResponse(data=serializer.data, safe=False)

    def patch(self, *args, **kwargs):
        product = Product.objects.filter(pk=kwargs.get('pk')).first()
        if not product:
            raise Http404
        serializer = ProductSerializer(data=self.request.data, partial=True ,instance=product , context={'request': self.request})
        serializer.is_valid(raise_exception=True)
        serializer.save() 
        return JsonResponse(data=serializer.data, safe=False)

    def delete(self, *args, **kwargs):
        product = Product.objects.filter(pk=kwargs.get('pk'))
        serializer = ProductListSerializer(product, many=True,)
        product.delete()
        return JsonResponse(serializer.data, safe=False)


class ProductFilterAllAPIView(APIView):

    def get(self, *args, **kwargs):
        all = Product.objects.all()
        serializer = ProductListSerializer(all, many=True, context={'request': self.request})

        return JsonResponse(data=serializer.data, safe=False)

class ProductFilterLatestAPIView(APIView):
    
    def get(self, *args, **kwargs):
        latest = Product.objects.order_by('-created_at')
        serializer = ProductListSerializer(latest, many=True, context={'request': self.request})

        return JsonResponse(data=serializer.data, safe=False)

class ProductFilterSaleAPIView(APIView):
    
    def get(self, *args, **kwargs):
        sale = Product.objects.filter(~Q(discount_price=0.00) | ~Q(sale=0))
        serializer = ProductListSerializer(sale, many=True, context={'request': self.request})

        return JsonResponse(data=serializer.data, safe=False)
