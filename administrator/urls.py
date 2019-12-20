from django.urls import path
from . import views

urlpatterns = [
    # admin的管理员列表
    path('list/', views.list_admin),
    # admin的角色管理
    path('role/', views.role),
    # admin的权限分类
    path('cate/', views.cate),
    # admin的权限管理
    path('rule/', views.rule),
    # admin的添加管理员
    path('add/', views.add),
    # 用户登录
    path('login/', views.user_login),
    # admin修改界面
    path('edit/', views.edit),

    # 新增adminAPI
    path('addUser/', views.add_user),
]
