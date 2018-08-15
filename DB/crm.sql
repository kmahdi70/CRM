/*
Navicat MySQL Data Transfer

Source Server         : localhot
Source Server Version : 100116
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 100116
File Encoding         : 65001

Date: 2018-08-07 09:08:47
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `CID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` smallint(5) unsigned NOT NULL,
  `province_id` smallint(5) unsigned NOT NULL,
  `county_id` smallint(5) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `CEO` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Category_ID` int(10) unsigned DEFAULT NULL,
  `SubCategory_ID` int(10) unsigned DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tell` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fax` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Mobile` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Site` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`CID`),
  KEY `company_ibfk_1` (`Category_ID`),
  KEY `company_ibfk_2` (`SubCategory_ID`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`CID`) ON UPDATE CASCADE,
  CONSTRAINT `company_ibfk_2` FOREIGN KEY (`SubCategory_ID`) REFERENCES `subcategory` (`SCID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for company_address
-- ----------------------------
DROP TABLE IF EXISTS `company_address`;
CREATE TABLE `company_address` (
  `AID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Company_ID` int(10) unsigned DEFAULT NULL,
  `Province_ID` smallint(5) unsigned DEFAULT NULL,
  `County_ID` smallint(5) unsigned DEFAULT NULL,
  `Address` longtext COLLATE utf8_unicode_ci,
  `Title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AID`),
  KEY `company_address_ibfk_1` (`Company_ID`),
  KEY `company_address_ibfk_2` (`Province_ID`),
  KEY `company_address_ibfk_3` (`County_ID`),
  CONSTRAINT `company_address_ibfk_1` FOREIGN KEY (`Company_ID`) REFERENCES `company` (`CID`) ON UPDATE CASCADE,
  CONSTRAINT `company_address_ibfk_2` FOREIGN KEY (`Province_ID`) REFERENCES `province` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `company_address_ibfk_3` FOREIGN KEY (`County_ID`) REFERENCES `county` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for company_agent
-- ----------------------------
DROP TABLE IF EXISTS `company_agent`;
CREATE TABLE `company_agent` (
  `AID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Company_ID` int(10) unsigned DEFAULT NULL,
  `Section` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Post` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Add` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LN` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tell` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fax` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Mobile` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SocialNID` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AID`),
  KEY `company_agent_ibfk_1` (`Company_ID`),
  CONSTRAINT `company_agent_ibfk_1` FOREIGN KEY (`Company_ID`) REFERENCES `company` (`CID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for company_tell
-- ----------------------------
DROP TABLE IF EXISTS `company_tell`;
CREATE TABLE `company_tell` (
  `TID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Address_ID` int(10) unsigned DEFAULT NULL,
  `Tell` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fax` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`TID`),
  KEY `company_tell_ibfk_1` (`Address_ID`),
  CONSTRAINT `company_tell_ibfk_1` FOREIGN KEY (`Address_ID`) REFERENCES `company_address` (`AID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  CONSTRAINT `development_ibfk_1` FOREIGN KEY (`Project_ID`) REFERENCES `peoject` (`PID`) ON UPDATE CASCADE,
  CONSTRAINT `development_ibfk_2` FOREIGN KEY (`State_ID`) REFERENCES `states` (`SID`) ON UPDATE CASCADE,
  CONSTRAINT `development_ibfk_3` FOREIGN KEY (`User_ID`) REFERENCES `users` (`UID`) ON UPDATE CASCADE,
  CONSTRAINT `development_ibfk_4` FOREIGN KEY (`Company_ID`) REFERENCES `company` (`CID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for peoject
-- ----------------------------
DROP TABLE IF EXISTS `peoject`;
CREATE TABLE `peoject` (
  `PID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `StartDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `EndDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Budjet` int(10) DEFAULT NULL COMMENT 'بودجه پروژه',
  `Admin_ID` int(10) unsigned DEFAULT NULL COMMENT 'مدیر پروژه',
  `Scale` enum('Small Scale','Medium Scale','Large Scale') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ابعاد پروژه',
  `StaffNo` int(4) DEFAULT NULL COMMENT 'تعداد پرسنل',
  `Description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`PID`),
  KEY `peoject_ibfk_1` (`Admin_ID`),
  CONSTRAINT `peoject_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `admins` (`AID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Table structure for states
-- ----------------------------
DROP TABLE IF EXISTS `states`;
CREATE TABLE `states` (
  `SID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `TID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Develop_ID` int(10) unsigned DEFAULT NULL,
  `Date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Task` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `State` enum('') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Task_ID` int(10) unsigned DEFAULT NULL,
  `Description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`TID`),
  KEY `tasks_ibfk_1` (`Develop_ID`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`Develop_ID`) REFERENCES `development` (`DID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
