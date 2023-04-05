from django.contrib import admin

# Register your models here.
from .models import *

admin.site.register(GenreModel)
admin.site.register(ProjectsModel)
admin.site.register(InformationModel)
admin.site.register(BuildMLModel)

@admin.register(MachineLearningModel)
class MachineLearningModelAdmin(admin.ModelAdmin):
    list_display = ('MODELID','MODELNAME')

admin.site.register(ParameterModel)
admin.site.register(DemoModel)