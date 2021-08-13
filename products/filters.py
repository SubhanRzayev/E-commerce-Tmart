from django.db.models import fields
import django_filters
from products.models import *
from django import forms


class ProductFilter(django_filters.FilterSet):
    sortsby = django_filters.ModelMultipleChoiceFilter(queryset=SortBy.objects.all(),
        widget=forms.CheckboxSelectMultiple)

    class Meta:
        model = Product
        fields = ['sortsby']