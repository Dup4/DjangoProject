from django.urls import path
from . import views

urlpatterns = [
    # member
    path('list/', views.list_admin),
    path('role/', views.role),
    path('cate/', views.cate),
    path('rule/', views.rule),
]