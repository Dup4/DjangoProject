from django.shortcuts import render
from django.utils import timezone
from echarts.models import Visitors


def home(request):
    time_now = timezone.now()
    try:
        visitor = Visitors.objects.get(create_time=time_now)
        visitor.visitors += 1
        visitor.save()
    except Exception as e:
        visitor = Visitors()
        visitor.visitors = 1
        visitor.save()
    return render(request, 'home.html')
