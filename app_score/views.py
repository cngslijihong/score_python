# Create your views here.
#coding:utf-8  
# -*- coding: UTF-8 -*-

from django.shortcuts import render
from django.http import JsonResponse
from wechatpy import parse_message, create_reply
from wechatpy.exceptions import InvalidSignatureException
from wechatpy.pay import logger
from wechatpy.replies import TextReply
from wechatpy.utils import check_signature
#import wx.wechat as wx_wechat

from app_score.dataInterface import *

def index(request):
    return render(request,'index.html')

def routes(request):
    return JsonResponse(routes_json(), safe=False)

def grades(request):
    return JsonResponse(grades_json(), safe=False)

def classes(request,grade_id):
    return JsonResponse(classes_json(grade_id), safe=False)

def exams(request,grade_id):
    return JsonResponse(exams_json(grade_id), safe=False)

def courses(request,grade_id,exam_id):
    return JsonResponse(courses_json(grade_id,exam_id), safe=False)

#@login_required
def scores(request,grade_id,class_id,exam_id):  #(request,grade_id,class_id,exam_id):
    args=[grade_id,class_id,exam_id]
    return JsonResponse(scores_json(args),safe=False)

def stat_course(request,grade_id,course_id,exam_id):
    args =[exam_id, grade_id, course_id]
    return JsonResponse(stat_course_json(args),safe=False)

def stat_total(request,grade_id,exam_id):
    args =[exam_id, grade_id]
    return JsonResponse(stat_total_json(args),safe=False)


#--------------下载 Excel-------------------
def ex_scores(request,grade_id,class_id,exam_id):
    args = [grade_id, class_id, exam_id]
    (title, desc, rows) = scores_data(args)
    return toExce(title, desc, rows)

def ex_stat_course(request,grade_id,course_id,exam_id):
    args = [exam_id, grade_id, course_id]
    (title, desc, rows) = stat_course_data(args)
    return toExce(title, desc, rows)

def ex_stat_total(request,grade_id,exam_id):
    args = [exam_id, grade_id]
    (title, desc, rows) = stat_total_data(args)
    return toExce(title, desc, rows)

#-----------------Page------------------
def score_page(request):
    return render(request, 'score_page.html', context={'title':'成绩库'})

#----------------Wechat-----------------
token = 'fan'
def wechat(request):
    # GET 方式用于微信公众平台绑定验证
    if request.method == 'GET':
        signature = request.GET.get('signature', '')
        timestamp = request.GET.get('timestamp', '')
        nonce = request.GET.get('nonce', '')
        echo_str = request.GET.get('echostr', '')
        try:
            check_signature(token, signature, timestamp, nonce)
        except InvalidSignatureException:
            echo_str = '错误的请求'
        response = HttpResponse(echo_str)
        return response

    elif request.method == 'POST':
        msg = parse_message(request.body)
        if msg.type == 'text':
            answer=query(msg.content) # TODO
            reply = create_reply(answer, msg)
        elif msg.type == 'image':
            reply = create_reply('这是条图片消息', msg)
        elif msg.type == 'voice':
            reply = create_reply('这是条语音消息', msg)
        else:
            reply = create_reply('这是条其他类型消息', msg)
        response = HttpResponse(reply.render(), content_type="application/xml")
        return response

'''
if msg.type == 'text':
            #获取文本内容
            content = msg.content
            try:
                reply = TextReply(content=content,message=msg)
                r_xml = reply.render()
                # 获取唯一标记用户的openid，下文介绍获取用户信息会用到
                openid = msg.source
                return HttpResponse(r_xml)
            except Exception as e:
                #自行处理
                pass
'''