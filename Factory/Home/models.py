from django.db import models
from Authentication.models import User

class GenreModel(models.Model):
    GID = models.CharField(primary_key=True,null=False, max_length=10)
    NAME = models.CharField(max_length=20, null=True)

    def __str__(self):
        return self.NAME

class ProjectsModel(models.Model):
    GID = models.ForeignKey("GenreModel", null=False, max_length=10, on_delete=models.CASCADE)
    PID = models.CharField(primary_key=True,null=False, max_length=10)
    NAME = models.CharField(max_length=50)
    IMAGE = models.ImageField(upload_to="Images",null = True)

    def __str__(self):
        return self.NAME

class InformationModel(models.Model):
    NAME = models.CharField(null=False, max_length=100)
    PID = models.ForeignKey("ProjectsModel", null=False, max_length=10, on_delete=models.CASCADE)
    TECHNOLOGY = models.JSONField(null=True)
    DATASET = models.JSONField(null=True)
    IMAGE = models.ImageField(upload_to="Images",null=True)
    INTRODUCTION = models.TextField(null=True)
    MODELS =  models.TextField(null=True)
    FEATURES = models.TextField(null=True)
    APPLICATION = models.TextField(null=True)

    def __str__(self):
        return self.NAME

class DemoModel(models.Model):
    # NAME = models.ForeignKey("InformationModel", on_delete=models.CASCADE, null=True)
    NAME = models.CharField(null=False,max_length=100)
    FEATURESMODEL = models.JSONField(null=True)
    def __str__(self):
        return str(self.NAME)

class BuildMLModel(models.Model):
    UID = models.ForeignKey(User, on_delete=models.CASCADE,null=True)
    BID = models.CharField(primary_key = True, null=False, max_length=10)
    TITLE = models.CharField(null=True, max_length=50)
    DATASET = models.FileField(null=True, upload_to="Dataset", max_length=100)
    TRAIN_X = models.FileField(null=True, upload_to="Dataset/Training", max_length=100)
    TEST_X = models.FileField(null=True, upload_to="Dataset/Testing", max_length=100)
    TRAIN_Y = models.FileField(null=True, upload_to="Dataset/Training", max_length=100)
    TEST_Y = models.FileField(null=True, upload_to="Dataset/Testing", max_length=100)
    T_ENCODER = models.FileField(null=True, upload_to="Dataset/Encoder", max_length=100)
    F_ENCODER = models.FileField(null=True, upload_to="Dataset/Encoder", max_length=100)
    TYPE = models.CharField(null=True, max_length=50)
    MODELID = models.CharField(null=True, max_length=10)
    MODEL = models.FileField(null=True, upload_to="Models", max_length=100)
    
    def __str__(self):
        return self.TITLE

class ParameterModel(models.Model):
    PARAMID = models.CharField(primary_key=True,null=False, max_length=50)
    PARAMNAME = models.CharField(max_length=225)
    DISCRIPTION = models.TextField(null=True, blank = True)
    DEFAULT_VALUE = models.CharField(null=True, blank = True, max_length=225)

    def __str__(self):
        return self.PARAMNAME

class MachineLearningModel(models.Model):

    MODEL_TYPE = (
            ("Classification", "Classification"),
            ("Regression", "Regression"),
        )
    MODELID = models.CharField(primary_key=True,null=False, max_length=50)
    MODELNAME= models.CharField(max_length=225, null=True, blank=True)
    TYPE = models.CharField(max_length=225, null=True, blank=True, choices=MODEL_TYPE)
    PARAMS = models.ManyToManyField(ParameterModel)

    def __str__(self):
        return self.MODELNAME

