from __future__ import absolute_import
import xadmin
from xadmin import views
from .models import Route, Grade, MyClass, Exam, Course,Teacher,Student,Score
from xadmin.layout import Main, TabHolder, Tab, Fieldset, Row, Col, AppendedText, Side
from xadmin.plugins.inline import Inline
from xadmin.plugins.batch import BatchChangeAction

@xadmin.sites.register(views.website.IndexView)
class MainDashboard(object):
    widgets = [
        [
            {"type": "html", "title": "Test Widget",
             "content": "<h3> Welcome to Xadmin! </h3><p>Join Online Group: <br/>QQ Qun : 282936295</p>"}
        ],
        [
            {"type": "qbutton", "title": "Quick Start",
             "btns": [{"model": Route}, {"model": Grade}, {"title": "Google", "url": "http://www.google.com"}]},
            {"type": "addform", "model": MyClass},
        ]
    ]


@xadmin.sites.register(views.BaseAdminView)
class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


@xadmin.sites.register(views.CommAdminView)
class GlobalSetting(object):
    global_search_models = [Exam, Grade]
    global_models_icon = {
        Exam: "fa fa-laptop", Grade: "fa fa-cloud"
    }
    site_title = "xx运营管理系统"  # 设置站点标题
    site_footer = "xx科技有限公司"  # 设置站点的页脚
    menu_style = "accordion"  # 设置菜单折叠
#    menu_style = 'default'  # 'accordion'


class MaintainInline(object):
    model = MyClass
    extra = 1
    style = "accordion"


@xadmin.sites.register(Grade)
class GradeAdmin(object):
    list_display = ("grade_id","name", "current_exam")
    list_display_links = ("name",)



@xadmin.sites.register(Exam)
class ExamtAdmin(object):

    list_display = (
        "name","num", "exam_type", "low_seg_course", "low_seg_total",
    )
    list_display_links = ("name",)
    list_filter = ["grade",]
    ordering =["grade","num"]
    raw_id_fields = ("name",)

@xadmin.sites.register(MyClass)
class MyClassAdmin(object):
    list_display = ("grade","name", "manager_name")
    list_display_links = ("name",)
    ordering = ["grade", "num"]

    list_filter = ["grade","name"]
    search_fields = ["name"]

#class TeacherInline(object):
#    model = Teacher
#    extra = 0

@xadmin.sites.register(Course)
class CourseAdmin(object):
    list_display = ("exam","num","name", "max")
    list_display_links = ("name",)
    list_filter = ["exam"]
    ordering = ["exam", "num"]

    #inlines = [TeacherInline]

@xadmin.sites.register(Teacher)
class TeacherAdmin(object):
    list_display = ("course","myClass","name",)
    list_display_links = ("course","name",)
    list_filter = ["course","myClass"]
    ordering = ["course", "myClass"]


@xadmin.sites.register(Student)
class StudentAdmin(object):
    list_display = ("myClass","xh","name","stat","xjh")
    list_display_links = ("name",)
    list_filter = ["myClass"]
    ordering = ["myClass", "xh"]


#xadmin.sites.site.register(GradeAdmin)
#xadmin.sites.site.register(MyClassAdmin)
#xadmin.sites.site.register(ExamtAdmin)
#xadmin.sites.site.register(CourseAdmin)
#xadmin.sites.site.register(TeacherAdmin)
