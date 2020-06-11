from django.contrib import admin
from app_score.models import Routes,Grades,Classes,Exams,Courses

admin.site.site_header = 'score page'
admin.site.site_title = 'score title'

class GradeConfig(admin.ModelAdmin):
     list_display = ['grade_name']  # list_display中的字段不能是ManyToManyField.列表中写的都是字段字符串.
     list_filter = ['grade_name']  # 过滤器的过滤条件,列表中写的都是字段字符串.
admin.site.register(Grades, GradeConfig)
class ClassConfig(admin.ModelAdmin):
       list_display = ['grade_id','class_id','class_name']
       list_filter = ['grade_id','class_id']

admin.site.register(Classes,ClassConfig)


#,Grades,Classes,Exams,Courses