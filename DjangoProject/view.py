from django.shortcuts import render


def login(request):
    return render(request, 'background/login.html')


def index(request):
    return render(request, 'background/index.html')
