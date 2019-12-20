from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_sameorigin
from django.contrib.auth.hashers import make_password, check_password
from administrator.models import User
from django.http import JsonResponse


# Create your views here.

@xframe_options_sameorigin
def list_admin(request):
    users = User.objects.all()
    data = {'status': 200, 'message': "获取成功", 'data': users}
    return render(request, 'pages/admin/list.html', data)


@xframe_options_sameorigin
def role(request):
    return render(request, 'pages/admin/role.html')


@xframe_options_sameorigin
def cate(request):
    return render(request, 'pages/admin/cate.html')


@xframe_options_sameorigin
def rule(request):
    return render(request, 'pages/admin/rule.html')


@xframe_options_sameorigin
def add(request):
    return render(request, 'pages/admin/add.html')


def user_login(request):
    if request.method == 'POST':
        user_name = request.POST.get('username')
        password = request.POST.get('password')
        user = User.objects.get(username=user_name)
        data = {}
        if user is None:
            data['status'] = 404
            data['message'] = "用户名或密码错误"
        else:
            if check_password(password, user.password):
                data['status'] = 200
                data['message'] = "登录成功"
            else:
                data['status'] = 404
                data['message'] = "用户名或密码错误"
        response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
        return response
