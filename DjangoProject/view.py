from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_sameorigin
from article.models import Article
import echarts
from django.utils import timezone


def login(request):
    if request.session.get('admin_username') is not None:
        return HttpResponseRedirect('/index/')
    return render(request, 'background/login.html')


def index(request):
    if request.session.get('admin_username') is None:
        return HttpResponseRedirect('/login/')
    return render(request, 'background/index.html')


@xframe_options_sameorigin
def welcome(request):
    return render(request, 'background/welcome.html')


def dengLu(request):
    return render(request, 'dengLu.html')


def picture(request):
    articles = Article.objects.filter(status=1, classify=4)
    hot_spots = Article.objects.filter(status=1).order_by('-id')[:5]
    sideshow = Article.objects.filter(status=1, classify=4).order_by('-id')[:4]
    data = {'articles': articles, 'hot_spots': hot_spots, 'sideshow': sideshow}
    return render(request, 'picture.html', data)


def renWu(request):
    articles = Article.objects.filter(status=1, classify=3)
    hot_spots = Article.objects.filter(status=1).order_by('-id')[:5]
    data = {'articles': articles, 'hot_spots': hot_spots}
    return render(request, 'renWu.html', data)


def xiaoYuan(request):
    articles = Article.objects.filter(status=1, classify=2)
    hot_spots = Article.objects.filter(status=1).order_by('-id')[:5]
    data = {'articles': articles, 'hot_spots': hot_spots}
    return render(request, 'xiaoYuan.html', data)


def xiaoYuanGF(request):
    articles = Article.objects.filter(status=1, classify=2, college=1)
    hot_spots = Article.objects.filter(status=1).order_by('-id')[:5]
    data = {'articles': articles, 'hot_spots': hot_spots}
    return render(request, 'xiaoYuanGF.html', data)


def xiaoYuanJY(request):
    articles = Article.objects.filter(status=1, classify=2, college=2)
    hot_spots = Article.objects.filter(status=1).order_by('-id')[:5]
    data = {'articles': articles, 'hot_spots': hot_spots}
    return render(request, 'xiaoYuanJY.html', data)


def xiaoYuanLX(request):
    articles = Article.objects.filter(status=1, classify=2, college=3)
    hot_spots = Article.objects.filter(status=1).order_by('-id')[:5]
    data = {'articles': articles, 'hot_spots': hot_spots}
    return render(request, 'xiaoYuanLX.html', data)


def xiaoYuanSJR(request):
    articles = Article.objects.filter(status=1, classify=2, college=4)
    hot_spots = Article.objects.filter(status=1).order_by('-id')[:5]
    data = {'articles': articles, 'hot_spots': hot_spots}
    return render(request, 'xiaoYuanSJR.html', data)


def xinWen(request):
    articles = Article.objects.filter(status=1, classify=1)
    hot_spots = Article.objects.filter(status=1).order_by('-id')[:5]
    data = {'articles': articles, 'hot_spots': hot_spots}
    return render(request, 'xinWen.html', data)


def xinWenSXKD(request):
    articles = Article.objects.filter(status=1, classify=1)
    hot_spots = Article.objects.filter(status=1).order_by('-id')[:5]
    data = {'articles': articles, 'hot_spots': hot_spots}
    return render(request, 'xinWenSXKD.html', data)


def xinWenXSKY(request):
    articles = Article.objects.filter(status=1, classify=1)
    hot_spots = Article.objects.filter(status=1).order_by('-id')[:5]
    data = {'articles': articles, 'hot_spots': hot_spots}
    return render(request, 'xinWenXSKY.html', data)


def xinWenJYJS(request):
    articles = Article.objects.filter(status=1, classify=1)
    hot_spots = Article.objects.filter(status=1).order_by('-id')[:5]
    data = {'articles': articles, 'hot_spots': hot_spots}
    return render(request, 'xinWenJYJS.html', data)


def xinWenZSJY(request):
    articles = Article.objects.filter(status=1, classify=1)
    hot_spots = Article.objects.filter(status=1).order_by('-id')[:5]
    data = {'articles': articles, 'hot_spots': hot_spots}
    return render(request, 'xinWenZSJY.html', data)


def xinWenJLHZ(request):
    articles = Article.objects.filter(status=1, classify=1)
    hot_spots = Article.objects.filter(status=1).order_by('-id')[:5]
    data = {'articles': articles, 'hot_spots': hot_spots}
    return render(request, 'xinWenJLHZ.html', data)


def xinWenSHFW(request):
    articles = Article.objects.filter(status=1, classify=1)
    hot_spots = Article.objects.filter(status=1).order_by('-id')[:5]
    data = {'articles': articles, 'hot_spots': hot_spots}
    return render(request, 'xinWenSHFW.html', data)


def show(request, id):
    article = Article.objects.filter(id=id).first()
    article.page_view += 1
    article.save()
    hot_spots = Article.objects.filter(status=1).order_by('-id')[:5]
    data = {'article': article, 'hot_spots': hot_spots}
    return render(request, 'show.html', data)


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
