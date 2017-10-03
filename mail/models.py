from django.db import models


# Create your models here.

class User(models.Model):
    class Meta:
        db_table = 'user'

    id = models.AutoField(max_length=11, db_column='UID', primary_key=True)
    userName = models.CharField(max_length=255, db_column='username', blank=False)
    password = models.CharField(max_length=255, db_column='password', blank=False)
    cid = models.IntegerField(max_length=11, db_column='CID', blank=False)


class mialAddress(models.Model):
    id = models.AutoField(max_length=11, db_column='ID', primary_key=True)
    mialUserNmae = models.CharField(max_length=255, db_column='mailUserName', blank=True)
    mail = models.CharField(max_length=255, db_column='mail', blank=False)
