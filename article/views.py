import json

from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_sameorigin
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import Article
from django.core import serializers
from faker import Faker
from util import util
from django.core.paginator import Paginator

'''
generate article

for number in range(10):
    article = Article()
    fake = Faker(locale='zh_CN')
    article.title = fake.word()
    article.classify = 1
    article.content = fake.paragraph()
    article.save()
'''


# Create your views here.
@xframe_options_sameorigin
def list_page(request):
    return render(request, 'pages/article/list.html')


def list_article(request):
    data = {}
    try:
        page = request.GET.get('page')
        limit = request.GET.get('limit')
        ptr = Paginator(Article.objects.all(), limit)
        article_list = []
        for article in ptr.page(page):
            res = {'id': article.id, 'title': article.title, 'date': article.create_time, 'category': article.classify,
                   'recommend': article.is_recommend, 'top': article.is_top}
            article_list.append(res)
        data['code'] = 0
        data['message'] = "获取成功"
        data['count'] = ptr.count
        data['data'] = article_list
    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = e.args
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


def get_one_article(request):
    data = {}
    try:
        query = Article.objects.get(id=request.GET.get('id'))
        article = {'id': query.id, 'title': query.title, 'query': query.classify, 'content': query.content}
        data['code'] = 0
        data['message'] = "获取成功"
        data['data'] = article
    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = e.args
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


@xframe_options_sameorigin
def category(request):
    return render(request, 'pages/article/category.html')


@xframe_options_sameorigin
def add(request):
    return render(request, 'pages/article/add.html')


@xframe_options_sameorigin
def edit(request):
    return render(request, 'pages/article/edit.html')


@xframe_options_sameorigin
def category_add(request):
    return render(request, 'pages/article/category-add.html')


def update_article(request):
    data = {}
    try:
        print(request.POST.get('id'))
        article = Article.objects.get(id=request.POST.get('id'))

        article.title = request.POST.get('title')
        article.content = request.POST.get('content')
        article.classify = request.POST.get('classify')

        article.save()

        data['code'] = 0
        data['message'] = "修改成功"

    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = e.args
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


@csrf_exempt
def upload_image(request):
    data = {}
    try:

        file = request.FILES.get('file')
        file.name = util.generate_file_name() + '.' + file.name.split('.')[-1]
        print(file.name)
        print(file)
        import os
        from django.conf import settings
        filepath = os.path.join('media', file.name)
        print(filepath)
        f = open(filepath, 'wb')
        for i in file.chunks():
            f.write(i)
        f.close()
        data['code'] = 0
        data['message'] = 'success'
        content = {'src': '/' + filepath, 'title': file.name}
        data['data'] = content
    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = e.args
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


def add_article(request):
    data = {}
    try:
        article = Article()

        article.title = request.POST.get('title')
        article.content = request.POST.get('content')
        article.classify = request.POST.get('classify')

        # article.save()

        data['code'] = 0
        data['message'] = "插入成功"

    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = e.args

    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


def delete_article(request):
    data = {}
    try:
        article = Article.objects.get(id=request.POST.get('id'))

        article.status = 0

        article.save()

        data['code'] = 0
        data['message'] = '删除成功'

    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = e.args

    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


def delete_all_article(request):
    data = {}
    try:
        id_arr = request.POST.getlist('id')
        for article_id in id_arr:
            print(article_id)
            article = Article.objects.get(id=article_id)
            article.status = 0
            article.save()
        data['code'] = 0
        data['message'] = '删除成功'
    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = "删除失败"

    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


def recommend(request):
    data = {}
    try:
        article = Article.objects.get(id=request.POST.get('id'))
        article.is_recommend = not article.is_recommend
        article.save()
        data['code'] = 0
        data['message'] = "修改成功"
    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = "修改失败"
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


def top(request):
    data = {}
    try:
        article = Article.objects.get(id=request.POST.get('id'))
        article.is_top = not article.is_top
        article.save()
        data['code'] = 0
        data['message'] = "修改成功"
    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = "修改失败"
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response