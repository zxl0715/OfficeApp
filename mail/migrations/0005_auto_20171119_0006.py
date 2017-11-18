# Generated by Django 2.0a1 on 2017-11-18 16:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mail', '0004_auto_20171107_0035'),
    ]

    operations = [
        migrations.CreateModel(
            name='mialContent',
            fields=[
                ('id', models.AutoField(db_column='ID', primary_key=True, serialize=False)),
                ('mailFrom', models.EmailField(db_column='from', max_length=254, null=True)),
                ('mailTo', models.EmailField(db_column='to', max_length=254, null=True)),
                ('mailContent', models.TextField(db_column='Content', null=True)),
                ('addTime', models.DateTimeField(auto_now_add=True, db_column='addTime', null=True)),
                ('sendTime', models.DateTimeField(db_column='sendTime', null=True)),
                ('sendTag', models.IntegerField(db_column='sendTag', null=True)),
                ('runTime', models.DateTimeField(db_column='runTime', null=True)),
            ],
        ),
        migrations.RenameField(
            model_name='mialaddress',
            old_name='mialUserNmae',
            new_name='mailUserNmae',
        ),
    ]
