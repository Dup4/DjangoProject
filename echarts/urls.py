from django.urls import path
from . import views

urlpatterns = [
    # echart页面
    path('echarts1/', views.echarts),

    # echart数据
    path('getData/', views.get_data),
]
