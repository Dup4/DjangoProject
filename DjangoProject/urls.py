from django.conf.urls import url

from django.views import static
from django.conf import settings
from django.conf.urls import url
from . import view

urlpatterns = [
    url('login', view.login),
    url('index', view.index),
    url(r'^static/(?P<path>.*)$', static.serve,
        {'document_root': settings.STATIC_ROOT}, name='static'),
]
