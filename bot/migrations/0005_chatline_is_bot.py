# Generated by Django 2.1.4 on 2018-12-15 18:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('bot', '0004_auto_20181215_1120'),
    ]

    operations = [
        migrations.AddField(
            model_name='chatline',
            name='is_bot',
            field=models.BooleanField(default=False),
        ),
    ]