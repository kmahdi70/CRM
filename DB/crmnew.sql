/*
Navicat MySQL Data Transfer

Source Server         : localhot
Source Server Version : 100116
Source Host           : localhost:3306
Source Database       : crmnew

Target Server Type    : MYSQL
Target Server Version : 100116
File Encoding         : 65001

Date: 2018-08-23 15:24:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `AID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `User_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LN` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Mobile` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` char(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', '1', 'مهدی', 'کریمیان', null, null, null, '356a192b7913b04c54574d18c28d46e6395428ab');

-- ----------------------------
-- Table structure for agent_email
-- ----------------------------
DROP TABLE IF EXISTS `agent_email`;
CREATE TABLE `agent_email` (
  `AID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Agent_ID` int(10) unsigned DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AID`),
  KEY `Agent_ID` (`Agent_ID`),
  CONSTRAINT `agent_email_ibfk_1` FOREIGN KEY (`Agent_ID`) REFERENCES `company_agent` (`AID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of agent_email
-- ----------------------------
INSERT INTO `agent_email` VALUES ('3', '96', 'asdsas@lasjks.com');
INSERT INTO `agent_email` VALUES ('4', '96', 'sad@asdass.net');
INSERT INTO `agent_email` VALUES ('5', '98', 'asdsas');
INSERT INTO `agent_email` VALUES ('6', '98', 'asdas');
INSERT INTO `agent_email` VALUES ('7', '100', 'a@b.io');
INSERT INTO `agent_email` VALUES ('8', '102', '2');
INSERT INTO `agent_email` VALUES ('9', '102', '1');
INSERT INTO `agent_email` VALUES ('10', '103', '1');
INSERT INTO `agent_email` VALUES ('11', '104', '2');
INSERT INTO `agent_email` VALUES ('12', '104', '1');

-- ----------------------------
-- Table structure for agent_fax
-- ----------------------------
DROP TABLE IF EXISTS `agent_fax`;
CREATE TABLE `agent_fax` (
  `AID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Agent_ID` int(10) unsigned DEFAULT NULL,
  `Code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fax` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AID`),
  KEY `Agent_ID` (`Agent_ID`),
  CONSTRAINT `agent_fax_ibfk_1` FOREIGN KEY (`Agent_ID`) REFERENCES `company_agent` (`AID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of agent_fax
-- ----------------------------
INSERT INTO `agent_fax` VALUES ('15', '96', '021', '1111');
INSERT INTO `agent_fax` VALUES ('16', '96', '021', '22222');
INSERT INTO `agent_fax` VALUES ('17', '97', 'asd', 'asd');
INSERT INTO `agent_fax` VALUES ('18', '98', 'sad', 'asd');
INSERT INTO `agent_fax` VALUES ('19', '98', 'd', 'f');
INSERT INTO `agent_fax` VALUES ('20', '99', '3', '123');
INSERT INTO `agent_fax` VALUES ('21', '101', '8', '8');
INSERT INTO `agent_fax` VALUES ('22', '102', '2', '2');
INSERT INTO `agent_fax` VALUES ('23', '102', '1', '1');
INSERT INTO `agent_fax` VALUES ('24', '103', '1', '1');
INSERT INTO `agent_fax` VALUES ('25', '104', '2', '2');
INSERT INTO `agent_fax` VALUES ('26', '104', '1', '1');

-- ----------------------------
-- Table structure for agent_internal
-- ----------------------------
DROP TABLE IF EXISTS `agent_internal`;
CREATE TABLE `agent_internal` (
  `AID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Agent_ID` int(10) unsigned DEFAULT NULL,
  `Internal` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AID`),
  KEY `Agent_ID` (`Agent_ID`),
  CONSTRAINT `agent_internal_ibfk_1` FOREIGN KEY (`Agent_ID`) REFERENCES `company_agent` (`AID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of agent_internal
-- ----------------------------
INSERT INTO `agent_internal` VALUES ('16', '96', '125');
INSERT INTO `agent_internal` VALUES ('17', '96', '122');
INSERT INTO `agent_internal` VALUES ('18', '96', '110');
INSERT INTO `agent_internal` VALUES ('19', '98', 'g');
INSERT INTO `agent_internal` VALUES ('20', '100', '105');
INSERT INTO `agent_internal` VALUES ('21', '100', '106');
INSERT INTO `agent_internal` VALUES ('22', '102', '2');
INSERT INTO `agent_internal` VALUES ('23', '102', '1');
INSERT INTO `agent_internal` VALUES ('24', '103', '1');
INSERT INTO `agent_internal` VALUES ('25', '104', '4');
INSERT INTO `agent_internal` VALUES ('26', '104', '2');
INSERT INTO `agent_internal` VALUES ('27', '104', '3');

-- ----------------------------
-- Table structure for agent_mobile
-- ----------------------------
DROP TABLE IF EXISTS `agent_mobile`;
CREATE TABLE `agent_mobile` (
  `AID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Agent_ID` int(10) unsigned DEFAULT NULL,
  `Mobile` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AID`),
  KEY `Agent_ID` (`Agent_ID`),
  CONSTRAINT `agent_mobile_ibfk_1` FOREIGN KEY (`Agent_ID`) REFERENCES `company_agent` (`AID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of agent_mobile
-- ----------------------------
INSERT INTO `agent_mobile` VALUES ('3', '96', '091312');
INSERT INTO `agent_mobile` VALUES ('4', '96', '061213');
INSERT INTO `agent_mobile` VALUES ('5', '97', 'asd');
INSERT INTO `agent_mobile` VALUES ('6', '98', '2312');
INSERT INTO `agent_mobile` VALUES ('7', '100', '2342');
INSERT INTO `agent_mobile` VALUES ('8', '100', '23432');
INSERT INTO `agent_mobile` VALUES ('9', '100', '33');
INSERT INTO `agent_mobile` VALUES ('10', '101', '9');
INSERT INTO `agent_mobile` VALUES ('11', '101', '9');
INSERT INTO `agent_mobile` VALUES ('12', '101', '9');
INSERT INTO `agent_mobile` VALUES ('13', '101', '9');
INSERT INTO `agent_mobile` VALUES ('14', '102', '2');
INSERT INTO `agent_mobile` VALUES ('15', '102', '1');
INSERT INTO `agent_mobile` VALUES ('16', '103', '1');
INSERT INTO `agent_mobile` VALUES ('17', '104', '6');
INSERT INTO `agent_mobile` VALUES ('18', '104', '3');
INSERT INTO `agent_mobile` VALUES ('19', '104', '4');

-- ----------------------------
-- Table structure for agent_tell
-- ----------------------------
DROP TABLE IF EXISTS `agent_tell`;
CREATE TABLE `agent_tell` (
  `AID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Agent_ID` int(10) unsigned DEFAULT NULL,
  `Code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tell` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AID`),
  KEY `Agent_ID` (`Agent_ID`),
  CONSTRAINT `agent_tell_ibfk_1` FOREIGN KEY (`Agent_ID`) REFERENCES `company_agent` (`AID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of agent_tell
-- ----------------------------
INSERT INTO `agent_tell` VALUES ('14', '96', '011', '645654');
INSERT INTO `agent_tell` VALUES ('15', '96', '021', '31323');
INSERT INTO `agent_tell` VALUES ('16', '100', 'd', 'd');
INSERT INTO `agent_tell` VALUES ('17', '100', 'f', 'd');
INSERT INTO `agent_tell` VALUES ('18', '100', '3', '33');
INSERT INTO `agent_tell` VALUES ('19', '101', '7', '7');
INSERT INTO `agent_tell` VALUES ('20', '101', '5', '5');
INSERT INTO `agent_tell` VALUES ('21', '101', '6', '6');
INSERT INTO `agent_tell` VALUES ('22', '102', '2', '2');
INSERT INTO `agent_tell` VALUES ('23', '102', '1', '1');
INSERT INTO `agent_tell` VALUES ('24', '103', '3', '3');
INSERT INTO `agent_tell` VALUES ('25', '103', '1', '1');
INSERT INTO `agent_tell` VALUES ('26', '103', '2', '2');
INSERT INTO `agent_tell` VALUES ('27', '104', 's', 's');
INSERT INTO `agent_tell` VALUES ('28', '104', 'a', 'a');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `CID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'سایر');
INSERT INTO `category` VALUES ('2', 'الکترونیکی');
INSERT INTO `category` VALUES ('3', 'بانکی');
INSERT INTO `category` VALUES ('4', 'مواد غذایی');

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `CID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Brand` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Register` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'شماره ثبت',
  `Type` enum('نا مشخص','با مسئولیت محدود','سهامی خاص','سهامی عام','تضامنی','مختلط غیرسهامی','مختلط سهامی','تعاونی','نسبی') COLLATE utf8_unicode_ci DEFAULT NULL,
  `SubCategory_ID` int(10) unsigned DEFAULT NULL,
  `Site` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Category` enum('شخص حقیقی','شخص حقوقی') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CID`),
  KEY `company_ibfk_2` (`SubCategory_ID`),
  CONSTRAINT `company_ibfk_2` FOREIGN KEY (`SubCategory_ID`) REFERENCES `subcategory` (`SCID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('231', 'نام شرکت', 'کاله', '12312', 'تضامنی', '2', 'kale.com', 'شخص حقوقی', 'info@kale.com', 'desc', '2018-08-16 10:14:08');
INSERT INTO `company` VALUES ('232', 'نام شرکت', 'ljdfk', '', 'نا مشخص', '1', '', 'شخص حقوقی', '', 'asd', '2018-08-16 10:14:09');
INSERT INTO `company` VALUES ('233', 'نام شرکت', 'fsdfd', '', 'نا مشخص', '1', '', 'شخص حقوقی', '', 'dfd', '2018-08-16 10:14:10');
INSERT INTO `company` VALUES ('234', 'نام شرکت', 'f', '', 'نا مشخص', '1', '', 'شخص حقوقی', '', 'xcvx', '2018-08-16 10:14:11');
INSERT INTO `company` VALUES ('235', 'نام شرکت', 'fsd', '', 'نا مشخص', '1', '', 'شخص حقوقی', '', 'fghfg', '2018-08-16 10:14:12');
INSERT INTO `company` VALUES ('236', 'نام شرکت', 'sdf', '', 'نا مشخص', '1', '', 'شخص حقوقی', '', 'mbnb', '2018-08-16 10:14:13');
INSERT INTO `company` VALUES ('237', 'نام شرکت', 'sdfsd', '', 'نا مشخص', '1', '', 'شخص حقوقی', '', 'jtyuy', '2018-08-16 10:14:15');
INSERT INTO `company` VALUES ('238', 'نام شرکت', 'sdf', null, null, '1', 'asdas', 'شخص حقوقی', null, 'asdsasdasd', '2018-08-16 10:14:14');
INSERT INTO `company` VALUES ('239', 'نام شرکت', 'www', null, null, '1', 'www', 'شخص حقیقی', null, 'wwwwww', '2018-08-16 10:14:16');
INSERT INTO `company` VALUES ('240', 'ایسوس', '', '', 'نا مشخص', '1', '', 'شخص حقوقی', '', '', '2018-08-21 12:45:04');
INSERT INTO `company` VALUES ('241', 'titan', '', '', 'نا مشخص', '1', '', 'شخص حقوقی', '', '', '2018-08-21 16:09:10');

-- ----------------------------
-- Table structure for company_address
-- ----------------------------
DROP TABLE IF EXISTS `company_address`;
CREATE TABLE `company_address` (
  `AID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Company_ID` int(10) unsigned DEFAULT NULL,
  `County_ID` smallint(5) unsigned DEFAULT NULL,
  `Address` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`AID`),
  KEY `company_address_ibfk_1` (`Company_ID`),
  KEY `company_address_ibfk_3` (`County_ID`),
  CONSTRAINT `company_address_ibfk_1` FOREIGN KEY (`Company_ID`) REFERENCES `company` (`CID`) ON UPDATE CASCADE,
  CONSTRAINT `company_address_ibfk_3` FOREIGN KEY (`County_ID`) REFERENCES `county` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of company_address
-- ----------------------------
INSERT INTO `company_address` VALUES ('42', '231', '225', 'Hvnsdljklsjdjsdd');
INSERT INTO `company_address` VALUES ('43', '238', '222', 'xzcxzxzx');
INSERT INTO `company_address` VALUES ('44', '238', '229', 'czxzx');
INSERT INTO `company_address` VALUES ('45', '239', '206', 'sdfdsdfd');
INSERT INTO `company_address` VALUES ('46', '239', '183', 'sdsasaasdas');
INSERT INTO `company_address` VALUES ('47', '231', '210', 'sdf df d sdsd sd sd177');
INSERT INTO `company_address` VALUES ('48', '241', '205', 'asddasaas');

-- ----------------------------
-- Table structure for company_agent
-- ----------------------------
DROP TABLE IF EXISTS `company_agent`;
CREATE TABLE `company_agent` (
  `AID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Company_ID` int(10) unsigned DEFAULT NULL,
  `Department_ID` int(10) unsigned DEFAULT NULL,
  `Post` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Prefix` enum('آقای','خانم') COLLATE utf8_unicode_ci DEFAULT NULL,
  `FN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LN` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AID`),
  KEY `company_agent_ibfk_1` (`Company_ID`),
  KEY `Department_ID` (`Department_ID`),
  CONSTRAINT `company_agent_ibfk_1` FOREIGN KEY (`Company_ID`) REFERENCES `company` (`CID`) ON UPDATE CASCADE,
  CONSTRAINT `company_agent_ibfk_2` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`DID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of company_agent
-- ----------------------------
INSERT INTO `company_agent` VALUES ('96', '231', '6', 'رئیس بخش روابط عمومی بین الملل', 'آقای', 'علی', 'محمدی', 'decsdsds');
INSERT INTO `company_agent` VALUES ('97', '237', '31', 'asd', 'آقای', 'asda', 'asd', 'asdsa');
INSERT INTO `company_agent` VALUES ('98', '238', '29', 'asdas', 'آقای', 'sdas', 'asdasa', 'dasd23424');
INSERT INTO `company_agent` VALUES ('99', '239', '14', 'www', 'آقای', 'ww', 'www', 'w');
INSERT INTO `company_agent` VALUES ('100', '231', '1', null, null, 'احمد', 'حسینی', '6454');
INSERT INTO `company_agent` VALUES ('101', '240', '31', '', 'آقای', 'ب', 'ب', '');
INSERT INTO `company_agent` VALUES ('102', '240', '31', '', 'آقای', 'ش', '', '');
INSERT INTO `company_agent` VALUES ('103', '241', '31', '', 'آقای', 'b', '', '1');
INSERT INTO `company_agent` VALUES ('104', '241', '31', '', 'آقای', 'a', '', 'asdds');

-- ----------------------------
-- Table structure for company_fax
-- ----------------------------
DROP TABLE IF EXISTS `company_fax`;
CREATE TABLE `company_fax` (
  `FID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Company_ID` int(10) unsigned DEFAULT NULL,
  `Code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fax` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`FID`),
  KEY `Company_ID` (`Company_ID`),
  CONSTRAINT `company_fax_ibfk_1` FOREIGN KEY (`Company_ID`) REFERENCES `company` (`CID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of company_fax
-- ----------------------------
INSERT INTO `company_fax` VALUES ('22', '231', '5', '5', 't5');
INSERT INTO `company_fax` VALUES ('23', '231', '4', '4', 't4');
INSERT INTO `company_fax` VALUES ('24', '241', '1', '1', 'asdas');

-- ----------------------------
-- Table structure for company_label
-- ----------------------------
DROP TABLE IF EXISTS `company_label`;
CREATE TABLE `company_label` (
  `LID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Company_ID` int(10) unsigned DEFAULT NULL,
  `Label_ID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`LID`),
  KEY `Company_ID` (`Company_ID`),
  KEY `Label_ID` (`Label_ID`),
  CONSTRAINT `company_label_ibfk_1` FOREIGN KEY (`Company_ID`) REFERENCES `company` (`CID`) ON UPDATE CASCADE,
  CONSTRAINT `company_label_ibfk_2` FOREIGN KEY (`Label_ID`) REFERENCES `labels` (`LID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of company_label
-- ----------------------------
INSERT INTO `company_label` VALUES ('59', '231', '1');
INSERT INTO `company_label` VALUES ('60', '238', '2');
INSERT INTO `company_label` VALUES ('61', '238', '1');
INSERT INTO `company_label` VALUES ('62', '231', '2');
INSERT INTO `company_label` VALUES ('63', '231', '1');
INSERT INTO `company_label` VALUES ('64', '241', '2');
INSERT INTO `company_label` VALUES ('65', '241', '1');

-- ----------------------------
-- Table structure for company_tell
-- ----------------------------
DROP TABLE IF EXISTS `company_tell`;
CREATE TABLE `company_tell` (
  `TID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Company_ID` int(10) unsigned DEFAULT NULL,
  `Code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tell` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`TID`),
  KEY `company_tell_ibfk_1` (`Company_ID`),
  CONSTRAINT `company_tell_ibfk_1` FOREIGN KEY (`Company_ID`) REFERENCES `company` (`CID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of company_tell
-- ----------------------------
INSERT INTO `company_tell` VALUES ('22', '231', '022', '6546546', 'asdsasadas');
INSERT INTO `company_tell` VALUES ('23', '231', '021', '66645', 'sdfdf sdf sd');
INSERT INTO `company_tell` VALUES ('24', '231', '2', '2', 'j2');
INSERT INTO `company_tell` VALUES ('25', '235', '1', '1', 'j1');
INSERT INTO `company_tell` VALUES ('26', '241', '3', '3', 'asdd');
INSERT INTO `company_tell` VALUES ('27', '241', '1', '1', 'asdas');
INSERT INTO `company_tell` VALUES ('28', '241', '2', '2', 'asdas');

-- ----------------------------
-- Table structure for county
-- ----------------------------
DROP TABLE IF EXISTS `county`;
CREATE TABLE `county` (
  `id` smallint(5) unsigned NOT NULL,
  `province_id` smallint(5) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `province_id` (`province_id`),
  CONSTRAINT `county_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of county
-- ----------------------------
INSERT INTO `county` VALUES ('1', '1', 'آذرشهر');
INSERT INTO `county` VALUES ('2', '1', 'اسکو');
INSERT INTO `county` VALUES ('3', '1', 'اهر');
INSERT INTO `county` VALUES ('4', '1', 'بستان آباد');
INSERT INTO `county` VALUES ('5', '1', 'بناب');
INSERT INTO `county` VALUES ('6', '1', 'تبریز');
INSERT INTO `county` VALUES ('7', '1', 'جلفا');
INSERT INTO `county` VALUES ('8', '1', 'چاراویماق');
INSERT INTO `county` VALUES ('9', '1', 'خداآفرین');
INSERT INTO `county` VALUES ('10', '1', 'سراب');
INSERT INTO `county` VALUES ('11', '1', 'شبستر');
INSERT INTO `county` VALUES ('12', '1', 'عجب شیر');
INSERT INTO `county` VALUES ('13', '1', 'کلیبر');
INSERT INTO `county` VALUES ('14', '1', 'مراغه');
INSERT INTO `county` VALUES ('15', '1', 'مرند');
INSERT INTO `county` VALUES ('16', '1', 'ملکان');
INSERT INTO `county` VALUES ('17', '1', 'میانه');
INSERT INTO `county` VALUES ('18', '1', 'ورزقان');
INSERT INTO `county` VALUES ('19', '1', 'هریس');
INSERT INTO `county` VALUES ('20', '1', 'هشترود');
INSERT INTO `county` VALUES ('21', '2', 'ارومیه');
INSERT INTO `county` VALUES ('22', '2', 'اشنویه');
INSERT INTO `county` VALUES ('23', '2', 'بوکان');
INSERT INTO `county` VALUES ('24', '2', 'پلدشت');
INSERT INTO `county` VALUES ('25', '2', 'پیرانشهر');
INSERT INTO `county` VALUES ('26', '2', 'تکاب');
INSERT INTO `county` VALUES ('27', '2', 'چالدران');
INSERT INTO `county` VALUES ('28', '2', 'چایپاره');
INSERT INTO `county` VALUES ('29', '2', 'خوی');
INSERT INTO `county` VALUES ('30', '2', 'سردشت');
INSERT INTO `county` VALUES ('31', '2', 'سلماس');
INSERT INTO `county` VALUES ('32', '2', 'شاهین دژ');
INSERT INTO `county` VALUES ('33', '2', 'شوط');
INSERT INTO `county` VALUES ('34', '2', 'ماکو');
INSERT INTO `county` VALUES ('35', '2', 'مهاباد');
INSERT INTO `county` VALUES ('36', '2', 'میاندوآب');
INSERT INTO `county` VALUES ('37', '2', 'نقده');
INSERT INTO `county` VALUES ('38', '3', 'اردبیل');
INSERT INTO `county` VALUES ('39', '3', 'بیله سوار');
INSERT INTO `county` VALUES ('40', '3', 'پارس آباد');
INSERT INTO `county` VALUES ('41', '3', 'خلخال');
INSERT INTO `county` VALUES ('42', '3', 'سرعین');
INSERT INTO `county` VALUES ('43', '3', 'کوثر');
INSERT INTO `county` VALUES ('44', '3', 'گرمی');
INSERT INTO `county` VALUES ('45', '3', 'مشگین شهر');
INSERT INTO `county` VALUES ('46', '3', 'نمین');
INSERT INTO `county` VALUES ('47', '3', 'نیر');
INSERT INTO `county` VALUES ('48', '4', 'آران وبیدگل');
INSERT INTO `county` VALUES ('49', '4', 'اردستان');
INSERT INTO `county` VALUES ('50', '4', 'اصفهان');
INSERT INTO `county` VALUES ('51', '4', 'برخوار');
INSERT INTO `county` VALUES ('52', '4', 'بو یین و میاندشت');
INSERT INTO `county` VALUES ('53', '4', 'تیران وکرون');
INSERT INTO `county` VALUES ('54', '4', 'چادگان');
INSERT INTO `county` VALUES ('55', '4', 'خمینی شهر');
INSERT INTO `county` VALUES ('56', '4', 'خوانسار');
INSERT INTO `county` VALUES ('57', '4', 'خور و بیابانک');
INSERT INTO `county` VALUES ('58', '4', 'دهاقان');
INSERT INTO `county` VALUES ('59', '4', 'سمیرم');
INSERT INTO `county` VALUES ('60', '4', 'شاهین شهرومیمه');
INSERT INTO `county` VALUES ('61', '4', 'شهرضا');
INSERT INTO `county` VALUES ('62', '4', 'فریدن');
INSERT INTO `county` VALUES ('63', '4', 'فریدونشهر');
INSERT INTO `county` VALUES ('64', '4', 'فلاورجان');
INSERT INTO `county` VALUES ('65', '4', 'کاشان');
INSERT INTO `county` VALUES ('66', '4', 'گلپایگان');
INSERT INTO `county` VALUES ('67', '4', 'لنجان');
INSERT INTO `county` VALUES ('68', '4', 'مبارکه');
INSERT INTO `county` VALUES ('69', '4', 'نایین');
INSERT INTO `county` VALUES ('70', '4', 'نجف آباد');
INSERT INTO `county` VALUES ('71', '4', 'نطنز');
INSERT INTO `county` VALUES ('72', '5', 'اشتهارد');
INSERT INTO `county` VALUES ('73', '5', 'ساوجبلاغ');
INSERT INTO `county` VALUES ('74', '5', 'طالقان');
INSERT INTO `county` VALUES ('75', '5', 'فردیس');
INSERT INTO `county` VALUES ('76', '5', 'کرج');
INSERT INTO `county` VALUES ('77', '5', 'نظرآباد');
INSERT INTO `county` VALUES ('78', '6', 'آبدانان');
INSERT INTO `county` VALUES ('79', '6', 'ایلام');
INSERT INTO `county` VALUES ('80', '6', 'ایوان');
INSERT INTO `county` VALUES ('81', '6', 'بدره');
INSERT INTO `county` VALUES ('82', '6', 'چرداول');
INSERT INTO `county` VALUES ('83', '6', 'دره شهر');
INSERT INTO `county` VALUES ('84', '6', 'دهلران');
INSERT INTO `county` VALUES ('85', '6', 'سیروان');
INSERT INTO `county` VALUES ('86', '6', 'ملکشاهی');
INSERT INTO `county` VALUES ('87', '6', 'مهران');
INSERT INTO `county` VALUES ('88', '7', 'بوشهر');
INSERT INTO `county` VALUES ('89', '7', 'تنگستان');
INSERT INTO `county` VALUES ('90', '7', 'جم');
INSERT INTO `county` VALUES ('91', '7', 'دشتستان');
INSERT INTO `county` VALUES ('92', '7', 'دشتی');
INSERT INTO `county` VALUES ('93', '7', 'دیر');
INSERT INTO `county` VALUES ('94', '7', 'دیلم');
INSERT INTO `county` VALUES ('95', '7', 'عسلویه');
INSERT INTO `county` VALUES ('96', '7', 'کنگان');
INSERT INTO `county` VALUES ('97', '7', 'گناوه');
INSERT INTO `county` VALUES ('98', '8', 'اسلامشهر');
INSERT INTO `county` VALUES ('99', '8', 'بهارستان');
INSERT INTO `county` VALUES ('100', '8', 'پاکدشت');
INSERT INTO `county` VALUES ('101', '8', 'پردیس');
INSERT INTO `county` VALUES ('102', '8', 'پیشوا');
INSERT INTO `county` VALUES ('103', '8', 'تهران');
INSERT INTO `county` VALUES ('104', '8', 'دماوند');
INSERT INTO `county` VALUES ('105', '8', 'رباطکریم');
INSERT INTO `county` VALUES ('106', '8', 'ری');
INSERT INTO `county` VALUES ('107', '8', 'شمیرانات');
INSERT INTO `county` VALUES ('108', '8', 'شهریار');
INSERT INTO `county` VALUES ('109', '8', 'فیروزکوه');
INSERT INTO `county` VALUES ('110', '8', 'قدس');
INSERT INTO `county` VALUES ('111', '8', 'قرچک');
INSERT INTO `county` VALUES ('112', '8', 'ملارد');
INSERT INTO `county` VALUES ('113', '8', 'ورامین');
INSERT INTO `county` VALUES ('114', '9', 'اردل');
INSERT INTO `county` VALUES ('115', '9', 'بروجن');
INSERT INTO `county` VALUES ('116', '9', 'بن');
INSERT INTO `county` VALUES ('117', '9', 'سامان');
INSERT INTO `county` VALUES ('118', '9', 'شهرکرد');
INSERT INTO `county` VALUES ('119', '9', 'فارسان');
INSERT INTO `county` VALUES ('120', '9', 'کوهرنگ');
INSERT INTO `county` VALUES ('121', '9', 'کیار');
INSERT INTO `county` VALUES ('122', '9', 'لردگان');
INSERT INTO `county` VALUES ('123', '10', 'بشرویه');
INSERT INTO `county` VALUES ('124', '10', 'بیرجند');
INSERT INTO `county` VALUES ('125', '10', 'خوسف');
INSERT INTO `county` VALUES ('126', '10', 'درمیان');
INSERT INTO `county` VALUES ('127', '10', 'زیرکوه');
INSERT INTO `county` VALUES ('128', '10', 'سرایان');
INSERT INTO `county` VALUES ('129', '10', 'سربیشه');
INSERT INTO `county` VALUES ('130', '10', 'طبس');
INSERT INTO `county` VALUES ('131', '10', 'فردوس');
INSERT INTO `county` VALUES ('132', '10', 'قاینات');
INSERT INTO `county` VALUES ('133', '10', 'نهبندان');
INSERT INTO `county` VALUES ('134', '11', 'باخرز');
INSERT INTO `county` VALUES ('135', '11', 'بجستان');
INSERT INTO `county` VALUES ('136', '11', 'بردسکن');
INSERT INTO `county` VALUES ('137', '11', 'بینالود');
INSERT INTO `county` VALUES ('138', '11', 'تایباد');
INSERT INTO `county` VALUES ('139', '11', 'تربت جام');
INSERT INTO `county` VALUES ('140', '11', 'تربت حیدریه');
INSERT INTO `county` VALUES ('141', '11', 'جغتای');
INSERT INTO `county` VALUES ('142', '11', 'جوین');
INSERT INTO `county` VALUES ('143', '11', 'چناران');
INSERT INTO `county` VALUES ('144', '11', 'خلیل آباد');
INSERT INTO `county` VALUES ('145', '11', 'خواف');
INSERT INTO `county` VALUES ('146', '11', 'خوشاب');
INSERT INTO `county` VALUES ('147', '11', 'داورزن');
INSERT INTO `county` VALUES ('148', '11', 'درگز');
INSERT INTO `county` VALUES ('149', '11', 'رشتخوار');
INSERT INTO `county` VALUES ('150', '11', 'زاوه');
INSERT INTO `county` VALUES ('151', '11', 'سبزوار');
INSERT INTO `county` VALUES ('152', '11', 'سرخس');
INSERT INTO `county` VALUES ('153', '11', 'فریمان');
INSERT INTO `county` VALUES ('154', '11', 'فیروزه');
INSERT INTO `county` VALUES ('155', '11', 'قوچان');
INSERT INTO `county` VALUES ('156', '11', 'کاشمر');
INSERT INTO `county` VALUES ('157', '11', 'کلات');
INSERT INTO `county` VALUES ('158', '11', 'گناباد');
INSERT INTO `county` VALUES ('159', '11', 'مشهد');
INSERT INTO `county` VALUES ('160', '11', 'مه ولات');
INSERT INTO `county` VALUES ('161', '11', 'نیشابور');
INSERT INTO `county` VALUES ('162', '12', 'اسفراین');
INSERT INTO `county` VALUES ('163', '12', 'بجنورد');
INSERT INTO `county` VALUES ('164', '12', 'جاجرم');
INSERT INTO `county` VALUES ('165', '12', 'راز و جرگلان');
INSERT INTO `county` VALUES ('166', '12', 'شیروان');
INSERT INTO `county` VALUES ('167', '12', 'فاروج');
INSERT INTO `county` VALUES ('168', '12', 'گرمه');
INSERT INTO `county` VALUES ('169', '12', 'مانه وسملقان');
INSERT INTO `county` VALUES ('170', '13', 'آبادان');
INSERT INTO `county` VALUES ('171', '13', 'آغاجاری');
INSERT INTO `county` VALUES ('172', '13', 'امیدیه');
INSERT INTO `county` VALUES ('173', '13', 'اندیکا');
INSERT INTO `county` VALUES ('174', '13', 'اندیمشک');
INSERT INTO `county` VALUES ('175', '13', 'اهواز');
INSERT INTO `county` VALUES ('176', '13', 'ایذه');
INSERT INTO `county` VALUES ('177', '13', 'باغ ملک');
INSERT INTO `county` VALUES ('178', '13', 'باوی');
INSERT INTO `county` VALUES ('179', '13', 'بندرماهشهر');
INSERT INTO `county` VALUES ('180', '13', 'بهبهان');
INSERT INTO `county` VALUES ('181', '13', 'حمیدیه');
INSERT INTO `county` VALUES ('182', '13', 'خرمشهر');
INSERT INTO `county` VALUES ('183', '13', 'دزفول');
INSERT INTO `county` VALUES ('184', '13', 'دشت آزادگان');
INSERT INTO `county` VALUES ('185', '13', 'رامشیر');
INSERT INTO `county` VALUES ('186', '13', 'رامهرمز');
INSERT INTO `county` VALUES ('187', '13', 'شادگان');
INSERT INTO `county` VALUES ('188', '13', 'شوش');
INSERT INTO `county` VALUES ('189', '13', 'شوشتر');
INSERT INTO `county` VALUES ('190', '13', 'کارون');
INSERT INTO `county` VALUES ('191', '13', 'گتوند');
INSERT INTO `county` VALUES ('192', '13', 'لالی');
INSERT INTO `county` VALUES ('193', '13', 'مسجدسلیمان');
INSERT INTO `county` VALUES ('194', '13', 'هفتگل');
INSERT INTO `county` VALUES ('195', '13', 'هندیجان');
INSERT INTO `county` VALUES ('196', '13', 'هویزه');
INSERT INTO `county` VALUES ('197', '14', 'ابهر');
INSERT INTO `county` VALUES ('198', '14', 'ایجرود');
INSERT INTO `county` VALUES ('199', '14', 'خدابنده');
INSERT INTO `county` VALUES ('200', '14', 'خرمدره');
INSERT INTO `county` VALUES ('201', '14', 'زنجان');
INSERT INTO `county` VALUES ('202', '14', 'سلطانیه');
INSERT INTO `county` VALUES ('203', '14', 'طارم');
INSERT INTO `county` VALUES ('204', '14', 'ماهنشان');
INSERT INTO `county` VALUES ('205', '15', 'آرادان');
INSERT INTO `county` VALUES ('206', '15', 'دامغان');
INSERT INTO `county` VALUES ('207', '15', 'سرخه');
INSERT INTO `county` VALUES ('208', '15', 'سمنان');
INSERT INTO `county` VALUES ('209', '15', 'شاهرود');
INSERT INTO `county` VALUES ('210', '15', 'گرمسار');
INSERT INTO `county` VALUES ('211', '15', 'مهدی شهر');
INSERT INTO `county` VALUES ('212', '15', 'میامی');
INSERT INTO `county` VALUES ('213', '16', 'ایرانشهر');
INSERT INTO `county` VALUES ('214', '16', 'چابهار');
INSERT INTO `county` VALUES ('215', '16', 'خاش');
INSERT INTO `county` VALUES ('216', '16', 'دلگان');
INSERT INTO `county` VALUES ('217', '16', 'زابل');
INSERT INTO `county` VALUES ('218', '16', 'زاهدان');
INSERT INTO `county` VALUES ('219', '16', 'زهک');
INSERT INTO `county` VALUES ('220', '16', 'سراوان');
INSERT INTO `county` VALUES ('221', '16', 'سرباز');
INSERT INTO `county` VALUES ('222', '16', 'سیب و سوران');
INSERT INTO `county` VALUES ('223', '16', 'فنوج');
INSERT INTO `county` VALUES ('224', '16', 'قصرقند');
INSERT INTO `county` VALUES ('225', '16', 'کنارک');
INSERT INTO `county` VALUES ('226', '16', 'مهرستان');
INSERT INTO `county` VALUES ('227', '16', 'میرجاوه');
INSERT INTO `county` VALUES ('228', '16', 'نیک شهر');
INSERT INTO `county` VALUES ('229', '16', 'نیمروز');
INSERT INTO `county` VALUES ('230', '16', 'هامون');
INSERT INTO `county` VALUES ('231', '16', 'هیرمند');
INSERT INTO `county` VALUES ('232', '17', 'آباده');
INSERT INTO `county` VALUES ('233', '17', 'ارسنجان');
INSERT INTO `county` VALUES ('234', '17', 'استهبان');
INSERT INTO `county` VALUES ('235', '17', 'اقلید');
INSERT INTO `county` VALUES ('236', '17', 'بوانات');
INSERT INTO `county` VALUES ('237', '17', 'پاسارگاد');
INSERT INTO `county` VALUES ('238', '17', 'جهرم');
INSERT INTO `county` VALUES ('239', '17', 'خرامه');
INSERT INTO `county` VALUES ('240', '17', 'خرم بید');
INSERT INTO `county` VALUES ('241', '17', 'خنج');
INSERT INTO `county` VALUES ('242', '17', 'داراب');
INSERT INTO `county` VALUES ('243', '17', 'رستم');
INSERT INTO `county` VALUES ('244', '17', 'زرین دشت');
INSERT INTO `county` VALUES ('245', '17', 'سپیدان');
INSERT INTO `county` VALUES ('246', '17', 'سروستان');
INSERT INTO `county` VALUES ('247', '17', 'شیراز');
INSERT INTO `county` VALUES ('248', '17', 'فراشبند');
INSERT INTO `county` VALUES ('249', '17', 'فسا');
INSERT INTO `county` VALUES ('250', '17', 'فیروزآباد');
INSERT INTO `county` VALUES ('251', '17', 'قیروکارزین');
INSERT INTO `county` VALUES ('252', '17', 'کازرون');
INSERT INTO `county` VALUES ('253', '17', 'کوار');
INSERT INTO `county` VALUES ('254', '17', 'گراش');
INSERT INTO `county` VALUES ('255', '17', 'لارستان');
INSERT INTO `county` VALUES ('256', '17', 'لامرد');
INSERT INTO `county` VALUES ('257', '17', 'مرودشت');
INSERT INTO `county` VALUES ('258', '17', 'ممسنی');
INSERT INTO `county` VALUES ('259', '17', 'مهر');
INSERT INTO `county` VALUES ('260', '17', 'نی ریز');
INSERT INTO `county` VALUES ('261', '18', 'آبیک');
INSERT INTO `county` VALUES ('262', '18', 'آوج');
INSERT INTO `county` VALUES ('263', '18', 'البرز');
INSERT INTO `county` VALUES ('264', '18', 'بویین زهرا');
INSERT INTO `county` VALUES ('265', '18', 'تاکستان');
INSERT INTO `county` VALUES ('266', '18', 'قزوین');
INSERT INTO `county` VALUES ('267', '19', 'قم');
INSERT INTO `county` VALUES ('268', '20', 'بانه');
INSERT INTO `county` VALUES ('269', '20', 'بیجار');
INSERT INTO `county` VALUES ('270', '20', 'دهگلان');
INSERT INTO `county` VALUES ('271', '20', 'دیواندره');
INSERT INTO `county` VALUES ('272', '20', 'سروآباد');
INSERT INTO `county` VALUES ('273', '20', 'سقز');
INSERT INTO `county` VALUES ('274', '20', 'سنندج');
INSERT INTO `county` VALUES ('275', '20', 'قروه');
INSERT INTO `county` VALUES ('276', '20', 'کامیاران');
INSERT INTO `county` VALUES ('277', '20', 'مریوان');
INSERT INTO `county` VALUES ('278', '21', 'ارزوییه');
INSERT INTO `county` VALUES ('279', '21', 'انار');
INSERT INTO `county` VALUES ('280', '21', 'بافت');
INSERT INTO `county` VALUES ('281', '21', 'بردسیر');
INSERT INTO `county` VALUES ('282', '21', 'بم');
INSERT INTO `county` VALUES ('283', '21', 'جیرفت');
INSERT INTO `county` VALUES ('284', '21', 'رابر');
INSERT INTO `county` VALUES ('285', '21', 'راور');
INSERT INTO `county` VALUES ('286', '21', 'رفسنجان');
INSERT INTO `county` VALUES ('287', '21', 'رودبارجنوب');
INSERT INTO `county` VALUES ('288', '21', 'ریگان');
INSERT INTO `county` VALUES ('289', '21', 'زرند');
INSERT INTO `county` VALUES ('290', '21', 'سیرجان');
INSERT INTO `county` VALUES ('291', '21', 'شهربابک');
INSERT INTO `county` VALUES ('292', '21', 'عنبرآباد');
INSERT INTO `county` VALUES ('293', '21', 'فاریاب');
INSERT INTO `county` VALUES ('294', '21', 'فهرج');
INSERT INTO `county` VALUES ('295', '21', 'قلعه گنج');
INSERT INTO `county` VALUES ('296', '21', 'کرمان');
INSERT INTO `county` VALUES ('297', '21', 'کوهبنان');
INSERT INTO `county` VALUES ('298', '21', 'کهنوج');
INSERT INTO `county` VALUES ('299', '21', 'منوجان');
INSERT INTO `county` VALUES ('300', '21', 'نرماشیر');
INSERT INTO `county` VALUES ('301', '22', 'اسلام آبادغرب');
INSERT INTO `county` VALUES ('302', '22', 'پاوه');
INSERT INTO `county` VALUES ('303', '22', 'ثلاث باباجانی');
INSERT INTO `county` VALUES ('304', '22', 'جوانرود');
INSERT INTO `county` VALUES ('305', '22', 'دالاهو');
INSERT INTO `county` VALUES ('306', '22', 'روانسر');
INSERT INTO `county` VALUES ('307', '22', 'سرپل ذهاب');
INSERT INTO `county` VALUES ('308', '22', 'سنقر');
INSERT INTO `county` VALUES ('309', '22', 'صحنه');
INSERT INTO `county` VALUES ('310', '22', 'قصرشیرین');
INSERT INTO `county` VALUES ('311', '22', 'کرمانشاه');
INSERT INTO `county` VALUES ('312', '22', 'کنگاور');
INSERT INTO `county` VALUES ('313', '22', 'گیلانغرب');
INSERT INTO `county` VALUES ('314', '22', 'هرسین');
INSERT INTO `county` VALUES ('315', '23', 'باشت');
INSERT INTO `county` VALUES ('316', '23', 'بویراحمد');
INSERT INTO `county` VALUES ('317', '23', 'بهمیی');
INSERT INTO `county` VALUES ('318', '23', 'چرام');
INSERT INTO `county` VALUES ('319', '23', 'دنا');
INSERT INTO `county` VALUES ('320', '23', 'کهگیلویه');
INSERT INTO `county` VALUES ('321', '23', 'گچساران');
INSERT INTO `county` VALUES ('322', '23', 'لنده');
INSERT INTO `county` VALUES ('323', '24', 'آزادشهر');
INSERT INTO `county` VALUES ('324', '24', 'آق قلا');
INSERT INTO `county` VALUES ('325', '24', 'بندرگز');
INSERT INTO `county` VALUES ('326', '24', 'ترکمن');
INSERT INTO `county` VALUES ('327', '24', 'رامیان');
INSERT INTO `county` VALUES ('328', '24', 'علی آباد');
INSERT INTO `county` VALUES ('329', '24', 'کردکوی');
INSERT INTO `county` VALUES ('330', '24', 'کلاله');
INSERT INTO `county` VALUES ('331', '24', 'گالیکش');
INSERT INTO `county` VALUES ('332', '24', 'گرگان');
INSERT INTO `county` VALUES ('333', '24', 'گمیشان');
INSERT INTO `county` VALUES ('334', '24', 'گنبدکاووس');
INSERT INTO `county` VALUES ('335', '24', 'مراوه تپه');
INSERT INTO `county` VALUES ('336', '24', 'مینودشت');
INSERT INTO `county` VALUES ('337', '25', 'آستارا');
INSERT INTO `county` VALUES ('338', '25', 'آستانه اشرفیه');
INSERT INTO `county` VALUES ('339', '25', 'املش');
INSERT INTO `county` VALUES ('340', '25', 'بندرانزلی');
INSERT INTO `county` VALUES ('341', '25', 'رشت');
INSERT INTO `county` VALUES ('342', '25', 'رضوانشهر');
INSERT INTO `county` VALUES ('343', '25', 'رودبار');
INSERT INTO `county` VALUES ('344', '25', 'رودسر');
INSERT INTO `county` VALUES ('345', '25', 'سیاهکل');
INSERT INTO `county` VALUES ('346', '25', 'شفت');
INSERT INTO `county` VALUES ('347', '25', 'صومعه سرا');
INSERT INTO `county` VALUES ('348', '25', 'طوالش');
INSERT INTO `county` VALUES ('349', '25', 'فومن');
INSERT INTO `county` VALUES ('350', '25', 'لاهیجان');
INSERT INTO `county` VALUES ('351', '25', 'لنگرود');
INSERT INTO `county` VALUES ('352', '25', 'ماسال');
INSERT INTO `county` VALUES ('353', '26', 'ازنا');
INSERT INTO `county` VALUES ('354', '26', 'الیگودرز');
INSERT INTO `county` VALUES ('355', '26', 'بروجرد');
INSERT INTO `county` VALUES ('356', '26', 'پلدختر');
INSERT INTO `county` VALUES ('357', '26', 'خرم آباد');
INSERT INTO `county` VALUES ('358', '26', 'دلفان');
INSERT INTO `county` VALUES ('359', '26', 'دورود');
INSERT INTO `county` VALUES ('360', '26', 'دوره');
INSERT INTO `county` VALUES ('361', '26', 'رومشکان');
INSERT INTO `county` VALUES ('362', '26', 'سلسله');
INSERT INTO `county` VALUES ('363', '26', 'کوهدشت');
INSERT INTO `county` VALUES ('364', '27', 'آمل');
INSERT INTO `county` VALUES ('365', '27', 'بابل');
INSERT INTO `county` VALUES ('366', '27', 'بابلسر');
INSERT INTO `county` VALUES ('367', '27', 'بهشهر');
INSERT INTO `county` VALUES ('368', '27', 'تنکابن');
INSERT INTO `county` VALUES ('369', '27', 'جویبار');
INSERT INTO `county` VALUES ('370', '27', 'چالوس');
INSERT INTO `county` VALUES ('371', '27', 'رامسر');
INSERT INTO `county` VALUES ('372', '27', 'ساری');
INSERT INTO `county` VALUES ('373', '27', 'سوادکوه');
INSERT INTO `county` VALUES ('374', '27', 'سوادکوه شمالی');
INSERT INTO `county` VALUES ('375', '27', 'سیمرغ');
INSERT INTO `county` VALUES ('376', '27', 'عباس آباد');
INSERT INTO `county` VALUES ('377', '27', 'فریدونکنار');
INSERT INTO `county` VALUES ('378', '27', 'قایم شهر');
INSERT INTO `county` VALUES ('379', '27', 'کلاردشت');
INSERT INTO `county` VALUES ('380', '27', 'گلوگاه');
INSERT INTO `county` VALUES ('381', '27', 'محمودآباد');
INSERT INTO `county` VALUES ('382', '27', 'میاندورود');
INSERT INTO `county` VALUES ('383', '27', 'نکا');
INSERT INTO `county` VALUES ('384', '27', 'نور');
INSERT INTO `county` VALUES ('385', '27', 'نوشهر');
INSERT INTO `county` VALUES ('386', '28', 'آشتیان');
INSERT INTO `county` VALUES ('387', '28', 'اراک');
INSERT INTO `county` VALUES ('388', '28', 'تفرش');
INSERT INTO `county` VALUES ('389', '28', 'خمین');
INSERT INTO `county` VALUES ('390', '28', 'خنداب');
INSERT INTO `county` VALUES ('391', '28', 'دلیجان');
INSERT INTO `county` VALUES ('392', '28', 'زرندیه');
INSERT INTO `county` VALUES ('393', '28', 'ساوه');
INSERT INTO `county` VALUES ('394', '28', 'شازند');
INSERT INTO `county` VALUES ('395', '28', 'فراهان');
INSERT INTO `county` VALUES ('396', '28', 'کمیجان');
INSERT INTO `county` VALUES ('397', '28', 'محلات');
INSERT INTO `county` VALUES ('398', '29', 'ابوموسی');
INSERT INTO `county` VALUES ('399', '29', 'بستک');
INSERT INTO `county` VALUES ('400', '29', 'بشاگرد');
INSERT INTO `county` VALUES ('401', '29', 'بندرعباس');
INSERT INTO `county` VALUES ('402', '29', 'بندرلنگه');
INSERT INTO `county` VALUES ('403', '29', 'پارسیان');
INSERT INTO `county` VALUES ('404', '29', 'جاسک');
INSERT INTO `county` VALUES ('405', '29', 'حاجی اباد');
INSERT INTO `county` VALUES ('406', '29', 'خمیر');
INSERT INTO `county` VALUES ('407', '29', 'رودان');
INSERT INTO `county` VALUES ('408', '29', 'سیریک');
INSERT INTO `county` VALUES ('409', '29', 'قشم');
INSERT INTO `county` VALUES ('410', '29', 'میناب');
INSERT INTO `county` VALUES ('411', '30', 'اسدآباد');
INSERT INTO `county` VALUES ('412', '30', 'بهار');
INSERT INTO `county` VALUES ('413', '30', 'تویسرکان');
INSERT INTO `county` VALUES ('414', '30', 'رزن');
INSERT INTO `county` VALUES ('415', '30', 'فامنین');
INSERT INTO `county` VALUES ('416', '30', 'کبودرآهنگ');
INSERT INTO `county` VALUES ('417', '30', 'ملایر');
INSERT INTO `county` VALUES ('418', '30', 'نهاوند');
INSERT INTO `county` VALUES ('419', '30', 'همدان');
INSERT INTO `county` VALUES ('420', '31', 'ابرکوه');
INSERT INTO `county` VALUES ('421', '31', 'اردکان');
INSERT INTO `county` VALUES ('422', '31', 'اشکذر');
INSERT INTO `county` VALUES ('423', '31', 'بافق');
INSERT INTO `county` VALUES ('424', '31', 'بهاباد');
INSERT INTO `county` VALUES ('425', '31', 'تفت');
INSERT INTO `county` VALUES ('426', '31', 'خاتم');
INSERT INTO `county` VALUES ('427', '31', 'مهریز');
INSERT INTO `county` VALUES ('428', '31', 'میبد');
INSERT INTO `county` VALUES ('429', '31', 'یزد');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `DID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', 'مدیر عامل');
INSERT INTO `department` VALUES ('2', 'قائم مقام');
INSERT INTO `department` VALUES ('3', 'مالی');
INSERT INTO `department` VALUES ('4', 'حقوقی');
INSERT INTO `department` VALUES ('5', 'انفورماتیک');
INSERT INTO `department` VALUES ('6', 'صادرات');
INSERT INTO `department` VALUES ('7', 'فروش');
INSERT INTO `department` VALUES ('8', 'بازاریابی');
INSERT INTO `department` VALUES ('9', 'تحقیق و توسعه');
INSERT INTO `department` VALUES ('10', 'برنامه ریزی');
INSERT INTO `department` VALUES ('11', 'تدارکات');
INSERT INTO `department` VALUES ('12', 'انبار');
INSERT INTO `department` VALUES ('13', 'تولید');
INSERT INTO `department` VALUES ('14', 'روابط عمومی');
INSERT INTO `department` VALUES ('15', 'اداری');
INSERT INTO `department` VALUES ('16', 'پرسنلی');
INSERT INTO `department` VALUES ('17', 'تبلیغات');
INSERT INTO `department` VALUES ('18', 'دبیرخانه');
INSERT INTO `department` VALUES ('19', 'بایگانی');
INSERT INTO `department` VALUES ('20', 'مشاوره');
INSERT INTO `department` VALUES ('21', 'آموزش');
INSERT INTO `department` VALUES ('22', 'پشتیبانی');
INSERT INTO `department` VALUES ('23', 'نگهداری و تعمیرات');
INSERT INTO `department` VALUES ('24', 'بهداری');
INSERT INTO `department` VALUES ('25', 'بازرسی و حراست');
INSERT INTO `department` VALUES ('26', 'خدمات');
INSERT INTO `department` VALUES ('27', 'منشی');
INSERT INTO `department` VALUES ('28', 'مهندسی');
INSERT INTO `department` VALUES ('29', 'عملیات');
INSERT INTO `department` VALUES ('30', 'کارپردازی');
INSERT INTO `department` VALUES ('31', 'سایر');

-- ----------------------------
-- Table structure for development
-- ----------------------------
DROP TABLE IF EXISTS `development`;
CREATE TABLE `development` (
  `DID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Project_ID` int(10) unsigned DEFAULT NULL,
  `State_ID` int(10) unsigned DEFAULT NULL,
  `User_ID` int(10) unsigned DEFAULT NULL,
  `Company_ID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`DID`),
  KEY `development_ibfk_1` (`Project_ID`),
  KEY `development_ibfk_2` (`State_ID`),
  KEY `development_ibfk_3` (`User_ID`),
  KEY `development_ibfk_4` (`Company_ID`),
  CONSTRAINT `development_ibfk_1` FOREIGN KEY (`Project_ID`) REFERENCES `project` (`PID`) ON UPDATE CASCADE,
  CONSTRAINT `development_ibfk_2` FOREIGN KEY (`State_ID`) REFERENCES `dev_states` (`SID`) ON UPDATE CASCADE,
  CONSTRAINT `development_ibfk_3` FOREIGN KEY (`User_ID`) REFERENCES `users` (`UID`) ON UPDATE CASCADE,
  CONSTRAINT `development_ibfk_4` FOREIGN KEY (`Company_ID`) REFERENCES `company` (`CID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of development
-- ----------------------------

-- ----------------------------
-- Table structure for dev_states
-- ----------------------------
DROP TABLE IF EXISTS `dev_states`;
CREATE TABLE `dev_states` (
  `SID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of dev_states
-- ----------------------------

-- ----------------------------
-- Table structure for fax
-- ----------------------------
DROP TABLE IF EXISTS `fax`;
CREATE TABLE `fax` (
  `FID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Task_ID` int(10) unsigned DEFAULT NULL,
  `Subject` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Content` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`FID`),
  KEY `Task_ID` (`Task_ID`),
  CONSTRAINT `fax_ibfk_1` FOREIGN KEY (`Task_ID`) REFERENCES `tasks` (`TID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of fax
-- ----------------------------

-- ----------------------------
-- Table structure for fax_attach
-- ----------------------------
DROP TABLE IF EXISTS `fax_attach`;
CREATE TABLE `fax_attach` (
  `AID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Fax_ID` int(10) unsigned DEFAULT NULL,
  `FileName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Extension` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AID`),
  KEY `Fax_ID` (`Fax_ID`),
  CONSTRAINT `fax_attach_ibfk_1` FOREIGN KEY (`Fax_ID`) REFERENCES `fax` (`FID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of fax_attach
-- ----------------------------

-- ----------------------------
-- Table structure for fax_to
-- ----------------------------
DROP TABLE IF EXISTS `fax_to`;
CREATE TABLE `fax_to` (
  `TID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Fax_ID` int(10) unsigned DEFAULT NULL,
  `Number` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Success` char(1) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`TID`),
  KEY `Fax_ID` (`Fax_ID`),
  CONSTRAINT `fax_to_ibfk_1` FOREIGN KEY (`Fax_ID`) REFERENCES `fax` (`FID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of fax_to
-- ----------------------------

-- ----------------------------
-- Table structure for labels
-- ----------------------------
DROP TABLE IF EXISTS `labels`;
CREATE TABLE `labels` (
  `LID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of labels
-- ----------------------------
INSERT INTO `labels` VALUES ('1', 'Company', 'خوش حساب');
INSERT INTO `labels` VALUES ('2', 'Company', 'بد حساب');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `LID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Type` char(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Query` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `User` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Net_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Local_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAC` char(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Create` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=476 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('73', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Description`) VALUES (\'شسیسشسی\', \'یببی\', \'23423\', \'تضامنی\', \'سیبسی\', \'سیبسیب\', \'1\', \'سیبسیبی\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 15:01:30');
INSERT INTO `log` VALUES ('74', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sdsdasas\', \'erert\', \'54353\', \'نسبی\', \'ertre\', \'erter\', \'1\', \'Legal\', \'ertr\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 15:03:18');
INSERT INTO `log` VALUES ('75', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'سیبیبسی\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 15:04:42');
INSERT INTO `log` VALUES ('76', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sdfssdf\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 15:08:44');
INSERT INTO `log` VALUES ('77', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'ddddd\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 15:20:25');
INSERT INTO `log` VALUES ('78', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'ddddd\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 15:20:45');
INSERT INTO `log` VALUES ('79', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sdsd\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 15:21:40');
INSERT INTO `log` VALUES ('80', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sdsd\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 15:27:45');
INSERT INTO `log` VALUES ('81', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'asasa\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 15:30:49');
INSERT INTO `log` VALUES ('82', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'asasa\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 15:30:54');
INSERT INTO `log` VALUES ('83', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sss\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 15:31:31');
INSERT INTO `log` VALUES ('84', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sdfsdfsd\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 15:45:17');
INSERT INTO `log` VALUES ('85', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'143\', \'2\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 15:45:18');
INSERT INTO `log` VALUES ('86', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sdss\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 15:46:16');
INSERT INTO `log` VALUES ('87', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'144\', \'2\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 15:46:16');
INSERT INTO `log` VALUES ('88', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'assas\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 15:47:38');
INSERT INTO `log` VALUES ('89', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'145\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 15:47:38');
INSERT INTO `log` VALUES ('90', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sss\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 15:51:12');
INSERT INTO `log` VALUES ('91', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'146\', \'2\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 15:51:12');
INSERT INTO `log` VALUES ('92', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sssss\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 16:58:23');
INSERT INTO `log` VALUES ('93', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'147\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 16:58:24');
INSERT INTO `log` VALUES ('94', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sssss\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 16:58:59');
INSERT INTO `log` VALUES ('95', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'148\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 16:58:59');
INSERT INTO `log` VALUES ('96', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sssss\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 17:01:11');
INSERT INTO `log` VALUES ('97', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'149\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 17:01:11');
INSERT INTO `log` VALUES ('98', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'qqq\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 17:01:39');
INSERT INTO `log` VALUES ('99', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'150\', \'2\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 17:01:40');
INSERT INTO `log` VALUES ('100', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'xxxx\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 17:02:21');
INSERT INTO `log` VALUES ('101', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'151\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 17:02:21');
INSERT INTO `log` VALUES ('102', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'ggg\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 17:02:50');
INSERT INTO `log` VALUES ('103', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'152\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 17:02:50');
INSERT INTO `log` VALUES ('104', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'qq\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 17:04:35');
INSERT INTO `log` VALUES ('105', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'asd\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 17:08:02');
INSERT INTO `log` VALUES ('106', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'154\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 17:08:03');
INSERT INTO `log` VALUES ('107', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'154\', \'2\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 17:08:03');
INSERT INTO `log` VALUES ('108', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'asd\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 17:26:16');
INSERT INTO `log` VALUES ('109', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'155\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 17:26:16');
INSERT INTO `log` VALUES ('110', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'fgh\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 17:34:47');
INSERT INTO `log` VALUES ('111', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'156\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 17:34:48');
INSERT INTO `log` VALUES ('112', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'ssss\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 18:27:57');
INSERT INTO `log` VALUES ('113', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'157\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 18:27:57');
INSERT INTO `log` VALUES ('114', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'asddas\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 18:29:02');
INSERT INTO `log` VALUES ('115', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'158\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 18:29:02');
INSERT INTO `log` VALUES ('116', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'aaaaa\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 18:34:18');
INSERT INTO `log` VALUES ('117', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'159\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 18:34:18');
INSERT INTO `log` VALUES ('118', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'ssss\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 18:37:07');
INSERT INTO `log` VALUES ('119', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'160\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 18:37:07');
INSERT INTO `log` VALUES ('120', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'aa\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 18:37:54');
INSERT INTO `log` VALUES ('121', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'161\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 18:37:54');
INSERT INTO `log` VALUES ('122', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sdsdas\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 18:46:19');
INSERT INTO `log` VALUES ('123', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'162\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 18:46:19');
INSERT INTO `log` VALUES ('124', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'123\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 18:49:29');
INSERT INTO `log` VALUES ('125', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'163\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 18:49:30');
INSERT INTO `log` VALUES ('126', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'ssss\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 18:59:19');
INSERT INTO `log` VALUES ('127', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'164\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 18:59:19');
INSERT INTO `log` VALUES ('128', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sdsds\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 18:59:39');
INSERT INTO `log` VALUES ('129', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'165\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 18:59:39');
INSERT INTO `log` VALUES ('130', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'wwww\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 19:00:51');
INSERT INTO `log` VALUES ('131', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'166\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 19:00:52');
INSERT INTO `log` VALUES ('132', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'asdas\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 19:01:16');
INSERT INTO `log` VALUES ('133', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'167\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-12 19:01:16');
INSERT INTO `log` VALUES ('134', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'xxxx\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 10:28:49');
INSERT INTO `log` VALUES ('135', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (\'168\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 10:28:49');
INSERT INTO `log` VALUES ('136', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'aaaaaaa\', \'s\', \'2\', \'سهامی خاص\', \'s\', \'s\', \'1\', \'شخص حقوقی\', \'s\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:08:54');
INSERT INTO `log` VALUES ('137', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (169, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:08:55');
INSERT INTO `log` VALUES ('138', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'asdsaas\', \'234\', \'234323\', \'نا مشخص\', \'23423\', \'23423\', \'1\', \'شخص حقوقی\', \'23323\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:19:14');
INSERT INTO `log` VALUES ('139', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (170, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:19:14');
INSERT INTO `log` VALUES ('140', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (170, NULL, NULL, NULL, NULL, NULL, NULL)', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:19:15');
INSERT INTO `log` VALUES ('141', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (170, NULL, NULL, NULL, NULL, NULL, NULL)', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:19:15');
INSERT INTO `log` VALUES ('142', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'qweewq\', \'\', \'322\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:21:49');
INSERT INTO `log` VALUES ('143', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (171, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:21:49');
INSERT INTO `log` VALUES ('144', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (171, \'11\', \'fghfg\', \'خانم\', \'gh\', \'fghfg\', \'ghgfg\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:21:49');
INSERT INTO `log` VALUES ('145', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (171, \'1\', \'asdas\', \'آقای\', \'dasd\', \'asds\', \'asdasd\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:21:49');
INSERT INTO `log` VALUES ('146', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sadsda\', \'23432\', \'2323\', \'سهامی خاص\', \'\', \'23423\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:26:31');
INSERT INTO `log` VALUES ('147', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (172, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:26:31');
INSERT INTO `log` VALUES ('148', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (172, \'8\', \'werwe\', \'آقای\', \'werer\', \'were\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:26:31');
INSERT INTO `log` VALUES ('149', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (172, \'2\', \'23423\', \'آقای\', \'2343\', \'23423\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:26:32');
INSERT INTO `log` VALUES ('158', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sdsdasdsd\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:29:52');
INSERT INTO `log` VALUES ('159', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (177, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:29:52');
INSERT INTO `log` VALUES ('160', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (177, \'6\', \'sdfsd\', \'آقای\', \'dsf\', \'sdfsd\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:29:52');
INSERT INTO `log` VALUES ('161', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sdsasas\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:30:34');
INSERT INTO `log` VALUES ('162', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (178, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:30:34');
INSERT INTO `log` VALUES ('163', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (178, \'5\', \'asdas\', \'آقای\', \'asdas\', \'dasdsd\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:30:35');
INSERT INTO `log` VALUES ('164', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sdsasas\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:31:46');
INSERT INTO `log` VALUES ('165', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (179, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:31:46');
INSERT INTO `log` VALUES ('166', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (179, \'5\', \'asdas\', \'آقای\', \'asdas\', \'dasdsd\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:31:46');
INSERT INTO `log` VALUES ('167', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sdsasas\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:32:24');
INSERT INTO `log` VALUES ('168', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (180, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:32:24');
INSERT INTO `log` VALUES ('169', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (180, \'5\', \'asdas\', \'آقای\', \'asdas\', \'dasdsd\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:32:24');
INSERT INTO `log` VALUES ('170', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sddas\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:32:59');
INSERT INTO `log` VALUES ('171', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (181, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:33:00');
INSERT INTO `log` VALUES ('172', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (181, \'4\', \'dasdasd\', \'آقای\', \'asd\', \'sasdas\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:33:00');
INSERT INTO `log` VALUES ('173', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (181, \'4\', \'asdas\', \'آقای\', \'dasdas\', \'asdas\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 11:33:00');
INSERT INTO `log` VALUES ('174', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'rrr\', \'asd\', \'234\', \'مختلط غیرسهامی\', \'sdas\', \'asdasd\', \'1\', \'شخص حقوقی\', \'asdsas\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 12:57:05');
INSERT INTO `log` VALUES ('175', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (182, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 12:57:06');
INSERT INTO `log` VALUES ('176', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (182, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 12:57:06');
INSERT INTO `log` VALUES ('177', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'rrr\', \'asd\', \'234\', \'مختلط غیرسهامی\', \'sdas\', \'asdasd\', \'1\', \'شخص حقوقی\', \'asdsas\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:12:11');
INSERT INTO `log` VALUES ('178', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (183, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:12:11');
INSERT INTO `log` VALUES ('179', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (183, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:12:11');
INSERT INTO `log` VALUES ('180', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'dsadsad\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:27:21');
INSERT INTO `log` VALUES ('181', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (184, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:27:21');
INSERT INTO `log` VALUES ('182', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (184, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:27:21');
INSERT INTO `log` VALUES ('183', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'mihan\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'zxzXZ\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:32:29');
INSERT INTO `log` VALUES ('184', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (185, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:32:29');
INSERT INTO `log` VALUES ('185', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (185, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:32:29');
INSERT INTO `log` VALUES ('186', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'kale\', \'sds\', \'\', \'نا مشخص\', \'\', \'dsds\', \'1\', \'شخص حقوقی\', \'dsds\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:37:09');
INSERT INTO `log` VALUES ('187', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (186, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:37:09');
INSERT INTO `log` VALUES ('188', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (186, \'2\', \'2\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:37:09');
INSERT INTO `log` VALUES ('189', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (186, \'1\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:37:10');
INSERT INTO `log` VALUES ('190', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`) VALUES (186, \'3\', \'5\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:37:10');
INSERT INTO `log` VALUES ('191', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`) VALUES (186, \'2\', \'3\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:37:10');
INSERT INTO `log` VALUES ('192', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`) VALUES (186, \'5\', \'6\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:37:10');
INSERT INTO `log` VALUES ('193', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (186, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:37:10');
INSERT INTO `log` VALUES ('194', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'mk\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:45:26');
INSERT INTO `log` VALUES ('195', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (187, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:45:26');
INSERT INTO `log` VALUES ('196', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (187, \'1\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:45:26');
INSERT INTO `log` VALUES ('197', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (187, \'\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:45:26');
INSERT INTO `log` VALUES ('198', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`) VALUES (187, \'\', \'22\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:45:27');
INSERT INTO `log` VALUES ('199', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (187, \'28\', \'asdas\', \'خانم\', \'assa\', \'asdas\', \'234234\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:45:27');
INSERT INTO `log` VALUES ('200', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (187, \'31\', \'das\', \'آقای\', \'sdds\', \'sds\', \'asdas\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:45:27');
INSERT INTO `log` VALUES ('201', 'INSERT', 'INSERT INTO `company_address` (`Company_ID`, `County_ID`, `Address`) VALUES (187, \'99\', \'sddasdsdas\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:45:27');
INSERT INTO `log` VALUES ('202', 'INSERT', 'INSERT INTO `company_address` (`Company_ID`, `County_ID`, `Address`) VALUES (187, \'164\', \'sdsadasd\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:45:27');
INSERT INTO `log` VALUES ('208', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'queen\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:52:18');
INSERT INTO `log` VALUES ('209', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (189, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:52:18');
INSERT INTO `log` VALUES ('210', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (189, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:52:18');
INSERT INTO `log` VALUES ('211', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`) VALUES (189, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:52:18');
INSERT INTO `log` VALUES ('212', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (189, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:52:18');
INSERT INTO `log` VALUES ('213', 'INSERT', 'INSERT INTO `company_address` (`Company_ID`, `County_ID`, `Address`) VALUES (189, \'208\', \'sss\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 14:52:19');
INSERT INTO `log` VALUES ('219', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'asdsdas\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:10:32');
INSERT INTO `log` VALUES ('220', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (191, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:10:33');
INSERT INTO `log` VALUES ('221', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (191, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:10:33');
INSERT INTO `log` VALUES ('222', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`) VALUES (191, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:10:33');
INSERT INTO `log` VALUES ('223', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (191, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:10:33');
INSERT INTO `log` VALUES ('224', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'zxczxzxzx\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:11:41');
INSERT INTO `log` VALUES ('225', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (192, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:11:41');
INSERT INTO `log` VALUES ('226', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (192, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:11:41');
INSERT INTO `log` VALUES ('227', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`) VALUES (192, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:11:41');
INSERT INTO `log` VALUES ('228', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (192, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:11:42');
INSERT INTO `log` VALUES ('229', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sdsdasdaas\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:21:35');
INSERT INTO `log` VALUES ('230', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (193, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:21:35');
INSERT INTO `log` VALUES ('231', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (193, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:21:35');
INSERT INTO `log` VALUES ('232', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`) VALUES (193, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:21:35');
INSERT INTO `log` VALUES ('233', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (193, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:21:35');
INSERT INTO `log` VALUES ('234', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'fsdffsdsd\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:23:11');
INSERT INTO `log` VALUES ('235', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (194, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:23:11');
INSERT INTO `log` VALUES ('236', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (194, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:23:11');
INSERT INTO `log` VALUES ('237', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`) VALUES (194, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:23:11');
INSERT INTO `log` VALUES ('238', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (194, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:23:11');
INSERT INTO `log` VALUES ('239', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'dasassd\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:23:21');
INSERT INTO `log` VALUES ('240', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (195, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:23:21');
INSERT INTO `log` VALUES ('241', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (195, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:23:21');
INSERT INTO `log` VALUES ('242', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`) VALUES (195, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:23:21');
INSERT INTO `log` VALUES ('243', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (195, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:23:21');
INSERT INTO `log` VALUES ('244', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sdfsdf\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:23:38');
INSERT INTO `log` VALUES ('245', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (196, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:23:38');
INSERT INTO `log` VALUES ('246', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (196, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:23:38');
INSERT INTO `log` VALUES ('247', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`) VALUES (196, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:23:38');
INSERT INTO `log` VALUES ('248', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (196, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:23:39');
INSERT INTO `log` VALUES ('249', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'yyy\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:26:03');
INSERT INTO `log` VALUES ('250', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (197, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:26:03');
INSERT INTO `log` VALUES ('251', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (197, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:26:03');
INSERT INTO `log` VALUES ('252', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`) VALUES (197, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:26:03');
INSERT INTO `log` VALUES ('253', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'bbbb\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:26:54');
INSERT INTO `log` VALUES ('254', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (198, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:26:54');
INSERT INTO `log` VALUES ('255', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (198, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:26:54');
INSERT INTO `log` VALUES ('256', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`) VALUES (198, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:26:55');
INSERT INTO `log` VALUES ('257', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sdsas\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:29:42');
INSERT INTO `log` VALUES ('258', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (199, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:29:42');
INSERT INTO `log` VALUES ('259', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (199, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:29:43');
INSERT INTO `log` VALUES ('260', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`) VALUES (199, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:29:43');
INSERT INTO `log` VALUES ('262', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sdfsdfs\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:32:38');
INSERT INTO `log` VALUES ('263', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (201, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:32:38');
INSERT INTO `log` VALUES ('264', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`) VALUES (201, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:32:38');
INSERT INTO `log` VALUES ('265', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'xczxczx\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:32:58');
INSERT INTO `log` VALUES ('266', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (202, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:32:58');
INSERT INTO `log` VALUES ('267', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`) VALUES (202, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:32:58');
INSERT INTO `log` VALUES ('268', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sdfsdfsd\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:33:34');
INSERT INTO `log` VALUES ('269', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (203, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:33:34');
INSERT INTO `log` VALUES ('270', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`) VALUES (203, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 15:33:35');
INSERT INTO `log` VALUES ('271', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'dfdsdsd\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:00:44');
INSERT INTO `log` VALUES ('272', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'dfdsfsdssd\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:00:56');
INSERT INTO `log` VALUES ('273', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'asdsd\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:12:35');
INSERT INTO `log` VALUES ('274', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (206, \'2\', \'22\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:12:36');
INSERT INTO `log` VALUES ('275', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (206, \'1\', \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:12:36');
INSERT INTO `log` VALUES ('276', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'asdsas\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:16:24');
INSERT INTO `log` VALUES ('277', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (207, \'31\', \'\', \'آقای\', \'ali\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:16:24');
INSERT INTO `log` VALUES ('278', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sdsdasd\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:21:10');
INSERT INTO `log` VALUES ('279', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (208, \'31\', \'\', \'آقای\', \'saeed\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:21:10');
INSERT INTO `log` VALUES ('283', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'wwww\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:26:41');
INSERT INTO `log` VALUES ('284', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (210, \'31\', \'\', \'آقای\', \'hasan\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:26:41');
INSERT INTO `log` VALUES ('285', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (76, \'33\', \'44444\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:26:41');
INSERT INTO `log` VALUES ('286', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (76, \'11\', \'2222\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:26:41');
INSERT INTO `log` VALUES ('287', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'dsdsfsd\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:28:48');
INSERT INTO `log` VALUES ('288', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (211, \'31\', \'\', \'آقای\', \'hi\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:28:48');
INSERT INTO `log` VALUES ('289', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (77, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:28:48');
INSERT INTO `log` VALUES ('290', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (77, \'66\', NULL)', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:28:48');
INSERT INTO `log` VALUES ('291', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (77, \'22\', NULL)', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:28:48');
INSERT INTO `log` VALUES ('292', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (77, \'44\', NULL)', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:28:48');
INSERT INTO `log` VALUES ('293', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'ffff\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:30:10');
INSERT INTO `log` VALUES ('294', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (212, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:30:10');
INSERT INTO `log` VALUES ('295', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (78, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:30:10');
INSERT INTO `log` VALUES ('296', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (78, \'66\', \'666777\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:30:10');
INSERT INTO `log` VALUES ('297', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (78, \'22\', \'33333\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:30:10');
INSERT INTO `log` VALUES ('298', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (78, \'44\', \'55555\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:30:10');
INSERT INTO `log` VALUES ('299', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'saaa\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:34:04');
INSERT INTO `log` VALUES ('300', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (213, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:34:04');
INSERT INTO `log` VALUES ('301', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (79, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:34:04');
INSERT INTO `log` VALUES ('302', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (79, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:34:04');
INSERT INTO `log` VALUES ('303', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sasdas\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:35:36');
INSERT INTO `log` VALUES ('304', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (214, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:35:36');
INSERT INTO `log` VALUES ('305', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (80, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:35:36');
INSERT INTO `log` VALUES ('306', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (80, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:35:36');
INSERT INTO `log` VALUES ('307', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (80, \'113\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:35:36');
INSERT INTO `log` VALUES ('308', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (80, \'112\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:35:37');
INSERT INTO `log` VALUES ('309', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'asaa\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:37:40');
INSERT INTO `log` VALUES ('310', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (215, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:37:41');
INSERT INTO `log` VALUES ('311', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (81, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:37:41');
INSERT INTO `log` VALUES ('312', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (81, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:37:41');
INSERT INTO `log` VALUES ('313', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (81, \'112\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:37:41');
INSERT INTO `log` VALUES ('314', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (81, \'111\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:37:41');
INSERT INTO `log` VALUES ('315', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'asasdas\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:40:55');
INSERT INTO `log` VALUES ('316', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (216, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:40:55');
INSERT INTO `log` VALUES ('317', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (82, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:40:55');
INSERT INTO `log` VALUES ('318', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (82, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:40:56');
INSERT INTO `log` VALUES ('319', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (82, \'111\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:40:56');
INSERT INTO `log` VALUES ('320', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sdfdsfsd\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:41:45');
INSERT INTO `log` VALUES ('321', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (217, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:41:46');
INSERT INTO `log` VALUES ('322', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (83, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:41:46');
INSERT INTO `log` VALUES ('323', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (83, \'444\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:41:46');
INSERT INTO `log` VALUES ('324', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'sdfdsf\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:42:34');
INSERT INTO `log` VALUES ('325', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (218, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:42:35');
INSERT INTO `log` VALUES ('326', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (84, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:42:35');
INSERT INTO `log` VALUES ('327', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (84, \'345\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:42:35');
INSERT INTO `log` VALUES ('328', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'asa\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:44:59');
INSERT INTO `log` VALUES ('329', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (219, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:44:59');
INSERT INTO `log` VALUES ('330', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'zxxZXz\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:46:42');
INSERT INTO `log` VALUES ('331', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'zxcxzczx\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:47:14');
INSERT INTO `log` VALUES ('332', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (221, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:47:14');
INSERT INTO `log` VALUES ('333', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'asdassda\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:48:30');
INSERT INTO `log` VALUES ('334', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (222, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:48:31');
INSERT INTO `log` VALUES ('335', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'asdas\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:52:26');
INSERT INTO `log` VALUES ('336', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (223, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:52:26');
INSERT INTO `log` VALUES ('337', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'zxcxzczx\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:54:08');
INSERT INTO `log` VALUES ('338', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (224, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:54:08');
INSERT INTO `log` VALUES ('339', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (89, \'weewe\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:54:09');
INSERT INTO `log` VALUES ('340', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (89, \'xcxx\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:54:09');
INSERT INTO `log` VALUES ('341', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'xczxzx\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:56:24');
INSERT INTO `log` VALUES ('342', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (225, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:56:25');
INSERT INTO `log` VALUES ('343', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'dfdxc\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:58:48');
INSERT INTO `log` VALUES ('344', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (226, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:58:48');
INSERT INTO `log` VALUES ('345', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (91, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:58:48');
INSERT INTO `log` VALUES ('346', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (91, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:58:48');
INSERT INTO `log` VALUES ('347', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (91, \'445\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 16:58:48');
INSERT INTO `log` VALUES ('348', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'asaa\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:02:39');
INSERT INTO `log` VALUES ('349', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (227, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:02:39');
INSERT INTO `log` VALUES ('350', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (92, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:02:40');
INSERT INTO `log` VALUES ('351', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (92, \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:02:40');
INSERT INTO `log` VALUES ('352', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (92, \'122\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:02:40');
INSERT INTO `log` VALUES ('353', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'cvvcvc\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:04:48');
INSERT INTO `log` VALUES ('354', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (228, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:04:48');
INSERT INTO `log` VALUES ('355', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (93, \'556\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:04:48');
INSERT INTO `log` VALUES ('356', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'xccxc\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:08:40');
INSERT INTO `log` VALUES ('357', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (229, \'31\', \'\', \'آقای\', \'\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:08:40');
INSERT INTO `log` VALUES ('358', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (94, \'554\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:08:40');
INSERT INTO `log` VALUES ('359', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'333\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:11:54');
INSERT INTO `log` VALUES ('360', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (230, \'31\', \'\', \'آقای\', \'\', \'\', \'sdsds\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:11:54');
INSERT INTO `log` VALUES ('361', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (95, \'44\', \'555\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:11:54');
INSERT INTO `log` VALUES ('362', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (95, \'777\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:11:55');
INSERT INTO `log` VALUES ('363', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (95, \'666\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:11:55');
INSERT INTO `log` VALUES ('364', 'INSERT', 'INSERT INTO `agent_mobile` (`Agent_ID`, `Mobile`) VALUES (95, \'4321\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:11:55');
INSERT INTO `log` VALUES ('365', 'INSERT', 'INSERT INTO `agent_mobile` (`Agent_ID`, `Mobile`) VALUES (95, \'1234\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:11:56');
INSERT INTO `log` VALUES ('366', 'INSERT', 'INSERT INTO `agent_email` (`Agent_ID`, `Email`) VALUES (95, \'exp\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:11:56');
INSERT INTO `log` VALUES ('367', 'INSERT', 'INSERT INTO `agent_email` (`Agent_ID`, `Email`) VALUES (95, \'km\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:11:56');
INSERT INTO `log` VALUES ('368', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'کاله\', \'کاله\', \'12312\', \'سهامی عام\', \'info@kale.com\', \'kale.com\', \'1\', \'شخص حقوقی\', \'desc\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:17:47');
INSERT INTO `log` VALUES ('369', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (231, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:17:47');
INSERT INTO `log` VALUES ('370', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (231, \'021\', \'6546546\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:17:47');
INSERT INTO `log` VALUES ('371', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`) VALUES (231, \'021\', \'66645\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:17:47');
INSERT INTO `log` VALUES ('372', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`) VALUES (231, \'45\', \'321131\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:17:47');
INSERT INTO `log` VALUES ('373', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`) VALUES (231, \'014\', \'6545646\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:17:47');
INSERT INTO `log` VALUES ('374', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (231, \'6\', \'رئیس بخش روابط عمومی بین الملل\', \'آقای\', \'علی\', \'محمدی\', \'decsdsds\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:17:48');
INSERT INTO `log` VALUES ('375', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (96, \'011\', \'645654\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:17:48');
INSERT INTO `log` VALUES ('376', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (96, \'021\', \'645654646\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:17:48');
INSERT INTO `log` VALUES ('377', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (96, \'021\', \'846546\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:17:48');
INSERT INTO `log` VALUES ('378', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (96, \'125\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:17:48');
INSERT INTO `log` VALUES ('379', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (96, \'122\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:17:49');
INSERT INTO `log` VALUES ('380', 'INSERT', 'INSERT INTO `agent_mobile` (`Agent_ID`, `Mobile`) VALUES (96, \'091312\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:17:49');
INSERT INTO `log` VALUES ('381', 'INSERT', 'INSERT INTO `agent_mobile` (`Agent_ID`, `Mobile`) VALUES (96, \'061213\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:17:49');
INSERT INTO `log` VALUES ('382', 'INSERT', 'INSERT INTO `agent_email` (`Agent_ID`, `Email`) VALUES (96, \'asdsas@lasjks.com\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:17:49');
INSERT INTO `log` VALUES ('383', 'INSERT', 'INSERT INTO `company_address` (`Company_ID`, `County_ID`, `Address`) VALUES (231, \'225\', \'Hvnsdljklsjdjsdd\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:17:49');
INSERT INTO `log` VALUES ('384', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'یبسییسیسیب\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:22:09');
INSERT INTO `log` VALUES ('385', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'csdas\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:22:34');
INSERT INTO `log` VALUES ('386', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'ییبسیسی\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-13 17:22:58');
INSERT INTO `log` VALUES ('387', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'asdasasds\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 10:36:16');
INSERT INTO `log` VALUES ('388', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`, `Title`) VALUES (235, \'2\', \'2\', \'j2\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 10:36:16');
INSERT INTO `log` VALUES ('389', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`, `Title`) VALUES (235, \'1\', \'1\', \'j1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 10:36:16');
INSERT INTO `log` VALUES ('390', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`, `Title`) VALUES (235, \'5\', \'5\', \'t5\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 10:36:16');
INSERT INTO `log` VALUES ('391', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`, `Title`) VALUES (235, \'4\', \'4\', \'t4\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 10:36:16');
INSERT INTO `log` VALUES ('392', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'سیسشیسشیشس\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 10:53:05');
INSERT INTO `log` VALUES ('393', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'asdasd\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 11:28:06');
INSERT INTO `log` VALUES ('394', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (237, \'31\', \'asd\', \'آقای\', \'asda\', \'asd\', \'asdsa\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 11:28:06');
INSERT INTO `log` VALUES ('395', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (97, \'\', \'asd\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 11:28:06');
INSERT INTO `log` VALUES ('396', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (97, \'\', \'asd\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 11:28:06');
INSERT INTO `log` VALUES ('397', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (97, \'asd\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 11:28:07');
INSERT INTO `log` VALUES ('398', 'INSERT', 'INSERT INTO `agent_mobile` (`Agent_ID`, `Mobile`) VALUES (97, \'asd\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 11:28:07');
INSERT INTO `log` VALUES ('399', 'INSERT', 'INSERT INTO `agent_email` (`Agent_ID`, `Email`) VALUES (97, \'sad\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 11:28:07');
INSERT INTO `log` VALUES ('400', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Type`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (NULL, \'asdas\', NULL, \'asdas\', \'1\', \'شخص حقوقی\', \'asdsasdasd\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:10:38');
INSERT INTO `log` VALUES ('401', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (238, \'2\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:10:39');
INSERT INTO `log` VALUES ('402', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (238, \'1\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:10:39');
INSERT INTO `log` VALUES ('403', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (238, \'29\', \'asdas\', \'آقای\', \'sdas\', \'asdasa\', \'dasd23424\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:10:39');
INSERT INTO `log` VALUES ('404', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (98, \'d\', \'d\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:10:39');
INSERT INTO `log` VALUES ('405', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (98, \'f\', \'d\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:10:39');
INSERT INTO `log` VALUES ('406', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (98, \'sad\', \'asd\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:10:39');
INSERT INTO `log` VALUES ('407', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (98, \'d\', \'f\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:10:39');
INSERT INTO `log` VALUES ('408', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (98, \'g\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:10:39');
INSERT INTO `log` VALUES ('409', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (98, \'f\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:10:39');
INSERT INTO `log` VALUES ('410', 'INSERT', 'INSERT INTO `agent_mobile` (`Agent_ID`, `Mobile`) VALUES (98, \'2312\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:10:39');
INSERT INTO `log` VALUES ('411', 'INSERT', 'INSERT INTO `agent_mobile` (`Agent_ID`, `Mobile`) VALUES (98, \'2342\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:10:40');
INSERT INTO `log` VALUES ('412', 'INSERT', 'INSERT INTO `agent_email` (`Agent_ID`, `Email`) VALUES (98, \'asdsas\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:10:40');
INSERT INTO `log` VALUES ('413', 'INSERT', 'INSERT INTO `agent_email` (`Agent_ID`, `Email`) VALUES (98, \'asdas\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:10:40');
INSERT INTO `log` VALUES ('414', 'INSERT', 'INSERT INTO `company_address` (`Company_ID`, `County_ID`, `Address`) VALUES (238, \'222\', \'xzcxzxzx\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:10:40');
INSERT INTO `log` VALUES ('415', 'INSERT', 'INSERT INTO `company_address` (`Company_ID`, `County_ID`, `Address`) VALUES (238, \'229\', \'czxzx\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:10:40');
INSERT INTO `log` VALUES ('416', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Type`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (NULL, \'www\', NULL, \'www\', \'1\', \'شخص حقیقی\', \'wwwwww\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:30:35');
INSERT INTO `log` VALUES ('417', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (239, \'14\', \'www\', \'آقای\', \'ww\', \'www\', \'w\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:30:36');
INSERT INTO `log` VALUES ('418', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (99, \'3\', \'33\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:30:36');
INSERT INTO `log` VALUES ('419', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (99, \'3\', \'123\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:30:36');
INSERT INTO `log` VALUES ('420', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (99, \'333\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:30:36');
INSERT INTO `log` VALUES ('421', 'INSERT', 'INSERT INTO `agent_mobile` (`Agent_ID`, `Mobile`) VALUES (99, \'23432\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:30:36');
INSERT INTO `log` VALUES ('422', 'INSERT', 'INSERT INTO `agent_mobile` (`Agent_ID`, `Mobile`) VALUES (99, \'33\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:30:36');
INSERT INTO `log` VALUES ('423', 'INSERT', 'INSERT INTO `agent_email` (`Agent_ID`, `Email`) VALUES (99, \'asdasas\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:30:36');
INSERT INTO `log` VALUES ('424', 'INSERT', 'INSERT INTO `company_address` (`Company_ID`, `County_ID`, `Address`) VALUES (239, \'206\', \'sdfdsdfd\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:30:36');
INSERT INTO `log` VALUES ('425', 'INSERT', 'INSERT INTO `company_address` (`Company_ID`, `County_ID`, `Address`) VALUES (239, \'183\', \'sdsasaasdas\')', '1', '192.168.1.112', '192.168.1.112', '00-FF-6A-AA-95-34', '2018-08-14 12:30:36');
INSERT INTO `log` VALUES ('426', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'ایسوس\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:05');
INSERT INTO `log` VALUES ('427', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (240, \'31\', \'\', \'آقای\', \'ب\', \'ب\', \'\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:05');
INSERT INTO `log` VALUES ('428', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (101, \'7\', \'7\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:05');
INSERT INTO `log` VALUES ('429', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (101, \'5\', \'5\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:06');
INSERT INTO `log` VALUES ('430', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (101, \'6\', \'6\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:06');
INSERT INTO `log` VALUES ('431', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (101, \'8\', \'8\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:06');
INSERT INTO `log` VALUES ('432', 'INSERT', 'INSERT INTO `agent_mobile` (`Agent_ID`, `Mobile`) VALUES (101, \'9\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:06');
INSERT INTO `log` VALUES ('433', 'INSERT', 'INSERT INTO `agent_mobile` (`Agent_ID`, `Mobile`) VALUES (101, \'9\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:06');
INSERT INTO `log` VALUES ('434', 'INSERT', 'INSERT INTO `agent_mobile` (`Agent_ID`, `Mobile`) VALUES (101, \'9\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:06');
INSERT INTO `log` VALUES ('435', 'INSERT', 'INSERT INTO `agent_mobile` (`Agent_ID`, `Mobile`) VALUES (101, \'9\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:07');
INSERT INTO `log` VALUES ('436', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (240, \'31\', \'\', \'آقای\', \'ش\', \'\', \'\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:07');
INSERT INTO `log` VALUES ('437', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (102, \'2\', \'2\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:07');
INSERT INTO `log` VALUES ('438', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (102, \'1\', \'1\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:07');
INSERT INTO `log` VALUES ('439', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (102, \'2\', \'2\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:07');
INSERT INTO `log` VALUES ('440', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (102, \'1\', \'1\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:07');
INSERT INTO `log` VALUES ('441', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (102, \'2\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:07');
INSERT INTO `log` VALUES ('442', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (102, \'1\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:08');
INSERT INTO `log` VALUES ('443', 'INSERT', 'INSERT INTO `agent_mobile` (`Agent_ID`, `Mobile`) VALUES (102, \'2\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:08');
INSERT INTO `log` VALUES ('444', 'INSERT', 'INSERT INTO `agent_mobile` (`Agent_ID`, `Mobile`) VALUES (102, \'1\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:08');
INSERT INTO `log` VALUES ('445', 'INSERT', 'INSERT INTO `agent_email` (`Agent_ID`, `Email`) VALUES (102, \'2\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:08');
INSERT INTO `log` VALUES ('446', 'INSERT', 'INSERT INTO `agent_email` (`Agent_ID`, `Email`) VALUES (102, \'1\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 12:45:08');
INSERT INTO `log` VALUES ('447', 'INSERT', 'INSERT INTO `company` (`Name`, `Brand`, `Register`, `Type`, `Email`, `Site`, `SubCategory_ID`, `Category`, `Description`) VALUES (\'titan\', \'\', \'\', \'نا مشخص\', \'\', \'\', \'1\', \'شخص حقوقی\', \'\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:11');
INSERT INTO `log` VALUES ('448', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (241, \'2\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:11');
INSERT INTO `log` VALUES ('449', 'INSERT', 'INSERT INTO `company_label` (`Company_ID`, `Label_ID`) VALUES (241, \'1\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:11');
INSERT INTO `log` VALUES ('450', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`, `Title`) VALUES (241, \'3\', \'3\', \'asdd\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:11');
INSERT INTO `log` VALUES ('451', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`, `Title`) VALUES (241, \'1\', \'1\', \'asdas\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:12');
INSERT INTO `log` VALUES ('452', 'INSERT', 'INSERT INTO `company_tell` (`Company_ID`, `Code`, `Tell`, `Title`) VALUES (241, \'2\', \'2\', \'asdas\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:12');
INSERT INTO `log` VALUES ('453', 'INSERT', 'INSERT INTO `company_fax` (`Company_ID`, `Code`, `Fax`, `Title`) VALUES (241, \'1\', \'1\', \'asdas\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:12');
INSERT INTO `log` VALUES ('454', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (241, \'31\', \'\', \'آقای\', \'b\', \'\', \'1\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:12');
INSERT INTO `log` VALUES ('455', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (103, \'3\', \'3\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:12');
INSERT INTO `log` VALUES ('456', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (103, \'1\', \'1\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:12');
INSERT INTO `log` VALUES ('457', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (103, \'2\', \'2\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:12');
INSERT INTO `log` VALUES ('458', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (103, \'1\', \'1\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:12');
INSERT INTO `log` VALUES ('459', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (103, \'1\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:13');
INSERT INTO `log` VALUES ('460', 'INSERT', 'INSERT INTO `agent_mobile` (`Agent_ID`, `Mobile`) VALUES (103, \'1\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:13');
INSERT INTO `log` VALUES ('461', 'INSERT', 'INSERT INTO `agent_email` (`Agent_ID`, `Email`) VALUES (103, \'1\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:13');
INSERT INTO `log` VALUES ('462', 'INSERT', 'INSERT INTO `company_agent` (`Company_ID`, `Department_ID`, `Post`, `Prefix`, `FN`, `LN`, `Description`) VALUES (241, \'31\', \'\', \'آقای\', \'a\', \'\', \'asdds\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:13');
INSERT INTO `log` VALUES ('463', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (104, \'s\', \'s\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:13');
INSERT INTO `log` VALUES ('464', 'INSERT', 'INSERT INTO `agent_tell` (`Agent_ID`, `Code`, `Tell`) VALUES (104, \'a\', \'a\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:13');
INSERT INTO `log` VALUES ('465', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (104, \'2\', \'2\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:13');
INSERT INTO `log` VALUES ('466', 'INSERT', 'INSERT INTO `agent_fax` (`Agent_ID`, `Code`, `Fax`) VALUES (104, \'1\', \'1\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:14');
INSERT INTO `log` VALUES ('467', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (104, \'4\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:14');
INSERT INTO `log` VALUES ('468', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (104, \'2\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:14');
INSERT INTO `log` VALUES ('469', 'INSERT', 'INSERT INTO `agent_internal` (`Agent_ID`, `Internal`) VALUES (104, \'3\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:14');
INSERT INTO `log` VALUES ('470', 'INSERT', 'INSERT INTO `agent_mobile` (`Agent_ID`, `Mobile`) VALUES (104, \'6\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:14');
INSERT INTO `log` VALUES ('471', 'INSERT', 'INSERT INTO `agent_mobile` (`Agent_ID`, `Mobile`) VALUES (104, \'3\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:14');
INSERT INTO `log` VALUES ('472', 'INSERT', 'INSERT INTO `agent_mobile` (`Agent_ID`, `Mobile`) VALUES (104, \'4\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:14');
INSERT INTO `log` VALUES ('473', 'INSERT', 'INSERT INTO `agent_email` (`Agent_ID`, `Email`) VALUES (104, \'2\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:15');
INSERT INTO `log` VALUES ('474', 'INSERT', 'INSERT INTO `agent_email` (`Agent_ID`, `Email`) VALUES (104, \'1\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:15');
INSERT INTO `log` VALUES ('475', 'INSERT', 'INSERT INTO `company_address` (`Company_ID`, `County_ID`, `Address`) VALUES (241, \'205\', \'asddasaas\')', '1', '192.168.1.112', '192.168.1.112', 'F0-79-59-5B-44-53', '2018-08-21 16:09:15');

-- ----------------------------
-- Table structure for priority
-- ----------------------------
DROP TABLE IF EXISTS `priority`;
CREATE TABLE `priority` (
  `PID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of priority
-- ----------------------------

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `PID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `StartDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `EndDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Budjet` int(10) DEFAULT NULL COMMENT 'بودجه پروژه',
  `Admin_ID` int(10) unsigned DEFAULT NULL COMMENT 'مدیر پروژه',
  `Scale` enum('Small Scale','Medium Scale','Large Scale') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ابعاد پروژه',
  `StaffNo` int(4) DEFAULT NULL COMMENT 'تعداد پرسنل',
  `Description` longtext COLLATE utf8_unicode_ci,
  `State_ID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`PID`),
  KEY `peoject_ibfk_1` (`Admin_ID`),
  KEY `State_ID` (`State_ID`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `admins` (`AID`) ON UPDATE CASCADE,
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`State_ID`) REFERENCES `project_states` (`SID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of project
-- ----------------------------

-- ----------------------------
-- Table structure for project_company_label
-- ----------------------------
DROP TABLE IF EXISTS `project_company_label`;
CREATE TABLE `project_company_label` (
  `LID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Company_ID` int(10) unsigned DEFAULT NULL,
  `Project_ID` int(10) unsigned DEFAULT NULL,
  `Label_ID` int(10) unsigned DEFAULT NULL,
  `Description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LID`),
  KEY `Company_ID` (`Company_ID`),
  KEY `Project_ID` (`Project_ID`),
  KEY `Label_ID` (`Label_ID`),
  CONSTRAINT `project_company_label_ibfk_1` FOREIGN KEY (`Company_ID`) REFERENCES `company` (`CID`) ON UPDATE CASCADE,
  CONSTRAINT `project_company_label_ibfk_2` FOREIGN KEY (`Project_ID`) REFERENCES `project` (`PID`) ON UPDATE CASCADE,
  CONSTRAINT `project_company_label_ibfk_3` FOREIGN KEY (`Label_ID`) REFERENCES `labels` (`LID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of project_company_label
-- ----------------------------

-- ----------------------------
-- Table structure for project_label
-- ----------------------------
DROP TABLE IF EXISTS `project_label`;
CREATE TABLE `project_label` (
  `LID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Project_ID` int(10) unsigned DEFAULT NULL,
  `Label_ID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`LID`),
  KEY `Project_ID` (`Project_ID`),
  KEY `Label_ID` (`Label_ID`),
  CONSTRAINT `project_label_ibfk_1` FOREIGN KEY (`Project_ID`) REFERENCES `project` (`PID`) ON UPDATE CASCADE,
  CONSTRAINT `project_label_ibfk_2` FOREIGN KEY (`Label_ID`) REFERENCES `labels` (`LID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of project_label
-- ----------------------------

-- ----------------------------
-- Table structure for project_states
-- ----------------------------
DROP TABLE IF EXISTS `project_states`;
CREATE TABLE `project_states` (
  `SID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of project_states
-- ----------------------------

-- ----------------------------
-- Table structure for project_user_label
-- ----------------------------
DROP TABLE IF EXISTS `project_user_label`;
CREATE TABLE `project_user_label` (
  `LID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `User_ID` int(10) unsigned DEFAULT NULL,
  `Project_ID` int(10) unsigned DEFAULT NULL,
  `Label_ID` int(10) unsigned DEFAULT NULL,
  `Description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LID`),
  KEY `User_ID` (`User_ID`),
  KEY `Project_ID` (`Project_ID`),
  KEY `Label_ID` (`Label_ID`),
  CONSTRAINT `project_user_label_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`UID`) ON UPDATE CASCADE,
  CONSTRAINT `project_user_label_ibfk_2` FOREIGN KEY (`Project_ID`) REFERENCES `project` (`PID`) ON UPDATE CASCADE,
  CONSTRAINT `project_user_label_ibfk_3` FOREIGN KEY (`Label_ID`) REFERENCES `labels` (`LID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of project_user_label
-- ----------------------------

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

-- ----------------------------
-- Table structure for subcategory
-- ----------------------------
DROP TABLE IF EXISTS `subcategory`;
CREATE TABLE `subcategory` (
  `SCID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Category_ID` int(10) unsigned DEFAULT NULL,
  `Title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCID`),
  KEY `subcategory_ibfk_1` (`Category_ID`),
  CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`CID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of subcategory
-- ----------------------------
INSERT INTO `subcategory` VALUES ('1', '1', 'سایر');
INSERT INTO `subcategory` VALUES ('2', '2', 'تبلت');
INSERT INTO `subcategory` VALUES ('3', '2', 'لپ تاپ');
INSERT INTO `subcategory` VALUES ('4', '3', 'نوشیدنی');

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `TID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Develop_ID` int(10) unsigned DEFAULT NULL,
  `Date` timestamp NULL DEFAULT NULL,
  `Task` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TaskType_ID` int(10) unsigned DEFAULT NULL,
  `State_ID` int(10) unsigned DEFAULT NULL,
  `Priority_ID` int(10) unsigned DEFAULT NULL,
  `Description` longtext COLLATE utf8_unicode_ci,
  `Alarm` timestamp NULL DEFAULT NULL,
  `Alarm_Desc` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Creaeted` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TID`),
  KEY `tasks_ibfk_1` (`Develop_ID`),
  KEY `Priority_ID` (`Priority_ID`),
  KEY `TaskType_ID` (`TaskType_ID`),
  KEY `State_ID` (`State_ID`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`Develop_ID`) REFERENCES `development` (`DID`) ON UPDATE CASCADE,
  CONSTRAINT `tasks_ibfk_3` FOREIGN KEY (`Priority_ID`) REFERENCES `priority` (`PID`) ON UPDATE CASCADE,
  CONSTRAINT `tasks_ibfk_4` FOREIGN KEY (`TaskType_ID`) REFERENCES `task_types` (`TID`) ON UPDATE CASCADE,
  CONSTRAINT `tasks_ibfk_5` FOREIGN KEY (`State_ID`) REFERENCES `task_states` (`SID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tasks
-- ----------------------------

-- ----------------------------
-- Table structure for task_label
-- ----------------------------
DROP TABLE IF EXISTS `task_label`;
CREATE TABLE `task_label` (
  `LID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Task_ID` int(10) unsigned DEFAULT NULL,
  `Label_ID` int(10) unsigned DEFAULT NULL,
  `Description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LID`),
  KEY `Task_ID` (`Task_ID`),
  KEY `Label_ID` (`Label_ID`),
  CONSTRAINT `task_label_ibfk_1` FOREIGN KEY (`Task_ID`) REFERENCES `tasks` (`TID`) ON UPDATE CASCADE,
  CONSTRAINT `task_label_ibfk_2` FOREIGN KEY (`Label_ID`) REFERENCES `labels` (`LID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of task_label
-- ----------------------------

-- ----------------------------
-- Table structure for task_postpone
-- ----------------------------
DROP TABLE IF EXISTS `task_postpone`;
CREATE TABLE `task_postpone` (
  `PID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Task_ID` int(10) unsigned DEFAULT NULL,
  `Date` timestamp NULL DEFAULT NULL,
  `Description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`PID`),
  KEY `Task_ID` (`Task_ID`),
  CONSTRAINT `task_postpone_ibfk_1` FOREIGN KEY (`Task_ID`) REFERENCES `tasks` (`TID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of task_postpone
-- ----------------------------

-- ----------------------------
-- Table structure for task_states
-- ----------------------------
DROP TABLE IF EXISTS `task_states`;
CREATE TABLE `task_states` (
  `SID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of task_states
-- ----------------------------

-- ----------------------------
-- Table structure for task_types
-- ----------------------------
DROP TABLE IF EXISTS `task_types`;
CREATE TABLE `task_types` (
  `TID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`TID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of task_types
-- ----------------------------
INSERT INTO `task_types` VALUES ('1', 'فکس');
INSERT INTO `task_types` VALUES ('2', 'ایمیل');
INSERT INTO `task_types` VALUES ('3', 'تلفن');
INSERT INTO `task_types` VALUES ('4', 'پیگیری');
INSERT INTO `task_types` VALUES ('5', 'ملاقات');
INSERT INTO `task_types` VALUES ('6', 'پیامک');
INSERT INTO `task_types` VALUES ('7', 'شبکه اجتماعی');
INSERT INTO `task_types` VALUES ('8', 'همایش');
INSERT INTO `task_types` VALUES ('9', 'جشن');
INSERT INTO `task_types` VALUES ('10', 'سمینار');
INSERT INTO `task_types` VALUES ('11', 'دفتری و اداری');
INSERT INTO `task_types` VALUES ('12', 'حضور');
INSERT INTO `task_types` VALUES ('13', 'بانکی');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `UID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `User_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LN` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Mobile` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` char(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
