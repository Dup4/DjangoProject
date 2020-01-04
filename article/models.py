from django.db import models


# Create your models here.

class Article(models.Model):
    # id 主键
    id = models.AutoField(primary_key=True)
    # 标题 varchar(255)
    title = models.CharField(max_length=255)
    # 内容 text(5000)
    content = models.TextField(max_length=5000)
    # 学院
    college = models.CharField(max_length=255)
    # 分类 int
    classify = models.IntegerField()
    # 封面url
    img_url = models.CharField(max_length=255, blank=True)
    # 是否推荐
    is_recommend = models.BooleanField(default=0)
    # 是否置顶
    is_top = models.BooleanField(default=0)
    # 创建时间
    create_time = models.DateField(auto_now_add=True)
    # 更新时间
    update_time = models.DateField(auto_now=True)
    # 是否删除 软删除
    status = models.BooleanField(default=1)


class Classify(models.Model):
    # id 主键
    id = models.AutoField(primary_key=True)
    # 分类名字
    title = models.CharField(max_length=255)
    # 介绍 varchar(255)
    describe = models.CharField(max_length=255)
    # 创建时间
    create_time = models.DateField(auto_now_add=True)
    # 更新时间
    update_time = models.DateField(auto_now=True)
    # 是否删除 软删除
    status = models.BooleanField(default=1)
