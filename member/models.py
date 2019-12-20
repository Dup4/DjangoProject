from django.db import models


# Create your models here.

class User(models.Model):
    # 用户id int 自增
    id = models.AutoField(primary_key=True)
    # 用户用户名 varchar(255)
    username = models.CharField(max_length=255)
    # 用户密码 varchar(255)
    password = models.CharField(max_length=255)
    # 用户名字 varchar(63)
    name = models.CharField(max_length=63)
    # 用户性别 false 男 true 女
    sex = models.BooleanField()
    # 用户电话 varchar(20)
    tel = models.CharField(max_length=20)
    # 用户邮箱 varchar(127)
    email = models.CharField(max_length=255)
    # 用户地址 varchar(255)
    address = models.CharField(max_length=255)
    # 是否启用
    is_use = models.BooleanField()
    # 用户创建时间
    create_time = models.DateField(auto_now_add=True)
    # 用户更新时间
    update_time = models.DateField(auto_now=True)
    # 是否删除 软删除
    status = models.BooleanField()
