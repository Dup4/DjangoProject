/*
 Navicat Premium Data Transfer

 Source Server         : xht
 Source Server Type    : MySQL
 Source Server Version : 50709
 Source Host           : localhost:3306
 Source Schema         : website

 Target Server Type    : MySQL
 Target Server Version : 50709
 File Encoding         : 65001

 Date: 04/01/2020 21:07:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator_role
-- ----------------------------
DROP TABLE IF EXISTS `administrator_role`;
CREATE TABLE `administrator_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_operation` tinyint(1) NOT NULL,
  `user_operation` tinyint(1) NOT NULL,
  `article_operation` tinyint(1) NOT NULL,
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
INSERT INTO `administrator_role` VALUES (1, '超级管理员', 0, 1, 1, '超级管理员', '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_role` VALUES (2, '用户管理员', 0, 1, 0, '用户管理员', '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_role` VALUES (3, '文章管理员', 0, 0, 1, '文章管理员', '2019-12-24', '2019-12-24', 1);

-- ----------------------------
-- Table structure for administrator_user
-- ----------------------------
DROP TABLE IF EXISTS `administrator_user`;
CREATE TABLE `administrator_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` int(11) NOT NULL,
  `superior` int(11) NOT NULL,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
INSERT INTO `administrator_user` VALUES (1, 'admin', 'pbkdf2_sha256$180000$0tkElfc6LfUK$cEEW+lm+0Ntedfq0COSZfsYMePrm8r1h7eHiR1oxnlM=', '张红霞', '13338861874', 'gang69@62.cn', 1, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (2, 'liping', 'pbkdf2_sha256$180000$8A5vjCRYyG2T$TIM0C4wZ+hWrU6LYE3x4ELnUJUAJwDgXzMkvf+RLYKI=', '钟宇', '13956365979', 'wei04@guoqian.cn', 2, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (3, 'yong60', 'pbkdf2_sha256$180000$kGwZxa4GRycU$MrE/BOSegu/cQ61zv61f/dLYcBrlLrrVyUjj5jeVzo8=', '粟畅', '14720430842', 'uyan@gmail.com', 2, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (4, 'guiying84', 'pbkdf2_sha256$180000$Pdq8GUA7eZLW$hmmWGlhXdHUpYPnAZcTjQKOFRQOx6HMFFahvQCoa1Y4=', '李龙', '14508892329', 'xuxiulan@gmail.com', 2, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (5, 'mmao', 'pbkdf2_sha256$180000$B6j4TxLbsl8o$q/VX5hvRoWLuf1DLsMzjeNgFEpfbNg9Q+HdShybepbc=', '王霞', '18209232717', 'fang19@gmail.com', 2, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (6, 'blei', 'pbkdf2_sha256$180000$FJXFA1ZSYjlC$GXxY1aP1g48Vp70A/ZQVXIRJEIZ4+BabIsNvv9714JE=', '张玉英', '15222236022', 'guiyinghou@liyan.net', 3, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (7, 'lei51', 'pbkdf2_sha256$180000$DFQUmOCVhccK$qPJ1XnuFHWTKPgEUq8rd18oce4XoteHxLuM2HWiFhMI=', '范丹丹', '15215171407', 'qyu@hotmail.com', 3, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (8, 'klei', 'pbkdf2_sha256$180000$7TO3lGUtVRXo$ewz18l1U/9+99SV2SNnFGYB5X8s0PL9Sn5ZJc+bXHbc=', '毛秀珍', '14577700160', 'fchang@27.cn', 3, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (9, 'houwei', 'pbkdf2_sha256$180000$fk1P8qBMru2P$hDnj6xiaTVE0xJY8QltHgLJIjDdE7E5566VlViaMjL4=', '王刚', '13224181904', 'chenwei@73.cn', 3, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (10, 'donggang', 'pbkdf2_sha256$180000$ZZsC2JOnePAl$dZjk7Op9QZIXKB545tgkApKucNBOd9lWPogxXA/fdSk=', '陈秀芳', '15121277336', 'qiang80@mengzhao.cn', 3, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (11, 'asdfasd', 'pbkdf2_sha256$180000$GatyXgsp54XY$uJxrgkjREn7ITltB1fkytlnvJYHbN1CqD/WXIdUIoJA=', '宋博', '15979876515', 'qiang87@hotmail.com', 3, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (12, 'she', 'pbkdf2_sha256$180000$ZtAKedlWVzBA$FDguSGFUkyzLZmhmJd1MDHjW5xJHVf9f7MCZ9gSDcmI=', '邱明', '18203082706', 'wenjuan@xiangliao.cn', 3, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (13, 'tao96', 'pbkdf2_sha256$180000$SNapmb4OtIlW$Eglr+HV8GpF85D1Kv/RP7NPOMjAXCS8cZxhn2UdvIDE=', '陈欣', '18015679389', 'qchang@hotmail.com', 3, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (14, 'yuanwei', 'pbkdf2_sha256$180000$Zryl8mP3TesU$XO595pm3WRy2RD2AQ4xAxLJ8P6Lvt768T7kow6jrdBA=', '王鹏', '13586080043', 'tshi@jiejing.cn', 3, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (15, 'tmao', 'pbkdf2_sha256$180000$dcBndGF87Fll$lhVwIqEfMVmgC7FbAvtMQSLDu4T9QduMl4LahMBerZw=', '陈斌', '14518029666', 'gangluo@yahoo.com', 3, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (16, 'kgu', 'pbkdf2_sha256$180000$Ma5lbD8DzVlq$pVfYIk1ZUIBNfCsqpMKexjlaJvXv0vWFr+CG552WqxM=', '陈志强', '15135456356', 'rlong@longfu.com', 3, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (17, 'mzhou', 'pbkdf2_sha256$180000$0IaGggwJXyl8$mrikFJo9rHfu78TRSS8jGz0nO0W0r/xSKtNHcF8nyyM=', '张淑英', '18042880764', 'dtang@xiawu.cn', 3, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (18, 'yinjing', 'pbkdf2_sha256$180000$tj28hxN22QJK$U4YugrD5nEMVbSCFOkc4ZEpru9sbHcQLJOhdmE/0QFY=', '孙瑞', '14512132662', 'ljia@liwei.net', 3, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (19, 'taopeng', 'pbkdf2_sha256$180000$UQdRxRcUakeh$KTeBCzt/LWYgfb31YyiaBA/lQOMa8B8lsY7fS+1O/L4=', '许欣', '15761440149', 'ydeng@juanyang.cn', 3, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (20, 'weihe', 'pbkdf2_sha256$180000$DjnwgWHUJso6$Sm3MYg/9xuDikRSvqGST0LlfX+re3iJPLQhbX6a/m54=', '夏淑珍', '13020514129', 'li18@hotmail.com', 3, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (21, 'ajkldf', 'pbkdf2_sha256$180000$Yz0rSeLqsfXY$NQEqi4eAqGao9eGkntjTBC3qRjBtWtNwJhKywDr1p5I=', '徐丽娟', '13782174697', 'jingchen@jun.org', 3, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (22, 'yong78', 'pbkdf2_sha256$180000$OXorlsl2epBE$LzYjrnCG25OJfE8lKd54V5KAibIErKqHK4ZZUE/lBko=', '万慧', '14538039626', 'juanfan@yangyan.cn', 3, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (23, 'rxiong', 'pbkdf2_sha256$180000$uZRjRrQ5KVlA$L1z0exG04LiPqKg1Kw+ZJFCQml1sPPpN/aYJh/OVrqE=', '郝婷', '15875912544', 'etao@gu.cn', 3, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (24, 'jingzhao', 'pbkdf2_sha256$180000$6noviw9LLDTG$Li3y+a5uGEKL4WgQfFH+VK5FZIcylq+kyI2k3PFVPrM=', '吕涛', '18116103064', 'tpan@panliao.cn', 3, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (25, 'guiyingzheng', 'pbkdf2_sha256$180000$J7yQW1ipsIvQ$9izunUmC2hTv0dyNwTwMkn6pL2Trvmf6J4wS9Tjw0rI=', '田桂花', '15242457604', 'qiang62@hotmail.com', 3, 1, '2019-12-24', '2019-12-24', 1);
INSERT INTO `administrator_user` VALUES (81, '2017', 'pbkdf2_sha256$180000$Q5JLwuvh6j29$6rwNHZQ6VHqmLMA4E40ysiwHZ/TiFEtk6Ew3IccGl0o=', '2017', '15355461355', '1@qq.com', 3, 0, '2019-12-24', '2019-12-24', 1);

-- ----------------------------
-- Table structure for article_article
-- ----------------------------
DROP TABLE IF EXISTS `article_article`;
CREATE TABLE `article_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `college` int(11) NOT NULL,
  `classify` int(11) NOT NULL,
  `is_recommend` tinyint(1) NOT NULL,
  `is_top` tinyint(1) NOT NULL,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `page_view` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for article_classify
-- ----------------------------
DROP TABLE IF EXISTS `article_classify`;
CREATE TABLE `article_classify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `article_classify` VALUES (1, '师大新闻', '师大新闻', '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_classify` VALUES (2, '学科建设', '学科建设', '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_classify` VALUES (3, '杭师人物', '杭师人物', '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_classify` VALUES (4, '图说杭师', '图说杭师', '2019-12-24', '2019-12-24', 1);
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
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for echarts_visitors
-- ----------------------------
DROP TABLE IF EXISTS `echarts_visitors`;
CREATE TABLE `echarts_visitors`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitors` int(11) NOT NULL,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `echarts_visitors` VALUES (1, 354, '2019-12-17', '2019-12-17', 1);
INSERT INTO `echarts_visitors` VALUES (2, 153, '2019-12-18', '2019-12-18', 1);
INSERT INTO `echarts_visitors` VALUES (3, 23, '2019-12-19', '2019-12-19', 1);
INSERT INTO `echarts_visitors` VALUES (4, 412, '2019-12-20', '2019-12-20', 1);
INSERT INTO `echarts_visitors` VALUES (5, 123, '2019-12-21', '2019-12-21', 1);
INSERT INTO `echarts_visitors` VALUES (6, 132, '2019-12-22', '2019-12-22', 1);
INSERT INTO `echarts_visitors` VALUES (7, 423, '2019-12-23', '2019-12-23', 1);
INSERT INTO `echarts_visitors` VALUES (8, 123, '2019-12-24', '2019-12-24', 1);
INSERT INTO `echarts_visitors` VALUES (9, 2, '2020-01-04', '2020-01-04', 1);

-- ----------------------------
-- Table structure for member_user
-- ----------------------------
DROP TABLE IF EXISTS `member_user`;
CREATE TABLE `member_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_user
-- ----------------------------
INSERT INTO `member_user` VALUES (1, 'jye', 'pbkdf2_sha256$180000$cOQlCewRAObE$hL2l2Vhyn66/7rneZBhsjgeofP+cqiq8TL3IkLzitMI=', '吴玉', 0, '15038579369', 'caoyan@yangli.cn', '河北省辛集市东丽钱街I座 486532', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (2, 'lei59', 'pbkdf2_sha256$180000$BIcGAx5ph3Pw$J6DrRBU7gd3NgGAMq5XLSVPECwNvpybPZy2CEJpJluw=', '郭雪', 0, '13375103010', 'xxia@guiyingzhong.org', '安徽省宁市孝南兴安盟街q座 583059', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (3, 'houxiulan', 'pbkdf2_sha256$180000$EU0Xj5rfKepe$1NEacg+15StBK5CtFG3aiytCbqzjNCLS2hESU2ICn7U=', '吴琳', 0, '18717137002', 'qiang21@gmail.com', '河北省辛集县普陀辛集街r座 656940', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (4, 'ylei', 'pbkdf2_sha256$180000$HvMcWxhWCtvU$whgn8Qwt3UZGfhQlNWWQScucqStj4d1w5LKnm6Sdzf8=', '陈东', 0, '13702748727', 'mqin@xie.cn', '贵州省秀兰市清城刘街x座 791215', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (5, 'yanyi', 'pbkdf2_sha256$180000$4LoDywQmIwtr$9H9L3R4TxIZd2bXf6kYr6u2i+74251Riq+0xONhgYhw=', '许帅', 0, '18848914350', 'mqiu@gmail.com', '重庆市红霞县沈河齐齐哈尔街M座 332143', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (6, 'xiexia', 'pbkdf2_sha256$180000$lODVouby4yda$yuj9liFZCroyXyJjo0cy+qZy/aBOk7y8oQgHpiXE3Gk=', '李艳', 0, '15019079550', 'gangyang@aj.cn', '江西省雪市魏都陶街s座 437053', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (7, 'mwan', 'pbkdf2_sha256$180000$gSVPveHruBbj$bYcRYYFSZnUMuKUF1aO6VoX9NfBCvhPKNoKdefzpVC4=', '任彬', 0, '15200946614', 'lkong@gb.cn', '吉林省洁市梁平福州街n座 197421', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (8, 'daijuan', 'pbkdf2_sha256$180000$0j7vmhm8TrwS$nf1SmreANbwUgf6tnD/S2uuAdkHAg4wRoglSNIF6lsw=', '方博', 0, '18830803517', 'qzeng@gang.cn', '福建省哈尔滨县东城阎街y座 638044', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (9, 'ming61', 'pbkdf2_sha256$180000$jajlSTsVw8tN$sLgY7PObvmkUOGThnypVZbx1E6twl9D1xr/+QuZ2rNw=', '李华', 0, '13865647713', 'gangchang@hotmail.com', '上海市郑州市房山黄路v座 563306', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (10, 'qinjun', 'pbkdf2_sha256$180000$wYWi4drAeskh$ni+wSLPmNwBmS0vJgHnGDYR3cuE+Ub7Y5jELG2xUTT8=', '康玉珍', 0, '18799735653', 'lshen@wei.cn', '甘肃省福州市怀柔刘街M座 395196', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (11, 'azou', 'pbkdf2_sha256$180000$BilW8RJpiRue$/Ma0Ah9QnzfpUs0NH/CHm0mnLxcyywrDyyezORY7vGU=', '张林', 0, '18545979403', 'mojun@bw.cn', '上海市台北市闵行孙路z座 328188', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (12, 'nkang', 'pbkdf2_sha256$180000$v4zQVLQGfvww$n/A0QXxjHCMwnfqQ8iAITzokyEM5B/FgWRisiLemnM0=', '兰莉', 0, '18807896968', 'minkong@gmail.com', '甘肃省北京县龙潭台北街h座 400448', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (13, 'qiang01', 'pbkdf2_sha256$180000$KLLgs7h7W1TB$r6KDSGRgvZxzjTNXO7tsAjjHODw1nvipGR7kWY7x2t4=', '冼岩', 0, '18057475308', 'vshi@yahoo.com', '云南省沈阳县花溪李路W座 668744', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (14, 'bshao', 'pbkdf2_sha256$180000$ggi6669YoPin$uTu1mVz+8XfwqfqXGFz3OOZbEPgnci3VLbx8hEUEs78=', '李瑜', 0, '13515363757', 'jdu@jietao.cn', '青海省杨县安次宜都路R座 339619', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (15, 'lzhao', 'pbkdf2_sha256$180000$2kT2DeO9k1Zf$GgJdHZC1kiPD9o9Fx0eDdqtQf0fmdX8cHs3sCyRz4+s=', '陈萍', 0, '18186114087', 'pinggao@qz.cn', '宁夏回族自治区兴安盟县上街太原街G座 986026', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (16, 'stian', 'pbkdf2_sha256$180000$T6XzrDLOapUs$dM6BrqEdAmdoXHY+kcdlnszzvejLp8wuch5HsmofrPk=', '鞠秀芳', 0, '15018863576', 'chaoguo@72.cn', '湖北省成都县秀英张家港路Z座 313577', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (17, 'guiyingbai', 'pbkdf2_sha256$180000$idP7zJHXgPPc$GYMkrSrLClZbOxsRJ5gPj/VfPdEkhP0xbcdBk+FjH+A=', '谭磊', 0, '13165597840', 'tanna@35.cn', '江苏省畅市孝南北京路b座 288354', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (18, 'zhongwei', 'pbkdf2_sha256$180000$CxZfLY0Ux7Jx$7vDjTyynUA0+XnjLucyLVZPOCsQqN7CQe7ugC9Qc9DQ=', '鞠俊', 0, '13253416924', 'xia96@zengwei.cn', '香港特别行政区香港县魏都祝街Q座 706403', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (19, 'zren', 'pbkdf2_sha256$180000$GvX3NigYEvMJ$cEbgYRdsxt2tnpDWwfQW42wj2S7krA8Z95Rboz1HDJo=', '黄建', 0, '18676931874', 'qiangye@ping.cn', '山东省博市西峰六盘水街K座 417784', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (20, 'qiang99', 'pbkdf2_sha256$180000$1rZaLejHk1IW$Z6qXnghkiGh+G792RiFxa0/2pQ8/BhaNurapcnQz72I=', '刘明', 0, '15169423973', 'fliu@gmail.com', '台湾省冬梅县友好方路n座 889422', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (21, 'ahe', 'pbkdf2_sha256$180000$5LJSjH4Bvl7B$wDBZog4w47lhcm65UnZm4ST/4UI031v3Qffvr/uILuA=', '周婷婷', 0, '15042164095', 'ukang@gmail.com', '青海省敏县房山辽阳路X座 476538', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (22, 'ping34', 'pbkdf2_sha256$180000$UCtaVNmCcrek$grrV18BnFskw+ZySMfeGu3CgwpcO59bDBPjzljsx0O0=', '金晶', 0, '14586018051', 'ming87@tangyuan.cn', '澳门特别行政区霞县丰都银川街W座 242803', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (23, 'jing75', 'pbkdf2_sha256$180000$TmEslRweA7nC$EK268xTEKr//eq+kMA5fxqTzemdV8JjNMdM8wdpJJsQ=', '张彬', 0, '15594241685', 'liyang@ev.cn', '四川省淑华县西夏杨路f座 183118', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (24, 'songjing', 'pbkdf2_sha256$180000$xNzNvr9tlbxq$jeMrndsojHU7ydFLwE8OCH+uRyl/bcgnV7dKFCfwOLE=', '钱丹丹', 0, '13099651901', 'lei91@hotmail.com', '广东省深圳市清城李路n座 665499', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (25, 'slong', 'pbkdf2_sha256$180000$SjRkkSVPZjCM$ctXn9Qscy0nSTOz1pYegmFvzzp+nxByRACqh8tOchHo=', '周娟', 0, '15643997826', 'wxiong@hotmail.com', '重庆市桂香县璧山潜江街j座 746689', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (26, 'kongxia', 'pbkdf2_sha256$180000$MpWkrGuCIxIO$W7TgrjF467tRiEvzek94rD3o0r4w5a249nKAYsJWo4I=', '朱玉珍', 0, '18076324083', 'hcai@guiying.cn', '新疆维吾尔自治区济南县蓟州阳路o座 650434', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (27, 'huyong', 'pbkdf2_sha256$180000$nEJZn46TwcJ7$zayeD8AlZEcWECWy8c1+IpygOQwbYWjFsB3ccD0ULfo=', '王秀珍', 0, '13352888754', 'yang01@yahoo.com', '浙江省巢湖县怀柔徐街k座 815047', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (28, 'fdeng', 'pbkdf2_sha256$180000$B4LZ82SVOcgk$Zh/8+mu/btADrBKrAalwxp6toW3Xmze+fPjkjcJN1/4=', '杨兵', 0, '15103567153', 'jingyuan@gmail.com', '陕西省晶市牧野张路D座 889057', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (29, 'tliu', 'pbkdf2_sha256$180000$pRPPg0Zavyby$A5KXfV0uEdsPBIARiqXIa+uKa4h8OqaOLoNEWJlKXxg=', '张柳', 0, '15509264592', 'zliu@jiejing.cn', '北京市亮县牧野西安路Y座 176186', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (30, 'taopeng', 'pbkdf2_sha256$180000$hYbZNw1u5Dtq$z9mFghpfcqbhirD35dK8RW5daNIfgWlOBs2vEv7uXLE=', '王秀梅', 0, '13159682824', 'daina@hotmail.com', '湖南省齐齐哈尔市长寿吴街V座 175678', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (31, 'ojin', 'pbkdf2_sha256$180000$BIhnR63SjH5O$UeZphfp8UupF320dhJ2IjtNlKPtU1kxAJ2SYZt91SSc=', '崔晨', 0, '18926362970', 'nakong@fangmao.cn', '河南省宁德市江北惠州街f座 358140', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (32, 'jli', 'pbkdf2_sha256$180000$Y5Z1BcBFt2zn$3Dh8zz8A3za6M84Xs13loUE2T0GwMeb/+HH6DKWO5xA=', '龙红梅', 0, '15541138760', 'luona@yaojin.cn', '香港特别行政区沈阳市双滦李路O座 798170', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (33, 'ghao', 'pbkdf2_sha256$180000$sVY12th4Au9D$VubAV/u+UkcIVoSbUYKbhtzbpOt7hJhnuFmQ42pKCws=', '罗阳', 0, '13400502808', 'yonglu@hotmail.com', '黑龙江省乌鲁木齐县淄川长沙路F座 850286', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (34, 'wenyang', 'pbkdf2_sha256$180000$AYQllw4FF72W$8yZZeM3hQhFFeGoc0R2kWQaOkrXZ5AfEQ7bBELJHeMg=', '张兵', 0, '14786009391', 'jiezhao@wangfang.cn', '山西省北京县淄川吕街f座 436665', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (35, 'lyan', 'pbkdf2_sha256$180000$MEK0QMg23Ayd$dGPKhcuGYUNOT5rCSLu88Eq0/Y0jJ6vSD/MMA7ET2Mg=', '孟凤兰', 0, '18906394167', 'yongmeng@hotmail.com', '香港特别行政区瑜县丰都张路w座 240194', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (36, 'hanping', 'pbkdf2_sha256$180000$mjbDX7k1iZL7$ysNLf5XQLsldXD95qzgfTpEJYMJiaZN7nWsKxg83FBk=', '杨涛', 0, '15246917227', 'xiafeng@leijuan.cn', '江苏省兰州县沈河胡街q座 624149', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (37, 'hhuang', 'pbkdf2_sha256$180000$hwIuYK0JgUPP$fDHS0frrg331Ukelc3FSmFM/FW0fomR2a6gG/DlUU84=', '邱玉英', 0, '13109761065', 'chao20@23.cn', '黑龙江省海门市怀柔武汉路D座 949818', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (38, 'shaoguiying', 'pbkdf2_sha256$180000$9j9euC7tqaJi$O8ZUZg0LFUFR6wNiwIOJvGFYJs2gsVCfjonODsUd8tM=', '张冬梅', 0, '13715513623', 'yangli@ui.cn', '浙江省张家港县高港沈街v座 768703', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (39, 'liqiu', 'pbkdf2_sha256$180000$1kZW9kgx5J0i$4jYjmyCQootCdzvNrZE4TzhH1caLxuLUC1cRvp+tuUw=', '施东', 0, '15076985783', 'litao@yahoo.com', '河北省海口市高明深圳路C座 322631', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (40, 'mhan', 'pbkdf2_sha256$180000$NGhfm1rNOwZY$mjbSbEsv40bGEwt0YGYxk6AwGuHBqJaz9uMSiIq9/Xw=', '沈芳', 0, '18757612567', 'nfan@gmail.com', '江西省秀珍县黄浦银川街a座 126537', '2019-12-24', '2019-12-24', 1);
INSERT INTO `member_user` VALUES (41, 'kshines', 'pbkdf2_sha256$180000$woIEleQ150Hd$BV3GFy2CEfoGDrpwHFx30VtVaa7/KJamWhE7akdBYDE=', 'ysk', 0, '17376594058', '850874665@qq.com', '132', '2019-12-24', '2019-12-24', 1);

SET FOREIGN_KEY_CHECKS = 1;
