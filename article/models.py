from django.db import models


# Create your models here.

class Article(models.Model):
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255)
    context = models.TextField(max_length=5000)

