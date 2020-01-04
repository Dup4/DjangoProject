from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_sameorigin
from article.models import Article


def login(request):
    return render(request, 'background/login.html')


def index(request):
    if request.session.get('admin_username') is None:
        return HttpResponseRedirect('/login/')
    return render(request, 'background/index.html')


@xframe_options_sameorigin
def welcome(request):
    return render(request, 'background/welcome.html')


def home(request):
    return render(request, 'home.html')


def dengLu(request):
    return render(request, 'dengLu.html')


def picture(request):
    articles = Article.objects.filter(status=1, classify=4)
    hot_spots = Article.objects.filter(status=1).order_by('-id')[:5]
    data = {'articles': articles, 'hot_spots': hot_spots}
    return render(request, 'picture.html', data)


def renWu(request):
    articles = Article.objects.filter(status=1, classify=3)
    hot_spots = Article.objects.filter(status=1).order_by('-id')[:5]
    data = {'articles': articles, 'hot_spots': hot_spots}
    return render(request, 'renWu.html', data)


def xiaoYuan(request):
    articles = Article.objects.filter(status=1, classify=2)
    data = {'articles': articles}
    return render(request, 'xiaoYuan.html', data)


def xinWen(request):
    articles = Article.objects.filter(status=1, classify=1)
    data = {'articles': articles}
    return render(request, 'xinWen.html', data)


def article(request):
    return render(request, 'article.html')


# member urls
@xframe_options_sameorigin
def list_member(request):
    return render(request, 'background/pages/member/list.html')


@xframe_options_sameorigin
def echarts(request):
    return render(request, 'background/pages/echarts/echarts1.html')


@xframe_options_sameorigin
def personal_information(request):
    return render(request, 'background/personal_information.html')


def page_not_found(request, exception):
    return render(request, 'background/404.html')
