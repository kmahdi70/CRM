/*
Navicat MySQL Data Transfer

Source Server         : localhot
Source Server Version : 100116
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 100116
File Encoding         : 65001

Date: 2018-08-07 09:12:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', 'آذربایجان شرقی');
INSERT INTO `province` VALUES ('2', 'آذربایجان غربی');
INSERT INTO `province` VALUES ('3', 'اردبیل');
INSERT INTO `province` VALUES ('4', 'اصفهان');
INSERT INTO `province` VALUES ('5', 'البرز');
INSERT INTO `province` VALUES ('6', 'ایلام');
INSERT INTO `province` VALUES ('7', 'بوشهر');
INSERT INTO `province` VALUES ('8', 'تهران');
INSERT INTO `province` VALUES ('9', 'چهارمحال وبختیاری');
INSERT INTO `province` VALUES ('10', 'خراسان جنوبی');
INSERT INTO `province` VALUES ('11', 'خراسان رضوی');
INSERT INTO `province` VALUES ('12', 'خراسان شمالی');
INSERT INTO `province` VALUES ('13', 'خوزستان');
INSERT INTO `province` VALUES ('14', 'زنجان');
INSERT INTO `province` VALUES ('15', 'سمنان');
INSERT INTO `province` VALUES ('16', 'سیستان وبلوچستان');
INSERT INTO `province` VALUES ('17', 'فارس');
INSERT INTO `province` VALUES ('18', 'قزوین');
INSERT INTO `province` VALUES ('19', 'قم');
INSERT INTO `province` VALUES ('20', 'کردستان');
INSERT INTO `province` VALUES ('21', 'کرمان');
INSERT INTO `province` VALUES ('22', 'کرمانشاه');
INSERT INTO `province` VALUES ('23', 'کهگیلویه وبویراحمد');
INSERT INTO `province` VALUES ('24', 'گلستان');
INSERT INTO `province` VALUES ('25', 'گیلان');
INSERT INTO `province` VALUES ('26', 'لرستان');
INSERT INTO `province` VALUES ('27', 'مازندران');
INSERT INTO `province` VALUES ('28', 'مرکزی');
INSERT INTO `province` VALUES ('29', 'هرمزگان');
INSERT INTO `province` VALUES ('30', 'همدان');
INSERT INTO `province` VALUES ('31', 'یزد');
