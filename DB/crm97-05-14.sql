/*
Navicat MySQL Data Transfer

Source Server         : localhot
Source Server Version : 100116
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 100116
File Encoding         : 65001

Date: 2018-08-05 17:16:34
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
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', 'Admin', 'Admin', null, null, null, '356a192b7913b04c54574d18c28d46e6395428ab');
INSERT INTO `admins` VALUES ('2', 'larni', 'سعیده', 'لرنی', null, null, null, '4d9012b4a77a9524d675dad27c3276ab5705e5e8');

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
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('3', 'سایر');
INSERT INTO `category` VALUES ('9', 'بانک، بیمه و سرمایه گذاری');
INSERT INTO `category` VALUES ('10', 'فناوری اطلاعات و ارتباطات');
INSERT INTO `category` VALUES ('11', 'رسانه ها');
INSERT INTO `category` VALUES ('12', 'نفت، گاز، پالایش و پتروشیمی');
INSERT INTO `category` VALUES ('13', 'صنایع غذایی');
INSERT INTO `category` VALUES ('14', 'اداری‌و‌ساختمانی');
INSERT INTO `category` VALUES ('15', 'دیجیتال');
INSERT INTO `category` VALUES ('16', 'لوازم خانگی');
INSERT INTO `category` VALUES ('17', '500 شرکت برتر');
INSERT INTO `category` VALUES ('19', 'sdsadas');

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
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '1', '1', 'آذرشهر');
INSERT INTO `city` VALUES ('2', '1', '1', 'تیمورلو');
INSERT INTO `city` VALUES ('3', '1', '1', 'گوگان');
INSERT INTO `city` VALUES ('4', '1', '1', 'ممقان');
INSERT INTO `city` VALUES ('5', '1', '2', 'اسکو');
INSERT INTO `city` VALUES ('6', '1', '2', 'ایلخچی');
INSERT INTO `city` VALUES ('7', '1', '2', 'سهند');
INSERT INTO `city` VALUES ('8', '1', '3', 'اهر');
INSERT INTO `city` VALUES ('9', '1', '3', 'هوراند');
INSERT INTO `city` VALUES ('10', '1', '4', 'بستان آباد');
INSERT INTO `city` VALUES ('11', '1', '4', 'تیکمه داش');
INSERT INTO `city` VALUES ('12', '1', '5', 'بناب');
INSERT INTO `city` VALUES ('13', '1', '6', 'باسمنج');
INSERT INTO `city` VALUES ('14', '1', '6', 'تبریز');
INSERT INTO `city` VALUES ('15', '1', '6', 'خسروشاه');
INSERT INTO `city` VALUES ('16', '1', '6', 'سردرود');
INSERT INTO `city` VALUES ('17', '1', '7', 'جلفا');
INSERT INTO `city` VALUES ('18', '1', '7', 'سیه رود');
INSERT INTO `city` VALUES ('19', '1', '7', 'هادیشهر');
INSERT INTO `city` VALUES ('20', '1', '8', 'قره آغاج');
INSERT INTO `city` VALUES ('21', '1', '9', 'خمارلو');
INSERT INTO `city` VALUES ('22', '1', '10', 'دوزدوزان');
INSERT INTO `city` VALUES ('23', '1', '10', 'سراب');
INSERT INTO `city` VALUES ('24', '1', '10', 'شربیان');
INSERT INTO `city` VALUES ('25', '1', '10', 'مهربان');
INSERT INTO `city` VALUES ('26', '1', '11', 'تسوج');
INSERT INTO `city` VALUES ('27', '1', '11', 'خامنه');
INSERT INTO `city` VALUES ('28', '1', '11', 'سیس');
INSERT INTO `city` VALUES ('29', '1', '11', 'شبستر');
INSERT INTO `city` VALUES ('30', '1', '11', 'شرفخانه');
INSERT INTO `city` VALUES ('31', '1', '11', 'شندآباد');
INSERT INTO `city` VALUES ('32', '1', '11', 'صوفیان');
INSERT INTO `city` VALUES ('33', '1', '11', 'کوزه کنان');
INSERT INTO `city` VALUES ('34', '1', '11', 'وایقان');
INSERT INTO `city` VALUES ('35', '1', '12', 'جوان قلعه');
INSERT INTO `city` VALUES ('36', '1', '12', 'عجب شیر');
INSERT INTO `city` VALUES ('37', '1', '13', 'آبش احمد');
INSERT INTO `city` VALUES ('38', '1', '13', 'کلیبر');
INSERT INTO `city` VALUES ('39', '1', '14', 'خداجو(خراجو)');
INSERT INTO `city` VALUES ('40', '1', '14', 'مراغه');
INSERT INTO `city` VALUES ('41', '1', '15', 'بناب مرند');
INSERT INTO `city` VALUES ('42', '1', '15', 'زنوز');
INSERT INTO `city` VALUES ('43', '1', '15', 'کشکسرای');
INSERT INTO `city` VALUES ('44', '1', '15', 'مرند');
INSERT INTO `city` VALUES ('45', '1', '15', 'یامچی');
INSERT INTO `city` VALUES ('46', '1', '16', 'لیلان');
INSERT INTO `city` VALUES ('47', '1', '16', 'مبارک شهر');
INSERT INTO `city` VALUES ('48', '1', '16', 'ملکان');
INSERT INTO `city` VALUES ('49', '1', '17', 'آقکند');
INSERT INTO `city` VALUES ('50', '1', '17', 'اچاچی');
INSERT INTO `city` VALUES ('51', '1', '17', 'ترک');
INSERT INTO `city` VALUES ('52', '1', '17', 'ترکمانچای');
INSERT INTO `city` VALUES ('53', '1', '17', 'میانه');
INSERT INTO `city` VALUES ('54', '1', '18', 'خاروانا');
INSERT INTO `city` VALUES ('55', '1', '18', 'ورزقان');
INSERT INTO `city` VALUES ('56', '1', '19', 'بخشایش');
INSERT INTO `city` VALUES ('57', '1', '19', 'خواجه');
INSERT INTO `city` VALUES ('58', '1', '19', 'زرنق');
INSERT INTO `city` VALUES ('59', '1', '19', 'کلوانق');
INSERT INTO `city` VALUES ('60', '1', '19', 'هریس');
INSERT INTO `city` VALUES ('61', '1', '20', 'نظرکهریزی');
INSERT INTO `city` VALUES ('62', '1', '20', 'هشترود');
INSERT INTO `city` VALUES ('63', '2', '21', 'ارومیه');
INSERT INTO `city` VALUES ('64', '2', '21', 'سرو');
INSERT INTO `city` VALUES ('65', '2', '21', 'سیلوانه');
INSERT INTO `city` VALUES ('66', '2', '21', 'قوشچی');
INSERT INTO `city` VALUES ('67', '2', '21', 'نوشین');
INSERT INTO `city` VALUES ('68', '2', '22', 'اشنویه');
INSERT INTO `city` VALUES ('69', '2', '22', 'نالوس');
INSERT INTO `city` VALUES ('70', '2', '23', 'بوکان');
INSERT INTO `city` VALUES ('71', '2', '23', 'سیمینه');
INSERT INTO `city` VALUES ('72', '2', '24', 'پلدشت');
INSERT INTO `city` VALUES ('73', '2', '24', 'نازک علیا');
INSERT INTO `city` VALUES ('74', '2', '25', 'پیرانشهر');
INSERT INTO `city` VALUES ('75', '2', '25', 'گردکشانه');
INSERT INTO `city` VALUES ('76', '2', '26', 'تکاب');
INSERT INTO `city` VALUES ('77', '2', '27', 'آواجیق');
INSERT INTO `city` VALUES ('78', '2', '27', 'سیه چشمه');
INSERT INTO `city` VALUES ('79', '2', '28', 'قره ضیاءالدین');
INSERT INTO `city` VALUES ('80', '2', '29', 'ایواوغلی');
INSERT INTO `city` VALUES ('81', '2', '29', 'خوی');
INSERT INTO `city` VALUES ('82', '2', '29', 'دیزج دیز');
INSERT INTO `city` VALUES ('83', '2', '29', 'زرآباد');
INSERT INTO `city` VALUES ('84', '2', '29', 'فیرورق');
INSERT INTO `city` VALUES ('85', '2', '29', 'قطور');
INSERT INTO `city` VALUES ('86', '2', '30', 'ربط');
INSERT INTO `city` VALUES ('87', '2', '30', 'سردشت');
INSERT INTO `city` VALUES ('88', '2', '30', 'میرآباد');
INSERT INTO `city` VALUES ('89', '2', '31', 'تازه شهر');
INSERT INTO `city` VALUES ('90', '2', '31', 'سلماس');
INSERT INTO `city` VALUES ('91', '2', '32', 'شاهین دژ');
INSERT INTO `city` VALUES ('92', '2', '32', 'کشاورز');
INSERT INTO `city` VALUES ('93', '2', '32', 'محمودآباد');
INSERT INTO `city` VALUES ('94', '2', '33', 'شوط');
INSERT INTO `city` VALUES ('95', '2', '33', 'مرگنلر');
INSERT INTO `city` VALUES ('96', '2', '34', 'بازرگان');
INSERT INTO `city` VALUES ('97', '2', '34', 'ماکو');
INSERT INTO `city` VALUES ('98', '2', '35', 'خلیفان');
INSERT INTO `city` VALUES ('99', '2', '35', 'مهاباد');
INSERT INTO `city` VALUES ('100', '2', '36', 'باروق');
INSERT INTO `city` VALUES ('101', '2', '36', 'چهاربرج');
INSERT INTO `city` VALUES ('102', '2', '36', 'میاندوآب');
INSERT INTO `city` VALUES ('103', '2', '37', 'محمدیار');
INSERT INTO `city` VALUES ('104', '2', '37', 'نقده');
INSERT INTO `city` VALUES ('105', '3', '38', 'اردبیل');
INSERT INTO `city` VALUES ('106', '3', '38', 'هیر');
INSERT INTO `city` VALUES ('107', '3', '39', 'بیله سوار');
INSERT INTO `city` VALUES ('108', '3', '39', 'جعفرآباد');
INSERT INTO `city` VALUES ('109', '3', '40', 'اسلام اباد');
INSERT INTO `city` VALUES ('110', '3', '40', 'اصلاندوز');
INSERT INTO `city` VALUES ('111', '3', '40', 'پارس آباد');
INSERT INTO `city` VALUES ('112', '3', '40', 'تازه کند');
INSERT INTO `city` VALUES ('113', '3', '41', 'خلخال');
INSERT INTO `city` VALUES ('114', '3', '41', 'کلور');
INSERT INTO `city` VALUES ('115', '3', '41', 'هشتجین');
INSERT INTO `city` VALUES ('116', '3', '42', 'سرعین');
INSERT INTO `city` VALUES ('117', '3', '43', 'گیوی');
INSERT INTO `city` VALUES ('118', '3', '44', 'تازه کندانگوت');
INSERT INTO `city` VALUES ('119', '3', '44', 'گرمی');
INSERT INTO `city` VALUES ('120', '3', '45', 'رضی');
INSERT INTO `city` VALUES ('121', '3', '45', 'فخراباد');
INSERT INTO `city` VALUES ('122', '3', '45', 'قصابه');
INSERT INTO `city` VALUES ('123', '3', '45', 'لاهرود');
INSERT INTO `city` VALUES ('124', '3', '45', 'مرادلو');
INSERT INTO `city` VALUES ('125', '3', '45', 'مشگین شهر');
INSERT INTO `city` VALUES ('126', '3', '46', 'آبی بیگلو');
INSERT INTO `city` VALUES ('127', '3', '46', 'عنبران');
INSERT INTO `city` VALUES ('128', '3', '46', 'نمین');
INSERT INTO `city` VALUES ('129', '3', '47', 'کوراییم');
INSERT INTO `city` VALUES ('130', '3', '47', 'نیر');
INSERT INTO `city` VALUES ('131', '4', '48', 'آران وبیدگل');
INSERT INTO `city` VALUES ('132', '4', '48', 'ابوزیدآباد');
INSERT INTO `city` VALUES ('133', '4', '48', 'سفیدشهر');
INSERT INTO `city` VALUES ('134', '4', '48', 'نوش آباد');
INSERT INTO `city` VALUES ('135', '4', '49', 'اردستان');
INSERT INTO `city` VALUES ('136', '4', '49', 'زواره');
INSERT INTO `city` VALUES ('137', '4', '49', 'مهاباد');
INSERT INTO `city` VALUES ('138', '4', '50', 'اژیه');
INSERT INTO `city` VALUES ('139', '4', '50', 'اصفهان');
INSERT INTO `city` VALUES ('140', '4', '50', 'بهارستان');
INSERT INTO `city` VALUES ('141', '4', '50', 'تودشک');
INSERT INTO `city` VALUES ('142', '4', '50', 'حسن اباد');
INSERT INTO `city` VALUES ('143', '4', '50', 'زیار');
INSERT INTO `city` VALUES ('144', '4', '50', 'سجزی');
INSERT INTO `city` VALUES ('145', '4', '50', 'قهجاورستان');
INSERT INTO `city` VALUES ('146', '4', '50', 'کوهپایه');
INSERT INTO `city` VALUES ('147', '4', '50', 'محمدآباد');
INSERT INTO `city` VALUES ('148', '4', '50', 'نصرآباد');
INSERT INTO `city` VALUES ('149', '4', '50', 'نیک آباد');
INSERT INTO `city` VALUES ('150', '4', '50', 'ورزنه');
INSERT INTO `city` VALUES ('151', '4', '50', 'هرند');
INSERT INTO `city` VALUES ('152', '4', '51', 'حبیب آباد');
INSERT INTO `city` VALUES ('153', '4', '51', 'خورزوق');
INSERT INTO `city` VALUES ('154', '4', '51', 'دستگرد');
INSERT INTO `city` VALUES ('155', '4', '51', 'دولت آباد');
INSERT INTO `city` VALUES ('156', '4', '51', 'سین');
INSERT INTO `city` VALUES ('157', '4', '51', 'شاپورآباد');
INSERT INTO `city` VALUES ('158', '4', '51', 'کمشچه');
INSERT INTO `city` VALUES ('159', '4', '52', 'افوس');
INSERT INTO `city` VALUES ('160', '4', '52', 'بویین ومیاندشت');
INSERT INTO `city` VALUES ('161', '4', '53', 'تیران');
INSERT INTO `city` VALUES ('162', '4', '53', 'رضوانشهر');
INSERT INTO `city` VALUES ('163', '4', '53', 'عسگران');
INSERT INTO `city` VALUES ('164', '4', '54', 'چادگان');
INSERT INTO `city` VALUES ('165', '4', '54', 'رزوه');
INSERT INTO `city` VALUES ('166', '4', '55', 'اصغرآباد');
INSERT INTO `city` VALUES ('167', '4', '55', 'خمینی شهر');
INSERT INTO `city` VALUES ('168', '4', '55', 'درچه');
INSERT INTO `city` VALUES ('169', '4', '55', 'کوشک');
INSERT INTO `city` VALUES ('170', '4', '56', 'خوانسار');
INSERT INTO `city` VALUES ('171', '4', '57', 'جندق');
INSERT INTO `city` VALUES ('172', '4', '57', 'خور');
INSERT INTO `city` VALUES ('173', '4', '57', 'فرخی');
INSERT INTO `city` VALUES ('174', '4', '58', 'دهاقان');
INSERT INTO `city` VALUES ('175', '4', '58', 'گلشن');
INSERT INTO `city` VALUES ('176', '4', '59', 'حنا');
INSERT INTO `city` VALUES ('177', '4', '59', 'سمیرم');
INSERT INTO `city` VALUES ('178', '4', '59', 'کمه');
INSERT INTO `city` VALUES ('179', '4', '59', 'ونک');
INSERT INTO `city` VALUES ('180', '4', '60', 'شاهین شهر');
INSERT INTO `city` VALUES ('181', '4', '60', 'گرگاب');
INSERT INTO `city` VALUES ('182', '4', '60', 'گزبرخوار');
INSERT INTO `city` VALUES ('183', '4', '60', 'لای بید');
INSERT INTO `city` VALUES ('184', '4', '60', 'میمه');
INSERT INTO `city` VALUES ('185', '4', '60', 'وزوان');
INSERT INTO `city` VALUES ('186', '4', '61', 'شهرضا');
INSERT INTO `city` VALUES ('187', '4', '61', 'منظریه');
INSERT INTO `city` VALUES ('188', '4', '62', 'داران');
INSERT INTO `city` VALUES ('189', '4', '62', 'دامنه');
INSERT INTO `city` VALUES ('190', '4', '63', 'برف انبار');
INSERT INTO `city` VALUES ('191', '4', '63', 'فریدونشهر');
INSERT INTO `city` VALUES ('192', '4', '64', 'ابریشم');
INSERT INTO `city` VALUES ('193', '4', '64', 'ایمانشهر');
INSERT INTO `city` VALUES ('194', '4', '64', 'بهاران شهر');
INSERT INTO `city` VALUES ('195', '4', '64', 'پیربکران');
INSERT INTO `city` VALUES ('196', '4', '64', 'زازران');
INSERT INTO `city` VALUES ('197', '4', '64', 'فلاورجان');
INSERT INTO `city` VALUES ('198', '4', '64', 'قهدریجان');
INSERT INTO `city` VALUES ('199', '4', '64', 'کلیشادوسودرجان');
INSERT INTO `city` VALUES ('200', '4', '65', 'برزک');
INSERT INTO `city` VALUES ('201', '4', '65', 'جوشقان قالی');
INSERT INTO `city` VALUES ('202', '4', '65', 'قمصر');
INSERT INTO `city` VALUES ('203', '4', '65', 'کاشان');
INSERT INTO `city` VALUES ('204', '4', '65', 'کامو و چوگان');
INSERT INTO `city` VALUES ('205', '4', '65', 'مشکات');
INSERT INTO `city` VALUES ('206', '4', '65', 'نیاسر');
INSERT INTO `city` VALUES ('207', '4', '66', 'گلپایگان');
INSERT INTO `city` VALUES ('208', '4', '66', 'گلشهر');
INSERT INTO `city` VALUES ('209', '4', '66', 'گوگد');
INSERT INTO `city` VALUES ('210', '4', '67', 'باغ بهادران');
INSERT INTO `city` VALUES ('211', '4', '67', 'باغشاد');
INSERT INTO `city` VALUES ('212', '4', '67', 'چرمهین');
INSERT INTO `city` VALUES ('213', '4', '67', 'چمگردان');
INSERT INTO `city` VALUES ('214', '4', '67', 'زاینده رود');
INSERT INTO `city` VALUES ('215', '4', '67', 'زرین شهر');
INSERT INTO `city` VALUES ('216', '4', '67', 'سده لنجان');
INSERT INTO `city` VALUES ('217', '4', '67', 'فولادشهر');
INSERT INTO `city` VALUES ('218', '4', '67', 'ورنامخواست');
INSERT INTO `city` VALUES ('219', '4', '68', 'دیزیچه');
INSERT INTO `city` VALUES ('220', '4', '68', 'زیباشهر');
INSERT INTO `city` VALUES ('221', '4', '68', 'طالخونچه');
INSERT INTO `city` VALUES ('222', '4', '68', 'کرکوند');
INSERT INTO `city` VALUES ('223', '4', '68', 'مبارکه');
INSERT INTO `city` VALUES ('224', '4', '68', 'مجلسی');
INSERT INTO `city` VALUES ('225', '4', '69', 'انارک');
INSERT INTO `city` VALUES ('226', '4', '69', 'بافران');
INSERT INTO `city` VALUES ('227', '4', '69', 'نایین');
INSERT INTO `city` VALUES ('228', '4', '70', 'جوزدان');
INSERT INTO `city` VALUES ('229', '4', '70', 'دهق');
INSERT INTO `city` VALUES ('230', '4', '70', 'علویجه');
INSERT INTO `city` VALUES ('231', '4', '70', 'کهریزسنگ');
INSERT INTO `city` VALUES ('232', '4', '70', 'گلدشت');
INSERT INTO `city` VALUES ('233', '4', '70', 'نجف آباد');
INSERT INTO `city` VALUES ('234', '4', '71', 'بادرود');
INSERT INTO `city` VALUES ('235', '4', '71', 'خالدآباد');
INSERT INTO `city` VALUES ('236', '4', '71', 'طرق رود');
INSERT INTO `city` VALUES ('237', '4', '71', 'نطنز');
INSERT INTO `city` VALUES ('238', '5', '72', 'اشتهارد');
INSERT INTO `city` VALUES ('239', '5', '73', 'چهارباغ');
INSERT INTO `city` VALUES ('240', '5', '73', 'شهرجدیدهشتگرد');
INSERT INTO `city` VALUES ('241', '5', '73', 'کوهسار');
INSERT INTO `city` VALUES ('242', '5', '73', 'گلسار');
INSERT INTO `city` VALUES ('243', '5', '73', 'هشتگرد');
INSERT INTO `city` VALUES ('244', '5', '74', 'طالقان');
INSERT INTO `city` VALUES ('245', '5', '75', 'فردیس');
INSERT INTO `city` VALUES ('246', '5', '75', 'مشکین دشت');
INSERT INTO `city` VALUES ('247', '5', '76', 'آسارا');
INSERT INTO `city` VALUES ('248', '5', '76', 'کرج');
INSERT INTO `city` VALUES ('249', '5', '76', 'کمال شهر');
INSERT INTO `city` VALUES ('250', '5', '76', 'گرمدره');
INSERT INTO `city` VALUES ('251', '5', '76', 'ماهدشت');
INSERT INTO `city` VALUES ('252', '5', '76', 'محمدشهر');
INSERT INTO `city` VALUES ('253', '5', '77', 'تنکمان');
INSERT INTO `city` VALUES ('254', '5', '77', 'نظرآباد');
INSERT INTO `city` VALUES ('255', '6', '78', 'آبدانان');
INSERT INTO `city` VALUES ('256', '6', '78', 'سراب باغ');
INSERT INTO `city` VALUES ('257', '6', '78', 'مورموری');
INSERT INTO `city` VALUES ('258', '6', '79', 'ایلام');
INSERT INTO `city` VALUES ('259', '6', '79', 'چوار');
INSERT INTO `city` VALUES ('260', '6', '80', 'ایوان');
INSERT INTO `city` VALUES ('261', '6', '80', 'زرنه');
INSERT INTO `city` VALUES ('262', '6', '81', 'بدره');
INSERT INTO `city` VALUES ('263', '6', '82', 'آسمان آباد');
INSERT INTO `city` VALUES ('264', '6', '82', 'بلاوه');
INSERT INTO `city` VALUES ('265', '6', '82', 'توحید');
INSERT INTO `city` VALUES ('266', '6', '82', 'سرابله');
INSERT INTO `city` VALUES ('267', '6', '82', 'شباب');
INSERT INTO `city` VALUES ('268', '6', '83', 'دره شهر');
INSERT INTO `city` VALUES ('269', '6', '83', 'ماژین');
INSERT INTO `city` VALUES ('270', '6', '84', 'پهله');
INSERT INTO `city` VALUES ('271', '6', '84', 'دهلران');
INSERT INTO `city` VALUES ('272', '6', '84', 'موسیان');
INSERT INTO `city` VALUES ('273', '6', '84', 'میمه');
INSERT INTO `city` VALUES ('274', '6', '85', 'لومار');
INSERT INTO `city` VALUES ('275', '6', '86', 'ارکواز');
INSERT INTO `city` VALUES ('276', '6', '86', 'دلگشا');
INSERT INTO `city` VALUES ('277', '6', '86', 'مهر');
INSERT INTO `city` VALUES ('278', '6', '87', 'صالح آباد');
INSERT INTO `city` VALUES ('279', '6', '87', 'مهران');
INSERT INTO `city` VALUES ('280', '7', '88', 'بوشهر');
INSERT INTO `city` VALUES ('281', '7', '88', 'چغادک');
INSERT INTO `city` VALUES ('282', '7', '88', 'خارک');
INSERT INTO `city` VALUES ('283', '7', '88', 'عالی شهر');
INSERT INTO `city` VALUES ('284', '7', '89', 'آباد');
INSERT INTO `city` VALUES ('285', '7', '89', 'اهرم');
INSERT INTO `city` VALUES ('286', '7', '89', 'دلوار');
INSERT INTO `city` VALUES ('287', '7', '90', 'انارستان');
INSERT INTO `city` VALUES ('288', '7', '90', 'جم');
INSERT INTO `city` VALUES ('289', '7', '90', 'ریز');
INSERT INTO `city` VALUES ('290', '7', '91', 'آب پخش');
INSERT INTO `city` VALUES ('291', '7', '91', 'برازجان');
INSERT INTO `city` VALUES ('292', '7', '91', 'بوشکان');
INSERT INTO `city` VALUES ('293', '7', '91', 'تنگ ارم');
INSERT INTO `city` VALUES ('294', '7', '91', 'دالکی');
INSERT INTO `city` VALUES ('295', '7', '91', 'سعد آباد');
INSERT INTO `city` VALUES ('296', '7', '91', 'شبانکاره');
INSERT INTO `city` VALUES ('297', '7', '91', 'کلمه');
INSERT INTO `city` VALUES ('298', '7', '91', 'وحدتیه');
INSERT INTO `city` VALUES ('299', '7', '92', 'بادوله');
INSERT INTO `city` VALUES ('300', '7', '92', 'خورموج');
INSERT INTO `city` VALUES ('301', '7', '92', 'شنبه');
INSERT INTO `city` VALUES ('302', '7', '92', 'کاکی');
INSERT INTO `city` VALUES ('303', '7', '93', 'آبدان');
INSERT INTO `city` VALUES ('304', '7', '93', 'بردخون');
INSERT INTO `city` VALUES ('305', '7', '93', 'بردستان');
INSERT INTO `city` VALUES ('306', '7', '93', 'بندردیر');
INSERT INTO `city` VALUES ('307', '7', '93', 'دوراهک');
INSERT INTO `city` VALUES ('308', '7', '94', 'امام حسن');
INSERT INTO `city` VALUES ('309', '7', '94', 'بندردیلم');
INSERT INTO `city` VALUES ('310', '7', '95', 'عسلویه');
INSERT INTO `city` VALUES ('311', '7', '95', 'نخل تقی');
INSERT INTO `city` VALUES ('312', '7', '96', 'بندرکنگان');
INSERT INTO `city` VALUES ('313', '7', '96', 'بنک');
INSERT INTO `city` VALUES ('314', '7', '96', 'سیراف');
INSERT INTO `city` VALUES ('315', '7', '97', 'بندرریگ');
INSERT INTO `city` VALUES ('316', '7', '97', 'بندرگناوه');
INSERT INTO `city` VALUES ('317', '8', '98', 'احمد آباد مستوفی');
INSERT INTO `city` VALUES ('318', '8', '98', 'اسلامشهر');
INSERT INTO `city` VALUES ('319', '8', '98', 'چهاردانگه');
INSERT INTO `city` VALUES ('320', '8', '99', 'صالحیه');
INSERT INTO `city` VALUES ('321', '8', '99', 'گلستان');
INSERT INTO `city` VALUES ('322', '8', '99', 'نسیم شهر');
INSERT INTO `city` VALUES ('323', '8', '100', 'پاکدشت');
INSERT INTO `city` VALUES ('324', '8', '100', 'شریف آباد');
INSERT INTO `city` VALUES ('325', '8', '100', 'فرون اباد');
INSERT INTO `city` VALUES ('326', '8', '101', 'بومهن');
INSERT INTO `city` VALUES ('327', '8', '101', 'پردیس');
INSERT INTO `city` VALUES ('328', '8', '102', 'پیشوا');
INSERT INTO `city` VALUES ('329', '8', '103', 'تهران');
INSERT INTO `city` VALUES ('330', '8', '104', 'آبسرد');
INSERT INTO `city` VALUES ('331', '8', '104', 'آبعلی');
INSERT INTO `city` VALUES ('332', '8', '104', 'دماوند');
INSERT INTO `city` VALUES ('333', '8', '104', 'رودهن');
INSERT INTO `city` VALUES ('334', '8', '104', 'کیلان');
INSERT INTO `city` VALUES ('335', '8', '105', 'پرند');
INSERT INTO `city` VALUES ('336', '8', '105', 'رباطکریم');
INSERT INTO `city` VALUES ('337', '8', '105', 'نصیرشهر');
INSERT INTO `city` VALUES ('338', '8', '106', 'باقرشهر');
INSERT INTO `city` VALUES ('339', '8', '106', 'حسن آباد');
INSERT INTO `city` VALUES ('340', '8', '106', 'ری');
INSERT INTO `city` VALUES ('341', '8', '106', 'کهریزک');
INSERT INTO `city` VALUES ('342', '8', '107', 'تجریش');
INSERT INTO `city` VALUES ('343', '8', '107', 'شمشک');
INSERT INTO `city` VALUES ('344', '8', '107', 'فشم');
INSERT INTO `city` VALUES ('345', '8', '107', 'لواسان');
INSERT INTO `city` VALUES ('346', '8', '108', 'اندیشه');
INSERT INTO `city` VALUES ('347', '8', '108', 'باغستان');
INSERT INTO `city` VALUES ('348', '8', '108', 'شاهدشهر');
INSERT INTO `city` VALUES ('349', '8', '108', 'شهریار');
INSERT INTO `city` VALUES ('350', '8', '108', 'صباشهر');
INSERT INTO `city` VALUES ('351', '8', '108', 'فردوسیه');
INSERT INTO `city` VALUES ('352', '8', '108', 'وحیدیه');
INSERT INTO `city` VALUES ('353', '8', '109', 'ارجمند');
INSERT INTO `city` VALUES ('354', '8', '109', 'فیروزکوه');
INSERT INTO `city` VALUES ('355', '8', '110', 'قدس');
INSERT INTO `city` VALUES ('356', '8', '111', 'قرچک');
INSERT INTO `city` VALUES ('357', '8', '112', 'صفادشت');
INSERT INTO `city` VALUES ('358', '8', '112', 'ملارد');
INSERT INTO `city` VALUES ('359', '8', '113', 'جوادآباد');
INSERT INTO `city` VALUES ('360', '8', '113', 'ورامین');
INSERT INTO `city` VALUES ('361', '9', '114', 'اردل');
INSERT INTO `city` VALUES ('362', '9', '114', 'دشتک');
INSERT INTO `city` VALUES ('363', '9', '114', 'سرخون');
INSERT INTO `city` VALUES ('364', '9', '114', 'کاج');
INSERT INTO `city` VALUES ('365', '9', '115', 'بروجن');
INSERT INTO `city` VALUES ('366', '9', '115', 'بلداجی');
INSERT INTO `city` VALUES ('367', '9', '115', 'سفیددشت');
INSERT INTO `city` VALUES ('368', '9', '115', 'فرادبنه');
INSERT INTO `city` VALUES ('369', '9', '115', 'گندمان');
INSERT INTO `city` VALUES ('370', '9', '115', 'نقنه');
INSERT INTO `city` VALUES ('371', '9', '116', 'بن');
INSERT INTO `city` VALUES ('372', '9', '116', 'وردنجان');
INSERT INTO `city` VALUES ('373', '9', '117', 'سامان');
INSERT INTO `city` VALUES ('374', '9', '118', 'سودجان');
INSERT INTO `city` VALUES ('375', '9', '118', 'سورشجان');
INSERT INTO `city` VALUES ('376', '9', '118', 'شهرکرد');
INSERT INTO `city` VALUES ('377', '9', '118', 'طاقانک');
INSERT INTO `city` VALUES ('378', '9', '118', 'فرخ شهر');
INSERT INTO `city` VALUES ('379', '9', '118', 'کیان');
INSERT INTO `city` VALUES ('380', '9', '118', 'نافچ');
INSERT INTO `city` VALUES ('381', '9', '118', 'هارونی');
INSERT INTO `city` VALUES ('382', '9', '118', 'هفشجان');
INSERT INTO `city` VALUES ('383', '9', '119', 'باباحیدر');
INSERT INTO `city` VALUES ('384', '9', '119', 'پردنجان');
INSERT INTO `city` VALUES ('385', '9', '119', 'جونقان');
INSERT INTO `city` VALUES ('386', '9', '119', 'چلیچه');
INSERT INTO `city` VALUES ('387', '9', '119', 'فارسان');
INSERT INTO `city` VALUES ('388', '9', '119', 'گوجان');
INSERT INTO `city` VALUES ('389', '9', '120', 'بازفت');
INSERT INTO `city` VALUES ('390', '9', '120', 'چلگرد');
INSERT INTO `city` VALUES ('391', '9', '120', 'صمصامی');
INSERT INTO `city` VALUES ('392', '9', '121', 'دستنا');
INSERT INTO `city` VALUES ('393', '9', '121', 'شلمزار');
INSERT INTO `city` VALUES ('394', '9', '121', 'گهرو');
INSERT INTO `city` VALUES ('395', '9', '121', 'ناغان');
INSERT INTO `city` VALUES ('396', '9', '122', 'آلونی');
INSERT INTO `city` VALUES ('397', '9', '122', 'سردشت');
INSERT INTO `city` VALUES ('398', '9', '122', 'لردگان');
INSERT INTO `city` VALUES ('399', '9', '122', 'مال خلیفه');
INSERT INTO `city` VALUES ('400', '9', '122', 'منج');
INSERT INTO `city` VALUES ('401', '10', '123', 'ارسک');
INSERT INTO `city` VALUES ('402', '10', '123', 'بشرویه');
INSERT INTO `city` VALUES ('403', '10', '124', 'بیرجند');
INSERT INTO `city` VALUES ('404', '10', '125', 'خوسف');
INSERT INTO `city` VALUES ('405', '10', '125', 'محمدشهر');
INSERT INTO `city` VALUES ('406', '10', '126', 'اسدیه');
INSERT INTO `city` VALUES ('407', '10', '126', 'طبس مسینا');
INSERT INTO `city` VALUES ('408', '10', '126', 'قهستان');
INSERT INTO `city` VALUES ('409', '10', '126', 'گزیک');
INSERT INTO `city` VALUES ('410', '10', '127', 'حاجی آباد');
INSERT INTO `city` VALUES ('411', '10', '127', 'زهان');
INSERT INTO `city` VALUES ('412', '10', '128', 'آیسک');
INSERT INTO `city` VALUES ('413', '10', '128', 'سرایان');
INSERT INTO `city` VALUES ('414', '10', '128', 'سه قلعه');
INSERT INTO `city` VALUES ('415', '10', '129', 'سربیشه');
INSERT INTO `city` VALUES ('416', '10', '129', 'مود');
INSERT INTO `city` VALUES ('417', '10', '130', 'دیهوک');
INSERT INTO `city` VALUES ('418', '10', '130', 'طبس');
INSERT INTO `city` VALUES ('419', '10', '130', 'عشق آباد');
INSERT INTO `city` VALUES ('420', '10', '131', 'اسلامیه');
INSERT INTO `city` VALUES ('421', '10', '131', 'فردوس');
INSERT INTO `city` VALUES ('422', '10', '132', 'آرین شهر');
INSERT INTO `city` VALUES ('423', '10', '132', 'اسفدن');
INSERT INTO `city` VALUES ('424', '10', '132', 'خضری دشت بیاض');
INSERT INTO `city` VALUES ('425', '10', '132', 'قاین');
INSERT INTO `city` VALUES ('426', '10', '132', 'نیمبلوک');
INSERT INTO `city` VALUES ('427', '10', '133', 'شوسف');
INSERT INTO `city` VALUES ('428', '10', '133', 'نهبندان');
INSERT INTO `city` VALUES ('429', '11', '134', 'باخرز');
INSERT INTO `city` VALUES ('430', '11', '135', 'بجستان');
INSERT INTO `city` VALUES ('431', '11', '135', 'یونسی');
INSERT INTO `city` VALUES ('432', '11', '136', 'انابد');
INSERT INTO `city` VALUES ('433', '11', '136', 'بردسکن');
INSERT INTO `city` VALUES ('434', '11', '136', 'شهراباد');
INSERT INTO `city` VALUES ('435', '11', '137', 'شاندیز');
INSERT INTO `city` VALUES ('436', '11', '137', 'طرقبه');
INSERT INTO `city` VALUES ('437', '11', '138', 'تایباد');
INSERT INTO `city` VALUES ('438', '11', '138', 'کاریز');
INSERT INTO `city` VALUES ('439', '11', '138', 'مشهدریزه');
INSERT INTO `city` VALUES ('440', '11', '139', 'احمدابادصولت');
INSERT INTO `city` VALUES ('441', '11', '139', 'تربت جام');
INSERT INTO `city` VALUES ('442', '11', '139', 'صالح آباد');
INSERT INTO `city` VALUES ('443', '11', '139', 'نصرآباد');
INSERT INTO `city` VALUES ('444', '11', '139', 'نیل شهر');
INSERT INTO `city` VALUES ('445', '11', '140', 'بایک');
INSERT INTO `city` VALUES ('446', '11', '140', 'تربت حیدریه');
INSERT INTO `city` VALUES ('447', '11', '140', 'رباط سنگ');
INSERT INTO `city` VALUES ('448', '11', '140', 'کدکن');
INSERT INTO `city` VALUES ('449', '11', '141', 'جغتای');
INSERT INTO `city` VALUES ('450', '11', '142', 'نقاب');
INSERT INTO `city` VALUES ('451', '11', '143', 'چناران');
INSERT INTO `city` VALUES ('452', '11', '143', 'گلبهار');
INSERT INTO `city` VALUES ('453', '11', '143', 'گلمکان');
INSERT INTO `city` VALUES ('454', '11', '144', 'خلیل آباد');
INSERT INTO `city` VALUES ('455', '11', '144', 'کندر');
INSERT INTO `city` VALUES ('456', '11', '145', 'خواف');
INSERT INTO `city` VALUES ('457', '11', '145', 'سلامی');
INSERT INTO `city` VALUES ('458', '11', '145', 'سنگان');
INSERT INTO `city` VALUES ('459', '11', '145', 'قاسم آباد');
INSERT INTO `city` VALUES ('460', '11', '145', 'نشتیفان');
INSERT INTO `city` VALUES ('461', '11', '146', 'سلطان آباد');
INSERT INTO `city` VALUES ('462', '11', '147', 'داورزن');
INSERT INTO `city` VALUES ('463', '11', '148', 'چاپشلو');
INSERT INTO `city` VALUES ('464', '11', '148', 'درگز');
INSERT INTO `city` VALUES ('465', '11', '148', 'لطف آباد');
INSERT INTO `city` VALUES ('466', '11', '148', 'نوخندان');
INSERT INTO `city` VALUES ('467', '11', '149', 'جنگل');
INSERT INTO `city` VALUES ('468', '11', '149', 'رشتخوار');
INSERT INTO `city` VALUES ('469', '11', '150', 'دولت آباد');
INSERT INTO `city` VALUES ('470', '11', '151', 'روداب');
INSERT INTO `city` VALUES ('471', '11', '151', 'سبزوار');
INSERT INTO `city` VALUES ('472', '11', '151', 'ششتمد');
INSERT INTO `city` VALUES ('473', '11', '152', 'سرخس');
INSERT INTO `city` VALUES ('474', '11', '152', 'مزدآوند');
INSERT INTO `city` VALUES ('475', '11', '153', 'سفیدسنگ');
INSERT INTO `city` VALUES ('476', '11', '153', 'فرهادگرد');
INSERT INTO `city` VALUES ('477', '11', '153', 'فریمان');
INSERT INTO `city` VALUES ('478', '11', '153', 'قلندرآباد');
INSERT INTO `city` VALUES ('479', '11', '154', 'فیروزه');
INSERT INTO `city` VALUES ('480', '11', '154', 'همت آباد');
INSERT INTO `city` VALUES ('481', '11', '155', 'باجگیران');
INSERT INTO `city` VALUES ('482', '11', '155', 'قوچان');
INSERT INTO `city` VALUES ('483', '11', '156', 'ریوش');
INSERT INTO `city` VALUES ('484', '11', '156', 'کاشمر');
INSERT INTO `city` VALUES ('485', '11', '157', 'شهرزو');
INSERT INTO `city` VALUES ('486', '11', '157', 'کلات');
INSERT INTO `city` VALUES ('487', '11', '158', 'بیدخت');
INSERT INTO `city` VALUES ('488', '11', '158', 'کاخک');
INSERT INTO `city` VALUES ('489', '11', '158', 'گناباد');
INSERT INTO `city` VALUES ('490', '11', '159', 'رضویه');
INSERT INTO `city` VALUES ('491', '11', '159', 'مشهد');
INSERT INTO `city` VALUES ('492', '11', '159', 'مشهد ثامن');
INSERT INTO `city` VALUES ('493', '11', '159', 'ملک آباد');
INSERT INTO `city` VALUES ('494', '11', '160', 'شادمهر');
INSERT INTO `city` VALUES ('495', '11', '160', 'فیض آباد');
INSERT INTO `city` VALUES ('496', '11', '161', 'بار');
INSERT INTO `city` VALUES ('497', '11', '161', 'چکنه');
INSERT INTO `city` VALUES ('498', '11', '161', 'خرو');
INSERT INTO `city` VALUES ('499', '11', '161', 'درود');
INSERT INTO `city` VALUES ('500', '11', '161', 'عشق آباد');
INSERT INTO `city` VALUES ('501', '11', '161', 'قدمگاه');
INSERT INTO `city` VALUES ('502', '11', '161', 'نیشابور');
INSERT INTO `city` VALUES ('503', '12', '162', 'اسفراین');
INSERT INTO `city` VALUES ('504', '12', '162', 'صفی آباد');
INSERT INTO `city` VALUES ('505', '12', '163', 'بجنورد');
INSERT INTO `city` VALUES ('506', '12', '163', 'چناران شهر');
INSERT INTO `city` VALUES ('507', '12', '163', 'حصارگرمخان');
INSERT INTO `city` VALUES ('508', '12', '164', 'جاجرم');
INSERT INTO `city` VALUES ('509', '12', '164', 'سنخواست');
INSERT INTO `city` VALUES ('510', '12', '164', 'شوقان');
INSERT INTO `city` VALUES ('511', '12', '165', 'راز');
INSERT INTO `city` VALUES ('512', '12', '166', 'زیارت');
INSERT INTO `city` VALUES ('513', '12', '166', 'شیروان');
INSERT INTO `city` VALUES ('514', '12', '166', 'قوشخانه');
INSERT INTO `city` VALUES ('515', '12', '166', 'لوجلی');
INSERT INTO `city` VALUES ('516', '12', '167', 'تیتکانلو');
INSERT INTO `city` VALUES ('517', '12', '167', 'فاروج');
INSERT INTO `city` VALUES ('518', '12', '168', 'ایور');
INSERT INTO `city` VALUES ('519', '12', '168', 'درق');
INSERT INTO `city` VALUES ('520', '12', '168', 'گرمه');
INSERT INTO `city` VALUES ('521', '12', '169', 'آشخانه');
INSERT INTO `city` VALUES ('522', '12', '169', 'آوا');
INSERT INTO `city` VALUES ('523', '12', '169', 'پیش قلعه');
INSERT INTO `city` VALUES ('524', '12', '169', 'قاضی');
INSERT INTO `city` VALUES ('525', '13', '170', 'آبادان');
INSERT INTO `city` VALUES ('526', '13', '170', 'اروندکنار');
INSERT INTO `city` VALUES ('527', '13', '170', 'چویبده');
INSERT INTO `city` VALUES ('528', '13', '171', 'آغاجاری');
INSERT INTO `city` VALUES ('529', '13', '172', 'امیدیه');
INSERT INTO `city` VALUES ('530', '13', '172', 'جایزان');
INSERT INTO `city` VALUES ('531', '13', '173', 'آبژدان');
INSERT INTO `city` VALUES ('532', '13', '173', 'قلعه خواجه');
INSERT INTO `city` VALUES ('533', '13', '174', 'آزادی');
INSERT INTO `city` VALUES ('534', '13', '174', 'اندیمشک');
INSERT INTO `city` VALUES ('535', '13', '174', 'بیدروبه');
INSERT INTO `city` VALUES ('536', '13', '174', 'چم گلک');
INSERT INTO `city` VALUES ('537', '13', '174', 'حسینیه');
INSERT INTO `city` VALUES ('538', '13', '175', 'الهایی');
INSERT INTO `city` VALUES ('539', '13', '175', 'اهواز');
INSERT INTO `city` VALUES ('540', '13', '176', 'ایذه');
INSERT INTO `city` VALUES ('541', '13', '176', 'دهدز');
INSERT INTO `city` VALUES ('542', '13', '177', 'باغ ملک');
INSERT INTO `city` VALUES ('543', '13', '177', 'صیدون');
INSERT INTO `city` VALUES ('544', '13', '177', 'قلعه تل');
INSERT INTO `city` VALUES ('545', '13', '177', 'میداود');
INSERT INTO `city` VALUES ('546', '13', '178', 'شیبان');
INSERT INTO `city` VALUES ('547', '13', '178', 'ملاثانی');
INSERT INTO `city` VALUES ('548', '13', '178', 'ویس');
INSERT INTO `city` VALUES ('549', '13', '179', 'بندرامام خمینی');
INSERT INTO `city` VALUES ('550', '13', '179', 'بندرماهشهر');
INSERT INTO `city` VALUES ('551', '13', '179', 'چمران');
INSERT INTO `city` VALUES ('552', '13', '180', 'بهبهان');
INSERT INTO `city` VALUES ('553', '13', '180', 'تشان');
INSERT INTO `city` VALUES ('554', '13', '180', 'سردشت');
INSERT INTO `city` VALUES ('555', '13', '180', 'منصوریه');
INSERT INTO `city` VALUES ('556', '13', '181', 'حمیدیه');
INSERT INTO `city` VALUES ('557', '13', '182', 'خرمشهر');
INSERT INTO `city` VALUES ('558', '13', '182', 'مقاومت');
INSERT INTO `city` VALUES ('559', '13', '182', 'مینوشهر');
INSERT INTO `city` VALUES ('560', '13', '183', 'چغامیش');
INSERT INTO `city` VALUES ('561', '13', '183', 'حمزه');
INSERT INTO `city` VALUES ('562', '13', '183', 'دزفول');
INSERT INTO `city` VALUES ('563', '13', '183', 'سالند');
INSERT INTO `city` VALUES ('564', '13', '183', 'سیاه منصور');
INSERT INTO `city` VALUES ('565', '13', '183', 'شمس آباد');
INSERT INTO `city` VALUES ('566', '13', '183', 'شهر امام');
INSERT INTO `city` VALUES ('567', '13', '183', 'صفی آباد');
INSERT INTO `city` VALUES ('568', '13', '183', 'میانرود');
INSERT INTO `city` VALUES ('569', '13', '184', 'ابوحمیظه');
INSERT INTO `city` VALUES ('570', '13', '184', 'بستان');
INSERT INTO `city` VALUES ('571', '13', '184', 'سوسنگرد');
INSERT INTO `city` VALUES ('572', '13', '184', 'کوت سیدنعیم');
INSERT INTO `city` VALUES ('573', '13', '185', 'رامشیر');
INSERT INTO `city` VALUES ('574', '13', '185', 'مشراگه');
INSERT INTO `city` VALUES ('575', '13', '186', 'رامهرمز');
INSERT INTO `city` VALUES ('576', '13', '187', 'خنافره');
INSERT INTO `city` VALUES ('577', '13', '187', 'دارخوین');
INSERT INTO `city` VALUES ('578', '13', '187', 'شادگان');
INSERT INTO `city` VALUES ('579', '13', '188', 'الوان');
INSERT INTO `city` VALUES ('580', '13', '188', 'حر');
INSERT INTO `city` VALUES ('581', '13', '188', 'شاوور');
INSERT INTO `city` VALUES ('582', '13', '188', 'شوش');
INSERT INTO `city` VALUES ('583', '13', '188', 'فتح المبین');
INSERT INTO `city` VALUES ('584', '13', '189', 'سرداران');
INSERT INTO `city` VALUES ('585', '13', '189', 'شرافت');
INSERT INTO `city` VALUES ('586', '13', '189', 'شوشتر');
INSERT INTO `city` VALUES ('587', '13', '189', 'گوریه');
INSERT INTO `city` VALUES ('588', '13', '190', 'کوت عبداله');
INSERT INTO `city` VALUES ('589', '13', '191', 'ترکالکی');
INSERT INTO `city` VALUES ('590', '13', '191', 'جنت مکان');
INSERT INTO `city` VALUES ('591', '13', '191', 'سماله');
INSERT INTO `city` VALUES ('592', '13', '191', 'صالح شهر');
INSERT INTO `city` VALUES ('593', '13', '191', 'گتوند');
INSERT INTO `city` VALUES ('594', '13', '192', 'لالی');
INSERT INTO `city` VALUES ('595', '13', '193', 'گلگیر');
INSERT INTO `city` VALUES ('596', '13', '193', 'مسجدسلیمان');
INSERT INTO `city` VALUES ('597', '13', '194', 'هفتگل');
INSERT INTO `city` VALUES ('598', '13', '195', 'زهره');
INSERT INTO `city` VALUES ('599', '13', '195', 'هندیجان');
INSERT INTO `city` VALUES ('600', '13', '196', 'رفیع');
INSERT INTO `city` VALUES ('601', '13', '196', 'هویزه');
INSERT INTO `city` VALUES ('602', '14', '197', 'ابهر');
INSERT INTO `city` VALUES ('603', '14', '197', 'صایین قلعه');
INSERT INTO `city` VALUES ('604', '14', '197', 'هیدج');
INSERT INTO `city` VALUES ('605', '14', '198', 'حلب');
INSERT INTO `city` VALUES ('606', '14', '198', 'زرین آباد');
INSERT INTO `city` VALUES ('607', '14', '199', 'زرین رود');
INSERT INTO `city` VALUES ('608', '14', '199', 'سجاس');
INSERT INTO `city` VALUES ('609', '14', '199', 'سهرورد');
INSERT INTO `city` VALUES ('610', '14', '199', 'قیدار');
INSERT INTO `city` VALUES ('611', '14', '199', 'کرسف');
INSERT INTO `city` VALUES ('612', '14', '199', 'گرماب');
INSERT INTO `city` VALUES ('613', '14', '199', 'نوربهار');
INSERT INTO `city` VALUES ('614', '14', '200', 'خرمدره');
INSERT INTO `city` VALUES ('615', '14', '201', 'ارمغانخانه');
INSERT INTO `city` VALUES ('616', '14', '201', 'زنجان');
INSERT INTO `city` VALUES ('617', '14', '201', 'نیک پی');
INSERT INTO `city` VALUES ('618', '14', '202', 'سلطانیه');
INSERT INTO `city` VALUES ('619', '14', '203', 'آب بر');
INSERT INTO `city` VALUES ('620', '14', '203', 'چورزق');
INSERT INTO `city` VALUES ('621', '14', '204', 'دندی');
INSERT INTO `city` VALUES ('622', '14', '204', 'ماه نشان');
INSERT INTO `city` VALUES ('623', '15', '205', 'آرادان');
INSERT INTO `city` VALUES ('624', '15', '205', 'کهن آباد');
INSERT INTO `city` VALUES ('625', '15', '206', 'امیریه');
INSERT INTO `city` VALUES ('626', '15', '206', 'دامغان');
INSERT INTO `city` VALUES ('627', '15', '206', 'دیباج');
INSERT INTO `city` VALUES ('628', '15', '206', 'کلاته');
INSERT INTO `city` VALUES ('629', '15', '207', 'سرخه');
INSERT INTO `city` VALUES ('630', '15', '208', 'سمنان');
INSERT INTO `city` VALUES ('631', '15', '209', 'بسطام');
INSERT INTO `city` VALUES ('632', '15', '209', 'بیارجمند');
INSERT INTO `city` VALUES ('633', '15', '209', 'رودیان');
INSERT INTO `city` VALUES ('634', '15', '209', 'شاهرود');
INSERT INTO `city` VALUES ('635', '15', '209', 'کلاته خیج');
INSERT INTO `city` VALUES ('636', '15', '209', 'مجن');
INSERT INTO `city` VALUES ('637', '15', '210', 'ایوانکی');
INSERT INTO `city` VALUES ('638', '15', '210', 'گرمسار');
INSERT INTO `city` VALUES ('639', '15', '211', 'درجزین');
INSERT INTO `city` VALUES ('640', '15', '211', 'شهمیرزاد');
INSERT INTO `city` VALUES ('641', '15', '211', 'مهدی شهر');
INSERT INTO `city` VALUES ('642', '15', '212', 'میامی');
INSERT INTO `city` VALUES ('643', '16', '213', 'ایرانشهر');
INSERT INTO `city` VALUES ('644', '16', '213', 'بزمان');
INSERT INTO `city` VALUES ('645', '16', '213', 'بمپور');
INSERT INTO `city` VALUES ('646', '16', '213', 'محمدان');
INSERT INTO `city` VALUES ('647', '16', '214', 'چابهار');
INSERT INTO `city` VALUES ('648', '16', '214', 'نگور');
INSERT INTO `city` VALUES ('649', '16', '215', 'خاش');
INSERT INTO `city` VALUES ('650', '16', '215', 'نوک آباد');
INSERT INTO `city` VALUES ('651', '16', '216', 'گلمورتی');
INSERT INTO `city` VALUES ('652', '16', '217', 'بنجار');
INSERT INTO `city` VALUES ('653', '16', '217', 'زابل');
INSERT INTO `city` VALUES ('654', '16', '218', 'زاهدان');
INSERT INTO `city` VALUES ('655', '16', '218', 'نصرت آباد');
INSERT INTO `city` VALUES ('656', '16', '219', 'زهک');
INSERT INTO `city` VALUES ('657', '16', '220', 'جالق');
INSERT INTO `city` VALUES ('658', '16', '220', 'سراوان');
INSERT INTO `city` VALUES ('659', '16', '220', 'سیرکان');
INSERT INTO `city` VALUES ('660', '16', '220', 'گشت');
INSERT INTO `city` VALUES ('661', '16', '220', 'محمدی');
INSERT INTO `city` VALUES ('662', '16', '221', 'پیشین');
INSERT INTO `city` VALUES ('663', '16', '221', 'راسک');
INSERT INTO `city` VALUES ('664', '16', '221', 'سرباز');
INSERT INTO `city` VALUES ('665', '16', '222', 'سوران');
INSERT INTO `city` VALUES ('666', '16', '222', 'هیدوچ');
INSERT INTO `city` VALUES ('667', '16', '223', 'فنوج');
INSERT INTO `city` VALUES ('668', '16', '224', 'قصرقند');
INSERT INTO `city` VALUES ('669', '16', '225', 'زرآباد');
INSERT INTO `city` VALUES ('670', '16', '225', 'کنارک');
INSERT INTO `city` VALUES ('671', '16', '226', 'مهرستان');
INSERT INTO `city` VALUES ('672', '16', '227', 'میرجاوه');
INSERT INTO `city` VALUES ('673', '16', '228', 'اسپکه');
INSERT INTO `city` VALUES ('674', '16', '228', 'بنت');
INSERT INTO `city` VALUES ('675', '16', '228', 'نیک شهر');
INSERT INTO `city` VALUES ('676', '16', '229', 'ادیمی');
INSERT INTO `city` VALUES ('677', '16', '230', 'شهرک علی اکبر');
INSERT INTO `city` VALUES ('678', '16', '230', 'محمدآباد');
INSERT INTO `city` VALUES ('679', '16', '231', 'دوست محمد');
INSERT INTO `city` VALUES ('680', '17', '232', 'آباده');
INSERT INTO `city` VALUES ('681', '17', '232', 'ایزدخواست');
INSERT INTO `city` VALUES ('682', '17', '232', 'بهمن');
INSERT INTO `city` VALUES ('683', '17', '232', 'سورمق');
INSERT INTO `city` VALUES ('684', '17', '232', 'صغاد');
INSERT INTO `city` VALUES ('685', '17', '233', 'ارسنجان');
INSERT INTO `city` VALUES ('686', '17', '234', 'استهبان');
INSERT INTO `city` VALUES ('687', '17', '234', 'ایج');
INSERT INTO `city` VALUES ('688', '17', '234', 'رونیز');
INSERT INTO `city` VALUES ('689', '17', '235', 'اقلید');
INSERT INTO `city` VALUES ('690', '17', '235', 'حسن اباد');
INSERT INTO `city` VALUES ('691', '17', '235', 'دژکرد');
INSERT INTO `city` VALUES ('692', '17', '235', 'سده');
INSERT INTO `city` VALUES ('693', '17', '236', 'بوانات');
INSERT INTO `city` VALUES ('694', '17', '236', 'حسامی');
INSERT INTO `city` VALUES ('695', '17', '236', 'کره ای');
INSERT INTO `city` VALUES ('696', '17', '236', 'مزایجان');
INSERT INTO `city` VALUES ('697', '17', '237', 'سعادت شهر');
INSERT INTO `city` VALUES ('698', '17', '237', 'مادرسلیمان');
INSERT INTO `city` VALUES ('699', '17', '238', 'باب انار');
INSERT INTO `city` VALUES ('700', '17', '238', 'جهرم');
INSERT INTO `city` VALUES ('701', '17', '238', 'خاوران');
INSERT INTO `city` VALUES ('702', '17', '238', 'دوزه');
INSERT INTO `city` VALUES ('703', '17', '238', 'قطب آباد');
INSERT INTO `city` VALUES ('704', '17', '239', 'خرامه');
INSERT INTO `city` VALUES ('705', '17', '239', 'سلطان شهر');
INSERT INTO `city` VALUES ('706', '17', '240', 'صفاشهر');
INSERT INTO `city` VALUES ('707', '17', '240', 'قادراباد');
INSERT INTO `city` VALUES ('708', '17', '241', 'خنج');
INSERT INTO `city` VALUES ('709', '17', '242', 'جنت شهر');
INSERT INTO `city` VALUES ('710', '17', '242', 'داراب');
INSERT INTO `city` VALUES ('711', '17', '242', 'دوبرجی');
INSERT INTO `city` VALUES ('712', '17', '242', 'فدامی');
INSERT INTO `city` VALUES ('713', '17', '243', 'کوپن');
INSERT INTO `city` VALUES ('714', '17', '243', 'مصیری');
INSERT INTO `city` VALUES ('715', '17', '244', 'حاجی آباد');
INSERT INTO `city` VALUES ('716', '17', '244', 'دبیران');
INSERT INTO `city` VALUES ('717', '17', '244', 'شهرپیر');
INSERT INTO `city` VALUES ('718', '17', '245', 'اردکان');
INSERT INTO `city` VALUES ('719', '17', '245', 'بیضا');
INSERT INTO `city` VALUES ('720', '17', '245', 'هماشهر');
INSERT INTO `city` VALUES ('721', '17', '246', 'سروستان');
INSERT INTO `city` VALUES ('722', '17', '246', 'کوهنجان');
INSERT INTO `city` VALUES ('723', '17', '247', 'خانه زنیان');
INSERT INTO `city` VALUES ('724', '17', '247', 'داریان');
INSERT INTO `city` VALUES ('725', '17', '247', 'زرقان');
INSERT INTO `city` VALUES ('726', '17', '247', 'شهرصدرا');
INSERT INTO `city` VALUES ('727', '17', '247', 'شیراز');
INSERT INTO `city` VALUES ('728', '17', '247', 'لپویی');
INSERT INTO `city` VALUES ('729', '17', '248', 'دهرم');
INSERT INTO `city` VALUES ('730', '17', '248', 'فراشبند');
INSERT INTO `city` VALUES ('731', '17', '248', 'نوجین');
INSERT INTO `city` VALUES ('732', '17', '249', 'زاهدشهر');
INSERT INTO `city` VALUES ('733', '17', '249', 'ششده');
INSERT INTO `city` VALUES ('734', '17', '249', 'فسا');
INSERT INTO `city` VALUES ('735', '17', '249', 'قره بلاغ');
INSERT INTO `city` VALUES ('736', '17', '249', 'میانشهر');
INSERT INTO `city` VALUES ('737', '17', '249', 'نوبندگان');
INSERT INTO `city` VALUES ('738', '17', '250', 'فیروزآباد');
INSERT INTO `city` VALUES ('739', '17', '250', 'میمند');
INSERT INTO `city` VALUES ('740', '17', '251', 'افزر');
INSERT INTO `city` VALUES ('741', '17', '251', 'امام شهر');
INSERT INTO `city` VALUES ('742', '17', '251', 'قیر');
INSERT INTO `city` VALUES ('743', '17', '251', 'کارزین (فتح آباد)');
INSERT INTO `city` VALUES ('744', '17', '251', 'مبارک آباددیز');
INSERT INTO `city` VALUES ('745', '17', '252', 'بالاده');
INSERT INTO `city` VALUES ('746', '17', '252', 'خشت');
INSERT INTO `city` VALUES ('747', '17', '252', 'قایمیه');
INSERT INTO `city` VALUES ('748', '17', '252', 'کازرون');
INSERT INTO `city` VALUES ('749', '17', '252', 'کنارتخته');
INSERT INTO `city` VALUES ('750', '17', '252', 'نودان');
INSERT INTO `city` VALUES ('751', '17', '253', 'کوار');
INSERT INTO `city` VALUES ('752', '17', '254', 'گراش');
INSERT INTO `city` VALUES ('753', '17', '255', 'اوز');
INSERT INTO `city` VALUES ('754', '17', '255', 'بنارویه');
INSERT INTO `city` VALUES ('755', '17', '255', 'بیرم');
INSERT INTO `city` VALUES ('756', '17', '255', 'جویم');
INSERT INTO `city` VALUES ('757', '17', '255', 'خور');
INSERT INTO `city` VALUES ('758', '17', '255', 'عمادده');
INSERT INTO `city` VALUES ('759', '17', '255', 'لار');
INSERT INTO `city` VALUES ('760', '17', '255', 'لطیفی');
INSERT INTO `city` VALUES ('761', '17', '256', 'اشکنان');
INSERT INTO `city` VALUES ('762', '17', '256', 'اهل');
INSERT INTO `city` VALUES ('763', '17', '256', 'علامرودشت');
INSERT INTO `city` VALUES ('764', '17', '256', 'لامرد');
INSERT INTO `city` VALUES ('765', '17', '257', 'خانیمن');
INSERT INTO `city` VALUES ('766', '17', '257', 'رامجرد');
INSERT INTO `city` VALUES ('767', '17', '257', 'سیدان');
INSERT INTO `city` VALUES ('768', '17', '257', 'کامفیروز');
INSERT INTO `city` VALUES ('769', '17', '257', 'مرودشت');
INSERT INTO `city` VALUES ('770', '17', '258', 'بابامنیر');
INSERT INTO `city` VALUES ('771', '17', '258', 'خومه زار');
INSERT INTO `city` VALUES ('772', '17', '258', 'نورآباد');
INSERT INTO `city` VALUES ('773', '17', '259', 'اسیر');
INSERT INTO `city` VALUES ('774', '17', '259', 'خوزی');
INSERT INTO `city` VALUES ('775', '17', '259', 'گله دار');
INSERT INTO `city` VALUES ('776', '17', '259', 'مهر');
INSERT INTO `city` VALUES ('777', '17', '259', 'وراوی');
INSERT INTO `city` VALUES ('778', '17', '260', 'آباده طشک');
INSERT INTO `city` VALUES ('779', '17', '260', 'قطرویه');
INSERT INTO `city` VALUES ('780', '17', '260', 'مشکان');
INSERT INTO `city` VALUES ('781', '17', '260', 'نی ریز');
INSERT INTO `city` VALUES ('782', '18', '261', 'آبیک');
INSERT INTO `city` VALUES ('783', '18', '261', 'خاکعلی');
INSERT INTO `city` VALUES ('784', '18', '262', 'آبگرم');
INSERT INTO `city` VALUES ('785', '18', '262', 'آوج');
INSERT INTO `city` VALUES ('786', '18', '263', 'الوند');
INSERT INTO `city` VALUES ('787', '18', '263', 'بیدستان');
INSERT INTO `city` VALUES ('788', '18', '263', 'شریفیه');
INSERT INTO `city` VALUES ('789', '18', '263', 'محمدیه');
INSERT INTO `city` VALUES ('790', '18', '264', 'ارداق');
INSERT INTO `city` VALUES ('791', '18', '264', 'بویین زهرا');
INSERT INTO `city` VALUES ('792', '18', '264', 'دانسفهان');
INSERT INTO `city` VALUES ('793', '18', '264', 'سگزآباد');
INSERT INTO `city` VALUES ('794', '18', '264', 'شال');
INSERT INTO `city` VALUES ('795', '18', '265', 'اسفرورین');
INSERT INTO `city` VALUES ('796', '18', '265', 'تاکستان');
INSERT INTO `city` VALUES ('797', '18', '265', 'خرمدشت');
INSERT INTO `city` VALUES ('798', '18', '265', 'ضیاڈآباد');
INSERT INTO `city` VALUES ('799', '18', '265', 'نرجه');
INSERT INTO `city` VALUES ('800', '18', '266', 'اقبالیه');
INSERT INTO `city` VALUES ('801', '18', '266', 'رازمیان');
INSERT INTO `city` VALUES ('802', '18', '266', 'سیردان');
INSERT INTO `city` VALUES ('803', '18', '266', 'قزوین');
INSERT INTO `city` VALUES ('804', '18', '266', 'کوهین');
INSERT INTO `city` VALUES ('805', '18', '266', 'محمودآبادنمونه');
INSERT INTO `city` VALUES ('806', '18', '266', 'معلم کلایه');
INSERT INTO `city` VALUES ('807', '19', '267', 'جعفریه');
INSERT INTO `city` VALUES ('808', '19', '267', 'دستجرد');
INSERT INTO `city` VALUES ('809', '19', '267', 'سلفچگان');
INSERT INTO `city` VALUES ('810', '19', '267', 'قم');
INSERT INTO `city` VALUES ('811', '19', '267', 'قنوات');
INSERT INTO `city` VALUES ('812', '19', '267', 'کهک');
INSERT INTO `city` VALUES ('813', '20', '268', 'آرمرده');
INSERT INTO `city` VALUES ('814', '20', '268', 'بانه');
INSERT INTO `city` VALUES ('815', '20', '268', 'بویین سفلی');
INSERT INTO `city` VALUES ('816', '20', '268', 'کانی سور');
INSERT INTO `city` VALUES ('817', '20', '269', 'بابارشانی');
INSERT INTO `city` VALUES ('818', '20', '269', 'بیجار');
INSERT INTO `city` VALUES ('819', '20', '269', 'پیرتاج');
INSERT INTO `city` VALUES ('820', '20', '269', 'توپ آغاج');
INSERT INTO `city` VALUES ('821', '20', '269', 'یاسوکند');
INSERT INTO `city` VALUES ('822', '20', '270', 'بلبان آباد');
INSERT INTO `city` VALUES ('823', '20', '270', 'دهگلان');
INSERT INTO `city` VALUES ('824', '20', '271', 'دیواندره');
INSERT INTO `city` VALUES ('825', '20', '271', 'زرینه');
INSERT INTO `city` VALUES ('826', '20', '272', 'اورامان تخت');
INSERT INTO `city` VALUES ('827', '20', '272', 'سروآباد');
INSERT INTO `city` VALUES ('828', '20', '273', 'سقز');
INSERT INTO `city` VALUES ('829', '20', '273', 'صاحب');
INSERT INTO `city` VALUES ('830', '20', '274', 'سنندج');
INSERT INTO `city` VALUES ('831', '20', '274', 'شویشه');
INSERT INTO `city` VALUES ('832', '20', '275', 'دزج');
INSERT INTO `city` VALUES ('833', '20', '275', 'دلبران');
INSERT INTO `city` VALUES ('834', '20', '275', 'سریش آباد');
INSERT INTO `city` VALUES ('835', '20', '275', 'قروه');
INSERT INTO `city` VALUES ('836', '20', '276', 'کامیاران');
INSERT INTO `city` VALUES ('837', '20', '276', 'موچش');
INSERT INTO `city` VALUES ('838', '20', '277', 'برده رشه');
INSERT INTO `city` VALUES ('839', '20', '277', 'چناره');
INSERT INTO `city` VALUES ('840', '20', '277', 'کانی دینار');
INSERT INTO `city` VALUES ('841', '20', '277', 'مریوان');
INSERT INTO `city` VALUES ('842', '21', '278', 'ارزوییه');
INSERT INTO `city` VALUES ('843', '21', '279', 'امین شهر');
INSERT INTO `city` VALUES ('844', '21', '279', 'انار');
INSERT INTO `city` VALUES ('845', '21', '280', 'بافت');
INSERT INTO `city` VALUES ('846', '21', '280', 'بزنجان');
INSERT INTO `city` VALUES ('847', '21', '281', 'بردسیر');
INSERT INTO `city` VALUES ('848', '21', '281', 'دشتکار');
INSERT INTO `city` VALUES ('849', '21', '281', 'گلزار');
INSERT INTO `city` VALUES ('850', '21', '281', 'لاله زار');
INSERT INTO `city` VALUES ('851', '21', '281', 'نگار');
INSERT INTO `city` VALUES ('852', '21', '282', 'بروات');
INSERT INTO `city` VALUES ('853', '21', '282', 'بم');
INSERT INTO `city` VALUES ('854', '21', '283', 'بلوک');
INSERT INTO `city` VALUES ('855', '21', '283', 'جبالبارز');
INSERT INTO `city` VALUES ('856', '21', '283', 'جیرفت');
INSERT INTO `city` VALUES ('857', '21', '283', 'درب بهشت');
INSERT INTO `city` VALUES ('858', '21', '284', 'رابر');
INSERT INTO `city` VALUES ('859', '21', '284', 'هنزا');
INSERT INTO `city` VALUES ('860', '21', '285', 'راور');
INSERT INTO `city` VALUES ('861', '21', '285', 'هجدک');
INSERT INTO `city` VALUES ('862', '21', '286', 'بهرمان');
INSERT INTO `city` VALUES ('863', '21', '286', 'رفسنجان');
INSERT INTO `city` VALUES ('864', '21', '286', 'صفاییه');
INSERT INTO `city` VALUES ('865', '21', '286', 'کشکوییه');
INSERT INTO `city` VALUES ('866', '21', '286', 'مس سرچشمه');
INSERT INTO `city` VALUES ('867', '21', '287', 'رودبار');
INSERT INTO `city` VALUES ('868', '21', '287', 'زهکلوت');
INSERT INTO `city` VALUES ('869', '21', '288', 'گنبکی');
INSERT INTO `city` VALUES ('870', '21', '288', 'محمدآباد');
INSERT INTO `city` VALUES ('871', '21', '289', 'خانوک');
INSERT INTO `city` VALUES ('872', '21', '289', 'ریحان');
INSERT INTO `city` VALUES ('873', '21', '289', 'زرند');
INSERT INTO `city` VALUES ('874', '21', '289', 'یزدان شهر');
INSERT INTO `city` VALUES ('875', '21', '290', 'بلورد');
INSERT INTO `city` VALUES ('876', '21', '290', 'پاریز');
INSERT INTO `city` VALUES ('877', '21', '290', 'خواجو شهر');
INSERT INTO `city` VALUES ('878', '21', '290', 'زیدآباد');
INSERT INTO `city` VALUES ('879', '21', '290', 'سیرجان');
INSERT INTO `city` VALUES ('880', '21', '290', 'نجف شهر');
INSERT INTO `city` VALUES ('881', '21', '290', 'هماشهر');
INSERT INTO `city` VALUES ('882', '21', '291', 'جوزم');
INSERT INTO `city` VALUES ('883', '21', '291', 'خاتون اباد');
INSERT INTO `city` VALUES ('884', '21', '291', 'خورسند');
INSERT INTO `city` VALUES ('885', '21', '291', 'دهج');
INSERT INTO `city` VALUES ('886', '21', '291', 'شهربابک');
INSERT INTO `city` VALUES ('887', '21', '292', 'دوساری');
INSERT INTO `city` VALUES ('888', '21', '292', 'عنبرآباد');
INSERT INTO `city` VALUES ('889', '21', '292', 'مردهک');
INSERT INTO `city` VALUES ('890', '21', '293', 'فاریاب');
INSERT INTO `city` VALUES ('891', '21', '294', 'فهرج');
INSERT INTO `city` VALUES ('892', '21', '295', 'قلعه گنج');
INSERT INTO `city` VALUES ('893', '21', '296', 'اختیارآباد');
INSERT INTO `city` VALUES ('894', '21', '296', 'اندوهجرد');
INSERT INTO `city` VALUES ('895', '21', '296', 'باغین');
INSERT INTO `city` VALUES ('896', '21', '296', 'جوپار');
INSERT INTO `city` VALUES ('897', '21', '296', 'چترود');
INSERT INTO `city` VALUES ('898', '21', '296', 'راین');
INSERT INTO `city` VALUES ('899', '21', '296', 'زنگی آباد');
INSERT INTO `city` VALUES ('900', '21', '296', 'شهداد');
INSERT INTO `city` VALUES ('901', '21', '296', 'کاظم آباد');
INSERT INTO `city` VALUES ('902', '21', '296', 'کرمان');
INSERT INTO `city` VALUES ('903', '21', '296', 'گلباف');
INSERT INTO `city` VALUES ('904', '21', '296', 'ماهان');
INSERT INTO `city` VALUES ('905', '21', '296', 'محی آباد');
INSERT INTO `city` VALUES ('906', '21', '297', 'کوهبنان');
INSERT INTO `city` VALUES ('907', '21', '297', 'کیانشهر');
INSERT INTO `city` VALUES ('908', '21', '298', 'کهنوج');
INSERT INTO `city` VALUES ('909', '21', '299', 'منوجان');
INSERT INTO `city` VALUES ('910', '21', '299', 'نودژ');
INSERT INTO `city` VALUES ('911', '21', '300', 'نرماشیر');
INSERT INTO `city` VALUES ('912', '21', '300', 'نظام شهر');
INSERT INTO `city` VALUES ('913', '22', '301', 'اسلام آبادغرب');
INSERT INTO `city` VALUES ('914', '22', '301', 'حمیل');
INSERT INTO `city` VALUES ('915', '22', '302', 'بانوره');
INSERT INTO `city` VALUES ('916', '22', '302', 'باینگان');
INSERT INTO `city` VALUES ('917', '22', '302', 'پاوه');
INSERT INTO `city` VALUES ('918', '22', '302', 'نودشه');
INSERT INTO `city` VALUES ('919', '22', '302', 'نوسود');
INSERT INTO `city` VALUES ('920', '22', '303', 'ازگله');
INSERT INTO `city` VALUES ('921', '22', '303', 'تازه آباد');
INSERT INTO `city` VALUES ('922', '22', '304', 'جوانرود');
INSERT INTO `city` VALUES ('923', '22', '305', 'ریجاب');
INSERT INTO `city` VALUES ('924', '22', '305', 'کرند');
INSERT INTO `city` VALUES ('925', '22', '305', 'گهواره');
INSERT INTO `city` VALUES ('926', '22', '306', 'روانسر');
INSERT INTO `city` VALUES ('927', '22', '306', 'شاهو');
INSERT INTO `city` VALUES ('928', '22', '307', 'سرپل ذهاب');
INSERT INTO `city` VALUES ('929', '22', '308', 'سطر');
INSERT INTO `city` VALUES ('930', '22', '308', 'سنقر');
INSERT INTO `city` VALUES ('931', '22', '309', 'صحنه');
INSERT INTO `city` VALUES ('932', '22', '309', 'میان راهان');
INSERT INTO `city` VALUES ('933', '22', '310', 'سومار');
INSERT INTO `city` VALUES ('934', '22', '310', 'قصرشیرین');
INSERT INTO `city` VALUES ('935', '22', '311', 'رباط');
INSERT INTO `city` VALUES ('936', '22', '311', 'کرمانشاه');
INSERT INTO `city` VALUES ('937', '22', '311', 'کوزران');
INSERT INTO `city` VALUES ('938', '22', '311', 'هلشی');
INSERT INTO `city` VALUES ('939', '22', '312', 'کنگاور');
INSERT INTO `city` VALUES ('940', '22', '312', 'گودین');
INSERT INTO `city` VALUES ('941', '22', '313', 'سرمست');
INSERT INTO `city` VALUES ('942', '22', '313', 'گیلانغرب');
INSERT INTO `city` VALUES ('943', '22', '314', 'بیستون');
INSERT INTO `city` VALUES ('944', '22', '314', 'هرسین');
INSERT INTO `city` VALUES ('945', '23', '315', 'باشت');
INSERT INTO `city` VALUES ('946', '23', '316', 'چیتاب');
INSERT INTO `city` VALUES ('947', '23', '316', 'گراب سفلی');
INSERT INTO `city` VALUES ('948', '23', '316', 'مادوان');
INSERT INTO `city` VALUES ('949', '23', '316', 'مارگون');
INSERT INTO `city` VALUES ('950', '23', '316', 'یاسوج');
INSERT INTO `city` VALUES ('951', '23', '317', 'لیکک');
INSERT INTO `city` VALUES ('952', '23', '318', 'چرام');
INSERT INTO `city` VALUES ('953', '23', '318', 'سرفاریاب');
INSERT INTO `city` VALUES ('954', '23', '319', 'پاتاوه');
INSERT INTO `city` VALUES ('955', '23', '319', 'سی سخت');
INSERT INTO `city` VALUES ('956', '23', '320', 'دهدشت');
INSERT INTO `city` VALUES ('957', '23', '320', 'دیشموک');
INSERT INTO `city` VALUES ('958', '23', '320', 'سوق');
INSERT INTO `city` VALUES ('959', '23', '320', 'قلعه رییسی');
INSERT INTO `city` VALUES ('960', '23', '321', 'دوگنبدان');
INSERT INTO `city` VALUES ('961', '23', '322', 'لنده');
INSERT INTO `city` VALUES ('962', '24', '323', 'آزادشهر');
INSERT INTO `city` VALUES ('963', '24', '323', 'نگین شهر');
INSERT INTO `city` VALUES ('964', '24', '323', 'نوده خاندوز');
INSERT INTO `city` VALUES ('965', '24', '324', 'آق قلا');
INSERT INTO `city` VALUES ('966', '24', '324', 'انبارآلوم');
INSERT INTO `city` VALUES ('967', '24', '325', 'بندرگز');
INSERT INTO `city` VALUES ('968', '24', '325', 'نوکنده');
INSERT INTO `city` VALUES ('969', '24', '326', 'بندرترکمن');
INSERT INTO `city` VALUES ('970', '24', '327', 'تاتارعلیا');
INSERT INTO `city` VALUES ('971', '24', '327', 'خان ببین');
INSERT INTO `city` VALUES ('972', '24', '327', 'دلند');
INSERT INTO `city` VALUES ('973', '24', '327', 'رامیان');
INSERT INTO `city` VALUES ('974', '24', '328', 'سنگدوین');
INSERT INTO `city` VALUES ('975', '24', '328', 'علی اباد');
INSERT INTO `city` VALUES ('976', '24', '328', 'فاضل آباد');
INSERT INTO `city` VALUES ('977', '24', '328', 'مزرعه');
INSERT INTO `city` VALUES ('978', '24', '329', 'کردکوی');
INSERT INTO `city` VALUES ('979', '24', '330', 'فراغی');
INSERT INTO `city` VALUES ('980', '24', '330', 'کلاله');
INSERT INTO `city` VALUES ('981', '24', '331', 'گالیکش');
INSERT INTO `city` VALUES ('982', '24', '332', 'جلین');
INSERT INTO `city` VALUES ('983', '24', '332', 'سرخنکلاته');
INSERT INTO `city` VALUES ('984', '24', '332', 'گرگان');
INSERT INTO `city` VALUES ('985', '24', '333', 'سیمین شهر');
INSERT INTO `city` VALUES ('986', '24', '333', 'گمیش تپه');
INSERT INTO `city` VALUES ('987', '24', '334', 'اینچه برون');
INSERT INTO `city` VALUES ('988', '24', '334', 'گنبدکاووس');
INSERT INTO `city` VALUES ('989', '24', '335', 'مراوه');
INSERT INTO `city` VALUES ('990', '24', '336', 'مینودشت');
INSERT INTO `city` VALUES ('991', '25', '337', 'آستارا');
INSERT INTO `city` VALUES ('992', '25', '337', 'لوندویل');
INSERT INTO `city` VALUES ('993', '25', '338', 'آستانه اشرفیه');
INSERT INTO `city` VALUES ('994', '25', '338', 'کیاشهر');
INSERT INTO `city` VALUES ('995', '25', '339', 'املش');
INSERT INTO `city` VALUES ('996', '25', '339', 'رانکوه');
INSERT INTO `city` VALUES ('997', '25', '340', 'بندرانزلی');
INSERT INTO `city` VALUES ('998', '25', '341', 'خشکبیجار');
INSERT INTO `city` VALUES ('999', '25', '341', 'خمام');
INSERT INTO `city` VALUES ('1000', '25', '341', 'رشت');
INSERT INTO `city` VALUES ('1001', '25', '341', 'سنگر');
INSERT INTO `city` VALUES ('1002', '25', '341', 'کوچصفهان');
INSERT INTO `city` VALUES ('1003', '25', '341', 'لشت نشاء');
INSERT INTO `city` VALUES ('1004', '25', '341', 'لولمان');
INSERT INTO `city` VALUES ('1005', '25', '342', 'پره سر');
INSERT INTO `city` VALUES ('1006', '25', '342', 'رضوانشهر');
INSERT INTO `city` VALUES ('1007', '25', '343', 'بره سر');
INSERT INTO `city` VALUES ('1008', '25', '343', 'توتکابن');
INSERT INTO `city` VALUES ('1009', '25', '343', 'جیرنده');
INSERT INTO `city` VALUES ('1010', '25', '343', 'رستم آباد');
INSERT INTO `city` VALUES ('1011', '25', '343', 'رودبار');
INSERT INTO `city` VALUES ('1012', '25', '343', 'لوشان');
INSERT INTO `city` VALUES ('1013', '25', '343', 'منجیل');
INSERT INTO `city` VALUES ('1014', '25', '344', 'چابکسر');
INSERT INTO `city` VALUES ('1015', '25', '344', 'رحیم آباد');
INSERT INTO `city` VALUES ('1016', '25', '344', 'رودسر');
INSERT INTO `city` VALUES ('1017', '25', '344', 'کلاچای');
INSERT INTO `city` VALUES ('1018', '25', '344', 'واجارگاه');
INSERT INTO `city` VALUES ('1019', '25', '345', 'دیلمان');
INSERT INTO `city` VALUES ('1020', '25', '345', 'سیاهکل');
INSERT INTO `city` VALUES ('1021', '25', '346', 'احمدسرگوراب');
INSERT INTO `city` VALUES ('1022', '25', '346', 'شفت');
INSERT INTO `city` VALUES ('1023', '25', '347', 'صومعه سرا');
INSERT INTO `city` VALUES ('1024', '25', '347', 'گوراب زرمیخ');
INSERT INTO `city` VALUES ('1025', '25', '347', 'مرجقل');
INSERT INTO `city` VALUES ('1026', '25', '348', 'اسالم');
INSERT INTO `city` VALUES ('1027', '25', '348', 'چوبر');
INSERT INTO `city` VALUES ('1028', '25', '348', 'حویق');
INSERT INTO `city` VALUES ('1029', '25', '348', 'لیسار');
INSERT INTO `city` VALUES ('1030', '25', '348', 'هشتپر (تالش)');
INSERT INTO `city` VALUES ('1031', '25', '349', 'فومن');
INSERT INTO `city` VALUES ('1032', '25', '349', 'ماسوله');
INSERT INTO `city` VALUES ('1033', '25', '349', 'ماکلوان');
INSERT INTO `city` VALUES ('1034', '25', '350', 'رودبنه');
INSERT INTO `city` VALUES ('1035', '25', '350', 'لاهیجان');
INSERT INTO `city` VALUES ('1036', '25', '351', 'اطاقور');
INSERT INTO `city` VALUES ('1037', '25', '351', 'چاف و چمخاله');
INSERT INTO `city` VALUES ('1038', '25', '351', 'شلمان');
INSERT INTO `city` VALUES ('1039', '25', '351', 'کومله');
INSERT INTO `city` VALUES ('1040', '25', '351', 'لنگرود');
INSERT INTO `city` VALUES ('1041', '25', '352', 'بازار جمعه');
INSERT INTO `city` VALUES ('1042', '25', '352', 'ماسال');
INSERT INTO `city` VALUES ('1043', '26', '353', 'ازنا');
INSERT INTO `city` VALUES ('1044', '26', '353', 'مومن آباد');
INSERT INTO `city` VALUES ('1045', '26', '354', 'الیگودرز');
INSERT INTO `city` VALUES ('1046', '26', '354', 'شول آباد');
INSERT INTO `city` VALUES ('1047', '26', '355', 'اشترینان');
INSERT INTO `city` VALUES ('1048', '26', '355', 'بروجرد');
INSERT INTO `city` VALUES ('1049', '26', '356', 'پلدختر');
INSERT INTO `city` VALUES ('1050', '26', '356', 'معمولان');
INSERT INTO `city` VALUES ('1051', '26', '357', 'بیران شهر');
INSERT INTO `city` VALUES ('1052', '26', '357', 'خرم آباد');
INSERT INTO `city` VALUES ('1053', '26', '357', 'زاغه');
INSERT INTO `city` VALUES ('1054', '26', '357', 'سپیددشت');
INSERT INTO `city` VALUES ('1055', '26', '358', 'نورآباد');
INSERT INTO `city` VALUES ('1056', '26', '358', 'هفت چشمه');
INSERT INTO `city` VALUES ('1057', '26', '359', 'چالانچولان');
INSERT INTO `city` VALUES ('1058', '26', '359', 'دورود');
INSERT INTO `city` VALUES ('1059', '26', '360', 'سراب دوره');
INSERT INTO `city` VALUES ('1060', '26', '360', 'ویسیان');
INSERT INTO `city` VALUES ('1061', '26', '361', 'چقابل');
INSERT INTO `city` VALUES ('1062', '26', '362', 'الشتر');
INSERT INTO `city` VALUES ('1063', '26', '362', 'فیروزآباد');
INSERT INTO `city` VALUES ('1064', '26', '363', 'درب گنبد');
INSERT INTO `city` VALUES ('1065', '26', '363', 'کوهدشت');
INSERT INTO `city` VALUES ('1066', '26', '363', 'کوهنانی');
INSERT INTO `city` VALUES ('1067', '26', '363', 'گراب');
INSERT INTO `city` VALUES ('1068', '27', '364', 'آمل');
INSERT INTO `city` VALUES ('1069', '27', '364', 'امامزاده عبدالله');
INSERT INTO `city` VALUES ('1070', '27', '364', 'دابودشت');
INSERT INTO `city` VALUES ('1071', '27', '364', 'رینه');
INSERT INTO `city` VALUES ('1072', '27', '364', 'گزنک');
INSERT INTO `city` VALUES ('1073', '27', '365', 'امیرکلا');
INSERT INTO `city` VALUES ('1074', '27', '365', 'بابل');
INSERT INTO `city` VALUES ('1075', '27', '365', 'خوش رودپی');
INSERT INTO `city` VALUES ('1076', '27', '365', 'زرگرمحله');
INSERT INTO `city` VALUES ('1077', '27', '365', 'گتاب');
INSERT INTO `city` VALUES ('1078', '27', '365', 'گلوگاه');
INSERT INTO `city` VALUES ('1079', '27', '365', 'مرزیکلا');
INSERT INTO `city` VALUES ('1080', '27', '366', 'بابلسر');
INSERT INTO `city` VALUES ('1081', '27', '366', 'بهنمیر');
INSERT INTO `city` VALUES ('1082', '27', '366', 'هادی شهر');
INSERT INTO `city` VALUES ('1083', '27', '367', 'بهشهر');
INSERT INTO `city` VALUES ('1084', '27', '367', 'خلیل شهر');
INSERT INTO `city` VALUES ('1085', '27', '367', 'رستمکلا');
INSERT INTO `city` VALUES ('1086', '27', '368', 'تنکابن');
INSERT INTO `city` VALUES ('1087', '27', '368', 'خرم آباد');
INSERT INTO `city` VALUES ('1088', '27', '368', 'شیرود');
INSERT INTO `city` VALUES ('1089', '27', '368', 'نشتارود');
INSERT INTO `city` VALUES ('1090', '27', '369', 'جویبار');
INSERT INTO `city` VALUES ('1091', '27', '369', 'کوهی خیل');
INSERT INTO `city` VALUES ('1092', '27', '370', 'چالوس');
INSERT INTO `city` VALUES ('1093', '27', '370', 'مرزن آباد');
INSERT INTO `city` VALUES ('1094', '27', '370', 'هچیرود');
INSERT INTO `city` VALUES ('1095', '27', '371', 'رامسر');
INSERT INTO `city` VALUES ('1096', '27', '371', 'کتالم وسادات شهر');
INSERT INTO `city` VALUES ('1097', '27', '372', 'پایین هولار');
INSERT INTO `city` VALUES ('1098', '27', '372', 'ساری');
INSERT INTO `city` VALUES ('1099', '27', '372', 'فریم');
INSERT INTO `city` VALUES ('1100', '27', '372', 'کیاسر');
INSERT INTO `city` VALUES ('1101', '27', '373', 'آلاشت');
INSERT INTO `city` VALUES ('1102', '27', '373', 'پل سفید');
INSERT INTO `city` VALUES ('1103', '27', '373', 'زیرآب');
INSERT INTO `city` VALUES ('1104', '27', '374', 'شیرگاه');
INSERT INTO `city` VALUES ('1105', '27', '375', 'کیاکلا');
INSERT INTO `city` VALUES ('1106', '27', '376', 'سلمان شهر');
INSERT INTO `city` VALUES ('1107', '27', '376', 'عباس اباد');
INSERT INTO `city` VALUES ('1108', '27', '376', 'کلارآباد');
INSERT INTO `city` VALUES ('1109', '27', '377', 'فریدونکنار');
INSERT INTO `city` VALUES ('1110', '27', '378', 'ارطه');
INSERT INTO `city` VALUES ('1111', '27', '378', 'قایم شهر');
INSERT INTO `city` VALUES ('1112', '27', '379', 'کلاردشت');
INSERT INTO `city` VALUES ('1113', '27', '380', 'گلوگاه');
INSERT INTO `city` VALUES ('1114', '27', '381', 'سرخرود');
INSERT INTO `city` VALUES ('1115', '27', '381', 'محمودآباد');
INSERT INTO `city` VALUES ('1116', '27', '382', 'سورک');
INSERT INTO `city` VALUES ('1117', '27', '383', 'نکا');
INSERT INTO `city` VALUES ('1118', '27', '384', 'ایزدشهر');
INSERT INTO `city` VALUES ('1119', '27', '384', 'بلده');
INSERT INTO `city` VALUES ('1120', '27', '384', 'چمستان');
INSERT INTO `city` VALUES ('1121', '27', '384', 'رویان');
INSERT INTO `city` VALUES ('1122', '27', '384', 'نور');
INSERT INTO `city` VALUES ('1123', '27', '385', 'پول');
INSERT INTO `city` VALUES ('1124', '27', '385', 'کجور');
INSERT INTO `city` VALUES ('1125', '27', '385', 'نوشهر');
INSERT INTO `city` VALUES ('1126', '28', '386', 'آشتیان');
INSERT INTO `city` VALUES ('1127', '28', '387', 'اراک');
INSERT INTO `city` VALUES ('1128', '28', '387', 'داودآباد');
INSERT INTO `city` VALUES ('1129', '28', '387', 'ساروق');
INSERT INTO `city` VALUES ('1130', '28', '387', 'کارچان');
INSERT INTO `city` VALUES ('1131', '28', '388', 'تفرش');
INSERT INTO `city` VALUES ('1132', '28', '389', 'خمین');
INSERT INTO `city` VALUES ('1133', '28', '389', 'قورچی باشی');
INSERT INTO `city` VALUES ('1134', '28', '390', 'جاورسیان');
INSERT INTO `city` VALUES ('1135', '28', '390', 'خنداب');
INSERT INTO `city` VALUES ('1136', '28', '391', 'دلیجان');
INSERT INTO `city` VALUES ('1137', '28', '391', 'نراق');
INSERT INTO `city` VALUES ('1138', '28', '392', 'پرندک');
INSERT INTO `city` VALUES ('1139', '28', '392', 'خشکرود');
INSERT INTO `city` VALUES ('1140', '28', '392', 'رازقان');
INSERT INTO `city` VALUES ('1141', '28', '392', 'زاویه');
INSERT INTO `city` VALUES ('1142', '28', '392', 'مامونیه');
INSERT INTO `city` VALUES ('1143', '28', '393', 'آوه');
INSERT INTO `city` VALUES ('1144', '28', '393', 'ساوه');
INSERT INTO `city` VALUES ('1145', '28', '393', 'غرق آباد');
INSERT INTO `city` VALUES ('1146', '28', '393', 'نوبران');
INSERT INTO `city` VALUES ('1147', '28', '394', 'آستانه');
INSERT INTO `city` VALUES ('1148', '28', '394', 'توره');
INSERT INTO `city` VALUES ('1149', '28', '394', 'شازند');
INSERT INTO `city` VALUES ('1150', '28', '394', 'شهباز');
INSERT INTO `city` VALUES ('1151', '28', '394', 'مهاجران');
INSERT INTO `city` VALUES ('1152', '28', '394', 'هندودر');
INSERT INTO `city` VALUES ('1153', '28', '395', 'خنجین');
INSERT INTO `city` VALUES ('1154', '28', '395', 'فرمهین');
INSERT INTO `city` VALUES ('1155', '28', '396', 'کمیجان');
INSERT INTO `city` VALUES ('1156', '28', '396', 'میلاجرد');
INSERT INTO `city` VALUES ('1157', '28', '397', 'محلات');
INSERT INTO `city` VALUES ('1158', '28', '397', 'نیمور');
INSERT INTO `city` VALUES ('1159', '29', '398', 'ابوموسی');
INSERT INTO `city` VALUES ('1160', '29', '399', 'بستک');
INSERT INTO `city` VALUES ('1161', '29', '399', 'جناح');
INSERT INTO `city` VALUES ('1162', '29', '400', 'سردشت');
INSERT INTO `city` VALUES ('1163', '29', '400', 'گوهران');
INSERT INTO `city` VALUES ('1164', '29', '401', 'بندرعباس');
INSERT INTO `city` VALUES ('1165', '29', '401', 'تازیان پایین');
INSERT INTO `city` VALUES ('1166', '29', '401', 'تخت');
INSERT INTO `city` VALUES ('1167', '29', '401', 'فین');
INSERT INTO `city` VALUES ('1168', '29', '401', 'قلعه قاضی');
INSERT INTO `city` VALUES ('1169', '29', '402', 'بندرلنگه');
INSERT INTO `city` VALUES ('1170', '29', '402', 'چارک');
INSERT INTO `city` VALUES ('1171', '29', '402', 'کنگ');
INSERT INTO `city` VALUES ('1172', '29', '402', 'کیش');
INSERT INTO `city` VALUES ('1173', '29', '402', 'لمزان');
INSERT INTO `city` VALUES ('1174', '29', '403', 'پارسیان');
INSERT INTO `city` VALUES ('1175', '29', '403', 'دشتی');
INSERT INTO `city` VALUES ('1176', '29', '403', 'کوشکنار');
INSERT INTO `city` VALUES ('1177', '29', '404', 'بندرجاسک');
INSERT INTO `city` VALUES ('1178', '29', '405', 'حاجی اباد');
INSERT INTO `city` VALUES ('1179', '29', '405', 'سرگز');
INSERT INTO `city` VALUES ('1180', '29', '405', 'فارغان');
INSERT INTO `city` VALUES ('1181', '29', '406', 'خمیر');
INSERT INTO `city` VALUES ('1182', '29', '406', 'رویدر');
INSERT INTO `city` VALUES ('1183', '29', '407', 'بیکاء');
INSERT INTO `city` VALUES ('1184', '29', '407', 'دهبارز');
INSERT INTO `city` VALUES ('1185', '29', '407', 'زیارتعلی');
INSERT INTO `city` VALUES ('1186', '29', '408', 'سیریک');
INSERT INTO `city` VALUES ('1187', '29', '408', 'کوهستک');
INSERT INTO `city` VALUES ('1188', '29', '408', 'گروک');
INSERT INTO `city` VALUES ('1189', '29', '409', 'درگهان');
INSERT INTO `city` VALUES ('1190', '29', '409', 'سوزا');
INSERT INTO `city` VALUES ('1191', '29', '409', 'قشم');
INSERT INTO `city` VALUES ('1192', '29', '409', 'هرمز');
INSERT INTO `city` VALUES ('1193', '29', '410', 'تیرور');
INSERT INTO `city` VALUES ('1194', '29', '410', 'سندرک');
INSERT INTO `city` VALUES ('1195', '29', '410', 'میناب');
INSERT INTO `city` VALUES ('1196', '29', '410', 'هشتبندی');
INSERT INTO `city` VALUES ('1197', '30', '411', 'آجین');
INSERT INTO `city` VALUES ('1198', '30', '411', 'اسدآباد');
INSERT INTO `city` VALUES ('1199', '30', '412', 'بهار');
INSERT INTO `city` VALUES ('1200', '30', '412', 'صالح آباد');
INSERT INTO `city` VALUES ('1201', '30', '412', 'لالجین');
INSERT INTO `city` VALUES ('1202', '30', '412', 'مهاجران');
INSERT INTO `city` VALUES ('1203', '30', '413', 'تویسرکان');
INSERT INTO `city` VALUES ('1204', '30', '413', 'سرکان');
INSERT INTO `city` VALUES ('1205', '30', '413', 'فرسفج');
INSERT INTO `city` VALUES ('1206', '30', '414', 'دمق');
INSERT INTO `city` VALUES ('1207', '30', '414', 'رزن');
INSERT INTO `city` VALUES ('1208', '30', '414', 'قروه درجزین');
INSERT INTO `city` VALUES ('1209', '30', '415', 'فامنین');
INSERT INTO `city` VALUES ('1210', '30', '416', 'شیرین سو');
INSERT INTO `city` VALUES ('1211', '30', '416', 'کبودرآهنگ');
INSERT INTO `city` VALUES ('1212', '30', '416', 'گل تپه');
INSERT INTO `city` VALUES ('1213', '30', '417', 'ازندریان');
INSERT INTO `city` VALUES ('1214', '30', '417', 'جوکار');
INSERT INTO `city` VALUES ('1215', '30', '417', 'زنگنه');
INSERT INTO `city` VALUES ('1216', '30', '417', 'سامن');
INSERT INTO `city` VALUES ('1217', '30', '417', 'ملایر');
INSERT INTO `city` VALUES ('1218', '30', '418', 'برزول');
INSERT INTO `city` VALUES ('1219', '30', '418', 'فیروزان');
INSERT INTO `city` VALUES ('1220', '30', '418', 'گیان');
INSERT INTO `city` VALUES ('1221', '30', '418', 'نهاوند');
INSERT INTO `city` VALUES ('1222', '30', '419', 'جورقان');
INSERT INTO `city` VALUES ('1223', '30', '419', 'قهاوند');
INSERT INTO `city` VALUES ('1224', '30', '419', 'مریانج');
INSERT INTO `city` VALUES ('1225', '30', '419', 'همدان');
INSERT INTO `city` VALUES ('1226', '31', '420', 'ابرکوه');
INSERT INTO `city` VALUES ('1227', '31', '420', 'مهردشت');
INSERT INTO `city` VALUES ('1228', '31', '421', 'احمدآباد');
INSERT INTO `city` VALUES ('1229', '31', '421', 'اردکان');
INSERT INTO `city` VALUES ('1230', '31', '421', 'عقدا');
INSERT INTO `city` VALUES ('1231', '31', '422', 'اشکذر');
INSERT INTO `city` VALUES ('1232', '31', '422', 'خضرآباد');
INSERT INTO `city` VALUES ('1233', '31', '423', 'بافق');
INSERT INTO `city` VALUES ('1234', '31', '424', 'بهاباد');
INSERT INTO `city` VALUES ('1235', '31', '425', 'تفت');
INSERT INTO `city` VALUES ('1236', '31', '425', 'نیر');
INSERT INTO `city` VALUES ('1237', '31', '426', 'مروست');
INSERT INTO `city` VALUES ('1238', '31', '426', 'هرات');
INSERT INTO `city` VALUES ('1239', '31', '427', 'مهریز');
INSERT INTO `city` VALUES ('1240', '31', '428', 'بفروییه');
INSERT INTO `city` VALUES ('1241', '31', '428', 'میبد');
INSERT INTO `city` VALUES ('1242', '31', '428', 'ندوشن');
INSERT INTO `city` VALUES ('1243', '31', '429', 'حمیدیا');
INSERT INTO `city` VALUES ('1244', '31', '429', 'زارچ');
INSERT INTO `city` VALUES ('1245', '31', '429', 'شاهدیه');
INSERT INTO `city` VALUES ('1246', '31', '429', 'یزد');

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('52', 'بانک ملت', '', '', 'نا مشخص', 'جناب آقای دکتر محمد بیگدلی', '17', '40', '', '82962004', null, '', '', 'خیابان طالقانی-نبش خیابان موسوی-ساختمان مرکزی بانک ملت طبقه 14');
INSERT INTO `company` VALUES ('54', 'شرکت صنایع پتروشیمی خلیج فارس', '', '', 'نا مشخص', 'جناب آقای جعفر ربیعی', '17', '40', '', '۸۸۳۰۹۰۶۰ ', null, '', '', 'آدرس: تهران ، میدان هفت تیر ، خیابان کریم خان زند ، شماره ۳۸');
INSERT INTO `company` VALUES ('55', 'شرکت ایران خودرو', '', '', 'نا مشخص', 'جناب آقای هاشم یکه زارع', '17', '40', '', ' ۴۸۹۰۱(۰۲۱)', null, '', '', 'تهران - کیلومتر ۱۴ جاده مخصوص کرج (بزرگراه شهید لشگری)، شرکت ایران خودرو');
INSERT INTO `company` VALUES ('56', 'بانک پارسیان', '', '', 'نا مشخص', 'جناب آقای دکترکورش پرویزیان', '17', '40', 'info@parsian-bank.ir', '81151000 ', null, '', 'www.parsian-bank.com', 'میدان صنعت - بلوار فرحزادی - خیابان زرافشان غربی - پلاک 4 - ساختمان مرکزی بانک پارسیان - طبقه اول - واحد روابط عمومی');
INSERT INTO `company` VALUES ('57', 'شرکت پالایش نفت اصفهان', '', '', 'نا مشخص', 'جناب آقای مرتضی ابراهیمی', '17', '40', '', '۳۳۸۰۲۷۲۷-(۰۳۱)', null, '', '', ' اصفهان ، کیلومتر ۵ جاده تهران ، شرکت پالایش نفت اصفهان');
INSERT INTO `company` VALUES ('58', 'بانک تجارت', '', '', 'نا مشخص', 'جناب آقای رضا دولت آبادی', '17', '40', '', '88908613-81041', null, '', 'www.tejaratbank.ir', 'خیابان آبت اله طالقانی - نبش خیابان شهید استاد نجات الهی - ساختمان 247- بانک تجارت - تحویل واحد دبیرخانه');
INSERT INTO `company` VALUES ('59', 'شرکت سایپا', '', '', 'نا مشخص', 'جناب آقای مهندس محسن جهرودي', '17', '40', '', '5-44196550 (021', null, '', '', 'تهران - كيلومتر 15 بزرگراه شهيد لشگري (جاده مخصوص كرج) - شركت سايپا');
INSERT INTO `company` VALUES ('60', 'شرکت گروه گسترش نفت و گاز پارسیان', '', '', 'نا مشخص', 'جناب آقای مرتضی عزیزی', '17', '40', '', '  22685696،7', null, '', '', ' تهران، شریعتی،  پل رومی،  ورودی الهیه،  روبروی کوچه مبشر پلاک 41');

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
-- Records of company_address
-- ----------------------------

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
-- Records of company_agent
-- ----------------------------

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
-- Records of company_tell
-- ----------------------------

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
-- Records of development
-- ----------------------------

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
-- Records of peoject
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
-- Table structure for states
-- ----------------------------
DROP TABLE IF EXISTS `states`;
CREATE TABLE `states` (
  `SID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of states
-- ----------------------------

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
-- Records of subcategory
-- ----------------------------
INSERT INTO `subcategory` VALUES ('10', '3', 'سایر');
INSERT INTO `subcategory` VALUES ('13', '9', 'بانکها و موسسات مالی');
INSERT INTO `subcategory` VALUES ('14', '9', 'شرکتهای بیمه');
INSERT INTO `subcategory` VALUES ('15', '9', 'شرکتهای لیزینگ');
INSERT INTO `subcategory` VALUES ('16', '9', 'شرکتهای سرمایه گذاری');
INSERT INTO `subcategory` VALUES ('17', '9', 'کارگزاری بورس');
INSERT INTO `subcategory` VALUES ('18', '9', 'صرافی ها');
INSERT INTO `subcategory` VALUES ('19', '9', 'شرکتهای پرداخت و PSP ها');
INSERT INTO `subcategory` VALUES ('20', '9', 'اپلیکیشن ها و فین تک');
INSERT INTO `subcategory` VALUES ('21', '9', 'شرکتهای تامین سرمایه');
INSERT INTO `subcategory` VALUES ('22', '9', 'نرم افزارهای مالی و بانکی');
INSERT INTO `subcategory` VALUES ('23', '9', 'موسسات آموزش مالی');
INSERT INTO `subcategory` VALUES ('24', '9', 'شرکتهای خدمات حسابداری و حسابرسی');
INSERT INTO `subcategory` VALUES ('25', '14', 'ژله و دسر');
INSERT INTO `subcategory` VALUES ('26', '14', 'سوسیس و کالباس');
INSERT INTO `subcategory` VALUES ('28', '15', 'لپ تاپ');
INSERT INTO `subcategory` VALUES ('31', '15', 'تبلت');
INSERT INTO `subcategory` VALUES ('32', '15', 'تلفن همراه');
INSERT INTO `subcategory` VALUES ('34', '15', 'مانیتور');
INSERT INTO `subcategory` VALUES ('35', '15', 'دوربین عکاسی');
INSERT INTO `subcategory` VALUES ('36', '16', 'تلویزیون');
INSERT INTO `subcategory` VALUES ('37', '19', 'asdassas');
INSERT INTO `subcategory` VALUES ('38', '19', 'dsdsda');
INSERT INTO `subcategory` VALUES ('39', '19', 'asdasdas');
INSERT INTO `subcategory` VALUES ('40', '17', 'سایر');

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
-- Records of tasks
-- ----------------------------

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
