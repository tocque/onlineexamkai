/*
Navicat MySQL Data Transfer

Source Server         : thl
Source Server Version : 50729
Source Host           : localhost:3306
Source Database       : db_database

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2020-06-06 01:01:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限表id',
  `roleId` int(11) NOT NULL COMMENT '角色id',
  `menuId` int(11) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `roleId` (`roleId`) USING BTREE,
  KEY `menuId` (`menuId`) USING BTREE,
  CONSTRAINT `authority_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `authority_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=630 DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='权限表';

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('574', '2', '35');
INSERT INTO `authority` VALUES ('575', '2', '36');
INSERT INTO `authority` VALUES ('576', '2', '25');
INSERT INTO `authority` VALUES ('577', '2', '1');
INSERT INTO `authority` VALUES ('578', '2', '14');
INSERT INTO `authority` VALUES ('579', '2', '15');
INSERT INTO `authority` VALUES ('580', '1', '1');
INSERT INTO `authority` VALUES ('581', '1', '5');
INSERT INTO `authority` VALUES ('582', '1', '17');
INSERT INTO `authority` VALUES ('583', '1', '18');
INSERT INTO `authority` VALUES ('584', '1', '19');
INSERT INTO `authority` VALUES ('585', '1', '20');
INSERT INTO `authority` VALUES ('586', '1', '13');
INSERT INTO `authority` VALUES ('587', '1', '21');
INSERT INTO `authority` VALUES ('588', '1', '22');
INSERT INTO `authority` VALUES ('589', '1', '23');
INSERT INTO `authority` VALUES ('590', '1', '35');
INSERT INTO `authority` VALUES ('591', '1', '36');
INSERT INTO `authority` VALUES ('592', '1', '14');
INSERT INTO `authority` VALUES ('593', '1', '15');
INSERT INTO `authority` VALUES ('594', '1', '24');
INSERT INTO `authority` VALUES ('595', '1', '25');
INSERT INTO `authority` VALUES ('596', '1', '26');
INSERT INTO `authority` VALUES ('597', '1', '31');
INSERT INTO `authority` VALUES ('598', '1', '32');
INSERT INTO `authority` VALUES ('599', '1', '33');
INSERT INTO `authority` VALUES ('600', '1', '34');
INSERT INTO `authority` VALUES ('601', '1', '37');
INSERT INTO `authority` VALUES ('602', '1', '38');
INSERT INTO `authority` VALUES ('603', '1', '39');
INSERT INTO `authority` VALUES ('604', '1', '40');
INSERT INTO `authority` VALUES ('605', '1', '41');
INSERT INTO `authority` VALUES ('606', '1', '42');
INSERT INTO `authority` VALUES ('607', '1', '43');
INSERT INTO `authority` VALUES ('608', '1', '44');
INSERT INTO `authority` VALUES ('609', '1', '45');
INSERT INTO `authority` VALUES ('610', '1', '46');
INSERT INTO `authority` VALUES ('611', '1', '47');
INSERT INTO `authority` VALUES ('612', '1', '48');
INSERT INTO `authority` VALUES ('613', '1', '49');
INSERT INTO `authority` VALUES ('614', '1', '50');
INSERT INTO `authority` VALUES ('615', '1', '51');
INSERT INTO `authority` VALUES ('616', '1', '64');
INSERT INTO `authority` VALUES ('617', '1', '52');
INSERT INTO `authority` VALUES ('618', '1', '53');
INSERT INTO `authority` VALUES ('619', '1', '54');
INSERT INTO `authority` VALUES ('620', '1', '55');
INSERT INTO `authority` VALUES ('621', '1', '56');
INSERT INTO `authority` VALUES ('622', '1', '57');
INSERT INTO `authority` VALUES ('623', '1', '58');
INSERT INTO `authority` VALUES ('624', '1', '60');
INSERT INTO `authority` VALUES ('625', '1', '61');
INSERT INTO `authority` VALUES ('626', '1', '62');
INSERT INTO `authority` VALUES ('627', '1', '63');
INSERT INTO `authority` VALUES ('628', '1', '65');
INSERT INTO `authority` VALUES ('629', '1', '66');

-- ----------------------------
-- Table structure for c3p0testtable
-- ----------------------------
DROP TABLE IF EXISTS `c3p0testtable`;
CREATE TABLE `c3p0testtable` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of c3p0testtable
-- ----------------------------

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考试信息表id',
  `name` varchar(255) NOT NULL COMMENT '考试名称',
  `subjectId` int(11) NOT NULL COMMENT '所属学科专业id',
  `startTime` datetime NOT NULL COMMENT '考试开始时间',
  `endTime` datetime NOT NULL COMMENT '考试结束时间',
  `avaliableTime` int(8) NOT NULL COMMENT '考试所需时间',
  `questionNum` int(5) NOT NULL COMMENT '试题总数',
  `totalScore` int(5) NOT NULL COMMENT '总分',
  `passScore` int(5) NOT NULL COMMENT '及格分数',
  `singleQuestionNum` int(5) NOT NULL COMMENT '单选题数量',
  `multiQuestionNum` int(5) NOT NULL COMMENT '多选题数量',
  `chargeQuestionNum` int(5) NOT NULL COMMENT '判断题数量',
  `paperNum` int(5) NOT NULL DEFAULT '0' COMMENT '试卷数量',
  `examedNum` int(5) NOT NULL DEFAULT '0' COMMENT '已考人数',
  `passNum` int(5) NOT NULL COMMENT '及格人数',
  `createTime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `subjectId` (`subjectId`) USING BTREE,
  CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='考试信息表';

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('2', '软件工程期中考试', '1', '2020-05-01 00:00:00', '2020-05-31 00:00:00', '60', '4', '10', '5', '2', '1', '1', '5', '5', '4', '2020-04-29 20:23:03');
INSERT INTO `exam` VALUES ('3', '计算机基本知识小测验', '1', '2020-04-12 20:28:48', '2020-05-31 20:28:51', '2', '11', '28', '20', '4', '3', '4', '2', '2', '0', '2020-04-29 20:29:06');
INSERT INTO `exam` VALUES ('4', '软件工程课堂随机小测试', '1', '2020-06-03 11:45:00', '2020-06-10 11:12:02', '1', '2', '6', '2', '1', '1', '0', '2', '2', '2', '2020-05-04 11:12:12');
INSERT INTO `exam` VALUES ('5', '物理课堂测验', '6', '2020-05-01 16:48:31', '2020-05-18 16:48:34', '30', '3', '8', '4', '1', '1', '1', '1', '1', '1', '2020-05-04 16:49:28');
INSERT INTO `exam` VALUES ('6', '软件工程2018级期末考试', '1', '2020-07-01 17:00:05', '2020-07-02 17:00:16', '60', '14', '36', '20', '6', '4', '4', '0', '0', '0', '2020-07-04 17:01:57');
INSERT INTO `exam` VALUES ('7', '测试', '8', '2020-04-01 00:00:00', '2020-05-01 00:00:00', '60', '10', '20', '20', '10', '0', '0', '1', '1', '0', '2020-05-14 20:51:04');
INSERT INTO `exam` VALUES ('8', '测试', '7', '2020-06-07 00:00:00', '2020-06-08 00:00:00', '60', '10', '20', '20', '10', '0', '0', '1', '1', '0', '2020-05-14 20:51:04');

-- ----------------------------
-- Table structure for exampaper
-- ----------------------------
DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE `exampaper` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '试卷信息表id',
  `examId` int(11) NOT NULL COMMENT '所属考试ID',
  `studentId` int(11) NOT NULL COMMENT '所属学生ID',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '试卷状态：0：未考，1：已考',
  `totalScore` int(5) NOT NULL DEFAULT '0' COMMENT '总分',
  `score` int(5) NOT NULL DEFAULT '0' COMMENT '得分',
  `startExamTime` datetime DEFAULT NULL COMMENT '开始考试时间',
  `endExamTime` datetime DEFAULT NULL COMMENT '结束考试时间',
  `useTime` int(8) DEFAULT NULL COMMENT '考试用时',
  `createTime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `examId` (`examId`) USING BTREE,
  KEY `studentId` (`studentId`) USING BTREE,
  CONSTRAINT `exampaper_ibfk_1` FOREIGN KEY (`examId`) REFERENCES `exam` (`id`),
  CONSTRAINT `exampaper_ibfk_2` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='试卷信息表';

-- ----------------------------
-- Records of exampaper
-- ----------------------------
INSERT INTO `exampaper` VALUES ('9', '2', '6', '1', '10', '6', '2020-05-04 11:04:02', '2020-05-04 11:07:11', '3', '2020-05-04 11:06:49');
INSERT INTO `exampaper` VALUES ('10', '4', '6', '1', '6', '6', '2020-05-04 11:12:32', '2020-05-04 11:13:31', '0', '2020-05-04 11:12:32');
INSERT INTO `exampaper` VALUES ('11', '3', '6', '1', '28', '4', '2020-05-04 13:25:22', '2020-05-04 13:26:30', '1', '2020-05-04 13:25:22');
INSERT INTO `exampaper` VALUES ('12', '5', '8', '1', '8', '4', '2020-05-04 16:55:38', '2020-05-04 16:55:58', '0', '2020-05-04 16:55:38');
INSERT INTO `exampaper` VALUES ('14', '2', '9', '1', '10', '8', '2020-05-04 18:20:37', '2020-05-04 18:20:56', '0', '2020-05-04 18:20:37');
INSERT INTO `exampaper` VALUES ('15', '2', '10', '1', '10', '6', '2020-05-04 18:22:29', '2020-05-04 18:22:46', '0', '2020-05-04 18:22:29');
INSERT INTO `exampaper` VALUES ('16', '2', '11', '1', '10', '2', '2020-05-04 18:24:07', '2020-05-04 18:24:19', '0', '2020-05-04 18:24:07');
INSERT INTO `exampaper` VALUES ('17', '4', '11', '1', '6', '2', '2020-05-04 18:24:51', '2020-05-04 18:25:50', '0', '2020-05-04 18:24:51');
INSERT INTO `exampaper` VALUES ('18', '3', '11', '1', '28', '6', '2020-05-04 18:26:25', '2020-05-04 18:26:44', '0', '2020-05-04 18:26:25');
INSERT INTO `exampaper` VALUES ('21', '8', '13', '1', '20', '14', '2020-05-14 20:51:34', '2020-05-14 20:52:40', '1', '2020-05-14 20:51:34');

-- ----------------------------
-- Table structure for exampaperanswer
-- ----------------------------
DROP TABLE IF EXISTS `exampaperanswer`;
CREATE TABLE `exampaperanswer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '试卷答题信息表id',
  `examId` int(11) NOT NULL COMMENT '所属考试ID',
  `examPaperId` int(11) NOT NULL COMMENT '所属试卷ID',
  `studentId` int(11) NOT NULL COMMENT '所属学生ID',
  `questionId` int(11) NOT NULL DEFAULT '0' COMMENT '所属试题ID',
  `answer` varchar(32) DEFAULT '0' COMMENT '提交答案',
  `isCorrect` int(2) NOT NULL DEFAULT '0' COMMENT '是否正确',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `examId` (`examPaperId`) USING BTREE,
  KEY `studentId` (`studentId`) USING BTREE,
  KEY `questionId` (`questionId`) USING BTREE,
  KEY `examId_2` (`examId`) USING BTREE,
  CONSTRAINT `exampaperanswer_ibfk_1` FOREIGN KEY (`examPaperId`) REFERENCES `exampaper` (`id`),
  CONSTRAINT `exampaperanswer_ibfk_2` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`),
  CONSTRAINT `exampaperanswer_ibfk_3` FOREIGN KEY (`questionId`) REFERENCES `question` (`id`),
  CONSTRAINT `exampaperanswer_ibfk_4` FOREIGN KEY (`examId`) REFERENCES `exam` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='试卷答题信息表';

-- ----------------------------
-- Records of exampaperanswer
-- ----------------------------
INSERT INTO `exampaperanswer` VALUES ('21', '2', '9', '6', '2', 'A', '1');
INSERT INTO `exampaperanswer` VALUES ('22', '2', '9', '6', '6', 'B', '0');
INSERT INTO `exampaperanswer` VALUES ('23', '2', '9', '6', '1', 'ABCD', '1');
INSERT INTO `exampaperanswer` VALUES ('24', '2', '9', '6', '5', 'B', '0');
INSERT INTO `exampaperanswer` VALUES ('25', '4', '10', '6', '6', 'A', '1');
INSERT INTO `exampaperanswer` VALUES ('26', '4', '10', '6', '1', 'ABCD', '1');
INSERT INTO `exampaperanswer` VALUES ('27', '3', '11', '6', '16', 'B', '0');
INSERT INTO `exampaperanswer` VALUES ('28', '3', '11', '6', '6', 'B', '0');
INSERT INTO `exampaperanswer` VALUES ('29', '3', '11', '6', '14', 'B', '0');
INSERT INTO `exampaperanswer` VALUES ('30', '3', '11', '6', '2', 'B', '0');
INSERT INTO `exampaperanswer` VALUES ('31', '3', '11', '6', '21', 'ACD', '0');
INSERT INTO `exampaperanswer` VALUES ('32', '3', '11', '6', '20', 'AB', '0');
INSERT INTO `exampaperanswer` VALUES ('33', '3', '11', '6', '22', 'B', '0');
INSERT INTO `exampaperanswer` VALUES ('34', '3', '11', '6', '5', 'B', '0');
INSERT INTO `exampaperanswer` VALUES ('35', '3', '11', '6', '17', 'B', '1');
INSERT INTO `exampaperanswer` VALUES ('36', '3', '11', '6', '18', 'A', '0');
INSERT INTO `exampaperanswer` VALUES ('37', '3', '11', '6', '19', 'A', '1');
INSERT INTO `exampaperanswer` VALUES ('38', '5', '12', '8', '29', 'B', '0');
INSERT INTO `exampaperanswer` VALUES ('39', '5', '12', '8', '28', 'BD', '1');
INSERT INTO `exampaperanswer` VALUES ('40', '5', '12', '8', '30', 'A', '0');
INSERT INTO `exampaperanswer` VALUES ('50', '2', '14', '9', '14', 'D', '0');
INSERT INTO `exampaperanswer` VALUES ('51', '2', '14', '9', '6', 'A', '1');
INSERT INTO `exampaperanswer` VALUES ('52', '2', '14', '9', '21', 'CD', '1');
INSERT INTO `exampaperanswer` VALUES ('53', '2', '14', '9', '19', 'A', '1');
INSERT INTO `exampaperanswer` VALUES ('54', '2', '15', '10', '2', 'A', '1');
INSERT INTO `exampaperanswer` VALUES ('55', '2', '15', '10', '13', 'A', '1');
INSERT INTO `exampaperanswer` VALUES ('56', '2', '15', '10', '21', 'ABCD', '0');
INSERT INTO `exampaperanswer` VALUES ('57', '2', '15', '10', '18', 'B', '1');
INSERT INTO `exampaperanswer` VALUES ('58', '2', '16', '11', '2', 'A', '1');
INSERT INTO `exampaperanswer` VALUES ('59', '2', '16', '11', '16', 'B', '0');
INSERT INTO `exampaperanswer` VALUES ('60', '2', '16', '11', '1', 'D', '0');
INSERT INTO `exampaperanswer` VALUES ('61', '2', '16', '11', '19', 'B', '0');
INSERT INTO `exampaperanswer` VALUES ('62', '4', '17', '11', '13', 'A', '1');
INSERT INTO `exampaperanswer` VALUES ('63', '4', '17', '11', '20', 'AC', '0');
INSERT INTO `exampaperanswer` VALUES ('64', '3', '18', '11', '2', 'C', '0');
INSERT INTO `exampaperanswer` VALUES ('65', '3', '18', '11', '6', 'C', '0');
INSERT INTO `exampaperanswer` VALUES ('66', '3', '18', '11', '15', null, '0');
INSERT INTO `exampaperanswer` VALUES ('67', '3', '18', '11', '13', null, '0');
INSERT INTO `exampaperanswer` VALUES ('68', '3', '18', '11', '1', 'BC', '0');
INSERT INTO `exampaperanswer` VALUES ('69', '3', '18', '11', '20', null, '0');
INSERT INTO `exampaperanswer` VALUES ('70', '3', '18', '11', '22', 'ABD', '0');
INSERT INTO `exampaperanswer` VALUES ('71', '3', '18', '11', '5', 'A', '1');
INSERT INTO `exampaperanswer` VALUES ('72', '3', '18', '11', '17', 'B', '1');
INSERT INTO `exampaperanswer` VALUES ('73', '3', '18', '11', '18', 'A', '0');
INSERT INTO `exampaperanswer` VALUES ('74', '3', '18', '11', '19', 'A', '1');
INSERT INTO `exampaperanswer` VALUES ('75', '8', '21', '13', '57', 'A', '1');
INSERT INTO `exampaperanswer` VALUES ('76', '8', '21', '13', '54', 'D', '1');
INSERT INTO `exampaperanswer` VALUES ('77', '8', '21', '13', '35', 'A', '1');
INSERT INTO `exampaperanswer` VALUES ('78', '8', '21', '13', '58', 'B', '0');
INSERT INTO `exampaperanswer` VALUES ('79', '8', '21', '13', '34', 'C', '0');
INSERT INTO `exampaperanswer` VALUES ('80', '8', '21', '13', '48', 'D', '1');
INSERT INTO `exampaperanswer` VALUES ('81', '8', '21', '13', '47', 'B', '1');
INSERT INTO `exampaperanswer` VALUES ('82', '8', '21', '13', '56', 'C', '1');
INSERT INTO `exampaperanswer` VALUES ('83', '8', '21', '13', '43', 'B', '0');
INSERT INTO `exampaperanswer` VALUES ('84', '8', '21', '13', '33', 'A', '1');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统日志表id',
  `content` varchar(255) NOT NULL COMMENT '日志内容',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统日志表';

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('13', '用户名为admin的用户登录时输入验证码错误!', '2020-03-16 18:17:30');
INSERT INTO `log` VALUES ('14', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-03-16 18:22:56');
INSERT INTO `log` VALUES ('15', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-03-16 18:37:15');
INSERT INTO `log` VALUES ('16', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-03-16 18:40:21');
INSERT INTO `log` VALUES ('17', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-03-16 19:11:49');
INSERT INTO `log` VALUES ('18', '用户名为{admin}，的用户成功修改密码!', '2020-03-18 19:13:32');
INSERT INTO `log` VALUES ('19', '用户名为{admin}，的用户成功修改密码!', '2020-03-18 19:14:01');
INSERT INTO `log` VALUES ('20', '用户名为{cg}，角色为{普通用户}的用户登录成功!', '2020-03-18 19:17:46');
INSERT INTO `log` VALUES ('21', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-03-18 14:03:54');
INSERT INTO `log` VALUES ('22', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-01 16:32:59');
INSERT INTO `log` VALUES ('23', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-01 16:41:20');
INSERT INTO `log` VALUES ('24', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-01 17:00:15');
INSERT INTO `log` VALUES ('25', '用户名为admin的用户登录时输入验证码错误!', '2020-04-01 17:08:58');
INSERT INTO `log` VALUES ('26', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-01 17:09:09');
INSERT INTO `log` VALUES ('27', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-01 17:20:28');
INSERT INTO `log` VALUES ('28', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-01 19:14:08');
INSERT INTO `log` VALUES ('29', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-01 19:20:51');
INSERT INTO `log` VALUES ('30', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-01 20:31:38');
INSERT INTO `log` VALUES ('31', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-01 20:40:28');
INSERT INTO `log` VALUES ('32', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-01 20:57:55');
INSERT INTO `log` VALUES ('33', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-01 20:59:17');
INSERT INTO `log` VALUES ('34', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-01 21:26:13');
INSERT INTO `log` VALUES ('35', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-02 21:31:25');
INSERT INTO `log` VALUES ('36', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-02 22:09:06');
INSERT INTO `log` VALUES ('37', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-02 21:20:00');
INSERT INTO `log` VALUES ('38', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-12 21:24:30');
INSERT INTO `log` VALUES ('39', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-12 19:35:44');
INSERT INTO `log` VALUES ('40', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-12 19:39:37');
INSERT INTO `log` VALUES ('41', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-12 19:51:46');
INSERT INTO `log` VALUES ('42', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-12 21:35:07');
INSERT INTO `log` VALUES ('43', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-12 21:52:27');
INSERT INTO `log` VALUES ('44', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-12 21:55:07');
INSERT INTO `log` VALUES ('45', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-12 22:11:24');
INSERT INTO `log` VALUES ('46', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-17 20:22:22');
INSERT INTO `log` VALUES ('47', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-17 20:59:06');
INSERT INTO `log` VALUES ('48', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-17 21:14:00');
INSERT INTO `log` VALUES ('49', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-19 22:08:39');
INSERT INTO `log` VALUES ('50', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-19 22:25:57');
INSERT INTO `log` VALUES ('51', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-19 22:28:04');
INSERT INTO `log` VALUES ('52', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-19 22:40:32');
INSERT INTO `log` VALUES ('53', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-19 22:48:00');
INSERT INTO `log` VALUES ('54', '用户名为admin的用户登录时输入验证码错误!', '2020-04-27 22:50:44');
INSERT INTO `log` VALUES ('55', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-27 22:50:52');
INSERT INTO `log` VALUES ('56', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-27 18:34:56');
INSERT INTO `log` VALUES ('57', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-27 18:48:06');
INSERT INTO `log` VALUES ('58', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-04-27 15:06:28');
INSERT INTO `log` VALUES ('59', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-01 15:15:13');
INSERT INTO `log` VALUES ('60', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-01 13:37:07');
INSERT INTO `log` VALUES ('61', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-01 10:47:34');
INSERT INTO `log` VALUES ('62', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-01 11:03:48');
INSERT INTO `log` VALUES ('63', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 11:11:14');
INSERT INTO `log` VALUES ('64', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 11:37:59');
INSERT INTO `log` VALUES ('65', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 11:40:08');
INSERT INTO `log` VALUES ('66', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 12:00:26');
INSERT INTO `log` VALUES ('67', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 12:24:33');
INSERT INTO `log` VALUES ('68', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 12:37:20');
INSERT INTO `log` VALUES ('69', '用户名为admin的用户登录时输入验证码错误!', '2020-05-04 12:40:30');
INSERT INTO `log` VALUES ('70', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 12:40:37');
INSERT INTO `log` VALUES ('71', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 12:42:25');
INSERT INTO `log` VALUES ('72', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 12:50:11');
INSERT INTO `log` VALUES ('73', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 12:53:01');
INSERT INTO `log` VALUES ('74', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 12:59:13');
INSERT INTO `log` VALUES ('75', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 13:00:32');
INSERT INTO `log` VALUES ('76', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 13:05:07');
INSERT INTO `log` VALUES ('77', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 14:58:38');
INSERT INTO `log` VALUES ('78', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 15:08:45');
INSERT INTO `log` VALUES ('79', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 16:31:28');
INSERT INTO `log` VALUES ('80', '用户名为admin的用户登录时输入验证码错误!', '2020-05-04 16:44:02');
INSERT INTO `log` VALUES ('81', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 16:44:08');
INSERT INTO `log` VALUES ('82', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 16:59:46');
INSERT INTO `log` VALUES ('83', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 17:17:13');
INSERT INTO `log` VALUES ('84', '用户名为admin的用户登录时输入验证码错误!', '2020-05-04 17:21:28');
INSERT INTO `log` VALUES ('85', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 17:21:34');
INSERT INTO `log` VALUES ('86', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 17:23:51');
INSERT INTO `log` VALUES ('87', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 18:08:31');
INSERT INTO `log` VALUES ('88', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-04 18:21:39');
INSERT INTO `log` VALUES ('89', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-11 13:45:06');
INSERT INTO `log` VALUES ('90', '用户名为admin的用户登录时输入密码错误!', '2020-05-11 16:16:56');
INSERT INTO `log` VALUES ('91', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-11 16:17:05');
INSERT INTO `log` VALUES ('93', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-11 16:41:15');
INSERT INTO `log` VALUES ('94', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-11 17:13:58');
INSERT INTO `log` VALUES ('95', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-11 17:56:51');
INSERT INTO `log` VALUES ('96', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-11 18:10:39');
INSERT INTO `log` VALUES ('97', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-11 18:18:22');
INSERT INTO `log` VALUES ('98', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-11 19:13:08');
INSERT INTO `log` VALUES ('99', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-11 19:38:22');
INSERT INTO `log` VALUES ('100', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-11 19:56:36');
INSERT INTO `log` VALUES ('101', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-13 20:41:18');
INSERT INTO `log` VALUES ('102', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-13 11:27:53');
INSERT INTO `log` VALUES ('103', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-13 12:08:47');
INSERT INTO `log` VALUES ('104', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-13 21:19:38');
INSERT INTO `log` VALUES ('105', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-13 22:23:58');
INSERT INTO `log` VALUES ('106', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-13 23:19:21');
INSERT INTO `log` VALUES ('107', '用户名为admin的用户登录时输入验证码错误!', '2020-05-14 23:31:54');
INSERT INTO `log` VALUES ('108', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-14 23:32:00');
INSERT INTO `log` VALUES ('109', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-14 00:17:55');
INSERT INTO `log` VALUES ('110', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-14 00:20:04');
INSERT INTO `log` VALUES ('111', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-14 14:00:51');
INSERT INTO `log` VALUES ('112', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-14 14:47:11');
INSERT INTO `log` VALUES ('113', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-14 20:18:51');
INSERT INTO `log` VALUES ('114', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-14 22:17:43');
INSERT INTO `log` VALUES ('115', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-14 22:21:45');
INSERT INTO `log` VALUES ('116', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-14 22:22:48');
INSERT INTO `log` VALUES ('117', '用户名为admin的用户登录时输入验证码错误!', '2020-05-14 22:24:44');
INSERT INTO `log` VALUES ('118', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-14 22:24:52');
INSERT INTO `log` VALUES ('119', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-14 22:25:23');
INSERT INTO `log` VALUES ('120', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-14 22:27:44');
INSERT INTO `log` VALUES ('121', '用户名为admin的用户登录时输入验证码错误!', '2020-05-14 22:29:39');
INSERT INTO `log` VALUES ('122', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-14 22:29:45');
INSERT INTO `log` VALUES ('123', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-14 22:33:07');
INSERT INTO `log` VALUES ('124', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-14 22:34:08');
INSERT INTO `log` VALUES ('125', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-05-14 12:48:55');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单实体表id',
  `parentId` int(11) NOT NULL DEFAULT '-1' COMMENT '父类id',
  `name` varchar(32) NOT NULL COMMENT '菜单名称',
  `url` varchar(128) DEFAULT NULL COMMENT '点击后的url',
  `icon` varchar(32) NOT NULL COMMENT '菜单icon图表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='菜单实体表';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '0', '系统设置', '', 'icon-advancedsettings');
INSERT INTO `menu` VALUES ('5', '1', '菜单管理', '../admin/menu/list', 'icon-chart-organisation');
INSERT INTO `menu` VALUES ('13', '1', '角色管理', '../admin/role/list', 'icon-group-key');
INSERT INTO `menu` VALUES ('14', '0', '用户管理', '', 'icon-group-gear');
INSERT INTO `menu` VALUES ('15', '14', '用户列表', '../admin/user/list', 'icon-group');
INSERT INTO `menu` VALUES ('17', '5', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('18', '5', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('19', '5', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('20', '5', '添加按钮', 'openAddMenu()', 'icon-add');
INSERT INTO `menu` VALUES ('21', '13', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('22', '13', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('23', '13', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('24', '15', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('25', '15', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('26', '15', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('31', '0', '系统日志', '', 'icon-table-cell');
INSERT INTO `menu` VALUES ('32', '31', '日志列表', '../admin/log/list', 'icon-page-white-text');
INSERT INTO `menu` VALUES ('33', '32', '添加日志', 'openAdd()', 'icon-add1');
INSERT INTO `menu` VALUES ('34', '32', '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES ('35', '1', '修改密码', 'edit_password', 'icon-lock-edit');
INSERT INTO `menu` VALUES ('36', '35', '修改密码', 'openAdd()', 'icon-lock-edit');
INSERT INTO `menu` VALUES ('37', '0', '学科管理', '', 'icon-text-padding-left');
INSERT INTO `menu` VALUES ('38', '37', '学科列表', '../admin/subject/list', 'icon-application-view-columns');
INSERT INTO `menu` VALUES ('39', '38', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('40', '38', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('41', '38', '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES ('42', '0', '考生管理', '', 'icon-users');
INSERT INTO `menu` VALUES ('43', '42', '考生列表', '../admin/student/list', 'icon-vcard');
INSERT INTO `menu` VALUES ('44', '43', '添加', 'openAdd()', 'icon-user-add');
INSERT INTO `menu` VALUES ('45', '43', '编辑', 'openEdit()', 'icon-user-edit');
INSERT INTO `menu` VALUES ('46', '43', '删除', 'remove()', 'icon-user-cross');
INSERT INTO `menu` VALUES ('47', '0', '试题管理', '', 'icon-date');
INSERT INTO `menu` VALUES ('48', '47', '试题列表', '../admin/question/list', 'icon-date-magnify');
INSERT INTO `menu` VALUES ('49', '48', '添加', 'openAdd()', 'icon-date-add');
INSERT INTO `menu` VALUES ('50', '48', '编辑', 'openEdit()', 'icon-date-edit');
INSERT INTO `menu` VALUES ('51', '48', '删除', 'remove()', 'icon-date-delete');
INSERT INTO `menu` VALUES ('52', '0', '考试管理', '', 'icon-map');
INSERT INTO `menu` VALUES ('53', '52', '考试列表', '../admin/exam/list', 'icon-map-magnify');
INSERT INTO `menu` VALUES ('54', '53', '添加', 'openAdd()', 'icon-map-add');
INSERT INTO `menu` VALUES ('55', '53', '编辑', 'openEdit()', 'icon-map-edit');
INSERT INTO `menu` VALUES ('56', '53', '删除', 'remove()', 'icon-map-delete');
INSERT INTO `menu` VALUES ('57', '0', '试卷管理', '', 'icon-page-white-text');
INSERT INTO `menu` VALUES ('58', '57', '试卷列表', '../admin/examPaper/list', 'icon-page-white-stack');
INSERT INTO `menu` VALUES ('60', '58', '编辑', 'openEdit()', 'icon-page-white-edit');
INSERT INTO `menu` VALUES ('61', '58', '删除', 'remove()', 'icon-page-white-delete');
INSERT INTO `menu` VALUES ('62', '0', '答题管理', '', 'icon-building-edit');
INSERT INTO `menu` VALUES ('63', '62', '答题列表', '../admin/examPaperAnswer/list', 'icon-building');
INSERT INTO `menu` VALUES ('64', '48', '导入试题', 'openImport()', 'icon-note-go');
INSERT INTO `menu` VALUES ('65', '0', '成绩统计', '', 'icon-text-letter-omega');
INSERT INTO `menu` VALUES ('66', '65', '统计图表', '../admin/stats/exam_stats', 'icon-chart-line');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '试题表id',
  `subjectId` int(11) NOT NULL DEFAULT '1' COMMENT '学科专业类型',
  `questionType` int(2) NOT NULL DEFAULT '0' COMMENT '试题类型',
  `title` varchar(256) NOT NULL COMMENT '题目',
  `score` int(3) NOT NULL COMMENT '分值',
  `attrA` varchar(256) NOT NULL COMMENT '选项A',
  `attrB` varchar(256) NOT NULL COMMENT '选项B',
  `attrC` varchar(256) DEFAULT NULL COMMENT '选项C',
  `attrD` varchar(256) DEFAULT NULL COMMENT '选项D',
  `answer` varchar(16) NOT NULL COMMENT '正确答案',
  `createTime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `subjectId` (`subjectId`) USING BTREE,
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='试题表';

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', '1', '1', '下列哪些是高级编程语言？', '4', 'java', 'C', 'C++', 'PHP', 'ABCD', '2020-04-22 22:03:44');
INSERT INTO `question` VALUES ('2', '1', '0', '唐聚聚最近在研究数论，他想考考你，[1,1e5]有多少个素数', '2', '9592', '9593', '8968', '8969', 'A', '2020-04-22 22:10:05');
INSERT INTO `question` VALUES ('5', '1', '2', '10007 是不是素数?', '2', '是', '不是', '', '', 'A', '2020-04-22 22:19:22');
INSERT INTO `question` VALUES ('6', '1', '0', '下列哪个是百度官网地址？', '2', 'http://www.baidu.com', 'http://www,baidu.com', 'http://baidu.com', 'www.baidu.com', 'A', '2020-04-25 21:26:31');
INSERT INTO `question` VALUES ('13', '1', '0', 'Java是什么？', '2', '编程语言', '不知道', '一种吃的东西', '诗歌语言吧', 'A', '2020-05-04 13:05:18');
INSERT INTO `question` VALUES ('14', '1', '0', '非对称加密也称为', '2', '数字密钥加密', '可选密钥加密', '公钥加密', '私钥加密', 'C', '2020-05-04 13:21:54');
INSERT INTO `question` VALUES ('15', '1', '0', '最广泛使用的公钥密码算法是', '2', 'RSA', '最优公钥密码', '非对称加密', 'AES', 'A', '2020-05-04 13:21:54');
INSERT INTO `question` VALUES ('16', '1', '0', '下列需求属于性能需求的是', '2', '网络协议', '异常响应', '并发访问数', '用户友好', 'C', '2020-05-04 13:21:54');
INSERT INTO `question` VALUES ('17', '1', '2', '如何评价我校ACM校队由三位神仙组成的全新队伍LosWin', '2', '众神归位', '天下第一', '', '', 'B', '2020-05-04 13:21:54');
INSERT INTO `question` VALUES ('18', '1', '2', 'RSA算法对于穷举攻击的抵抗/防范是使用大密钥空间', '2', '正确', '错误', '', '', 'A', '2020-05-04 13:21:54');
INSERT INTO `question` VALUES ('19', '1', '2', '针对RSA算法的攻击只有计时攻击', '2', '错误', '正确', '', '', 'A', '2020-05-04 13:21:54');
INSERT INTO `question` VALUES ('20', '1', '1', '总体设计不包括', '4', '体系结构设计', '接口设计', '数据设计', '数据结构设计', 'D', '2020-05-04 13:21:54');
INSERT INTO `question` VALUES ('21', '1', '1', '如果发送者和接受者都使用相同的密钥，这样的系统称为', '4', '公钥密码系统', '双密钥', '非对称', '对称密钥密码系统', 'D', '2020-05-04 13:21:54');
INSERT INTO `question` VALUES ('22', '1', '1', '把明文消息放到图像中的方法称为', '4', '解密', '信息隐藏', '加密', '密码学', 'B', '2020-05-04 13:21:54');
INSERT INTO `question` VALUES ('25', '5', '0', '结构化设计的目标是', '2', '建立系统软件模型', '建立软件体系结构和详细的处理算法', '产生设计规格说明书', '以上都是', 'D', '2020-05-04 16:35:57');
INSERT INTO `question` VALUES ('26', '5', '1', '下列方法中，不属于黑盒测试的是', '4', '基本路径测试法', '等价类测试法', '边界值分析法', '事务流测试法', 'A', '2020-05-04 16:38:15');
INSERT INTO `question` VALUES ('27', '5', '2', '平均来讲，穷举攻击要尝试所有可能密钥的一半才可能成功', '2', '正确', '错误', '', '', 'A', '2019-05-04 16:39:00');
INSERT INTO `question` VALUES ('28', '6', '1', '黑盒测试不能发现下面的哪种类型的错误', '4', '界面错误', '性能错误', '功能遗漏', '是否存在冗余代码', 'D', '2020-05-04 16:41:43');
INSERT INTO `question` VALUES ('29', '6', '0', '需求分析最终结果是产生', '2', '项目开发说明书', '可行性分析报告', '需求规格说明书', '设计说明书', 'C', '2020-05-04 16:43:14');
INSERT INTO `question` VALUES ('30', '6', '2', '数据源认证不提供对数据单元修改的保护', '2', '正确', '错误', '', '', 'A', '2020-05-04 16:45:01');
INSERT INTO `question` VALUES ('31', '7', '0', '___是对传输数据不受被动攻击的保护', '2', '不可否认', '保密性', '访问控制', '数据控制', 'B', '2020-05-04 16:46:42');
INSERT INTO `question` VALUES ('33', '8', '0', '当无法与用户进行直接交流时，可采用（）的需求发现方式', '2', '自悟', '提炼', '小组会', '思考', 'A', '2020-05-14 20:48:07');
INSERT INTO `question` VALUES ('34', '8', '0', '将5个字母ooops按此顺序入栈，则有多少种不同的出栈顺序可以仍然得到ooops', '2', '1', '3', '5', '6', 'C', '2020-05-14 20:48:07');
INSERT INTO `question` VALUES ('35', '8', '0', '设一个堆栈的入栈顺序是1、2、3、4、5。若第一个出栈的元素是4，则最后一个出栈的元素必定是', '2', '1', '3', '5', '1或者5', 'D', '2020-05-14 20:48:07');
INSERT INTO `question` VALUES ('36', '8', '0', '以下数据结构中，（ ）是非线性数据结构', '2', '树', '字符串', '队列', '栈', 'A', '2020-05-14 20:48:07');
INSERT INTO `question` VALUES ('37', '8', '0', '从逻辑上可将数据结构分为', '2', '动态结构和静态结构', '紧凑结构和非紧凑结构', '内部结构和外部结构', '线性结构和非线性结构', 'D', '2020-05-14 20:48:07');
INSERT INTO `question` VALUES ('38', '8', '0', '以下属于逻辑结构的是', '2', '顺序表', '散列表', '有序表', '单链表', 'C', '2020-05-14 20:48:07');
INSERT INTO `question` VALUES ('39', '8', '0', '下列属于线性数据结构的是', '2', '栈', '树', '图', '集合', 'A', '2020-05-14 20:48:07');
INSERT INTO `question` VALUES ('40', '8', '0', '在AOE网中，什么是关键路径', '2', '最短回路', '最长回路', '从第一个事件到最后一个事件的最短路径', '从第一个事件到最后一个事件的最长路径', 'D', '2020-05-14 20:48:07');
INSERT INTO `question` VALUES ('41', '8', '0', '在下列查找的方法中，平均查找长度与结点个数无关的查找方法是', '2', '顺序查找', '二分法', '利用哈希（散列）表', '利用二叉搜索树', 'C', '2020-05-14 20:48:07');
INSERT INTO `question` VALUES ('42', '8', '0', '将10个元素散列到100000个单元的哈希表中，是否一定产生冲突', '2', '一定会', '可能会', '一定不会', '有万分之一的可能会', 'B', '2020-05-14 20:48:07');
INSERT INTO `question` VALUES ('43', '8', '0', '设有1000个元素的有序序列，如果用二分插入排序再插入一个元素，则最大比较次数是', '2', '1000', '999', '500', '10', 'D', '2020-05-14 20:48:07');
INSERT INTO `question` VALUES ('44', '8', '0', '能够保障数据的接收方证明数据的来源和完整性以及数据不被伪造的方法是', '2', '加密', '认证交换', '数字签名', '安全审计跟踪', 'C', '2020-05-14 20:48:07');
INSERT INTO `question` VALUES ('45', '8', '0', '__________是一个实体假装另外一个实体', '2', '被动攻击', '重放', '服务拒绝', '伪装', 'D', '2020-05-14 20:48:07');
INSERT INTO `question` VALUES ('46', '8', '0', '__________涉及到数据单元的被动捕获以及后续的重传来产生非授权访问', '2', '重放', '服务拒绝', '伪装', '破坏', 'A', '2020-05-14 20:48:07');
INSERT INTO `question` VALUES ('47', '8', '0', '_________的实现使用了 X.509证书', '2', 'CBC', 'HMAC', 'KDC', 'PKI', 'D', '2020-05-14 20:48:07');
INSERT INTO `question` VALUES ('48', '8', '0', '两个端系统间的通信是使用 ______ 来加密的', '2', '消息', '会话密钥', '永久密钥', '主密钥', 'B', '2020-05-14 20:48:07');
INSERT INTO `question` VALUES ('49', '8', '0', '________是用于分布式环境中使用的认证服务', '2', 'Kerberos', 'PCBC', 'X.509', 'AES', 'A', '2020-05-14 20:48:07');
INSERT INTO `question` VALUES ('50', '8', '0', '_____机制不适合无连接的应用，因为它需要在信息传输之前先互相交换信息(也称握手)', '2', '时间戳', '挑战/应答', '重放', '回复', 'B', '2020-05-17 20:48:07');
INSERT INTO `question` VALUES ('51', '8', '0', '与一个用户相关的最常见的认证信息是', '2', '时间戳', '票据', '口令', '随机数', 'C', '2020-05-17 20:48:07');
INSERT INTO `question` VALUES ('52', '8', '0', '________过程能证明接收方收到的消息没有被篡改并且消息源的身份是真实的。', '2', '消息认证', '用户认证', '身份证明', '验证', 'A', '2020-05-17 20:48:07');
INSERT INTO `question` VALUES ('53', '8', '0', '设主串的长度为n，模式串的长度为m，则串匹配的KMP算法时间复杂度是', '2', 'O(m)', 'O(n)', 'O(n + m)', 'O(n×m)', 'C', '2020-05-17 20:48:07');
INSERT INTO `question` VALUES ('54', '8', '0', '数组A[1..5,1..6]每个元素占5个单元，将其按行优先次序存储在起始地址为1000的连续的内存单元中，则元素A[5,5]的地址为', '2', '1120', '1125', '1140', '1145', 'C', '2020-05-17 20:48:07');
INSERT INTO `question` VALUES ('55', '8', '0', '若无向图G =（V，E）中含7个顶点，要保证图G在任何情况下都是连通的，则需要的边数最少是', '2', '6', '15', '16', '21', 'C', '2020-05-17 20:48:07');
INSERT INTO `question` VALUES ('56', '8', '0', '具有5个顶点的有向完全图有多少条弧', '2', '10', '16', '20', '25', 'C', '2020-05-17 20:48:07');
INSERT INTO `question` VALUES ('57', '8', '0', '对于一个具有N个顶点的无向图，要连通所有顶点至少需要多少条边', '2', 'N−1', 'N', 'N+1', 'N/2', 'A', '2020-05-17 20:48:07');
INSERT INTO `question` VALUES ('58', '8', '0', '对于有向图，其邻接矩阵表示比邻接表表示更易于', '2', '求一个顶点的入度', '求一个顶点的出边邻接点', '进行图的深度优先遍历', '进行图的广度优先遍历', 'A', '2020-05-17 20:48:07');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色表id',
  `name` varchar(32) NOT NULL COMMENT '角色名称',
  `remark` varchar(128) DEFAULT NULL COMMENT '角色备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '超级管理员拥有一切权限！');
INSERT INTO `role` VALUES ('2', '普通用户', '普通用户，请自由授权！');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考生表id',
  `subjectId` int(11) NOT NULL COMMENT '所属学科专业ID',
  `name` varchar(32) NOT NULL COMMENT '登录名',
  `password` varchar(32) NOT NULL COMMENT '登录密码',
  `trueName` varchar(32) DEFAULT NULL COMMENT '姓名',
  `tel` varchar(16) DEFAULT NULL COMMENT '手机号',
  `createTime` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `subjectId` (`subjectId`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='考生表';

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('2', '1', 'cg', '123', 'cg', '13656564656', '2020-04-21 20:40:48');
INSERT INTO `student` VALUES ('3', '5', 'llqllq', 'sadsad', 'llq', '1356565656', '2020-04-21 20:46:42');
INSERT INTO `student` VALUES ('4', '1', 'zwy', 'sadsadsa', '邹文燕', '18989898989', '2020-04-21 20:46:52');
INSERT INTO `student` VALUES ('5', '7', 'thl', 'dsad111', '童浩龙', '15656565656', '2020-04-21 20:47:00');
INSERT INTO `student` VALUES ('6', '1', 'xwh', 'llq', '徐文浩', '13918655696', '2020-05-01 21:33:31');
INSERT INTO `student` VALUES ('8', '6', 'tocque', '123456', '唐聚聚', '18959558585', '2020-05-04 16:51:59');
INSERT INTO `student` VALUES ('9', '1', 'linxi', '123', '夕聚聚', '13656565656', '2020-05-04 18:11:12');
INSERT INTO `student` VALUES ('10', '1', 'comwin', '123', '凛冬将至', '13656564545', '2020-05-04 18:22:19');
INSERT INTO `student` VALUES ('11', '1', 'loswin', '123', '凛冬将逝', '13989895959', '2020-05-04 18:23:40');
INSERT INTO `student` VALUES ('12', '7', 'dawn', '123123', '黎明初晓', '1556565655', '2020-05-04 18:27:45');
INSERT INTO `student` VALUES ('13', '8', 'tlx', '123344', '123', '123', '2020-05-11 20:52:57');
INSERT INTO `student` VALUES ('14', '1', 'sdlwsl', 'dsad111', '童浩龙', '15656565656', '2020-04-21 20:47:00');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学科专业表id',
  `name` varchar(64) NOT NULL COMMENT '学科名称',
  `remark` varchar(256) DEFAULT NULL COMMENT '学科备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='学科专业表';

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('1', '软件工程', '软件工程专业');
INSERT INTO `subject` VALUES ('5', '数学专业', '数学专业');
INSERT INTO `subject` VALUES ('6', '物理专业', '');
INSERT INTO `subject` VALUES ('7', '英语专业', '');
INSERT INTO `subject` VALUES ('8', 'cg', '测试');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表id',
  `username` varchar(32) NOT NULL COMMENT '用户名，登录名',
  `password` varchar(32) NOT NULL COMMENT '登录密码',
  `roleId` int(11) NOT NULL COMMENT '所属角色id',
  `photo` varchar(128) NOT NULL COMMENT '头像照片地址',
  `sex` int(1) NOT NULL DEFAULT '0' COMMENT '性别0,代表未知，1代表男，2代表女',
  `age` int(3) NOT NULL DEFAULT '0' COMMENT '年龄',
  `address` varchar(128) DEFAULT NULL COMMENT '家庭住址',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `roleId` (`roleId`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin123', '1', '/BaseProjectSSM/resources/upload/1544880711002.jpg', '1', '18', '上海市浦东新区浦东南路1835号');
INSERT INTO `user` VALUES ('13', 'cg', '123456', '2', '/OnlineExam/resources/upload/1578733190431.png', '1', '18', 'HNDD');
