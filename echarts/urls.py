from django.urls import path
from . import views

urlpatterns = [
    path('echarts1/', views.echarts),

    path('getData/', views.get_data),
]
