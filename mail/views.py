from datetime import datetime, timedelta, timezone

from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist, MultipleObjectsReturned
from django.core.mail import send_mail
from django.http import HttpResponseRedirect, BadHeaderError, HttpResponse
from django.shortcuts import render
from django.contrib import auth
from django.template.loader import get_template

from mail import models
from .mailForm import SendEmail
from django.shortcuts import redirect
from mail.email_market import *
from mail.models import *
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
    send_result = True
    emailUser = None
    if request.method == "POST":
        # 创建一个表单实例并用来自请求的数据填充它:
        form = SendEmail(request.POST)
        # 检查是否有效:
        if form.is_valid():
            # subject = request.POST.get('subject', '')
            subject = form.cleaned_data['subject']
            message = form.cleaned_data['message']
            # cc_myself = form.cleaned_data['cc_myself']
            recipients = form.cleaned_data['recipients']

            # 发送邮件
            if subject and message and recipients:
                try:
                    try:
                        emailUser = userMailAddress.objects.get(userID=request.user.id, autoEmailTag=True)
                    except ObjectDoesNotExist:
                        print("Either the entry or blog doesn't exist.")
                        # except MultipleObjectsReturned:
                        #     print('多条记录满足get() 的查询条件!')

                    # 发送邮件
                    send_result = send_mail(subject, message, recipients, emailUser.email, emailUser.emailPassword,
                                            emailUser.emailHost, emailUser.emailPort)
                    if send_result == True:
                        # 保存发送内容
                        emailContent.objects.create(emailFrom=emailUser.email, emailTo=recipients,
                                                    emailSubject=subject, emailContent=message, sendTag=send_result,
                                                    sendTime=datetime.now(),
                                                    userID=emailUser.userID).save()
                except Exception as exc:  # 异常信息： http://help.163.com/09/1224/17/5RAJ4LMH00753VB8.html
                    return HttpResponse(exc)
            # return HttpResponse('Invalid header found.')
            # /return HttpResponseRedirect('/ok/')
            # return HttpResponse({'mes': 'ok'});
            return render(request, "email/wirte_email.html", {'msg': 'ok'})
        else:
            return HttpResponse('Make sure all fields are entered and valid.')

    else:  # 如果一个GET(或任何其他方法),我们将创建一个空白表单
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
