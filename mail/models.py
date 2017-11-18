from datetime import timezone

from django.db import models


# Create your models here.


class User(models.Model):
    class Meta:
        db_table = 'user'

    id = models.AutoField(max_length=11, db_column='UID', primary_key=True)
    userName = models.CharField(max_length=255, db_column='username', blank=False)
    password = models.CharField(max_length=255, db_column='password', blank=False)
    cid = models.IntegerField(db_column='CID', blank=True)
    addTime = models.DateTimeField(db_column='addTime', auto_now_add=True, editable=True)


class mailAddress(models.Model):
    id = models.AutoField(max_length=11, db_column='ID', primary_key=True)
    mailUserNmae = models.CharField(max_length=255, db_column='mailUserName', blank=True)
    mail = models.CharField(max_length=255, db_column='mail', blank=False)
    addTime = models.DateTimeField(db_column='addTime', auto_now_add=True, editable=True)
    updateTime = models.DateTimeField(db_column='updateTime', auto_now=True, null=True)

# 定时发送邮件内容
class mailContent(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)
    mailFrom = models.EmailField(db_column='from', null=True)
    mailTo = models.EmailField(db_column='to', null=True)
    mailSubject=models.CharField(db_column='subject',max_length=300,null=True)
    mailContent = models.TextField(db_column='Content', null=True)
    addTime=models.DateTimeField(db_column='addTime',null=True,auto_now_add=True)
    sendTime = models.DateTimeField(db_column='sendTime', null=True)
    sendTag = models.IntegerField(db_column='sendTag', null=True)
    runTime = models.DateTimeField(db_column='runTime', null=True)
