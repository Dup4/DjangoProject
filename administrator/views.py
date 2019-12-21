from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_sameorigin
from django.contrib.auth.hashers import make_password, check_password
from administrator.models import User
from django.http import JsonResponse
from django.core.paginator import Paginator
from faker import Faker

'''
generate administrator

for i in range(20):
    user = User()
    fake = Faker(locale='zh_CN')
    user.username = fake.user_name()
    if i == 0:
        user.username = 'admin'
    user.password = make_password('123456')
    user.name = fake.name()
    user.sex = 0
    user.tel = fake.phone_number()
    user.email = fake.email()
    user.role = 1
    user.superior = 1
    user.save()
'''

'''
页面URL部分
'''

"""
Describe
    显示管理员URL

method
    GET


Parameters:

 
Returns:
    code: 0 success 404 failed
    message
    user
    渲染模板类 pages/admin/list.html
 
Raises:

"""


@xframe_options_sameorigin
def list_page(request):
    for i in range(20):
        user = User()
        fake = Faker(locale='zh_CN')
        user.username = fake.user_name()
        if i == 0:
            user.username = 'admin'
        user.password = make_password('123456')
        user.name = fake.name()
        user.sex = 0
        user.tel = fake.phone_number()
        user.email = fake.email()
        user.role = 1
        user.superior = 1
        user.save()
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


"""
Describe
    新增用户URL

method
    GET

Parameters:

 
Returns:
    code: 0 success 404 failed
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
    
method
    GET


Parameters:

 
Returns:
    code: 0 success 404 failed
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
    
method
    GET

Parameters:
    username 用户名
    password 密码
 
Returns:
    code: 0 success 404 failed
    message
 
Raises:

"""


def user_login(request):
    data = {}
    try:

        user_name = request.POST.get('username')
        password = request.POST.get('password')

        user = User.objects.get(username=user_name)

        if user is None:
            data['code'] = 404
            data['message'] = "用户名或密码错误"
        else:
            if check_password(password, user.password):
                data['code'] = 0
                data['message'] = "登录成功"
            else:
                data['code'] = 0
                data['message'] = "用户名或密码错误"

    except Exception as e:
        print(e.args)
        data['code'] = 0
        data['message'] = "服务器请求失败"

    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


"""
Describe
    新增管理员API
    
method
    POST

Parameters:
    username 用户名
    password 密码
    name     姓名
    tel      电话
    email    邮箱
    role     角色
 
Returns:
    code: 0 success 404 failed
    message
 
Raises:

"""


def add_user(request):
    data = {}
    try:
        try:
            user = User.objects.get(username=request.POST.get('username'))
            data['code'] = 404
            data['message'] = "用户名已存在"
        except Exception as e:
            print(e.args)

            user = User()

            user.username = request.POST.get('username')
            user.name = request.POST.get('name')
            user.tel = request.POST.get('tel')
            user.email = request.POST.get('email')
            user.role = request.POST.get('role')
            user.password = make_password(request.POST.get('password'))

            user.save()

            data['code'] = 0
            data['message'] = "新增管理员成功"

    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = "新增失败"

    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


"""
Describe
    修改管理员API
    
method
    POST

Parameters:
    id       用户id
    name     姓名
    tel      电话
    email    邮箱
    role     角色
 
Returns:
    code: 0 success 404 failed
    message
 
Raises:

"""


def update_user(request):
    data = {}
    try:
        user = User.objects.get(id=request.POST.get('id'))
        user.name = request.POST.get('name')
        user.tel = request.POST.get('tel')
        user.email = request.POST.get('email')
        user.role = request.POST.get('role')

        user.save()

        data['code'] = 0
        data['message'] = "修改管理员成功"

    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = e.args
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


"""
Describe
    删除管理员API

method
    POST

Parameters:
    id       用户id
 
Returns:
    code: 0 success 404 failed
    message
 
Raises:

"""


def delete_user(request):
    data = {}
    try:
        use = User.objects.get(id=request.POST.get("id"))

        use.status = 0

        use.save()

        data['code'] = 0
        data['message'] = "删除成功"

    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = e.args
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


"""
Describe
    删除多个管理员API

method
    POST

Parameters:
    id       用户id数组
 
Returns:
    code: 0 success 404 failed
    message
 
Raises:

"""


def delete_all_user(request):
    data = {}
    try:
        ids = request.POST.getlist('id')
        for user_id in ids:
            user = User.objects.get(id=user_id)
            user.status = 0

            user.save()

        data['code'] = 0
        data['message'] = "删除成功"
    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = e.args
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


def list_admin(request):
    data = {}
    try:
        page = request.GET.get('page')
        limit = request.GET.get('limit')
        ptr = Paginator(User.objects.all(), limit)
        user_list = []
        for user in ptr.page(page):
            res = {'id': user.id, 'name': user.name, 'tel': user.tel, 'date': user.create_time,
                   "email": user.email, 'role': user.role}

            user_list.append(res)
        data['code'] = 0
        data['message'] = "获取成功"
        data['count'] = ptr.count
        data['data'] = user_list
    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = e.args
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


def get_one_admin(request):
    data = {}
    try:
        query = User.objects.get(id=request.GET.get('id'))
        user = {'id': query.id, 'username': query.username, 'name': query.name, 'address': query.address,
                "tel": query.tel,
                "email": query.email}
        data['code'] = 0
        data['message'] = "获取成功"
        data['data'] = user
    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = e.args
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response
