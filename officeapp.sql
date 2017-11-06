/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50515
Source Host           : 127.0.0.1:3300
Source Database       : officeapp

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2017-11-07 00:11:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add mial address', '7', 'add_mialaddress');
INSERT INTO `auth_permission` VALUES ('20', 'Can change mial address', '7', 'change_mialaddress');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete mial address', '7', 'delete_mialaddress');
INSERT INTO `auth_permission` VALUES ('22', 'Can add user', '8', 'add_user');
INSERT INTO `auth_permission` VALUES ('23', 'Can change user', '8', 'change_user');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete user', '8', 'delete_user');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL COMMENT '必需的。 密码的哈希值（Django不储存原始密码）。 See the Passwords section for more about',
  `last_login` datetime DEFAULT NULL COMMENT '用户上次登录的时间日期。 它被默认设置为当前的日期/时间。',
  `is_superuser` tinyint(1) NOT NULL COMMENT '布尔值 标识用户是否拥有所有权限，无需显式地权限分配定义。',
  `username` varchar(150) NOT NULL COMMENT '必需的，不能多于30个字符。 仅用字母数字式字符（字母、数字和下划线）。',
  `first_name` varchar(30) NOT NULL COMMENT '可选; 少于等于30字符。',
  `last_name` varchar(150) NOT NULL COMMENT '可选; 少于等于30字符',
  `email` varchar(254) NOT NULL COMMENT '可选。 邮件地址。',
  `is_staff` tinyint(1) NOT NULL COMMENT '布尔值。 用户是否拥有网站的管理权限。',
  `is_active` tinyint(1) NOT NULL COMMENT '布尔值. 设置该账户是否可以登录。 把该标志位置为False而不是直接删除账户。',
  `date_joined` datetime NOT NULL COMMENT '账号被创建的日期时间 当账号被创建时，它被默认设置为当前的日期/时间。',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$100000$Hh3g7wWENf5F$asKJBQ43aRE8P42a+ZEIUoOsNrkKYnjWTuCkSaLXmrE=', '2017-10-26 15:58:06', '1', 'admin', '', '', 'zxl0715@163.com', '1', '1', '2017-10-03 15:26:24');
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$100000$7CyXobF8wato$DqnArdAlniLRDrB3ttEp14lUkp8hQXG3fTd7moihic0=', '2017-10-29 15:13:18', '1', 'zxl', '', '', '', '1', '1', '2017-10-25 15:21:54');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
INSERT INTO `auth_user_user_permissions` VALUES ('1', '2', '1');
INSERT INTO `auth_user_user_permissions` VALUES ('2', '2', '2');
INSERT INTO `auth_user_user_permissions` VALUES ('3', '2', '3');
INSERT INTO `auth_user_user_permissions` VALUES ('4', '2', '4');
INSERT INTO `auth_user_user_permissions` VALUES ('5', '2', '5');
INSERT INTO `auth_user_user_permissions` VALUES ('6', '2', '6');
INSERT INTO `auth_user_user_permissions` VALUES ('7', '2', '7');
INSERT INTO `auth_user_user_permissions` VALUES ('8', '2', '8');
INSERT INTO `auth_user_user_permissions` VALUES ('9', '2', '9');
INSERT INTO `auth_user_user_permissions` VALUES ('10', '2', '10');
INSERT INTO `auth_user_user_permissions` VALUES ('11', '2', '11');
INSERT INTO `auth_user_user_permissions` VALUES ('12', '2', '12');
INSERT INTO `auth_user_user_permissions` VALUES ('13', '2', '13');
INSERT INTO `auth_user_user_permissions` VALUES ('14', '2', '14');
INSERT INTO `auth_user_user_permissions` VALUES ('15', '2', '15');
INSERT INTO `auth_user_user_permissions` VALUES ('16', '2', '16');
INSERT INTO `auth_user_user_permissions` VALUES ('17', '2', '17');
INSERT INTO `auth_user_user_permissions` VALUES ('18', '2', '18');
INSERT INTO `auth_user_user_permissions` VALUES ('19', '2', '19');
INSERT INTO `auth_user_user_permissions` VALUES ('20', '2', '20');
INSERT INTO `auth_user_user_permissions` VALUES ('21', '2', '21');
INSERT INTO `auth_user_user_permissions` VALUES ('22', '2', '22');
INSERT INTO `auth_user_user_permissions` VALUES ('23', '2', '23');
INSERT INTO `auth_user_user_permissions` VALUES ('24', '2', '24');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2017-10-03 15:40:46', '1', 'User object (1)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2017-10-25 15:21:54', '2', 'zxl', '1', '[{\"added\": {}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2017-10-25 15:22:59', '2', 'zxl', '2', '[{\"changed\": {\"fields\": [\"is_staff\", \"is_superuser\", \"user_permissions\", \"last_login\"]}}]', '4', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'mail', 'mialaddress');
INSERT INTO `django_content_type` VALUES ('8', 'mail', 'user');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-10-03 15:04:13');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2017-10-03 15:04:13');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2017-10-03 15:04:13');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2017-10-03 15:04:13');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2017-10-03 15:04:13');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2017-10-03 15:04:13');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2017-10-03 15:04:13');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2017-10-03 15:04:13');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2017-10-03 15:04:13');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2017-10-03 15:04:13');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2017-10-03 15:04:13');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0008_alter_user_username_max_length', '2017-10-03 15:04:14');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0009_alter_user_last_name_max_length', '2017-10-03 15:04:14');
INSERT INTO `django_migrations` VALUES ('14', 'mail', '0001_initial', '2017-10-03 15:04:14');
INSERT INTO `django_migrations` VALUES ('15', 'sessions', '0001_initial', '2017-10-03 15:04:14');
INSERT INTO `django_migrations` VALUES ('16', 'mail', '0002_user_addtime', '2017-10-04 03:27:00');
INSERT INTO `django_migrations` VALUES ('17', 'mail', '0003_auto_20171004_1151', '2017-10-04 03:51:51');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('26ky82gn9b0syvlot5psycnj4l91e2d3', 'ZTUxZjcxMzUxMDJhNDkzY2E2NTkxMjBhZTZjZGNkNjM5ZTk4MWE2Njp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmOTkyYzg5Y2ExNmUwYjUyNzdkOWY5MTI0YjJmOWE1NmE0MTljNzM1In0=', '2017-11-12 15:13:18');
INSERT INTO `django_session` VALUES ('6gvrrqzy284wc1q6wycdcdul8bym30kz', 'ZTUxZjcxMzUxMDJhNDkzY2E2NTkxMjBhZTZjZGNkNjM5ZTk4MWE2Njp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmOTkyYzg5Y2ExNmUwYjUyNzdkOWY5MTI0YjJmOWE1NmE0MTljNzM1In0=', '2017-11-11 15:11:44');
INSERT INTO `django_session` VALUES ('6iho5dgn3r7cwvkdwkxi628jlu7a1sgb', 'ZTUxZjcxMzUxMDJhNDkzY2E2NTkxMjBhZTZjZGNkNjM5ZTk4MWE2Njp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmOTkyYzg5Y2ExNmUwYjUyNzdkOWY5MTI0YjJmOWE1NmE0MTljNzM1In0=', '2017-11-11 16:07:24');
INSERT INTO `django_session` VALUES ('b1c9lnvuxen1tyehirxw92w6r87rv6ap', 'NmRiZjNmNGJlNzM4ZjMxMDM2MmVkZDE2NGQwNDZhMjNlNGM3YmYyODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2NjAxZjJlMDA5ZDQ4YjEyODk0NjJjM2Y0MTI2ZjJhMjVlNDhkMWUyIn0=', '2017-10-17 15:26:35');
INSERT INTO `django_session` VALUES ('cie71w49wd3tg6e1racxgetm288re11c', 'ZTUxZjcxMzUxMDJhNDkzY2E2NTkxMjBhZTZjZGNkNjM5ZTk4MWE2Njp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmOTkyYzg5Y2ExNmUwYjUyNzdkOWY5MTI0YjJmOWE1NmE0MTljNzM1In0=', '2017-11-11 14:00:29');
INSERT INTO `django_session` VALUES ('i33584feai67weymzymizbftwmhqs6hc', 'NzA0MGI2YmMyMWY1MjY3YjkwM2U5MTYzMGM3MGQ2NjNkMjRhMWM2ODp7fQ==', '2017-11-08 04:57:43');
INSERT INTO `django_session` VALUES ('nurk1hq2gxz7rirntui8tzywt74mdsjb', 'NzA0MGI2YmMyMWY1MjY3YjkwM2U5MTYzMGM3MGQ2NjNkMjRhMWM2ODp7fQ==', '2017-11-08 04:58:40');
INSERT INTO `django_session` VALUES ('z72cehb6a9n1tbdtm4548jex7kcib68o', 'ZTUxZjcxMzUxMDJhNDkzY2E2NTkxMjBhZTZjZGNkNjM5ZTk4MWE2Njp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmOTkyYzg5Y2ExNmUwYjUyNzdkOWY5MTI0YjJmOWE1NmE0MTljNzM1In0=', '2017-11-11 15:16:20');

-- ----------------------------
-- Table structure for mail_mialaddress
-- ----------------------------
DROP TABLE IF EXISTS `mail_mialaddress`;
CREATE TABLE `mail_mialaddress` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `mailUserName` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `addTime` datetime NOT NULL,
  `updateTime` datetime,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mail_mialaddress
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `CID` int(11) NOT NULL,
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'zxl', 'zxl', '1', '2017-10-04 03:27:00');
INSERT INTO `user` VALUES ('2', 'admin', 'adminadmin', '0', '2017-10-22 15:48:48');
INSERT INTO `user` VALUES ('3', 'admin', 'adminadmin', '0', '2017-10-22 15:48:50');
INSERT INTO `user` VALUES ('4', 'admin', 'adminadmin', '0', '2017-10-22 15:50:23');
INSERT INTO `user` VALUES ('5', 'admin', 'adminadmin', '0', '2017-10-23 16:04:04');
INSERT INTO `user` VALUES ('6', 'admin', 'adminadmin', '0', '2017-10-23 16:04:05');
INSERT INTO `user` VALUES ('7', 'admin', 'adminadmin', '0', '2017-10-23 16:04:05');
