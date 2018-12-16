from django.db import models
from django.core.validators import RegexValidator

class User(models.Model):
    email = models.EmailField(null=False)
    phone_regex = RegexValidator(regex=r'^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[6789]\d{9}$',
                                 message="Phone number must be entered in the format: "
                                         "'+917760601643'. Up to 13 digits allowed.")
    phone_number = models.CharField(
        validators=[phone_regex], max_length=17, blank=True, null=True)     #validators should be a list
    created_at = models.DateTimeField(auto_now=True)
    permanent_addr = models.TextField(null=True)
    current_addr = models.TextField(null=True)
    aadhar_number = models.CharField(max_length=12, null=True)
    dl_number = models.CharField(max_length=15, null=True)
    birth_certificate_serial = models.CharField(max_length=1024, null=True)
    date_of_birth = models.DateField(null=True)                             #YYYY-MM-DD
    status = models.TextField(null=True)

class TreeNode(models.Model):
    title = models.CharField(max_length=255, null=False)
    is_leaf = models.BooleanField(default=False)
    is_root = models.BooleanField(default=False)
    parent_node = models.BigIntegerField(null=True)
    prompt_text = models.TextField(null=True, blank=True)
    action_template = models.CharField(max_length=1024, null=True)
    created_at = models.DateTimeField(auto_now=True)
    ack_text = models.CharField(max_length=1024, null=True)                 #Reserved for future use
    priority = models.BigIntegerField(null=True)                            #Reserved for future use



class Chat(models.Model):
    status = models.CharField(max_length=1024)                              #Not necessary now, using status field of User
    user = models.ForeignKey(
        'User',
        on_delete=models.CASCADE
    )

class ChatLine(models.Model):
    chat = models.ForeignKey(
        'Chat',
        on_delete=models.CASCADE
    )
    line_text = models.TextField()
    is_bot = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now=True)
