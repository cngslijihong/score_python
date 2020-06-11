# -*- coding: UTF-8 -*-
from django.conf import settings
from django.conf.urls import include, url
import debug_toolbar
import xadmin

from django.contrib import admin
from django.urls import path
from app_score import views
urlpatterns = [
    path('',views.score_page,name='score_page'),
    path('xadmin/', xadmin.site.urls),
    path('routes/', views.routes,name='routes'),
    path('grades/', views.grades,name='grades'),
    path('classes/<int:grade_id>', views.classes,name='classes'),
    path('exams/<int:grade_id>', views.exams,name='exams'),
    path('courses/<int:grade_id>/<int:exam_id>', views.courses,name='courses'),

    path('scores/<int:grade_id>/<int:class_id>/<int:exam_id>', views.scores, name='scores'),
    path('stat_course/<int:grade_id>/<int:course_id>/<int:exam_id>', views.stat_course, name='stat_score'),
    path('stat_total/<int:grade_id>/<int:exam_id>', views.stat_total, name='stat_total'),

    path('ex_scores/<int:grade_id>/<int:class_id>/<int:exam_id>', views.ex_scores, name='ex_scores'),
    path('ex_stat_course/<int:grade_id>/<int:course_id>/<int:exam_id>', views.ex_stat_course, name='ex_stat_score'),
    path('ex_stat_total/<int:grade_id>/<int:exam_id>', views.ex_stat_total, name='ex_stat_total'),

    path('wx/',views.wechat,name='wx'),

    #path('score_page/', views.score_page, name='score_page'),
   ]
if settings.DEBUG:
  import debug_toolbar
  urlpatterns = [
    path('__debug__/', include(debug_toolbar.urls)),
  ] + urlpatterns
"""
if settings.DEBUG:
  import debug_toolbar
  urlpatterns = [
    url(r'^__debug__/', include(debug_toolbar.urls)),
  ] + urlpatterns
"""

