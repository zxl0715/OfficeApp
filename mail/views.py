from django.shortcuts import render

from mail import models
from django.shortcuts import redirect


# Create your views here.

def index(request):
    context = {}
    context['hello'] = 'hello world! 来自后台'
    if request.method == "POST":
        username = request.POST.get("inputUsername", None)
        password = request.POST.get("inputPassword", None)
        # print(username, password)
        # temp = {"user": username, "pwd": password}
        # models.User.objects.create(userName=username, password=password, cid=0)
        isExists = models.User.objects.get(userName=username, password=password)
        if isExists == True:
            return redirect('/main/')
        else:
            return render(request, "index.html", {"status": "用户名或密码错误！"})


        # user_list = models.User.objects.all()
        # return render(request, "index.html", {"data": user_list})
    return render(request, "index.html")
