from django.urls import path
from . import views

urlpatterns = [
    # member
    path('list/', views.list_article),
    path('category/', views.category),
]