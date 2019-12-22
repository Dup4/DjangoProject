from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_sameorigin
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import Article
from util import util
from django.core.paginator import Paginator

'''
页面URL部分
'''

"""
Describe
    文章页面URL

method
    GET


Parameters:

 
Returns:
    code: 0 success 404 failed
    message
    渲染模板类 pages/article/list.html
 
Raises:

"""


# 允许 iframe方式打开
@xframe_options_sameorigin
def list_page(request):
    return render(request, 'pages/article/list.html')


"""
Describe
    显示单个文章URL

method
    GET


Parameters:

 
Returns:
    code: 0 success 404 failed
    message
    渲染模板类 pages/article/show.html
 
Raises:

"""


# 允许 iframe方式打开
@xframe_options_sameorigin
def show_article(request):
    return render(request, 'pages/article/show.html')


"""
Describe
    显示新增文章URL

method
    GET


Parameters:

 
Returns:
    code: 0 success 404 failed
    message
    渲染模板类 pages/article/add.html
 
Raises:

"""


# 允许 iframe方式打开
@xframe_options_sameorigin
def add(request):
    return render(request, 'pages/article/add.html')


"""
Describe
    显示新修改文章URL

method
    GET


Parameters:

 
Returns:
    code: 0 success 404 failed
    message
    渲染模板类 pages/article/edit.html
 
Raises:

"""


# 允许 iframe方式打开
@xframe_options_sameorigin
def edit(request):
    return render(request, 'pages/article/edit.html')


'''
    API
'''

"""
Describe
    获取文章API

method
    GET

Parameters:
    page    页码
    limit   每页条数
 
Returns:
    code    0 success 404 failed
    message 信息
    count   数据条数
    data    数据
 
Raises:

"""


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


"""
Describe
    获取单个文章API

method
    GET

Parameters:
    id  文章id
 
Returns:
    code    0 success 404 failed
    message 信息
    data    数据
 
Raises:

"""


def get_one_article(request):
    data = {}
    try:
        query = Article.objects.get(id=request.GET.get('id'))
        article = {'id': query.id, 'title': query.title, 'query': query.classify, 'classify': query.classify,
                   'content': query.content}
        data['code'] = 0
        data['message'] = "获取成功"
        data['data'] = article
    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = e.args
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


"""
Describe
    更新文章API

method
    POST

Parameters:
    id          文章id
    title       题目
    content     正文
    classify    分类
 
Returns:
    code    0 success 404 failed
    message 信息
 
Raises:

"""


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


"""
Describe
    上传图片API

method
    POST

Parameters:
    file    文件
 
Returns:
    code    0 success 404 failed
    message 信息
    data    {
        src     文件路径
        title   文件名
    }
 
Raises:

"""


# 取消csrf验证
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


"""
Describe
    新增文章API

method
    POST

Parameters:
    title       题目
    content     正文
    classify    分类
 
Returns:
    code    0 success 404 failed
    message 信息
 
Raises:

"""


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


"""
Describe
    删除文章API

method
    POST

Parameters:
    id          文章id
 
Returns:
    code    0 success 404 failed
    message 信息
 
Raises:

"""


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


"""
Describe
    删除多个文章API

method
    POST

Parameters:
    id          文章id数组
 
Returns:
    code    0 success 404 failed
    message 信息
 
Raises:

"""


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


"""
Describe
    修改推荐文章推荐信息API

method
    POST

Parameters:
    id          文章id
 
Returns:
    code    0 success 404 failed
    message 信息
 
Raises:

"""


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


"""
Describe
    修改文章置顶API

method
    POST

Parameters:
    id          文章id
 
Returns:
    code    0 success 404 failed
    message 信息
 
Raises:

"""


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