/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : ultrax

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2013-05-08 15:30:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `pre_forum_forum`
-- ----------------------------
DROP TABLE IF EXISTS `pre_forum_forum`;
CREATE TABLE `pre_forum_forum` (
  `fid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `fup` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` enum('group','forum','sub') NOT NULL DEFAULT 'forum',
  `name` char(50) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) NOT NULL DEFAULT '0',
  `styleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `threads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `todayposts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lastpost` char(110) NOT NULL DEFAULT '',
  `domain` char(15) NOT NULL DEFAULT '',
  `allowsmilies` tinyint(1) NOT NULL DEFAULT '0',
  `allowhtml` tinyint(1) NOT NULL DEFAULT '0',
  `allowbbcode` tinyint(1) NOT NULL DEFAULT '0',
  `allowimgcode` tinyint(1) NOT NULL DEFAULT '0',
  `allowmediacode` tinyint(1) NOT NULL DEFAULT '0',
  `allowanonymous` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostspecial` smallint(6) unsigned NOT NULL DEFAULT '0',
  `allowspecialonly` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowappend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `alloweditrules` tinyint(1) NOT NULL DEFAULT '0',
  `allowfeed` tinyint(1) NOT NULL DEFAULT '1',
  `allowside` tinyint(1) NOT NULL DEFAULT '0',
  `recyclebin` tinyint(1) NOT NULL DEFAULT '0',
  `modnewposts` tinyint(1) NOT NULL DEFAULT '0',
  `jammer` tinyint(1) NOT NULL DEFAULT '0',
  `disablewatermark` tinyint(1) NOT NULL DEFAULT '0',
  `inheritedmod` tinyint(1) NOT NULL DEFAULT '0',
  `autoclose` smallint(6) NOT NULL DEFAULT '0',
  `forumcolumns` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `catforumcolumns` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `threadcaches` tinyint(1) NOT NULL DEFAULT '0',
  `alloweditpost` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `simple` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modworks` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowglobalstick` tinyint(1) NOT NULL DEFAULT '1',
  `level` smallint(6) NOT NULL DEFAULT '0',
  `commoncredits` int(10) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `recommend` smallint(6) unsigned NOT NULL DEFAULT '0',
  `favtimes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sharetimes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disablethumb` tinyint(1) NOT NULL DEFAULT '0',
  `disablecollect` tinyint(1) NOT NULL DEFAULT '0',
  `introduction` varchar(255) DEFAULT NULL,
  `rank` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `forum` (`status`,`type`,`displayorder`),
  KEY `fup_type` (`fup`,`type`,`displayorder`),
  KEY `fup` (`fup`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pre_forum_forum
-- ----------------------------
INSERT INTO `pre_forum_forum` VALUES ('1', '0', 'group', 'Discuz!', '1', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('2', '1', 'forum', '默认版块', '1', '0', '0', '14', '46', '0', '113	test attahment adn comment	1367895059	admin', '', '1', '0', '1', '1', '1', '0', '31', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('3', '0', 'group', '影音', '3', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('4', '0', 'group', '情感', '3', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('5', '0', 'group', '生活', '3', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('6', '0', 'group', '休闲', '3', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('7', '0', 'group', '游戏', '3', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('8', '0', 'group', '体育', '3', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('9', '3', 'forum', '电影', '3', '0', '0', '0', '0', '0', '5	44454545	1364281284	admin', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('10', '3', 'forum', '音乐', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('11', '3', 'forum', '视频', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('12', '3', 'forum', '电视', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('13', '4', 'forum', '交友', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('14', '4', 'forum', '单身', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('15', '4', 'forum', '诉说', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('16', '4', 'forum', '婚恋', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('17', '5', 'forum', '美食', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('18', '5', 'forum', '购物', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('19', '5', 'forum', '美容', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('20', '5', 'forum', '健康', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('21', '5', 'forum', '汽车', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('22', '6', 'forum', '时尚', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('23', '6', 'forum', '星座', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('24', '6', 'forum', '摄影', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('25', '6', 'forum', '宠物', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('26', '6', 'forum', '动漫', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('27', '6', 'forum', '旅游', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('28', '6', 'forum', '设计', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('29', '8', 'forum', '足球', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('30', '8', 'forum', '篮球', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('31', '8', 'forum', '羽毛球', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('32', '8', 'forum', '乒乓球', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('33', '7', 'forum', '网游', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('35', '7', 'forum', '单机', '3', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '127', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('36', '9', 'sub', 'qq', '3', '0', '0', '1', '2', '0', '5	44454545	1364281284	admin', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '1', '2', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('37', '0', 'group', '聊天群', '3', '0', '0', '0', '0', '0', '4	sadasd	1363830723	admin1', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('38', '37', 'sub', '聊天', '3', '0', '0', '2', '2', '0', '4	sadasd	1363830723	admin1', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('41', '40', 'sub', '新街口', '1', '0', '0', '2', '3', '0', '15	ssssssssssssssssssssssssssssss	1364802321	admin', '', '1', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('40', '1', 'forum', '商圈', '1', '0', '0', '2', '7', '0', '15	ssssssssssssssssssssssssssssss	1364802321	admin', '', '1', '0', '1', '1', '0', '0', '2', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('42', '40', 'sub', '嘉华', '1', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('43', '40', 'sub', '陆家嘴', '1', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('44', '40', 'sub', '浦东', '1', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('45', '0', 'group', '商圈', '3', '0', '0', '0', '0', '0', '17	132312132213132132132	1366450376	admin', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('46', '45', 'sub', '新街口商圈', '3', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('47', '45', 'sub', 'newgroup', '3', '0', '0', '1', '1', '0', '17	132312132213132132132	1366450376	admin', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('48', '45', 'sub', '徐家汇', '3', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('49', '45', 'sub', 'shangquanjiekou', '3', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('50', '0', 'group', 'shangquanjiekou', '3', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('51', '45', 'sub', '今天天气不错呀！', '3', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('52', '45', 'sub', '今天天气不错呀！', '3', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `pre_forum_forum` VALUES ('53', '45', 'sub', '', '3', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null);
