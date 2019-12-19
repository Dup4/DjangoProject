from django.urls import path

from django.views import static
from django.conf import settings
from django.conf.urls import url
from . import view

urlpatterns = [
    path('login/', view.hello),
    url(r'^static/(?P<path>.*)$', static.serve,
        {'document_root': settings.STATIC_ROOT}, name='static'),
]
