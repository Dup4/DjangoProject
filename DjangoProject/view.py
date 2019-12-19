from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_sameorigin


def login(request):
    return render(request, 'login.html')


def index(request):
    return render(request, 'index.html')


@xframe_options_sameorigin
def welcome(request):
    return render(request, 'welcome.html')
