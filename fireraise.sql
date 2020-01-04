/*
Navicat MySQL Data Transfer

Source Server         : spring
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : fireraise

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2020-01-05 00:57:39
*/

CREATE DATEBASE fireraise;

USE fireraise;

-- ----------------------------
-- Table structure for `applican`
-- ----------------------------
DROP TABLE IF EXISTS `applican`;
CREATE TABLE `applican` (
  `id` varchar(20) NOT NULL COMMENT '申请id',
  `name` varchar(20) NOT NULL,
  `userId` varchar(20) NOT NULL COMMENT '项目申请人的id',
  `beginDate` varchar(20) NOT NULL COMMENT '项目开始时间(以审核通过的时间为准)，字符串格式：xxxx-xx-xx',
  `endDate` varchar(20) DEFAULT NULL COMMENT '申请结束时间(自动结束的时间或者主动结束的时间或者管理员冻结的时间)，字符串格式为：xxxx-xx-xx',
  `avilable` int(11) DEFAULT '0' COMMENT '项目中可以提取的资金金额',
  `money` int(11) DEFAULT '0' COMMENT '项目中总筹集的金额',
  `target` int(11) NOT NULL COMMENT '项目的目标金额',
  `state` tinyint(4) NOT NULL COMMENT '项目的状态  正常:1;未审核:0;已完成:2;已冻结:3;已停止:4;审核未通过：5',
  `text` varchar(1500) NOT NULL COMMENT '项目的文字描述',
  `picture1` varchar(20) NOT NULL COMMENT '项目描述图片1，同时也是展示图片',
  `picture2` varchar(20) DEFAULT NULL COMMENT '项目描述图片2',
  `picture3` varchar(20) DEFAULT NULL COMMENT '项目描述图片3',
  `userPhone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `bankcard`
-- ----------------------------
DROP TABLE IF EXISTS `bankcard`;
CREATE TABLE `bankcard` (
  `id` varchar(20) NOT NULL COMMENT '银行卡号',
  `name` varchar(20) NOT NULL COMMENT '银行卡名',
  `number` varchar(20) NOT NULL COMMENT '银行卡号',
  `userId` varchar(20) NOT NULL COMMENT '银行卡持有人Id',
  `password` varchar(20) NOT NULL COMMENT '银行卡支付密码,六位纯数字',
  `money` int(11) NOT NULL COMMENT '银行卡现有金额',
  `state` bit(1) NOT NULL COMMENT '银行卡状态  正常：true； 冻结：false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `bill`
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` varchar(255) NOT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `begin` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `money` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` varchar(20) NOT NULL DEFAULT '' COMMENT '管理员id',
  `phone` varchar(11) NOT NULL COMMENT '管理员手机号',
  `password` varchar(35) NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(20) NOT NULL COMMENT '用户id',
  `name` varchar(20) NOT NULL COMMENT '用户名',
  `date` varchar(20) NOT NULL COMMENT '用户注册日期',
  `phone` varchar(11) NOT NULL COMMENT '用户名',
  `email` varchar(30) NOT NULL COMMENT '用户邮箱',
  `mailState` bit(1) NOT NULL COMMENT '账号邮箱的状态  true：已激活；false：未激活',
  `password` varchar(35) NOT NULL COMMENT '账号密码',
  `money` int(11) NOT NULL COMMENT '用户账号的金额',
  `state` tinyint(1) NOT NULL COMMENT '用户账号的状态：未实名：0；未审核：1；已审核：2；已冻结：3；审核未通过：4',
  `IDCard` varchar(20) DEFAULT NULL COMMENT '用户身份证号',
  `IDCard1` varchar(20) DEFAULT NULL,
  `IDCard2` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;