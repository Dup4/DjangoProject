from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_sameorigin
from django.contrib.auth.hashers import make_password, check_password
from member.models import User
from django.http import JsonResponse
from faker import Faker

'''
页面URL部分
'''

"""
Describe
    显示用户URL

Parameters:

 
Returns:
    status: 200 success 404 failed
    message
    user
    渲染模板类 pages/member/list.html
 
Raises:

"""


@xframe_options_sameorigin
def list_member(request):
    users = User.objects.all()
    data = {'status': 200, 'message': "获取成功", 'data': users}

    return render(request, 'pages/member/list.html', data)


"""
Describe
    删除用户URL

Parameters:

 
Returns:
    status: 200 success 404 failed
    message
    user
    渲染模板类 pages/member/del.html
 
Raises:

"""


@xframe_options_sameorigin
def delete(request):
    return render(request, 'pages/member/del.html')


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
    return render(request, 'pages/member/add.html')


"""
Describe
    修改用户URL
    
Parameters:

 
Returns:
    status: 200 success 404 failed
    message
    user
    渲染模板类 pages/member/edit.html
 
Raises:

"""


@xframe_options_sameorigin
def edit(request):
    return render(request, 'pages/member/edit.html')


"""
Describe
    修改密码URL

Parameters:

 
Returns:
    status: 200 success 404 failed
    message
    user
    渲染模板类 pages/member/password.html
 
Raises:

"""


@xframe_options_sameorigin
def password(request):
    return render(request, 'pages/member/password.html')


'''
接口API部分
'''

"""
Describe
    新增用户API

Parameters:
    username 用户名
    password 密码
    name     姓名
    sex      性别
    tel      电话
    email    邮箱
    address  地址
 
Returns:
    status: 200 success 404 failed
    message
 
Raises:

"""


def add_user(request):
    if request.method == 'POST':
        data = {}
        try:
            try:
                user = User.objects.get(username=request.POST.get("username"))

                data['status'] = 404
                data['message'] = "用户名重复"

            except Exception:

                user = User()
                user.username = request.POST.get("username")
                user.password = make_password(request.POST.get("password"))
                user.name = request.POST.get("name")
                user.sex = request.POST.get("sex")
                user.tel = request.POST.get("tel")
                user.email = request.POST.get("email")
                user.address = request.POST.get('address')
                user.is_use = True
                user.status = True
                user.save()

                data['status'] = 200
                data['message'] = "新增用户成功"

        except Exception:
            data['status'] = 404
            data['message'] = "服务器连接失败"

        response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})

        return response


"""
Describe
    更新用户API

Parameters:
    id       用户id
    name     姓名
    sex      性别
    tel      电话
    email    邮箱
    address  地址
 
Returns:
    status: 200 success 404 failed
    message
 
Raises:

"""


def update_user(request):
    if request.method == 'POST':
        data = {}
        try:
            user = User.objects.get(id=request.POST.get("id"))

            user.name = request.POST.get("name")
            user.sex = request.POST.get("sex")
            user.tel = request.POST.get("tel")
            user.email = request.POST.get("email")
            user.address = request.POST.get("address")
            user.save()

            data['status'] = 200
            data['message'] = "修改成功"

        except Exception:
            data['status'] = 404
            data['message'] = "修改失败"

        response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
        return response


"""
Describe
    更改密码API

Parameters:
    id           用户id
    old_password 原密码
    new_password 新密码 

Returns:
    status: 200 success 404 failed
    message
 
Raises:

"""


def change_password(request):
    if request.method == 'POST':
        data = {}
        try:
            user = User.objects.get(id=request.POST.get("id"))

            old_password = request.POST.get("old_password")
            new_password = request.POST.get("new_password")

            if check_password(old_password, user.password):
                user.password = make_password(new_password)
                user.save()
                data['status'] = 200
                data['message'] = "修改成功"
            else:
                data['status'] = 404
                data['message'] = "原密码不正确"

        except Exception:
            data['status'] = 404
            data['message'] = "修改失败"

        response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
        return response


"""
Describe
    删除用户API

Parameters:
    id           用户id

Returns:
    status: 200 success 404 failed
    message
 
Raises:

"""


def delete_user(request):
    if request.method == 'POST':
        data = {}
        try:
            user = User.objects.get(id=request.POST.get("id"))
            user.status = 0
            user.save()
            data['status'] = 200
            data['message'] = "删除成功"
        except Exception:
            data['status'] = 404
            data['message'] = "删除失败"

        response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
        return response


"""
Describe
    删除多个用户API

Parameters:
    id           用户id数组

Returns:
    status: 200 success 404 failed
    message
 
Raises:

"""


def delete_all_user(request):
    if request.method == 'POST':
        data = {}
        try:
            id_arr = request.POST.getlist('id')
            for user_id in id_arr:
                print(user_id)
                user = User.objects.get(id=user_id)
                user.status = 0
                user.save()
            data['status'] = 200
            data['message'] = "删除成功"
        except Exception:
            data['status'] = 404
            data['message'] = "删除失败"

        response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
        return response
