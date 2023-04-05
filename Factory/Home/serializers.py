from rest_framework import serializers
from .models import *



class GenreSerializers(serializers.ModelSerializer):
    class Meta:
        model = GenreModel
        fields = "__all__"

class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProjectsModel
        fields = ("NAME", "IMAGE", "PID")
        
class projectInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = InformationModel
        fields = "__all__"

class MLModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = MachineLearningModel
        fields = "__all__"
        depth = 1

class DemoProjectsSerializer(serializers.ModelSerializer):
    class Meta:
        model = DemoModel
        fields = "__all__"
        

class BuildMLModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = BuildMLModel
        fields = "__all__"
        