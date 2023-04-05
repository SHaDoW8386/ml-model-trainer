from django.urls import path
from Home import views
from Home.machinelearning import *
from Authentication import views as authView

urlpatterns = [
    path('', authView.login, name='login'),
    path('home/', views.Home, name='Home'),
    path('build/', views.Build, name='Build'),
    path('upload/', views.Upload, name='upload'),
    path('demo/<str:Pro_NAME>',views.demo_project,name='Demo_Project'),
    path('demo/',views.demo_project,name='demo_project'),
    path('split/', TrainTestSplit, name='TTS'),
    path('database/', views.UserDatabase, name='DBMS'),
    path('aboutus/', views.AboutUs, name='ABOUT'),
    path('project/<str:Pro_ID>',views.anchor,name='Project'),
    path('fetures/', views.Output, name="features" ),
    path('database/', views.UserDatabase, name="SAVE" ),
    path('discard/', views.DiscardModel, name="DISCARD" ),
    path('download/', views.DownloadModel, name="DOWNLOAD" ),
    path('downloadfile/', views.DownloadFile, name="download_file" ),

    # Machine Learning Model
    
    path('M102/', MLLogisticRegression, name='M102'),
    path('M108/', MLRandomForestRegressor, name='M108'),
    path('M109/', MLRandomForestClassifier, name='M109'),
    path('M123/', MLDecisionTreeRegressor, name='M123'),
    path('M101/', MLLinearRegression, name='M101'),
    path('M122/', MLVotingRegressor, name='M122'),
    path('M121/', MLVotingClassifier, name='M121'),
    path('M120/', MLAdaBoostRegressor, name='M120'),
    path('M119/', MLAdaBoostClassifier, name='M119'),
    path('M103/', MLRidge, name='M103'),
    path('M104/', MLLasso, name='M104'),
    path('M115/', MLMultinomialNB, name='M115'),
    path('M117/', MLBernoulliNB, name='M117'),
    path('M116/', MLComplementNB, name='M116'),
    path('M114/', MLGaussianNB, name='M114'),

]
