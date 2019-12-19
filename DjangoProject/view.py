from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_exempt


def login(request):
    return render(request, 'background/login.html')


def index(request):
    return render(request, 'background/index.html')


# 防止 X-Frame-Options 挟持保护
@xframe_options_exempt
def welcome(request):
    return render(request, 'background/welcome.html')
