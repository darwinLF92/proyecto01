from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required, permission_required
from .forms import UserRegisterForm, UserEditForm



@login_required
@permission_required('auth.view_user')
def list_users(request):
    users = User.objects.all()
    return render(request, 'list_users.html', {'users': users})


@login_required
@permission_required('auth.add_user')
def create_user(request):
    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('Usuarios:list_users')
    else:
        form = UserRegisterForm()
    return render(request, 'create_user.html', {'form': form})


@login_required
@permission_required('auth.change_user')
def edit_user(request, user_id):
    user_instance = get_object_or_404(User, id=user_id)
    if request.method == 'POST':
        form = UserEditForm(request.POST, instance=user_instance)  # Asumiendo que tienes un formulario UserEditForm
        if form.is_valid():
            form.save()
            return redirect('Usuarios:list_users')
    else:
        form = UserEditForm(instance=user_instance)
    return render(request, 'edit_user.html', {'form': form})


@login_required
@permission_required('auth.change_user')
def edit_user(request, user_id):
    user_instance = get_object_or_404(User, id=user_id)
    if request.method == 'POST':
        form = UserEditForm(request.POST, instance=user_instance)  # Asumiendo que tienes un formulario UserEditForm
        if form.is_valid():
            form.save()
            return redirect('Usuarios:list_users')
    else:
        form = UserEditForm(instance=user_instance)
    return render(request, 'edit_user.html', {'form': form})


@login_required
@permission_required('auth.delete_user')
def delete_user(request, user_id):
    user_instance = get_object_or_404(User, id=user_id)
    if request.method == 'POST':
        user_instance.delete()
        return redirect('Usuarios:list_users')
    return render(request, 'delete_user_confirm.html', {'user': user_instance})
