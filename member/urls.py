from django.urls import path
from . import views

urlpatterns = [
    # URL
    # 罗列人员
    path('list/', views.list_page),
    # 删除页面
    path('del/', views.delete),
    # 新增人员页面
    path('add/', views.add),
    # 编辑人员页面
    path('edit/', views.edit),
    # 修改密码界面
    path('password/', views.password),

    # API
    path('getOneMember/', views.get_one_member),
    path('listMember/', views.list_member),
    # 新增人员API
    path('addUser/', views.add_user),
    # 修改人员API
    path('updateUser/', views.update_user),
    # 修改密码API
    path('changePassword/', views.change_password),
    # 删除单个用户API
    path('delUser/', views.delete_user),
    # 删除多个用户API
    path('delAllUser/', views.delete_all_user),
]
