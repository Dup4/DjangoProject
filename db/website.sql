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

 Date: 21/12/2019 21:11:40
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
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administrator_user
-- ----------------------------
INSERT INTO `administrator_user` VALUES (1, 'admin', 'pbkdf2_sha256$180000$rRbNZVmwrBju$exf8ZbMa9GISQdEaiUGj9/IisW/YRz/dKcKaEC8M2CY=', '刘瑜', '13396544599', 'nyuan@gu.cn', 1, 1, '2019-12-21', '2019-12-21', 1);
INSERT INTO `administrator_user` VALUES (2, 'xiasu', 'pbkdf2_sha256$180000$8A7lUQGXMOXi$HhyLiebJYCTLP87n+zR8svEvYSLyUjQZeVt+dWHa258=', '蓝莉', '13859445074', 'min49@ui.net', 1, 1, '2019-12-21', '2019-12-21', 1);
INSERT INTO `administrator_user` VALUES (3, 'yanming', 'pbkdf2_sha256$180000$G3sWSItqpRVy$YJdmmHS2JQsSXpgmxPJYMS1LdeKVF19TZV9z9HiA7L0=', '霍文', '18790963118', 'ema@ligao.cn', 1, 1, '2019-12-21', '2019-12-21', 1);
INSERT INTO `administrator_user` VALUES (4, 'min24', 'pbkdf2_sha256$180000$ICWTYupSMTfj$zKsYvoqLITv8WlbY6H//dlp1wGx6euDMmT+Kwoztaik=', '苏丹', '13811294932', 'msu@yahoo.com', 1, 1, '2019-12-21', '2019-12-21', 1);
INSERT INTO `administrator_user` VALUES (5, 'qguo', 'pbkdf2_sha256$180000$dwI5NV5pXZba$Rg2bJkw04IbP0LAHlBy1kV2aUF5kkkJEPIYq7M4xw4A=', '丁娟', '18691756386', 'ming57@ma.cn', 1, 1, '2019-12-21', '2019-12-21', 1);
INSERT INTO `administrator_user` VALUES (6, 'chaosong', 'pbkdf2_sha256$180000$ePq0Gu72VbaF$2L7Giz/XsPGy0JNQLT+sG9+ta3aRtiG7NNPpwzuxNN0=', '赵浩', '18249196815', 'daigang@hotmail.com', 1, 1, '2019-12-21', '2019-12-21', 1);
INSERT INTO `administrator_user` VALUES (7, 'yang16', 'pbkdf2_sha256$180000$Em4d7vlpw5SF$PUuZJoRtsfoiyUInYsdysKYfYpl9BFcxjDNGsFDSvrM=', '杨帅', '15248646849', 'liyong@shaoyuan.com', 1, 1, '2019-12-21', '2019-12-21', 1);
INSERT INTO `administrator_user` VALUES (8, 'zengfang', 'pbkdf2_sha256$180000$HcFYUZhUEzfi$HD0Z9sdliVhMdCUB4zcaQGxZOzQbeGFfWynHv/x3C5g=', '阳旭', '18661381871', 'leijun@hotmail.com', 1, 1, '2019-12-21', '2019-12-21', 1);
INSERT INTO `administrator_user` VALUES (9, 'wei06', 'pbkdf2_sha256$180000$VamCAwGSt5VI$Ohix9Yw4hr9+pncW0a6f1y2fii0s+/ujBz5borRlzJA=', '施秀云', '14798704894', 'yongyuan@ming.cn', 1, 1, '2019-12-21', '2019-12-21', 1);
INSERT INTO `administrator_user` VALUES (10, 'yan12', 'pbkdf2_sha256$180000$4EbUwBq3Hwkj$oEaF9TwUyRjvtS+iriz4AoteiRwp4Wd6AcZZES/XBT8=', '苟杨', '15806055411', 'fang43@leijia.net', 1, 1, '2019-12-21', '2019-12-21', 1);
INSERT INTO `administrator_user` VALUES (11, 'changxia', 'pbkdf2_sha256$180000$KZmkMdWA3cr8$AvF4LFqGZK27+MvdfLOzpLKY4o6nFIN55jumCl/nZ1U=', '张红', '15268340705', 'qiangmo@yahoo.com', 1, 1, '2019-12-21', '2019-12-21', 1);
INSERT INTO `administrator_user` VALUES (12, 'xkong', 'pbkdf2_sha256$180000$iXjroet8BlHa$y4M7Y6Em7B5SNFRzPcVOQO94JLnWcNmVFSy2YYCHNLQ=', '汪红梅', '15599898002', 'yanliao@01.cn', 1, 1, '2019-12-21', '2019-12-21', 1);
INSERT INTO `administrator_user` VALUES (13, 'vqiao', 'pbkdf2_sha256$180000$4yCcz1nv4yLK$B5BMaFCC0ZK4wjA4bRs+i9c2Nl6ZRa2cwVbzAvV4u7g=', '张玉英', '18065096540', 'guiyingchang@lc.cn', 1, 1, '2019-12-21', '2019-12-21', 1);
INSERT INTO `administrator_user` VALUES (14, 'jing47', 'pbkdf2_sha256$180000$dBXh7zynwINX$tuVpoY8z7Z8Krsw1PerNmatSzMr8Cj+xMJOAnuW/vn4=', '郭雪梅', '14757128310', 'lei17@chao.cn', 1, 1, '2019-12-21', '2019-12-21', 1);
INSERT INTO `administrator_user` VALUES (15, 'juanzou', 'pbkdf2_sha256$180000$hS8py4UkaDsB$zPjHS8xGHdsZKb3sb0ZYzfnLvWlorLhxHgxSZXeRzac=', '陶金凤', '15732898779', 'yangyi@minxia.cn', 1, 1, '2019-12-21', '2019-12-21', 1);
INSERT INTO `administrator_user` VALUES (16, 'czhang', 'pbkdf2_sha256$180000$ZXYvDE41oCrl$fvOXwEQsjAUC4rws4P302jStYxK16ZUoCmkHvJNCz+o=', '张伟', '13936026958', 'zsu@yan.cn', 1, 1, '2019-12-21', '2019-12-21', 1);
INSERT INTO `administrator_user` VALUES (17, 'yong40', 'pbkdf2_sha256$180000$L5SfaPaOr8hU$QvuMqTdBDfpL0aLxSFNdU79xiU/RHHq/6TSeC2AeywI=', '臧畅', '14597420154', 'sren@gmail.com', 1, 1, '2019-12-21', '2019-12-21', 1);
INSERT INTO `administrator_user` VALUES (18, 'jiesu', 'pbkdf2_sha256$180000$rtngJlPi4Wsm$vRoo6GRx3Ki4tSHZAuphphVg5Pjnw86xl5HOgkoJsBU=', '宾鑫', '13783146650', 'esun@gmail.com', 1, 1, '2019-12-21', '2019-12-21', 1);
INSERT INTO `administrator_user` VALUES (19, 'fengyong', 'pbkdf2_sha256$180000$J6G2cV01Sxid$8XOR8vhfUp/NoFtYg+NSAr+an9EZOTcml2IlMrAVI70=', '傅鑫', '18962439762', 'xia77@lichao.cn', 1, 1, '2019-12-21', '2019-12-21', 1);
INSERT INTO `administrator_user` VALUES (20, 'suping', 'pbkdf2_sha256$180000$AapnOzqEIzGh$Bixt2q0VAaZYofBaRLrghVf3sgQEaxFZAKGhqjFexeI=', '任燕', '15144709770', 'yiwei@24.cn', 1, 1, '2019-12-21', '2019-12-21', 1);

