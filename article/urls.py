from django.urls import path
from . import views

urlpatterns = [
    # URL
    # article的文章列表
    path('list/', views.list_page),
    # article的修改页面
    path('edit/', views.edit),
    # article添加页面
    path('add/', views.add),
    # article显示页面
    path('show/', views.show_article),

    # API
    # 罗列文章
    path('listArticle/', views.list_article),
    # 获取单个文章
    path('getOneArticle/', views.get_one_article),
    # 更新文章
    path('updateArticle/', views.update_article),
    # 删除文章
    path('delArticle/', views.delete_article),
    # 删除多个文章
    path('delAllArticle/', views.delete_all_article),
    # 文章推荐
    path('recommend/', views.recommend),
    # 文章置顶
    path('top/', views.top),
    # 图片上传
    path('uploadImage/', views.upload_image),
    # 新增文章
    path('addArticle/', views.add_article),
]
