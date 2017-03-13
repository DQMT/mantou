/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : mantou

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2017-03-13 17:03:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_reports
-- ----------------------------
DROP TABLE IF EXISTS `t_reports`;
CREATE TABLE `t_reports` (
  `rid` int(16) NOT NULL AUTO_INCREMENT,
  `tid` int(16) DEFAULT NULL,
  `from_uid` int(16) DEFAULT NULL,
  `to_uid` int(16) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `reason` varchar(128) DEFAULT NULL,
  `result` varchar(128) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  KEY `rid` (`rid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_reports
-- ----------------------------
INSERT INTO `t_reports` VALUES ('15', '797', '41', '41', '2016-07-30 16:22:24', '2016-07-30 16:22:45', '', '已删除回复', '2');
INSERT INTO `t_reports` VALUES ('16', '823', '45', '45', '2016-07-30 16:39:51', '2016-07-30 16:39:51', 'dxcxv', '尚未处理', '1');
INSERT INTO `t_reports` VALUES ('17', '825', '41', '41', '2016-07-30 16:44:50', '2016-07-31 12:43:11', '删除整串！', '已删除回复', '2');
INSERT INTO `t_reports` VALUES ('18', '833', '45', '41', '2016-07-30 16:47:51', '2016-07-31 12:47:57', 'ban', '已封号', '4');
INSERT INTO `t_reports` VALUES ('19', '833', '41', '41', '2016-07-31 12:52:46', '2016-07-31 12:52:46', '', '尚未处理', '1');
INSERT INTO `t_reports` VALUES ('20', '833', '41', '41', '2016-07-31 12:53:04', '2016-07-31 12:53:04', '', '尚未处理', '1');
INSERT INTO `t_reports` VALUES ('21', '840', '45', '41', '2016-08-03 12:02:48', '2016-08-03 12:02:57', '', '已删除回复', '2');
INSERT INTO `t_reports` VALUES ('22', '846', '41', '41', '2016-08-16 11:55:04', '2016-08-16 11:55:20', '', '已删除回复', '2');
INSERT INTO `t_reports` VALUES ('23', '894', '41', '41', '2016-08-24 12:53:53', '2016-08-24 12:53:53', 'asdasdasd', '尚未处理', '1');
INSERT INTO `t_reports` VALUES ('24', '868', '48', '45', '2017-03-13 14:39:27', '2017-03-13 14:39:27', '', '尚未处理', '1');
INSERT INTO `t_reports` VALUES ('25', '906', '48', '41', '2017-03-13 16:06:13', '2017-03-13 16:06:13', '啊啊啊', '尚未处理', '1');
INSERT INTO `t_reports` VALUES ('26', '907', '48', '52', '2017-03-13 16:43:25', '2017-03-13 16:43:25', '22', '尚未处理', '1');
INSERT INTO `t_reports` VALUES ('27', '868', '48', '45', '2017-03-13 16:43:46', '2017-03-13 16:43:46', '3', '尚未处理', '1');
INSERT INTO `t_reports` VALUES ('28', '868', '48', '45', '2017-03-13 16:43:53', '2017-03-13 16:43:53', '3', '尚未处理', '1');
INSERT INTO `t_reports` VALUES ('29', '868', '48', '45', '2017-03-13 16:44:15', '2017-03-13 16:44:15', '2', '尚未处理', '1');
INSERT INTO `t_reports` VALUES ('30', '907', '48', '52', '2017-03-13 16:57:29', '2017-03-13 16:57:29', '', '尚未处理', '1');
INSERT INTO `t_reports` VALUES ('31', '907', '48', '52', '2017-03-13 16:57:41', '2017-03-13 16:57:41', 'py', '尚未处理', '1');

-- ----------------------------
-- Table structure for t_sub_m
-- ----------------------------
DROP TABLE IF EXISTS `t_sub_m`;
CREATE TABLE `t_sub_m` (
  `sid` int(3) NOT NULL AUTO_INCREMENT,
  `subTitle` varchar(32) DEFAULT NULL,
  `sStatus` tinyint(1) DEFAULT NULL,
  `subTips` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sub_m
-- ----------------------------
INSERT INTO `t_sub_m` VALUES ('1', '询问', '2', 'Questions/Problems');
INSERT INTO `t_sub_m` VALUES ('2', '欢乐', '2', '欢乐恶搞');
INSERT INTO `t_sub_m` VALUES ('3', '美食', '2', '吃货交流');
INSERT INTO `t_sub_m` VALUES ('4', '新闻', '2', '跑的比香港记者还快');
INSERT INTO `t_sub_m` VALUES ('5', '游戏', '2', 'freetoplay');
INSERT INTO `t_sub_m` VALUES ('6', null, null, null);

-- ----------------------------
-- Table structure for t_threads
-- ----------------------------
DROP TABLE IF EXISTS `t_threads`;
CREATE TABLE `t_threads` (
  `tid` int(16) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `text` varchar(1024) DEFAULT NULL,
  `uid` int(16) DEFAULT NULL,
  `uCookie` char(16) DEFAULT NULL,
  `threadStatus` tinyint(1) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `supertid` int(16) DEFAULT NULL,
  `reftid` int(16) DEFAULT NULL,
  `sub_m` int(3) DEFAULT NULL,
  `tImage` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `uid` (`uid`),
  CONSTRAINT `t_threads_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `t_user` (`uid`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=909 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_threads
-- ----------------------------
INSERT INTO `t_threads` VALUES ('788', '', 'sadas', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-07-30 16:02:59', '2016-07-30 16:02:59', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('789', '', 'drgfdgfd', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-07-30 16:03:16', '2016-07-30 16:03:16', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('790', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-07-30 16:03:19', '2016-07-30 16:03:19', '0', '0', '1', 'uploads/image1469865799341.png');
INSERT INTO `t_threads` VALUES ('791', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-07-30 16:03:23', '2016-07-30 16:03:23', '0', '0', '1', 'uploads/image1469865803392.png');
INSERT INTO `t_threads` VALUES ('792', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-07-30 16:03:26', '2016-07-30 16:03:26', '0', '0', '1', 'uploads/image1469865806426.jpeg');
INSERT INTO `t_threads` VALUES ('793', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-07-30 16:03:30', '2016-07-30 16:03:30', '0', '0', '1', 'uploads/image1469865810600.jpeg');
INSERT INTO `t_threads` VALUES ('794', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-07-30 16:03:33', '2016-07-30 16:03:33', '0', '0', '1', 'uploads/image1469865813806.jpeg');
INSERT INTO `t_threads` VALUES ('795', '', 'sdfsdfsd', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-07-30 16:03:38', '2016-07-30 16:03:38', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('796', 'dfffffffffffffffffffffffffffffffff', 'fdgfdffffffffffffff', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-07-30 16:03:43', '2016-07-30 16:22:16', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('797', '', '【已被删除】', '41', 'N4KX6LnjfxxCdrdE', '1', '2016-07-30 16:21:52', '2016-07-30 16:21:52', '796', '0', '1', null);
INSERT INTO `t_threads` VALUES ('798', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-07-30 16:21:59', '2016-07-30 16:21:59', '796', '797', '1', 'uploads/image1469866919138.png');
INSERT INTO `t_threads` VALUES ('799', '', 'xxxx', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-07-30 16:22:16', '2016-07-30 16:22:16', '796', '797', '1', null);
INSERT INTO `t_threads` VALUES ('800', '', '', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:24:23', '2016-08-01 10:30:49', '0', '0', '2', 'uploads/image1469867063369.jpeg');
INSERT INTO `t_threads` VALUES ('801', '', '', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:24:30', '2016-07-30 16:24:30', '800', '0', '2', 'uploads/image1469867070867.jpeg');
INSERT INTO `t_threads` VALUES ('802', '', '', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:24:37', '2016-07-30 16:24:37', '800', '801', '2', 'uploads/image1469867077446.jpeg');
INSERT INTO `t_threads` VALUES ('803', '', '', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:24:45', '2016-07-30 16:24:45', '800', '802', '2', 'uploads/image1469867085062.jpeg');
INSERT INTO `t_threads` VALUES ('804', '', '', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:24:56', '2016-07-30 16:24:56', '800', '803', '2', 'uploads/image1469867096531.jpeg');
INSERT INTO `t_threads` VALUES ('805', '', 'dsfsdfsdf', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:37:39', '2016-07-30 16:37:39', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('806', '', '11111111111', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:37:41', '2016-07-30 16:37:41', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('807', '', '2222222222222', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:37:43', '2016-07-30 16:37:43', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('808', '', '33333333333333333', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:37:45', '2016-07-30 16:37:45', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('809', '', '444444444444444', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:37:47', '2016-07-30 16:37:47', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('810', '', '555555555', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:37:49', '2016-07-30 16:37:49', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('811', '', '122222222', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:37:52', '2016-07-30 16:37:52', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('812', '', '333333333333', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:37:53', '2016-07-30 16:37:53', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('813', '', '444444444444', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:37:55', '2016-07-30 16:43:24', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('814', '', '33333333333333333', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:37:57', '2016-07-30 16:37:57', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('815', '', 'bbbbbb', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:39:14', '2016-07-30 16:39:14', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('816', '', 'ccccccccc', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:39:17', '2016-07-30 16:39:17', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('817', '', 'vvvvvvvvv', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:39:20', '2016-07-30 16:39:20', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('818', '', 'bbbbbbbbbbbbbb', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:39:22', '2016-07-30 16:39:22', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('819', '', '', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:39:24', '2016-07-30 16:39:24', '0', '0', '1', 'uploads/image1469867964654.jpeg');
INSERT INTO `t_threads` VALUES ('820', '', 'ggggggggg', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:39:26', '2016-07-30 16:39:26', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('821', '', '【已被删除】', '45', 'gpxxnXIAPhc8ldXs', '1', '2016-07-30 16:39:29', '2016-07-30 16:40:44', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('822', '', 'vvvvvvvvvvv', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:39:31', '2016-07-30 16:39:31', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('823', '', 'nnnnnnnnnn', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:39:33', '2016-07-30 16:39:33', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('824', '', 'fghfgh<br/>vbnbnbv', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-07-30 16:39:38', '2016-07-30 16:39:38', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('825', '', '【已被删除】', '41', 'N4KX6LnjfxxCdrdE', '1', '2016-07-30 16:40:23', '2016-07-30 16:40:23', '821', '0', '1', null);
INSERT INTO `t_threads` VALUES ('826', '', '【已被删除】', '41', 'N4KX6LnjfxxCdrdE', '1', '2016-07-30 16:40:25', '2016-07-30 16:40:25', '821', '0', '1', null);
INSERT INTO `t_threads` VALUES ('827', '', 'xxxxxxxxx', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-07-30 16:40:36', '2016-07-30 16:40:36', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('828', '', '【已被删除】', '41', 'N4KX6LnjfxxCdrdE', '1', '2016-07-30 16:40:44', '2016-07-30 16:40:44', '821', '0', '1', null);
INSERT INTO `t_threads` VALUES ('829', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-07-30 16:42:04', '2016-07-30 16:42:04', '800', '804', '2', 'uploads/image1469868124490.jpeg');
INSERT INTO `t_threads` VALUES ('830', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-07-30 16:42:11', '2016-07-30 16:42:11', '800', '829', '2', 'uploads/image1469868131935.jpeg');
INSERT INTO `t_threads` VALUES ('831', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-07-30 16:42:33', '2016-07-30 16:42:33', '800', '830', '2', 'uploads/image1469868153857.jpeg');
INSERT INTO `t_threads` VALUES ('832', '', '.00<br/>', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-07-30 16:43:17', '2016-07-30 16:43:17', '813', '0', '1', null);
INSERT INTO `t_threads` VALUES ('833', '', '0.0.<br/>0.<br/>0<br/>.0.<br/>', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-07-30 16:43:24', '2016-07-30 16:43:24', '813', '0', '1', null);
INSERT INTO `t_threads` VALUES ('834', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-01 10:05:22', '2016-08-01 10:05:22', '0', '0', '1', 'uploads/image1470017122382.jpeg');
INSERT INTO `t_threads` VALUES ('835', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-01 10:05:28', '2016-08-01 10:05:28', '0', '0', '1', 'uploads/image1470017128358.jpeg');
INSERT INTO `t_threads` VALUES ('836', '2', '22222222', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-01 10:08:23', '2016-08-01 10:08:23', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('837', '', '11<br/>撒打算打算<br/>发生地方的说法<br/>', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-01 10:08:34', '2016-08-01 10:08:34', '0', '0', '1', 'uploads/image1470017314187.jpeg');
INSERT INTO `t_threads` VALUES ('838', '', '海水为什么是咸的？', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-01 10:16:11', '2016-08-01 10:17:25', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('839', '', '实际上，原始的海水并非一开始就充满了盐分，最初它和江河水一样也是淡水。　　但是地球上的水在不停地循环运动，每年海洋表面有大量水分蒸发，其中部分水分通过大气运动输送到陆地上空然后形成降水再落到地面上，冲刷土壤，破坏岩石，把陆上的可溶性物质(大部分是各种盐类)带到江河之中，江河百川又回归大海。<br/>　　这样，每年大约有30亿吨的盐分被带进海洋，海洋便成了一切溶解盐类的收容所。而在海水的蒸发中，收入的盐类又不能随水蒸气升空，只得滞留在海洋之内。如此周而复始，海洋中的盐类物质越积越多，海水也就变得越来越咸。', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-01 10:16:24', '2016-08-01 10:16:24', '838', '0', '1', null);
INSERT INTO `t_threads` VALUES ('840', '', '【已被删除】', '41', 'N4KX6LnjfxxCdrdE', '1', '2016-08-01 10:17:19', '2016-08-01 10:17:19', '838', '839', '1', null);
INSERT INTO `t_threads` VALUES ('841', '', '嘻嘻嘻', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-01 10:17:25', '2016-08-01 10:17:25', '838', '840', '1', null);
INSERT INTO `t_threads` VALUES ('842', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-01 10:25:18', '2016-08-01 10:25:18', '800', '831', '2', 'uploads/image1470018318115.jpeg');
INSERT INTO `t_threads` VALUES ('843', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-01 10:25:25', '2016-08-01 10:25:25', '800', '842', '2', 'uploads/image1470018325799.png');
INSERT INTO `t_threads` VALUES ('844', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-01 10:28:24', '2016-08-01 10:28:24', '0', '0', '2', 'uploads/image1470018504550.jpeg');
INSERT INTO `t_threads` VALUES ('845', '', '无他，但手熟尔', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-01 10:28:39', '2016-08-01 10:28:39', '0', '0', '2', 'uploads/image1470018519400.jpeg');
INSERT INTO `t_threads` VALUES ('846', '', '【已被删除】', '41', 'N4KX6LnjfxxCdrdE', '1', '2016-08-01 10:30:49', '2016-08-01 10:30:49', '800', '843', '2', null);
INSERT INTO `t_threads` VALUES ('847', '', 'dddd', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-08-01 13:16:40', '2016-08-01 13:16:40', '0', '0', '3', null);
INSERT INTO `t_threads` VALUES ('848', '', '近日，越南电视台公布了越南军队进行岛屿登陆作战演练的画面，出动了两栖登陆舰、水上坦克、装甲车、冲锋舟等多种武器装备。<br/>', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-08-01 13:17:02', '2016-08-01 13:17:02', '0', '0', '4', null);
INSERT INTO `t_threads` VALUES ('849', '', '', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-08-01 13:17:46', '2016-08-01 13:17:46', '0', '0', '3', 'uploads/image1470028666787.jpeg');
INSERT INTO `t_threads` VALUES ('850', 'hello', '看到我发的内容了吗？', '48', 'WsPOXnqFrG5sMeX9', '2', '2016-08-10 22:59:17', '2016-08-10 22:59:17', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('851', '', '黄兴，看到了吗', '48', 'WsPOXnqFrG5sMeX9', '2', '2016-08-10 23:04:36', '2016-08-10 23:10:38', '0', '0', '1', 'uploads/image1470841476344.jpeg');
INSERT INTO `t_threads` VALUES ('852', '哟西', '看到了', '51', '8TIHCRossgyXaIDB', '2', '2016-08-10 23:05:44', '2016-08-10 23:05:44', '851', '0', '1', null);
INSERT INTO `t_threads` VALUES ('853', '11111111', '22222222222', '51', '8TIHCRossgyXaIDB', '2', '2016-08-10 23:06:44', '2016-08-10 23:06:44', '0', '0', '2', null);
INSERT INTO `t_threads` VALUES ('854', '11111111', '22222222222', '51', '8TIHCRossgyXaIDB', '2', '2016-08-10 23:06:44', '2016-08-10 23:06:44', '0', '0', '2', null);
INSERT INTO `t_threads` VALUES ('855', '', '可以可以<br/>', '48', 'WsPOXnqFrG5sMeX9', '2', '2016-08-10 23:07:00', '2016-08-10 23:07:00', '851', '852', '1', 'uploads/image1470841620322.jpeg');
INSERT INTO `t_threads` VALUES ('856', '吃饭睡觉打豆豆', '啦啦啦', '51', '8TIHCRossgyXaIDB', '2', '2016-08-10 23:07:30', '2016-08-10 23:07:30', '0', '0', '2', null);
INSERT INTO `t_threads` VALUES ('857', '', '我用IE试试', '48', 'WsPOXnqFrG5sMeX9', '2', '2016-08-10 23:10:12', '2016-08-10 23:10:12', '851', '855', '1', 'uploads/image1470841812632.png');
INSERT INTO `t_threads` VALUES ('858', '', '', '48', 'WsPOXnqFrG5sMeX9', '2', '2016-08-10 23:10:38', '2016-08-10 23:10:38', '851', '0', '1', 'uploads/image1470841838955.jpeg');
INSERT INTO `t_threads` VALUES ('859', '周三', '今天上了一天班，感觉还不错！', '51', '8TIHCRossgyXaIDB', '2', '2016-08-10 23:11:21', '2016-08-10 23:11:21', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('860', '', 'github被墙了，之后我会找个国内的代码托管网站', '48', 'WsPOXnqFrG5sMeX9', '2', '2016-08-10 23:12:39', '2016-08-10 23:51:27', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('861', '辣椒炒肉', '湖南特色菜，此菜精髓在于辣椒要辣。', '51', '8TIHCRossgyXaIDB', '2', '2016-08-10 23:13:04', '2016-08-10 23:13:19', '0', '0', '3', null);
INSERT INTO `t_threads` VALUES ('862', '', '是的，我也挺喜欢吃的', '51', '8TIHCRossgyXaIDB', '2', '2016-08-10 23:13:19', '2016-08-10 23:13:19', '861', '0', '3', null);
INSERT INTO `t_threads` VALUES ('863', '2016/08/10', '今天中国金牌数又添加了两枚', '51', '8TIHCRossgyXaIDB', '2', '2016-08-10 23:15:25', '2016-08-10 23:15:25', '0', '0', '4', null);
INSERT INTO `t_threads` VALUES ('864', '', '', '48', 'WsPOXnqFrG5sMeX9', '2', '2016-08-10 23:16:25', '2016-08-10 23:16:25', '0', '0', '5', 'uploads/image1470842185329.jpeg');
INSERT INTO `t_threads` VALUES ('865', '', 'Git@OSC、&nbsp;Coding', '48', 'WsPOXnqFrG5sMeX9', '2', '2016-08-10 23:18:35', '2016-08-10 23:18:35', '860', '0', '1', null);
INSERT INTO `t_threads` VALUES ('866', '', '已添加Git@OSC', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-08-10 23:51:27', '2016-08-10 23:51:27', '860', '865', '1', null);
INSERT INTO `t_threads` VALUES ('867', '2222', '2222', '46', 'testtesttesttest', '2', '2016-08-11 15:01:04', '2016-08-11 15:01:04', '0', '0', '3', null);
INSERT INTO `t_threads` VALUES ('868', '', '', '45', 'gpxxnXIAPhc8ldXs', '2', '2016-08-16 11:56:01', '2016-08-16 11:56:01', '0', '0', '3', 'uploads/image1471319761004.png');
INSERT INTO `t_threads` VALUES ('869', '', '发沙发沙发沙发', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-17 15:10:11', '2016-08-17 15:10:11', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('870', '', '阿西吧不小心把项目clean了图片都被我删了', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:06:40', '2016-08-23 14:06:40', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('871', '', '重新加图片', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:07:29', '2016-08-23 14:07:43', '0', '0', '1', 'uploads/image1471932449211.png');
INSERT INTO `t_threads` VALUES ('872', '', '！！！', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:07:43', '2016-08-23 14:07:43', '871', '0', '1', 'uploads/image1471932463496.jpeg');
INSERT INTO `t_threads` VALUES ('873', '', '测试', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:30:02', '2016-08-23 14:30:02', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('874', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:30:07', '2016-08-23 14:30:07', '0', '0', '1', 'uploads/image1471933807854.gif');
INSERT INTO `t_threads` VALUES ('875', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:30:13', '2016-08-23 14:30:13', '0', '0', '1', 'uploads/image1471933813690.gif');
INSERT INTO `t_threads` VALUES ('876', '', '撒撒打算打算大噶时光的', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:30:21', '2016-08-23 14:30:21', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('877', '33热22热', 'gfdhfh', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:30:29', '2016-08-23 14:30:29', '0', '0', '1', 'uploads/image1471933829602.png');
INSERT INTO `t_threads` VALUES ('878', '标题', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:31:11', '2016-08-23 14:31:11', '0', '0', '1', 'uploads/image1471933871407.png');
INSERT INTO `t_threads` VALUES ('879', 'tincat', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:31:21', '2016-08-23 14:31:21', '0', '0', '1', 'uploads/image1471933881420.png');
INSERT INTO `t_threads` VALUES ('880', '', '丰富的发顺丰顺丰规范化h', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:31:27', '2016-08-23 14:31:27', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('881', '', '韩国警方回家感觉好', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:31:30', '2016-08-24 12:54:26', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('882', '', '刚好非结构化监管机构', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:31:33', '2016-08-23 14:31:33', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('883', '', '第三方十大发生的', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:31:39', '2016-08-23 14:31:39', '881', '0', '1', null);
INSERT INTO `t_threads` VALUES ('884', '重建装逼串', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:32:49', '2016-08-23 14:35:25', '0', '0', '2', 'uploads/image1471933969709.jpeg');
INSERT INTO `t_threads` VALUES ('885', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:33:12', '2016-08-23 14:33:12', '884', '0', '2', 'uploads/image1471933992639.jpeg');
INSERT INTO `t_threads` VALUES ('886', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:33:19', '2016-08-23 14:33:19', '884', '885', '2', 'uploads/image1471933999947.jpeg');
INSERT INTO `t_threads` VALUES ('887', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:33:29', '2016-08-23 14:33:29', '884', '886', '2', 'uploads/image1471934009177.jpeg');
INSERT INTO `t_threads` VALUES ('888', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:33:35', '2016-08-23 14:33:35', '884', '887', '2', 'uploads/image1471934015345.jpeg');
INSERT INTO `t_threads` VALUES ('889', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:33:57', '2016-08-23 14:33:57', '884', '888', '2', 'uploads/image1471934037995.jpeg');
INSERT INTO `t_threads` VALUES ('890', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:34:05', '2016-08-23 14:34:05', '884', '889', '2', 'uploads/image1471934045542.jpeg');
INSERT INTO `t_threads` VALUES ('891', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:34:17', '2016-08-23 14:34:17', '884', '890', '2', 'uploads/image1471934057712.jpeg');
INSERT INTO `t_threads` VALUES ('892', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:34:23', '2016-08-23 14:34:23', '884', '891', '2', 'uploads/image1471934063536.jpeg');
INSERT INTO `t_threads` VALUES ('893', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-23 14:35:25', '2016-08-23 14:35:25', '884', '892', '2', 'uploads/image1471934125617.jpeg');
INSERT INTO `t_threads` VALUES ('894', '', 'testtetst', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-24 12:53:31', '2016-08-24 12:53:31', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('895', '', 'sadasdasdf', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-24 12:54:26', '2016-08-24 12:54:26', '881', '883', '1', 'uploads/image1472014466535.jpeg');
INSERT INTO `t_threads` VALUES ('896', '', '', '41', 'N4KX6LnjfxxCdrdE', '2', '2016-08-24 12:56:33', '2017-02-22 15:31:39', '0', '0', '1', 'uploads/image1472014593886.png');
INSERT INTO `t_threads` VALUES ('898', '', 'ss', '48', '0d50fe789fff7485', '2', '2017-02-22 15:31:14', '2017-02-22 15:31:14', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('899', '', '', '48', '0d50fe789fff7485', '2', '2017-02-22 15:31:24', '2017-02-22 15:31:24', '0', '0', '1', 'uploads/image1487748684297.jpeg');
INSERT INTO `t_threads` VALUES ('900', '', 'd', '48', '0d50fe789fff7485', '2', '2017-02-22 15:31:33', '2017-02-22 15:31:33', '896', '0', '1', null);
INSERT INTO `t_threads` VALUES ('901', '', 'jj', '48', '0d50fe789fff7485', '2', '2017-02-22 15:31:39', '2017-02-22 15:31:39', '896', '900', '1', null);
INSERT INTO `t_threads` VALUES ('902', '', 'sss', '48', '0edcea8db0c75b8a', '2', '2017-02-22 15:34:26', '2017-02-22 15:34:26', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('903', '', 'ss', '48', 'a9c20105d8b303a0', '2', '2017-02-22 16:42:41', '2017-02-22 16:42:41', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('904', 'aa', 'aa', '48', 'a9c20105d8b303a0', '2', '2017-02-22 16:42:56', '2017-02-22 16:42:56', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('905', '', 'jojo的回复', '41', '650274d8a196e5d4', '2', '2017-03-10 14:04:58', '2017-03-10 14:04:58', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('906', '', '萨达啊', '41', '650274d8a196e5d4', '2', '2017-03-10 14:05:11', '2017-03-10 14:05:11', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('907', '', 'hello&nbsp;py', '52', '6c25e8cd0722899e', '2', '2017-03-13 14:21:01', '2017-03-13 14:21:01', '0', '0', '1', null);
INSERT INTO `t_threads` VALUES ('908', '', 'ddd', '48', '650274d8a196e5d4', '2', '2017-03-13 16:57:10', '2017-03-13 16:57:10', '0', '0', '1', null);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` int(16) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `passWord` varchar(32) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `userStatus` tinyint(1) DEFAULT NULL,
  `cookie` char(16) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'song', '1234', '66@qq.com', '2', 'abcdef');
INSERT INTO `t_user` VALUES ('2', 'java', '96e79218965eb72c92a549dd5a330112', '11@qq.com', '2', 'GzBNs0FtvrWvKIae');
INSERT INTO `t_user` VALUES ('41', 'jojo', '96e79218965eb72c92a549dd5a330112', 'noone@qq.com', '2', 'N4KX6LnjfxxCdrdE');
INSERT INTO `t_user` VALUES ('42', 'asdsad', '111111', '11121@000sas1dasda0.com', '2', 'W8qFRBZwAfa5VN8m');
INSERT INTO `t_user` VALUES ('43', 'kkkk', '111111', '11@020.com', '2', '9VilxOGal2U3jOAq');
INSERT INTO `t_user` VALUES ('44', '1231231', '111111', '60133@qq.com', '2', '2OrTUOmcj6iPzgmK');
INSERT INTO `t_user` VALUES ('45', 'admin', '96e79218965eb72c92a549dd5a330112', 'admin@mantou.com', '0', 'gpxxnXIAPhc8ldXs');
INSERT INTO `t_user` VALUES ('46', 'test', '111111', '110@test.com', '0', 'testtesttesttest');
INSERT INTO `t_user` VALUES ('48', 'mantou', '', '', '2', 'abc');
INSERT INTO `t_user` VALUES ('49', 'So黄兴', '123456', 'tmc20141@163.com', '1', 'qyjb1ciT3ITwC8fm');
INSERT INTO `t_user` VALUES ('50', '测试1', '111111', 'lalala@qq.com', '2', 'YftLq742QUdSoC0J');
INSERT INTO `t_user` VALUES ('51', 'So高冷', '111111', '1375832397@qq.com', '2', '8TIHCRossgyXaIDB');
INSERT INTO `t_user` VALUES ('52', 'python', '23eeeb4347bdd26bfc6b7ee9a3b755dd', '601909982@qq.com', '2', 'kW6mZ2j8bMZMCPrV');
