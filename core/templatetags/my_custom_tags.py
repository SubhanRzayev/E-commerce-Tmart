from blog.models import Category
from django.template import Library

from core.models import *

register = Library()


@register.filter
def main_catagory(self):
    if self.category == None:
        return self.category


