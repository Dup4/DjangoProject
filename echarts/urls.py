from django.urls import path
from . import views

urlpatterns = [
    # member
    path('echarts1/', views.echarts),
]
