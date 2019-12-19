from django.urls import path

from django.views import static
from django.conf import settings
from django.conf.urls import url
from . import view

urlpatterns = [
    path('login/', view.login),
    path('index/', view.index),
    path('welcome/', view.welcome),
    # member
    path('member/list/', view.list_member),

# /echarts/echarts1
    path('echarts/echarts1', view.echarts),
    url(r'^static/(?P<path>.*)$', static.serve,
        {'document_root': settings.STATIC_ROOT}, name='static'),
]
