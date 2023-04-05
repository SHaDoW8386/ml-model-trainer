from asyncio.windows_events import NULL
from django.db import models
from phonenumber_field.modelfields import PhoneNumberField


class User(models.Model):
    UID = models.CharField(primary_key = True, null=False, max_length=50)
    USERNAME = models.CharField(max_length = 20,unique=True, null=False)
    MOBILE = PhoneNumberField()
    EMAIL = models.EmailField(max_length=254, null = False)
    PASSWORD = models.CharField(max_length=30, null=False)
    