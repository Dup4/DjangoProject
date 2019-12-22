from django.db import models


# Create your models here.

class Visitors(models.Model):
    # id 自增
    id = models.AutoField(primary_key=True)
    # 访客量 int
    visitors = models.IntegerField()
    # 创建时间
    create_time = models.DateField(auto_now_add=True)
    # 更新时间
    update_time = models.DateField(auto_now=True)
    # 是否删除 软删除
    status = models.BooleanField(default=1)
