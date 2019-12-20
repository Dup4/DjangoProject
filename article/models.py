from django.db import models


# Create your models here.

class Article(models.Model):
    # id 主键
    id = models.AutoField(primary_key=True)
    # 标题 varchar(255)
    title = models.CharField(max_length=255)
    # 内容 text(5000)
    context = models.TextField(max_length=5000)
    # 分类 int
    classify = models.IntegerField()
    # 是否推荐
    is_recommend = models.BooleanField()
    # 是否置顶
    id_top = models.BooleanField()
    # 是否发布
    is_publish = models.BooleanField()
    # 创建时间
    create_time = models.DateField()
    # 更新时间
    update_time = models.DateField()
    # 是否删除 软删除
    status = models.BooleanField()


class Classify(models.Model):
    # id 主键
    id = models.AutoField(primary_key=True)
    # 父节点id
    superior = models.IntegerField()
    # 介绍 varchar(255)
    describe = models.CharField(max_length=255)
    # 创建时间
    create_time = models.DateField()
    # 更新时间
    update_time = models.DateField()
    # 是否删除 软删除
    status = models.BooleanField()