-- ----------------------------
-- Table structure for article_article
-- ----------------------------
DROP TABLE IF EXISTS `article_article`;
CREATE TABLE `article_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classify` int(11) NOT NULL,
  `is_recommend` tinyint(1) NOT NULL,
  `is_top` tinyint(1) NOT NULL,
  `is_publish` tinyint(1) NOT NULL,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_article
-- ----------------------------
INSERT INTO `article_article` VALUES (1, '规定', '通过因为项目其实更多.国际其实论坛系列直接.', 1, 0, 0, 0, '2019-12-21', '2019-12-21', 1);
INSERT INTO `article_article` VALUES (2, '学校', '责任应该不断.汽车生产对于情况系列设备运行.管理下载图片关于看到是一.', 1, 0, 0, 0, '2019-12-21', '2019-12-21', 1);
INSERT INTO `article_article` VALUES (3, '主题', '搜索注册来源显示出来用户程序.一起的人男人工作.', 1, 0, 0, 0, '2019-12-21', '2019-12-21', 1);
INSERT INTO `article_article` VALUES (4, '北京', '一定一样电影部分日期同时到了.政府工程业务情况当前次数已经搜索.法律同时点击电脑用户记者音乐.', 1, 0, 0, 0, '2019-12-21', '2019-12-21', 1);
INSERT INTO `article_article` VALUES (5, '起来', '自己公司一样人民全国资源.', 1, 0, 0, 0, '2019-12-21', '2019-12-21', 1);
INSERT INTO `article_article` VALUES (6, '商品', '可是已经技术如此.的人其他有限虽然.说明进入客户当然.', 1, 0, 0, 0, '2019-12-21', '2019-12-21', 1);
INSERT INTO `article_article` VALUES (7, '回复', '学生的人需要客户当然美国.工具网站回复状态标准相关.', 1, 0, 0, 0, '2019-12-21', '2019-12-21', 1);
INSERT INTO `article_article` VALUES (8, '经营', '新闻内容汽车网络帖子.要求市场需要因为学校.', 1, 0, 0, 0, '2019-12-21', '2019-12-21', 1);
INSERT INTO `article_article` VALUES (9, '系列', '问题公司为什生活公司.空间系列次数进行关系.如何搜索服务其中.或者设计由于特别技术现在.', 1, 0, 0, 0, '2019-12-21', '2019-12-21', 1);
INSERT INTO `article_article` VALUES (10, '主题', '搜索首页帮助中国可能信息.网络音乐不能.', 1, 0, 0, 0, '2019-12-21', '2019-12-21', 1);

