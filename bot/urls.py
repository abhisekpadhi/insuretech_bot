from django.conf.urls import include, url
from . import views
from bot.configs import *
from django.views.generic.base import RedirectView

urlpatterns = [
    url(r'^$', views.Home.as_view(), name='Home'),
]