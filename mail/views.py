from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.contrib import auth
from django.template.loader import get_template

from mail import models
from .mailForm import SendEmail
from django.shortcuts import redirect

from django.contrib.auth.middleware import AuthenticationMiddleware


# Create your views here.

def login(request):
    context = {}
    isExists = {}
    context['hello'] = 'hello world! 来自后台'
    if request.method == "POST":
        username = request.POST.get("inputUsername", None)
        password = request.POST.get("inputPassword", None)
        # print(username, password)
        # temp = {"user": username, "pwd": password}
        # models.User.objects.create(userName=username, password=password, cid=0)

        # isExists = models.User.objects.filter(userName=username, password=password)
        # if isExists is not None :
        # admin/adminadmin  http://www.cnblogs.com/wumingxiaoyao/p/7266927.html
        user = auth.authenticate(username=username, password=password)
        if user is not None and user.is_active:
            auth.login(request, user)
            # return redirect('/main', )
            return HttpResponseRedirect("/main/")
        else:
            return render(request, "login.html", {"status": "用户名或密码错误！"})
            # user_list = models.User.objects.all()
            # return render(request, "login.html", {"data": user_list})
    return render(request, "login.html")


def logout(request):
    auth.logout(request)

    return redirect('/login')


# 加上这个装饰器就是限制必须登录才能执行这个函数 # 加上这个装饰器就是限制必须登录才能执行这个函数
@login_required
def main(request):
    username = request.COOKIES.get('username', '')
    sessionid = request.COOKIES.get('sessionid', '')
    if request.user.is_authenticated == True:
        print('已登陆！！')

        get_template('test.html')
    else:
        print('未登陆！')
    return render(request, 'main.html', {'username': username, 'sessionid': sessionid})


@login_required
def wirte_email(request):
    if request.method == "POST":
        form = SendEmail(request.POST)
        if form.is_valid():
            subject = form.cleaned_data['subject']
            message = form.cleaned_data['message']
            # sender = form.cleaned_data['sender']
            # cc_myself = form.cleaned_data['cc_myself']

            # send_mail(subject, message, sender, recipients)
            return HttpResponseRedirect('/ok/')
    else:
        form = SendEmail()
    return render(request, "email/wirte_email.html", {'form': form})
    # return render(request, 'wirte_email.html', {'username': username})
    # return render(request, "email/wirte_email.html")

# 发送邮件
def sendemail(request):
    if request.method == "POST":
        form = SendEmail(request.POST)
        if form.is_valid():
            return HttpResponseRedirect('/ok/')
    else:
        form = SendEmail()
    return render(request, "wirte_email.html/", {'form': form})
