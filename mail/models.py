from datetime import timezone

from django.db import models


# Create your models here.


class User(models.Model):
    class Meta:
        db_table = 'user'

    id = models.AutoField(max_length=11, db_column='id', primary_key=True)
    userName = models.CharField(max_length=255, db_column='username', blank=False)
    password = models.CharField(max_length=255, db_column='password', blank=False)
    cid = models.IntegerField(db_column='CID', blank=True)
    addTime = models.DateTimeField(db_column='addTime', auto_now_add=True, editable=True)


class emailAddress(models.Model):
    id = models.AutoField(max_length=11, db_column='ID', primary_key=True)
    emailUserNmae = models.EmailField( db_column='emailUserName', blank=True)

    email = models.CharField(max_length=255, db_column='email', blank=False)
    addTime = models.DateTimeField(db_column='addTime', auto_now_add=True, editable=True)
    updateTime = models.DateTimeField(db_column='updateTime', auto_now=True, null=True)


# 用户邮箱地址
class userMailAddress(models.Model):
    id = models.AutoField(db_column='id', primary_key=True)
    userID = models.IntegerField(db_column='userID', blank=False, help_text='用户ID')
    email = models.EmailField(db_column='email', help_text='用户Emai地址')
    emailPassword = models.CharField(db_column='eamilPassword',max_length=255)
    emailHost=models.CharField(db_column='emailHost',max_length=50)
    emailPort=models.IntegerField(db_column='emailPort',blank=True)
    autoEmailTag = models.BooleanField(db_column='autoEmailTag', default=False, help_text='是否为默认邮箱地址')
    editTime = models.DateTimeField(db_column='editTime', auto_now=True, help_text='变更时间');
    emailIntervalTime=models.IntegerField(db_column='emailIntervalTime',blank=False,default=60,help_text='邮件定时发送间隔时间（S）')


# 定时发送邮件内容
class emailContent(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)
    userID = models.IntegerField(db_column='userID', blank=False, help_text='用户ID')
    emailFrom = models.EmailField(db_column='from', null=True)
    emailTo = models.EmailField(db_column='to', null=True)
    emailSubject = models.CharField(db_column='subject', max_length=300, null=True)
    emailContent = models.TextField(db_column='Content', null=True)
    addTime = models.DateTimeField(db_column='addTime', null=True, auto_now_add=True)
    sendTime = models.DateTimeField(db_column='sendTime', null=True)
    sendTag = models.IntegerField(db_column='sendTag', null=True)
    runTime = models.DateTimeField(db_column='runTime', null=True,verbose_name='后台运行时间')
    userID = models.IntegerField(db_column='userID', blank=False, help_text='用户ID')