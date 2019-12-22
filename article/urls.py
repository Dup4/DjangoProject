from django.urls import path
from . import views

urlpatterns = [
    # URL
    # article的文章列表
    path('list/', views.list_page),
    # article的文章分类
    path('category/', views.category),
    # article的修改页面
    path('edit/', views.edit),
    # article添加页面
    path('add/', views.add),

    # API
    path('listArticle/', views.list_article),
    path('show/', views.show_article),
    path('getOneArticle/', views.get_one_article),
    path('updateArticle/', views.update_article),
    path('delArticle/', views.delete_article),
    path('delAllArticle/', views.delete_all_article),
    path('addCategory/', views.category_add),
    path('recommend/', views.recommend),
    path('top/', views.top),
    path('uploadImage/', views.upload_image),

    path('addArticle/', views.add_article),
]
