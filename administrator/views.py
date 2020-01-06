from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_sameorigin
from django.contrib.auth.hashers import make_password, check_password
from administrator.models import User, Role
from django.http import JsonResponse
from django.core.paginator import Paginator
from faker import Faker

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
    渲染模板类 pages/admin/list.html
 
Raises:

"""


@xframe_options_sameorigin
def list_page(request):
    return render(request, 'background/pages/admin/list.html')


"""
Describe
    新增用户URL

method
    GET

Parameters:

 
Returns:
    code: 0 success 404 failed
    message
    渲染模板类 pages/member/add.html
 
Raises:

"""


# 允许 iframe方式打开
@xframe_options_sameorigin
def add(request):
    return render(request, 'background/pages/admin/add.html')


"""
Describe
    修改用户URL
    
method
    GET


Parameters:

 
Returns:
    code: 0 success 404 failed
    message
    渲染模板类 pages/admin/edit.html
 
Raises:

"""


# 允许 iframe方式打开
@xframe_options_sameorigin
def edit(request):
    return render(request, 'background/pages/admin/edit.html')


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

        # 查询用户是否存在
        user = User.objects.get(username=user_name)

        if user is None:
            data['code'] = 404
            data['message'] = "用户名或密码错误"
        else:
            if check_password(password, user.password):
                request.session['admin_username'] = user_name
                request.session['admin_id'] = user.id
                if user.role == 1:
                    request.session['role'] = 1
                data['code'] = 0
                data['message'] = "登录成功"
            else:
                data['code'] = 404
                data['message'] = "用户名或密码错误"

    except Exception as e:
        print(e.args)
        data['code'] = 0
        data['message'] = "用户不存在"
    # 转化为Json
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
            # 查询用户名是否存在
            user = User.objects.get(status=1, username=request.POST.get('username'))
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
            user.superior = 0

            user.save()

            data['code'] = 0
            data['message'] = "新增管理员成功"

    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = "新增失败"
    # 转化为Json
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
        user = User.objects.get(status=1, id=request.POST.get('id'))

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
    # 转化为Json
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
        use = User.objects.get(status=1, id=request.POST.get("id"))

        use.status = 0

        use.save()

        data['code'] = 0
        data['message'] = "删除成功"

    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = "删除失败"
    # 转化为Json
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
            user = User.objects.get(status=1, id=user_id)
            user.status = 0

            user.save()

        data['code'] = 0
        data['message'] = "删除成功"

    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = "删除失败"
    # 转化为Json
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


"""
Describe
    罗列admin

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


def list_admin(request):
    data = {}
    try:
        page = request.GET.get('page')
        limit = request.GET.get('limit')

        # 利用Paginator分页
        ptr = Paginator(User.objects.filter(status=1), limit)

        user_list = []
        for user in ptr.page(page):
            res = {'id': user.id, 'name': user.name, 'tel': user.tel, 'date': user.create_time, "email": user.email,
                   'role': Role.objects.get(id=user.role).name}
            user_list.append(res)

        data['code'] = 0
        data['message'] = "获取成功"
        data['count'] = ptr.count
        data['data'] = user_list

    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = "获取失败"
    # 转化为Json
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


"""
Describe
    获取指定id的admin

method
    GET

Parameters:
    id  admin的id
 
Returns:
    code    0 success 404 failed
    message
    data    数据
Raises:

"""


def get_one_admin(request):
    data = {}
    try:
        query = User.objects.get(status=1, id=request.GET.get('id'))
        user = {'id': query.id, 'username': query.username, 'name': query.name, "tel": query.tel,
                "email": query.email, "role": query.role}
        data['code'] = 0
        data['message'] = "获取成功"
        data['data'] = user
    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = e.args
    # 转化为Json
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


'''
    Role部分
'''

"""
Describe
    显示管理员角色URL

method
    GET


Parameters:

 
Returns:
    渲染模板类 pages/admin/role.html
 
Raises:

"""