-- ----------------------------
-- Table structure for article_classify
-- ----------------------------
DROP TABLE IF EXISTS `article_classify`;
CREATE TABLE `article_classify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` int(11) NOT NULL,
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add user', 7, 'add_user');
INSERT INTO `auth_permission` VALUES (26, 'Can change user', 7, 'change_user');
INSERT INTO `auth_permission` VALUES (27, 'Can delete user', 7, 'delete_user');
INSERT INTO `auth_permission` VALUES (28, 'Can view user', 7, 'view_user');
INSERT INTO `auth_permission` VALUES (29, 'Can add role', 8, 'add_role');
INSERT INTO `auth_permission` VALUES (30, 'Can change role', 8, 'change_role');
INSERT INTO `auth_permission` VALUES (31, 'Can delete role', 8, 'delete_role');
INSERT INTO `auth_permission` VALUES (32, 'Can view role', 8, 'view_role');
INSERT INTO `auth_permission` VALUES (33, 'Can add user', 9, 'add_user');
INSERT INTO `auth_permission` VALUES (34, 'Can change user', 9, 'change_user');
INSERT INTO `auth_permission` VALUES (35, 'Can delete user', 9, 'delete_user');
INSERT INTO `auth_permission` VALUES (36, 'Can view user', 9, 'view_user');
INSERT INTO `auth_permission` VALUES (37, 'Can add article', 10, 'add_article');
INSERT INTO `auth_permission` VALUES (38, 'Can change article', 10, 'change_article');
INSERT INTO `auth_permission` VALUES (39, 'Can delete article', 10, 'delete_article');
INSERT INTO `auth_permission` VALUES (40, 'Can view article', 10, 'view_article');
INSERT INTO `auth_permission` VALUES (41, 'Can add classify', 11, 'add_classify');
INSERT INTO `auth_permission` VALUES (42, 'Can change classify', 11, 'change_classify');
INSERT INTO `auth_permission` VALUES (43, 'Can delete classify', 11, 'delete_classify');
INSERT INTO `auth_permission` VALUES (44, 'Can view classify', 11, 'view_classify');
INSERT INTO `auth_permission` VALUES (45, 'Can add visitors', 12, 'add_visitors');
INSERT INTO `auth_permission` VALUES (46, 'Can change visitors', 12, 'change_visitors');
INSERT INTO `auth_permission` VALUES (47, 'Can delete visitors', 12, 'delete_visitors');
INSERT INTO `auth_permission` VALUES (48, 'Can view visitors', 12, 'view_visitors');

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
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (8, 'administrator', 'role');
INSERT INTO `django_content_type` VALUES (9, 'administrator', 'user');
INSERT INTO `django_content_type` VALUES (10, 'article', 'article');
INSERT INTO `django_content_type` VALUES (11, 'article', 'classify');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (12, 'echarts', 'visitors');
INSERT INTO `django_content_type` VALUES (7, 'member', 'user');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

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
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-12-21 11:59:07.309618');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-12-21 11:59:07.621784');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-12-21 11:59:09.258895');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-12-21 11:59:09.449458');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-12-21 11:59:09.459432');
INSERT INTO `django_migrations` VALUES (6, 'administrator', '0001_initial', '2019-12-21 11:59:09.548701');
INSERT INTO `django_migrations` VALUES (7, 'article', '0001_initial', '2019-12-21 11:59:09.837152');
INSERT INTO `django_migrations` VALUES (8, 'contenttypes', '0002_remove_content_type_name', '2019-12-21 11:59:09.995780');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0002_alter_permission_name_max_length', '2019-12-21 11:59:10.064597');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0003_alter_user_email_max_length', '2019-12-21 11:59:10.142388');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0004_alter_user_username_opts', '2019-12-21 11:59:10.153361');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0005_alter_user_last_login_null', '2019-12-21 11:59:10.231151');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0006_require_contenttypes_0002', '2019-12-21 11:59:10.235141');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0007_alter_validators_add_error_messages', '2019-12-21 11:59:10.246112');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0008_alter_user_username_max_length', '2019-12-21 11:59:10.324901');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0009_alter_user_last_name_max_length', '2019-12-21 11:59:10.417672');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0010_alter_group_name_max_length', '2019-12-21 11:59:10.518403');
INSERT INTO `django_migrations` VALUES (18, 'auth', '0011_update_proxy_permissions', '2019-12-21 11:59:10.534360');
INSERT INTO `django_migrations` VALUES (19, 'echarts', '0001_initial', '2019-12-21 11:59:10.583231');
INSERT INTO `django_migrations` VALUES (20, 'member', '0001_initial', '2019-12-21 11:59:10.697923');
INSERT INTO `django_migrations` VALUES (21, 'sessions', '0001_initial', '2019-12-21 11:59:10.773721');

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of echarts_visitors
-- ----------------------------
INSERT INTO `echarts_visitors` VALUES (1, 123, '2019-12-14', '2019-12-14', 1);
INSERT INTO `echarts_visitors` VALUES (2, 150, '2019-12-15', '2019-12-15', 1);
INSERT INTO `echarts_visitors` VALUES (3, 230, '2019-12-16', '2019-12-16', 1);
INSERT INTO `echarts_visitors` VALUES (4, 54, '2019-12-17', '2019-12-17', 1);
INSERT INTO `echarts_visitors` VALUES (5, 79, '2019-12-18', '2019-12-18', 1);
INSERT INTO `echarts_visitors` VALUES (6, 456, '2019-12-19', '2019-12-19', 1);
INSERT INTO `echarts_visitors` VALUES (7, 321, '2019-12-20', '2019-12-20', 1);
INSERT INTO `echarts_visitors` VALUES (8, 650, '2019-12-21', '2019-12-21', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_user
-- ----------------------------
INSERT INTO `member_user` VALUES (1, 'xiulanqin', 'pbkdf2_sha256$180000$o3t8TCMia7ar$24ku3zwOiAG8huU0lWhkplKxhDJ6am7Zn+zf3Zjkb1Q=', '雷平', 0, '13972175415', 'zengxiulan@juanxiong.cn', '湖南省刚县静安何街G座 848787', '2019-12-21', '2019-12-21', 1);
INSERT INTO `member_user` VALUES (2, 'liuqiang', 'pbkdf2_sha256$180000$WQW1DRlQt0zZ$DS1DgfKn/B/ZmS22Erj6E/E3AekCNDNOepKIJDdKS0Y=', '李建军', 0, '18557727432', 'fanwei@gmail.com', '广东省成市城北邹路W座 163984', '2019-12-21', '2019-12-21', 1);
INSERT INTO `member_user` VALUES (3, 'yongwang', 'pbkdf2_sha256$180000$Lair6Rlm4U0c$t4Ekyz4/Wq5PJxDNVipR3itqe51QnitvSnLrdYMBq5o=', '金秀兰', 0, '15091017268', 'xiulanyi@kangdong.cn', '湖南省波县孝南香港路T座 962320', '2019-12-21', '2019-12-21', 1);
INSERT INTO `member_user` VALUES (4, 'shenqiang', 'pbkdf2_sha256$180000$9MdSgRAGTLtq$+QIJCWk8ZtDTFG4PkjlQh6MglLzOnZJ+qcM3PWW+m68=', '王宇', 0, '14729262356', 'minduan@gmail.com', '安徽省鹏市房山拉萨路L座 521016', '2019-12-21', '2019-12-21', 1);
INSERT INTO `member_user` VALUES (5, 'jun29', 'pbkdf2_sha256$180000$u4FMHn3fw5SQ$+YAc6DybHQuZ+FtpTnPVOAd+XH5UYOfVYrZ7Qq+V5SY=', '汪玉珍', 0, '13158024640', 'liwen@aj.cn', '山西省石家庄市南溪申路c座 368857', '2019-12-21', '2019-12-21', 1);
INSERT INTO `member_user` VALUES (6, 'chaotian', 'pbkdf2_sha256$180000$UA8hJj0YNnjq$Ydn6PWNaLSdxfCN1xa5VM3C0zDRXIlZg738KUoY+7gM=', '雷华', 0, '18217438407', 'kduan@yahoo.com', '云南省玉梅县房山哈尔滨路Q座 224280', '2019-12-21', '2019-12-21', 1);
INSERT INTO `member_user` VALUES (7, 'oshen', 'pbkdf2_sha256$180000$r3UfMwLDZqQt$OtmfLCGDYOdNITace4Gu226CQS1TRk/OOcIskcU5rro=', '刘琴', 0, '13218813731', 'guming@gmail.com', '重庆市长沙市兴山杨街r座 520018', '2019-12-21', '2019-12-21', 1);
INSERT INTO `member_user` VALUES (8, 'luping', 'pbkdf2_sha256$180000$KqQGmohzmkCc$+kHz51aRWKo90CE/mOZdLWGzNnuM/wwJJsx1P761604=', '丁玉兰', 0, '13801327318', 'huangjun@junxiang.net', '吉林省娜市东城广州街p座 119151', '2019-12-21', '2019-12-21', 1);
INSERT INTO `member_user` VALUES (9, 'gang06', 'pbkdf2_sha256$180000$oipFTm5vGXd6$BbBKoxUGZlLIAW9jluVsAIFd6vYfQHptjX7JSIRSvzs=', '曹玉珍', 0, '13814574815', 'zhaogang@yahoo.com', '海南省鑫市翔安洪街n座 138885', '2019-12-21', '2019-12-21', 1);
INSERT INTO `member_user` VALUES (10, 'taozou', 'pbkdf2_sha256$180000$N2HAdlaCfT3K$6uxJM55/uqQYVTqrwiXGln2DPfP7jEcgtX+4OtW54Ak=', '龙志强', 0, '15622579460', 'xiulancai@yahoo.com', '福建省香港市南溪邯郸街f座 183565', '2019-12-21', '2019-12-21', 1);
INSERT INTO `member_user` VALUES (11, 'yang22', 'pbkdf2_sha256$180000$wu0ray9LQosS$uLX1eMWNA3mPBem2j0PJwB9TLkbVCXGPW4VhT2ectUY=', '叶建国', 0, '15268087997', 'leideng@qm.org', '山西省俊县平山萧街n座 738465', '2019-12-21', '2019-12-21', 1);
INSERT INTO `member_user` VALUES (12, 'fang75', 'pbkdf2_sha256$180000$46M4RYm2DJFW$0hy+H6FDcpHD3Qnd/mTJF88jTBQJMmqaLQzb64PnUxQ=', '万桂芳', 0, '15024324133', 'juanshi@yahoo.com', '江苏省文县海港南昌街R座 430754', '2019-12-21', '2019-12-21', 1);
INSERT INTO `member_user` VALUES (13, 'xiulan95', 'pbkdf2_sha256$180000$2MTFy8845xgs$1JJpXRCZc9F00ndoeFrXQGtM/mDH8N+/m/7mfFeXHss=', '邵桂芝', 0, '15825073396', 'yluo@juan.cn', '黑龙江省坤县清城郑路T座 317216', '2019-12-21', '2019-12-21', 1);
INSERT INTO `member_user` VALUES (14, 'juangong', 'pbkdf2_sha256$180000$kirlXZLs0K4Q$pDd7OfbJ2n9gfFeaVFSftoCcmNsWmzyNjAxXWUjhBu0=', '陈晨', 0, '15022909183', 'jiangxiuying@88.cn', '广西壮族自治区六安县高明贾街m座 334677', '2019-12-21', '2019-12-21', 1);
INSERT INTO `member_user` VALUES (15, 'ming75', 'pbkdf2_sha256$180000$UUEkpyQnxmOc$JeV0AIuapLzYVlBuE95yTgQQAFz3h5mQxS86ggzThH0=', '曾秀珍', 0, '14586296703', 'shenyan@weina.net', '黑龙江省霞县江北重庆路M座 696295', '2019-12-21', '2019-12-21', 1);
INSERT INTO `member_user` VALUES (16, 'nfu', 'pbkdf2_sha256$180000$NqmQ4WhHz84g$WZdh1H9P5tB3pQ2bFQD6s/1ABhJPgQFTVwP3TOq/Kdc=', '蒋飞', 0, '18669171662', 'xia43@huxiong.cn', '贵州省欢县大兴王街t座 752587', '2019-12-21', '2019-12-21', 1);
INSERT INTO `member_user` VALUES (17, 'xia94', 'pbkdf2_sha256$180000$tijGLHZpIeDN$G7o7maKBw6NQVjmsaVcqtkCJ+fDUOlH5AhSGDyDtpvs=', '孙慧', 0, '18670956497', 'hsu@hotmail.com', '河北省昆明市平山郑州街z座 183327', '2019-12-21', '2019-12-21', 1);
INSERT INTO `member_user` VALUES (18, 'pingpan', 'pbkdf2_sha256$180000$LgTtXua01zrz$famvx1d/6IwxREQ6R9un+maWDQObyBaySrkX9aCjQiQ=', '许凯', 0, '13713380194', 'longchao@yahoo.com', '云南省南京县高坪辛路Q座 561111', '2019-12-21', '2019-12-21', 1);
INSERT INTO `member_user` VALUES (19, 'yanxie', 'pbkdf2_sha256$180000$fLcOI2zFsVx1$I7TcQXaM3TRF8Ms/XUEagyFKj2R+4aL1g+Z0assTXlE=', '张伟', 0, '14547202632', 'chaochang@guiying.cn', '山东省建华县长寿林路V座 792799', '2019-12-21', '2019-12-21', 1);
INSERT INTO `member_user` VALUES (20, 'leiyang', 'pbkdf2_sha256$180000$2ywIoGYrbwvc$YWv6LHpvP1Jybv6tNMjgpKP9Sn5nfRdce8ne8IGpGb8=', '刘帅', 0, '18965920394', 'bduan@gmail.com', '天津市石家庄市闵行董路P座 960781', '2019-12-21', '2019-12-21', 1);

SET FOREIGN_KEY_CHECKS = 1;
