from django.urls import path, include

from django.views import static
from django.conf import settings
from django.conf.urls import url
from . import view

urlpatterns = [
    # normal url
    path('login/', view.login),
    path('index/', view.index),
    path('welcome/', view.welcome),
    path('home/', view.home),
    path('dengLu/', view.dengLu),


    # member url
    path('member/', include('member.urls')),

    # article url
    path('article/', include('article.urls')),

    # admin url
    path('admin/', include('admin.urls')),

    # /echarts url
    path('echarts/', include('echarts.urls')),

    # static url
    url(r'^static/(?P<path>.*)$', static.serve,
        {'document_root': settings.STATIC_ROOT}, name='static'),
]
