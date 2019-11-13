/*
Navicat MySQL Data Transfer

Source Server         : Graduation
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : fireraise

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2019-11-13 10:15:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `applican`
-- ----------------------------
DROP TABLE IF EXISTS `applican`;
CREATE TABLE `applican` (
  `id` varchar(20) NOT NULL COMMENT '申请id',
  `userId` varchar(20) NOT NULL COMMENT '项目申请人的id',
  `beginDate` varchar(10) NOT NULL COMMENT '项目开始时间(以审核通过的时间为准)，字符串格式：xxxx-xx-xx',
  `endDate` varchar(10) DEFAULT NULL COMMENT '申请结束时间(自动结束的时间或者主动结束的时间或者管理员冻结的时间)，字符串格式为：xxxx-xx-xx',
  `avilable` int(11) NOT NULL DEFAULT '0' COMMENT '项目中可以提取的资金金额',
  `money` int(11) NOT NULL DEFAULT '0' COMMENT '项目中总筹集的金额',
  `state` bit(1) DEFAULT NULL COMMENT '项目的状态：未激活：null；已激活：true；已结束(或冻结)：false',
  `text` varchar(1500) NOT NULL COMMENT '项目的文字描述',
  `picture1` varchar(20) NOT NULL COMMENT '项目描述图片1，同时也是展示图片',
  `picture2` varchar(20) DEFAULT NULL COMMENT '项目描述图片2',
  `picture3` varchar(20) DEFAULT NULL COMMENT '项目描述图片3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of applican
-- ----------------------------

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` varchar(20) NOT NULL DEFAULT '' COMMENT '管理员id',
  `phone` varchar(11) NOT NULL COMMENT '管理员手机号',
  `password` varchar(20) NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------

-- ----------------------------
-- Table structure for `recard`
-- ----------------------------
DROP TABLE IF EXISTS `recard`;
CREATE TABLE `recard` (
  `id` varchar(20) NOT NULL COMMENT '操作记录id',
  `userId` varchar(20) NOT NULL COMMENT '操作发起人id',
  `appId` varchar(20) NOT NULL COMMENT '操作项目的id',
  `money` int(11) NOT NULL COMMENT '操作金额',
  `type` bit(1) NOT NULL COMMENT '操作的类型：捐款：true；提现：false',
  `date` varchar(10) NOT NULL COMMENT '操作发起时间，字符串格式为：xxxx-xx-xx',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recard
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(20) NOT NULL COMMENT '用户id',
  `name` varchar(10) NOT NULL COMMENT '用户名',
  `phone` varchar(11) NOT NULL COMMENT '用户名',
  `email` varchar(20) NOT NULL COMMENT '用户邮箱',
  `password` varchar(20) NOT NULL COMMENT '账号密码',
  `money` int(11) NOT NULL COMMENT '用户账号的金额',
  `bankcard` varchar(20) NOT NULL COMMENT '用户银行卡卡号',
  `state` bit(1) NOT NULL COMMENT '用户账号的状态：未审核：null；审核通过：true；冻结：false',
  `IDCard` varchar(20) NOT NULL COMMENT '用户身份证号',
  `IDCardPicture1` varchar(20) NOT NULL COMMENT '用户身份证正面照片',
  `IDCardPicture2` varchar(20) NOT NULL COMMENT '用户身份证背面照片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
