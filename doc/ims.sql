/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.20 : Database - ims
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ims` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ims`;

/*Table structure for table `login_log` */

DROP TABLE IF EXISTS `login_log`;

CREATE TABLE `login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `login_log` */

insert  into `login_log`(`id`,`username`,`time`,`ip`,`device`,`os`,`browser`) values (233,'admin','2019-04-08 10:51:56','127.0.0.1','电脑','Windows 10','Chrome73.0.3683.86'),(237,'admin','2019-04-08 11:21:26','127.0.0.1','电脑','Windows 10','Chrome73.0.3683.86'),(238,'admin','2019-04-08 11:31:26','127.0.0.1','电脑','Windows 10','Chrome73.0.3683.86'),(239,'admin','2019-04-08 13:07:51','127.0.0.1','电脑','Windows 10','Chrome73.0.3683.86'),(240,'admin','2019-04-08 13:21:20','127.0.0.1','电脑','Windows 10','Chrome73.0.3683.86'),(241,'admin','2019-04-08 13:22:50','127.0.0.1','电脑','Windows 10','Chrome73.0.3683.86'),(242,'admin','2019-04-08 13:23:22','127.0.0.1','电脑','Windows 10','Chrome73.0.3683.86'),(243,'admin','2019-04-08 13:27:41','127.0.0.1','电脑','Windows 10','Chrome73.0.3683.86'),(244,'admin','2019-04-08 13:31:47','127.0.0.1','电脑','Windows 10','Chrome73.0.3683.86'),(245,'admin','2019-04-08 13:32:10','127.0.0.1','电脑','Windows 10','Chrome73.0.3683.86'),(246,'admin','2019-04-08 13:32:55','127.0.0.1','电脑','Windows 10','Chrome73.0.3683.86');

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `url` varchar(80) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `is_nav` int(255) DEFAULT NULL,
  `priority` int(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `p_id` bigint(20) DEFAULT NULL,
  `state` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_description` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`name`,`url`,`code`,`is_nav`,`priority`,`icon`,`p_id`,`state`) values (1,'用户管理',NULL,'no',1,1,'fa-users',0,1),(2,'角色管理',NULL,'no',1,2,'fa-graduation-cap',0,1),(3,'权限管理','','no',1,3,'fa-unlock-alt',0,1),(4,'用户列表','/user/list','user:list',1,1,'',1,1),(5,'添加用户','','user:add',0,NULL,'',4,1),(6,'删除用户','','user:delete',0,NULL,NULL,4,1),(7,'修改用户','','user:update',0,NULL,NULL,4,1),(8,'查看用户',NULL,'user:show',0,NULL,NULL,4,1),(9,'重置用户密码',NULL,'user:reset',0,NULL,NULL,4,1),(10,'角色列表','/role/list','role:list',1,1,'',2,1),(11,'添加角色','','role:add',0,NULL,NULL,10,1),(12,'删除角色','','role:delete',0,NULL,NULL,10,1),(13,'修改角色','','role:update',0,NULL,NULL,10,1),(14,'查看角色','','role:show',0,NULL,NULL,10,1),(15,'权限列表','/perm/list','perm:list',1,1,'',3,1),(16,'添加权限','','perm:add',0,NULL,NULL,15,1),(17,'删除权限','','perm:delete',0,NULL,NULL,15,1),(18,'更新权限','','perm:update',0,NULL,NULL,15,1),(19,'查看权限',NULL,'perm:show',0,NULL,NULL,15,1),(20,'用户登录日志','/loginLog/list','loginLog:list',1,2,NULL,1,1),(21,'删除登录日志',NULL,'loginLog:delete',0,NULL,NULL,20,1),(22,'查看登录日志',NULL,'loginLog:show',0,NULL,NULL,20,1),(31,'用户信息','/module-maintenance','userinfo:show',1,3,NULL,1,1);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `code` varchar(80) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`description`,`code`) values (1,'超级管理员','拥有系统的最高权限','superAdmin'),(2,'管理员','拥有系统管理权限','admin'),(3,'总经理','拥有企业管理权限','generalManager'),(4,'副总经理','拥有职工管理权限','deputyGeneralManager'),(5,'部门主管','拥有本部门管理权限','departmentHeads'),(6,'项目经理','拥有项目管理权限','projectManager'),(7,'普通职员','拥有查看/记录信息权限','');

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `role_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  KEY `FK_Reference_3` (`role_id`) USING BTREE,
  KEY `FK_Reference_4` (`permission_id`) USING BTREE,
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_role_permission` */

