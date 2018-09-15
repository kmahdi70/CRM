/*
Navicat MySQL Data Transfer

Source Server         : localhot
Source Server Version : 100116
Source Host           : localhost:3306
Source Database       : crmnew

Target Server Type    : MYSQL
Target Server Version : 100116
File Encoding         : 65001

Date: 2018-09-12 15:23:48
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `AccountManager_ID` int(10) unsigned DEFAULT NULL,
  `Description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CID`),
  KEY `company_ibfk_2` (`SubCategory_ID`),
  KEY `AccountManager_ID` (`AccountManager_ID`),
  CONSTRAINT `company_ibfk_2` FOREIGN KEY (`SubCategory_ID`) REFERENCES `subcategory` (`SCID`) ON UPDATE CASCADE,
  CONSTRAINT `company_ibfk_3` FOREIGN KEY (`AccountManager_ID`) REFERENCES `users` (`UID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `DID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `Description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DID`),
  KEY `development_ibfk_1` (`Project_ID`),
  KEY `development_ibfk_2` (`State_ID`),
  KEY `development_ibfk_3` (`User_ID`),
  KEY `development_ibfk_4` (`Company_ID`),
  CONSTRAINT `development_ibfk_1` FOREIGN KEY (`Project_ID`) REFERENCES `project` (`PID`) ON UPDATE CASCADE,
  CONSTRAINT `development_ibfk_2` FOREIGN KEY (`State_ID`) REFERENCES `dev_states` (`SID`) ON UPDATE CASCADE,
  CONSTRAINT `development_ibfk_3` FOREIGN KEY (`User_ID`) REFERENCES `users` (`UID`) ON UPDATE CASCADE,
  CONSTRAINT `development_ibfk_4` FOREIGN KEY (`Company_ID`) REFERENCES `company` (`CID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for dev_states
-- ----------------------------
DROP TABLE IF EXISTS `dev_states`;
CREATE TABLE `dev_states` (
  `SID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for fax
-- ----------------------------
DROP TABLE IF EXISTS `fax`;
CREATE TABLE `fax` (
  `FID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Task_ID` int(10) unsigned DEFAULT NULL,
  `Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`FID`),
  KEY `Task_ID` (`Task_ID`),
  CONSTRAINT `fax_ibfk_1` FOREIGN KEY (`Task_ID`) REFERENCES `tasks` (`TID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for finance
-- ----------------------------
DROP TABLE IF EXISTS `finance`;
CREATE TABLE `finance` (
  `FID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Develop_ID` int(10) unsigned DEFAULT NULL,
  `Date` timestamp NULL DEFAULT NULL,
  `Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Price` int(12) DEFAULT '0',
  `Cash` int(12) DEFAULT '0',
  `Description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`FID`),
  KEY `Development_ID` (`Develop_ID`),
  CONSTRAINT `finance_ibfk_1` FOREIGN KEY (`Develop_ID`) REFERENCES `development` (`DID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=558 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for priority
-- ----------------------------
DROP TABLE IF EXISTS `priority`;
CREATE TABLE `priority` (
  `PID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Table structure for project_states
-- ----------------------------
DROP TABLE IF EXISTS `project_states`;
CREATE TABLE `project_states` (
  `SID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for task_states
-- ----------------------------
DROP TABLE IF EXISTS `task_states`;
CREATE TABLE `task_states` (
  `SID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for task_types
-- ----------------------------
DROP TABLE IF EXISTS `task_types`;
CREATE TABLE `task_types` (
  `TID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`TID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `time` timestamp NULL DEFAULT NULL
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
