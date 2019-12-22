from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_sameorigin


def login(request):
    return render(request, 'login.html')


def index(request):
    return render(request, 'index.html')


@xframe_options_sameorigin
def welcome(request):
    return render(request, 'welcome.html')

def home(request):
    return render(request, 'home.html')


def dengLu(request):
    return render(request, 'dengLu.html')


# member urls
@xframe_options_sameorigin
def list_member(request):
    return render(request, 'pages/member/list.html')


@xframe_options_sameorigin
def echarts(request):
    return render(request, 'pages/echarts/echarts1.html')
