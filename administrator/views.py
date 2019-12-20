from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_sameorigin
from django.contrib.auth.hashers import make_password, check_password
from administrator.models import User
from django.http import JsonResponse
from faker import Faker

'''
页面URL部分
'''

"""
Describe
    显示管理员URL

Parameters:

 
Returns:
    status: 200 success 404 failed
    message
    user
    渲染模板类 pages/admin/list.html
 
Raises:

"""


@xframe_options_sameorigin
def list_admin(request):
    # for i in range(10):
    #     user = User()
    #     fake = Faker(locale='zh_CN')
    #     user.username = fake.user_name()
    #     user.password = make_password('123456')
    #     user.name = fake.name()
    #     user.sex = 0
    #     user.tel = fake.phone_number()
    #     user.email = fake.email()
    #     user.role = 1
    #     user.superior = 1
    #     user.save()
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


"""
Describe
    新增用户URL

Parameters:

 
Returns:
    status: 200 success 404 failed
    message
    user
    渲染模板类 pages/member/add.html
 
Raises:

"""


@xframe_options_sameorigin
def add(request):
    return render(request, 'pages/admin/add.html')


"""
Describe
    修改用户URL

Parameters:

 
Returns:
    status: 200 success 404 failed
    message
    user
    渲染模板类 pages/member/add.html
 
Raises:

"""


@xframe_options_sameorigin
def edit(request):
    return render(request, 'pages/admin/edit.html')


"""
Describe
    登录API

Parameters:
    username 用户名
    password 密码
 
Returns:
    status: 200 success 404 failed
    message
 
Raises:

"""


def user_login(request):
    if request.method == 'POST':
        data = {}
        try:

            user_name = request.POST.get('username')
            password = request.POST.get('password')

            user = User.objects.get(username=user_name)

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

        except Exception:
            data['status'] = 404
            data['message'] = "服务器请求失败"

        response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
        return response


def add_user(request):
    if request.method == 'POST':
        data = {}
        try:
            try:
                user = User.objects.get(username=request.POST.get('username'))
                data['status'] = 404
                data['message'] = "用户名已存在"
            except Exception:

                user = User()

                user.username = request.POST.get('username')
                user.name = request.POST.get('name')
                user.tel = request.POST.get('tel')
                user.email = request.POST.get('email')
                user.role = request.POST.get('role')
                user.password = make_password(request.POST.get('password'))

                user.save()

                data['status'] = 200
            data['message'] = "成功增加管理员"
        except Exception as e:
            data['status'] = 404
            data['message'] = "服务器请求失败"
        response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
        return response
