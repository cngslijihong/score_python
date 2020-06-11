# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from django.utils.encoding import python_2_unicode_compatible

@python_2_unicode_compatible
class Route(models.Model):
    index = models.SmallIntegerField(primary_key=True)
    route = models.CharField(max_length=8)
    ex_route =  models.CharField(max_length=8)
    txt = models.CharField(max_length=8)

    def __str__(self):
        return self.txt

    class Meta:
        db_table = 'Route'
        managed = True

class Grade(models.Model):
    grade_id = models.SmallIntegerField(primary_key=True)
    name = models.CharField(verbose_name="年级名",max_length=16)
    current_exam = models.SmallIntegerField(verbose_name="当前考试")

    def __str__(self):
        return self.name

    class Meta:
        managed = True
        db_table = 'Grade'
        verbose_name = u"年级"
        verbose_name_plural = verbose_name

class MyClass(models.Model):
    grade = models.ForeignKey(Grade,to_field='grade_id',on_delete=models.CASCADE,verbose_name="年级")
    num = models.SmallIntegerField()
    name = models.CharField(verbose_name="班级名称",max_length=8)
    manager_name = models.CharField(verbose_name="班主任",max_length=8)

    class Meta:
        managed = True
        db_table = 'MyClass'
        verbose_name = u"班级信息"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Exam(models.Model):
    grade = models.ForeignKey(Grade,to_field='grade_id',on_delete=models.CASCADE,verbose_name="所属年级")
    num = models.SmallIntegerField(verbose_name="考试编号")
    name = models.CharField(verbose_name="考试名称",max_length=18)
    exam_type = models.SmallIntegerField()
    low_seg_course = models.IntegerField()
    low_seg_total = models.IntegerField()

    class Meta:
        managed = True
        db_table = 'Exam'
        verbose_name = u"考试信息"
        verbose_name_plural = verbose_name
    def __str__(self):
        return self.name

class Course(models.Model):
    exam = models.ForeignKey(Exam, on_delete=models.CASCADE, verbose_name="所属考试")
    num = models.SmallIntegerField(verbose_name="科目编号")
    name = models.CharField(verbose_name="科目",max_length=8)
    max = models.SmallIntegerField(verbose_name="满分")

    def __str__(self):
        return self.name

    class Meta:
        managed = True
        db_table = 'Course'
        verbose_name = u"课程信息"
        verbose_name_plural = verbose_name

class Student(models.Model):
    myClass = models.ForeignKey(MyClass, on_delete=models.CASCADE, verbose_name="所属班级")
    xh = models.IntegerField(verbose_name="编号")
    name = models.CharField(max_length=3, blank=True, null=True)
    stat = models.IntegerField(blank=True, null=True)
    xjh = models.CharField(max_length=11, blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        managed = True
        db_table = 'Student'
        verbose_name = u"学生信息"
        verbose_name_plural = verbose_name

class Teacher(models.Model):
    course = models.ForeignKey(Course, on_delete=models.CASCADE, verbose_name="所属科目")
    myClass = models.ForeignKey(MyClass, on_delete=models.CASCADE, verbose_name="所属班级")
    name = models.CharField(max_length=8)

    def __str__(self):
        return self.name

    class Meta:
        managed = True
        db_table = 'Teacher'
        verbose_name = u"教师信息"
        verbose_name_plural = verbose_name

class Score(models.Model):
    student = models.ForeignKey(Student,on_delete=models.CASCADE,blank=False, null=False,verbose_name="所属学生")
    course = models.ForeignKey(Course, on_delete=models.CASCADE, verbose_name="所属科目")
    cj = models.DecimalField(max_digits=5, decimal_places=1, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'Score'
#---------------------------------------------------
class Routes(models.Model):
    index = models.SmallIntegerField(primary_key=True)
    route = models.CharField(max_length=8)
    ex_route =  models.CharField(max_length=8)
    txt = models.CharField(max_length=8)

    class Meta:
        managed = False
        db_table = 'Routes'

class Classes(models.Model):
    grade_id = models.SmallIntegerField(primary_key=True)
    class_id = models.SmallIntegerField()
    class_name = models.CharField(verbose_name="班级名称",max_length=8)
    manager_name = models.CharField(verbose_name="班主任",max_length=8)

    class Meta:
        managed = False
        db_table = 'Classes'
        unique_together = (('grade_id', 'class_id'),)


class Courses(models.Model):
    grade_id = models.SmallIntegerField(primary_key=True)
    exam_id = models.SmallIntegerField()
    course_id = models.SmallIntegerField()
    course_name = models.CharField(verbose_name="科目",max_length=8)
    max = models.SmallIntegerField(verbose_name="满分")

    class Meta:
        managed = False
        db_table = 'Courses'
        unique_together = (('grade_id', 'exam_id', 'course_id'),)


class Exams(models.Model):
    grade_id = models.SmallIntegerField(primary_key=True)
    exam_id = models.SmallIntegerField()
    exam_title = models.CharField(verbose_name="考试名称",max_length=18)
    exam_type = models.SmallIntegerField()
    low_seg_course = models.IntegerField()
    low_seg_total = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'Exams'
        unique_together = (('grade_id', 'exam_id'),)


class Grades(models.Model):
    grade_id = models.SmallIntegerField(primary_key=True)
    grade_name = models.CharField(verbose_name="年级",max_length=8)
    current_exam = models.SmallIntegerField(verbose_name="当前考试")

    class Meta:
        managed = False
        db_table = 'Grades'

    #def toJSON(self):
     #   import json
     #  return json.dumps(dict([(attr, getattr(self, attr)) for attr in [f.name for f in self._meta.fields]]))


class Scores(models.Model):
    grade_id = models.SmallIntegerField(primary_key=True)
    class_id = models.SmallIntegerField()
    xh = models.SmallIntegerField()
    exam_id = models.SmallIntegerField()
    course_id = models.SmallIntegerField()
    cj = models.DecimalField(max_digits=5, decimal_places=1, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Scores'
        unique_together = (('grade_id', 'class_id', 'xh', 'exam_id', 'course_id'),)


class Students(models.Model):
    grade_id = models.IntegerField(blank=True, null=True)
    class_id = models.IntegerField(blank=True, null=True)
    xh = models.IntegerField(blank=True, null=True)
    name = models.CharField(max_length=3, blank=True, null=True)
    stat = models.IntegerField(blank=True, null=True)
    xjh = models.CharField(max_length=11, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Students'


class Teachers(models.Model):
    grade_id = models.SmallIntegerField(primary_key=True)
    exam_id = models.SmallIntegerField()
    course_id = models.SmallIntegerField()
    class_id = models.SmallIntegerField()
    teacher_name = models.CharField(max_length=8)

    class Meta:
        managed = False
        db_table = 'Teachers'
        unique_together = (('grade_id', 'exam_id', 'course_id', 'class_id'),)


class Jd(models.Model):
    class_id = models.IntegerField(blank=True, null=True)
    xh = models.IntegerField(blank=True, null=True)
    xm = models.CharField(max_length=6, blank=True, null=True)
    c1 = models.FloatField(blank=True, null=True)
    c2 = models.FloatField(blank=True, null=True)
    c3 = models.FloatField(blank=True, null=True)
    c4 = models.FloatField(blank=True, null=True)
    c5 = models.FloatField(blank=True, null=True)
    c6 = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'jd'