# 允许 iframe方式打开
@xframe_options_sameorigin
def role(request):
    return render(request, 'background/pages/admin/role.html')


"""
Describe
    显示管理员角色增加URL

method
    GET


Parameters:

 
Returns:
    渲染模板类 pages/admin/role-add.html
 
Raises:

"""


@xframe_options_sameorigin
def role_add(request):
    return render(request, 'background/pages/admin/role-add.html')


@xframe_options_sameorigin
def role_edit(request):
    return render(request, 'background/pages/admin/role-edit.html')


def list_role(request):
    data = {}
    try:
        page = request.GET.get('page')
        limit = request.GET.get('limit')

        # 利用Paginator分页
        ptr = Paginator(Role.objects.filter(status=1), limit)

        role_list = []
        for role in ptr.page(page):
            res = {'id': role.id, 'name': role.name, 'date': role.create_time,
                   "desc": role.describe}
            rule = ""
            if role.admin_operation:
                rule += "管理员列表，"
            if role.user_operation:
                rule += "用户列表,"
            if role.article_operation:
                rule += "文章列表，"
            rule = rule[:-1]
            print(rule)
            res['rule'] = rule
            role_list.append(res)

        data['code'] = 0
        data['message'] = "获取成功"
        data['count'] = ptr.count
        data['data'] = role_list

    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = "获取失败"
    # 转化为Json
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


"""
Describe
    删除管理员角色API

method
    POST

Parameters:
    id       用户id
 
Returns:
    code: 0 success 404 failed
    message
 
Raises:

"""


def delete_role(request):
    data = {}
    try:
        role = Role.objects.get(status=1, id=request.POST.get("id"))

        role.status = 0

        role.save()

        data['code'] = 0
        data['message'] = "删除成功"

    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = "删除失败"
    # 转化为Json
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


"""
Describe
    删除多个管理员角色API

method
    POST

Parameters:
    id       用户id数组
 
Returns:
    code: 0 success 404 failed
    message
 
Raises:

"""


def delete_all_role(request):
    data = {}
    try:
        ids = request.POST.getlist('id')
        for role_id in ids:
            role = Role.objects.get(id=role_id)
            role.status = 0

            role.save()

        data['code'] = 0
        data['message'] = "删除成功"

    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = "删除失败"
    # 转化为Json
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


def add_role(request):
    data = {}
    try:
        role = Role()

        role.name = request.POST.get('name')
        role.user_operation = request.POST.get('user_operation')
        role.article_operation = request.POST.get('article_operation')
        role.describe = request.POST.get('desc')

        role.save()

        data['code'] = 0
        data['message'] = "新增管理员成功"

    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = "新增失败"
    # 转化为Json
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


def get_all_role(request):
    data = {}
    try:
        role_list = []

        for role in Role.objects.filter(status=1):
            res = {'id': role.id, 'name': role.name}
            role_list.append(res)

        data['code'] = 0
        data['message'] = "获取成功"
        data['data'] = role_list
    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = '获取失败'

    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


def get_my(request):
    data = {}
    try:
        query = User.objects.get(username=request.session.get('admin_username'))

        user = {'id': query.id, 'username': query.username, 'name': query.name, "tel": query.tel,
                "email": query.email, "role": query.role}
        data['code'] = 0
        data['message'] = "获取成功"
        data['data'] = user

    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = e.args
    # 转化为Json
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


def update_my(request):
    data = {}
    try:
        user = User.objects.get(username=request.session.get('admin_username'))

        user.name = request.POST.get('name')
        user.tel = request.POST.get('tel')
        user.email = request.POST.get('email')

        user.save()

        data['code'] = 0
        data['message'] = "修改成功"

    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = e.args
    # 转化为Json
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response


def logout(request):
    data = {}
    try:
        request.session.clear()
        data['code'] = 0
        data['message'] = "注销成功"
    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = "注销失败"
        # 转化为Json
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response
