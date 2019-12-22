from django.shortcuts import render
from django.http import JsonResponse
from .models import Visitors

from django.views.decorators.clickjacking import xframe_options_sameorigin

'''
页面URL部分
'''

"""
Describe
    数据页面页面URL

method
    GET


Parameters:

 
Returns:
    渲染模板类 pages/echarts/echarts1.html
 
Raises:

"""


# 允许 iframe方式打开
@xframe_options_sameorigin
def echarts(request):
    return render(request, 'pages/echarts/echarts1.html')


'''
API
'''

"""
Describe
    获取访客数据API

method
    GET

Parameters:
 
Returns:
    code    0 success 404 failed
    message 信息
    data    数据
 
Raises:

"""


def get_data(request):
    data = {}
    try:
        query = Visitors.objects.all().order_by("-id")[:7]
        vis_list = []
        for vis in query:
            res = {'date': vis.create_time, 'number': vis.visitors}
            vis_list.append(res)
        vis_list.reverse()
        data['code'] = 0
        data['message'] = "获取成功"
        data['data'] = vis_list
    except Exception as e:
        print(e.args)
        data['code'] = 404
        data['message'] = "获取失败"
    response = JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    return response
