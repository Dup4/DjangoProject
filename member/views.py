from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_sameorigin
from django.contrib.auth.hashers import make_password, check_password
from member.models import User
from django.http import JsonResponse
from django.core.paginator import Paginator

'''
    URL
'''

'''
页面URL部分
'''

"""
Describe
    显示用户URL

Parameters:

 
Returns:
    渲染模板类 pages/member/list.html
 
Raises:

"""


@xframe_options_sameorigin
def list_page(request):
    return render(request, 'background/pages/member/list.html')


"""
Describe
    删除用户URL

Parameters:

 
Returns:
    渲染模板类 pages/member/del.html
 
Raises:

"""


@xframe_options_sameorigin
def delete(request):
    return render(request, 'background/pages/member/del.html')


"""
Describe
    新增用户URL

Parameters:

 
Returns:
    渲染模板类 pages/member/add.html
 
Raises:

"""


@xframe_options_sameorigin
def add(request):
    return render(request, 'background/pages/member/add.html')


"""
Describe
    修改用户URL
    
Parameters:

 
Returns:
    渲染模板类 pages/member/edit.html
 
Raises:

"""


@xframe_options_sameorigin
def edit(request):
    return render(request, 'background/pages/member/edit.html')


"""
Describe
    修改密码URL

Parameters:

 
Returns:
    渲染模板类 pages/member/password.html
 
Raises:

"""


@xframe_options_sameorigin
def password(request):
    return render(request, 'background/pages/member/password.html')


'''
接口API部分
'''

"""
Describe
    罗列member

method
    GET

Parameters:
    page    页数
    limit   每页个数
 
Returns:
    code    0 success 404 failed
    message
    count   数据条数
    data    数据
Raises:

"""


def list_member(request):
    data = {}
    try:
        page = request.GET.get('page')
        limit = request.GET.get('limit')
        ptr = Paginator(User.objects.filter(status=1), limit)
        article_list = []
        for user in ptr.page(page):
            res = {'id': user.id, 'name': user.name, 'address': user.address, 'date': user.create_time,
                   "email": user.email}
            if user.sex == 0:
                res['sex'] = "男"
            else:
                res['sex'] = "女"

            article_list.append(res)
        data['code'] = 0
        data['message'] = "获取成功"
        data['count'] = ptr.count
        data['data'] = article_list
    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = e.args
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


"""
Describe
    获取单个member

method
    GET

Parameters:
    id  用户id
 
Returns:
    code    0 success 404 failed
    message 信息
    data    数据
Raises:

"""


def get_one_member(request):
    data = {}
    try:
        query = User.objects.get(status=1, id=request.GET.get('id'))
        user = {'id': query.id, 'username': query.username, 'name': query.name, 'address': query.address,
                'date': query.create_time, "tel": query.tel,
                "email": query.email, "sex": query.sex}
        data['code'] = 0
        data['message'] = "获取成功"
        data['data'] = user
    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = e.args
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


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
    code    0 success 404 failed
    message 信息
 
Raises:

"""


def add_user(request):
    data = {}
    try:
        try:
            user = User.objects.get(status=1, username=request.POST.get("username"))

            data['code'] = 404
            data['message'] = "用户名重复"

        except Exception as e:
            print(e.args)

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

            data['code'] = 0
            data['message'] = "新增用户成功"

    except Exception as e:
        print(e.args)
        data['code'] = 404
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
    code    0 success 404 failed
    message 信息
 
Raises:

"""


def update_user(request):
    data = {}
    try:
        user = User.objects.get(status=1, id=request.POST.get("id"))

        user.name = request.POST.get("name")
        user.sex = request.POST.get("sex")
        user.tel = request.POST.get("tel")
        user.email = request.POST.get("email")
        user.address = request.POST.get("address")
        user.save()

        data['code'] = 0
        data['message'] = "修改成功"

    except Exception as e:
        print(e.args)
        data['code'] = 404
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
    code    0 success 404 failed
    message 信息
 
Raises:

"""


def change_password(request):
    data = {}
    try:
        user = User.objects.get(status=1, id=request.POST.get("id"))

        old_password = request.POST.get("old_password")
        new_password = request.POST.get("new_password")

        if check_password(old_password, user.password):
            user.password = make_password(new_password)
            user.save()
            data['code'] = 0
            data['message'] = "修改成功"
        else:
            data['code'] = 404
            data['message'] = "原密码不正确"

    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = "修改失败"

    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


"""
Describe
    删除用户API

Parameters:
    id  用户id

Returns:
    code    0 success 404 failed
    message 消息
 
Raises:

"""


def delete_user(request):
    data = {}
    try:
        user = User.objects.get(status=1, id=request.POST.get("id"))
        user.status = 0
        user.save()
        data['code'] = 0
        data['message'] = "删除成功"
    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = "删除失败"

    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


"""
Describe
    删除多个用户API

Parameters:
    id  用户id数组

Returns:
    code    0 success 404 failed
    message 消息
 
Raises:

"""


def delete_all_user(request):
    data = {}
    try:
        id_arr = request.POST.getlist('id')
        for user_id in id_arr:
            print(user_id)
            user = User.objects.get(id=user_id)
            user.status = 0
            user.save()
        data['code'] = 0
        data['message'] = "删除成功"
    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = "删除失败"

    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response
