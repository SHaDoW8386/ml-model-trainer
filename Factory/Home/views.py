from django.shortcuts import render, HttpResponse, HttpResponseRedirect
from .serializers import *
from .models import *
from Authentication.models import *
import os
import pandas as pd
from sklearn.model_selection import train_test_split
import mimetypes
import os
from django.http.response import HttpResponse

def assignBid():
    try:
        BUILDID= 'B' + str(int(list(BuildMLModel.objects.all().values())[-1]["BID"].split('B')[-1])+1)
    except:
        BUILDID = "B101"
    print(BUILDID)
    return BUILDID

def Home(request):

    mainData = GenreSerializers(GenreModel.objects.all(), many=True).data
    main_dict = {}
    for i in mainData:
        s  = ProjectSerializer(ProjectsModel.objects.filter(GID = i['GID']), many=True).data
        main_dict[i['NAME']]=s
    try:
        username = request.GET.get('username',"USER")
        uid = request.GET.get('uid',None)
    except:
        username = "Username"
    # print(main_dict)
    return render(request, 'Home.html', context={"Projects": main_dict,"Username":username,"Uid":uid})

def Build(request):
    U_ID = request.GET.get('uid')
    modeldata = MachineLearningModel.objects.all()
    if U_ID is not None and U_ID != "":
        return render(request, 'Build/title.html', context={"models":modeldata, "uid":U_ID})
    else:
        return HttpResponseRedirect('/auth/login')

def Upload(request):
    if request.method == 'POST':
        title = request.POST['title']
        m_type = request.POST['m_type']
        modelid = request.POST['model']
        uid = User.objects.get(UID=request.POST['uid'])
        dataset = pd.read_csv(request.FILES['dataset'])
        try:
            data = BuildMLModel.objects.get(TITLE = title, MODELID = modelid)
            bid = data.BID
        except:
            bid = assignBid()
            MLModel = BuildMLModel(UID=uid,
                                BID=bid, 
                                TITLE=title,
                                DATASET=request.FILES['dataset'],
                                TYPE=m_type,
                                MODELID = modelid,
                                        )
            MLModel.save()
        tablehead = dataset.columns
        tablevalue = dataset.values
        return render(request, 'Build/ViewDataset.html', context={"tableHead":tablehead, "tableValue":tablevalue, "bid":bid})
    else:
        return render(request, 'Build/UploadDataset.html')


def DiscardModel(request):
    uid = request.POST['uid']
    bid = request.POST['bid']
    username = request.GET.get('useername')
    BuildMLModel.objects.get(BID = bid).delete()
    return HttpResponseRedirect(f"/build/?uid={uid}&username={username}")




def anchor(request,Pro_ID):
    info = projectInfoSerializer(InformationModel.objects.get(PID = Pro_ID)).data
    return render(request,'Info.html',context={"INFO":info})

def demo_project(request,Pro_NAME):
    print(Pro_NAME)
    if(Pro_NAME == "Music Player"):
        return HttpResponseRedirect('http://localhost:8001')
    if(Pro_NAME == "Chatbot"):
        return HttpResponseRedirect('http://localhost:8080')
    info = DemoProjectsSerializer(DemoModel.objects.get(NAME=Pro_NAME)).data
    return render(request,'demo.html',context={"INFO":info})


def DownloadModel(request):
    B_ID = request.GET.get("bid")
    print(B_ID)
    modelDetail = BuildMLModel.objects.get(BID = B_ID)
    return render(request, 'Downloads.html', context={'modelDetail':modelDetail})


def DownloadFile(request):
    file = request.GET.get('filepath')
    filename = file.split('/')[-1]
    BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    filepath = BASE_DIR + '\\staticfiles\\' + file
    try:
        path = open(filepath, 'r')
        mime_type, _ = mimetypes.guess_type(filepath)
        response = HttpResponse(path, content_type=mime_type)

    except:
        path = open(filepath, 'rb')
        mime_type, _ = mimetypes.guess_type(filepath)
        response = HttpResponse(path, content_type=mime_type)

    response['Content-Disposition'] = "attachment; filename=%s" % filename
    return response



def UserDatabase(request):
    U_ID = request.GET.get('uid')
    if U_ID is not None and U_ID != "":
        data = BuildMLModelSerializer(BuildMLModel.objects.filter(UID=U_ID), many=True).data
        User_data = User.objects.get(UID = U_ID)
        return render(request, 'Database.html', context = {'data': data, "Uid":U_ID, "Username":User_data.USERNAME})
    else:
        return HttpResponseRedirect('/auth/login')

def AboutUs(request):
    pass
def Output(request):
    if request.method == "POST":
        s = request.POST
        parameters = {}
        for i in request.POST:
            if i =="csrfmiddlewaretoken":
                continue
            parameters[i] = s[i]
        print(parameters)
        return HttpResponse("Okk Done")
