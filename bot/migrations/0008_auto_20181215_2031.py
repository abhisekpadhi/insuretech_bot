# Generated by Django 2.1.4 on 2018-12-15 20:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('bot', '0007_auto_20181215_1952'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='status',
            field=models.TextField(null=True),
        ),
    ]
