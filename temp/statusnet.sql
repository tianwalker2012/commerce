/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : statusnet

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2013-05-10 16:23:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `avatar`
-- ----------------------------
DROP TABLE IF EXISTS `avatar`;
CREATE TABLE `avatar` (
  `profile_id` int(11) NOT NULL COMMENT 'foreign key to profile table',
  `original` tinyint(4) DEFAULT '0' COMMENT 'uploaded by user or generated?',
  `width` int(11) NOT NULL COMMENT 'image width',
  `height` int(11) NOT NULL COMMENT 'image height',
  `mediatype` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'file type',
  `filename` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'local filename, if local',
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'avatar location',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`profile_id`,`width`,`height`),
  UNIQUE KEY `avatar_url_key` (`url`),
  KEY `avatar_profile_id_idx` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of avatar
-- ----------------------------
INSERT INTO `avatar` VALUES ('1', '0', '24', '24', 'image/jpeg', '251-24-20130422035611.jpeg', 'http://localhost/statusnet/avatar/251-24-20130422035611.jpeg', '2013-04-22 03:56:11', '2013-04-22 11:56:11');
INSERT INTO `avatar` VALUES ('1', '0', '48', '48', 'image/jpeg', '921-48-20130422035611.jpeg', 'http://localhost/statusnet/avatar/921-48-20130422035611.jpeg', '2013-04-22 03:56:11', '2013-04-22 11:56:11');
INSERT INTO `avatar` VALUES ('1', '0', '96', '96', 'image/jpeg', '411-96-20130422035611.jpeg', 'http://localhost/statusnet/avatar/411-96-20130422035611.jpeg', '2013-04-22 03:56:11', '2013-04-22 11:56:11');
INSERT INTO `avatar` VALUES ('1', '1', '480', '480', 'image/jpeg', '251-480-20130422035611.jpeg', 'http://localhost/statusnet/avatar/251-480-20130422035611.jpeg', '2013-04-22 03:56:11', '2013-04-22 11:56:11');

