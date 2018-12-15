from django.db import models
from django.core.validators import RegexValidator

# Create your models here.
class User(models.Model):
    email = models.EmailField()
    phone_regex = RegexValidator(regex=r'^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[6789]\d{9}$',
                                 message="Phone number must be entered in the format: "
                                         "'+917760601643'. Up to 13 digits allowed.")
    phone_number = models.CharField(validators=[phone_regex], max_length=17, blank=True)# validators should be a list
    created_at = models.DateTimeField(auto_now=True)
    permanent_addr = models.TextField(null=True)
    current_addr = models.TextField(null=True)
    aadhar_number = models.CharField(max_length=12)
    dl_number = models.CharField(max_length=15)
    birth_certificate_serial = models.CharField(max_length=1024)
    date_of_birth = models.DateTimeField()
    status = models.CharField(max_length=1000)

class TreeNode(models.Model):
    created_at = models.DateTimeField(auto_now=True)
    updated_at = models.DateTimeField(auto_now=True)
    ack_text = models.CharField(max_length=1024)
    action_template = models.CharField(max_length=1024)
    is_leaf = models.BooleanField(default=False)
    priority = models.BigIntegerField()
    prompt_text = models.TextField(null=False, blank=False)
    parent_node = models.BigIntegerField()
    title = models.CharField(max_length=1024)

class Chat(models.Model):
    status = models.CharField(max_length=1024)

class ChatLine(models.Model):
    chat = models.ForeignKey(
        'Chat',
        on_delete=models.CASCADE
    )
    user = models.ForeignKey(
        'User',
        on_delete=models.CASCADE
    )
    line_text = models.TextField()
    created_at = models.DateTimeField(auto_now=True)