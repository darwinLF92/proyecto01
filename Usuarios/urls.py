from django.urls import path
from . import views

app_name = 'Usuarios'

urlpatterns = [
path('users/', views.list_users, name='list_users'),
path('users/create/', views.create_user, name='create_user'),
path('users/edit/<int:user_id>/', views.edit_user, name='edit_user'),
path('users/delete/<int:user_id>/', views.delete_user, name='delete_user'),
]