-- ----------------------------
-- Table structure for `bookmark`
-- ----------------------------
DROP TABLE IF EXISTS `bookmark`;
CREATE TABLE `bookmark` (
  `id` char(36) COLLATE utf8_bin NOT NULL,
  `profile_id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `uri` varchar(255) COLLATE utf8_bin NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bookmark_uri_idx` (`uri`),
  KEY `bookmark_profile_id_idx` (`profile_id`),
  KEY `bookmark_url_idx` (`url`),
  KEY `bookmark_created_idx` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bookmark
-- ----------------------------
INSERT INTO `bookmark` VALUES ('58ba8e57-a772-4774-9a75-8e78e558284d', '1', 'http://weibo.com/ajaxlogin.php?framelogin=1&callback=parent.sinaSSOController.feedBackUrlCallBack', '微博', 0xE5BEAEE58D9A, 'http://localhost/statusnet/index.php/bookmark/58ba8e57-a772-4774-9a75-8e78e558284d', '2013-01-29 02:57:59');
INSERT INTO `bookmark` VALUES ('747943bd-8ea4-4e2b-987f-18ac130105e7', '1', 'http://www.songeast.com.cn/statusnet/index.php/group/y200703/1', '你好', 0xE799BEE5BAA6E4B880E4B88BE4BDA0E5B0B1E58FAAE68782E5958A, 'http://localhost/statusnet/index.php/bookmark/747943bd-8ea4-4e2b-987f-18ac130105e7', '2013-02-01 07:15:30');

-- ----------------------------
-- Table structure for `config`
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `section` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'configuration section',
  `setting` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'configuration setting',
  `value` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'configuration value',
  PRIMARY KEY (`section`,`setting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('plugins', 'disable-Activity', '0');
INSERT INTO `config` VALUES ('plugins', 'disable-Directory', '1');
INSERT INTO `config` VALUES ('plugins', 'disable-Geonames', '1');
INSERT INTO `config` VALUES ('plugins', 'disable-OStatus', '1');
INSERT INTO `config` VALUES ('plugins', 'disable-OpenID', '1');
INSERT INTO `config` VALUES ('plugins', 'disable-QnA', '1');
INSERT INTO `config` VALUES ('plugins', 'disable-TagSub', '1');
INSERT INTO `config` VALUES ('site', 'broughtby', '');
INSERT INTO `config` VALUES ('site', 'broughtbyurl', '');
INSERT INTO `config` VALUES ('site', 'closed', '1');
INSERT INTO `config` VALUES ('site', 'dupelimit', '60');
INSERT INTO `config` VALUES ('site', 'email', 'you@example.com');
INSERT INTO `config` VALUES ('site', 'inviteonly', '0');
INSERT INTO `config` VALUES ('site', 'language', 'zh_CN');
INSERT INTO `config` VALUES ('site', 'logo', '');
INSERT INTO `config` VALUES ('site', 'name', '家校互动');
INSERT INTO `config` VALUES ('site', 'private', '1');
INSERT INTO `config` VALUES ('site', 'site', null);
INSERT INTO `config` VALUES ('site', 'ssllogo', '');
INSERT INTO `config` VALUES ('site', 'textlimit', '0');
INSERT INTO `config` VALUES ('site', 'timezone', 'UTC');

-- ----------------------------
-- Table structure for `confirm_address`
-- ----------------------------
DROP TABLE IF EXISTS `confirm_address`;
CREATE TABLE `confirm_address` (
  `code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'good random code',
  `user_id` int(11) NOT NULL COMMENT 'user who requested confirmation',
  `address` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'address (email, xmpp, SMS, etc.)',
  `address_extra` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'carrier ID, for SMS',
  `address_type` varchar(8) COLLATE utf8_bin NOT NULL COMMENT 'address type ("email", "xmpp", "sms")',
  `claimed` datetime DEFAULT NULL COMMENT 'date this was claimed for queueing',
  `sent` datetime DEFAULT NULL COMMENT 'date this was sent for queueing',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of confirm_address
-- ----------------------------

-- ----------------------------
-- Table structure for `consumer`
-- ----------------------------
DROP TABLE IF EXISTS `consumer`;
CREATE TABLE `consumer` (
  `consumer_key` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'unique identifier, root URL',
  `consumer_secret` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'secret value',
  `seed` char(32) COLLATE utf8_bin NOT NULL COMMENT 'seed for new tokens by this consumer',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`consumer_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of consumer
-- ----------------------------

-- ----------------------------
-- Table structure for `conversation`
-- ----------------------------
DROP TABLE IF EXISTS `conversation`;
CREATE TABLE `conversation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique identifier',
  `uri` varchar(225) COLLATE utf8_bin DEFAULT NULL COMMENT 'URI of the conversation',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`id`),
  UNIQUE KEY `conversation_uri_key` (`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of conversation
-- ----------------------------
INSERT INTO `conversation` VALUES ('1', 'http://localhost/statusnet/index.php/conversation/1', '2013-04-23 03:24:35', '2013-04-23 11:24:35');
INSERT INTO `conversation` VALUES ('2', 'http://localhost/statusnet/index.php/conversation/2', '2013-04-23 03:24:39', '2013-04-23 11:24:39');
INSERT INTO `conversation` VALUES ('3', 'http://localhost/statusnet/index.php/conversation/3', '2013-04-23 03:24:42', '2013-04-23 11:24:42');
INSERT INTO `conversation` VALUES ('4', 'http://localhost/statusnet/index.php/conversation/4', '2013-04-23 03:24:45', '2013-04-23 11:24:45');
INSERT INTO `conversation` VALUES ('5', 'http://localhost/statusnet/index.php/conversation/5', '2013-04-23 03:25:25', '2013-04-23 11:25:25');

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '课程代号',
  `fullname` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '课程名称',
  `description` text CHARACTER SET utf8,
  `type` tinyint(4) DEFAULT NULL,
  `applicable_grades` int(11) DEFAULT NULL,
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=604 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('599', 'SH0003', '英语课', 'CD-ROMadssssssssssss', '1', '4', '2012-12-31 04:52:39', '2013-01-18 01:04:53');
INSERT INTO `course` VALUES ('600', 'shanad', '体育课', '提花', '1', '0', '2012-12-31 13:57:16', '2012-12-31 21:57:16');
INSERT INTO `course` VALUES ('601', '﻿SH0001', '常规', 'CD-ROM', '1', '6', '2012-12-31 13:57:37', '2012-12-31 21:57:37');
INSERT INTO `course` VALUES ('602', 'SH0002', '取消', 'CD-ROM', '2', '5', '2012-12-31 13:57:37', '2012-12-31 21:57:37');
INSERT INTO `course` VALUES ('603', 'SH2013124', '库萨克', '拉克三大', '1', '0', '2013-01-24 06:39:34', '2013-01-24 14:39:34');

-- ----------------------------
-- Table structure for `cycle`
-- ----------------------------
DROP TABLE IF EXISTS `cycle`;
CREATE TABLE `cycle` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique identifier',
  `nickname` varchar(255) CHARACTER SET utf8 NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cycle
-- ----------------------------
INSERT INTO `cycle` VALUES ('1', '好友讨论群', '1', '2013-02-18 02:59:26', '2013-02-18 14:25:15');
INSERT INTO `cycle` VALUES ('2', 'testcycle', '1', '2013-02-18 03:01:25', '2013-02-18 11:01:25');
INSERT INTO `cycle` VALUES ('3', 'testcycle', '1', '2013-02-18 05:03:22', '2013-02-18 13:03:22');
INSERT INTO `cycle` VALUES ('4', 'testcycle', '1', '2013-02-18 05:03:51', '2013-02-18 13:03:51');
INSERT INTO `cycle` VALUES ('5', 'testcycle', '1', '2013-02-18 05:11:13', '2013-02-18 13:11:13');
INSERT INTO `cycle` VALUES ('6', 'testcycle', '1', '2013-02-18 06:30:10', '2013-02-18 14:30:10');
INSERT INTO `cycle` VALUES ('7', 'testcycle', '1', '2013-02-18 06:37:00', '2013-02-18 14:37:00');
INSERT INTO `cycle` VALUES ('8', 'testcycle', '1', '2013-02-18 06:38:36', '2013-02-18 14:38:36');
INSERT INTO `cycle` VALUES ('9', 'testcycle', '1', '2013-02-18 06:38:41', '2013-02-18 14:38:41');
INSERT INTO `cycle` VALUES ('10', 'testcycle', '1', '2013-02-18 06:38:48', '2013-02-18 14:38:48');
INSERT INTO `cycle` VALUES ('11', 'testcycle', '1', '2013-02-18 06:38:54', '2013-02-18 14:38:54');
INSERT INTO `cycle` VALUES ('12', 'testcycle', '1', '2013-02-18 06:39:01', '2013-02-18 14:39:01');
INSERT INTO `cycle` VALUES ('13', 'testcycle', '1', '2013-02-18 06:39:07', '2013-02-18 14:39:07');
INSERT INTO `cycle` VALUES ('14', 'testcycle', '1', '2013-02-18 06:41:08', '2013-02-18 14:41:08');
INSERT INTO `cycle` VALUES ('15', 'testcycle', '1', '2013-02-18 06:57:18', '2013-02-18 14:57:18');
INSERT INTO `cycle` VALUES ('16', '2013-02-19 04:39:36 +0000:group', '1', '2013-02-18 06:58:20', '2013-02-19 12:38:41');
INSERT INTO `cycle` VALUES ('17', 'testcycle', '1', '2013-02-18 06:59:01', '2013-02-18 14:59:01');
INSERT INTO `cycle` VALUES ('18', 'tian ge', '5', '2013-02-19 04:27:37', '2013-02-19 12:27:37');
INSERT INTO `cycle` VALUES ('19', '', '1', '2013-02-19 04:46:20', '2013-02-19 12:46:20');
INSERT INTO `cycle` VALUES ('20', '', '1', '2013-02-19 04:46:33', '2013-02-19 12:46:33');
INSERT INTO `cycle` VALUES ('21', '', '1', '2013-02-19 04:53:36', '2013-02-19 12:53:36');
INSERT INTO `cycle` VALUES ('22', '', '1', '2013-02-19 05:45:09', '2013-02-19 13:45:09');
INSERT INTO `cycle` VALUES ('23', '', '1', '2013-02-19 07:11:17', '2013-02-19 15:11:17');
INSERT INTO `cycle` VALUES ('24', '', '1', '2013-02-19 07:30:57', '2013-02-19 15:30:57');
INSERT INTO `cycle` VALUES ('25', '', '1', '2013-02-19 07:59:40', '2013-02-19 15:59:40');
INSERT INTO `cycle` VALUES ('26', '', '1', '2013-02-19 08:39:47', '2013-02-19 16:39:47');
INSERT INTO `cycle` VALUES ('27', '开朗的', '1', '2013-02-19 08:44:07', '2013-02-19 17:49:49');
INSERT INTO `cycle` VALUES ('28', '官方发规定', '1', '2013-02-19 10:12:26', '2013-02-19 18:39:31');
INSERT INTO `cycle` VALUES ('29', '好好学习', '5', '2013-02-19 10:43:48', '2013-02-20 15:35:00');
INSERT INTO `cycle` VALUES ('30', '', '5', '2013-02-19 15:48:35', '2013-02-19 23:48:35');
INSERT INTO `cycle` VALUES ('31', '', '1', '2013-02-19 16:03:52', '2013-02-20 00:03:52');
INSERT INTO `cycle` VALUES ('32', '', '1', '2013-02-20 08:07:53', '2013-02-20 16:07:53');
INSERT INTO `cycle` VALUES ('33', '', '1', '2013-02-20 08:13:12', '2013-02-20 16:13:12');
INSERT INTO `cycle` VALUES ('34', '搞笑', '1', '2013-02-20 10:15:55', '2013-02-27 23:06:46');
INSERT INTO `cycle` VALUES ('35', '', '1', '2013-02-21 04:07:41', '2013-02-21 12:07:41');
INSERT INTO `cycle` VALUES ('36', '有意思', '1', '2013-02-22 03:57:27', '2013-02-26 12:32:01');
INSERT INTO `cycle` VALUES ('37', 'ggddfff', '1', '2013-02-22 04:04:25', '2013-03-21 17:06:19');
INSERT INTO `cycle` VALUES ('38', '', '1', '2013-02-24 15:01:26', '2013-02-24 23:01:26');
INSERT INTO `cycle` VALUES ('39', '', '1', '2013-02-24 15:05:08', '2013-02-24 23:05:08');
INSERT INTO `cycle` VALUES ('40', '', '3', '2013-02-25 02:37:51', '2013-02-25 10:37:51');
INSERT INTO `cycle` VALUES ('41', '', '1', '2013-02-25 14:35:56', '2013-02-25 22:35:56');
INSERT INTO `cycle` VALUES ('42', '', '1', '2013-02-26 02:56:42', '2013-02-26 10:56:42');
INSERT INTO `cycle` VALUES ('43', 'Tian He', '1', '2013-02-26 02:59:30', '2013-02-26 10:59:50');
INSERT INTO `cycle` VALUES ('44', '', '1', '2013-02-28 13:22:52', '2013-02-28 21:22:52');
INSERT INTO `cycle` VALUES ('45', '妥妥贴贴', '1', '2013-03-07 02:33:33', '2013-03-21 11:56:13');
INSERT INTO `cycle` VALUES ('46', '', '1', '2013-03-08 13:03:37', '2013-03-08 21:03:37');
INSERT INTO `cycle` VALUES ('47', '眼科会诊', '1', '2013-03-08 13:04:45', '2013-03-11 10:04:53');
INSERT INTO `cycle` VALUES ('48', 'Ga', '1', '2013-03-14 06:33:35', '2013-03-14 14:34:15');
INSERT INTO `cycle` VALUES ('49', '通天塔', '1', '2013-03-16 08:41:05', '2013-03-16 16:42:08');
INSERT INTO `cycle` VALUES ('50', '有些哥不是哥', '1', '2013-03-21 03:12:02', '2013-03-21 11:15:03');
INSERT INTO `cycle` VALUES ('51', '', '1', '2013-03-21 06:04:19', '2013-03-21 14:04:19');
INSERT INTO `cycle` VALUES ('52', '', '1', '2013-03-21 06:11:04', '2013-03-21 14:11:04');
INSERT INTO `cycle` VALUES ('53', '', '1', '2013-03-21 06:37:54', '2013-03-21 14:37:54');
INSERT INTO `cycle` VALUES ('54', '', '1', '2013-03-21 06:52:43', '2013-03-21 14:52:43');
INSERT INTO `cycle` VALUES ('55', '', '1', '2013-03-21 06:59:36', '2013-03-21 14:59:36');
INSERT INTO `cycle` VALUES ('56', '', '1', '2013-03-21 07:04:53', '2013-03-21 15:04:53');
INSERT INTO `cycle` VALUES ('57', '++++++', '1', '2013-03-21 08:39:39', '2013-03-21 16:40:03');
INSERT INTO `cycle` VALUES ('58', '', '1', '2013-03-21 09:05:54', '2013-03-21 17:05:54');
INSERT INTO `cycle` VALUES ('59', '', '3', '2013-03-22 08:27:31', '2013-03-22 16:27:31');
INSERT INTO `cycle` VALUES ('60', '', '3', '2013-03-22 08:28:06', '2013-03-22 16:28:06');

-- ----------------------------
-- Table structure for `cycle_member`
-- ----------------------------
DROP TABLE IF EXISTS `cycle_member`;
CREATE TABLE `cycle_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cycle_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cycle_member
-- ----------------------------
INSERT INTO `cycle_member` VALUES ('1', '1', '1', '2013-02-18 02:59:26', '2013-02-18 10:59:26');
INSERT INTO `cycle_member` VALUES ('3', '1', '4', '2013-02-18 02:59:26', '2013-02-18 10:59:26');
INSERT INTO `cycle_member` VALUES ('7', '2', '1', '2013-02-18 03:01:25', '2013-02-18 11:01:25');
INSERT INTO `cycle_member` VALUES ('8', '2', '3', '2013-02-18 03:01:25', '2013-02-18 11:01:25');
INSERT INTO `cycle_member` VALUES ('9', '2', '4', '2013-02-18 03:01:25', '2013-02-18 11:01:25');
INSERT INTO `cycle_member` VALUES ('10', '2', '5', '2013-02-18 03:01:25', '2013-02-18 11:01:25');
INSERT INTO `cycle_member` VALUES ('11', '2', '7', '2013-02-18 03:01:25', '2013-02-18 11:01:25');
INSERT INTO `cycle_member` VALUES ('12', '2', '10', '2013-02-18 03:01:25', '2013-02-18 11:01:25');
INSERT INTO `cycle_member` VALUES ('20', '3', '1', '2013-02-18 05:03:22', '2013-02-18 13:03:22');
INSERT INTO `cycle_member` VALUES ('21', '3', '3', '2013-02-18 05:03:22', '2013-02-18 13:03:22');
INSERT INTO `cycle_member` VALUES ('22', '3', '4', '2013-02-18 05:03:22', '2013-02-18 13:03:22');
INSERT INTO `cycle_member` VALUES ('23', '3', '5', '2013-02-18 05:03:22', '2013-02-18 13:03:22');
INSERT INTO `cycle_member` VALUES ('24', '3', '7', '2013-02-18 05:03:22', '2013-02-18 13:03:22');
INSERT INTO `cycle_member` VALUES ('25', '3', '10', '2013-02-18 05:03:22', '2013-02-18 13:03:22');
INSERT INTO `cycle_member` VALUES ('26', '4', '1', '2013-02-18 05:03:52', '2013-02-18 13:03:52');
INSERT INTO `cycle_member` VALUES ('27', '4', '3', '2013-02-18 05:03:52', '2013-02-18 13:03:52');
INSERT INTO `cycle_member` VALUES ('28', '4', '4', '2013-02-18 05:03:52', '2013-02-18 13:03:52');
INSERT INTO `cycle_member` VALUES ('29', '4', '5', '2013-02-18 05:03:52', '2013-02-18 13:03:52');
INSERT INTO `cycle_member` VALUES ('30', '4', '7', '2013-02-18 05:03:52', '2013-02-18 13:03:52');
INSERT INTO `cycle_member` VALUES ('31', '4', '10', '2013-02-18 05:03:52', '2013-02-18 13:03:52');
INSERT INTO `cycle_member` VALUES ('32', '5', '1', '2013-02-18 05:11:13', '2013-02-18 13:11:13');
INSERT INTO `cycle_member` VALUES ('33', '5', '3', '2013-02-18 05:11:13', '2013-02-18 13:11:13');
INSERT INTO `cycle_member` VALUES ('34', '5', '4', '2013-02-18 05:11:13', '2013-02-18 13:11:13');
INSERT INTO `cycle_member` VALUES ('35', '5', '5', '2013-02-18 05:11:13', '2013-02-18 13:11:13');
INSERT INTO `cycle_member` VALUES ('36', '5', '7', '2013-02-18 05:11:13', '2013-02-18 13:11:13');
INSERT INTO `cycle_member` VALUES ('37', '5', '10', '2013-02-18 05:11:13', '2013-02-18 13:11:13');
INSERT INTO `cycle_member` VALUES ('38', '6', '1', '2013-02-18 06:30:10', '2013-02-18 14:30:10');
INSERT INTO `cycle_member` VALUES ('39', '6', '3', '2013-02-18 06:30:10', '2013-02-18 14:30:10');
INSERT INTO `cycle_member` VALUES ('40', '6', '4', '2013-02-18 06:30:10', '2013-02-18 14:30:10');
INSERT INTO `cycle_member` VALUES ('41', '6', '5', '2013-02-18 06:30:10', '2013-02-18 14:30:10');
INSERT INTO `cycle_member` VALUES ('42', '6', '7', '2013-02-18 06:30:10', '2013-02-18 14:30:10');
INSERT INTO `cycle_member` VALUES ('43', '6', '10', '2013-02-18 06:30:10', '2013-02-18 14:30:10');
INSERT INTO `cycle_member` VALUES ('44', '7', '1', '2013-02-18 06:37:00', '2013-02-18 14:37:00');
INSERT INTO `cycle_member` VALUES ('45', '7', '3', '2013-02-18 06:37:00', '2013-02-18 14:37:00');
INSERT INTO `cycle_member` VALUES ('46', '7', '4', '2013-02-18 06:37:00', '2013-02-18 14:37:00');
INSERT INTO `cycle_member` VALUES ('47', '7', '5', '2013-02-18 06:37:00', '2013-02-18 14:37:00');
INSERT INTO `cycle_member` VALUES ('48', '7', '7', '2013-02-18 06:37:00', '2013-02-18 14:37:00');
INSERT INTO `cycle_member` VALUES ('49', '7', '10', '2013-02-18 06:37:00', '2013-02-18 14:37:00');
INSERT INTO `cycle_member` VALUES ('50', '8', '1', '2013-02-18 06:38:36', '2013-02-18 14:38:36');
INSERT INTO `cycle_member` VALUES ('51', '8', '3', '2013-02-18 06:38:36', '2013-02-18 14:38:36');
INSERT INTO `cycle_member` VALUES ('52', '8', '4', '2013-02-18 06:38:36', '2013-02-18 14:38:36');
INSERT INTO `cycle_member` VALUES ('53', '8', '5', '2013-02-18 06:38:36', '2013-02-18 14:38:36');
INSERT INTO `cycle_member` VALUES ('54', '8', '7', '2013-02-18 06:38:36', '2013-02-18 14:38:36');
INSERT INTO `cycle_member` VALUES ('55', '8', '10', '2013-02-18 06:38:36', '2013-02-18 14:38:36');
INSERT INTO `cycle_member` VALUES ('57', '9', '3', '2013-02-18 06:38:41', '2013-02-18 14:38:41');
INSERT INTO `cycle_member` VALUES ('58', '9', '4', '2013-02-18 06:38:41', '2013-02-18 14:38:41');
INSERT INTO `cycle_member` VALUES ('59', '9', '5', '2013-02-18 06:38:42', '2013-02-18 14:38:42');
INSERT INTO `cycle_member` VALUES ('60', '9', '7', '2013-02-18 06:38:42', '2013-02-18 14:38:42');
INSERT INTO `cycle_member` VALUES ('61', '9', '10', '2013-02-18 06:38:42', '2013-02-18 14:38:42');
INSERT INTO `cycle_member` VALUES ('62', '10', '1', '2013-02-18 06:38:48', '2013-02-18 14:38:48');
INSERT INTO `cycle_member` VALUES ('63', '10', '3', '2013-02-18 06:38:48', '2013-02-18 14:38:48');
INSERT INTO `cycle_member` VALUES ('64', '10', '4', '2013-02-18 06:38:48', '2013-02-18 14:38:48');
INSERT INTO `cycle_member` VALUES ('65', '10', '5', '2013-02-18 06:38:48', '2013-02-18 14:38:48');
INSERT INTO `cycle_member` VALUES ('66', '10', '7', '2013-02-18 06:38:48', '2013-02-18 14:38:48');
INSERT INTO `cycle_member` VALUES ('67', '10', '10', '2013-02-18 06:38:48', '2013-02-18 14:38:48');
INSERT INTO `cycle_member` VALUES ('68', '11', '1', '2013-02-18 06:38:54', '2013-02-18 14:38:54');
INSERT INTO `cycle_member` VALUES ('69', '11', '3', '2013-02-18 06:38:54', '2013-02-18 14:38:54');
INSERT INTO `cycle_member` VALUES ('70', '11', '4', '2013-02-18 06:38:54', '2013-02-18 14:38:54');
INSERT INTO `cycle_member` VALUES ('71', '11', '5', '2013-02-18 06:38:54', '2013-02-18 14:38:54');
INSERT INTO `cycle_member` VALUES ('72', '11', '7', '2013-02-18 06:38:54', '2013-02-18 14:38:54');
INSERT INTO `cycle_member` VALUES ('73', '11', '10', '2013-02-18 06:38:54', '2013-02-18 14:38:54');
INSERT INTO `cycle_member` VALUES ('74', '12', '1', '2013-02-18 06:39:01', '2013-02-18 14:39:01');
INSERT INTO `cycle_member` VALUES ('75', '12', '3', '2013-02-18 06:39:01', '2013-02-18 14:39:01');
INSERT INTO `cycle_member` VALUES ('76', '12', '4', '2013-02-18 06:39:01', '2013-02-18 14:39:01');
INSERT INTO `cycle_member` VALUES ('77', '12', '5', '2013-02-18 06:39:01', '2013-02-18 14:39:01');
INSERT INTO `cycle_member` VALUES ('78', '12', '7', '2013-02-18 06:39:01', '2013-02-18 14:39:01');
INSERT INTO `cycle_member` VALUES ('79', '12', '10', '2013-02-18 06:39:01', '2013-02-18 14:39:01');
INSERT INTO `cycle_member` VALUES ('81', '13', '3', '2013-02-18 06:39:07', '2013-02-18 14:39:07');
INSERT INTO `cycle_member` VALUES ('82', '13', '4', '2013-02-18 06:39:07', '2013-02-18 14:39:07');
INSERT INTO `cycle_member` VALUES ('83', '13', '5', '2013-02-18 06:39:07', '2013-02-18 14:39:07');
INSERT INTO `cycle_member` VALUES ('84', '13', '7', '2013-02-18 06:39:07', '2013-02-18 14:39:07');
INSERT INTO `cycle_member` VALUES ('85', '13', '10', '2013-02-18 06:39:07', '2013-02-18 14:39:07');
INSERT INTO `cycle_member` VALUES ('86', '14', '1', '2013-02-18 06:41:08', '2013-02-18 14:41:08');
INSERT INTO `cycle_member` VALUES ('87', '14', '3', '2013-02-18 06:41:08', '2013-02-18 14:41:08');
INSERT INTO `cycle_member` VALUES ('88', '14', '4', '2013-02-18 06:41:08', '2013-02-18 14:41:08');
INSERT INTO `cycle_member` VALUES ('89', '14', '5', '2013-02-18 06:41:08', '2013-02-18 14:41:09');
INSERT INTO `cycle_member` VALUES ('90', '14', '7', '2013-02-18 06:41:09', '2013-02-18 14:41:09');
INSERT INTO `cycle_member` VALUES ('91', '14', '10', '2013-02-18 06:41:09', '2013-02-18 14:41:09');
INSERT INTO `cycle_member` VALUES ('92', '15', '1', '2013-02-18 06:57:18', '2013-02-18 14:57:18');
INSERT INTO `cycle_member` VALUES ('93', '15', '3', '2013-02-18 06:57:18', '2013-02-18 14:57:18');
INSERT INTO `cycle_member` VALUES ('94', '15', '4', '2013-02-18 06:57:18', '2013-02-18 14:57:18');
INSERT INTO `cycle_member` VALUES ('95', '15', '5', '2013-02-18 06:57:18', '2013-02-18 14:57:18');
INSERT INTO `cycle_member` VALUES ('96', '15', '7', '2013-02-18 06:57:18', '2013-02-18 14:57:18');
INSERT INTO `cycle_member` VALUES ('97', '15', '10', '2013-02-18 06:57:18', '2013-02-18 14:57:18');
INSERT INTO `cycle_member` VALUES ('100', '16', '4', '2013-02-18 06:58:20', '2013-02-18 14:58:20');
INSERT INTO `cycle_member` VALUES ('101', '16', '5', '2013-02-18 06:58:20', '2013-02-18 14:58:20');
INSERT INTO `cycle_member` VALUES ('102', '16', '7', '2013-02-18 06:58:20', '2013-02-18 14:58:20');
INSERT INTO `cycle_member` VALUES ('103', '16', '10', '2013-02-18 06:58:20', '2013-02-18 14:58:20');
INSERT INTO `cycle_member` VALUES ('106', '17', '4', '2013-02-18 06:59:01', '2013-02-18 14:59:01');
INSERT INTO `cycle_member` VALUES ('107', '17', '5', '2013-02-18 06:59:01', '2013-02-18 14:59:01');
INSERT INTO `cycle_member` VALUES ('108', '17', '7', '2013-02-18 06:59:01', '2013-02-18 14:59:01');
INSERT INTO `cycle_member` VALUES ('109', '17', '10', '2013-02-18 06:59:01', '2013-02-18 14:59:01');
INSERT INTO `cycle_member` VALUES ('111', '18', '1', '2013-02-19 04:27:37', '2013-02-19 12:27:37');
INSERT INTO `cycle_member` VALUES ('112', '18', '3', '2013-02-19 04:27:37', '2013-02-19 12:27:37');
INSERT INTO `cycle_member` VALUES ('113', '18', '4', '2013-02-19 04:27:37', '2013-02-19 12:27:37');
INSERT INTO `cycle_member` VALUES ('114', '18', '5', '2013-02-19 04:27:37', '2013-02-19 12:27:37');
INSERT INTO `cycle_member` VALUES ('115', '16', '8', '2013-02-19 04:30:36', '2013-02-19 12:30:36');
INSERT INTO `cycle_member` VALUES ('116', '19', '5', '2013-02-19 04:46:20', '2013-02-19 12:46:20');
INSERT INTO `cycle_member` VALUES ('117', '19', '7', '2013-02-19 04:46:20', '2013-02-19 12:46:20');
INSERT INTO `cycle_member` VALUES ('123', '21', '7', '2013-02-19 04:53:36', '2013-02-19 12:53:36');
INSERT INTO `cycle_member` VALUES ('127', '21', '10', '2013-02-19 05:40:13', '2013-02-19 13:40:13');
INSERT INTO `cycle_member` VALUES ('128', '22', '3', '2013-02-19 05:45:09', '2013-02-19 13:45:09');
INSERT INTO `cycle_member` VALUES ('129', '22', '4', '2013-02-19 05:45:09', '2013-02-19 13:45:09');
INSERT INTO `cycle_member` VALUES ('130', '22', '10', '2013-02-19 05:45:09', '2013-02-19 13:45:09');
INSERT INTO `cycle_member` VALUES ('132', '22', '7', '2013-02-19 05:45:32', '2013-02-19 13:45:32');
INSERT INTO `cycle_member` VALUES ('137', '24', '5', '2013-02-19 07:30:57', '2013-02-19 15:30:57');
INSERT INTO `cycle_member` VALUES ('140', '25', '3', '2013-02-19 07:59:40', '2013-02-19 15:59:40');
INSERT INTO `cycle_member` VALUES ('142', '25', '1', '2013-02-19 07:59:40', '2013-02-19 15:59:40');
INSERT INTO `cycle_member` VALUES ('146', '26', '5', '2013-02-19 08:39:47', '2013-02-19 16:39:47');
INSERT INTO `cycle_member` VALUES ('148', '26', '1', '2013-02-19 08:39:47', '2013-02-19 16:39:47');
INSERT INTO `cycle_member` VALUES ('160', '27', '7', '2013-02-19 09:53:12', '2013-02-19 17:53:12');
INSERT INTO `cycle_member` VALUES ('178', '30', '4', '2013-02-19 15:48:35', '2013-02-19 23:48:35');
INSERT INTO `cycle_member` VALUES ('186', '31', '7', '2013-02-20 07:38:43', '2013-02-20 15:38:43');
INSERT INTO `cycle_member` VALUES ('188', '32', '7', '2013-02-20 08:07:53', '2013-02-20 16:07:53');
INSERT INTO `cycle_member` VALUES ('191', '33', '7', '2013-02-20 08:13:12', '2013-02-20 16:13:12');
INSERT INTO `cycle_member` VALUES ('194', '34', '5', '2013-02-20 10:15:55', '2013-02-20 18:15:55');
INSERT INTO `cycle_member` VALUES ('195', '34', '7', '2013-02-20 10:15:55', '2013-02-20 18:15:55');
INSERT INTO `cycle_member` VALUES ('197', '35', '10', '2013-02-21 04:07:41', '2013-02-21 12:07:41');
INSERT INTO `cycle_member` VALUES ('198', '35', '7', '2013-02-21 04:07:41', '2013-02-21 12:07:41');
INSERT INTO `cycle_member` VALUES ('204', '36', '1', '2013-02-22 03:57:27', '2013-02-22 11:57:27');
INSERT INTO `cycle_member` VALUES ('205', '37', '7', '2013-02-22 04:04:25', '2013-02-22 12:04:25');
INSERT INTO `cycle_member` VALUES ('206', '37', '4', '2013-02-22 04:04:25', '2013-02-22 12:04:25');
INSERT INTO `cycle_member` VALUES ('207', '37', '1', '2013-02-22 04:04:25', '2013-02-22 12:04:25');
INSERT INTO `cycle_member` VALUES ('209', '37', '5', '2013-02-24 14:17:53', '2013-02-24 22:17:53');
INSERT INTO `cycle_member` VALUES ('211', '38', '7', '2013-02-24 15:01:26', '2013-02-24 23:01:26');
INSERT INTO `cycle_member` VALUES ('212', '38', '5', '2013-02-24 15:01:26', '2013-02-24 23:01:26');
INSERT INTO `cycle_member` VALUES ('213', '38', '4', '2013-02-24 15:01:26', '2013-02-24 23:01:26');
INSERT INTO `cycle_member` VALUES ('215', '39', '4', '2013-02-24 15:05:08', '2013-02-24 23:05:08');
INSERT INTO `cycle_member` VALUES ('216', '39', '10', '2013-02-24 15:05:08', '2013-02-24 23:05:08');
INSERT INTO `cycle_member` VALUES ('218', '29', '1', '2013-02-25 02:37:25', '2013-02-25 10:37:25');
INSERT INTO `cycle_member` VALUES ('220', '40', '5', '2013-02-25 02:37:51', '2013-02-25 10:37:51');
INSERT INTO `cycle_member` VALUES ('221', '40', '7', '2013-02-25 02:37:51', '2013-02-25 10:37:51');
INSERT INTO `cycle_member` VALUES ('223', '37', '10', '2013-02-25 14:31:36', '2013-02-25 22:31:36');
INSERT INTO `cycle_member` VALUES ('224', '41', '4', '2013-02-25 14:35:56', '2013-02-25 22:35:56');
INSERT INTO `cycle_member` VALUES ('227', '42', '5', '2013-02-26 02:56:42', '2013-02-26 10:56:42');
INSERT INTO `cycle_member` VALUES ('228', '42', '7', '2013-02-26 02:56:42', '2013-02-26 10:56:42');
INSERT INTO `cycle_member` VALUES ('229', '42', '1', '2013-02-26 02:56:42', '2013-02-26 10:56:42');
INSERT INTO `cycle_member` VALUES ('230', '43', '5', '2013-02-26 02:59:30', '2013-02-26 10:59:30');
INSERT INTO `cycle_member` VALUES ('231', '43', '7', '2013-02-26 02:59:30', '2013-02-26 10:59:30');
INSERT INTO `cycle_member` VALUES ('232', '43', '1', '2013-02-26 02:59:30', '2013-02-26 10:59:30');
INSERT INTO `cycle_member` VALUES ('233', '36', '7', '2013-02-26 04:31:38', '2013-02-26 12:31:38');
INSERT INTO `cycle_member` VALUES ('234', '29', '5', '2013-02-26 06:31:25', '2013-02-26 14:31:25');
INSERT INTO `cycle_member` VALUES ('235', '44', '5', '2013-02-28 13:22:52', '2013-02-28 21:22:52');
INSERT INTO `cycle_member` VALUES ('236', '44', '7', '2013-02-28 13:22:52', '2013-02-28 21:22:52');
INSERT INTO `cycle_member` VALUES ('237', '44', '1', '2013-02-28 13:22:52', '2013-02-28 21:22:52');
INSERT INTO `cycle_member` VALUES ('238', '45', '3', '2013-03-07 02:33:33', '2013-03-07 10:33:33');
INSERT INTO `cycle_member` VALUES ('239', '45', '4', '2013-03-07 02:33:33', '2013-03-07 10:33:34');
INSERT INTO `cycle_member` VALUES ('240', '45', '1', '2013-03-07 02:33:34', '2013-03-07 10:33:34');
INSERT INTO `cycle_member` VALUES ('241', '45', '9', '2013-03-07 10:40:02', '2013-03-07 18:40:02');
INSERT INTO `cycle_member` VALUES ('242', '46', '7', '2013-03-08 13:03:37', '2013-03-08 21:03:37');
INSERT INTO `cycle_member` VALUES ('243', '46', '9', '2013-03-08 13:03:37', '2013-03-08 21:03:37');
INSERT INTO `cycle_member` VALUES ('245', '47', '31', '2013-03-08 13:04:45', '2013-03-08 21:04:45');
INSERT INTO `cycle_member` VALUES ('246', '47', '7', '2013-03-08 13:04:45', '2013-03-08 21:04:45');
INSERT INTO `cycle_member` VALUES ('247', '47', '1', '2013-03-08 13:04:45', '2013-03-08 21:04:45');
INSERT INTO `cycle_member` VALUES ('248', '48', '7', '2013-03-14 06:33:35', '2013-03-14 14:33:35');
INSERT INTO `cycle_member` VALUES ('249', '48', '31', '2013-03-14 06:33:35', '2013-03-14 14:33:35');
INSERT INTO `cycle_member` VALUES ('251', '49', '5', '2013-03-16 08:41:05', '2013-03-16 16:41:05');
INSERT INTO `cycle_member` VALUES ('252', '49', '7', '2013-03-16 08:41:05', '2013-03-16 16:41:05');
INSERT INTO `cycle_member` VALUES ('253', '49', '31', '2013-03-16 08:41:05', '2013-03-16 16:41:05');
INSERT INTO `cycle_member` VALUES ('255', '50', '3', '2013-03-21 03:12:02', '2013-03-21 11:12:02');
INSERT INTO `cycle_member` VALUES ('263', '50', '1', '2013-03-21 03:12:02', '2013-03-21 11:12:02');
INSERT INTO `cycle_member` VALUES ('268', '54', '3', '2013-03-21 06:52:43', '2013-03-21 14:52:43');
INSERT INTO `cycle_member` VALUES ('269', '54', '10', '2013-03-21 06:52:43', '2013-03-21 14:52:43');
INSERT INTO `cycle_member` VALUES ('270', '54', '4', '2013-03-21 06:52:43', '2013-03-21 14:52:43');
INSERT INTO `cycle_member` VALUES ('271', '55', '3', '2013-03-21 06:59:36', '2013-03-21 14:59:36');
INSERT INTO `cycle_member` VALUES ('272', '55', '10', '2013-03-21 06:59:36', '2013-03-21 14:59:36');
INSERT INTO `cycle_member` VALUES ('273', '55', '4', '2013-03-21 06:59:36', '2013-03-21 14:59:36');
INSERT INTO `cycle_member` VALUES ('274', '56', '3', '2013-03-21 07:04:53', '2013-03-21 15:04:53');
INSERT INTO `cycle_member` VALUES ('275', '56', '10', '2013-03-21 07:04:53', '2013-03-21 15:04:53');
INSERT INTO `cycle_member` VALUES ('276', '56', '4', '2013-03-21 07:04:53', '2013-03-21 15:04:53');
INSERT INTO `cycle_member` VALUES ('277', '57', '3', '2013-03-21 08:39:39', '2013-03-21 16:39:39');
INSERT INTO `cycle_member` VALUES ('278', '57', '10', '2013-03-21 08:39:39', '2013-03-21 16:39:39');
INSERT INTO `cycle_member` VALUES ('279', '57', '4', '2013-03-21 08:39:39', '2013-03-21 16:39:39');
INSERT INTO `cycle_member` VALUES ('280', '58', '3', '2013-03-21 09:05:54', '2013-03-21 17:05:54');
INSERT INTO `cycle_member` VALUES ('281', '58', '10', '2013-03-21 09:05:54', '2013-03-21 17:05:54');
INSERT INTO `cycle_member` VALUES ('282', '58', '4', '2013-03-21 09:05:54', '2013-03-21 17:05:54');
INSERT INTO `cycle_member` VALUES ('283', '59', '31', '2013-03-22 08:27:31', '2013-03-22 16:27:31');
INSERT INTO `cycle_member` VALUES ('284', '59', '7', '2013-03-22 08:27:31', '2013-03-22 16:27:31');
INSERT INTO `cycle_member` VALUES ('285', '59', '5', '2013-03-22 08:27:31', '2013-03-22 16:27:31');
INSERT INTO `cycle_member` VALUES ('287', '60', '5', '2013-03-22 08:28:06', '2013-03-22 16:28:06');
INSERT INTO `cycle_member` VALUES ('288', '60', '7', '2013-03-22 08:28:06', '2013-03-22 16:28:06');

-- ----------------------------
-- Table structure for `deleted_notice`
-- ----------------------------
DROP TABLE IF EXISTS `deleted_notice`;
CREATE TABLE `deleted_notice` (
  `id` int(11) NOT NULL COMMENT 'identity of notice',
  `profile_id` int(11) NOT NULL COMMENT 'author of the notice',
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'universally unique identifier, usually a tag URI',
  `created` datetime NOT NULL COMMENT 'date the notice record was created',
  `deleted` datetime NOT NULL COMMENT 'date the notice record was created',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deleted_notice_uri_key` (`uri`),
  KEY `deleted_notice_profile_id_idx` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of deleted_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `fave`
-- ----------------------------
DROP TABLE IF EXISTS `fave`;
CREATE TABLE `fave` (
  `notice_id` int(11) NOT NULL COMMENT 'notice that is the favorite',
  `user_id` int(11) NOT NULL COMMENT 'user who likes this notice',
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'universally unique identifier, usually a tag URI',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`notice_id`,`user_id`),
  UNIQUE KEY `fave_uri_key` (`uri`),
  KEY `fave_notice_id_idx` (`notice_id`),
  KEY `fave_user_id_idx` (`user_id`,`modified`),
  KEY `fave_modified_idx` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of fave
-- ----------------------------
INSERT INTO `fave` VALUES ('231', '1', 'tag:192.168.1.146,2012-12-29:statusnet:favor:1:231:2012-12-29T13:26:58+00:00', '2012-12-29 21:26:58');
INSERT INTO `fave` VALUES ('232', '1', 'tag:192.168.1.146,2012-12-29:statusnet:favor:1:232:2012-12-29T13:20:21+00:00', '2012-12-29 21:20:21');
INSERT INTO `fave` VALUES ('234', '1', 'tag:192.168.1.146,2012-12-29:statusnet:favor:1:234:2012-12-29T12:21:06+00:00', '2012-12-29 20:21:06');
INSERT INTO `fave` VALUES ('235', '1', 'tag:192.168.1.146,2012-12-29:statusnet:favor:1:235:2012-12-29T12:23:26+00:00', '2012-12-29 20:23:26');
INSERT INTO `fave` VALUES ('236', '1', 'tag:192.168.1.146,2012-12-29:statusnet:favor:1:236:2012-12-29T13:19:06+00:00', '2012-12-29 21:19:06');
INSERT INTO `fave` VALUES ('237', '1', 'tag:192.168.1.146,2012-12-29:statusnet:favor:1:237:2012-12-29T15:10:31+00:00', '2012-12-29 23:10:31');
INSERT INTO `fave` VALUES ('1028', '1', 'tag:www.songeast.com.cn,2013-03-14:statusnet:favor:1:1028:2013-03-14T17:14:43+08:00', '2013-03-14 17:14:43');
INSERT INTO `fave` VALUES ('1042', '1', 'tag:www.songeast.com.cn,2013-03-20:statusnet:favor:1:1042:2013-03-20T22:10:17+08:00', '2013-03-20 22:10:17');

-- ----------------------------
-- Table structure for `feedsub`
-- ----------------------------
DROP TABLE IF EXISTS `feedsub`;
CREATE TABLE `feedsub` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8_bin NOT NULL,
  `huburi` text COLLATE utf8_bin,
  `verify_token` text COLLATE utf8_bin,
  `secret` text COLLATE utf8_bin,
  `sub_state` enum('subscribe','active','unsubscribe','inactive') COLLATE utf8_bin NOT NULL,
  `sub_start` datetime DEFAULT NULL,
  `sub_end` datetime DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `feedsub_uri_idx` (`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of feedsub
-- ----------------------------

-- ----------------------------
-- Table structure for `file`
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'destination URL after following redirections',
  `mimetype` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'mime type of resource',
  `size` int(11) DEFAULT NULL COMMENT 'size of resource when available',
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'title of resource when available',
  `date` int(11) DEFAULT NULL COMMENT 'date of resource according to http query',
  `protected` int(11) DEFAULT NULL COMMENT 'true when URL is private (needs login)',
  `filename` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'if a local file, name of the file',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_url_key` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('1', 'http://localhost/statusnet/index.php/admin', 'text/html', null, null, null, null, null, '2013-04-23 11:24:31');
INSERT INTO `file` VALUES ('2', 'http://localhost/statusnet/index.php/yangfany', 'text/html', null, null, null, null, null, '2013-04-23 11:24:34');
INSERT INTO `file` VALUES ('3', 'http://localhost/statusnet/index.php/yangfanyf', 'text/html', null, null, null, null, null, '2013-04-23 11:24:38');
INSERT INTO `file` VALUES ('4', 'http://localhost/statusnet/index.php/lyb', 'text/html', null, null, null, null, null, '2013-04-23 11:24:41');
INSERT INTO `file` VALUES ('5', 'http://localhost/statusnet/index.php/kyle', 'text/html', null, null, null, null, null, '2013-04-23 11:24:44');

-- ----------------------------
-- Table structure for `file_oembed`
-- ----------------------------
DROP TABLE IF EXISTS `file_oembed`;
CREATE TABLE `file_oembed` (
  `file_id` int(11) NOT NULL COMMENT 'oEmbed for that URL/file',
  `version` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'oEmbed spec. version',
  `type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'oEmbed type: photo, video, link, rich',
  `mimetype` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'mime type of resource',
  `provider` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'name of this oEmbed provider',
  `provider_url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'URL of this oEmbed provider',
  `width` int(11) DEFAULT NULL COMMENT 'width of oEmbed resource when available',
  `height` int(11) DEFAULT NULL COMMENT 'height of oEmbed resource when available',
  `html` text COLLATE utf8_bin COMMENT 'html representation of this oEmbed resource when applicable',
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'title of oEmbed resource when available',
  `author_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'author name for this oEmbed resource',
  `author_url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'author URL for this oEmbed resource',
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'URL for this oEmbed resource when applicable (photo, link)',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of file_oembed
-- ----------------------------

-- ----------------------------
-- Table structure for `file_redirection`
-- ----------------------------
DROP TABLE IF EXISTS `file_redirection`;
CREATE TABLE `file_redirection` (
  `url` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'short URL (or any other kind of redirect) for file (id)',
  `file_id` int(11) DEFAULT NULL COMMENT 'short URL for what URL/file',
  `redirections` int(11) DEFAULT NULL COMMENT 'redirect count',
  `httpcode` int(11) DEFAULT NULL COMMENT 'HTTP status code (20x, 30x, etc.)',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of file_redirection
-- ----------------------------
INSERT INTO `file_redirection` VALUES ('http://localhost/statusnet/index.php/url/1', '1', null, null, '2013-04-23 11:24:33');
INSERT INTO `file_redirection` VALUES ('http://localhost/statusnet/index.php/url/2', '2', null, null, '2013-04-23 11:24:35');
INSERT INTO `file_redirection` VALUES ('http://localhost/statusnet/index.php/url/3', '3', null, null, '2013-04-23 11:24:39');
INSERT INTO `file_redirection` VALUES ('http://localhost/statusnet/index.php/url/4', '4', null, null, '2013-04-23 11:24:42');
INSERT INTO `file_redirection` VALUES ('http://localhost/statusnet/index.php/url/5', '5', null, null, '2013-04-23 11:24:45');

-- ----------------------------
-- Table structure for `file_thumbnail`
-- ----------------------------
DROP TABLE IF EXISTS `file_thumbnail`;
CREATE TABLE `file_thumbnail` (
  `file_id` int(11) NOT NULL COMMENT 'thumbnail for what URL/file',
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'URL of thumbnail',
  `width` int(11) DEFAULT NULL COMMENT 'width of thumbnail',
  `height` int(11) DEFAULT NULL COMMENT 'height of thumbnail',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of file_thumbnail
-- ----------------------------

-- ----------------------------
-- Table structure for `file_to_post`
-- ----------------------------
DROP TABLE IF EXISTS `file_to_post`;
CREATE TABLE `file_to_post` (
  `file_id` int(11) NOT NULL COMMENT 'id of URL/file',
  `post_id` int(11) NOT NULL COMMENT 'id of the notice it belongs to',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`file_id`,`post_id`),
  KEY `post_id_idx` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of file_to_post
-- ----------------------------

-- ----------------------------
-- Table structure for `foreign_link`
-- ----------------------------
DROP TABLE IF EXISTS `foreign_link`;
CREATE TABLE `foreign_link` (
  `user_id` int(11) NOT NULL COMMENT 'link to user on this system, if exists',
  `foreign_id` bigint(20) NOT NULL COMMENT 'link to user on foreign service, if exists',
  `service` int(11) NOT NULL COMMENT 'foreign key to service',
  `credentials` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'authc credentials, typically a password',
  `noticesync` tinyint(4) DEFAULT '1' COMMENT 'notice synchronization, bit 1 = sync outgoing, bit 2 = sync incoming, bit 3 = filter local replies',
  `friendsync` tinyint(4) DEFAULT '2' COMMENT 'friend synchronization, bit 1 = sync outgoing, bit 2 = sync incoming',
  `profilesync` tinyint(4) DEFAULT '1' COMMENT 'profile synchronization, bit 1 = sync outgoing, bit 2 = sync incoming',
  `last_noticesync` datetime DEFAULT NULL COMMENT 'last time notices were imported',
  `last_friendsync` datetime DEFAULT NULL COMMENT 'last time friends were imported',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`user_id`,`foreign_id`,`service`),
  KEY `foreign_user_user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of foreign_link
-- ----------------------------

-- ----------------------------
-- Table structure for `foreign_service`
-- ----------------------------
DROP TABLE IF EXISTS `foreign_service`;
CREATE TABLE `foreign_service` (
  `id` int(11) NOT NULL COMMENT 'numeric key for service',
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'name of the service',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'description',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`id`),
  UNIQUE KEY `foreign_service_name_key` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of foreign_service
-- ----------------------------
INSERT INTO `foreign_service` VALUES ('1', 'Twitter', 'Twitter Micro-blogging service', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `foreign_service` VALUES ('2', 'Facebook', 'Facebook', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `foreign_service` VALUES ('3', 'FacebookConnect', 'Facebook Connect', '2012-12-12 02:32:43', '2012-12-12 02:32:43');

-- ----------------------------
-- Table structure for `foreign_subscription`
-- ----------------------------
DROP TABLE IF EXISTS `foreign_subscription`;
CREATE TABLE `foreign_subscription` (
  `service` int(11) NOT NULL COMMENT 'service where relationship happens',
  `subscriber` bigint(20) NOT NULL COMMENT 'subscriber on foreign service',
  `subscribed` bigint(20) NOT NULL COMMENT 'subscribed user',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  PRIMARY KEY (`service`,`subscriber`,`subscribed`),
  KEY `foreign_subscription_subscriber_idx` (`service`,`subscriber`),
  KEY `foreign_subscription_subscribed_idx` (`service`,`subscribed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of foreign_subscription
-- ----------------------------

-- ----------------------------
-- Table structure for `foreign_user`
-- ----------------------------
DROP TABLE IF EXISTS `foreign_user`;
CREATE TABLE `foreign_user` (
  `id` bigint(20) NOT NULL COMMENT 'unique numeric key on foreign service',
  `service` int(11) NOT NULL COMMENT 'foreign key to service',
  `uri` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'identifying URI',
  `nickname` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'nickname on foreign service',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`id`,`service`),
  UNIQUE KEY `foreign_user_uri_key` (`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of foreign_user
-- ----------------------------

-- ----------------------------
-- Table structure for `group_alias`
-- ----------------------------
DROP TABLE IF EXISTS `group_alias`;
CREATE TABLE `group_alias` (
  `alias` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'additional nickname for the group',
  `group_id` int(11) NOT NULL COMMENT 'group profile is blocked from',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date alias was created',
  PRIMARY KEY (`alias`),
  KEY `group_alias_group_id_idx` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of group_alias
-- ----------------------------

-- ----------------------------
-- Table structure for `group_block`
-- ----------------------------
DROP TABLE IF EXISTS `group_block`;
CREATE TABLE `group_block` (
  `group_id` int(11) NOT NULL COMMENT 'group profile is blocked from',
  `blocked` int(11) NOT NULL COMMENT 'profile that is blocked',
  `blocker` int(11) NOT NULL COMMENT 'user making the block',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date of blocking',
  PRIMARY KEY (`group_id`,`blocked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of group_block
-- ----------------------------

-- ----------------------------
-- Table structure for `group_inbox`
-- ----------------------------
DROP TABLE IF EXISTS `group_inbox`;
CREATE TABLE `group_inbox` (
  `group_id` int(11) NOT NULL COMMENT 'group receiving the message',
  `notice_id` int(11) NOT NULL COMMENT 'notice received',
  `created` datetime NOT NULL COMMENT 'date the notice was created',
  PRIMARY KEY (`group_id`,`notice_id`),
  KEY `group_inbox_created_idx` (`created`),
  KEY `group_inbox_notice_id_idx` (`notice_id`),
  KEY `group_inbox_group_id_created_notice_id_idx` (`group_id`,`created`,`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of group_inbox
-- ----------------------------

-- ----------------------------
-- Table structure for `group_join_queue`
-- ----------------------------
DROP TABLE IF EXISTS `group_join_queue`;
CREATE TABLE `group_join_queue` (
  `profile_id` int(11) NOT NULL COMMENT 'remote or local profile making the request',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT 'remote or local group to join, if any',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  PRIMARY KEY (`profile_id`,`group_id`),
  KEY `group_join_queue_profile_id_created_idx` (`profile_id`,`created`),
  KEY `group_join_queue_group_id_created_idx` (`group_id`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of group_join_queue
-- ----------------------------
INSERT INTO `group_join_queue` VALUES ('2', '2', '2013-01-06 12:54:49');

-- ----------------------------
-- Table structure for `group_member`
-- ----------------------------
DROP TABLE IF EXISTS `group_member`;
CREATE TABLE `group_member` (
  `group_id` int(11) NOT NULL COMMENT 'foreign key to user_group',
  `profile_id` int(11) NOT NULL COMMENT 'foreign key to profile table',
  `is_admin` tinyint(4) DEFAULT '0' COMMENT 'is this user an admin?',
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'universal identifier',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`group_id`,`profile_id`),
  UNIQUE KEY `group_member_uri_key` (`uri`),
  KEY `group_member_profile_id_idx` (`profile_id`),
  KEY `group_member_created_idx` (`created`),
  KEY `group_member_profile_id_created_idx` (`profile_id`,`created`),
  KEY `group_member_group_id_created_idx` (`group_id`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of group_member
-- ----------------------------
INSERT INTO `group_member` VALUES ('48', '1', '1', null, '2013-04-22 07:51:54', '2013-04-22 15:51:55');
INSERT INTO `group_member` VALUES ('48', '93', '0', null, '2013-04-22 07:58:50', '2013-04-22 15:58:50');
INSERT INTO `group_member` VALUES ('48', '94', '0', null, '2013-04-22 08:09:53', '2013-04-22 16:09:53');
INSERT INTO `group_member` VALUES ('48', '95', '0', 'tag:localhost,2013-04-22:statusnet:join:95:48:2013-04-22T16:32:35+08:00', '2013-04-22 08:32:35', '2013-04-22 16:32:35');
INSERT INTO `group_member` VALUES ('48', '96', '0', 'tag:localhost,2013-04-22:statusnet:join:96:48:2013-04-22T16:36:34+08:00', '2013-04-22 08:36:34', '2013-04-22 16:36:34');
INSERT INTO `group_member` VALUES ('49', '0', '0', null, '2013-04-22 08:02:33', '2013-04-22 16:02:33');
INSERT INTO `group_member` VALUES ('49', '1', '1', null, '2013-04-22 07:51:55', '2013-04-22 15:51:55');
INSERT INTO `group_member` VALUES ('49', '75', '0', null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `group_member` VALUES ('49', '76', '0', null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `group_member` VALUES ('49', '77', '0', null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `group_member` VALUES ('49', '78', '0', null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `group_member` VALUES ('49', '79', '0', null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `group_member` VALUES ('49', '80', '0', null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `group_member` VALUES ('49', '81', '0', null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `group_member` VALUES ('49', '82', '0', null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `group_member` VALUES ('49', '83', '0', null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `group_member` VALUES ('49', '84', '0', null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `group_member` VALUES ('49', '85', '0', null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `group_member` VALUES ('49', '86', '0', null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `group_member` VALUES ('49', '87', '0', null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `group_member` VALUES ('49', '88', '0', null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `group_member` VALUES ('49', '89', '0', null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `group_member` VALUES ('49', '90', '0', null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `group_member` VALUES ('49', '91', '0', null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `group_member` VALUES ('49', '92', '0', null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `group_member` VALUES ('49', '94', '0', null, '2013-04-22 08:06:03', '2013-04-22 16:06:03');
INSERT INTO `group_member` VALUES ('49', '95', '0', null, '2013-04-22 08:30:57', '2013-04-22 16:30:57');
INSERT INTO `group_member` VALUES ('49', '96', '0', null, '2013-04-22 08:35:54', '2013-04-22 16:35:54');
INSERT INTO `group_member` VALUES ('50', '1', '1', null, '2013-04-25 08:44:50', '2013-04-25 16:44:50');
INSERT INTO `group_member` VALUES ('50', '97', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '98', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '99', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '100', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '101', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '102', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '103', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '104', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '105', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '106', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '107', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '108', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '109', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '110', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '111', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '112', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '113', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '114', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '115', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '116', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '117', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '118', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '119', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '120', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '121', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '122', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '123', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '124', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '125', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '126', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '127', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '128', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '129', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '130', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '131', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '132', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '133', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '134', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '135', '0', null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `group_member` VALUES ('50', '136', '0', null, '2013-04-25 08:46:54', '2013-04-25 16:46:54');
INSERT INTO `group_member` VALUES ('50', '137', '0', null, '2013-04-25 08:46:54', '2013-04-25 16:46:54');
INSERT INTO `group_member` VALUES ('51', '1', '1', null, '2013-04-25 08:50:48', '2013-04-25 16:50:48');
INSERT INTO `group_member` VALUES ('51', '97', '0', 'tag:localhost,2013-04-25:statusnet:join:97:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '98', '0', 'tag:localhost,2013-04-25:statusnet:join:98:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '99', '0', 'tag:localhost,2013-04-25:statusnet:join:99:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '100', '0', 'tag:localhost,2013-04-25:statusnet:join:100:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '101', '0', 'tag:localhost,2013-04-25:statusnet:join:101:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '102', '0', 'tag:localhost,2013-04-25:statusnet:join:102:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '103', '0', 'tag:localhost,2013-04-25:statusnet:join:103:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '104', '0', 'tag:localhost,2013-04-25:statusnet:join:104:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '105', '0', 'tag:localhost,2013-04-25:statusnet:join:105:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '106', '0', 'tag:localhost,2013-04-25:statusnet:join:106:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '107', '0', 'tag:localhost,2013-04-25:statusnet:join:107:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '108', '0', 'tag:localhost,2013-04-25:statusnet:join:108:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '109', '0', 'tag:localhost,2013-04-25:statusnet:join:109:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '110', '0', 'tag:localhost,2013-04-25:statusnet:join:110:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '111', '0', 'tag:localhost,2013-04-25:statusnet:join:111:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '112', '0', 'tag:localhost,2013-04-25:statusnet:join:112:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '113', '0', 'tag:localhost,2013-04-25:statusnet:join:113:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '114', '0', 'tag:localhost,2013-04-25:statusnet:join:114:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '115', '0', 'tag:localhost,2013-04-25:statusnet:join:115:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '116', '0', 'tag:localhost,2013-04-25:statusnet:join:116:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '117', '0', 'tag:localhost,2013-04-25:statusnet:join:117:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '118', '0', 'tag:localhost,2013-04-25:statusnet:join:118:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '119', '0', 'tag:localhost,2013-04-25:statusnet:join:119:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '120', '0', 'tag:localhost,2013-04-25:statusnet:join:120:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '121', '0', 'tag:localhost,2013-04-25:statusnet:join:121:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '122', '0', 'tag:localhost,2013-04-25:statusnet:join:122:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '123', '0', 'tag:localhost,2013-04-25:statusnet:join:123:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '124', '0', 'tag:localhost,2013-04-25:statusnet:join:124:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '125', '0', 'tag:localhost,2013-04-25:statusnet:join:125:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '126', '0', 'tag:localhost,2013-04-25:statusnet:join:126:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '127', '0', 'tag:localhost,2013-04-25:statusnet:join:127:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '128', '0', 'tag:localhost,2013-04-25:statusnet:join:128:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '129', '0', 'tag:localhost,2013-04-25:statusnet:join:129:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '130', '0', 'tag:localhost,2013-04-25:statusnet:join:130:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '131', '0', 'tag:localhost,2013-04-25:statusnet:join:131:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '132', '0', 'tag:localhost,2013-04-25:statusnet:join:132:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '133', '0', 'tag:localhost,2013-04-25:statusnet:join:133:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '134', '0', 'tag:localhost,2013-04-25:statusnet:join:134:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '135', '0', 'tag:localhost,2013-04-25:statusnet:join:135:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '136', '0', 'tag:localhost,2013-04-25:statusnet:join:136:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');
INSERT INTO `group_member` VALUES ('51', '137', '0', 'tag:localhost,2013-04-25:statusnet:join:137:51:2013-04-25T16:51:09+08:00', '2013-04-25 08:51:09', '2013-04-25 16:51:09');

-- ----------------------------
-- Table structure for `happening`
-- ----------------------------
DROP TABLE IF EXISTS `happening`;
CREATE TABLE `happening` (
  `id` char(36) COLLATE utf8_bin NOT NULL COMMENT 'UUID',
  `uri` varchar(255) COLLATE utf8_bin NOT NULL,
  `profile_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `happening_uri_key` (`uri`),
  KEY `happening_created_idx` (`created`),
  KEY `happening_start_end_idx` (`start_time`,`end_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of happening
-- ----------------------------
INSERT INTO `happening` VALUES ('c59da7e5-ab4e-408c-b58a-9ff6da5a491d', 'http://www.songeast.com.cn/statusnet/index.php/event/c59da7e5-ab4e-408c-b58a-9ff6da5a491d', '1', '2013-02-01 21:30:00', '2013-02-01 21:30:00', '放假', '上海', null, 0xE887AAE794B1E6B4BBE58AA8, '2013-02-01 07:13:55');

-- ----------------------------
-- Table structure for `hubsub`
-- ----------------------------
DROP TABLE IF EXISTS `hubsub`;
CREATE TABLE `hubsub` (
  `hashkey` char(40) COLLATE utf8_bin NOT NULL,
  `topic` varchar(255) COLLATE utf8_bin NOT NULL,
  `callback` varchar(255) COLLATE utf8_bin NOT NULL,
  `secret` text COLLATE utf8_bin,
  `lease` int(11) DEFAULT NULL,
  `sub_start` datetime DEFAULT NULL,
  `sub_end` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`hashkey`),
  KEY `hubsub_topic_idx` (`topic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of hubsub
-- ----------------------------

-- ----------------------------
-- Table structure for `inbox`
-- ----------------------------
DROP TABLE IF EXISTS `inbox`;
CREATE TABLE `inbox` (
  `user_id` int(11) NOT NULL COMMENT 'user receiving the notice',
  `notice_ids` blob COMMENT 'packed list of notice ids',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of inbox
-- ----------------------------
INSERT INTO `inbox` VALUES ('1', 0x00000005000000040000000300000002000000010000043C0000043B0000043A000004390000042800000427000004260000042500000424000004230000042200000421000004200000041F0000041C0000041A000004190000041800000417000004160000041500000414000004130000041200000411000004100000040F0000040E0000040D0000040C0000040B0000040A000004090000040800000407000004060000040500000404000004030000040200000401000003FC000003FB000003FA000003F9000003F8000003F7000003F6000003F5000003F4000003F3000003F2000003F1000003F0000003EF000003EE000003ED000003EC000003EB000003EA000003E9000003E8000003E7000003E6000003E5000003E4000003E3000003E2000003E1000003E0000003DF000003DE000003DD000003DC000003DB000003DA000003D9000003D8000003D7000003D6000003D5000003D4000003D3000003D2000003D1000003D0000003CF000003CE000003CD000003CC000003CB000003CA000003C9000003C8000003C7000003C6000003C5000003C4000003C3000003C2000003C1000003C0000003BF000003BE000003BD000003BC000003BB000003BA000003B9000003B8000003B7000003B6000003B5000003B4000003B3000003B2000003B1000003B0000003AF000003AE000003AD000003AC000003AB000003AA000003A9000003A8000003A7000003A6000003A5000003A4000003A3000003A2000003A1000003A00000039F0000039E0000039D0000039C0000039B0000039A000003990000039800000397000003960000039500000394000003930000039200000391000003900000038F0000038E0000038D0000038C0000038B0000038A000003890000038800000387000003860000038500000384000003830000038200000381000003800000037F0000037E0000037D0000037C0000037B0000037A000003790000037800000377000003760000037500000374000003730000037200000371000003700000036F0000036E0000036D0000036C0000036B0000036A000003690000036800000367000003660000036500000364000003630000036200000361000003600000035F0000035E0000035D0000035C0000035B0000035A000003590000035800000357000003560000035500000354000003530000035200000351000003500000034F0000034E0000034D0000034C0000034B0000034A000003490000034800000347000003460000034500000344000003430000034200000341000003400000033F0000033E0000033D0000033C0000033B0000033A000003390000033800000337000003360000033500000334000003330000033200000331000003300000032F0000032E0000032D0000032C0000032B0000032A000003290000032800000327000003260000032500000324000003230000032200000321000003200000031F0000031E0000031D0000031C0000031B0000031A000003190000031800000317000003160000031500000314000003130000031200000311000003100000030F0000030E0000030D0000030C0000030B0000030A00000309000003080000030700000306000003050000030400000303000003020000030100000300000002FF000002FE000002FD000002FC000002FB000002FA000002F9000002F8000002F7000002F6000002F5000002F4000002F3000002F2000002F1000002F0000002EF000002EE000002ED000002EC000002EB000002EA000002E9000002E8000002E7000002E6000002E5000002E4000002E3000002E2000002E1000002E0000002DF000002DE000002DD000002DC000002DB000002DA000002D9000002D8000002D7000002D6000002D5000002D4000002D3000002D2000002D1000002D0000002CF000002CE000002CD000002CC000002CB000002CA000002C9000002C8000002C7000002C6000002C5000002C4000002C3000002C2000002C1000002C0000002BF000002BE000002BD000002BC000002BB000002BA000002B9000002B8000002B7000002B6000002B5000002B4000002B3000002B2000002B1000002B0000002AF000002AE000002AD000002AC000002AB000002AA000002A9000002A8000002A7000002A6000002A5000002A4000002A3000002A2000002A1000002A00000029F0000029E0000029D0000029C0000029B0000029A000002990000029800000297000002960000029500000294000002930000029200000291000002900000028F0000028E0000028D0000028C0000028B0000028A000002890000028800000287000002860000028500000284000002830000028200000281000002800000027F0000027E0000027D0000027C0000027B0000027A000002790000027800000277000002760000027500000274000002730000027200000271000002700000026F0000026E0000026D0000026C0000026B0000026A000002690000026800000267000002660000026500000264000002630000026200000261000002600000025F0000025E0000025D0000025C0000025B0000025A000002590000025800000257000002560000025500000254000002530000025200000251000002500000024F0000024E0000024D0000024C0000024B0000024A000002490000024800000247000002460000024500000244000002430000024200000241000002400000023F0000023E0000023D0000023C0000023B0000023A000002390000023800000237000002360000023500000234000002330000023200000231000002300000022F0000022E0000022D0000022C0000022B0000022A000002290000022800000227000002260000022500000224000002230000022200000221000002200000021F0000021E0000021D0000021C0000021B0000021A000002190000021800000217000002160000021500000214000002130000021200000211000002100000020F0000020E0000020D0000020C0000020B0000020A00000209000002080000020700000206000002050000020400000203000002020000020100000200000001FF000001FE000001FD000001FC000001FB000001FA000001F9000001F8000001F7000001F6000001F5000001F4000001F3000001F2000001F1000001F0000001EF000001EE000001ED000001EC000001EB000001EA000001E9000001E8000001E7000001E6000001E5000001E4000001E3000001E2000001E1000001E0000001DF000001DE000001DD000001DC000001DB000001DA000001D9000001D8000001D7000001D6000001D5000001D4000001D3000001D2000001C4000001C1000001C0000001BF000001BE000001BD000001BC000001BB000001BA000001B9000001B8000001B7000001B6000001B5000001B4000001B3000001B2000001B1000001B0000001AF000001AE000001AD000001AC000001AB000001AA000001A9000001A8000001A7000001A6000001A5000001A4000001A3000001A2000001A1000001A00000019F0000019E0000019D0000019C0000019B0000019A000001990000019800000197000001960000019500000194000001930000019200000191000001900000018F0000018E0000018D0000018C0000018B0000018A000001890000018800000187000001860000018500000184000001830000018200000181000001800000017F0000017E0000017D0000017C0000017B0000017A000001790000017800000177000001760000017500000174000001730000017200000171000001700000016F0000016E0000016D0000016C0000016B0000016A000001690000016800000167000001660000016500000164000001630000016200000161000001600000015F0000015E0000015D0000015C0000015B0000015A000001590000015800000157000001560000015500000154000001530000015200000151000001500000014F0000014E0000014D0000014C0000014A00000149000001460000014500000144000001430000014200000141000001400000013F0000013E0000013D0000013C0000013B0000013A000001390000013800000137000001360000013500000134000001330000013200000131000001300000012F0000012E0000012D0000012C0000012B0000012A000001290000012800000127000001260000012500000124000001230000012200000121000001200000011F0000011E0000011D0000011C0000011B0000011A0000011800000117000001160000011500000114000001130000011200000111000001100000010F0000010E0000010D0000010C0000010B0000010A00000109000001080000010700000106000001050000010400000103000001020000010100000100000000FF000000FE000000FD000000FC000000FB000000FA000000F9000000F8000000F7000000F6000000F5000000F4000000F3000000F2000000F1000000F0000000EF000000EE000000ED000000EC000000EB000000EA000000E9000000E8000000E7000000E6000000E5000000E4000000E3000000E2000000E1000000E0000000DF000000DE000000DD000000DC000000DB000000DA000000D9000000D8000000D7000000D6000000D5000000D4000000D3000000D2000000D1000000D0000000CF000000CE000000CD000000CC000000CB000000CA000000C9000000C8000000C7000000C6000000C5000000C4000000C3000000C2000000C1000000C0000000BF000000BE000000BD000000BC000000BB000000BA000000B9000000B8000000B7000000B6000000B5000000B4000000B3000000B2000000B1000000B0000000AF000000AE000000AD000000AC000000AB000000AA000000A9000000A8000000A7000000A6000000A5000000A4000000A3000000A2000000A1000000A00000009F0000009E0000009D0000009C0000009B0000009A000000990000009800000097000000960000009500000094000000930000009200000091000000900000008F0000008E0000008D0000008C0000008B0000008A000000890000008800000087000000860000008500000084000000830000008200000081000000800000007F0000007E0000007D0000007C0000007B0000007A000000790000007800000077000000760000007500000074000000730000007200000071000000700000006F0000006E0000006D0000006C0000006B0000006A000000690000006800000067000000660000006500000064000000630000006200000061000000600000005F0000005E0000005D0000005C0000005B0000005A000000590000005800000057000000560000005500000054000000530000005200000051000000500000004F0000004E0000004D0000004C0000004B0000004A000000490000004800000047000000460000004500000044000000430000004200000041000000400000003F0000003E0000003D0000003C0000003B0000003A000000390000003800000037000000360000003500000034000000330000003200000031000000300000002F0000002E0000002D0000002C0000002B0000002A00000029000000280000002600000025);
INSERT INTO `inbox` VALUES ('34', 0x0000043A00000439);
INSERT INTO `inbox` VALUES ('35', 0x00000439);
INSERT INTO `inbox` VALUES ('36', 0x00000439);
INSERT INTO `inbox` VALUES ('37', 0x00000439);
INSERT INTO `inbox` VALUES ('38', 0x00000439);
INSERT INTO `inbox` VALUES ('39', 0x00000439);
INSERT INTO `inbox` VALUES ('40', 0x00000439);
INSERT INTO `inbox` VALUES ('41', 0x00000439);
INSERT INTO `inbox` VALUES ('42', 0x00000439);
INSERT INTO `inbox` VALUES ('43', 0x00000439);
INSERT INTO `inbox` VALUES ('44', 0x00000439);
INSERT INTO `inbox` VALUES ('45', 0x00000439);
INSERT INTO `inbox` VALUES ('46', 0x00000439);
INSERT INTO `inbox` VALUES ('47', 0x00000439);
INSERT INTO `inbox` VALUES ('48', 0x00000439);
INSERT INTO `inbox` VALUES ('49', 0x00000439);
INSERT INTO `inbox` VALUES ('50', 0x00000439);
INSERT INTO `inbox` VALUES ('51', '');
INSERT INTO `inbox` VALUES ('58', 0x0000042900000428);
INSERT INTO `inbox` VALUES ('59', 0x0000042A00000428);
INSERT INTO `inbox` VALUES ('60', 0x0000043800000437000004360000043500000434000004330000043200000431000004300000042F0000042E0000042D0000042C0000042B0000042A0000042900000428);
INSERT INTO `inbox` VALUES ('61', 0x0000042B00000428);
INSERT INTO `inbox` VALUES ('62', 0x0000042C00000428);
INSERT INTO `inbox` VALUES ('63', 0x0000042D00000428);
INSERT INTO `inbox` VALUES ('64', 0x0000042E00000428);
INSERT INTO `inbox` VALUES ('65', 0x0000042F00000428);
INSERT INTO `inbox` VALUES ('66', 0x0000043000000428);
INSERT INTO `inbox` VALUES ('67', 0x0000043100000428);
INSERT INTO `inbox` VALUES ('68', 0x0000043200000428);
INSERT INTO `inbox` VALUES ('69', 0x0000043300000428);
INSERT INTO `inbox` VALUES ('70', 0x0000043400000428);
INSERT INTO `inbox` VALUES ('71', 0x0000043500000428);
INSERT INTO `inbox` VALUES ('72', 0x0000043600000428);
INSERT INTO `inbox` VALUES ('73', 0x0000043700000428);
INSERT INTO `inbox` VALUES ('74', 0x0000043800000428);
INSERT INTO `inbox` VALUES ('75', '');
INSERT INTO `inbox` VALUES ('76', '');
INSERT INTO `inbox` VALUES ('77', '');
INSERT INTO `inbox` VALUES ('78', '');
INSERT INTO `inbox` VALUES ('79', '');
INSERT INTO `inbox` VALUES ('80', '');
INSERT INTO `inbox` VALUES ('81', '');
INSERT INTO `inbox` VALUES ('82', '');
INSERT INTO `inbox` VALUES ('83', '');
INSERT INTO `inbox` VALUES ('84', '');
INSERT INTO `inbox` VALUES ('85', '');
INSERT INTO `inbox` VALUES ('86', '');
INSERT INTO `inbox` VALUES ('87', '');
INSERT INTO `inbox` VALUES ('88', '');
INSERT INTO `inbox` VALUES ('89', '');
INSERT INTO `inbox` VALUES ('90', '');
INSERT INTO `inbox` VALUES ('91', '');
INSERT INTO `inbox` VALUES ('92', '');
INSERT INTO `inbox` VALUES ('93', 0x00000001);
INSERT INTO `inbox` VALUES ('94', 0x00000002);
INSERT INTO `inbox` VALUES ('95', 0x0000000500000003);
INSERT INTO `inbox` VALUES ('96', 0x00000004);
INSERT INTO `inbox` VALUES ('97', '');
INSERT INTO `inbox` VALUES ('98', '');
INSERT INTO `inbox` VALUES ('99', '');
INSERT INTO `inbox` VALUES ('100', '');
INSERT INTO `inbox` VALUES ('101', '');
INSERT INTO `inbox` VALUES ('102', '');
INSERT INTO `inbox` VALUES ('103', '');
INSERT INTO `inbox` VALUES ('104', '');
INSERT INTO `inbox` VALUES ('105', '');
INSERT INTO `inbox` VALUES ('106', '');
INSERT INTO `inbox` VALUES ('107', '');
INSERT INTO `inbox` VALUES ('108', '');
INSERT INTO `inbox` VALUES ('109', '');
INSERT INTO `inbox` VALUES ('110', '');
INSERT INTO `inbox` VALUES ('111', '');
INSERT INTO `inbox` VALUES ('112', '');
INSERT INTO `inbox` VALUES ('113', '');
INSERT INTO `inbox` VALUES ('114', '');
INSERT INTO `inbox` VALUES ('115', '');
INSERT INTO `inbox` VALUES ('116', '');
INSERT INTO `inbox` VALUES ('117', '');
INSERT INTO `inbox` VALUES ('118', '');
INSERT INTO `inbox` VALUES ('119', '');
INSERT INTO `inbox` VALUES ('120', '');
INSERT INTO `inbox` VALUES ('121', '');
INSERT INTO `inbox` VALUES ('122', '');
INSERT INTO `inbox` VALUES ('123', '');
INSERT INTO `inbox` VALUES ('124', '');
INSERT INTO `inbox` VALUES ('125', '');
INSERT INTO `inbox` VALUES ('126', '');
INSERT INTO `inbox` VALUES ('127', '');
INSERT INTO `inbox` VALUES ('128', '');
INSERT INTO `inbox` VALUES ('129', '');
INSERT INTO `inbox` VALUES ('130', '');
INSERT INTO `inbox` VALUES ('131', '');
INSERT INTO `inbox` VALUES ('132', '');
INSERT INTO `inbox` VALUES ('133', '');
INSERT INTO `inbox` VALUES ('134', '');
INSERT INTO `inbox` VALUES ('135', '');
INSERT INTO `inbox` VALUES ('136', '');
INSERT INTO `inbox` VALUES ('137', '');

-- ----------------------------
-- Table structure for `invitation`
-- ----------------------------
DROP TABLE IF EXISTS `invitation`;
CREATE TABLE `invitation` (
  `code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'random code for an invitation',
  `user_id` int(11) NOT NULL COMMENT 'who sent the invitation',
  `address` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'invitation sent to',
  `address_type` varchar(8) COLLATE utf8_bin NOT NULL COMMENT 'address type ("email", "xmpp", "sms")',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `registered_user_id` int(11) DEFAULT NULL COMMENT 'if the invitation is converted, who the new user is',
  PRIMARY KEY (`code`),
  KEY `invitation_address_idx` (`address`,`address_type`),
  KEY `invitation_user_id_idx` (`user_id`),
  KEY `invitation_registered_user_id_idx` (`registered_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of invitation
-- ----------------------------

-- ----------------------------
-- Table structure for `local_group`
-- ----------------------------
DROP TABLE IF EXISTS `local_group`;
CREATE TABLE `local_group` (
  `group_id` int(11) NOT NULL COMMENT 'group represented',
  `nickname` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'group represented',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `local_group_nickname_key` (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of local_group
-- ----------------------------
INSERT INTO `local_group` VALUES ('48', 'y201303', '2013-04-22 07:51:55', '2013-04-22 15:51:55');
INSERT INTO `local_group` VALUES ('49', 'y201304', '2013-04-22 07:51:55', '2013-04-22 15:51:55');
INSERT INTO `local_group` VALUES ('50', 'y201305', '2013-04-25 08:44:50', '2013-04-25 16:44:50');
INSERT INTO `local_group` VALUES ('51', 'y201306', '2013-04-25 08:50:48', '2013-04-25 16:50:48');

-- ----------------------------
-- Table structure for `location_namespace`
-- ----------------------------
DROP TABLE IF EXISTS `location_namespace`;
CREATE TABLE `location_namespace` (
  `id` int(11) NOT NULL COMMENT 'identity for this namespace',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'description of the namespace',
  `created` datetime NOT NULL COMMENT 'date the record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of location_namespace
-- ----------------------------

-- ----------------------------
-- Table structure for `login_token`
-- ----------------------------
DROP TABLE IF EXISTS `login_token`;
CREATE TABLE `login_token` (
  `user_id` int(11) NOT NULL COMMENT 'user owning this token',
  `token` char(32) COLLATE utf8_bin NOT NULL COMMENT 'token useable for logging in',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of login_token
-- ----------------------------

-- ----------------------------
-- Table structure for `magicsig`
-- ----------------------------
DROP TABLE IF EXISTS `magicsig`;
CREATE TABLE `magicsig` (
  `user_id` int(11) NOT NULL,
  `keypair` text COLLATE utf8_bin NOT NULL,
  `alg` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of magicsig
-- ----------------------------

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique identifier',
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'universally unique identifier',
  `from_profile` int(11) NOT NULL COMMENT 'who the message is from',
  `to_profile` int(11) NOT NULL COMMENT 'who the message is to',
  `cycleid` int(11) NOT NULL COMMENT 'which cycle the message is to',
  `content` text COLLATE utf8_bin COMMENT 'message content',
  `rendered` text COLLATE utf8_bin COMMENT 'HTML version of the content',
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'URL of any attachment (image, video, bookmark, whatever)',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  `source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'source of comment, like "web", "im", or "clientname"',
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_uri_key` (`uri`),
  KEY `message_from_idx` (`from_profile`),
  KEY `message_to_idx` (`to_profile`),
  KEY `message_created_idx` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', 'http://localhost/statusnet/index.php/message/1', '1', '95', '0', 0xE998BFE696AFE5A4A7E88B8FE68993, 0xE998BFE696AFE5A4A7E88B8FE68993, null, '2013-04-23 03:25:39', '2013-04-23 11:25:39', 'web');
INSERT INTO `message` VALUES ('2', 'http://localhost/statusnet/index.php/message/2', '95', '1', '0', 0x38343635343634, 0x38343635343634, null, '2013-04-23 03:40:37', '2013-04-23 11:40:37', 'web');

-- ----------------------------
-- Table structure for `nonce`
-- ----------------------------
DROP TABLE IF EXISTS `nonce`;
CREATE TABLE `nonce` (
  `consumer_key` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'unique identifier, root URL',
  `tok` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'buggy old value, ignored',
  `nonce` char(32) COLLATE utf8_bin NOT NULL COMMENT 'nonce',
  `ts` datetime NOT NULL COMMENT 'timestamp sent',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`consumer_key`,`ts`,`nonce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of nonce
-- ----------------------------

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique identifier',
  `profile_id` int(11) NOT NULL COMMENT 'who made the update',
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'universally unique identifier, usually a tag URI',
  `content` text CHARACTER SET utf8 COMMENT 'update content',
  `rendered` text COLLATE utf8_bin COMMENT 'HTML version of the content',
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'URL of any attachment (image, video, bookmark, whatever)',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  `reply_to` int(11) DEFAULT NULL COMMENT 'notice replied to (usually a guess)',
  `is_local` tinyint(4) DEFAULT '0' COMMENT 'notice was generated by a user',
  `source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'source of comment, like "web", "im", or "clientname"',
  `conversation` int(11) DEFAULT NULL COMMENT 'id of root notice in this conversation',
  `lat` decimal(10,7) DEFAULT NULL COMMENT 'latitude',
  `lon` decimal(10,7) DEFAULT NULL COMMENT 'longitude',
  `location_id` int(11) DEFAULT NULL COMMENT 'location id if possible',
  `location_ns` int(11) DEFAULT NULL COMMENT 'namespace for location',
  `repeat_of` int(11) DEFAULT NULL COMMENT 'notice this is a repeat of',
  `object_type` varchar(255) COLLATE utf8_bin DEFAULT 'http://activitystrea.ms/schema/1.0/note' COMMENT 'URI representing activity streams object type',
  `verb` varchar(255) COLLATE utf8_bin DEFAULT 'http://activitystrea.ms/schema/1.0/post' COMMENT 'URI representing activity streams verb',
  `scope` int(11) DEFAULT NULL COMMENT 'bit map for distribution scope; 0 = everywhere; 1 = this server only; 2 = addressees; 4 = followers; null = default',
  PRIMARY KEY (`id`),
  UNIQUE KEY `notice_uri_key` (`uri`),
  KEY `notice_created_id_is_local_idx` (`created`,`id`,`is_local`),
  KEY `notice_profile_id_idx` (`profile_id`,`created`,`id`),
  KEY `notice_repeat_of_created_id_idx` (`repeat_of`,`created`,`id`),
  KEY `notice_conversation_created_id_idx` (`conversation`,`created`,`id`),
  KEY `notice_replyto_idx` (`reply_to`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '1', 'tag:localhost,2013-04-23:statusnet:follow:1:93:2013-04-23T11:24:25+08:00', '天天的哥 (http://localhost/statusnet/index.php/url/1) started following 杨帆 (http://localhost/statusnet/index.php/url/2).', 0x3C6120687265663D22687474703A2F2F6C6F63616C686F73742F7374617475736E65742F696E6465782E7068702F61646D696E223EE5A4A9E5A4A9E79A84E593A53C2F613E207374617274656420666F6C6C6F77696E67203C6120687265663D22687474703A2F2F6C6F63616C686F73742F7374617475736E65742F696E6465782E7068702F79616E6766616E79223EE69DA8E5B8863C2F613E2E, null, '2013-04-23 03:24:35', '2013-04-23 11:24:35', null, '1', 'activity', '1', null, null, null, null, null, 'http://activitystrea.ms/schema/1.0/person', 'http://activitystrea.ms/schema/1.0/follow', '1');
INSERT INTO `notice` VALUES ('2', '1', 'tag:localhost,2013-04-23:statusnet:follow:1:94:2013-04-23T11:24:37+08:00', '天天的哥 (http://localhost/statusnet/index.php/url/1) started following 杨帆 (http://localhost/statusnet/index.php/url/3).', 0x3C6120687265663D22687474703A2F2F6C6F63616C686F73742F7374617475736E65742F696E6465782E7068702F61646D696E223EE5A4A9E5A4A9E79A84E593A53C2F613E207374617274656420666F6C6C6F77696E67203C6120687265663D22687474703A2F2F6C6F63616C686F73742F7374617475736E65742F696E6465782E7068702F79616E6766616E7966223EE69DA8E5B8863C2F613E2E, null, '2013-04-23 03:24:39', '2013-04-23 11:24:39', null, '1', 'activity', '2', null, null, null, null, null, 'http://activitystrea.ms/schema/1.0/person', 'http://activitystrea.ms/schema/1.0/follow', '1');
INSERT INTO `notice` VALUES ('3', '1', 'tag:localhost,2013-04-23:statusnet:follow:1:95:2013-04-23T11:24:40+08:00', '天天的哥 (http://localhost/statusnet/index.php/url/1) started following 刘亚斌 (http://localhost/statusnet/index.php/url/4).', 0x3C6120687265663D22687474703A2F2F6C6F63616C686F73742F7374617475736E65742F696E6465782E7068702F61646D696E223EE5A4A9E5A4A9E79A84E593A53C2F613E207374617274656420666F6C6C6F77696E67203C6120687265663D22687474703A2F2F6C6F63616C686F73742F7374617475736E65742F696E6465782E7068702F6C7962223EE58898E4BA9AE6968C3C2F613E2E, null, '2013-04-23 03:24:42', '2013-04-23 11:24:42', null, '1', 'activity', '3', null, null, null, null, null, 'http://activitystrea.ms/schema/1.0/person', 'http://activitystrea.ms/schema/1.0/follow', '1');
INSERT INTO `notice` VALUES ('4', '1', 'tag:localhost,2013-04-23:statusnet:follow:1:96:2013-04-23T11:24:43+08:00', '天天的哥 (http://localhost/statusnet/index.php/url/1) started following 帷幕 (http://localhost/statusnet/index.php/url/5).', 0x3C6120687265663D22687474703A2F2F6C6F63616C686F73742F7374617475736E65742F696E6465782E7068702F61646D696E223EE5A4A9E5A4A9E79A84E593A53C2F613E207374617274656420666F6C6C6F77696E67203C6120687265663D22687474703A2F2F6C6F63616C686F73742F7374617475736E65742F696E6465782E7068702F6B796C65223EE5B8B7E5B9953C2F613E2E, null, '2013-04-23 03:24:45', '2013-04-23 11:24:45', null, '1', 'activity', '4', null, null, null, null, null, 'http://activitystrea.ms/schema/1.0/person', 'http://activitystrea.ms/schema/1.0/follow', '1');
INSERT INTO `notice` VALUES ('5', '95', 'tag:localhost,2013-04-23:statusnet:follow:95:1:2013-04-23T03:25:24+00:00', '刘亚斌 (http://localhost/statusnet/index.php/url/4) started following 天天的哥 (http://localhost/statusnet/index.php/url/1).', 0x3C6120687265663D22687474703A2F2F6C6F63616C686F73742F7374617475736E65742F696E6465782E7068702F6C7962223EE58898E4BA9AE6968C3C2F613E207374617274656420666F6C6C6F77696E67203C6120687265663D22687474703A2F2F6C6F63616C686F73742F7374617475736E65742F696E6465782E7068702F61646D696E223EE5A4A9E5A4A9E79A84E593A53C2F613E2E, null, '2013-04-23 03:25:25', '2013-04-23 11:25:25', null, '1', 'activity', '5', null, null, null, null, null, 'http://activitystrea.ms/schema/1.0/person', 'http://activitystrea.ms/schema/1.0/follow', '1');

-- ----------------------------
-- Table structure for `notice_source`
-- ----------------------------
DROP TABLE IF EXISTS `notice_source`;
CREATE TABLE `notice_source` (
  `code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'source code',
  `name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'name of the source',
  `url` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'url to link to',
  `notice_id` int(11) NOT NULL COMMENT 'date this record was created',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of notice_source
-- ----------------------------
INSERT INTO `notice_source` VALUES ('Afficheur', 'Afficheur', 'http://afficheur.sourceforge.jp/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('AgentSolo.com', 'AgentSolo.com', 'http://www.agentsolo.com/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('DarterosStatus', 'Darteros Status', 'http://www.darteros.com/doc/Darteros_Status', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('Do', 'Gnome Do', 'http://do.davebsd.com/wiki/index.php?title=Microblog_Plugin', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('Facebook', 'Facebook', 'http://apps.facebook.com/identica/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('Gwibber', 'Gwibber', 'http://launchpad.net/gwibber', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('HelloTxt', 'HelloTxt', 'http://hellotxt.com/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('IdentiCurse', 'IdentiCurse', 'http://identicurse.net/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('IdentiFox', 'IdentiFox', 'http://www.bitbucket.org/uncryptic/identifox/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('Jiminy', 'Jiminy', 'http://code.google.com/p/jiminy/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('LaTwit', 'LaTwit', 'http://latwit.mac65.com/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('LiveTweeter', 'LiveTweeter', 'http://addons.songbirdnest.com/addon/1204', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('Mobidentica', 'Mobidentica', 'http://www.substanceofcode.com/software/mobidentica/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('Pikchur', 'Pikchur', 'http://www.pikchur.com/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('Ping.fm', 'Ping.fm', 'http://ping.fm/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('StatusNet Android', 'Android', 'http://status.net/android', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('StatusNet Blackberry', 'Blackberry', 'http://status.net/blackberry', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('StatusNet Desktop', 'StatusNet Desktop', 'http://status.net/desktop', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('StatusNet Mobile', 'StatusNet Mobile', 'http://status.net/mobile', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('StatusNet iPhone', 'iPhone', 'http://status.net/iphone', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('TweetDeck', 'TweetDeck', 'http://www.tweetdeck.com/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('Twidge', 'Twidge', 'http://software.complete.org/twidge', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('Updating.Me', 'Updating.Me', 'http://updating.me/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('adium', 'Adium', 'http://www.adiumx.com/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('anyio', 'Any.IO', 'http://any.io/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('betwittered', 'BeTwittered', 'http://www.32hours.com/betwitteredinfo/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('bti', 'bti', 'http://gregkh.github.com/bti/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('choqok', 'Choqok', 'http://choqok.gnufolks.org/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('cliqset', 'Cliqset', 'http://www.cliqset.com/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('deskbar', 'Deskbar-Applet', 'http://www.gnome.org/projects/deskbar-applet/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('drupal', 'Drupal', 'http://drupal.org/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('eventbox', 'EventBox', 'http://thecosmicmachine.com/eventbox/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('feed2omb', 'feed2omb', 'http://projects.ciarang.com/p/feed2omb/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('gNewBook', 'gNewBook', 'http://www.gnewbook.org/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('get2gnow', 'get2gnow', 'http://uberchicgeekchick.com/?projects=get2gnow', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('gravity', 'Gravity', 'http://mobileways.de/gravity', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('identica-mode', 'Emacs Identica-mode', 'http://nongnu.org/identica-mode/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('identicatools', 'Laconica Tools', 'http://bitbucketlabs.net/laconica-tools/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('identichat', 'identichat', 'http://identichat.prosody.im/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('identitwitch', 'IdentiTwitch', 'http://richfish.org/identitwitch/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('livetweeter', 'livetweeter', 'http://addons.songbirdnest.com/addon/1204', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('maisha', 'Maisha', 'http://maisha.grango.org/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('mbpidgin', 'mbpidgin', 'http://code.google.com/p/microblog-purple/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('moconica', 'Moconica', 'http://moconica.com/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('mustard', 'mustard', 'http://mustard.macno.org', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('nambu', 'Nambu', 'http://www.nambu.com/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('peoplebrowsr', 'PeopleBrowsr', 'http://www.peoplebrowsr.com/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('pingvine', 'PingVine', 'http://pingvine.com/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('pocketwit', 'PockeTwit', 'http://code.google.com/p/pocketwit/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('posty', 'Posty', 'http://spreadingfunkyness.com/posty/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('qtwitter', 'qTwitter', 'http://qtwitter.ayoy.net/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('qwit', 'Qwit', 'http://code.google.com/p/qwit/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('royalewithcheese', 'Royale With Cheese', 'http://p.hellyeah.org/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('rss.me', 'rss.me', 'http://rss.me/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('rssdent', 'rssdent', 'http://github.com/zcopley/rssdent/tree/master', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('rygh.no', 'rygh.no', 'http://rygh.no/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('ryghsms', 'ryghsms', 'http://sms.rygh.no/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('smob', 'SMOB', 'http://smob.sioc-project.org/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('socialoomphBfD4pMqz31', 'SocialOomph', 'http://www.socialoomph.com/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('spaz', 'Spaz', 'http://funkatron.com/spaz', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('tarpipe', 'tarpipe', 'http://tarpipe.com/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('tjunar', 'Tjunar', 'http://nederflash.nl/boek/titels/tjunar-air', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('tr.im', 'tr.im', 'http://tr.im/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('triklepost', 'Tricklepost', 'http://github.com/zcopley/tricklepost/tree/master', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('tweenky', 'Tweenky', 'http://beta.tweenky.com/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('twhirl', 'Twhirl', 'http://www.twhirl.org/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('twibble', 'twibble', 'http://www.twibble.de/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('twidge', 'Twidge', 'http://software.complete.org/twidge', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('twidroid', 'twidroid', 'http://www.twidroid.com/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('twittelator', 'Twittelator', 'http://www.stone.com/iPhone/Twittelator/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('twitter', 'Twitter', 'http://twitter.com/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('twitterfeed', 'twitterfeed', 'http://twitterfeed.com/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('twitterphoto', 'TwitterPhoto', 'http://richfish.org/twitterphoto/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('twitterpm', 'Net::Twitter', 'http://search.cpan.org/dist/Net-Twitter/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('twittertools', 'Twitter Tools', 'http://wordpress.org/extend/plugins/twitter-tools/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('twitux', 'Twitux', 'http://live.gnome.org/DanielMorales/Twitux', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('twitvim', 'TwitVim', 'http://vim.sourceforge.net/scripts/script.php?script_id=2204', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('urfastr', 'urfastr', 'http://urfastr.net/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `notice_source` VALUES ('yatca', 'Yatca', 'http://www.yatca.com/', '0', '2012-12-12 02:32:43', '2012-12-12 02:32:43');

-- ----------------------------
-- Table structure for `notice_tag`
-- ----------------------------
DROP TABLE IF EXISTS `notice_tag`;
CREATE TABLE `notice_tag` (
  `tag` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'hash tag associated with this notice',
  `notice_id` int(11) NOT NULL COMMENT 'notice tagged',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  PRIMARY KEY (`tag`,`notice_id`),
  KEY `notice_tag_created_idx` (`created`),
  KEY `notice_tag_notice_id_idx` (`notice_id`),
  KEY `notice_tag_tag_created_notice_id_idx` (`tag`,`created`,`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of notice_tag
-- ----------------------------
INSERT INTO `notice_tag` VALUES ('微博', '204', '2013-01-29 02:57:59');
INSERT INTO `notice_tag` VALUES ('poll', '522', '2013-02-01 07:14:46');
INSERT INTO `notice_tag` VALUES ('知道', '524', '2013-02-01 07:15:30');

-- ----------------------------
-- Table structure for `oauth_application`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_application`;
CREATE TABLE `oauth_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique identifier',
  `owner` int(11) NOT NULL COMMENT 'owner of the application',
  `consumer_key` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'application consumer key',
  `name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'name of the application',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'description of the application',
  `icon` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'application icon',
  `source_url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'application homepage - used for source link',
  `organization` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'name of the organization running the application',
  `homepage` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'homepage for the organization',
  `callback_url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'url to redirect to after authentication',
  `type` tinyint(4) DEFAULT '0' COMMENT 'type of app, 1 = browser, 2 = desktop',
  `access_type` tinyint(4) DEFAULT '0' COMMENT 'default access type, bit 1 = read, bit 2 = write',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_application_name_key` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of oauth_application
-- ----------------------------

-- ----------------------------
-- Table structure for `oauth_application_user`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_application_user`;
CREATE TABLE `oauth_application_user` (
  `profile_id` int(11) NOT NULL COMMENT 'user of the application',
  `application_id` int(11) NOT NULL COMMENT 'id of the application',
  `access_type` tinyint(4) DEFAULT '0' COMMENT 'access type, bit 1 = read, bit 2 = write',
  `token` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'request or access token',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`profile_id`,`application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of oauth_application_user
-- ----------------------------

-- ----------------------------
-- Table structure for `oauth_token_association`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_token_association`;
CREATE TABLE `oauth_token_association` (
  `profile_id` int(11) NOT NULL COMMENT 'associated user',
  `application_id` int(11) NOT NULL COMMENT 'the application',
  `token` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'token used for this association',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`profile_id`,`application_id`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of oauth_token_association
-- ----------------------------

-- ----------------------------
-- Table structure for `oid_associations`
-- ----------------------------
DROP TABLE IF EXISTS `oid_associations`;
CREATE TABLE `oid_associations` (
  `server_url` blob NOT NULL,
  `handle` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `secret` blob,
  `issued` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `assoc_type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`server_url`(255),`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of oid_associations
-- ----------------------------

-- ----------------------------
-- Table structure for `oid_nonces`
-- ----------------------------
DROP TABLE IF EXISTS `oid_nonces`;
CREATE TABLE `oid_nonces` (
  `server_url` varchar(2047) COLLATE utf8_bin DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `salt` char(40) COLLATE utf8_bin DEFAULT NULL,
  UNIQUE KEY `oid_nonces_server_url_timestamp_salt_key` (`server_url`(255),`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of oid_nonces
-- ----------------------------

-- ----------------------------
-- Table structure for `old_school_prefs`
-- ----------------------------
DROP TABLE IF EXISTS `old_school_prefs`;
CREATE TABLE `old_school_prefs` (
  `user_id` int(11) NOT NULL COMMENT 'user who has the preference',
  `stream_mode_only` tinyint(4) DEFAULT '1' COMMENT 'No conversation streams',
  `conversation_tree` tinyint(4) DEFAULT '1' COMMENT 'Hierarchical tree view for conversations',
  `stream_nicknames` tinyint(4) DEFAULT '1' COMMENT 'Show nicknames for authors and addressees in streams',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of old_school_prefs
-- ----------------------------

-- ----------------------------
-- Table structure for `ostatus_profile`
-- ----------------------------
DROP TABLE IF EXISTS `ostatus_profile`;
CREATE TABLE `ostatus_profile` (
  `uri` varchar(255) COLLATE utf8_bin NOT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `peopletag_id` int(11) DEFAULT NULL,
  `feeduri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `salmonuri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `avatar` text COLLATE utf8_bin,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`uri`),
  UNIQUE KEY `ostatus_profile_profile_id_idx` (`profile_id`),
  UNIQUE KEY `ostatus_profile_group_id_idx` (`group_id`),
  UNIQUE KEY `ostatus_profile_peopletag_id_idx` (`peopletag_id`),
  UNIQUE KEY `ostatus_profile_feeduri_idx` (`feeduri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ostatus_profile
-- ----------------------------

-- ----------------------------
-- Table structure for `ostatus_source`
-- ----------------------------
DROP TABLE IF EXISTS `ostatus_source`;
CREATE TABLE `ostatus_source` (
  `notice_id` int(11) NOT NULL,
  `profile_uri` varchar(255) COLLATE utf8_bin NOT NULL,
  `method` enum('push','salmon') COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ostatus_source
-- ----------------------------

-- ----------------------------
-- Table structure for `poll`
-- ----------------------------
DROP TABLE IF EXISTS `poll`;
CREATE TABLE `poll` (
  `id` char(36) COLLATE utf8_bin NOT NULL COMMENT 'UUID',
  `uri` varchar(255) COLLATE utf8_bin NOT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `question` text COLLATE utf8_bin,
  `options` text COLLATE utf8_bin,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `poll_uri_key` (`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of poll
-- ----------------------------
INSERT INTO `poll` VALUES ('7438fcdd-2ec1-484b-8684-edfcb6450bef', 'http://localhost/statusnet/index.php/main/poll/7438fcdd-2ec1-484b-8684-edfcb6450bef', '1', 0xE4BB8AE5A4A9E4BC9AE4B88BE99BA8E59097EFBC9F, 0xE4BC9A0AE4B88DE4BC9A0AE4B88DE79FA5E981930AE4BDA0E78C9C0AE69C89E99BAA, '2013-02-01 07:14:38');

-- ----------------------------
-- Table structure for `poll_response`
-- ----------------------------
DROP TABLE IF EXISTS `poll_response`;
CREATE TABLE `poll_response` (
  `id` char(36) COLLATE utf8_bin NOT NULL COMMENT 'UUID of the response',
  `uri` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'UUID to the response notice',
  `poll_id` char(36) COLLATE utf8_bin NOT NULL COMMENT 'UUID of poll being responded to',
  `profile_id` int(11) DEFAULT NULL,
  `selection` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `poll_uri_key` (`uri`),
  UNIQUE KEY `poll_response_poll_id_profile_id_key` (`poll_id`,`profile_id`),
  KEY `poll_response_profile_id_poll_id_index` (`profile_id`,`poll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of poll_response
-- ----------------------------
INSERT INTO `poll_response` VALUES ('28d21e0c-71c6-48a8-9160-300a4ca13eb6', 'http://localhost/statusnet/index.php/main/poll/response/28d21e0c-71c6-48a8-9160-300a4ca13eb6', '4880349b-236a-49ec-b160-768701a382d3', '12', '5', '2013-02-01 08:24:48');
INSERT INTO `poll_response` VALUES ('3c541345-1f63-4fb9-a83a-63d6753ba295', 'http://localhost/statusnet/index.php/main/poll/response/3c541345-1f63-4fb9-a83a-63d6753ba295', '1e120fb9-cb3e-4bba-9896-3c892a405c48', '5', '2', '2013-01-21 05:48:06');
INSERT INTO `poll_response` VALUES ('68eeb155-d87d-4011-8253-b53c3903bfdd', 'http://localhost/statusnet/index.php/main/poll/response/68eeb155-d87d-4011-8253-b53c3903bfdd', '7438fcdd-2ec1-484b-8684-edfcb6450bef', '1', '4', '2013-02-01 07:14:51');
INSERT INTO `poll_response` VALUES ('8a55b25d-1401-47a7-a3f8-fd08e28ae7b2', 'http://localhost/statusnet/index.php/main/poll/response/8a55b25d-1401-47a7-a3f8-fd08e28ae7b2', '4880349b-236a-49ec-b160-768701a382d3', '7', '3', '2013-02-05 01:30:52');
INSERT INTO `poll_response` VALUES ('a657c27c-6092-469d-999b-80d7233ae2c0', 'http://localhost/statusnet/index.php/main/poll/response/a657c27c-6092-469d-999b-80d7233ae2c0', '1e120fb9-cb3e-4bba-9896-3c892a405c48', '1', '3', '2013-01-21 07:14:38');
INSERT INTO `poll_response` VALUES ('abdd2095-a3dd-422c-b7dc-87b5ec1e1006', 'http://localhost/statusnet/index.php/main/poll/response/abdd2095-a3dd-422c-b7dc-87b5ec1e1006', '4880349b-236a-49ec-b160-768701a382d3', '8', '5', '2013-02-01 08:25:49');
INSERT INTO `poll_response` VALUES ('bfff3fcc-1742-42fd-9529-ef233c962124', 'http://localhost/statusnet/index.php/main/poll/response/bfff3fcc-1742-42fd-9529-ef233c962124', '4880349b-236a-49ec-b160-768701a382d3', '16', '1', '2013-02-01 10:46:36');
INSERT INTO `poll_response` VALUES ('c88bbbf7-ce23-492d-9533-6835965f5fd9', 'http://localhost/statusnet/index.php/main/poll/response/c88bbbf7-ce23-492d-9533-6835965f5fd9', '4880349b-236a-49ec-b160-768701a382d3', '1', '1', '2013-02-01 08:26:14');
INSERT INTO `poll_response` VALUES ('e3143015-f1fe-4463-a689-cbb0a1befe36', 'http://localhost/statusnet/index.php/main/poll/response/e3143015-f1fe-4463-a689-cbb0a1befe36', '4880349b-236a-49ec-b160-768701a382d3', '6', '4', '2013-02-01 08:25:13');

-- ----------------------------
-- Table structure for `profile`
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique identifier',
  `nickname` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT 'nickname or username',
  `fullname` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'display name',
  `profileurl` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'URL, cached so we dont regenerate',
  `homepage` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'identifying URL',
  `bio` text CHARACTER SET utf8 COMMENT 'descriptive biography',
  `location` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'physical location',
  `lat` decimal(10,7) DEFAULT NULL COMMENT 'latitude',
  `lon` decimal(10,7) DEFAULT NULL COMMENT 'longitude',
  `location_id` int(11) DEFAULT NULL COMMENT 'location id if possible',
  `location_ns` int(11) DEFAULT NULL COMMENT 'namespace for location',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`id`),
  KEY `profile_nickname_idx` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('1', 'admin', '天天的哥', 'http://localhost/statusnet/index.php/admin', '', 'asdasd', '132', '24.1694200', '120.8656500', '1991520', '1', '2012-12-11 18:32:44', '2013-04-22 11:51:58');
INSERT INTO `profile` VALUES ('75', 'conglin', '丛林', 'http://localhost/statusnet/index.php/conglin', null, null, null, null, null, null, null, '2013-04-22 07:57:09', '2013-04-22 15:57:09');
INSERT INTO `profile` VALUES ('76', 'qianhiju', '钱志军', 'http://localhost/statusnet/index.php/qianhiju', null, null, null, null, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile` VALUES ('77', 'shenlizhong', '沈立中', 'http://localhost/statusnet/index.php/shenlizhong', null, null, null, null, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile` VALUES ('78', 'qixiaoying', '戚晓莹', 'http://localhost/statusnet/index.php/qixiaoying', null, null, null, null, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile` VALUES ('79', 'meileijun', '梅雷俊', 'http://localhost/statusnet/index.php/meileijun', null, null, null, null, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile` VALUES ('80', 'zhaoyongzheng2', '赵永正', 'http://localhost/statusnet/index.php/zhaoyongzheng2', null, null, null, null, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile` VALUES ('81', 'conglin2', '丛林2', 'http://localhost/statusnet/index.php/conglin2', null, null, null, null, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile` VALUES ('82', 'qianzhijun2', '钱志军2', 'http://localhost/statusnet/index.php/qianzhijun2', null, null, null, null, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile` VALUES ('83', 'shenlizhong2', '沈立中2', 'http://localhost/statusnet/index.php/shenlizhong2', null, null, null, null, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile` VALUES ('84', 'qixiaoying2', '戚晓莹2', 'http://localhost/statusnet/index.php/qixiaoying2', null, null, null, null, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile` VALUES ('85', 'meileijun2', '梅雷俊2', 'http://localhost/statusnet/index.php/meileijun2', null, null, null, null, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile` VALUES ('86', 'chenhuanghai2', '陈黄海2', 'http://localhost/statusnet/index.php/chenhuanghai2', null, null, null, null, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile` VALUES ('87', 'wangjiareng', '王佳荣', 'http://localhost/statusnet/index.php/wangjiareng', null, null, null, null, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile` VALUES ('88', 'shenchen', '沈陈', 'http://localhost/statusnet/index.php/shenchen', null, null, null, null, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile` VALUES ('89', 'zhujiali', '祝佳宜', 'http://localhost/statusnet/index.php/zhujiali', null, null, null, null, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile` VALUES ('90', 'xujiaofei', '徐娇飞', 'http://localhost/statusnet/index.php/xujiaofei', null, null, null, null, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile` VALUES ('91', 'zhuyanli', '朱艳俐', 'http://localhost/statusnet/index.php/zhuyanli', null, null, null, null, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile` VALUES ('92', 'xuhongqing', '徐红清', 'http://localhost/statusnet/index.php/xuhongqing', null, null, null, null, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile` VALUES ('93', 'yangfany', '杨帆', 'http://localhost/statusnet/index.php/yangfany', null, null, null, null, null, null, null, '2013-04-22 07:58:50', '2013-04-22 15:58:50');
INSERT INTO `profile` VALUES ('94', 'yangfanyf', '杨帆', 'http://localhost/statusnet/index.php/yangfanyf', null, null, null, null, null, null, null, '2013-04-22 08:06:03', '2013-04-22 16:06:03');
INSERT INTO `profile` VALUES ('95', 'lyb', '刘亚斌', 'http://localhost/statusnet/index.php/lyb', null, null, null, null, null, null, null, '2013-04-22 08:30:57', '2013-04-22 16:30:57');
INSERT INTO `profile` VALUES ('96', 'kyle', '帷幕', 'http://localhost/statusnet/index.php/kyle', null, null, null, null, null, null, null, '2013-04-22 08:35:54', '2013-04-22 16:35:54');
INSERT INTO `profile` VALUES ('97', 'weimu', '李妍', 'http://localhost/statusnet/index.php/weimu', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('98', 'zangchen', '臧晨', 'http://localhost/statusnet/index.php/zangchen', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('99', 'xiaxinwen', '夏信文', 'http://localhost/statusnet/index.php/xiaxinwen', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('100', 'liuyun', '刘云', 'http://localhost/statusnet/index.php/liuyun', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('101', 'zhanglu', '张露 ', 'http://localhost/statusnet/index.php/zhanglu', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('102', 'linyali', '林亚丽', 'http://localhost/statusnet/index.php/linyali', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('103', 'shenguangyu', '沈广玉', 'http://localhost/statusnet/index.php/shenguangyu', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('104', 'wangyuting', '王瑜婷', 'http://localhost/statusnet/index.php/wangyuting', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('105', 'chenye', '陈叶', 'http://localhost/statusnet/index.php/chenye', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('106', 'wujie', '吴洁', 'http://localhost/statusnet/index.php/wujie', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('107', 'lilingling', '李玲玲', 'http://localhost/statusnet/index.php/lilingling', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('108', 'sunshasha', '孙纱纱', 'http://localhost/statusnet/index.php/sunshasha', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('109', 'lvzunjin', '吕尊敬', 'http://localhost/statusnet/index.php/lvzunjin', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('110', 'chenzhen', '陈振', 'http://localhost/statusnet/index.php/chenzhen', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('111', 'liyin', '李颖', 'http://localhost/statusnet/index.php/liyin', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('112', 'liusen', '刘森', 'http://localhost/statusnet/index.php/liusen', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('113', 'huhaiyan', '胡海燕', 'http://localhost/statusnet/index.php/huhaiyan', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('114', 'liuhuimin', '刘慧敏', 'http://localhost/statusnet/index.php/liuhuimin', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('115', 'liuyabin', '刘亚彬', 'http://localhost/statusnet/index.php/liuyabin', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('116', 'zhangyu', '张玉', 'http://localhost/statusnet/index.php/zhangyu', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('117', 'miaocui', '苗翠', 'http://localhost/statusnet/index.php/miaocui', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('118', 'wangbingxue', '王冰雪', 'http://localhost/statusnet/index.php/wangbingxue', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('119', 'zhaoting', '赵婷', 'http://localhost/statusnet/index.php/zhaoting', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('120', 'liyongdi', '李永弟', 'http://localhost/statusnet/index.php/liyongdi', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('121', 'wangshiliang', '王世亮', 'http://localhost/statusnet/index.php/wangshiliang', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('122', 'fanwenling', '樊文玲', 'http://localhost/statusnet/index.php/fanwenling', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('123', 'liuxingrong', '刘兴荣', 'http://localhost/statusnet/index.php/liuxingrong', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('124', 'litingting', '李婷婷', 'http://localhost/statusnet/index.php/litingting', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('125', 'zhaolinan', '赵林安', 'http://localhost/statusnet/index.php/zhaolinan', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('126', 'qiujinlan', '邱锦岚', 'http://localhost/statusnet/index.php/qiujinlan', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('127', 'mengchenyan', '孟成艳', 'http://localhost/statusnet/index.php/mengchenyan', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('128', 'wangfang', '王芳', 'http://localhost/statusnet/index.php/wangfang', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('129', 'sunyawei', '孙亚威', 'http://localhost/statusnet/index.php/sunyawei', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('130', 'liuyang', '柳扬', 'http://localhost/statusnet/index.php/liuyang', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('131', 'zhanmin', '詹敏', 'http://localhost/statusnet/index.php/zhanmin', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('132', 'zhangting', '张婷', 'http://localhost/statusnet/index.php/zhangting', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('133', 'yanshiwei', '严诗苇', 'http://localhost/statusnet/index.php/yanshiwei', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('134', 'chenxiaohe', '陈晓赫', 'http://localhost/statusnet/index.php/chenxiaohe', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('135', 'yangling', '杨玲', 'http://localhost/statusnet/index.php/yangling', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('136', 'wangjun', '王俊', 'http://localhost/statusnet/index.php/wangjun', null, null, null, null, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile` VALUES ('137', 'liaochunyuan', '我不叫春哥', 'http://localhost/statusnet/index.php/liaochunyuan', null, null, null, null, null, null, null, '2013-04-25 08:46:54', '2013-04-26 10:25:08');

-- ----------------------------
-- Table structure for `profile_block`
-- ----------------------------
DROP TABLE IF EXISTS `profile_block`;
CREATE TABLE `profile_block` (
  `blocker` int(11) NOT NULL COMMENT 'user making the block',
  `blocked` int(11) NOT NULL COMMENT 'profile that is blocked',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date of blocking',
  PRIMARY KEY (`blocker`,`blocked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of profile_block
-- ----------------------------

-- ----------------------------
-- Table structure for `profile_detail`
-- ----------------------------
DROP TABLE IF EXISTS `profile_detail`;
CREATE TABLE `profile_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `field_name` varchar(16) COLLATE utf8_bin NOT NULL,
  `value_index` int(11) DEFAULT NULL,
  `field_value` text COLLATE utf8_bin,
  `date` datetime DEFAULT NULL,
  `rel` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `rel_profile` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_detail_profile_id_field_name_value_index` (`profile_id`,`field_name`,`value_index`)
) ENGINE=InnoDB AUTO_INCREMENT=689 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of profile_detail
-- ----------------------------
INSERT INTO `profile_detail` VALUES ('126', '1', 'token', null, 0x61356139363335386562636337393633656431323536366661376334666438663861306261303735343763373639363761666339343661353830616530346534, null, null, null, '0000-00-00 00:00:00', '2013-03-21 11:39:32');
INSERT INTO `profile_detail` VALUES ('128', '1', 'birthday', null, null, null, null, null, '2013-01-29 03:47:45', '2013-01-29 11:47:45');
INSERT INTO `profile_detail` VALUES ('437', '75', 'kids', null, 0x6A696D, null, null, null, '2013-04-22 07:57:09', '2013-04-22 15:57:09');
INSERT INTO `profile_detail` VALUES ('438', '75', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-22 07:57:09', '2013-04-22 15:57:09');
INSERT INTO `profile_detail` VALUES ('439', '75', 'kidbirthday', null, 0x313939302F382F39, null, null, null, '2013-04-22 07:57:09', '2013-04-22 15:57:09');
INSERT INTO `profile_detail` VALUES ('440', '75', 'phone', null, 0x3135383532393531353239, null, null, null, '2013-04-22 07:57:09', '2013-04-22 15:57:09');
INSERT INTO `profile_detail` VALUES ('441', '76', 'kids', null, 0x6C756379, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('442', '76', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('443', '76', 'kidbirthday', null, 0x313939302F382F3130, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('444', '76', 'phone', null, 0x3135383532393531353330, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('445', '77', 'kids', null, 0x6C696C79, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('446', '77', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('447', '77', 'kidbirthday', null, 0x313939302F382F3131, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('448', '77', 'phone', null, 0x3135383532393531353331, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('449', '78', 'kids', null, 0x746F6D, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('450', '78', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('451', '78', 'kidbirthday', null, 0x313939302F382F3132, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('452', '78', 'phone', null, 0x3135383532393531353332, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('453', '79', 'kids', null, 0x6A696D, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('454', '79', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('455', '79', 'kidbirthday', null, 0x313939302F382F3133, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('456', '79', 'phone', null, 0x3135383532393531353333, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('457', '80', 'kids', null, 0x6C756379, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('458', '80', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('459', '80', 'kidbirthday', null, 0x313939302F382F3134, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('460', '80', 'phone', null, 0x3135383532393531353334, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('461', '81', 'kids', null, 0x6C696C79, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('462', '81', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('463', '81', 'kidbirthday', null, 0x313939302F382F3135, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('464', '81', 'phone', null, 0x3135383532393531353335, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('465', '82', 'kids', null, 0x746F6D, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('466', '82', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('467', '82', 'kidbirthday', null, 0x313939302F382F3136, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('468', '82', 'phone', null, 0x3135383532393531353336, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('469', '83', 'kids', null, 0x6A696D, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('470', '83', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('471', '83', 'kidbirthday', null, 0x313939302F382F3137, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('472', '83', 'phone', null, 0x3135383532393531353337, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('473', '84', 'kids', null, 0x6C756379, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('474', '84', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('475', '84', 'kidbirthday', null, 0x313939302F382F3138, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('476', '84', 'phone', null, 0x3135383532393531353338, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('477', '85', 'kids', null, 0x6C696C79, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('478', '85', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('479', '85', 'kidbirthday', null, 0x313939302F382F3139, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('480', '85', 'phone', null, 0x3135383532393531353339, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('481', '86', 'kids', null, 0x746F6D, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('482', '86', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('483', '86', 'kidbirthday', null, 0x313939302F382F3230, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('484', '86', 'phone', null, 0x3135383532393531353430, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('485', '87', 'kids', null, 0x6A696D, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('486', '87', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('487', '87', 'kidbirthday', null, 0x313939302F382F3231, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('488', '87', 'phone', null, 0x3135383532393531353431, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('489', '88', 'kids', null, 0x6C756379, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('490', '88', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('491', '88', 'kidbirthday', null, 0x313939302F382F3232, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('492', '88', 'phone', null, 0x3135383532393531353432, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('493', '89', 'kids', null, 0x6C696C79, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('494', '89', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('495', '89', 'kidbirthday', null, 0x313939302F382F3233, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('496', '89', 'phone', null, 0x3135383532393531353433, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('497', '90', 'kids', null, 0x746F6D, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('498', '90', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('499', '90', 'kidbirthday', null, 0x313939302F382F3234, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('500', '90', 'phone', null, 0x3135383532393531353434, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('501', '91', 'kids', null, 0x6A696D, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('502', '91', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('503', '91', 'kidbirthday', null, 0x313939302F382F3235, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('504', '91', 'phone', null, 0x3135383532393531353435, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('505', '92', 'kids', null, 0x6C756379, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('506', '92', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('507', '92', 'kidbirthday', null, 0x313939302F382F3236, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('508', '92', 'phone', null, 0x3135383532393531353436, null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `profile_detail` VALUES ('509', '93', 'kids', null, 0x6C696C79, null, null, null, '2013-04-22 07:58:50', '2013-04-22 15:58:50');
INSERT INTO `profile_detail` VALUES ('510', '93', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-22 07:58:50', '2013-04-22 15:58:50');
INSERT INTO `profile_detail` VALUES ('511', '93', 'kidbirthday', null, 0x313939302F382F3135, null, null, null, '2013-04-22 07:58:50', '2013-04-22 15:58:50');
INSERT INTO `profile_detail` VALUES ('512', '93', 'phone', null, 0x3135383532393531353335, null, null, null, '2013-04-22 07:58:50', '2013-04-22 15:58:50');
INSERT INTO `profile_detail` VALUES ('513', '94', 'kids', null, 0x6C696C79, null, null, null, '2013-04-22 08:06:03', '2013-04-22 16:06:03');
INSERT INTO `profile_detail` VALUES ('514', '94', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-22 08:06:03', '2013-04-22 16:06:03');
INSERT INTO `profile_detail` VALUES ('515', '94', 'kidbirthday', null, 0x313939302F382F3135, null, null, null, '2013-04-22 08:06:03', '2013-04-22 16:06:03');
INSERT INTO `profile_detail` VALUES ('516', '94', 'phone', null, 0x3135383532393531353335, null, null, null, '2013-04-22 08:06:03', '2013-04-22 16:06:03');
INSERT INTO `profile_detail` VALUES ('517', '95', 'kids', null, 0x6C696C79, null, null, null, '2013-04-22 08:30:57', '2013-04-22 16:30:57');
INSERT INTO `profile_detail` VALUES ('518', '95', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-22 08:30:57', '2013-04-22 16:30:57');
INSERT INTO `profile_detail` VALUES ('519', '95', 'kidbirthday', null, 0x313939302F382F3135, null, null, null, '2013-04-22 08:30:57', '2013-04-22 16:30:57');
INSERT INTO `profile_detail` VALUES ('520', '95', 'phone', null, 0x3135383532393531353335, null, null, null, '2013-04-22 08:30:57', '2013-04-22 16:30:57');
INSERT INTO `profile_detail` VALUES ('521', '96', 'kids', null, 0x6C696C79, null, null, null, '2013-04-22 08:35:54', '2013-04-22 16:35:54');
INSERT INTO `profile_detail` VALUES ('522', '96', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-22 08:35:54', '2013-04-22 16:35:54');
INSERT INTO `profile_detail` VALUES ('523', '96', 'kidbirthday', null, 0x313939302F382F3135, null, null, null, '2013-04-22 08:35:54', '2013-04-22 16:35:54');
INSERT INTO `profile_detail` VALUES ('524', '96', 'phone', null, 0x3135383532393531353335, null, null, null, '2013-04-22 08:35:54', '2013-04-22 16:35:54');
INSERT INTO `profile_detail` VALUES ('525', '97', 'kids', null, 0x6161, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('526', '97', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('527', '97', 'kidbirthday', null, 0x313939302F382F3135, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('528', '97', 'phone', null, 0x3135383532393531353335, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('529', '98', 'kids', null, 0x6262, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('530', '98', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('531', '98', 'kidbirthday', null, 0x313939302F382F3136, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('532', '98', 'phone', null, 0x3135383532393531353336, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('533', '99', 'kids', null, 0x6363, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('534', '99', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('535', '99', 'kidbirthday', null, 0x313939302F382F3137, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('536', '99', 'phone', null, 0x3135383532393531353337, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('537', '100', 'kids', null, 0x6161, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('538', '100', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('539', '100', 'kidbirthday', null, 0x313939302F382F3138, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('540', '100', 'phone', null, 0x3135383532393531353338, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('541', '101', 'kids', null, 0x6262, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('542', '101', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('543', '101', 'kidbirthday', null, 0x313939302F382F3139, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('544', '101', 'phone', null, 0x3135383532393531353339, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('545', '102', 'kids', null, 0x6363, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('546', '102', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('547', '102', 'kidbirthday', null, 0x313939302F382F3230, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('548', '102', 'phone', null, 0x3135383532393531353430, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('549', '103', 'kids', null, 0x6161, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('550', '103', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('551', '103', 'kidbirthday', null, 0x313939302F382F3231, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('552', '103', 'phone', null, 0x3135383532393531353431, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('553', '104', 'kids', null, 0x6262, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('554', '104', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('555', '104', 'kidbirthday', null, 0x313939302F382F3232, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('556', '104', 'phone', null, 0x3135383532393531353432, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('557', '105', 'kids', null, 0x6363, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('558', '105', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('559', '105', 'kidbirthday', null, 0x313939302F382F3233, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('560', '105', 'phone', null, 0x3135383532393531353433, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('561', '106', 'kids', null, 0x6161, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('562', '106', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('563', '106', 'kidbirthday', null, 0x313939302F382F3234, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('564', '106', 'phone', null, 0x3135383532393531353434, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('565', '107', 'kids', null, 0x6262, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('566', '107', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('567', '107', 'kidbirthday', null, 0x313939302F382F3235, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('568', '107', 'phone', null, 0x3135383532393531353435, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('569', '108', 'kids', null, 0x6363, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('570', '108', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('571', '108', 'kidbirthday', null, 0x313939302F382F3236, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('572', '108', 'phone', null, 0x3135383532393531353436, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('573', '109', 'kids', null, 0x6161, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('574', '109', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('575', '109', 'kidbirthday', null, 0x313939302F382F3237, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('576', '109', 'phone', null, 0x3135383532393531353437, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('577', '110', 'kids', null, 0x6262, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('578', '110', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('579', '110', 'kidbirthday', null, 0x313939302F382F3238, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('580', '110', 'phone', null, 0x3135383532393531353438, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('581', '111', 'kids', null, 0x6363, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('582', '111', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('583', '111', 'kidbirthday', null, 0x313939302F382F3239, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('584', '111', 'phone', null, 0x3135383532393531353439, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('585', '112', 'kids', null, 0x6161, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('586', '112', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('587', '112', 'kidbirthday', null, 0x313939302F382F3330, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('588', '112', 'phone', null, 0x3135383532393531353530, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('589', '113', 'kids', null, 0x6262, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('590', '113', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('591', '113', 'kidbirthday', null, 0x313939302F382F3331, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('592', '113', 'phone', null, 0x3135383532393531353531, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('593', '114', 'kids', null, 0x6363, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('594', '114', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('595', '114', 'kidbirthday', null, 0x313939302F392F31, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('596', '114', 'phone', null, 0x3135383532393531353532, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('597', '115', 'kids', null, 0x6161, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('598', '115', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('599', '115', 'kidbirthday', null, 0x313939302F392F32, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('600', '115', 'phone', null, 0x3135383532393531353533, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('601', '116', 'kids', null, 0x6262, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('602', '116', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('603', '116', 'kidbirthday', null, 0x313939302F392F33, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('604', '116', 'phone', null, 0x3135383532393531353534, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('605', '117', 'kids', null, 0x6363, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('606', '117', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('607', '117', 'kidbirthday', null, 0x313939302F392F34, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('608', '117', 'phone', null, 0x3135383532393531353535, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('609', '118', 'kids', null, 0x6161, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('610', '118', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('611', '118', 'kidbirthday', null, 0x313939302F392F35, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('612', '118', 'phone', null, 0x3135383532393531353536, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('613', '119', 'kids', null, 0x6262, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('614', '119', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('615', '119', 'kidbirthday', null, 0x313939302F392F36, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('616', '119', 'phone', null, 0x3135383532393531353537, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('617', '120', 'kids', null, 0x6363, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('618', '120', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('619', '120', 'kidbirthday', null, 0x313939302F392F37, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('620', '120', 'phone', null, 0x3135383532393531353538, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('621', '121', 'kids', null, 0x6161, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('622', '121', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('623', '121', 'kidbirthday', null, 0x313939302F392F38, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('624', '121', 'phone', null, 0x3135383532393531353539, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('625', '122', 'kids', null, 0x6262, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('626', '122', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('627', '122', 'kidbirthday', null, 0x313939302F392F39, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('628', '122', 'phone', null, 0x3135383532393531353630, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('629', '123', 'kids', null, 0x6363, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('630', '123', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('631', '123', 'kidbirthday', null, 0x313939302F392F3130, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('632', '123', 'phone', null, 0x3135383532393531353631, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('633', '124', 'kids', null, 0x6161, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('634', '124', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('635', '124', 'kidbirthday', null, 0x313939302F392F3131, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('636', '124', 'phone', null, 0x3135383532393531353632, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('637', '125', 'kids', null, 0x6262, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('638', '125', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('639', '125', 'kidbirthday', null, 0x313939302F392F3132, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('640', '125', 'phone', null, 0x3135383532393531353633, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('641', '126', 'kids', null, 0x6363, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('642', '126', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('643', '126', 'kidbirthday', null, 0x313939302F392F3133, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('644', '126', 'phone', null, 0x3135383532393531353634, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('645', '127', 'kids', null, 0x6161, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('646', '127', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('647', '127', 'kidbirthday', null, 0x313939302F392F3134, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('648', '127', 'phone', null, 0x3135383532393531353635, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('649', '128', 'kids', null, 0x6262, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('650', '128', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('651', '128', 'kidbirthday', null, 0x313939302F392F3135, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('652', '128', 'phone', null, 0x3135383532393531353636, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('653', '129', 'kids', null, 0x6363, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('654', '129', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('655', '129', 'kidbirthday', null, 0x313939302F392F3136, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('656', '129', 'phone', null, 0x3135383532393531353637, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('657', '130', 'kids', null, 0x6161, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('658', '130', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('659', '130', 'kidbirthday', null, 0x313939302F392F3137, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('660', '130', 'phone', null, 0x3135383532393531353638, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('661', '131', 'kids', null, 0x6262, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('662', '131', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('663', '131', 'kidbirthday', null, 0x313939302F392F3138, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('664', '131', 'phone', null, 0x3135383532393531353639, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('665', '132', 'kids', null, 0x6363, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('666', '132', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('667', '132', 'kidbirthday', null, 0x313939302F392F3139, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('668', '132', 'phone', null, 0x3135383532393531353730, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('669', '133', 'kids', null, 0x6161, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('670', '133', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('671', '133', 'kidbirthday', null, 0x313939302F392F3230, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('672', '133', 'phone', null, 0x3135383532393531353731, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('673', '134', 'kids', null, 0x6262, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('674', '134', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('675', '134', 'kidbirthday', null, 0x313939302F392F3231, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('676', '134', 'phone', null, 0x3135383532393531353732, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('677', '135', 'kids', null, 0x6363, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('678', '135', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('679', '135', 'kidbirthday', null, 0x313939302F392F3232, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('680', '135', 'phone', null, 0x3135383532393531353733, null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `profile_detail` VALUES ('681', '136', 'kids', null, 0x6161, null, null, null, '2013-04-25 08:46:54', '2013-04-25 16:46:54');
INSERT INTO `profile_detail` VALUES ('682', '136', 'kidsex', null, 0xE5A5B3, null, null, null, '2013-04-25 08:46:54', '2013-04-25 16:46:54');
INSERT INTO `profile_detail` VALUES ('683', '136', 'kidbirthday', null, 0x313939302F392F3233, null, null, null, '2013-04-25 08:46:54', '2013-04-25 16:46:54');
INSERT INTO `profile_detail` VALUES ('684', '136', 'phone', null, 0x3135383532393531353734, null, null, null, '2013-04-25 08:46:54', '2013-04-25 16:46:54');
INSERT INTO `profile_detail` VALUES ('685', '137', 'kids', null, 0x6262, null, null, null, '2013-04-25 08:46:54', '2013-04-25 16:46:54');
INSERT INTO `profile_detail` VALUES ('686', '137', 'kidsex', null, 0xE794B7, null, null, null, '2013-04-25 08:46:54', '2013-04-25 16:46:54');
INSERT INTO `profile_detail` VALUES ('687', '137', 'kidbirthday', null, 0x313939302F392F3234, null, null, null, '2013-04-25 08:46:54', '2013-04-25 16:46:54');
INSERT INTO `profile_detail` VALUES ('688', '137', 'phone', null, 0x3133393231373533323237, null, null, null, '2013-04-25 08:46:54', '2013-04-26 10:35:22');

-- ----------------------------
-- Table structure for `profile_list`
-- ----------------------------
DROP TABLE IF EXISTS `profile_list`;
CREATE TABLE `profile_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique identifier',
  `tagger` int(11) NOT NULL COMMENT 'user making the tag',
  `tag` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'people tag',
  `description` text COLLATE utf8_bin COMMENT 'description of the people tag',
  `private` tinyint(4) DEFAULT '0' COMMENT 'is this tag private',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date the tag was added',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'date the tag was modified',
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'universal identifier',
  `mainpage` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'page to link to',
  `tagged_count` int(11) DEFAULT '0' COMMENT 'number of people tagged with this tag by this user',
  `subscriber_count` int(11) DEFAULT '0' COMMENT 'number of subscribers to this tag',
  PRIMARY KEY (`tagger`,`tag`),
  UNIQUE KEY `profile_list_id_key` (`id`),
  KEY `profile_list_modified_idx` (`modified`),
  KEY `profile_list_tag_idx` (`tag`),
  KEY `profile_list_tagger_tag_idx` (`tagger`,`tag`),
  KEY `profile_list_tagged_count_idx` (`tagged_count`),
  KEY `profile_list_subscriber_count_idx` (`subscriber_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of profile_list
-- ----------------------------

-- ----------------------------
-- Table structure for `profile_role`
-- ----------------------------
DROP TABLE IF EXISTS `profile_role`;
CREATE TABLE `profile_role` (
  `profile_id` int(11) NOT NULL COMMENT 'account having the role',
  `role` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'string representing the role',
  `created` datetime NOT NULL COMMENT 'date the role was granted',
  PRIMARY KEY (`profile_id`,`role`),
  KEY `profile_role_role_created_profile_id_idx` (`role`,`created`,`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of profile_role
-- ----------------------------
INSERT INTO `profile_role` VALUES ('1', 'administrator', '2012-12-12 06:19:20');
INSERT INTO `profile_role` VALUES ('75', 'faculty', '2013-04-22 07:57:10');
INSERT INTO `profile_role` VALUES ('76', 'faculty', '2013-04-22 07:57:10');
INSERT INTO `profile_role` VALUES ('77', 'faculty', '2013-04-22 07:57:10');
INSERT INTO `profile_role` VALUES ('78', 'faculty', '2013-04-22 07:57:10');
INSERT INTO `profile_role` VALUES ('79', 'faculty', '2013-04-22 07:57:10');
INSERT INTO `profile_role` VALUES ('80', 'faculty', '2013-04-22 07:57:10');
INSERT INTO `profile_role` VALUES ('1', 'moderator', '2013-01-01 08:07:09');
INSERT INTO `profile_role` VALUES ('1', 'owner', '2013-01-01 00:00:00');
INSERT INTO `profile_role` VALUES ('81', 'parents', '2013-04-22 07:57:10');
INSERT INTO `profile_role` VALUES ('82', 'parents', '2013-04-22 07:57:10');
INSERT INTO `profile_role` VALUES ('83', 'parents', '2013-04-22 07:57:10');
INSERT INTO `profile_role` VALUES ('84', 'parents', '2013-04-22 07:57:10');
INSERT INTO `profile_role` VALUES ('85', 'parents', '2013-04-22 07:57:10');
INSERT INTO `profile_role` VALUES ('86', 'parents', '2013-04-22 07:57:10');
INSERT INTO `profile_role` VALUES ('87', 'parents', '2013-04-22 07:57:10');
INSERT INTO `profile_role` VALUES ('88', 'parents', '2013-04-22 07:57:10');
INSERT INTO `profile_role` VALUES ('89', 'parents', '2013-04-22 07:57:10');
INSERT INTO `profile_role` VALUES ('90', 'parents', '2013-04-22 07:57:10');
INSERT INTO `profile_role` VALUES ('91', 'parents', '2013-04-22 07:57:10');
INSERT INTO `profile_role` VALUES ('92', 'parents', '2013-04-22 07:57:10');
INSERT INTO `profile_role` VALUES ('93', 'parents', '2013-04-22 07:58:50');
INSERT INTO `profile_role` VALUES ('94', 'parents', '2013-04-22 08:06:03');
INSERT INTO `profile_role` VALUES ('95', 'parents', '2013-04-22 08:30:57');
INSERT INTO `profile_role` VALUES ('96', 'parents', '2013-04-22 08:35:54');
INSERT INTO `profile_role` VALUES ('112', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('113', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('114', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('115', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('116', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('117', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('118', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('119', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('120', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('121', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('122', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('123', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('124', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('125', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('126', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('127', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('128', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('129', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('130', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('131', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('132', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('133', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('134', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('135', 'parents', '2013-04-25 08:46:53');
INSERT INTO `profile_role` VALUES ('136', 'parents', '2013-04-25 08:46:54');
INSERT INTO `profile_role` VALUES ('137', 'parents', '2013-04-25 08:46:54');

-- ----------------------------
-- Table structure for `profile_tag`
-- ----------------------------
DROP TABLE IF EXISTS `profile_tag`;
CREATE TABLE `profile_tag` (
  `tagger` int(11) NOT NULL COMMENT 'user making the tag',
  `tagged` int(11) NOT NULL COMMENT 'profile tagged',
  `tag` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'hash tag associated with this notice',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date the tag was added',
  PRIMARY KEY (`tagger`,`tagged`,`tag`),
  KEY `profile_tag_modified_idx` (`modified`),
  KEY `profile_tag_tagger_tag_idx` (`tagger`,`tag`),
  KEY `profile_tag_tagged_idx` (`tagged`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of profile_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `profile_tag_subscription`
-- ----------------------------
DROP TABLE IF EXISTS `profile_tag_subscription`;
CREATE TABLE `profile_tag_subscription` (
  `profile_tag_id` int(11) NOT NULL COMMENT 'foreign key to profile_tag',
  `profile_id` int(11) NOT NULL COMMENT 'foreign key to profile table',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`profile_tag_id`,`profile_id`),
  KEY `profile_tag_subscription_profile_id_idx` (`profile_id`),
  KEY `profile_tag_subscription_created_idx` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of profile_tag_subscription
-- ----------------------------

-- ----------------------------
-- Table structure for `qna_answer`
-- ----------------------------
DROP TABLE IF EXISTS `qna_answer`;
CREATE TABLE `qna_answer` (
  `id` char(36) COLLATE utf8_bin NOT NULL COMMENT 'UUID of the response',
  `uri` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'UUID to the answer notice',
  `question_id` char(36) COLLATE utf8_bin NOT NULL COMMENT 'UUID of question being responded to',
  `content` text COLLATE utf8_bin,
  `best` tinyint(4) DEFAULT NULL,
  `revisions` int(11) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `question_uri_key` (`uri`),
  UNIQUE KEY `question_id_profile_id_key` (`question_id`,`profile_id`),
  KEY `profile_id_question_id_index` (`profile_id`,`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qna_answer
-- ----------------------------

-- ----------------------------
-- Table structure for `qna_question`
-- ----------------------------
DROP TABLE IF EXISTS `qna_question`;
CREATE TABLE `qna_question` (
  `id` char(36) COLLATE utf8_bin NOT NULL COMMENT 'UUID',
  `uri` varchar(255) COLLATE utf8_bin NOT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `title` text COLLATE utf8_bin,
  `closed` tinyint(4) DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `question_uri_key` (`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qna_question
-- ----------------------------

-- ----------------------------
-- Table structure for `qna_vote`
-- ----------------------------
DROP TABLE IF EXISTS `qna_vote`;
CREATE TABLE `qna_vote` (
  `id` char(36) COLLATE utf8_bin NOT NULL COMMENT 'UUID of the vote',
  `question_id` char(36) COLLATE utf8_bin NOT NULL COMMENT 'UUID of question being voted on',
  `answer_id` char(36) COLLATE utf8_bin NOT NULL COMMENT 'UUID of answer being voted on',
  `vote` tinyint(4) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_id_question_Id_index` (`profile_id`,`answer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qna_vote
-- ----------------------------

-- ----------------------------
-- Table structure for `queue_item`
-- ----------------------------
DROP TABLE IF EXISTS `queue_item`;
CREATE TABLE `queue_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique identifier',
  `frame` blob NOT NULL COMMENT 'data: object reference or opaque string',
  `transport` varchar(8) COLLATE utf8_bin NOT NULL COMMENT 'queue for what? "email", "xmpp", "sms", "irc", ...',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `claimed` datetime DEFAULT NULL COMMENT 'date this item was claimed',
  PRIMARY KEY (`id`),
  KEY `queue_item_created_idx` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of queue_item
-- ----------------------------

-- ----------------------------
-- Table structure for `related_group`
-- ----------------------------
DROP TABLE IF EXISTS `related_group`;
CREATE TABLE `related_group` (
  `group_id` int(11) NOT NULL COMMENT 'foreign key to user_group',
  `related_group_id` int(11) NOT NULL COMMENT 'foreign key to user_group',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  PRIMARY KEY (`group_id`,`related_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of related_group
-- ----------------------------

-- ----------------------------
-- Table structure for `remember_me`
-- ----------------------------
DROP TABLE IF EXISTS `remember_me`;
CREATE TABLE `remember_me` (
  `code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'good random code',
  `user_id` int(11) NOT NULL COMMENT 'user who is logged in',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of remember_me
-- ----------------------------
INSERT INTO `remember_me` VALUES ('2addf4e0a38658014627f8413f14b155', '1', '2013-02-04 21:24:22');
INSERT INTO `remember_me` VALUES ('66fc01501adb95350ba4c2c41d2fe182', '71', '2013-03-28 16:14:31');
INSERT INTO `remember_me` VALUES ('8130f516771b3ac678589728be530ea6', '1', '2013-01-19 12:59:51');
INSERT INTO `remember_me` VALUES ('ada46828031495bd46fdcfc142f83d07', '1', '2013-01-19 11:59:48');
INSERT INTO `remember_me` VALUES ('c9d782d955bc8e2fea4c83c97f14d4de', '1', '2013-03-04 11:22:40');
INSERT INTO `remember_me` VALUES ('d79c822c0be4ba0c5d093c92ec8a5956', '1', '2013-01-17 18:25:27');

-- ----------------------------
-- Table structure for `remote_profile`
-- ----------------------------
DROP TABLE IF EXISTS `remote_profile`;
CREATE TABLE `remote_profile` (
  `id` int(11) NOT NULL COMMENT 'foreign key to profile table',
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'universally unique identifier, usually a tag URI',
  `postnoticeurl` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'URL we use for posting notices',
  `updateprofileurl` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'URL we use for updates to this profile',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`id`),
  UNIQUE KEY `remote_profile_uri_key` (`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of remote_profile
-- ----------------------------

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `notice_id` int(11) NOT NULL COMMENT 'notice that is the reply',
  `profile_id` int(11) NOT NULL COMMENT 'profile replied to',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  `replied_id` int(11) DEFAULT NULL COMMENT 'notice replied to (not used, see notice.reply_to)',
  PRIMARY KEY (`notice_id`,`profile_id`),
  KEY `reply_notice_id_idx` (`notice_id`),
  KEY `reply_profile_id_idx` (`profile_id`),
  KEY `reply_replied_id_idx` (`replied_id`),
  KEY `reply_profile_id_modified_notice_id_idx` (`profile_id`,`modified`,`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '93', '2013-04-23 11:24:36', null);
INSERT INTO `reply` VALUES ('2', '94', '2013-04-23 11:24:39', null);
INSERT INTO `reply` VALUES ('3', '95', '2013-04-23 11:24:42', null);
INSERT INTO `reply` VALUES ('4', '96', '2013-04-23 11:24:45', null);
INSERT INTO `reply` VALUES ('5', '1', '2013-04-23 11:25:25', null);

-- ----------------------------
-- Table structure for `rsvp`
-- ----------------------------
DROP TABLE IF EXISTS `rsvp`;
CREATE TABLE `rsvp` (
  `id` char(36) COLLATE utf8_bin NOT NULL COMMENT 'UUID',
  `uri` varchar(255) COLLATE utf8_bin NOT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `event_id` char(36) COLLATE utf8_bin NOT NULL COMMENT 'UUID',
  `response` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Y, N, or ? for three-state yes, no, maybe',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rsvp_uri_key` (`uri`),
  UNIQUE KEY `rsvp_profile_event_key` (`profile_id`,`event_id`),
  KEY `rsvp_created_idx` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of rsvp
-- ----------------------------
INSERT INTO `rsvp` VALUES ('50f13a41-4e65-4bd3-853b-96149474697f', 'http://localhost/statusnet/index.php/rsvp/50f13a41-4e65-4bd3-853b-96149474697f', '1', '0ca6b543-c856-4b3f-adb3-ef780fca45f2', 'Y', '2013-01-21 07:14:54');
INSERT INTO `rsvp` VALUES ('b30f7ea6-f84a-471f-9a40-554ce74339ee', 'http://localhost/statusnet/index.php/rsvp/b30f7ea6-f84a-471f-9a40-554ce74339ee', '1', 'f9feba0e-34d6-4faf-8215-62874a4a0dc5', 'Y', '2013-02-02 03:44:48');
INSERT INTO `rsvp` VALUES ('cd1f9540-6889-40bd-9d43-b90f06daedd7', 'http://localhost/statusnet/index.php/rsvp/cd1f9540-6889-40bd-9d43-b90f06daedd7', '1', 'c59da7e5-ab4e-408c-b58a-9ff6da5a491d', 'Y', '2013-02-01 07:13:55');

-- ----------------------------
-- Table structure for `schedule`
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) DEFAULT NULL,
  `classgroup_id` int(11) NOT NULL,
  `type` tinyint(4) DEFAULT '1',
  `period` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `schedule_profile_id_key` (`profile_id`),
  KEY `schedule_classgroup_id_key` (`classgroup_id`),
  KEY `schedule_course_id_key` (`course_id`),
  KEY `schedule_start_date_idx` (`start_date`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('74', '1', '2', '1', '1', '599', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2013-01-17 16:58:45', '2013-01-18 01:04:53');
INSERT INTO `schedule` VALUES ('75', '3', '2', '1', '1', '600', '2012-09-18 00:00:00', '2013-01-09 00:00:00', '2013-01-17 17:01:09', '2013-01-17 17:01:09');
INSERT INTO `schedule` VALUES ('76', '5', '2', '1', '2', '601', '2012-09-17 00:00:00', '2013-05-16 00:00:00', '2013-01-17 17:01:48', '2013-01-17 17:01:48');
INSERT INTO `schedule` VALUES ('77', '5', '2', '1', '2', '601', '2012-09-12 00:00:00', '2013-05-16 00:00:00', '2013-01-17 17:01:48', '2013-01-17 17:01:48');
INSERT INTO `schedule` VALUES ('78', '1', '3', '1', '9', '600', '2012-08-21 00:00:00', '2013-05-31 00:00:00', '2013-01-17 17:02:29', '2013-01-17 17:02:29');
INSERT INTO `schedule` VALUES ('79', '1', '3', '1', '10', '600', '2012-08-23 00:00:00', '2013-05-31 00:00:00', '2013-01-17 17:02:29', '2013-01-17 17:02:29');
INSERT INTO `schedule` VALUES ('80', '5', '2', '3', '7', '0', '2013-01-02 00:00:00', '2013-01-02 00:00:00', '2013-01-17 17:03:36', '2013-01-17 17:03:36');
INSERT INTO `schedule` VALUES ('81', '5', '2', '3', '7', '0', '2013-01-02 00:00:00', '2013-01-02 00:00:00', '2013-01-17 17:04:10', '2013-01-17 17:04:10');
INSERT INTO `schedule` VALUES ('82', '1', '2', '1', '10', '599', '2012-06-17 00:00:00', '2013-05-09 00:00:00', '2013-01-18 06:12:50', '2013-01-18 06:12:50');
INSERT INTO `schedule` VALUES ('83', '1', '2', '1', '9', '599', '2012-06-18 00:00:00', '2013-05-09 00:00:00', '2013-01-18 06:12:50', '2013-01-18 06:12:50');
INSERT INTO `schedule` VALUES ('84', '1', '2', '1', '8', '599', '2012-06-19 00:00:00', '2013-05-09 00:00:00', '2013-01-18 06:12:50', '2013-01-18 06:12:50');
INSERT INTO `schedule` VALUES ('85', '1', '2', '1', '7', '599', '2012-06-20 00:00:00', '2013-05-09 00:00:00', '2013-01-18 06:12:50', '2013-01-18 06:12:50');
INSERT INTO `schedule` VALUES ('86', '1', '2', '1', '6', '599', '2012-06-21 00:00:00', '2013-05-09 00:00:00', '2013-01-18 06:12:50', '2013-01-18 06:12:50');
INSERT INTO `schedule` VALUES ('87', '1', '2', '1', '5', '599', '2012-06-22 00:00:00', '2013-05-09 00:00:00', '2013-01-18 06:12:50', '2013-01-18 06:12:50');
INSERT INTO `schedule` VALUES ('89', '1', '2', '3', '9', '599', '2013-01-26 00:00:00', '2013-01-26 00:00:00', '2013-01-18 06:16:22', '2013-01-18 06:16:22');
INSERT INTO `schedule` VALUES ('90', '0', '2', '1', '10', '599', '2013-01-26 00:00:00', '2013-05-25 00:00:00', '2013-01-18 06:16:58', '2013-01-18 06:16:58');
INSERT INTO `schedule` VALUES ('91', '5', '2', '3', '10', '600', '2013-01-19 00:00:00', '2013-01-19 00:00:00', '2013-01-18 06:17:34', '2013-01-18 06:17:34');

-- ----------------------------
-- Table structure for `schema_version`
-- ----------------------------
DROP TABLE IF EXISTS `schema_version`;
CREATE TABLE `schema_version` (
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Table name',
  `checksum` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Checksum of schema array; a mismatch indicates we should check the table more thoroughly.',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of schema_version
-- ----------------------------

-- ----------------------------
-- Table structure for `searchsub`
-- ----------------------------
DROP TABLE IF EXISTS `searchsub`;
CREATE TABLE `searchsub` (
  `search` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'hash search associated with this subscription',
  `profile_id` int(11) NOT NULL COMMENT 'profile ID of subscribing user',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  PRIMARY KEY (`search`,`profile_id`),
  KEY `searchsub_created_idx` (`created`),
  KEY `searchsub_profile_id_tag_idx` (`profile_id`,`search`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of searchsub
-- ----------------------------

-- ----------------------------
-- Table structure for `session`
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'session ID',
  `session_data` text COLLATE utf8_bin COMMENT 'session data',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`id`),
  KEY `session_modified_idx` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of session
-- ----------------------------

-- ----------------------------
-- Table structure for `sms_carrier`
-- ----------------------------
DROP TABLE IF EXISTS `sms_carrier`;
CREATE TABLE `sms_carrier` (
  `id` int(11) NOT NULL COMMENT 'primary key for SMS carrier',
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'name of the carrier',
  `email_pattern` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'sprintf pattern for making an email address from a phone number',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sms_carrier_name_key` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sms_carrier
-- ----------------------------
INSERT INTO `sms_carrier` VALUES ('100056', '3 River Wireless', '%s@sms.3rivers.net', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100057', '7-11 Speakout', '%s@cingularme.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100058', 'Airtel (Karnataka, India)', '%s@airtelkk.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100059', 'Alaska Communications Systems', '%s@msg.acsalaska.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100060', 'Alltel Wireless', '%s@message.alltel.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100061', 'AT&T Wireless', '%s@txt.att.net', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100062', 'Bell Mobility (Canada)', '%s@txt.bell.ca', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100063', 'Boost Mobile', '%s@myboostmobile.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100064', 'Cellular One (Dobson)', '%s@mobile.celloneusa.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100065', 'Cingular (Postpaid)', '%s@cingularme.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100066', 'Centennial Wireless', '%s@cwemail.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100067', 'Cingular (GoPhone prepaid)', '%s@cingularme.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100068', 'Claro (Nicaragua)', '%s@ideasclaro-ca.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100069', 'Comcel', '%s@comcel.com.co', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100070', 'Cricket', '%s@sms.mycricket.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100071', 'CTI', '%s@sms.ctimovil.com.ar', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100072', 'Emtel (Mauritius)', '%s@emtelworld.net', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100073', 'Fido (Canada)', '%s@fido.ca', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100074', 'General Communications Inc.', '%s@msg.gci.net', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100075', 'Globalstar', '%s@msg.globalstarusa.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100076', 'Helio', '%s@myhelio.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100077', 'Illinois Valley Cellular', '%s@ivctext.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100078', 'i wireless', '%s.iws@iwspcs.net', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100079', 'Meteor (Ireland)', '%s@sms.mymeteor.ie', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100080', 'Mero Mobile (Nepal)', '%s@sms.spicenepal.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100081', 'MetroPCS', '%s@mymetropcs.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100082', 'Movicom', '%s@movimensaje.com.ar', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100083', 'Mobitel (Sri Lanka)', '%s@sms.mobitel.lk', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100084', 'Movistar (Colombia)', '%s@movistar.com.co', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100085', 'MTN (South Africa)', '%s@sms.co.za', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100086', 'MTS (Canada)', '%s@text.mtsmobility.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100087', 'Nextel (Argentina)', '%s@nextel.net.ar', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100088', 'Orange (Poland)', '%s@orange.pl', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100089', 'Personal (Argentina)', '%s@personal-net.com.ar', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100090', 'Plus GSM (Poland)', '%s@text.plusgsm.pl', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100091', 'President\'s Choice (Canada)', '%s@txt.bell.ca', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100092', 'Qwest', '%s@qwestmp.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100093', 'Rogers (Canada)', '%s@pcs.rogers.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100094', 'Sasktel (Canada)', '%s@sms.sasktel.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100095', 'Setar Mobile email (Aruba)', '%s@mas.aw', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100096', 'Solo Mobile', '%s@txt.bell.ca', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100097', 'Sprint (PCS)', '%s@messaging.sprintpcs.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100098', 'Sprint (Nextel)', '%s@page.nextel.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100099', 'Suncom', '%s@tms.suncom.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100100', 'T-Mobile', '%s@tmomail.net', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100101', 'T-Mobile (Austria)', '%s@sms.t-mobile.at', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100102', 'Telus Mobility (Canada)', '%s@msg.telus.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100103', 'Thumb Cellular', '%s@sms.thumbcellular.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100104', 'Tigo (Formerly Ola)', '%s@sms.tigo.com.co', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100105', 'Unicel', '%s@utext.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100106', 'US Cellular', '%s@email.uscc.net', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100107', 'Verizon', '%s@vtext.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100108', 'Virgin Mobile (Canada)', '%s@vmobile.ca', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100109', 'Virgin Mobile (USA)', '%s@vmobl.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100110', 'YCC', '%s@sms.ycc.ru', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100111', 'Orange (UK)', '%s@orange.net', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100112', 'Cincinnati Bell Wireless', '%s@gocbw.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100113', 'T-Mobile Germany', '%s@t-mobile-sms.de', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100114', 'Vodafone Germany', '%s@vodafone-sms.de', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100115', 'E-Plus', '%s@smsmail.eplus.de', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100116', 'Cellular South', '%s@csouth1.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100117', 'ChinaMobile (139)', '%s@139.com', '2012-12-12 02:32:43', '2012-12-12 02:32:43');
INSERT INTO `sms_carrier` VALUES ('100118', 'Dialog Axiata', '%s@dialog.lk', '2012-12-12 02:32:43', '2012-12-12 02:32:43');

-- ----------------------------
-- Table structure for `subscription`
-- ----------------------------
DROP TABLE IF EXISTS `subscription`;
CREATE TABLE `subscription` (
  `subscriber` int(11) NOT NULL COMMENT 'profile listening',
  `subscribed` int(11) NOT NULL COMMENT 'profile being listened to',
  `jabber` tinyint(4) DEFAULT '1' COMMENT 'deliver jabber messages',
  `sms` tinyint(4) DEFAULT '1' COMMENT 'deliver sms messages',
  `token` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'authorization token',
  `secret` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'token secret',
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'universally unique identifier',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`subscriber`,`subscribed`),
  UNIQUE KEY `subscription_uri_key` (`uri`),
  KEY `subscription_subscriber_idx` (`subscriber`,`created`),
  KEY `subscription_subscribed_idx` (`subscribed`,`created`),
  KEY `subscription_token_idx` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of subscription
-- ----------------------------
INSERT INTO `subscription` VALUES ('1', '1', '1', '1', null, null, null, '2013-01-01 00:00:00', '2013-01-06 13:16:57');
INSERT INTO `subscription` VALUES ('1', '34', '1', '1', null, null, 'tag:www.songeast.com.cn,2013-03-29:statusnet:follow:1:34:2013-03-29T16:03:17+08:00', '2013-03-29 08:03:17', '2013-03-29 16:03:17');
INSERT INTO `subscription` VALUES ('1', '35', '1', '1', null, null, null, '2013-04-01 03:36:36', '2013-04-01 11:36:36');
INSERT INTO `subscription` VALUES ('1', '93', '1', '1', null, null, 'tag:localhost,2013-04-23:statusnet:follow:1:93:2013-04-23T11:24:25+08:00', '2013-04-23 03:24:25', '2013-04-23 11:24:25');
INSERT INTO `subscription` VALUES ('1', '94', '1', '1', null, null, 'tag:localhost,2013-04-23:statusnet:follow:1:94:2013-04-23T11:24:37+08:00', '2013-04-23 03:24:37', '2013-04-23 11:24:37');
INSERT INTO `subscription` VALUES ('1', '95', '1', '1', null, null, 'tag:localhost,2013-04-23:statusnet:follow:1:95:2013-04-23T11:24:40+08:00', '2013-04-23 03:24:40', '2013-04-23 11:24:40');
INSERT INTO `subscription` VALUES ('1', '96', '1', '1', null, null, 'tag:localhost,2013-04-23:statusnet:follow:1:96:2013-04-23T11:24:43+08:00', '2013-04-23 03:24:43', '2013-04-23 11:24:43');
INSERT INTO `subscription` VALUES ('34', '34', '1', '1', null, null, null, '2013-03-28 03:55:31', '2013-03-28 11:55:31');
INSERT INTO `subscription` VALUES ('35', '35', '1', '1', null, null, null, '2013-03-28 03:55:31', '2013-03-28 11:55:31');
INSERT INTO `subscription` VALUES ('36', '36', '1', '1', null, null, null, '2013-03-28 03:55:31', '2013-03-28 11:55:31');
INSERT INTO `subscription` VALUES ('37', '37', '1', '1', null, null, null, '2013-03-28 03:55:31', '2013-03-28 11:55:31');
INSERT INTO `subscription` VALUES ('38', '38', '1', '1', null, null, null, '2013-03-28 03:55:31', '2013-03-28 11:55:31');
INSERT INTO `subscription` VALUES ('39', '39', '1', '1', null, null, null, '2013-03-28 03:55:31', '2013-03-28 11:55:31');
INSERT INTO `subscription` VALUES ('40', '40', '1', '1', null, null, null, '2013-03-28 03:55:31', '2013-03-28 11:55:31');
INSERT INTO `subscription` VALUES ('41', '41', '1', '1', null, null, null, '2013-03-28 03:55:31', '2013-03-28 11:55:31');
INSERT INTO `subscription` VALUES ('42', '42', '1', '1', null, null, null, '2013-03-28 03:55:31', '2013-03-28 11:55:31');
INSERT INTO `subscription` VALUES ('43', '43', '1', '1', null, null, null, '2013-03-28 03:55:31', '2013-03-28 11:55:31');
INSERT INTO `subscription` VALUES ('44', '44', '1', '1', null, null, null, '2013-03-28 03:55:31', '2013-03-28 11:55:31');
INSERT INTO `subscription` VALUES ('45', '45', '1', '1', null, null, null, '2013-03-28 03:55:31', '2013-03-28 11:55:31');
INSERT INTO `subscription` VALUES ('46', '46', '1', '1', null, null, null, '2013-03-28 03:55:31', '2013-03-28 11:55:31');
INSERT INTO `subscription` VALUES ('47', '47', '1', '1', null, null, null, '2013-03-28 03:55:31', '2013-03-28 11:55:31');
INSERT INTO `subscription` VALUES ('48', '48', '1', '1', null, null, null, '2013-03-28 03:55:31', '2013-03-28 11:55:31');
INSERT INTO `subscription` VALUES ('49', '49', '1', '1', null, null, null, '2013-03-28 03:55:31', '2013-03-28 11:55:31');
INSERT INTO `subscription` VALUES ('50', '50', '1', '1', null, null, null, '2013-03-28 03:55:31', '2013-03-28 11:55:31');
INSERT INTO `subscription` VALUES ('51', '51', '1', '1', null, null, null, '2013-03-28 03:55:31', '2013-03-28 11:55:31');
INSERT INTO `subscription` VALUES ('58', '58', '1', '1', null, null, null, '2013-03-28 04:16:29', '2013-03-28 12:16:29');
INSERT INTO `subscription` VALUES ('59', '59', '1', '1', null, null, null, '2013-03-28 04:16:29', '2013-03-28 12:16:29');
INSERT INTO `subscription` VALUES ('60', '60', '1', '1', null, null, null, '2013-03-28 04:16:29', '2013-03-28 12:16:29');
INSERT INTO `subscription` VALUES ('61', '61', '1', '1', null, null, null, '2013-03-28 04:16:29', '2013-03-28 12:16:29');
INSERT INTO `subscription` VALUES ('62', '62', '1', '1', null, null, null, '2013-03-28 04:16:29', '2013-03-28 12:16:29');
INSERT INTO `subscription` VALUES ('63', '63', '1', '1', null, null, null, '2013-03-28 04:16:29', '2013-03-28 12:16:29');
INSERT INTO `subscription` VALUES ('64', '64', '1', '1', null, null, null, '2013-03-28 04:16:29', '2013-03-28 12:16:29');
INSERT INTO `subscription` VALUES ('65', '65', '1', '1', null, null, null, '2013-03-28 04:16:29', '2013-03-28 12:16:29');
INSERT INTO `subscription` VALUES ('66', '66', '1', '1', null, null, null, '2013-03-28 04:16:29', '2013-03-28 12:16:29');
INSERT INTO `subscription` VALUES ('67', '67', '1', '1', null, null, null, '2013-03-28 04:16:29', '2013-03-28 12:16:29');
INSERT INTO `subscription` VALUES ('68', '68', '1', '1', null, null, null, '2013-03-28 04:16:29', '2013-03-28 12:16:29');
INSERT INTO `subscription` VALUES ('69', '69', '1', '1', null, null, null, '2013-03-28 04:16:29', '2013-03-28 12:16:29');
INSERT INTO `subscription` VALUES ('70', '70', '1', '1', null, null, null, '2013-03-28 04:16:29', '2013-03-28 12:16:29');
INSERT INTO `subscription` VALUES ('71', '71', '1', '1', null, null, null, '2013-03-28 04:16:30', '2013-03-28 12:16:30');
INSERT INTO `subscription` VALUES ('72', '72', '1', '1', null, null, null, '2013-03-28 04:16:30', '2013-03-28 12:16:30');
INSERT INTO `subscription` VALUES ('73', '73', '1', '1', null, null, null, '2013-03-28 04:16:30', '2013-03-28 12:16:30');
INSERT INTO `subscription` VALUES ('74', '74', '1', '1', null, null, null, '2013-03-28 04:16:30', '2013-03-28 12:16:30');
INSERT INTO `subscription` VALUES ('75', '75', '1', '1', null, null, null, '2013-04-22 07:57:09', '2013-04-22 15:57:10');
INSERT INTO `subscription` VALUES ('76', '76', '1', '1', null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `subscription` VALUES ('77', '77', '1', '1', null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `subscription` VALUES ('78', '78', '1', '1', null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `subscription` VALUES ('79', '79', '1', '1', null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `subscription` VALUES ('80', '80', '1', '1', null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `subscription` VALUES ('81', '81', '1', '1', null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `subscription` VALUES ('82', '82', '1', '1', null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `subscription` VALUES ('83', '83', '1', '1', null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `subscription` VALUES ('84', '84', '1', '1', null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `subscription` VALUES ('85', '85', '1', '1', null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `subscription` VALUES ('86', '86', '1', '1', null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `subscription` VALUES ('87', '87', '1', '1', null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `subscription` VALUES ('88', '88', '1', '1', null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `subscription` VALUES ('89', '89', '1', '1', null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `subscription` VALUES ('90', '90', '1', '1', null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `subscription` VALUES ('91', '91', '1', '1', null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `subscription` VALUES ('92', '92', '1', '1', null, null, null, '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `subscription` VALUES ('93', '93', '1', '1', null, null, null, '2013-04-22 07:58:50', '2013-04-22 15:58:50');
INSERT INTO `subscription` VALUES ('94', '1', '1', '1', null, null, null, '2013-04-22 08:06:03', '2013-05-10 16:08:08');
INSERT INTO `subscription` VALUES ('95', '1', '1', '1', null, null, 'tag:localhost,2013-04-23:statusnet:follow:95:1:2013-04-23T03:25:24+00:00', '2013-04-23 03:25:24', '2013-04-23 11:25:24');
INSERT INTO `subscription` VALUES ('95', '95', '1', '1', null, null, null, '2013-04-22 08:30:57', '2013-04-22 16:30:57');
INSERT INTO `subscription` VALUES ('96', '96', '1', '1', null, null, null, '2013-04-22 08:35:54', '2013-04-22 16:35:54');
INSERT INTO `subscription` VALUES ('97', '97', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('98', '98', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('99', '99', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('100', '100', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('101', '101', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('102', '102', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('103', '103', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('104', '104', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('105', '105', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('106', '106', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('107', '107', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('108', '108', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('109', '109', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('110', '110', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('111', '111', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('112', '112', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('113', '113', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('114', '114', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('115', '115', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('116', '116', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('117', '117', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('118', '118', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('119', '119', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('120', '120', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('121', '121', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('122', '122', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('123', '123', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('124', '124', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('125', '125', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('126', '126', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('127', '127', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('128', '128', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('129', '129', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('130', '130', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('131', '131', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('132', '132', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('133', '133', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('134', '134', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('135', '135', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `subscription` VALUES ('136', '136', '1', '1', null, null, null, '2013-04-25 08:46:53', '2013-04-25 16:46:54');
INSERT INTO `subscription` VALUES ('137', '137', '1', '1', null, null, null, '2013-04-25 08:46:54', '2013-04-25 16:46:54');

-- ----------------------------
-- Table structure for `subscription_queue`
-- ----------------------------
DROP TABLE IF EXISTS `subscription_queue`;
CREATE TABLE `subscription_queue` (
  `subscriber` int(11) NOT NULL COMMENT 'remote or local profile making the request',
  `subscribed` int(11) NOT NULL COMMENT 'remote or local profile being subscribed to',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  PRIMARY KEY (`subscriber`,`subscribed`),
  KEY `subscription_queue_subscriber_created_idx` (`subscriber`,`created`),
  KEY `subscription_queue_subscribed_created_idx` (`subscribed`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of subscription_queue
-- ----------------------------

-- ----------------------------
-- Table structure for `tagsub`
-- ----------------------------
DROP TABLE IF EXISTS `tagsub`;
CREATE TABLE `tagsub` (
  `tag` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'hash tag associated with this subscription',
  `profile_id` int(11) NOT NULL COMMENT 'profile ID of subscribing user',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  PRIMARY KEY (`tag`,`profile_id`),
  KEY `tagsub_created_idx` (`created`),
  KEY `tagsub_profile_id_tag_idx` (`profile_id`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tagsub
-- ----------------------------

-- ----------------------------
-- Table structure for `token`
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `consumer_key` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'unique identifier, root URL',
  `tok` char(32) COLLATE utf8_bin NOT NULL COMMENT 'identifying value',
  `secret` char(32) COLLATE utf8_bin NOT NULL COMMENT 'secret value',
  `type` tinyint(4) DEFAULT '0' COMMENT 'request or access',
  `state` tinyint(4) DEFAULT '0' COMMENT 'for requests, 0 = initial, 1 = authorized, 2 = used',
  `verifier` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'verifier string for OAuth 1.0a',
  `verified_callback` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'verified callback URL for OAuth 1.0a',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`consumer_key`,`tok`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of token
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL COMMENT 'foreign key to profile table',
  `nickname` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'nickname or username, duped in profile',
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'salted password, can be null for OpenID users',
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'email address for password recovery etc.',
  `incomingemail` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'email address for post-by-email',
  `emailnotifysub` tinyint(4) DEFAULT '1' COMMENT 'Notify by email of subscriptions',
  `emailnotifyfav` tinyint(4) DEFAULT '1' COMMENT 'Notify by email of favorites',
  `emailnotifynudge` tinyint(4) DEFAULT '1' COMMENT 'Notify by email of nudges',
  `emailnotifymsg` tinyint(4) DEFAULT '1' COMMENT 'Notify by email of direct messages',
  `emailnotifyattn` tinyint(4) DEFAULT '1' COMMENT 'Notify by email of @-replies',
  `emailmicroid` tinyint(4) DEFAULT '1' COMMENT 'whether to publish email microid',
  `language` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'preferred language',
  `timezone` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'timezone',
  `emailpost` tinyint(4) DEFAULT '1' COMMENT 'Post by email',
  `sms` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'sms phone number',
  `carrier` int(11) DEFAULT NULL COMMENT 'foreign key to sms_carrier',
  `smsnotify` tinyint(4) DEFAULT '0' COMMENT 'whether to send notices to SMS',
  `smsreplies` tinyint(4) DEFAULT '0' COMMENT 'whether to send notices to SMS on replies',
  `smsemail` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'built from sms and carrier',
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'universally unique identifier, usually a tag URI',
  `autosubscribe` tinyint(4) DEFAULT '0' COMMENT 'automatically subscribe to users who subscribe to us',
  `subscribe_policy` tinyint(4) DEFAULT '0' COMMENT '0 = anybody can subscribe; 1 = require approval',
  `urlshorteningservice` varchar(50) COLLATE utf8_bin DEFAULT 'internal' COMMENT 'service to use for auto-shortening URLs',
  `inboxed` tinyint(4) DEFAULT '0' COMMENT 'has an inbox been created for this user?',
  `private_stream` tinyint(4) DEFAULT '0' COMMENT 'whether to limit all notices to followers only',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_nickname_key` (`nickname`),
  UNIQUE KEY `user_email_key` (`email`),
  UNIQUE KEY `user_incomingemail_key` (`incomingemail`),
  UNIQUE KEY `user_sms_key` (`sms`),
  UNIQUE KEY `user_uri_key` (`uri`),
  KEY `user_smsemail_idx` (`smsemail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'aaa42296669b958c3cee6c0475c8093e', 'admin@163.com', null, '1', '1', '1', '1', '1', '1', 'zh_CN', 'Asia/Shanghai', '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/1', '0', '0', 'internal', '1', '0', '2012-12-11 18:32:44', '2013-03-29 15:54:57');
INSERT INTO `user` VALUES ('75', 'conglin', '260ffc5e6fce4769d27b9b8c44975d21', '1111@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/75', '0', '0', 'internal', '1', '0', '2013-04-22 07:57:09', '2013-04-22 15:57:09');
INSERT INTO `user` VALUES ('76', 'qianhiju', 'd702af1d701d104102bc3b3c4292a803', '2222@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/76', '0', '0', 'internal', '1', '0', '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `user` VALUES ('77', 'shenlizhong', 'c5fde9de2d29789a81d1bc0f16292048', '3333@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/77', '0', '0', 'internal', '1', '0', '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `user` VALUES ('78', 'qixiaoying', '25d55ad283aa400af464c76d713c07ad', '4444@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/78', '0', '0', 'internal', '1', '0', '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `user` VALUES ('79', 'meileijun', 'defac44447b57f152d14f30cea7a73cb', '5555@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/79', '0', '0', 'internal', '1', '0', '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `user` VALUES ('80', 'zhaoyongzheng2', '2661b5362e4eed2c62d90080b91b329e', '6666@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/80', '0', '0', 'internal', '1', '0', '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `user` VALUES ('81', 'conglin2', '1ee0a8ce9cd7e6971096ac9159260bf3', '7777@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/81', '0', '0', 'internal', '1', '0', '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `user` VALUES ('82', 'qianzhijun2', '0d03d82b38e113235438d28869ee5e68', '8888@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/82', '0', '0', 'internal', '1', '0', '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `user` VALUES ('83', 'shenlizhong2', 'b95a0a3ece23cf05504f534b393cc3dd', '9999@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/83', '0', '0', 'internal', '1', '0', '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `user` VALUES ('84', 'qixiaoying2', 'e56f4a4aba940cbcb698827842627e7e', '11110@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/84', '0', '0', 'internal', '1', '0', '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `user` VALUES ('85', 'meileijun2', 'ee8514b13cc97f5fd93fa9527770cea9', '12221@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/85', '0', '0', 'internal', '1', '0', '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `user` VALUES ('86', 'chenhuanghai2', 'c3f2fb0e3007b13d105252477584806e', '13332@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/86', '0', '0', 'internal', '1', '0', '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `user` VALUES ('87', 'wangjiareng', '95d47be0d380a7cd3bb5bbe78e8bed49', '14443@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/87', '0', '0', 'internal', '1', '0', '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `user` VALUES ('88', 'shenchen', 'c8db0979bd866d9bb822ce3ae7c7da33', '15554@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/88', '0', '0', 'internal', '1', '0', '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `user` VALUES ('89', 'zhujiali', '6c8e7923f116a85dd3ed7fafd7353b5a', '16665@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/89', '0', '0', 'internal', '1', '0', '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `user` VALUES ('90', 'xujiaofei', '5d01ca6f0cad42194b6f4ea7d510588b', '17776@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/90', '0', '0', 'internal', '1', '0', '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `user` VALUES ('91', 'zhuyanli', 'f7eedb5ae6a1d26a5cc71dbcbc4fab69', '18887@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/91', '0', '0', 'internal', '1', '0', '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `user` VALUES ('92', 'xuhongqing', '3820b6ecf986508b369bba8f1c1a9400', '19998@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/92', '0', '0', 'internal', '1', '0', '2013-04-22 07:57:10', '2013-04-22 15:57:10');
INSERT INTO `user` VALUES ('93', 'yangfany', '4c2d04feab2850173ffa93529a4b0ae5', '7999997999977@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/93', '0', '0', 'internal', '1', '0', '2013-04-22 07:58:50', '2013-04-22 15:58:50');
INSERT INTO `user` VALUES ('94', 'yangfanyf', '72c7c87e21639bca2de4f2dcbdd63328', '79909997999977@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/94', '0', '0', 'internal', '1', '0', '2013-04-22 08:06:03', '2013-04-22 16:06:03');
INSERT INTO `user` VALUES ('95', 'lyb', '9d557124196302eea8f49cd6ff2b08ea', '934471980@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/95', '0', '0', 'internal', '1', '0', '2013-04-22 08:30:57', '2013-04-22 16:30:57');
INSERT INTO `user` VALUES ('96', 'kyle', '4288bbe19c0bddcb4dd3e079373278b4', '9344941980@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/96', '0', '0', 'internal', '1', '0', '2013-04-22 08:35:54', '2013-04-22 16:35:54');
INSERT INTO `user` VALUES ('97', 'weimu', '78172858eac0ed8c174c9f08e2021e31', 'sinemail1@163.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/97', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('98', 'zangchen', 'c21dd89d926c7fba6f4e60e2baf74963', 'sinemail2@163.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/98', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('99', 'xiaxinwen', '64974ce4b30f7099e6c84ddeb579fa2c', 'sinemail3@163.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/99', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('100', 'liuyun', '46dd4ef947c3224427e3e9d4a0bb5ea1', 'sinemail4@163.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/100', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('101', 'zhanglu', 'af5f85073b675cca689a1654982bd418', 'sinemail5@163.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/101', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('102', 'linyali', 'd4290b0941022bda9ae1e6b7cf53e0b4', '99895466a4ds@163.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/102', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('103', 'shenguangyu', '34c2db44276a31586630839db775f9c9', '1111@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/103', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('104', 'wangyuting', '9b59b492f69cf9519af7cd18e774cf1d', '2222@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/104', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('105', 'chenye', 'f5e6d8665e3062235f65dfbcfefdca96', '3333@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/105', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('106', 'wujie', 'db42f3c2048bf68e0e4ed1e8388256a6', '4444@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/106', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('107', 'lilingling', 'ccaa5d979128c0bcab8b5b8f021bedce', '5555@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/107', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('108', 'sunshasha', 'a866e0577e714b8048669a403fb3bb6d', '6666@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/108', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('109', 'lvzunjin', 'c4299979ea2603da9c5d8a0b455c4428', '7777@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/109', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('110', 'chenzhen', '746af26a49066ee861e5564a76c2c13e', '8888@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/110', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('111', 'liyin', '490874df393be07d46b1cfdc7aa88037', '9999@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/111', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('112', 'liusen', '8bfa1a68eb8670d1a591ea70373c45b1', '11110@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/112', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('113', 'huhaiyan', 'dcb59c8e921feafb238d5b2abadbc8da', '12221@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/113', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('114', 'liuhuimin', '80dbe11334e12f9710fc7822b39414fe', '13332@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/114', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('115', 'liuyabin', '195d790cb72d7f8ff84d292aa5e6fb31', '14443@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/115', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('116', 'zhangyu', '66a89264893baa775b5ac8936786ed76', '15554@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/116', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('117', 'miaocui', '74a69de6fce7881e3aafb0c4766fab28', '16665@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/117', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('118', 'wangbingxue', '813937e981cbed6cf15965d8075535d8', '17776@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/118', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('119', 'zhaoting', 'a15bef8d2812c8920450eeabdcf991e4', '18887@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/119', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('120', 'liyongdi', '83fb2bdd77e9bac7a282b2be5d43e1dd', '19998@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/120', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('121', 'wangshiliang', '8b5df1538d32489e32043705de5573f0', '21109@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/121', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('122', 'fanwenling', '2821ccaf8fee1f3094f19f5033e5e65c', '22220@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/122', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('123', 'liuxingrong', '579d9ec9d0c3d687aaa91289ac2854e4', '23331@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/123', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('124', 'litingting', '663f8fba6fe0703f0b5686057f46b666', '24442@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/124', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('125', 'zhaolinan', 'd39d9979f71ac0f80759ddcdcd2309ed', '25553@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/125', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('126', 'qiujinlan', '2e95dd520546214e33806d0be6a6a720', '26664@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/126', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('127', 'mengchenyan', '410e4e9a5b0f075bbbcc0cfd30bfd1c3', '27775@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/127', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('128', 'wangfang', '8ed708acee69189b8c644755b515b9fb', '28886@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/128', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('129', 'sunyawei', '71170dcc87f4b79480918663721ab98e', '29997@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/129', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('130', 'liuyang', '2c17ebe0ab9d5d33d94fe0883383934d', '31108@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/130', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('131', 'zhanmin', '0404462f35546e362c8eb5fe7db9a340', '32219@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/131', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('132', 'zhangting', 'a11fd61100e0b94c84c0f738dd1c17da', '33330@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/132', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('133', 'yanshiwei', 'd6c90db5839fd343aa6f68b17c1bcc70', '34441@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/133', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('134', 'chenxiaohe', 'a3828e24ad0f1a6461bb37eb2090fe1c', '35552@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/134', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('135', 'yangling', '3be4b37ab6969bfa4bfe8fc503575b13', '36663@www.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/135', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-25 16:46:53');
INSERT INTO `user` VALUES ('136', 'wangjun', '12916437188baa6b875bddc5653ec3a2', '126341s8541@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/136', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:53', '2013-04-26 11:48:56');
INSERT INTO `user` VALUES ('137', 'liaochunyuan', 'a8e154ec36f41266f74d6c2b18232765', '987zzz@qq.com', null, '1', '1', '1', '1', '1', '1', null, null, '1', null, null, '0', '0', null, 'http://localhost/statusnet/index.php/user/137', '0', '0', 'internal', '1', '0', '2013-04-25 08:46:54', '2013-04-26 14:40:29');

-- ----------------------------
-- Table structure for `user_group`
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique identifier',
  `nickname` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'nickname for addressing',
  `fullname` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'display name',
  `homepage` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'URL, cached so we dont regenerate',
  `description` text COLLATE utf8_bin COMMENT 'group description',
  `location` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'related physical location, if any',
  `original_logo` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'original size logo',
  `homepage_logo` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'homepage (profile) size logo',
  `stream_logo` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'stream-sized logo',
  `mini_logo` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'mini logo',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'universal identifier',
  `mainpage` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'page for group info to link to',
  `join_policy` tinyint(4) DEFAULT NULL COMMENT '0=open; 1=requires admin approval',
  `force_scope` tinyint(4) DEFAULT NULL COMMENT '0=never,1=sometimes,-1=always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_group_uri_key` (`uri`),
  KEY `user_group_nickname_idx` (`nickname`),
  KEY `nickname` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES ('48', 'y201303', '三班', null, null, null, null, null, null, null, '2013-04-22 07:51:54', '2013-04-22 15:51:54', 'http://localhost/statusnet/index.php/group/48/id', 'http://localhost/statusnet/index.php/group/y201303/1', '0', '0');
INSERT INTO `user_group` VALUES ('49', 'y201304', '四班', null, null, null, null, null, null, null, '2013-04-22 07:51:55', '2013-04-22 15:51:55', 'http://localhost/statusnet/index.php/group/49/id', 'http://localhost/statusnet/index.php/group/y201304/1', '0', '0');
INSERT INTO `user_group` VALUES ('50', 'y201305', '五班', null, 0xE8889EE4BCB4E698AFE4B880E4B8AAE5BE88E7899BE79A84E78FADE7BAA7EFBC81, null, null, null, null, null, '2013-04-25 08:44:50', '2013-04-25 16:46:12', 'http://localhost/statusnet/index.php/group/50/id', 'http://localhost/statusnet/index.php/group/y201305/1', '0', '0');
INSERT INTO `user_group` VALUES ('51', 'y201306', '六班', null, null, null, null, null, null, null, '2013-04-25 08:50:48', '2013-04-25 16:50:48', 'http://localhost/statusnet/index.php/group/51/id', 'http://localhost/statusnet/index.php/group/y201306/1', '0', '0');

-- ----------------------------
-- Table structure for `user_im_prefs`
-- ----------------------------
DROP TABLE IF EXISTS `user_im_prefs`;
CREATE TABLE `user_im_prefs` (
  `user_id` int(11) NOT NULL COMMENT 'user',
  `screenname` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'screenname on this service',
  `transport` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'transport (ex xmpp, aim)',
  `notify` tinyint(4) DEFAULT '0' COMMENT 'Notify when a new notice is sent',
  `replies` tinyint(4) DEFAULT '0' COMMENT 'Send replies  from people not subscribed to',
  `microid` tinyint(4) DEFAULT '1' COMMENT 'Publish a MicroID',
  `updatefrompresence` tinyint(4) DEFAULT '0' COMMENT 'Send replies from people not subscribed to.',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`user_id`,`transport`),
  UNIQUE KEY `transport_screenname_key` (`transport`,`screenname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_im_prefs
-- ----------------------------

-- ----------------------------
-- Table structure for `user_location_prefs`
-- ----------------------------
DROP TABLE IF EXISTS `user_location_prefs`;
CREATE TABLE `user_location_prefs` (
  `user_id` int(11) NOT NULL COMMENT 'user who has the preference',
  `share_location` tinyint(4) DEFAULT '1' COMMENT 'Whether to share location data',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_location_prefs
-- ----------------------------

-- ----------------------------
-- Table structure for `user_openid`
-- ----------------------------
DROP TABLE IF EXISTS `user_openid`;
CREATE TABLE `user_openid` (
  `canonical` varchar(255) COLLATE utf8_bin NOT NULL,
  `display` varchar(255) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`canonical`),
  UNIQUE KEY `user_openid_display_idx` (`display`),
  KEY `user_openid_user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_openid
-- ----------------------------

-- ----------------------------
-- Table structure for `user_openid_trustroot`
-- ----------------------------
DROP TABLE IF EXISTS `user_openid_trustroot`;
CREATE TABLE `user_openid_trustroot` (
  `trustroot` varchar(255) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`trustroot`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_openid_trustroot
-- ----------------------------

-- ----------------------------
-- Table structure for `user_urlshortener_prefs`
-- ----------------------------
DROP TABLE IF EXISTS `user_urlshortener_prefs`;
CREATE TABLE `user_urlshortener_prefs` (
  `user_id` int(11) NOT NULL COMMENT 'user',
  `urlshorteningservice` varchar(50) COLLATE utf8_bin DEFAULT 'internal' COMMENT 'service to use for auto-shortening URLs',
  `maxurllength` int(11) NOT NULL COMMENT 'urls greater than this length will be shortened, 0 = always, null = never',
  `maxnoticelength` int(11) NOT NULL COMMENT 'notices with content greater than this value will have all urls shortened, 0 = always, null = never',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_urlshortener_prefs
-- ----------------------------
