from django.urls import path
from . import views

urlpatterns = [
    # member
    path('list/', views.list_member),
    path('del/', views.del_member),
    path('addInput/', views.add_input),
    path('add/', views.add),
    path('edit/', views.edit),
    path('password/', views.password)
]
