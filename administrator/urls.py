from django.urls import path
from . import views

urlpatterns = [
    # admin的管理员列表
    path('list/', views.list_page),
    # admin的角色管理
    path('role/', views.role),
    # admin的添加管理员
    path('add/', views.add),
    # 用户登录
    path('login/', views.user_login),
    # admin修改界面
    path('edit/', views.edit),
    # admin 角色添加
    path('roleAdd/', views.role_add),
    # admin 角色修改
    path('roleEdit/', views.role_edit),

    # 获取admin列表
    path('listAdmin/', views.list_admin),
    # 获取角色列表
    path('listRole/', views.list_role),
    # 获取单个admin
    path('getOneAdmin/', views.get_one_admin),
    # 新增adminAPI
    path('addUser/', views.add_user),
    # 新增角色API
    path('addRole/', views.add_role),
    # 更新adminAPI
    path('updateUser/', views.update_user),
    # 删除adminAPI
    path('delUser/', views.delete_user),
    # 删除多个adminAPI
    path('delAllUser/', views.delete_all_user),
]