insert  into `sys_role_permission`(`role_id`,`permission_id`) values (2,1),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,20),(2,21),(2,22),(2,31),(2,2),(2,10),(2,11),(2,12),(2,13),(2,14),(2,3),(2,15),(2,16),(2,17),(2,18),(2,19),(6,1),(6,4),(6,7),(6,8),(6,2),(6,10),(6,13),(6,14),(6,3),(6,15),(6,18),(6,19),(5,1),(5,4),(5,5),(5,6),(5,7),(5,8),(5,2),(5,10),(5,11),(5,12),(5,13),(5,14),(5,3),(5,15),(5,16),(5,17),(5,18),(5,19),(4,1),(4,4),(4,5),(4,6),(4,7),(4,8),(4,31),(4,2),(4,10),(4,11),(4,12),(4,13),(4,14),(4,3),(4,15),(4,16),(4,17),(4,18),(4,19),(3,1),(3,4),(3,5),(3,6),(3,7),(3,8),(3,31),(3,2),(3,10),(3,11),(3,12),(3,13),(3,14),(3,3),(3,15),(3,16),(3,17),(3,18),(3,19),(1,1),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,20),(1,21),(1,22),(1,31),(1,2),(1,10),(1,11),(1,12),(1,13),(1,14),(1,3),(1,15),(1,16),(1,17),(1,18),(1,19),(1,32),(1,33),(7,1),(7,4),(7,8),(7,2),(7,10),(7,14),(7,3),(7,15),(7,19);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `salt` char(32) NOT NULL COMMENT '盐',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `state` int(1) NOT NULL COMMENT '帐号状态，0:未激活1:正常2:锁定',
  `real_name` varchar(80) DEFAULT NULL COMMENT '真实姓名',
  `gender` int(4) DEFAULT NULL COMMENT '性别',
  `nation` varchar(255) DEFAULT NULL COMMENT '民族',
  `birth` varchar(20) DEFAULT NULL COMMENT '出生日期',
  `education` varchar(30) DEFAULT NULL COMMENT '学历',
  `address` varchar(255) DEFAULT NULL COMMENT '住址',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机',
  `email` varchar(80) DEFAULT NULL COMMENT '电子邮箱',
  `department` varchar(255) DEFAULT NULL COMMENT '部门',
  `position` varchar(255) DEFAULT NULL COMMENT '职位',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `head` varchar(255) DEFAULT '/assets/images/avatars/profile-pic.jpg' COMMENT '头像',
  `activate_time` datetime DEFAULT NULL COMMENT '激活时间',
  `code` varchar(255) DEFAULT NULL COMMENT '邮件激活码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_username` (`username`) USING BTREE COMMENT '用户名唯一',
  UNIQUE KEY `index_email` (`email`) USING BTREE COMMENT '邮箱唯一',
  UNIQUE KEY `index_mobile` (`mobile`) USING BTREE COMMENT '手机号唯一'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`username`,`password`,`salt`,`create_time`,`state`,`real_name`,`gender`,`nation`,`birth`,`education`,`address`,`mobile`,`email`,`department`,`position`,`note`,`head`,`activate_time`,`code`) values (1,'admin','1637fcf8b38df9216beeab1ee78cabb8','84012b1f7ab582eb1a0eb46ed08fb5a9','2017-12-26 23:00:36',1,'开发',1,'汉族','2017-12-01','硕士','北京市 朝阳区','18888888888','qwe@pydyun.com','董事会','副总经理','无','/assets/images/avatars/male.jpg',NULL,NULL),(2,'test','361b382ebec4e25c01bc9e8ffd25014e','76f7df5fd5855b13066c2d980e970c64','2018-01-09 16:42:41',1,'测试',0,NULL,NULL,NULL,NULL,NULL,'qwe@pydy1un.com',NULL,NULL,NULL,'/assets/images/avatars/profile-pic.jpg','2018-01-02 13:30:04','444'),(3,'test2','b7dba05ba0d4c940752d82f831954d8d','8a9bcae569bcaba4eeedf683ca75ab11','2018-01-22 18:19:43',1,'测试2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/assets/images/avatars/profile-pic.jpg',NULL,NULL);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  KEY `FK_Reference_1` (`user_id`) USING BTREE,
  KEY `FK_Reference_2` (`role_id`) USING BTREE,
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values (2,2),(3,7),(1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
