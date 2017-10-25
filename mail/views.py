from django.shortcuts import render
from django.contrib import auth
from mail import models
from django.shortcuts import redirect


# Create your views here.

def login(request):
    context = {}
    isExists=object
    context['hello'] = 'hello world! 来自后台'
    if request.method == "POST":
        username = request.POST.get("inputUsername", None)
        password = request.POST.get("inputPassword", None)
        # print(username, password)
        # temp = {"user": username, "pwd": password}
        # models.User.objects.create(userName=username, password=password, cid=0)

        isExists = models.User.objects.filter(userName=username, password=password)
        # user = auth.authenticate(username=username, password=password)
        if isExists is not None:
            return redirect('/main')
        else:
            return render(request, "login.html", {"status": "用户名或密码错误！"})
            # user_list = models.User.objects.all()
            # return render(request, "login.html", {"data": user_list})
    return render(request, "login.html")


def main(request):
    return render(request, 'main.html')
