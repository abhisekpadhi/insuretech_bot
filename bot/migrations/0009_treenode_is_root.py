# Generated by Django 2.1.4 on 2018-12-15 21:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('bot', '0008_auto_20181215_2031'),
    ]

    operations = [
        migrations.AddField(
            model_name='treenode',
            name='is_root',
            field=models.BooleanField(default=False, unique=True),
        ),
    ]
