from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_sameorigin


# Create your views here.
# member urls
@xframe_options_sameorigin
def list_article(request):
    return render(request, 'pages/article/list.html')


@xframe_options_sameorigin
def category(request):
    return render(request, 'pages/article/category.html')


@xframe_options_sameorigin
def add(request):
    return render(request, 'pages/article/add.html')


@xframe_options_sameorigin
def edit(request):
    return render(request, 'pages/article/category-edit.html')


@xframe_options_sameorigin
def category_add(request):
    return render(request, 'pages/article/category-add.html')
