from django.http import HttpResponse
from django.shortcuts import render
from .forms import loginForm, SignupForm
from django.http import HttpResponseRedirect
from .models import User

def assignUid():
    UserId= 'U' + str(int(list(User.objects.all().values())[-1]["UID"].split('U')[-1])+1)
    return UserId

def login(request):
    if request.method =="POST":
        fm = loginForm(request.POST)
        if fm.is_valid():
            UserData = User.objects.get(EMAIL = fm.cleaned_data['EMAIL'])
            if (UserData.EMAIL== fm.cleaned_data['EMAIL'] )and (UserData.PASSWORD == fm.cleaned_data['PASSWORD']):
                uid = UserData.UID
                name = UserData.USERNAME
                return HttpResponseRedirect(f"/home/?username={name}&uid={uid}")
    else:
        fm = loginForm()
    return render(request,"./login.html",context={"form":fm})

def signup(request):
    if request.method == "POST":
        fm = SignupForm(request.POST)
        if fm.is_valid():
            username = fm.cleaned_data['USERNAME']
            mobile = fm.cleaned_data['MOBILE']
            email = fm.cleaned_data["EMAIL"]
            paswd = fm.cleaned_data['PASSWORD']
            stu = User(UID = assignUid(),USERNAME =username,MOBILE = mobile,EMAIL = email, PASSWORD = paswd)
            stu.save()
            return HttpResponseRedirect('/auth/login')
            
    else:        
        fm = SignupForm()
    return render(request,"signup.html",context={"form":fm})