from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from .models import Visitors

# Create your views here.
from django.views.decorators.clickjacking import xframe_options_sameorigin


@xframe_options_sameorigin
def echarts(request):
    return render(request, 'pages/echarts/echarts1.html')


def get_data(request):
    data = {}
    try:
        query = Visitors.objects.all().order_by("-id")[:7]
        vis_list = []
        for vis in query:
            print(vis.create_time)
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
