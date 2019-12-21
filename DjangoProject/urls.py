from django.urls import path, include

from django.views import static
from django.conf import settings
from django.conf.urls import url
from . import view
from django.contrib import admin
from django.views.static import serve
from .settings import MEDIA_ROOT

urlpatterns = [
    # normal url
    path('login/', view.login),
    path('index/', view.index),
    path('welcome/', view.welcome),

    # member url
    path('member/', include('member.urls')),

    # article url
    path('article/', include('article.urls')),

    # admin url
    path('admin/', include('administrator.urls')),

    # /echarts url
    path('echarts/', include('echarts.urls')),

    # static url
    url(r'^static/(?P<path>.*)$', static.serve,
        {'document_root': settings.STATIC_ROOT}, name='static'),
    # media url
    url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT})
]
