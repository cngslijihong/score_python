# Create your views here.
#coding:utf-8
# -*- coding: UTF-8 -*-
from math import ceil
from django.db import connection
from app_score.models import *
from django.forms.models import model_to_dict
from io import BytesIO
from django.utils.http import urlquote
from xlwt import *
from django.http import HttpResponse

def routes_json():
    return [model_to_dict(r) for r in Routes.objects.all()]

def grades_json():
    return [model_to_dict(r) for r in Grades.objects.all()]

def classes_json(grade_id):
    return [model_to_dict(r) for r in Classes.objects.filter(grade_id=grade_id)]

def exams_json(grade_id):
    return [model_to_dict(r) for r in Exams.objects.filter(grade_id=grade_id)]

def courses_json(grade_id,exam_id):
    return [model_to_dict(r) for r in Courses.objects.filter(grade_id=grade_id,exam_id=exam_id)]

def scores_json(args):     #(grade_id,class_id,exam_id)
    (title,desc,rows)=scores_data(args)
    dict_data=[dict(zip(desc, item)) for item in rows]
    return {"title":title,"data":dict_data}

#单科统计表To JSON
def stat_course_json(args):
    (title, desc, rows) = stat_course_data(args)
    fields_tup = tuple(desc)
    # 转化为字典 JSON
    dict_data=[dict(zip(fields_tup, item)) for item in rows]
    return {"title":title,"data":dict_data}

#总分统计表To JSON
def stat_total_json(args):
    (title, desc, rows) = stat_total_data(args)
    fields_tup = tuple(desc)
    # 转化为字典 JSON
    dict_data=[dict(zip(fields_tup, item)) for item in rows]
    return {"title":title,"data":dict_data}

#-------------数据预处理
def scores_data(args): #(grade_id,class_id,exam_id)
    cursor = connection.cursor()
    cursor.callproc('title_grade_class_exam', args)
    title = f"{cursor.fetchone()[0]}成绩表"
    cursor.close()
    cursor = connection.cursor()
    cursor.callproc('scores_list_by_grade_class_exam',args)
    rows = cursor.fetchall()
    desc = [item[0] for item in cursor.description]
    return title,desc,rows

#单科统计表--数据预处理
def stat_course_data(args): # args = [exam_id,grade_id,course_id]
    cursor = connection.cursor()
    cursor.callproc('title_grade_exam_course', args)
    title = f"{cursor.fetchone()[0]}单科统计表"
    cursor.close()
    cursor = connection.cursor()
    cursor.callproc('sp_stat_course',args)
    # fields = [item[0] for item in cursor.description]

    # 数字字段前加 "A"以避免前端动态表格字段顺序错乱
    fields=stringfyFields(cursor.description)
    rows = cursor.fetchall()
    # tuple to list
    list_rows=[list(item) for item in rows]
    # course_id>0 单科时,删除前两列
    if int(args[2])>0: # course_id
        del fields[0:2]
        for row in list_rows:
            del row[0:2]
    return title,fields,list_rows

#总分统计表--数据预处理
def stat_total_data(args):
    cursor = connection.cursor()
    cursor.callproc('title_grade_exam_course',args+[0]) #args3 = [exam_id, grade_id,0]
    title = f"{cursor.fetchone()[0]}总分统计表"
    cursor.close()
    cursor = connection.cursor()
    cursor.callproc('sp_stat_total',args)     #args = [exam_id,grade_id]
    # fields = [item[0] for item in cursor.description]

    # 数字字段前加 "A"以避免前端动态表格字段顺序错乱
    fields=stringfyFields(cursor.description)

    rows = cursor.fetchall()

    # tuple to list
    list_rows = [list(item) for item in rows]
    return title,fields,list_rows

# 数字字段前加 "A"以避免前端动态表格字段顺序错乱
def stringfyFields(flds):
    fields = []
    for item in flds:
        if item[0].isdigit():
            fields.append('A' + item[0])
        else:
            fields.append(item[0])
    return fields

def toExce(title, desc, list_obj):
    if list_obj:
        # 创建工作簿
        workBook = Workbook(encoding='utf-8')
        # 添加第一页数据表
        sheet = workBook.add_sheet(title)
        # 写入表头
        columnIndex = 0
        for column in desc:
            sheet.write(0, columnIndex, column)
            columnIndex=columnIndex+1
        # 在对应行列写入数据
        rowIndex = 1
        for row in list_obj:
            columnIndex = 0
            for col in row:
                sheet.write(rowIndex, columnIndex, col)
                columnIndex = columnIndex +1
            rowIndex=rowIndex+1

        # 实现下载
        output = BytesIO()
        workBook.save(output)
        output.seek(0)

        filename = urlquote(title)
        response = HttpResponse(output.getvalue(), content_type='application/vnd.ms-excel')
        response['Content-Disposition'] = "attachment;filename={0}.xls".format(filename)
        response.write(output.getvalue())
        return response

# 微信公众号接口
def query(txt):
    res=["编码--年级\r\n"]
    grades=Grades.objects.all()
    for g in grades:
        res.append("{0}--{1}\r\n".format(g.grade_id,g.grade_name))
    res.append("接下来请发送三位数字,得到对应年级的考试代码\r\n")
    return "".join(res)
