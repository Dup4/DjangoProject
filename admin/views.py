from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_sameorigin


# Create your views here.
# member urls
@xframe_options_sameorigin
def list_admin(request):
    return render(request, 'pages/admin/list.html')


@xframe_options_sameorigin
def role(request):
    return render(request, 'pages/admin/role.html')


@xframe_options_sameorigin
def cate(request):
    return render(request, 'pages/admin/cate.html')


@xframe_options_sameorigin
def rule(request):
    return render(request, 'pages/admin/rule.html')
