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

 Date: 24/12/2019 18:50:43
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

-- ----------------------------
-- Records of administrator_role
-- ----------------------------
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
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administrator_user
-- ----------------------------
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

-- ----------------------------
-- Table structure for article_article
-- ----------------------------
DROP TABLE IF EXISTS `article_article`;
CREATE TABLE `article_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `college` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classify` int(11) NOT NULL,
  `is_recommend` tinyint(1) NOT NULL,
  `is_top` tinyint(1) NOT NULL,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_article
-- ----------------------------
INSERT INTO `article_article` VALUES (1, '使用', '您的下载日本今天法律.得到因为一个到了为什更多决定.\n科技查看中心两个行业开发当然.喜欢知道用户而且手机当然运行.工具知道参加技术.\n这种很多时候游戏为什.等级有限音乐通过科技开始有限.\n发展学校日期出现朋友.以下起来本站成为.关系网络还是.\n一切支持工程价格没有生活标题.\n为了论坛社区解决.帖子根据文化我的目前标准类别.更新如此各种时候为什.\n觉得部门以后.只有学习商品科技所有学习我们.', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_article` VALUES (2, '作品', '技术运行经验原因专业.\n成为单位很多为什.责任这种环境谢谢成为所有使用最新.单位一个只是发生.\n比较问题无法起来只是有关一种.位置帖子注意一些不会论坛.\n产品欢迎企业已经位置一些.已经文章联系什么.\n次数类型管理方面文件功能.语言重要类型.不过目前客户包括.\n世界回复市场成为程序设计论坛.国际建设之后信息深圳.他们孩子组织社区技术当然.', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_article` VALUES (3, '业务', '生产能够免费音乐.就是专业详细一切信息.\n国家完成公司还是.本站其实因为.\n决定能够管理系列.位置电子设计部门.\n无法产品同时显示成为人民.决定男人方面网上不能主题.广告北京拥有.\n积分人民网络一般其实什么公司.觉得记者法律地区重要.\n他们质量实现工程其中包括回复在线.\n一切是一质量知道提供继续原因.还有直接时间操作控制本站决定.\n之间时间有限注册等级他的.电子这个浏览通过出来男人.', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_article` VALUES (4, '只要', '合作研究发展美国如何企业.\n一起方法男人新闻论坛.最后进行手机国家都是.\n不同帮助对于我的网上.没有电影拥有.\n今年选择中国没有以后制作一点.工作应用历史不会游戏.\n主题处理威望基本城市.\n一起作者服务其实出现原因产品.起来相关一些软件最后.发展不同其他那些只要论坛.\n责任美国主要关系中文特别还是使用.所以时间有关报告城市大家需要.', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_article` VALUES (5, '查看', '商品销售的话自己这些地方文件.制作显示比较政府.分析社会如何拥有还有表示.\n什么两个这种还有一次.看到一定注意管理开发生产.对于提高价格学校公司数据以下.\n威望阅读地址大学.科技发展标题开发下载市场应用.通过处理欢迎部门注意实现.\n论坛工作安全来源全部一点大家准备.音乐公司具有什么.\n专业文化这些法律作者而且拥有项目.经营市场完成那个.', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_article` VALUES (6, '只要', '使用比较社会系统.结果来源历史对于.等级感觉会员这个还有位置.回复组织不断学生完全必须他们人员.\n出来比较可能合作回复.参加原因原因现在只要.只要工作成为人员.\n自己一种东西新闻学生朋友.各种设计电话等级世界历史.以后生活希望工程是否产品能力.\n以上比较不要标准音乐.企业感觉业务社区类型如何本站政府.但是经验公司积分开发一切不过朋友.\n只有网上人员.推荐制作都是其实.', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_article` VALUES (7, '人员', '这里地方可是觉得业务人民工程.提高可能信息.来源人民时间世界能够计划.事情目前地址不过.\n回复活动以后品牌还是感觉留言.中国注册次数以及提高大小如此.以下只要朋友原因希望.\n能力公司其实以上制作.可是有限大家中国时候这样注册联系.制作不过一切最新安全发展.\n由于社区全国市场.之间之后所以.新闻继续朋友都是日本不是还有系统.\n由于那个这个任何起来.注册不过有限国际位置.', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_article` VALUES (8, '政府', '因此学校一种说明计划状态只要.的话或者新闻今天数据今天这是.那些拥有那个信息各种.\n已经精华手机所以发展什么不过.已经今天为了到了继续也是记者.语言之间工具不过之间拥有女人.\n参加谢谢今天增加说明大家音乐.根据实现一定原因研究对于.作者结果质量日本.\n无法大小我们你的程序单位注意广告.感觉今年目前原因最后.\n提高资料一次建设国内.他们一切首页.政府大小大家注意广告一直介绍.', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_article` VALUES (9, '大学', '全部认为我们关系.数据汽车次数世界虽然.以上图片不要.\n首页社区文件注册人民.状态服务商品起来阅读程序更多.回复就是组织可能法律科技只是.\n报告一样图片发布.无法两个论坛任何产品的话深圳说明.\n一种没有方法解决.环境教育出现全部.\n喜欢表示北京也是资源.更新推荐不能成为.你们完全而且问题分析生产.\n其实继续因此关系投资参加增加.今年我们工作.', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_article` VALUES (10, '地方', '已经一起发布历史这么文件可能.\n大小同时方式部门.原因建设其他程序点击查看地区.\n简介文件公司最后原因责任技术.已经日期不断更多能力.表示中文电脑日本.简介详细这些其实.\n发生因为时间文章孩子浏览.地址基本责任.设计决定大家标题关系阅读.是一一起这些专业.\n一切结果其实发现.投资的是今天起来开发更新.虽然时候那么.\n只要一点注意他的.时候项目的人只要没有.个人但是没有因为程序浏览.', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_article` VALUES (11, '一次', '一直电影单位一定.这是成功日本.是否质量发展知道.\n图片准备但是影响不是事情.或者对于作为能力发展一下.各种欢迎提供最大电影各种.\n是一类别设计进行文章开始.不断那个由于他们游戏是否.\n男人管理她的不能因此制作广告.然后类型简介点击会员完成方式.名称报告首页没有以下质量.\n经验信息网络认为.就是可以但是重要非常具有.\n当然开发东西只要也是密码.处理其中还是男人.\n推荐下载发现如此现在所以最后.', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_article` VALUES (12, '服务', '看到能够有关影响的是通过.位置类别开发注意学校积分.控制程序设备政府可以.\n名称论坛类别质量深圳成为然后.这些觉得设备.\n方式帖子支持.一点销售项目她的.\n音乐由于一点.选择准备详细过程.处理精华基本来自必须.\n但是原因其他注册一次.能够那个一种认为.\n控制或者根据市场之后比较必须.只有谢谢操作如果教育发布.什么积分提供图片部门重要拥有.\n然后表示他的有关运行重要不能.计划或者环境建设只要大家.', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_article` VALUES (13, '其他', '注册这些地方电话.实现运行中文那么.作者技术没有建设.\n网络标准部分发生.类型图片出现操作.\n非常资料详细世界这是图片.经验他的起来这样为了不过.\n女人当前深圳你的开发是否目前.北京以下的是可能我的建设留言.一点组织时候支持经济.影响能够完成的是而且特别认为.\n注意同时直接有关出来.进入资源都是还有.\n中心工程有些认为不同.\n相关可能可以人员注册出现.', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_article` VALUES (14, '要求', '登录电脑图片其中用户客户公司.设备设备控制主题图片.\n评论应用品牌包括应该.文件有限现在发布来源法律发现特别.音乐网络学生合作起来操作一切密码.\n女人密码主题学校时候.的是只有以下虽然用户.\n都是北京可能这种.看到以下法律其中大小.\n大学对于自己广告这个没有一些.资料的话要求系列合作发现.大小开始精华.\n系列标题联系问题查看规定.简介等级当然这样两个任何东西.\n很多那个支持计划完成.', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_article` VALUES (15, '其实', '因为你们以上只要.\n那个增加标准在线.感觉手机所以那些安全到了系列不断.客户法律汽车如何图片提供首页.\n公司其实看到技术浏览你们回复.对于这么主题产品最后历史客户.原因自己能力关于.\n生产只有我们而且.项目评论游戏空间今天.记者地区设备不过可以.\n经营您的然后内容来源虽然人民原因.文件免费文件用户.\n建设计划更多是一.教育地址基本.\n商品可以查看作为基本.查看经验提供密码出来.', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_article` VALUES (16, '不同', '如此价格起来.音乐文化各种免费音乐.\n部门作品标准电脑其他软件不要.中国成为美国.\n会员项目到了特别发布各种.只要更多不同建设内容起来.\n制作喜欢如何一切大学.个人帖子主要生活全国社区主题.\n不是一些还有怎么自己学生只是.行业最后进行原因人员.次数广告基本进入帮助网站以下.\n回复一定不是一些中文.谢谢地址最新事情.\n为了系统系统大家成为更新.\n经验位置类别政府销售什么.', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_article` VALUES (17, '之间', '以后规定环境学生.时候状态国家作品发表语言实现男人.支持到了图片设备完全责任.\n这是通过增加全部.科技网上继续客户系列.\n国际世界不过加入应用的话单位地方.但是经济应该开始地址语言.其实游戏都是不同说明.科技你们来源现在.\n北京什么精华.免费注意包括因为查看状态以上这是.\n已经世界没有发展而且比较更多.就是计划最大部门类型大学.\n学习东西由于空间.是一网站用户学习进行空间电话文章.', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_article` VALUES (18, '之间', '今天一直因为东西生活发表.感觉很多程序时间特别音乐.成功工程在线那些广告浏览各种直接.\n帮助准备质量合作而且一个还有.然后由于国家计划.网上国际您的文件.\n成为不同对于来自查看实现认为.生产公司的是当然非常价格操作.出来不会地址浏览.\n以上为什开始他们环境无法今天.需要正在可是一切应用完全继续.操作中心用户而且规定觉得你的这些.\n你们不要一样国内搜索的人已经.电话威望服务.', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_article` VALUES (19, '今年', '规定他们来自公司得到.两个积分语言特别生活同时行业.\n学校到了公司系列.服务虽然论坛计划一起应该操作.音乐而且合作.\n基本以及作者电影.因此标准手机系统.电话继续进入那个.\n提供学习如何公司最新通过也是你们.或者美国知道当然关系.\n这是最后行业.作为注意帖子一定发表用户日期.社会为什内容解决已经是否大学.\n是否没有部门学校只有一次.游戏现在其他包括.\n这样女人中心可能时间政府.如果控制东西全国.', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_article` VALUES (20, '全部', '有限之后等级发现她的.国家为了这是以上.\n一直程序来自今年.位置一切其他客户注意各种.\n关系搜索有关法律什么或者可是.所有一点开发一定使用以下标准有关.\n那个不过日本这个用户目前得到.相关你的可以一直中文需要.\n这样具有服务日本全国显示为了.比较还有帮助社会两个这个一切.社会信息大家的人部门.\n时候发生希望.基本觉得分析一般能够国内.新闻当然电影时候其中.', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);
INSERT INTO `article_article` VALUES (21, 'lwbzs', '111', '', 1, 0, 0, '2019-12-24', '2019-12-24', 1);

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

-- ----------------------------
-- Records of article_classify
-- ----------------------------
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
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-12-24 07:17:48.567922');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-12-24 07:17:48.825390');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-12-24 07:17:50.238267');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-12-24 07:17:50.417778');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-12-24 07:17:50.429748');
INSERT INTO `django_migrations` VALUES (6, 'administrator', '0001_initial', '2019-12-24 07:17:50.544439');
INSERT INTO `django_migrations` VALUES (7, 'article', '0001_initial', '2019-12-24 07:17:50.640183');
INSERT INTO `django_migrations` VALUES (8, 'contenttypes', '0002_remove_content_type_name', '2019-12-24 07:17:50.827682');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0002_alter_permission_name_max_length', '2019-12-24 07:17:50.907468');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0003_alter_user_email_max_length', '2019-12-24 07:17:50.985260');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0004_alter_user_username_opts', '2019-12-24 07:17:51.001218');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0005_alter_user_last_login_null', '2019-12-24 07:17:51.125886');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0006_require_contenttypes_0002', '2019-12-24 07:17:51.130874');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0007_alter_validators_add_error_messages', '2019-12-24 07:17:51.140846');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0008_alter_user_username_max_length', '2019-12-24 07:17:51.209663');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0009_alter_user_last_name_max_length', '2019-12-24 07:17:51.290970');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0010_alter_group_name_max_length', '2019-12-24 07:17:51.401674');
INSERT INTO `django_migrations` VALUES (18, 'auth', '0011_update_proxy_permissions', '2019-12-24 07:17:51.414640');
INSERT INTO `django_migrations` VALUES (19, 'echarts', '0001_initial', '2019-12-24 07:17:51.459519');
INSERT INTO `django_migrations` VALUES (20, 'member', '0001_initial', '2019-12-24 07:17:51.545798');
INSERT INTO `django_migrations` VALUES (21, 'sessions', '0001_initial', '2019-12-24 07:17:51.618113');

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
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('7fwvkllypicpitg1llt0gztf0s9mrk9t', 'NWI1MjJiYTgxNjQ2ZDVlZTExMTAyNTg4OTYwZGMxOTYzZDA0MzM2OTp7ImFkbWluX3VzZXJuYW1lIjoiYWRtaW4iLCJhZG1pbl9pZCI6MX0=', '2019-12-24 20:13:15.497343');

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
INSERT INTO `echarts_visitors` VALUES (1, 354, '2019-12-17', '2019-12-17', 1);
INSERT INTO `echarts_visitors` VALUES (2, 153, '2019-12-18', '2019-12-18', 1);
INSERT INTO `echarts_visitors` VALUES (3, 23, '2019-12-19', '2019-12-19', 1);
INSERT INTO `echarts_visitors` VALUES (4, 412, '2019-12-20', '2019-12-20', 1);
INSERT INTO `echarts_visitors` VALUES (5, 123, '2019-12-21', '2019-12-21', 1);
INSERT INTO `echarts_visitors` VALUES (6, 132, '2019-12-22', '2019-12-22', 1);
INSERT INTO `echarts_visitors` VALUES (7, 423, '2019-12-23', '2019-12-23', 1);
INSERT INTO `echarts_visitors` VALUES (8, 123, '2019-12-24', '2019-12-24', 1);

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
