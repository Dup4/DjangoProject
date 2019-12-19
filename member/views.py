from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_sameorigin


# Create your views here.
# member urls
@xframe_options_sameorigin
def list_member(request):
    return render(request, 'pages/member/list.html')


@xframe_options_sameorigin
def del_member(request):
    return render(request, 'pages/member/del.html')


@xframe_options_sameorigin
def add_input(request):
    return render(request, 'pages/member/addInput.html')
