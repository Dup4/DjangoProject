from django.conf.urls import url

from . import view

urlpatterns = [
    url('login', view.login),
    url('index', view.index),
]
