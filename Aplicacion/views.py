from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from .forms import UserLoginForm, UserRegisterForm

def home(request):
    return render(request, 'home.html')

def login_view(request):
    if request.method == 'POST':
        form = UserLoginForm(request.POST)
        if form.is_valid():
            user = authenticate(username=form.cleaned_data['username'],
                                password=form.cleaned_data['password'])
            if user:
                login(request, user)
                return redirect('Aplicacion:home')
    else:
        form = UserLoginForm()
    return render(request, 'login.html', {'form': form})

def logout_view(request):
    logout(request)
    return redirect('Aplicacion:login')

def register_view(request):
    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('Aplicacion:login')
    else:
        form = UserRegisterForm()
    return render(request, 'register.html', {'form': form})

