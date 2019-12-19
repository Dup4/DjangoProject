from django.urls import path
from . import views

urlpatterns = [
    # article的文章列表
    path('list/', views.list_article),
    # article的文章分类
    path('category/', views.category),
    # article的添加分类
    path('edit/', views.edit),

    path('add/', views.add),

    path('addCategory/', views.category_add),
]