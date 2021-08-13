from blog import views
from django.urls import path
from core.views import *

app_name = 'core'

urlpatterns = [
    path("contact/", ContactView.as_view(), name="contact"),
    path("about/", AboutView.as_view(), name="about"),
    path("team/", TeamView.as_view(), name="team"),
    path("", IndexView.as_view(), name="index"),
    path("shop/s", SearchView.as_view(), name="search")

]
