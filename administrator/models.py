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
    # 管理员性别 false 男 true 女
    sex = models.BooleanField()
    # 管理员电话 varchar(20)
    tel = models.CharField(max_length=20)
    # 管理员邮箱 varchar(255)
    email = models.CharField(max_length=255)
    # 管理员地址 varchar(255)
    address = models.CharField(max_length=255)
    # 管理员权限
    role = models.IntegerField()
    # 上级id
    superior = models.IntegerField()
    # 是否启用
    is_use = models.BooleanField()
    # 管理员创建时间
    create_time = models.DateField()
    # 管理员更新时间
    update_time = models.DateField()
    # 是否删除 软删除
    status = models.BooleanField()


class Role(models.Model):
    # 权限id
    id = models.AutoField(primary_key=True)
    # 权限介绍 varchar(255)
    describe = models.CharField(max_length=255)
    # 创建时间
    create_time = models.DateField()
    # 更新时间
    # update_time = models.DateField()
    # 是否删除 软删除
    status = models.BooleanField()
