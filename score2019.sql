/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : 192.168.1.4:3306
 Source Schema         : score2019

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 23/02/2020 00:22:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Classes
-- ----------------------------
DROP TABLE IF EXISTS `Classes`;
CREATE TABLE `Classes`  (
  `grade_id` smallint(6) NOT NULL,
  `class_id` smallint(6) NOT NULL,
  `class_name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `manager_name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`grade_id`, `class_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Courses
-- ----------------------------
DROP TABLE IF EXISTS `Courses`;
CREATE TABLE `Courses`  (
  `grade_id` smallint(6) NOT NULL,
  `exam_id` smallint(6) NOT NULL,
  `course_id` smallint(6) NOT NULL,
  `course_name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `max` smallint(6) NOT NULL,
  PRIMARY KEY (`grade_id`, `exam_id`, `course_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Exams
-- ----------------------------
DROP TABLE IF EXISTS `Exams`;
CREATE TABLE `Exams`  (
  `grade_id` smallint(6) NOT NULL,
  `exam_id` smallint(6) NOT NULL,
  `exam_title` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `exam_type` smallint(6) NOT NULL,
  `low_seg_course` int(11) NOT NULL,
  `low_seg_total` int(11) NOT NULL,
  PRIMARY KEY (`grade_id`, `exam_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Grades
-- ----------------------------
DROP TABLE IF EXISTS `Grades`;
CREATE TABLE `Grades`  (
  `grade_id` smallint(6) NOT NULL,
  `grade_name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `current_exam` smallint(6) NOT NULL,
  PRIMARY KEY (`grade_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Routes
-- ----------------------------
DROP TABLE IF EXISTS `Routes`;
CREATE TABLE `Routes`  (
  `index` smallint(6) NOT NULL,
  `route` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ex_route` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `txt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`index`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Scores
-- ----------------------------
DROP TABLE IF EXISTS `Scores`;
CREATE TABLE `Scores`  (
  `grade_id` smallint(6) NOT NULL,
  `class_id` smallint(6) NOT NULL,
  `xh` smallint(6) NOT NULL,
  `exam_id` smallint(6) NOT NULL,
  `course_id` smallint(6) NOT NULL,
  `cj` decimal(5, 1) NULL DEFAULT 0.0,
  PRIMARY KEY (`grade_id`, `class_id`, `xh`, `exam_id`, `course_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for Students
-- ----------------------------
DROP TABLE IF EXISTS `Students`;
CREATE TABLE `Students`  (
  `grade_id` int(11) NULL DEFAULT NULL,
  `class_id` int(11) NULL DEFAULT NULL,
  `xh` int(11) NULL DEFAULT NULL,
  `name` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stat` tinyint(1) NULL DEFAULT NULL,
  `xjh` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Teachers
-- ----------------------------
DROP TABLE IF EXISTS `Teachers`;
CREATE TABLE `Teachers`  (
  `grade_id` smallint(6) NOT NULL,
  `exam_id` smallint(6) NOT NULL,
  `course_id` smallint(6) NOT NULL,
  `class_id` smallint(6) NOT NULL,
  `teacher_name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`grade_id`, `exam_id`, `course_id`, `class_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jd
-- ----------------------------
DROP TABLE IF EXISTS `jd`;
CREATE TABLE `jd`  (
  `class_id` int(11) NULL DEFAULT NULL,
  `xh` int(11) NULL DEFAULT NULL,
  `xm` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c1` double NULL DEFAULT NULL,
  `c2` double NULL DEFAULT NULL,
  `c3` double NULL DEFAULT NULL,
  `c4` double NULL DEFAULT NULL,
  `c5` double NULL DEFAULT NULL,
  `c6` double NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for avg
-- ----------------------------
DROP VIEW IF EXISTS `avg`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `avg` AS select `A`.`course_id` AS `course_id`,`A`.`class_id` AS `class_id`,`A`.`max` AS `max`,count(`A`.`cj`) AS `rs`,sum((case `A`.`cj` when 0 then 0 else 1 end)) AS `sk`,sum((case when (`A`.`cj` >= (0.6 * `A`.`max`)) then 1 else 0 end)) AS `jg`,sum((case when (`A`.`cj` >= (0.8 * `A`.`max`)) then 1 else 0 end)) AS `yx`,std((case `A`.`cj` when 0 then NULL else `A`.`cj` end)) AS `sdt`,avg((case `A`.`cj` when 0 then NULL else `A`.`cj` end)) AS `average`,max(`A`.`cj`) AS `topScore` from `score` `A` group by `A`.`course_id`,`A`.`class_id` with rollup;

-- ----------------------------
-- View structure for count
-- ----------------------------
DROP VIEW IF EXISTS `count`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `count` AS select `seg`.`course_id` AS `course_id`,`seg`.`class_id` AS `class_id`,count(if((`seg`.`seg` = 6),1,NULL)) AS `6`,count(if((`seg`.`seg` = 7),1,NULL)) AS `7`,count(if((`seg`.`seg` = 8),1,NULL)) AS `8`,count(if((`seg`.`seg` = 9),1,NULL)) AS `9` from `seg` group by `seg`.`course_id`,`seg`.`class_id` with rollup;

-- ----------------------------
-- View structure for score
-- ----------------------------
DROP VIEW IF EXISTS `score`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `score` AS select `SC`.`course_id` AS `course_id`,`SC`.`class_id` AS `class_id`,`C`.`max` AS `max`,`SC`.`cj` AS `cj` from ((`Scores` `SC` join `Students` `ST` on(((`SC`.`grade_id` = `ST`.`grade_id`) and (`SC`.`class_id` = `ST`.`class_id`) and (`SC`.`xh` = `ST`.`xh`)))) join `Courses` `C` on(((`ST`.`grade_id` = `C`.`grade_id`) and (`SC`.`course_id` = `C`.`course_id`) and (`SC`.`exam_id` = `C`.`exam_id`)))) where ((`ST`.`grade_id` = 162) and (`SC`.`exam_id` = 1) and (`ST`.`stat` = 1));

-- ----------------------------
-- View structure for seg
-- ----------------------------
DROP VIEW IF EXISTS `seg`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `seg` AS select `score`.`course_id` AS `course_id`,`score`.`class_id` AS `class_id`,cast((`score`.`cj` / 10) as signed) AS `seg` from `score`;

-- ----------------------------
-- Procedure structure for copy_course_teacher
-- ----------------------------
DROP PROCEDURE IF EXISTS `copy_course_teacher`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `copy_course_teacher`( IN GradeID tinyint, 
OUT Rows_Course int,
OUT Rows_teacher int)
    MODIFIES SQL DATA
BEGIN
SELECT max_exam_id = MAX (exam_id) from Exams WHERE grade_id = GradeID;
SELECT last_exam_id = MAX (exam_id) from Courses WHERE grade_id = GradeID;
IF last_exam_id < max_exam_id then 
	insert  Score.courses
	SELECT grade_id,last_exam_id+1 as exam_id, course_id,course_name,max
		FROM Courses WHERE (grade_id = GradeID) and (exam_id=last_exam_id);
		set Rows_Course = FOUND_ROWS();
END IF;
SELECT last_exam_id = MAX(exam_id) from Teachers WHERE grade_id = GradeID;
IF last_exam_id < max_exam_id then 
		insert  Score.teachers
		SELECT	grade_id,last_exam_id+1 as exam_id,course_id,class_id,teacher_name
		FROM Score.teachers WHERE (grade_id = GradeID) and (exam_id=last_exam_id);
	set  Rows_teacher=FOUND_ROWS();
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for scores_list_by_grade_class_exam
-- ----------------------------
DROP PROCEDURE IF EXISTS `scores_list_by_grade_class_exam`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `scores_list_by_grade_class_exam`(IN GradeID smallint, IN ClassID smallint, IN ExamID smallint)
    READS SQL DATA
BEGIN
set @grade_id = GradeID;
set @class_id = ClassID;
set @exam_id = ExamID;

SET @fields = NULL;
SET @zf = NULL;
SELECT
  GROUP_CONCAT(DISTINCT
    CONCAT(
      'MAX(IF(s.course_id = ''',
      c.course_id,
      ''', s.cj, 0)) AS ''',
      c.course_name, '\''
    )
  ) 
  INTO @fields
FROM Courses c where grade_id= @grade_id and exam_id = @exam_id;

select max(c.course_id) + 1 into @zf_id
FROM Courses c where grade_id= @grade_id and exam_id = @exam_id;

SET @zf =CONCAT(',MAX(IF(s.course_id =\'', @zf_id,  '\', s.cj, 0)) AS \'总分\'');

SET @sql=concat(@fields,@zf);
SET @sql = CONCAT('Select st.xh as 序号,st.name as 姓名,', @sql,
                        ' From Students st
                        Inner Join (
SELECT exam_id,grade_id,class_id,xh,course_id,cj FROM Scores where exam_id =@exam_id and grade_id=@grade_id and class_id=@class_id

union

SELECT exam_id,grade_id,class_id,xh,MAX(course_id)+1 as course_id,sum(cj)AS cj FROM Scores where exam_id =@exam_id and grade_id=@grade_id and class_id=@class_id

group by exam_id,grade_id,class_id,xh) AS s 
On st.grade_id = s.grade_id and  st.class_id = s.class_id and  st.xh = s.xh');

SET @sql = CONCAT(@sql, ' Group by st.grade_id,st.class_id,st.xh');

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for scores_list_by_grade_exam
-- ----------------------------
DROP PROCEDURE IF EXISTS `scores_list_by_grade_exam`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `scores_list_by_grade_exam`(IN GradeID smallint, IN ExamID smallint)
    READS SQL DATA
BEGIN
set @grade_id = GradeID;
set @exam_id = ExamID;

SET @fields = NULL;
SET @zf = NULL;
SELECT
  GROUP_CONCAT(DISTINCT
    CONCAT(
      'MAX(IF(s.course_id = ''',
      c.course_id,
      ''', s.cj, 0)) AS ''',
      c.course_name, '\''
    )
  ) 
  INTO @fields
FROM Courses c where grade_id= @grade_id and exam_id = @exam_id;

select max(c.course_id) + 1 into @zf_id
FROM Courses c where grade_id= @grade_id and exam_id = @exam_id;

SET @zf =CONCAT(',MAX(IF(s.course_id =\'', @zf_id,  '\', s.cj, 0)) AS 总分');

SET @fields=concat(@fields,@zf);
SET @sql = CONCAT('select scores.*,rank() over(order by scores.总分 desc) as 级内名次,rank() over (PARTITION BY scores.班级 order by 总分 desc) as 班内名次
from 
(Select st.class_id as 班级,st.xh as 序号,st.name as 姓名,', @fields,
                        ' From Students st
                        Inner Join (
SELECT exam_id,grade_id,class_id,xh,course_id,cj FROM Scores where exam_id =@exam_id and grade_id=@grade_id
union
SELECT exam_id,grade_id,class_id,xh,MAX(course_id)+1 as course_id,sum(cj)AS cj FROM Scores where exam_id =@exam_id and grade_id=@grade_id
group by exam_id,grade_id,class_id,xh) AS s 
On st.grade_id = s.grade_id and  st.class_id = s.class_id and  st.xh = s.xh  Group by st.grade_id,st.class_id,st.xh
) as scores');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for score_insert_blank_by_grade
-- ----------------------------
DROP PROCEDURE IF EXISTS `score_insert_blank_by_grade`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `score_insert_blank_by_grade`(IN  GradeID tinyint,OUT Rows_Added int)
    MODIFIES SQL DATA
BEGIN
DECLARE last_exam_id tinyint;
DECLARE current_exam_id tinyint;
DECLARE max_exam_id tinyint;

SELECT last_exam_id =MAX (exam_id) from Scores WHERE grade_id = GradeID;
SELECT max_exam_id = MAX (exam_id) from Exams  WHERE grade_id = GradeID;
if  not isnull(last_exam_id) THEN #  非第一次
	select current_exam_id=last_exam_id+1;
	IF current_exam_id <= max_exam_id THEN 
		insert Scores
		SELECT ST.grade_id,ST.class_id,ST.xh, current_exam_id as exam_id,CS.course_id,0 as cj FROM 
			Students as ST inner join
			Courses AS CS ON ST.grade_id = CS.grade_id 
			WHERE ST.grade_id = GradeID AND CS.exam_id = current_exam_id;
		select Rows_Added=FOUND_ROWS();
		UPDATE Grades SET current_exam =current_exam_id where grade_id = GradeID;
		ELSE
		select Rows_Added=0;
	END IF;
else # 第一次
	select current_exam_id= MIN (exam_id) from Score.exams WHERE grade_id = GradeID;
	insert Score.scores
	SELECT  ST.grade_id,ST.class_id,ST.xh, current_exam_id as exam_id,CS.course_id,0 as cj FROM 
	Students as ST inner join
	Courses AS CS ON ST.grade_id = CS.grade_id 
	WHERE ST.grade_id = GradeID AND CS.exam_id = current_exam_id;
	select Rows_Added=FOUND_ROWS();
	UPDATE Grades SET current_exam =current_exam_id where grade_id = GradeID;
end if;	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_stat_course
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_stat_course`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_stat_course`(IN ExamID tinyint,IN GradeID smallint,IN CourseID tinyint)
    READS SQL DATA
BEGIN
# CourseID=0 所有科目
# --------------1.cte_score-------- 
with cte_score as (
SELECT 
	SC.course_id, 
	SC.class_id,
	C.max,
	SC.cj
FROM
	Scores AS SC INNER JOIN 
	Students AS ST ON  
	SC.grade_id=ST.grade_id and
	SC.class_id=ST.class_id and
	SC.xh=ST.xh
	INNER JOIN
	Courses AS C ON ST.grade_id = C.grade_id AND SC.course_id = C.course_id AND SC.exam_id = C.exam_id 
WHERE(ST.grade_id = GradeID) AND (SC.exam_id =ExamID) AND (ST.stat = 1) and 
(1 = (CASE WHEN CourseID=0 THEN 1 ELSE 0 END) OR  CourseID=SC.course_id)
),
# ----------------2.cte_avg-----------------
cte_avg as (
SELECT 
	course_id, 
	 coalesce(class_id, 88) as 'class_id',
	max, 
	COUNT(cj) AS rs,
	SUM(CASE cj WHEN 0 THEN 0 ELSE 1 END) AS sk, 
	SUM(CASE WHEN cj >= .6 * max THEN 1 ELSE 0 END) AS jg,
	SUM(CASE WHEN cj >= .8 * max THEN 1 ELSE 0 END) AS yx,
	 STDDEV_SAMP(case cj when 0 then null else cj end) AS sdt, avg(case cj when 0 then null else cj end) AS average,
	max(cj) as topScore
	FROM cte_score AS A
GROUP BY course_id,class_id with ROLLUP
),
# -----------------3.cte_score_seg & cte_count ---------------
cte_score_seg AS (select course_id,class_id, CAST(floor(cj / 10) as unsigned) AS seg from cte_score),
cte_count as (
select course_id,coalesce(class_id, 88) as 'class_id',
				count(if((seg = 1),1,NULL)) AS `1`,
				count(if((seg = 2),1,NULL)) AS `2`,
				count(if((seg = 3),1,NULL)) AS `3`,
				count(if((seg = 4),1,NULL)) AS `4`,
				count(if((seg = 5),1,NULL)) AS `5`,
				count(if((seg = 6),1,NULL)) AS `6`,
				count(if((seg = 7),1,NULL)) AS `7`,
				count(if((seg = 8),1,NULL)) AS `8`,
				count(if((seg = 9),1,NULL)) AS `9`,
				count(if((seg = 10),1,NULL)) AS `10`,
				count(if((seg = 11),1,NULL)) AS `11`,
				count(if((seg = 12),1,NULL)) AS `12`,
				count(if((seg = 13),1,NULL)) AS `13`,
				count(if((seg = 14),1,NULL)) AS `14`,
				count(if((seg = 15),1,NULL)) AS `15`
				
				from cte_score_seg group by course_id,class_id with ROLLUP
)
# --------------------@result_table--------------------
SELECT 
	A.course_id,
	C.course_name,
	A.class_id, 
	rtrim(IFNULL(CL.manager_name, '全级')) as manager_name,
	rtrim(IFNULL(T.teacher_name,'全级')) as teacher_name,
	A.rs, A.sk, A.jg, A.yx, 
	CASE 
		WHEN A.sk =0 THEN 0 
		ELSE cast((A.jg + 0.00001) / A.sk * 100 as decimal(6,2)) END AS jgl, 
	CASE
		WHEN A.sk =0 THEN 0 
		ELSE cast((A.yx + 0.00001)/A.sk * 100 as decimal(6,2))  END AS yxl, 
	cast(IFNULL(A.average,0) as decimal(6,2)) as average, 
	cast(IFNULL(A.sdt,0) as decimal(6,2)) as sdt,
	topScore,
					`1` as C1,
					`2` as C2, 
					`3` as C3, 
					`4` as C4,
					`5` as C5,
					`6` as C6,
					`7` as C7, 
					`8` as C8, 
					`9` as C9,
					`10` as C10, 
					`11` as C11,
					`12` as c12, 
					`13` as C13, 
					`14` as C14,
					`15` as C15
					
FROM cte_avg AS A INNER JOIN 
	cte_count AS B ON A.class_id = B.class_id AND A.course_id = B.course_id left outer join  
	(select * from Classes  where grade_id=GradeID) AS CL ON A.class_id = CL.class_id  left outer join  
	(select * from Courses  where grade_id=GradeID and exam_id=ExamID) AS C ON A.course_id = C.course_id left outer join
	(select * from Teachers where grade_id=GradeID and exam_id=ExamID) AS T ON A.course_id = T.course_id and A.class_id = T.class_id
order by course_id,class_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_stat_total
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_stat_total`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_stat_total`(IN ExamID tinyint,IN GradeID smallint)
    READS SQL DATA
BEGIN
## --------------1.@score-------- 
with cte_score as ( 
SELECT 
	SC.class_id,
	SUM(SC.cj) AS cj
FROM 
	Scores AS SC INNER JOIN 
	Students AS ST ON 
	SC.grade_id=ST.grade_id and
	SC.class_id=ST.class_id and
	SC.xh=ST.xh	
WHERE SC.grade_id =GradeID AND SC.exam_id =ExamID AND ST.stat = 1
GROUP BY SC.grade_id,SC.class_id,SC.xh
),
## ----------------2.@avg-----------------
cte_avg as (
SELECT coalesce(class_id, 88) as 'class_id',
	COUNT(cj) AS rs,
	SUM(CASE cj WHEN 0 THEN 0 ELSE 1 END) AS sk,
	avg(case cj when 0 then null else cj end) AS average,STD(case cj when 0 then null else cj end) AS sdt, 
	max(cj) as topScore
FROM cte_score
GROUP BY class_id with ROLLUP
),

## -----------------3.@count---------------
cte_score_seg  AS (select class_id, CAST(floor(cj / 10) as UNSIGNED) AS seg from cte_score),
cte_count AS (
	select coalesce(class_id, 88) as 'class_id',
				count(if((seg = 30),1,NULL)) AS `30`,
				count(if((seg = 31),1,NULL)) AS `31`,
				count(if((seg = 32),1,NULL)) AS `32`,
				count(if((seg = 33),1,NULL)) AS `33`,
				count(if((seg = 34),1,NULL)) AS `34`,
				count(if((seg = 35),1,NULL)) AS `35`,
				count(if((seg = 36),1,NULL)) AS `36`,
				count(if((seg = 37),1,NULL)) AS `37`,
				count(if((seg = 38),1,NULL)) AS `38`,
				count(if((seg = 39),1,NULL)) AS `39`,
				count(if((seg = 40),1,NULL)) AS `40`,
				count(if((seg = 41),1,NULL)) AS `41`,
				count(if((seg = 42),1,NULL)) AS `42`,
				count(if((seg = 43),1,NULL)) AS `43`,
				count(if((seg = 44),1,NULL)) AS `44`,
				count(if((seg = 45),1,NULL)) AS `45`,
				count(if((seg = 46),1,NULL)) AS `46`,
				count(if((seg = 47),1,NULL)) AS `47`,
				count(if((seg = 48),1,NULL)) AS `48`,
				count(if((seg = 49),1,NULL)) AS `49`,
				count(if((seg = 50),1,NULL)) AS `50`,
				count(if((seg = 51),1,NULL)) AS `51`,
				count(if((seg = 52),1,NULL)) AS `52`,
				count(if((seg = 53),1,NULL)) AS `53`,
				count(if((seg = 54),1,NULL)) AS `54`,
				count(if((seg = 55),1,NULL)) AS `55`,
				count(if((seg = 56),1,NULL)) AS `56`,
				count(if((seg = 57),1,NULL)) AS `57`,
				count(if((seg = 58),1,NULL)) AS `58`,
				count(if((seg = 59),1,NULL)) AS `59`,
				count(if((seg = 60),1,NULL)) AS `60`,
				count(if((seg = 61),1,NULL)) AS `61`,
				count(if((seg = 62),1,NULL)) AS `62`,
				count(if((seg = 63),1,NULL)) AS `63`,
				count(if((seg = 64),1,NULL)) AS `64`,
				count(if((seg = 65),1,NULL)) AS `65`,
				count(if((seg = 66),1,NULL)) AS `66`,
				count(if((seg = 67),1,NULL)) AS `67`,
				count(if((seg = 68),1,NULL)) AS `68`,
				count(if((seg = 69),1,NULL)) AS `69`,
				count(if((seg = 70),1,NULL)) AS `70`,
				count(if((seg = 71),1,NULL)) AS `71`,
				count(if((seg = 72),1,NULL)) AS `72`,
				count(if((seg = 73),1,NULL)) AS `73`,
				count(if((seg = 74),1,NULL)) AS `74`,
				count(if((seg = 75),1,NULL)) AS `75`,
				count(if((seg = 76),1,NULL)) AS `76`,
				count(if((seg = 77),1,NULL)) AS `77`,
				count(if((seg = 78),1,NULL)) AS `78`,
				count(if((seg = 79),1,NULL)) AS `79`,
				count(if((seg = 80),1,NULL)) AS `80`,
				count(if((seg = 81),1,NULL)) AS `81`,
				count(if((seg = 82),1,NULL)) AS `82`,
				count(if((seg = 83),1,NULL)) AS `83`,
				count(if((seg = 84),1,NULL)) AS `84`,
				count(if((seg = 85),1,NULL)) AS `85`,
				count(if((seg = 86),1,NULL)) AS `86`,
				count(if((seg = 87),1,NULL)) AS `87`,
				count(if((seg = 88),1,NULL)) AS `88`,
				count(if((seg = 89),1,NULL)) AS `89`,
				count(if((seg = 90),1,NULL)) AS `90`,
				count(if((seg = 91),1,NULL)) AS `91`,
				count(if((seg = 92),1,NULL)) AS `92`,
				count(if((seg = 93),1,NULL)) AS `93`,
				count(if((seg = 94),1,NULL)) AS `94`,
				count(if((seg = 95),1,NULL)) AS `95`
				
				from cte_score_seg group by class_id with ROLLUP
)
## -----------------------@result----------------------           
SELECT A.class_id,
rtrim(Ifnull(CL.manager_name,'全级')) as manager_name,
A.rs,A.sk,
cast(Ifnull(A.average,0) as decimal(6,2)) as average, 
cast(Ifnull(A.sdt,0) as decimal(6,2)) as sdt,A.topScore,
					`30` as C30,
					`31` as C31,
					`32` as C32, 
					`33` as C33, 
					`34` as C34,
					`35` as C35,
					`36` as C36,
					`37` as C37, 
					`38` as C38, 
					`39` as C39,
					`40` as C40, 
					`41` as C41,
					`42` as C42, 
					`43` as C43, 
					`44` as C44,
					`45` as C45,
					`46` as C46,
					`47` as C47, 
					`48` as C48, 
					`49` as C49,
					`50` as C50, 
					`51` as C51,
					`52` as C52, 
					`53` as C53, 
					`54` as C54,
					`55` as C55,
					`56` as C56,
					`57` as C57, 
					`58` as C58, 
					`59` as C59,
					`60` as C60, 
					`61` as C61,
					`62` as C62, 
					`63` as C63, 
					`64` as C64,
					`65` as C65,
					`66` as C66,
					`67` as C67, 
					`68` as C68, 
					`69` as C69,
					`70` as C70, 
					`71` as C71,
					`72` as C72, 
					`73` as C73, 
					`74` as C74,
					`75` as C75,
					`76` as C76,
					`77` as C77, 
					`78` as C78, 
					`79` as C79,
					`80` as C80, 
					`81` as C81,
					`82` as C82, 
					`83` as C83, 
					`84` as C84,
					`85` as C85,
					`86` as C86,
					`87` as C87, 
					`88` as C88, 
					`89` as C89,
					`90` as C80, 
					`91` as C91,
					`92` as C92, 
					`93` as C93, 
					`94` as C94,
					`95` as C95

FROM cte_avg AS A INNER JOIN cte_count AS B ON A.class_id = B.class_id left outer join  
	(select * from Classes  where grade_id=GradeID) AS CL ON A.class_id = CL.class_id 
	order by A.class_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for title_grade_class_exam
-- ----------------------------
DROP PROCEDURE IF EXISTS `title_grade_class_exam`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `title_grade_class_exam`(IN GradeID smallint, IN ClassID smallint, IN ExamID smallint)
BEGIN
	#Routine body goes here...
select  GROUP_CONCAT(trim(g.grade_name),trim(c.class_name) ,trim(e.exam_title))   from  Grades as g INNER JOIN Classes as c on g.grade_id=c.grade_id INNER JOIN Exams as e on g.grade_id=e.grade_id 
where g.grade_id=GradeID and c.class_id=ClassID and e.exam_id=ExamID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for title_grade_exam_course
-- ----------------------------
DROP PROCEDURE IF EXISTS `title_grade_exam_course`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `title_grade_exam_course`(IN ExamID tinyint,IN GradeID smallint,IN CourseID tinyint)
BEGIN
if CourseID>0 THEN
	select    GROUP_CONCAT(trim(g.grade_name),trim(e.exam_title),trim(c.course_name)) from  Grades as g INNER JOIN Exams as e on g.grade_id=e.grade_id INNER JOIN Courses as c on e.grade_id=c.grade_id and e.exam_id=c.exam_id
	where g.grade_id=GradeID and c.course_id=CourseID and e.exam_id=ExamID and CourseID=c.course_id;
ELSE
	select GROUP_CONCAT(trim(g.grade_name),trim(e.exam_title)) from  Grades as g INNER JOIN Exams as e on g.grade_id=e.grade_id 
	where g.grade_id=GradeID and e.exam_id=ExamID;
end IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
