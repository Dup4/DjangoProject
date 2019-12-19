from django.shortcuts import render

# Create your views here.
from django.views.decorators.clickjacking import xframe_options_sameorigin


@xframe_options_sameorigin
def echarts(request):
    return render(request, 'pages/echarts/echarts1.html')