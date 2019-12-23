from django.db import models

# Create your models here.
from django.db import models


# Create your models here.

class User(models.Model):
    # 管理员id int 自增
    id = models.AutoField(primary_key=True)
    # 管理员用户名 varchar(255)
    username = models.CharField(max_length=255)
    # 管理员密码 varchar(255)
    password = models.CharField(max_length=255)
    # 管理员名字 varchar(255)
    name = models.CharField(max_length=255)
    # 管理员电话 varchar(20)
    tel = models.CharField(max_length=20)
    # 管理员邮箱 varchar(255)
    email = models.CharField(max_length=255)
    # 管理员角色 1 超级管理员
    role = models.IntegerField()
    # 上级id
    superior = models.IntegerField()
    # 创建时间
    create_time = models.DateField(auto_now_add=True)
    # 更新时间
    update_time = models.DateField(auto_now=True)
    # 是否删除 软删除
    status = models.BooleanField(default=1)


class Role(models.Model):
    # 角色id
    id = models.AutoField(primary_key=True)
    # 角色名字 varchar(255)
    name = models.CharField(max_length=255)
    # 是否拥有管理员操作权限
    admin_operation = models.BooleanField(default=0)
    # 是否拥有user操作权限
    user_operation = models.BooleanField()
    # 是否拥有article操作权限
    article_operation = models.BooleanField()
    # 介绍 varchar(255)
    describe = models.CharField(max_length=255)
    # 创建时间
    create_time = models.DateField(auto_now_add=True)
    # 更新时间
    update_time = models.DateField(auto_now=True)
    # 是否删除 软删除
    status = models.BooleanField(default=1)
