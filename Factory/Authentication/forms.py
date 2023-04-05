from django import forms
from .models import User
from phonenumber_field.formfields import PhoneNumberField

class loginForm(forms.Form):
    EMAIL = forms.EmailField(max_length =100 , label_suffix="",label="EMAIL")
    PASSWORD = forms.CharField(max_length = 70 , label_suffix="",widget=forms.PasswordInput,label="PASSWORD")

class SignupForm(forms.Form):
    USERNAME = forms.CharField(max_length = 70,label ="USERNAME",label_suffix="")
    MOBILE = PhoneNumberField(label = "MOBILE NO",label_suffix="")
    EMAIL = forms.CharField(max_length=100, label = "EMAIL",label_suffix="")
    PASSWORD = forms.CharField(label = "PASSWORD",label_suffix="",widget=forms.PasswordInput)
    CONFIRM_PASSWORD = forms.CharField(label="Confirm",label_suffix="",widget=forms.PasswordInput)

    def clean(self):
        try:
            cleaned_data = super().clean()
            valpwd = self.cleaned_data["PASSWORD"]
            valrpwd = self.cleaned_data["CONFIRM_PASSWORD"]
            if valpwd != valrpwd:
                raise forms.ValidationError('Password dose not match')
        except:
            pass