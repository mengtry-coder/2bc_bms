/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50505
 Source Host           : 127.0.0.1
 Source Database       : eOBMS_current_using_eot

 Target Server Type    : MySQL
 Target Server Version : 50505
 File Encoding         : utf-8

 Date: 10/04/2019 13:39:00 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `account_type`
-- ----------------------------
DROP TABLE IF EXISTS `account_type`;
CREATE TABLE `account_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_parent` int(11) DEFAULT NULL,
  `names` varchar(250) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `detail_type` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `account_type`
-- ----------------------------
BEGIN;
INSERT INTO `account_type` VALUES ('1', '0', 'Income', '1', '2017-12-13 12:01:22', '1', '', '1', '2017-12-13 12:01:22'), ('2', '0', 'Expense', '1', '2017-12-13 12:06:49', '1', '', '1', '2017-12-13 12:01:22'), ('3', '0', 'Bank', '1', '2017-12-13 12:07:12', '1', '', '1', '2017-12-13 12:01:22'), ('4', '0', 'Cost of Sales', '1', '2017-12-13 12:07:46', '1', '', '1', '2017-12-13 12:01:22'), ('5', '0', 'Other Expense', '1', '2017-12-13 12:08:14', '1', '', '1', '2017-12-13 12:01:22'), ('6', '0', 'Other Income', '1', '2017-12-13 12:01:22', '1', '', '1', '2017-12-13 12:01:22'), ('7', '0', 'Equity', '1', '2017-12-13 12:01:22', '1', '', '1', '2017-12-13 12:01:22'), ('8', '0', 'Current Liabilities', '1', '2017-12-13 12:01:22', '1', '', '1', '2017-12-13 12:01:22'), ('9', '0', 'Current Assets', '1', '2017-12-13 12:01:22', '1', '', '1', '2017-12-13 12:01:22'), ('10', '0', 'Non-Current Assets', '1', '2017-12-13 12:01:22', '1', '', '1', '2017-12-13 12:01:22'), ('11', '2', 'Administrative Expenses ', '1', '2017-12-13 12:07:02', '1', '', '1', '2017-12-13 12:02:56'), ('12', '2', 'Bad Debts', '1', '2017-12-13 12:07:32', '1', '', '1', '2017-12-13 12:03:19'), ('13', '2', 'Bank Charge ', '1', '2017-12-13 12:08:00', '1', '', '1', '2017-12-13 12:03:56'), ('14', '2', 'Payroll Expenses', '1', '2017-12-13 12:08:34', '1', '', '1', '2017-12-13 12:04:22'), ('15', '2', 'Entertainment ', '1', '2017-12-13 12:09:21', '1', '', '1', '2017-12-13 12:09:24'), ('16', '2', 'Marketing Expense', '1', '2017-12-13 13:38:35', '1', '', '1', '2017-12-13 13:37:44'), ('17', '2', 'Repaire & Maintenance ', '1', '2017-12-13 13:38:43', '1', '', '1', '2017-12-13 13:37:51'), ('18', '2', 'Travel Expenses', '1', '2017-12-13 13:38:51', '1', '', '1', '2017-12-13 13:37:56'), ('19', '2', 'Insurrance', '1', '2017-12-13 13:38:55', '1', '', '1', '2017-12-13 13:38:02'), ('20', '3', 'Cash in Bank', '1', '2017-12-13 13:42:29', '1', '', '1', '0000-00-00 00:00:00'), ('21', '3', 'Cash on Hand', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('22', '5', 'Depreciation', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('23', '5', 'Other Expense', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('24', '6', 'Other Investment Revenue', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('25', '6', 'Interest Earned', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('26', '7', 'Opening Balance Equity', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('27', '7', 'Owner\'s Equity', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('28', '7', 'Partner\'s Equity', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('29', '8', 'Interest Payable ', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('30', '8', 'Insurance Payable', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('31', '8', 'Loan Payable', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('32', '8', 'Payroll Liabilities', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('33', '8', 'Prepaid Expense Liabilities', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('34', '9', 'Employee Cash Advances', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('35', '9', 'Inventory', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('36', '9', 'Loans to Shareholders', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('37', '9', 'Other Current Assets', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('38', '9', 'Prepaid Expense', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('39', '9', 'Loans to Officers', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('40', '10', 'Goodwill', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('41', '10', 'Licenses', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('42', '10', 'Member Fee', '1', '2017-12-13 00:00:00', '1', '', '1', '2017-12-13 00:00:00'), ('43', '2', 'Commission Expense', '1', '2017-12-14 00:00:00', '1', '', '1', '2017-12-14 00:00:00'), ('44', '0', 'Account Payable', '1', '2017-12-14 00:00:00', '1', '', '1', '2017-12-14 00:00:00'), ('45', '0', 'Account Receivable', '1', '2017-12-14 00:00:00', '1', '', '1', '2017-12-14 00:00:00'), ('46', '0', 'Fixed Asset', '1', '2017-12-14 00:00:00', '1', '', '1', '2017-12-14 00:00:00'), ('47', '8', 'Tax Payable Liabilities', '1', '2018-08-17 08:47:01', '1', 'For all kind of Tax Payable Liabilities', '1', '2018-08-17 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `bank`
-- ----------------------------
DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(200) NOT NULL,
  `account_type` int(11) DEFAULT NULL,
  `bank_address` varchar(250) NOT NULL,
  `account_name` varchar(250) NOT NULL,
  `account_number` varchar(200) NOT NULL,
  `remark` text NOT NULL,
  `default` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `swift_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `bank`
-- ----------------------------
BEGIN;
INSERT INTO `bank` VALUES ('13', 'Sacom Bank', '1', 'No.0665 Sangkat Sla Kram, Siem Reap City, Siem Reap Province', 'eOcambo Technology', '00032882', '', '0', '20', '2019-06-26 13:48:39', '1', '20', '2019-06-26 13:45:06', 'SGTTVNVX');
COMMIT;

-- ----------------------------
--  Table structure for `bank_account_type`
-- ----------------------------
DROP TABLE IF EXISTS `bank_account_type`;
CREATE TABLE `bank_account_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(200) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `bank_account_type`
-- ----------------------------
BEGIN;
INSERT INTO `bank_account_type` VALUES ('1', 'Saving Account'), ('2', 'Current Account');
COMMIT;

-- ----------------------------
--  Table structure for `billing_type`
-- ----------------------------
DROP TABLE IF EXISTS `billing_type`;
CREATE TABLE `billing_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `billing_type`
-- ----------------------------
BEGIN;
INSERT INTO `billing_type` VALUES ('1', 'Fixed Rate');
COMMIT;

-- ----------------------------
--  Table structure for `budget_set_up`
-- ----------------------------
DROP TABLE IF EXISTS `budget_set_up`;
CREATE TABLE `budget_set_up` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_department` int(11) DEFAULT NULL,
  `id_position` int(11) DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL,
  `year` int(111) DEFAULT NULL,
  `unit_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `budget_value` decimal(10,2) DEFAULT NULL,
  `actual` decimal(10,2) DEFAULT NULL,
  `under_or_over` decimal(10,2) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `quarter_1` decimal(10,2) DEFAULT NULL,
  `quarter_2` decimal(10,2) DEFAULT NULL,
  `quarter_3` decimal(10,2) DEFAULT NULL,
  `quarter_4` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `budget_set_up_data`
-- ----------------------------
DROP TABLE IF EXISTS `budget_set_up_data`;
CREATE TABLE `budget_set_up_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_budget_set_up` int(11) DEFAULT NULL,
  `id_month` int(11) DEFAULT NULL,
  `daily` decimal(10,2) DEFAULT NULL,
  `weekly` decimal(10,2) DEFAULT NULL,
  `monthly` decimal(10,2) DEFAULT NULL,
  `quarterly` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `budget_setup_value`
-- ----------------------------
DROP TABLE IF EXISTS `budget_setup_value`;
CREATE TABLE `budget_setup_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_budget_set_up` int(11) DEFAULT NULL,
  `for_month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `daily_budget` decimal(10,2) DEFAULT NULL,
  `weekly_budget` decimal(10,2) DEFAULT NULL,
  `monthly_budget` decimal(10,2) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `cash_advance_request`
-- ----------------------------
DROP TABLE IF EXISTS `cash_advance_request`;
CREATE TABLE `cash_advance_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL,
  `chart_of_account` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `amount_in_word` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `id_pay_type` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `cash_advance_request`
-- ----------------------------
BEGIN;
INSERT INTO `cash_advance_request` VALUES ('1', 'ADV19090001', '2019-09-17', '1', '38', '0.50', 'POINT FIVE DOLLAR', 'xxx', '1', '1', '1', '1', '2019-09-17 11:05:01', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `chart_account`
-- ----------------------------
DROP TABLE IF EXISTS `chart_account`;
CREATE TABLE `chart_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(250) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `id_account_type` int(11) DEFAULT NULL,
  `id_is_parent` int(11) DEFAULT NULL,
  `is_parent` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `id_bank` int(11) DEFAULT NULL,
  `number_code` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `chart_account`
-- ----------------------------
BEGIN;
INSERT INTO `chart_account` VALUES ('1', 'Sales Income', '1', '2018-08-17 14:06:23', '1', '1', null, '0', '1', '2018-07-02 16:23:21', null, '40000'), ('2', 'Franchise Sales Revenue', '1', '2018-08-26 15:56:39', '1', '6', null, '0', '1', '2018-07-02 16:23:21', null, '41000'), ('3', 'Interest Income', '1', '2018-08-26 15:57:00', '1', '6', null, '0', '1', '2018-07-02 16:23:21', null, '42000'), ('4', 'Cost of Sales', '1', '2018-08-17 14:07:44', '1', '4', null, '0', '1', '2018-07-02 16:23:21', null, '50000'), ('5', 'Cost of Accommodation', '1', '2018-08-26 16:09:53', '1', '4', null, '4', '1', '2018-07-02 16:23:21', null, '50100'), ('6', 'Cost of Guide', '1', '2018-08-26 16:10:08', '1', '4', null, '4', '1', '2018-07-02 16:23:21', null, '50200'), ('7', 'Cost of Ticket', '1', '2018-08-26 16:10:23', '1', '4', null, '4', '1', '2018-07-02 16:23:21', null, '50300'), ('8', 'Cost of Transport', '1', '2018-08-26 16:10:42', '1', '4', null, '4', '1', '2018-07-02 16:23:21', null, '50400'), ('10', 'Cost of Misc', '1', '2018-08-26 16:11:14', '1', '4', null, '4', '1', '2018-07-02 16:23:21', null, '50600'), ('11', 'Cost of Tour & Activities', '1', '2018-08-26 16:11:28', '1', '4', null, '4', '1', '2018-07-02 16:23:21', null, '50700'), ('12', 'Cost of Restaurant', '1', '2018-08-26 16:11:44', '1', '4', null, '4', '1', '2018-07-02 16:23:21', null, '50800'), ('13', 'Cost of Cruise', '1', '2018-08-26 16:11:58', '1', '4', null, '4', '1', '2018-07-02 16:23:21', null, '50900'), ('15', 'Utilities Expanse', '1', '2018-08-24 22:50:41', '1', '2', null, '92', '1', '2018-07-02 16:23:21', null, '61100'), ('16', 'Staff\'s Food Expense', '1', '2018-08-26 14:35:32', '1', '2', null, '97', '1', '2018-07-02 16:23:21', null, '61510'), ('17', 'Gastroline Expense', '1', '2018-08-26 15:40:05', '1', '2', null, '15', '1', '2018-07-02 16:23:21', null, '61105'), ('18', 'Cellcard Expense', '1', '2018-08-26 14:19:49', '1', '2', null, '96', '1', '2018-07-02 16:23:21', null, '61410'), ('19', 'Internet Expense', '1', '2018-08-26 14:20:29', '1', '2', null, '96', '1', '2018-07-02 16:23:21', null, '61420'), ('20', 'Bad Debts', '1', '2018-08-26 15:16:56', '1', '2', null, '101', '1', '2018-07-02 16:23:21', null, '64010'), ('21', 'Bank Charge', '1', '2018-08-26 15:17:13', '1', '2', null, '101', '1', '2018-07-02 16:23:21', null, '64020'), ('22', 'Payroll Expense', '1', '2018-08-24 22:57:37', '1', '2', null, '92', '1', '2018-07-02 16:23:21', null, '61200'), ('23', 'Bonus Expense', '1', '2018-08-26 15:28:07', '1', '2', null, '22', '1', '2018-07-02 16:23:21', null, '61201'), ('24', 'Commission for Supplier Expense', '1', '2018-08-26 14:50:59', '1', '2', null, '98', '1', '2018-07-02 16:23:21', null, '62010'), ('25', 'Anual Staff Party', '1', '2018-08-26 14:36:11', '1', '2', null, '97', '1', '2018-07-02 16:23:21', null, '61521'), ('26', 'Business Adverting Expense', '1', '2018-08-26 14:57:51', '1', '2', null, '98', '1', '2018-07-02 16:23:21', null, '62020'), ('27', 'Sponsor Expense', '1', '2018-08-26 14:58:17', '1', '2', null, '98', '1', '2018-07-02 16:23:21', null, '62030'), ('28', 'Car Maintenance Expense', '1', '2018-08-26 14:25:41', '1', '2', null, '99', '1', '2018-07-02 16:23:21', null, '61901'), ('29', 'Computer Maintenance Expense', '1', '2018-08-26 14:26:02', '1', '2', null, '99', '1', '2018-07-02 16:23:21', null, '61902'), ('30', 'Accommodation Expense', '1', '2018-08-26 15:05:39', '1', '2', null, '182', '1', '2018-07-02 16:23:21', null, '62191'), ('31', 'Meal\'s Expense', '1', '2018-08-26 15:05:23', '1', '2', null, '182', '1', '2018-07-02 16:23:21', null, '62192'), ('32', 'Air ticket Expense', '1', '2018-08-26 15:05:58', '1', '2', null, '182', '1', '2018-07-02 16:23:21', null, '62193'), ('33', 'Staff Insurrance', '1', '2018-08-26 15:28:26', '1', '2', null, '22', '1', '2018-07-02 16:23:21', null, '61202'), ('36', 'Other Expense', '1', '2018-08-26 16:18:00', '1', '5', null, '0', '1', '2018-07-02 16:23:21', null, '70000'), ('37', 'Cash on Hand in Cambodia', '1', '2018-08-25 23:22:33', '1', '3', null, '102', '1', '2018-07-02 16:23:21', null, '10100'), ('38', 'Cash on Hand in Siem Reap office', '1', '2018-08-25 23:25:31', '1', '3', null, '37', '1', '2018-07-02 16:23:21', null, '10101'), ('39', 'Cash on Hand in Phnom Penh office', '1', '2018-08-25 23:26:04', '1', '3', null, '37', '1', '2018-07-02 16:23:21', null, '10102'), ('40', 'Cash on Hand in Philippine', '1', '2018-08-25 23:22:57', '1', '3', null, '102', '1', '2018-07-02 16:23:21', null, '10200'), ('42', 'Shareholders\' Equity', '1', '2018-08-26 16:21:27', '1', '7', null, '0', '1', '2018-07-02 16:23:21', null, '30000'), ('43', 'Owner\'s Withdrawal', '1', '2018-08-26 16:24:33', '1', '7', null, '42', '1', '2018-07-02 16:23:21', null, '33000'), ('44', 'Retained Earnings', '1', '2018-08-26 16:23:14', '1', '7', null, '0', '1', '2018-07-02 16:23:21', null, '39000'), ('46', 'Interest Payable ', '1', '2018-08-26 17:17:38', '1', '8', null, '48', '1', '2018-07-02 16:23:21', null, '26010'), ('47', 'Insurrance Payable', '1', '2018-08-26 17:24:50', '1', '8', null, '0', '1', '2018-07-02 16:23:21', null, '22000'), ('48', 'Loan Payable ', '1', '2018-08-26 17:14:00', '1', '8', null, '0', '1', '2018-07-02 16:23:21', null, '26000'), ('49', 'Payroll Liabilities', '1', '2018-08-26 17:13:23', '1', '8', null, '0', '1', '2018-07-02 16:23:21', null, '21000'), ('51', 'Employee Cash Advances', '1', '2018-08-26 17:56:50', '1', '9', null, '218', '1', '2018-07-02 16:23:21', null, '14030'), ('52', 'Inventory', '1', '2018-08-26 18:00:01', '1', '9', null, '0', '1', '2018-07-02 16:23:21', null, '13000'), ('53', 'Loans to Shareholders', '1', '2018-08-26 17:55:40', '1', '9', null, '218', '1', '2018-07-02 16:23:21', null, '14010'), ('54', 'Other Current Assets', '1', '2018-08-26 18:14:03', '1', '9', null, '0', '1', '2018-07-02 16:23:21', null, '17000'), ('55', 'Prepaid Expense', '1', '2018-08-24 23:15:50', '1', '9', null, '0', '1', '2018-07-02 16:23:21', null, '15000'), ('56', 'Loans to Officers', '1', '2018-08-26 17:57:46', '1', '9', null, '218', '1', '2018-07-02 16:23:21', null, '14040'), ('62', 'Account Payable', '1', '2018-08-24 23:12:20', '1', '44', null, '0', '1', '2018-07-02 16:23:21', null, '20000'), ('63', 'Account Receivable', '1', '2018-08-24 23:11:17', '1', '45', null, '0', '1', '2018-07-02 16:23:21', null, '12000'), ('64', 'Cash in Bank Cambodia', '1', '2018-08-25 23:29:34', '1', '3', null, '104', '1', '2018-07-02 16:23:21', null, '11100'), ('65', 'Cash in Bank Phillippine', '1', '2018-08-26 15:21:22', '1', '3', null, '104', '1', '2018-07-02 16:23:21', null, '11200'), ('67', 'Vehicle', '1', '2018-08-27 22:46:53', '1', '46', null, '0', '1', '2018-07-02 16:23:21', null, '18100'), ('68', 'Building', '1', '2018-08-27 22:47:17', '1', '46', null, '0', '1', '2018-07-02 16:23:21', null, '18200'), ('69', 'Bank Deposit (Business Bank Guaranteed)', '1', '2018-08-26 18:35:16', '1', '9', null, '221', '1', '2018-07-02 16:23:21', null, '16500'), ('70', 'Trade Discount & Promotion(-)', '1', '2018-08-26 16:05:19', '1', '1', null, '0', '1', '2018-07-02 16:23:21', null, '43000'), ('71', 'Unearned Revenue', '1', '2018-08-26 17:09:13', '1', '8', null, '0', '1', '2018-07-02 16:23:21', null, '25000'), ('72', 'Guide Advances', '1', '2018-08-26 17:56:25', '1', '9', null, '218', '1', '2018-07-02 16:54:32', null, '14020'), ('73', 'Staff Allowance Expense', '1', '2018-08-26 15:28:46', '1', '2', null, '22', '1', '2018-07-10 16:07:46', null, '61203'), ('75', 'Guide Advance Liabilities', '1', '2018-08-26 17:08:43', '1', '8', null, '0', '1', '2018-08-15 15:54:13', null, '24000'), ('79', 'Cash on Hand in Myanmar', '1', '2018-08-25 23:23:24', '1', '3', null, '102', '1', '2018-08-16 23:45:17', null, '10300'), ('80', 'Cash in Bank Vietnam', '1', '2018-08-25 23:34:50', '1', '3', null, '104', '1', '2018-08-16 23:46:25', null, '11300'), ('82', 'Cash in Bank Thailand', '1', '2018-08-26 15:22:27', '1', '3', null, '104', '1', '2018-08-16 23:51:18', null, '11400'), ('85', 'Cash on Hand in Indonesia', '1', '2018-08-25 23:23:48', '1', '3', null, '102', '1', '2018-08-16 23:55:32', null, '10400'), ('87', 'Salary Tax Payable', '1', '2018-08-26 16:56:12', '1', '8', null, '206', '1', '2018-08-17 01:50:59', null, '23010'), ('88', 'Value Added Tax Payable', '1', '2018-08-26 16:57:37', '1', '8', null, '206', '1', '2018-08-17 01:52:33', null, '23030'), ('89', 'Profit Tax Payable', '1', '2018-08-26 16:57:08', '1', '8', null, '206', '1', '2018-08-17 01:53:35', null, '23020'), ('90', 'Withholding Tax Payable', '1', '2018-08-26 16:58:06', '1', '8', null, '206', '1', '2018-08-17 01:56:06', null, '23040'), ('91', 'Operation & Admin Expense', '1', '2018-08-20 12:47:55', '1', '2', null, '0', '1', '2018-08-20 12:47:55', null, '60000'), ('92', 'General Expense', '1', '2018-08-20 12:49:34', '1', '2', null, '91', '1', '2018-08-20 12:49:34', null, '61000'), ('95', 'Rental Expense', '1', '2018-08-24 22:58:11', '1', '2', null, '92', '1', '2018-08-24 22:53:11', null, '61300'), ('96', 'Communication Expense', '1', '2018-08-24 22:59:21', '1', '2', null, '92', '1', '2018-08-24 22:59:21', null, '61400'), ('97', 'Admin Expense', '1', '2018-08-24 23:00:22', '1', '2', null, '92', '1', '2018-08-24 23:00:22', null, '61500'), ('98', 'Marketing Expense', '1', '2018-08-26 14:11:55', '1', '2', null, '91', '1', '2018-08-24 23:02:05', null, '62000'), ('99', 'Maintenance & Repair Expense', '1', '2018-08-26 14:25:00', '1', '2', null, '92', '1', '2018-08-24 23:03:27', null, '61900'), ('100', 'Taxes Expense', '1', '2018-08-26 14:12:32', '1', '2', null, '91', '1', '2018-08-24 23:07:14', null, '63000'), ('101', 'Finance Expense', '1', '2018-08-26 14:13:08', '1', '2', null, '91', '1', '2018-08-24 23:08:59', null, '64000'), ('102', 'Cash on Hand', '1', '2018-08-26 09:48:33', '1', '3', null, '0', '1', '2018-08-24 23:18:16', null, '10000'), ('104', 'Cash in Bank', '1', '2018-08-25 23:27:49', '1', '3', null, '0', '1', '2018-08-25 23:27:49', null, '11000'), ('105', 'Telephone Expense', '1', '2018-08-26 14:20:47', '1', '2', null, '96', '1', '2018-08-26 10:02:45', null, '61430'), ('107', 'Post Office Fee', '1', '2018-08-26 14:21:08', '1', '2', null, '96', '1', '2018-08-26 10:09:47', null, '61440'), ('108', 'Security Expense', '1', '2018-08-26 14:36:55', '1', '2', null, '97', '1', '2018-08-26 10:18:29', null, '61522'), ('109', 'Donations and Charity Expense', '1', '2018-08-26 14:58:40', '1', '2', null, '98', '1', '2018-08-26 10:20:06', null, '62040'), ('110', 'Printing Expense', '1', '2018-08-26 14:37:19', '1', '2', null, '97', '1', '2018-08-26 10:20:37', null, '61523'), ('111', 'Insurrance Expense', '1', '2018-08-26 14:37:38', '1', '2', null, '97', '1', '2018-08-26 10:21:38', null, '61524'), ('112', 'Newspaper & Margazine Expense', '1', '2018-08-26 14:37:54', '1', '2', null, '97', '1', '2018-08-26 10:22:48', null, '61525'), ('113', 'Office Supplies Expense', '1', '2018-08-26 14:38:14', '1', '2', null, '97', '1', '2018-08-26 10:23:25', null, '61526'), ('114', 'Small Tools & Equipment', '1', '2018-08-26 14:39:18', '1', '2', null, '97', '1', '2018-08-26 10:24:31', null, '61527'), ('115', 'Domain Hosting Expense', '1', '2018-08-26 14:39:49', '1', '2', null, '97', '1', '2018-08-26 10:25:15', null, '61528'), ('116', 'Professional Fee Expense', '1', '2018-08-26 14:40:17', '1', '2', null, '97', '1', '2018-08-26 10:26:11', null, '61529'), ('117', 'Staff Retreatment Trip Expense', '1', '2018-08-26 14:40:35', '1', '2', null, '97', '1', '2018-08-26 10:27:24', null, '61530'), ('118', 'Staff Training Expense', '1', '2018-08-26 14:40:55', '1', '2', null, '97', '1', '2018-08-26 10:33:23', null, '61531'), ('119', 'Staff Entertainment Expense', '1', '2018-08-26 14:41:15', '1', '2', null, '97', '1', '2018-08-26 10:33:58', null, '61532'), ('120', 'Staff Uniform Expense', '1', '2018-08-26 14:41:34', '1', '2', null, '97', '1', '2018-08-26 10:34:36', null, '61533'), ('121', 'Office Stationaries Expense', '1', '2018-08-26 14:41:52', '1', '2', null, '97', '1', '2018-08-26 10:36:31', null, '61534'), ('122', 'Tips Expense', '1', '2018-08-26 14:42:08', '1', '2', null, '97', '1', '2018-08-26 10:38:02', null, '61535'), ('123', 'Delivery & Shipping Expense', '1', '2018-08-26 14:42:28', '1', '2', null, '97', '1', '2018-08-26 10:38:49', null, '61536'), ('124', 'Staff Recruitment Expense', '1', '2018-08-26 14:42:45', '1', '2', null, '97', '1', '2018-08-26 10:39:38', null, '61537'), ('125', 'Religious Ceremony Expense', '1', '2018-08-26 14:44:04', '1', '2', null, '97', '1', '2018-08-26 10:40:23', null, '61538'), ('126', 'Commission for Customer Expense', '1', '2018-08-26 14:59:11', '1', '2', null, '98', '1', '2018-08-26 11:05:31', null, '62050'), ('127', 'Commission for Staff Expense', '1', '2018-08-26 14:59:47', '1', '2', null, '98', '1', '2018-08-26 11:06:42', null, '62060'), ('128', 'Agent Fam Trip Expense', '1', '2018-08-26 15:00:08', '1', '2', null, '98', '1', '2018-08-26 11:07:56', null, '62070'), ('129', 'Trade & Expo attending Expense', '1', '2018-08-26 15:00:31', '1', '2', null, '98', '1', '2018-08-26 11:10:33', null, '62080'), ('130', 'Membership & Affiliate Expense', '1', '2018-08-26 15:00:52', '1', '2', null, '98', '1', '2018-08-26 11:12:19', null, '62090'), ('131', 'Rep. Marketing Fee', '1', '2018-08-26 15:01:23', '1', '2', null, '98', '1', '2018-08-26 11:14:06', null, '62100'), ('132', 'Entertainment Supplier', '1', '2018-08-26 15:01:46', '1', '2', null, '98', '1', '2018-08-26 11:15:40', null, '62110'), ('133', 'Entertainment Customer', '1', '2018-08-26 15:02:04', '1', '2', null, '98', '1', '2018-08-26 11:17:24', null, '62120'), ('134', 'Business Gift Expense', '1', '2018-08-26 15:02:26', '1', '2', null, '98', '1', '2018-08-26 11:22:04', null, '62130'), ('135', 'Compensation Expense', '1', '2018-08-26 15:02:57', '1', '2', null, '98', '1', '2018-08-26 11:25:25', null, '62140'), ('136', 'Business Promotion', '1', '2018-08-26 15:03:18', '1', '2', null, '98', '1', '2018-08-26 11:27:10', null, '62150'), ('137', 'Art & Graphic Expense', '1', '2018-08-26 15:03:38', '1', '2', null, '98', '1', '2018-08-26 11:36:49', null, '62160'), ('138', 'Broucher & Marketing Meterial', '1', '2018-08-26 15:04:01', '1', '2', null, '98', '1', '2018-08-26 11:38:17', null, '62170'), ('139', 'Sales Promotion Expense', '1', '2018-08-26 15:04:23', '1', '2', null, '98', '1', '2018-08-26 11:40:28', null, '62180'), ('140', 'Web Design Expense', '1', '2018-08-26 14:44:22', '1', '2', null, '97', '1', '2018-08-26 11:45:47', null, '61539'), ('141', 'Refriedgerator Maintenance', '1', '2018-08-26 14:26:24', '1', '2', null, '99', '1', '2018-08-26 11:55:46', null, '61903'), ('142', 'Air-conditioner Maintenance', '1', '2018-08-26 14:26:47', '1', '2', null, '99', '1', '2018-08-26 11:56:30', null, '61904'), ('143', 'Printer & Scanner Maintenance', '1', '2018-08-26 14:27:10', '1', '2', null, '99', '1', '2018-08-26 11:57:52', null, '61905'), ('144', 'Building Maintenance', '1', '2018-08-26 14:27:32', '1', '2', null, '99', '1', '2018-08-26 11:58:55', null, '61906'), ('145', 'Electricity Maintenance', '1', '2018-08-26 14:27:58', '1', '2', null, '99', '1', '2018-08-26 11:59:51', null, '61907'), ('146', 'Kitchen Equipment Maintenance', '1', '2018-08-26 14:29:31', '1', '2', null, '99', '1', '2018-08-26 12:00:41', null, '61908'), ('147', 'Server Maintenance', '1', '2018-08-26 14:29:52', '1', '2', null, '99', '1', '2018-08-26 12:01:55', null, '61909'), ('148', 'Office Space Maintenance', '1', '2018-08-26 14:30:12', '1', '2', null, '99', '1', '2018-08-26 12:02:39', null, '61910'), ('149', 'Bathroom Maintenance', '1', '2018-08-26 14:30:43', '1', '2', null, '99', '1', '2018-08-26 12:03:33', null, '61911'), ('150', 'Solar System Maintenance', '1', '2018-08-26 14:31:06', '1', '2', null, '99', '1', '2018-08-26 12:04:11', null, '61912'), ('151', 'Sound System Maintenance', '1', '2018-08-26 14:31:25', '1', '2', null, '99', '1', '2018-08-26 12:04:46', null, '61913'), ('152', 'Telephone Maintenance', '1', '2018-08-26 14:31:46', '1', '2', null, '99', '1', '2018-08-26 12:06:00', null, '61914'), ('153', 'TV Maintenance', '1', '2018-08-26 14:32:07', '1', '2', null, '99', '1', '2018-08-26 12:06:35', null, '61915'), ('154', 'Water System Maintenance', '1', '2018-08-26 14:32:30', '1', '2', null, '99', '1', '2018-08-26 12:07:26', null, '61916'), ('155', 'Fire Extinguishing System', '1', '2018-08-26 14:33:02', '1', '2', null, '99', '1', '2018-08-26 12:08:07', null, '61917'), ('156', 'Wooden Equipment', '1', '2018-08-26 14:33:21', '1', '2', null, '99', '1', '2018-08-26 12:08:56', null, '61918'), ('157', 'Lighting Repair', '1', '2018-08-26 14:34:03', '1', '2', null, '99', '1', '2018-08-26 12:10:18', null, '61919'), ('158', 'Painting Maintenance', '1', '2018-08-26 14:34:24', '1', '2', null, '99', '1', '2018-08-26 12:11:27', null, '61920'), ('159', 'Garden & Landscap Maintenance', '1', '2018-08-26 14:34:43', '1', '2', null, '99', '1', '2018-08-26 12:42:28', null, '61921'), ('160', 'Logo and Banner Tax', '1', '2018-08-26 15:08:46', '1', '2', null, '100', '1', '2018-08-26 12:45:15', null, '63010'), ('161', 'Withholding Tax', '1', '2018-08-26 15:09:07', '1', '2', null, '100', '1', '2018-08-26 12:46:56', null, '63020'), ('162', 'Authority Tax', '1', '2018-08-26 15:09:32', '1', '2', null, '100', '1', '2018-08-26 12:47:29', null, '63030'), ('163', 'Patent Tax Expense', '1', '2018-08-26 15:10:34', '1', '2', null, '100', '1', '2018-08-26 12:48:15', null, '63040'), ('164', 'Salary Tax Expense', '1', '2018-08-26 16:59:26', '1', '2', null, '100', '1', '2018-08-26 12:49:01', null, '63050'), ('165', 'Profit Tax', '1', '2018-08-26 15:11:10', '1', '2', null, '100', '1', '2018-08-26 12:49:50', null, '63060'), ('166', 'Value Added Tax Payable', '1', '2018-08-26 17:05:50', '1', '2', null, '100', '1', '2018-08-26 12:50:37', null, '63070'), ('167', 'Office Rental Tax', '1', '2018-08-26 15:11:57', '1', '2', null, '100', '1', '2018-08-26 12:52:08', null, '63080'), ('168', 'Penalty Tax', '1', '2018-08-26 15:12:21', '1', '2', null, '100', '1', '2018-08-26 12:52:51', null, '63090'), ('169', 'Tax Registration/ Update Tax', '1', '2018-08-26 15:13:36', '1', '2', null, '100', '1', '2018-08-26 12:53:40', null, '63100'), ('170', 'Prepayment Profit Tax', '1', '2018-08-26 15:14:01', '1', '2', null, '100', '1', '2018-08-26 12:54:40', null, '63110'), ('171', 'Tax Services', '1', '2018-08-26 15:14:35', '1', '2', null, '100', '1', '2018-08-26 12:55:09', null, '63120'), ('172', 'Credit Card Fee Expense', '1', '2018-08-26 15:17:41', '1', '2', null, '101', '1', '2018-08-26 13:26:02', null, '64030'), ('173', 'Interest Expense', '1', '2018-08-26 15:18:02', '1', '2', null, '101', '1', '2018-08-26 13:27:10', null, '63040'), ('174', 'Gian & Loss Exchange Rate', '1', '2018-08-26 15:18:33', '1', '2', null, '101', '1', '2018-08-26 13:27:55', null, '63050'), ('175', 'Cheque Book Expense', '1', '2018-08-26 15:18:50', '1', '2', null, '101', '1', '2018-08-26 13:28:45', null, '63060'), ('176', 'Depreciation Expense', '1', '2018-08-26 15:19:09', '1', '2', null, '101', '1', '2018-08-26 13:29:16', null, '63070'), ('177', 'Office - Siem Reap Rental', '1', '2018-08-26 14:18:12', '1', '2', null, '95', '1', '2018-08-26 13:36:19', null, '61310'), ('178', 'Office - Phnom Penh Rental', '1', '2018-08-26 14:18:33', '1', '2', null, '95', '1', '2018-08-26 13:37:01', null, '61320'), ('179', 'Office - Manila Rental', '1', '2018-08-26 14:18:52', '1', '2', null, '95', '1', '2018-08-26 13:37:51', null, '61330'), ('180', 'Office - Jakarta Rental', '1', '2018-08-26 14:19:08', '1', '2', null, '95', '1', '2018-08-26 13:38:52', null, '61340'), ('181', 'Office - Yangon Rental', '1', '2018-08-26 14:19:24', '1', '2', null, '95', '1', '2018-08-26 13:41:43', null, '61350'), ('182', 'Business Trip Expense', '1', '2018-08-26 15:04:43', '1', '2', null, '98', '1', '2018-08-26 13:45:48', null, '62190'), ('183', 'Taxi & Transport\'s Expense', '1', '2018-08-26 15:06:13', '1', '2', null, '182', '1', '2018-08-26 13:50:26', null, '62194'), ('184', 'Visa & Permission fee', '1', '2018-08-26 15:06:34', '1', '2', null, '182', '1', '2018-08-26 13:52:02', null, '62195'), ('185', 'Staff Meal', '1', '2018-08-26 14:45:50', '1', '2', null, '16', '1', '2018-08-26 13:57:55', null, '61511'), ('186', 'Staff Mineral Water', '1', '2018-08-26 14:46:06', '1', '2', null, '16', '1', '2018-08-26 13:58:33', null, '61512'), ('187', 'Staff Rice Supply', '1', '2018-08-26 14:46:26', '1', '2', null, '16', '1', '2018-08-26 13:59:08', null, '61513'), ('188', 'Kitchen Supplies', '1', '2018-08-26 14:46:47', '1', '2', null, '16', '1', '2018-08-26 14:03:34', null, '61514'), ('189', 'Staff Cake & Birthday', '1', '2018-08-26 14:44:51', '1', '2', null, '97', '1', '2018-08-26 14:07:01', null, '61540'), ('190', 'Snack & Coffee Expense', '1', '2018-08-26 14:48:39', '1', '2', null, '16', '1', '2018-08-26 14:48:14', null, '61515'), ('191', 'Salary Expense', '1', '2018-08-26 15:29:16', '1', '2', null, '22', '1', '2018-08-26 15:29:16', null, '61204'), ('192', 'Medical Expense', '1', '2018-08-26 15:30:55', '1', '2', null, '22', '1', '2018-08-26 15:30:55', null, '61205'), ('193', 'Business License', '1', '2018-08-26 15:33:11', '1', '2', null, '97', '1', '2018-08-26 15:33:11', null, '61541'), ('194', 'Tourism License', '1', '2018-08-26 15:33:44', '1', '2', null, '97', '1', '2018-08-26 15:33:44', null, '61542'), ('195', 'Electricity Expense', '1', '2018-08-26 15:35:52', '1', '2', null, '15', '1', '2018-08-26 15:35:52', null, '61101'), ('196', 'Water usage Expense', '1', '2018-08-26 15:36:52', '1', '2', null, '15', '1', '2018-08-26 15:36:52', null, '61102'), ('197', 'City Cleaning fee', '1', '2018-08-26 15:37:21', '1', '2', null, '15', '1', '2018-08-26 15:37:21', null, '61103'), ('198', 'Cable TV', '1', '2018-08-26 15:38:01', '1', '2', null, '15', '1', '2018-08-26 15:38:01', null, '61104'), ('200', 'Commission', '1', '2018-08-26 16:14:05', '1', '4', null, '4', '1', '2018-08-26 16:14:05', null, '51000'), ('202', 'Owner\'s Equity', '1', '2018-08-26 16:28:55', '1', '7', null, '42', '1', '2018-08-26 16:28:55', null, '31000'), ('204', 'Owner\'s Investment', '1', '2018-08-26 16:31:24', '1', '7', null, '42', '1', '2018-08-26 16:31:24', null, '32000'), ('206', 'Taxation Liability', '1', '2018-08-26 16:55:15', '1', '8', null, '0', '1', '2018-08-26 16:55:15', null, '23000'), ('208', 'Loan from Bank', '1', '2018-08-26 17:18:41', '1', '8', null, '48', '1', '2018-08-26 17:18:41', null, '26020'), ('209', 'Loan from outside', '1', '2018-08-26 17:19:37', '1', '8', null, '48', '1', '2018-08-26 17:19:37', null, '26030'), ('210', 'Business License', '1', '2018-08-26 17:45:04', '1', '9', null, '55', '1', '2018-08-26 17:45:04', null, '15010'), ('211', 'Prepaid Office Rental', '1', '2018-08-26 17:46:24', '1', '9', null, '55', '1', '2018-08-26 17:46:24', null, '15020'), ('212', 'Prepaid Insurrance', '1', '2018-08-26 17:47:08', '1', '9', null, '55', '1', '2018-08-26 17:47:08', null, '15030'), ('213', 'Prepaid Advertising', '1', '2018-08-26 17:48:33', '1', '9', null, '55', '1', '2018-08-26 17:48:33', null, '15040'), ('214', 'Prepaid Cable TV', '1', '2018-08-26 17:49:53', '1', '9', null, '55', '1', '2018-08-26 17:49:37', null, '15050'), ('215', 'Prepaid of Profit Tax', '1', '2018-08-26 17:50:40', '1', '9', null, '55', '1', '2018-08-26 17:50:40', null, '15060'), ('216', 'Prepaid Internet', '1', '2018-08-26 17:51:17', '1', '9', null, '55', '1', '2018-08-26 17:51:17', null, '15070'), ('217', 'Prepaid Telephone', '1', '2018-08-26 17:51:55', '1', '9', null, '55', '1', '2018-08-26 17:51:55', null, '15080'), ('218', 'Cash Advance', '1', '2018-08-26 17:55:01', '1', '9', null, '0', '1', '2018-08-26 17:55:01', null, '14000'), ('219', 'Undeposited fund', '1', '2018-08-26 18:03:49', '1', '9', null, '0', '1', '2018-08-26 18:03:49', null, '12100'), ('220', 'Barter Account Clearance', '1', '2018-08-26 18:04:46', '1', '9', null, '0', '1', '2018-08-26 18:04:46', null, '12200'), ('221', 'Deposit fund', '1', '2018-08-26 18:15:01', '1', '9', null, '0', '1', '2018-08-26 18:15:01', null, '16000'), ('222', 'Deposit for Office Rental', '1', '2018-08-26 18:16:59', '1', '9', null, '221', '1', '2018-08-26 18:16:59', null, '16100'), ('223', 'Deposit for Phone Connection', '1', '2018-08-26 18:17:36', '1', '9', null, '221', '1', '2018-08-26 18:17:36', null, '16200'), ('224', 'Deposit for Internet', '1', '2018-08-26 18:18:04', '1', '9', null, '221', '1', '2018-08-26 18:18:04', null, '16300'), ('225', 'Deposit To Supplier', '1', '2018-08-26 18:18:49', '1', '9', null, '221', '1', '2018-08-26 18:18:49', null, '16400'), ('226', 'Deposit Holding', '1', '2018-08-26 18:23:44', '1', '8', null, '0', '1', '2018-08-26 18:23:44', null, '27000'), ('227', 'Deposit from Customer', '1', '2018-08-26 18:24:32', '1', '8', null, '226', '1', '2018-08-26 18:24:32', null, '27100'), ('228', 'Deposit from Franchise', '1', '2018-08-26 18:28:45', '1', '8', null, '226', '1', '2018-08-26 18:28:14', null, '27200'), ('229', 'Accumulated Depreciation', '1', '2018-08-26 18:45:14', '1', '46', null, '0', '1', '2018-08-26 18:45:14', null, '17000'), ('230', 'Fixed Asset Class I (5%)', '1', '2018-08-26 18:47:26', '1', '46', null, '0', '1', '2018-08-26 18:46:47', null, '17100'), ('231', 'Fixed Asset Class II (50%)', '1', '2018-08-26 18:48:23', '1', '46', null, '0', '1', '2018-08-26 18:48:23', null, '17200'), ('232', 'Fixed Asset Class III (25%)', '1', '2018-08-26 18:48:59', '1', '46', null, '0', '1', '2018-08-26 18:48:59', null, '17300'), ('233', 'Fixed Asset Class IV (20%)', '1', '2018-08-26 18:49:48', '1', '46', null, '0', '1', '2018-08-26 18:49:48', null, '17400'), ('234', 'Cost of Renovate Building', '1', '2018-08-26 18:51:14', '1', '46', null, '230', '1', '2018-08-26 18:51:14', null, '17101'), ('235', 'Cost of Plant & Landscape', '1', '2018-08-26 18:52:02', '1', '46', null, '230', '1', '2018-08-26 18:52:02', null, '17102'), ('236', 'Cost of Pool Side', '1', '2018-08-26 18:52:36', '1', '46', null, '230', '1', '2018-08-26 18:52:36', null, '17103'), ('237', 'Acc. Depre. of Fixed Asset I', '1', '2018-08-26 18:53:20', '1', '46', null, '230', '1', '2018-08-26 18:53:20', null, '17107'), ('238', 'Cost of Housekeeping Equipment', '1', '2018-08-26 18:55:05', '1', '46', null, '231', '1', '2018-08-26 18:55:05', null, '17201'), ('239', 'Cost of Office Supplies', '1', '2018-08-26 18:55:55', '1', '46', null, '231', '1', '2018-08-26 18:55:55', null, '17203'), ('240', 'Cost of Housekeeping Linen', '1', '2018-08-26 18:56:49', '1', '46', null, '231', '1', '2018-08-26 18:56:49', null, '17204'), ('241', 'Cost of Finger Print', '1', '2018-08-26 18:57:23', '1', '46', null, '231', '1', '2018-08-26 18:57:23', null, '17205'), ('242', 'Cost of Restaurant Linen', '1', '2018-08-26 18:58:51', '1', '46', null, '231', '1', '2018-08-26 18:58:51', null, '17206'), ('243', 'Cost of Fire Extinguisher', '1', '2018-08-26 18:59:20', '1', '46', null, '231', '1', '2018-08-26 18:59:20', null, '17207'), ('244', 'Cost of Computer & Printer', '1', '2018-08-26 19:00:02', '1', '46', null, '231', '1', '2018-08-26 19:00:02', null, '17209'), ('245', 'Cost of Restaurant Funiture', '1', '2018-08-26 19:00:42', '1', '46', null, '231', '1', '2018-08-26 19:00:42', null, '17210'), ('246', 'Acc. Depre. of Fixed Asset II', '1', '2018-08-26 19:01:40', '1', '46', null, '231', '1', '2018-08-26 19:01:40', null, '17220'), ('247', 'Cost of Machine', '1', '2018-08-26 19:02:30', '1', '46', null, '232', '1', '2018-08-26 19:02:30', null, '17301'), ('248', 'Cost of Camera', '1', '2018-08-26 19:03:07', '1', '46', null, '232', '1', '2018-08-26 19:03:07', null, '17302'), ('250', 'Cost of Coffee Machine', '1', '2018-08-26 19:04:19', '1', '46', null, '232', '1', '2018-08-26 19:04:19', null, '17304'), ('251', 'Cost of Office Equipment', '1', '2018-08-26 19:05:06', '1', '46', null, '232', '1', '2018-08-26 19:05:06', null, '17305'), ('252', 'Cost of Housekeeping Tool', '1', '2018-08-26 19:05:56', '1', '46', null, '232', '1', '2018-08-26 19:05:56', null, '17306'), ('253', 'Cost of Sound System', '1', '2018-08-26 19:06:29', '1', '46', null, '232', '1', '2018-08-26 19:06:29', null, '17307'), ('254', 'Cost of Funiture & Fixture', '1', '2018-08-26 19:07:35', '1', '46', null, '232', '1', '2018-08-26 19:07:35', null, '17308'), ('255', 'Cost of Statues', '1', '2018-08-26 19:08:09', '1', '46', null, '232', '1', '2018-08-26 19:08:09', null, '17309'), ('256', 'Kitchen Equipment', '1', '2018-08-26 19:08:57', '1', '46', null, '232', '1', '2018-08-26 19:08:57', null, '17310'), ('257', 'Cost of Kitchen Equipment', '1', '2018-08-26 19:09:30', '1', '46', null, '232', '1', '2018-08-26 19:09:30', null, '17311'), ('258', 'Cost of Painting', '1', '2018-08-26 19:18:23', '1', '46', null, '232', '1', '2018-08-26 19:18:23', null, '17312'), ('259', 'Cost of Telephone System', '1', '2018-08-26 19:20:33', '1', '46', null, '232', '1', '2018-08-26 19:20:33', null, '17313'), ('260', 'Cost of Kitchen Utensil', '1', '2018-08-26 19:22:26', '1', '46', null, '232', '1', '2018-08-26 19:22:26', null, '17314'), ('261', 'Cost of Restaurant Utensils', '1', '2018-08-26 19:23:01', '1', '46', null, '232', '1', '2018-08-26 19:23:01', null, '17315'), ('262', 'Cost of Restaurant Equipment', '1', '2018-08-26 19:23:38', '1', '46', null, '232', '1', '2018-08-26 19:23:38', null, '17316'), ('263', 'Cost of Water System', '1', '2018-08-26 19:24:08', '1', '46', null, '232', '1', '2018-08-26 19:24:08', null, '17317'), ('264', 'Cost of Main Server System', '1', '2018-08-26 19:24:40', '1', '46', null, '232', '1', '2018-08-26 19:24:40', null, '17319'), ('265', 'Cost of Internet & Wifi Setup', '1', '2018-08-26 19:25:20', '1', '46', null, '232', '1', '2018-08-26 19:25:20', null, '17321'), ('266', 'Acc. Depre. of Fixed Asset III', '1', '2018-08-26 19:26:02', '1', '46', null, '232', '1', '2018-08-26 19:26:02', null, '17330'), ('267', 'Cost of Air-conditioner', '1', '2018-08-26 19:27:47', '1', '46', null, '233', '1', '2018-08-26 19:27:47', null, '17402'), ('268', 'Cost of Electricity System', '1', '2018-08-26 19:28:27', '1', '46', null, '233', '1', '2018-08-26 19:28:27', null, '17408'), ('269', 'Acc. Depre. of Fixed Asset IV', '1', '2018-08-26 19:29:08', '1', '46', null, '233', '1', '2018-08-26 19:29:08', null, '17410'), ('270', 'Long Term Liabilities', '1', '2018-08-27 22:42:07', '1', '8', null, '0', '1', '2018-08-27 22:35:19', null, '28000'), ('271', 'Lease ? Vehicles', '1', '2018-08-27 22:42:54', '1', '8', null, '270', '1', '2018-08-27 22:37:14', null, '28100'), ('272', 'Lease ? Building', '1', '2018-08-27 22:43:09', '1', '8', null, '270', '1', '2018-08-27 22:37:51', null, '28200'), ('273', 'Opening Balance Equity', '1', '2019-01-13 16:53:06', '1', '7', '26', '42', '1', '2019-01-13 16:52:24', null, '34000'), ('274', 'Sacom Bank : eOcambo Technology | 00032882', '1', '2019-06-26 13:45:42', '1', '3', null, '64', '1', '2018-07-02 16:23:21', '13', '11101'), ('275', 'ABA Bank: PHICH SOKDA (No. 000120354)', '1', '2019-06-24 08:16:55', '1', '3', null, '64', '1', '2018-08-11 19:18:30', '1', '11102');
COMMIT;

-- ----------------------------
--  Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_country` int(11) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `names` varchar(250) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img` varchar(250) DEFAULT NULL,
  `video_link` varchar(50) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_country` (`id_country`) USING BTREE,
  KEY `id` (`id`,`id_country`,`code`,`names`,`description`,`img`,`video_link`,`latitude`,`longitude`,`updated_by`,`updated_date`,`status`,`created_by`,`created_date`) USING BTREE,
  KEY `id_2` (`id`,`id_country`,`code`,`names`,`description`,`img`,`video_link`,`latitude`,`longitude`,`updated_by`,`updated_date`,`status`,`created_by`,`created_date`) USING BTREE,
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `city`
-- ----------------------------
BEGIN;
INSERT INTO `city` VALUES ('1', '56', 'PNH', 'Phnom Penh', '', null, '', '0', '0', '1000016', '2018-08-12 19:46:33', '1', '1000016', '2018-08-12 19:45:12'), ('2', '56', 'BMC', 'Banteay Meanchey', '', null, '', '0', '0', '1000016', '2018-08-12 20:43:53', '1', '1000016', '2018-08-12 20:43:53'), ('3', '56', 'BBM', 'Battambang', '', null, '', '0', '0', '1000016', '2018-08-12 20:44:12', '1', '1000016', '2018-08-12 20:44:12'), ('4', '56', 'KPC', 'Kampong Cham', '', null, '', '0', '0', '1000016', '2018-08-12 20:44:57', '1', '1000016', '2018-08-12 20:44:57'), ('5', '56', 'KZC', 'Kampong Chhnang', '', null, '', '0', '0', '1000016', '2018-08-12 20:45:45', '1', '1000016', '2018-08-12 20:45:45'), ('6', '56', 'KPS', 'Kampong Speu', '', null, '', '0', '0', '1000016', '2018-08-12 20:46:13', '1', '1000016', '2018-08-12 20:46:13'), ('7', '56', 'KZK', 'Kampong Thom', '', null, '', '0', '0', '1000016', '2018-08-12 20:46:32', '1', '1000016', '2018-08-12 20:46:32'), ('8', '56', 'KMT', 'Kampot', '', null, '', '0', '0', '1000016', '2018-08-12 20:46:59', '1', '1000016', '2018-08-12 20:46:59'), ('9', '56', 'KDL', 'Kandal', '', null, '', '0', '0', '1000016', '2018-08-12 20:47:18', '1', '1000016', '2018-08-12 20:47:18'), ('10', '56', 'KKZ', 'Koh Kong', '', null, '', '0', '0', '1000016', '2018-08-12 20:47:44', '1', '1000016', '2018-08-12 20:47:44'), ('11', '56', 'KEP', 'Kep', '', null, '', '0', '0', '1000016', '2018-08-12 20:38:22', '1', '1000016', '2018-08-12 20:38:22'), ('12', '56', 'KTI', 'Kratie', '', null, '', '0', '0', '1000016', '2018-08-12 20:38:51', '1', '1000016', '2018-08-12 20:38:51'), ('13', '56', 'MWV', 'Mondulkiri', '', null, '', '0', '0', '1000016', '2018-08-12 20:39:19', '1', '1000016', '2018-08-12 20:39:19'), ('14', '56', 'OMC', 'Oddar Meanchey', '', null, '', '0', '0', '1000016', '2018-08-12 20:39:41', '1', '1000016', '2018-08-12 20:39:41'), ('15', '56', 'PAI', 'Pailin', '', null, '', '0', '0', '1000016', '2018-08-12 20:40:35', '1', '1000016', '2018-08-12 20:40:35'), ('16', '56', 'KOS', 'Sihanoukville', '', null, '', '0', '0', '1000016', '2018-08-12 20:41:11', '1', '1000016', '2018-08-12 20:41:11'), ('17', '56', 'OMY', 'Preah Vihear', '', null, '', '0', '0', '1000016', '2018-08-12 20:42:09', '1', '1000016', '2018-08-12 20:42:09'), ('18', '56', 'KZD', 'Pursat', '', null, '', '0', '0', '1000016', '2018-08-12 20:42:41', '1', '1000016', '2018-08-12 20:42:41'), ('19', '56', 'PVG', 'Prey Veng', '', null, '', '0', '0', '1000016', '2018-08-12 20:43:07', '1', '1000016', '2018-08-12 20:43:07'), ('20', '56', 'RBE', 'Rattankiri', '', null, '', '0', '0', '1000016', '2018-08-12 20:43:27', '1', '1000016', '2018-08-12 20:43:27'), ('21', '56', 'REP', 'Siem Reap', '', null, '', '0', '0', '1000016', '2018-08-12 20:33:40', '1', '1000016', '2018-08-12 20:33:40'), ('22', '56', 'TNX', 'Stung Treng', '', null, '', '0', '0', '1000016', '2018-08-12 20:34:20', '1', '1000016', '2018-08-12 20:34:20'), ('23', '56', 'SVR', 'Svay Rieng', '', null, '', '0', '0', '1000016', '2018-08-12 20:36:23', '1', '1000016', '2018-08-12 20:36:23'), ('24', '56', 'TKO', 'Takeo', '', null, '', '0', '0', '1000016', '2018-08-12 20:36:59', '1', '1000016', '2018-08-12 20:36:59'), ('25', '56', 'TBK', 'Tbong Khmum', '', null, '', '0', '0', '1000016', '2018-08-12 20:37:25', '1', '1000016', '2018-08-12 20:37:25'), ('26', '237', 'BKK', 'Bangkok', '', null, '', '0', '0', '1000016', '2018-08-12 20:37:58', '1', '1000016', '2018-08-12 20:37:58'), ('44', '194', 'ABR', 'Abra', '', null, '', null, null, '1000016', '2018-08-12 21:27:04', '1', '1000016', '2018-08-12 21:27:04'), ('45', '194', 'AGN', 'Agusan del Norte', '', null, '', null, null, '1000016', '2018-08-12 21:29:25', '1', '1000016', '2018-08-12 21:29:25'), ('46', '194', 'AGS', 'Agusan del Sur', '', null, '', null, null, '1000016', '2018-08-12 21:30:12', '1', '1000016', '2018-08-12 21:30:12'), ('47', '194', 'AKL', 'Aklan', '', null, '', null, null, '1000016', '2018-08-12 21:30:59', '1', '1000016', '2018-08-12 21:30:59'), ('48', '194', 'ALB', 'Albay', '', null, '', null, null, '1000016', '2018-08-12 21:31:53', '1', '1000016', '2018-08-12 21:31:53'), ('49', '194', 'ANT', 'Antique', '', null, '', null, null, '1000016', '2018-08-12 21:32:51', '1', '1000016', '2018-08-12 21:32:51'), ('50', '194', 'APA', 'Apayao', '', null, '', null, null, '1000016', '2018-08-12 21:33:45', '1', '1000016', '2018-08-12 21:33:45'), ('51', '194', 'AUR', 'Aurora', '', null, '', null, null, '1000016', '2018-08-12 21:34:22', '1', '1000016', '2018-08-12 21:34:22'), ('52', '194', 'BAS', 'Basilan', '', null, '', null, null, '1000016', '2018-08-12 21:35:13', '1', '1000016', '2018-08-12 21:35:13'), ('53', '194', 'BAN', 'Bataan', '', null, '', null, null, '1000016', '2018-08-12 21:35:49', '1', '1000016', '2018-08-12 21:35:49'), ('54', '194', 'BTN', 'Batanes', '', null, '', null, null, '1000016', '2018-08-12 21:36:57', '1', '1000016', '2018-08-12 21:36:57'), ('55', '194', 'BTG', 'Batangas', '', null, '', null, null, '1000016', '2018-08-12 21:37:44', '1', '1000016', '2018-08-12 21:37:44'), ('56', '194', 'BEN', 'Benguet', '', null, '', null, null, '1000016', '2018-08-12 21:38:27', '1', '1000016', '2018-08-12 21:38:27'), ('57', '194', 'BIL', 'Biliran', '', null, '', null, null, '1000016', '2018-08-12 21:40:16', '1', '1000016', '2018-08-12 21:40:16'), ('58', '194', 'BOH', 'Bohol', '', null, '', null, null, '1000016', '2018-08-12 21:41:00', '1', '1000016', '2018-08-12 21:41:00'), ('59', '194', 'BUK', 'Bukidnon', '', null, '', null, null, '1000016', '2018-08-12 21:41:42', '1', '1000016', '2018-08-12 21:41:42'), ('60', '194', 'BUL', 'Bulacan', '', null, '', null, null, '1000016', '2018-08-12 21:42:18', '1', '1000016', '2018-08-12 21:42:18'), ('61', '194', 'CAG', 'Cagayan', '', null, '', null, null, '1000016', '2018-08-12 21:42:55', '1', '1000016', '2018-08-12 21:42:55'), ('62', '194', 'CAN', 'Camarines Norte', '', null, '', null, null, '1000016', '2018-08-12 21:43:41', '1', '1000016', '2018-08-12 21:43:41'), ('63', '194', 'CAS', 'Camarines Sur', '', null, '', null, null, '1000016', '2018-08-12 21:45:13', '1', '1000016', '2018-08-12 21:45:13'), ('64', '194', 'CAM', 'Camiguin', '', null, '', null, null, '1000016', '2018-08-12 21:47:36', '1', '1000016', '2018-08-12 21:47:36'), ('65', '194', 'CAP', 'Capiz', '', null, '', null, null, '1000016', '2018-08-12 21:48:18', '1', '1000016', '2018-08-12 21:48:18'), ('66', '194', 'CAT', 'Catanduanes', '', null, '', null, null, '1000016', '2018-08-12 21:49:12', '1', '1000016', '2018-08-12 21:49:12'), ('67', '194', 'CAV', 'Cavite', '', null, '', null, null, '1000016', '2018-08-12 21:49:54', '1', '1000016', '2018-08-12 21:49:54'), ('68', '194', 'CEB', 'Cebu', '', null, '', null, null, '1000016', '2018-08-12 21:50:32', '1', '1000016', '2018-08-12 21:50:32'), ('69', '194', 'COM', 'Compostela Valley', '', null, '', null, null, '1000016', '2018-08-12 21:51:28', '1', '1000016', '2018-08-12 21:51:28'), ('70', '194', 'NCO', 'Cotabato', '', null, '', null, null, '1000016', '2018-08-12 21:51:58', '1', '1000016', '2018-08-12 21:51:58'), ('71', '194', 'DAV', 'Davao del Norte', '', null, '', null, null, '1000016', '2018-08-12 21:52:54', '1', '1000016', '2018-08-12 21:52:54'), ('72', '194', 'DAS', 'Davao del Sur', '', null, '', null, null, '1000016', '2018-08-12 21:53:45', '1', '1000016', '2018-08-12 21:53:45'), ('73', '194', 'DVO', 'Davao Occidental', '', null, '', null, null, '1000016', '2018-08-12 21:54:16', '1', '1000016', '2018-08-12 21:54:16'), ('74', '194', 'DAO', 'Davao Oriental', '', null, '', null, null, '1000016', '2018-08-12 21:54:58', '1', '1000016', '2018-08-12 21:54:58'), ('75', '194', 'DIN', 'Dinagat Islands', '', null, '', null, null, '1000016', '2018-08-12 21:55:46', '1', '1000016', '2018-08-12 21:55:46'), ('76', '194', 'EAS', 'Eastern Samar', '', null, '', null, null, '1000016', '2018-08-12 21:56:28', '1', '1000016', '2018-08-12 21:56:28'), ('77', '194', 'GUI', 'Guimaras', '', null, '', null, null, '1000016', '2018-08-12 21:59:20', '1', '1000016', '2018-08-12 21:59:20'), ('78', '194', 'IFU', 'Ifugao', '', null, '', null, null, '1000016', '2018-08-12 21:59:54', '1', '1000016', '2018-08-12 21:59:54'), ('79', '194', 'ILN', 'Ilocos Norte', '', null, '', null, null, '1000016', '2018-08-12 22:00:44', '1', '1000016', '2018-08-12 22:00:44'), ('80', '194', 'ILS', 'Ilocos Sur', '', null, '', null, null, '1000016', '2018-08-12 22:01:33', '1', '1000016', '2018-08-12 22:01:33'), ('81', '194', 'ILI', 'Iloilo', '', null, '', null, null, '1000016', '2018-08-12 22:02:23', '1', '1000016', '2018-08-12 22:02:23'), ('82', '194', 'ISA', 'Isabela', '', null, '', null, null, '1000016', '2018-08-12 22:03:06', '1', '1000016', '2018-08-12 22:03:06'), ('83', '194', 'KAL', 'Kalinga', '', null, '', null, null, '1000016', '2018-08-12 22:03:39', '1', '1000016', '2018-08-12 22:03:39'), ('84', '194', 'LUN', 'La Union', '', null, '', null, null, '1000016', '2018-08-12 22:04:15', '1', '1000016', '2018-08-12 22:04:15'), ('85', '194', 'LAG', 'Laguna', '', null, '', null, null, '1000016', '2018-08-12 22:05:08', '1', '1000016', '2018-08-12 22:05:08'), ('86', '194', 'LAN', 'Lanao del Norte', '', null, '', null, null, '1000016', '2018-08-12 22:05:53', '1', '1000016', '2018-08-12 22:05:53'), ('87', '194', 'LAS', 'Lanao del Sur', '', null, '', null, null, '1000016', '2018-08-12 22:06:27', '1', '1000016', '2018-08-12 22:06:27'), ('88', '194', 'LEY', 'Leyte', '', null, '', null, null, '1000016', '2018-08-12 22:07:04', '1', '1000016', '2018-08-12 22:07:04'), ('89', '194', 'MAG', 'Maguindanao', '', null, '', null, null, '1000016', '2018-08-12 22:07:58', '1', '1000016', '2018-08-12 22:07:58'), ('90', '194', 'MAD', 'Marinduque', '', null, '', null, null, '1000016', '2018-08-12 22:08:32', '1', '1000016', '2018-08-12 22:08:32'), ('91', '194', 'MAS', 'Masbate', '', null, '', null, null, '1000016', '2018-08-12 22:09:00', '1', '1000016', '2018-08-12 22:09:00'), ('92', '194', 'MSC', 'Misamis Occidental', '', null, '', null, null, '1000016', '2018-08-12 22:09:42', '1', '1000016', '2018-08-12 22:09:42'), ('93', '194', 'MSR', 'Misamis Oriental', '', null, '', null, null, '1000016', '2018-08-12 22:14:50', '1', '1000016', '2018-08-12 22:14:50'), ('94', '194', 'MOU', 'Mountain', '', null, '', null, null, '1000016', '2018-08-12 22:16:01', '1', '1000016', '2018-08-12 22:16:01'), ('95', '194', 'NEC', 'Negros Occidental', '', null, '', null, null, '1000016', '2018-08-12 22:17:39', '1', '1000016', '2018-08-12 22:17:39'), ('96', '194', 'NER', 'Negros Oriental', '', null, '', null, null, '1000016', '2018-08-12 22:18:13', '1', '1000016', '2018-08-12 22:18:13'), ('97', '194', 'NSA', 'Northern Samar', '', null, '', null, null, '1000016', '2018-08-12 22:19:23', '1', '1000016', '2018-08-12 22:19:23'), ('98', '194', 'NUE', 'Nueva Ecija', '', null, '', null, null, '1000016', '2018-08-12 22:20:23', '1', '1000016', '2018-08-12 22:20:23'), ('99', '194', 'NUV', 'Nueva Vizcaya', '', null, '', null, null, '1000016', '2018-08-12 22:21:16', '1', '1000016', '2018-08-12 22:21:16'), ('100', '194', 'MDC', 'Occidental Mindoro', '', null, '', null, null, '1000016', '2018-08-12 22:22:01', '1', '1000016', '2018-08-12 22:22:01'), ('101', '194', 'MDR', 'Oriental Mindoro', '', null, '', null, null, '1000016', '2018-08-12 22:23:39', '1', '1000016', '2018-08-12 22:23:39'), ('102', '194', 'PLW', 'Palawan', '', null, '', null, null, '1000016', '2018-08-12 22:25:32', '1', '1000016', '2018-08-12 22:25:32'), ('103', '194', 'PAM', 'Pampanga', '', null, '', null, null, '1000016', '2018-08-12 22:26:25', '1', '1000016', '2018-08-12 22:26:25'), ('104', '194', 'PAN', 'Pangasinan', '', null, '', null, null, '1000016', '2018-08-12 22:27:01', '1', '1000016', '2018-08-12 22:27:01'), ('105', '194', 'QUE', 'Quezon', '', null, '', null, null, '1000016', '2018-08-12 22:27:42', '1', '1000016', '2018-08-12 22:27:42'), ('106', '194', 'QUI', 'Quirino', '', null, '', null, null, '1000016', '2018-08-12 22:28:46', '1', '1000016', '2018-08-12 22:28:46'), ('107', '194', 'RIZ', 'Rizal', '', null, '', null, null, '1000016', '2018-08-12 22:29:37', '1', '1000016', '2018-08-12 22:29:37'), ('108', '194', 'ROM', 'Romblon', '', null, '', null, null, '1000016', '2018-08-12 22:30:47', '1', '1000016', '2018-08-12 22:30:47'), ('109', '194', 'WSA', 'Samar', '', null, '', null, null, '1000016', '2018-08-12 22:31:45', '1', '1000016', '2018-08-12 22:31:45'), ('110', '194', 'SAR', 'Sarangani', '', null, '', null, null, '1000016', '2018-08-12 22:32:27', '1', '1000016', '2018-08-12 22:32:27'), ('111', '194', 'SIG', 'Siquijor', '', null, '', null, null, '1000016', '2018-08-12 22:33:18', '1', '1000016', '2018-08-12 22:33:18'), ('112', '194', 'SOR', 'Sorsogon', '', null, '', null, null, '1000016', '2018-08-12 22:42:49', '1', '1000016', '2018-08-12 22:42:49'), ('113', '194', 'SCO', 'South Cotabato', '', null, '', null, null, '1000016', '2018-08-12 22:43:31', '1', '1000016', '2018-08-12 22:43:31'), ('114', '194', 'SLE', 'Southern Leyte', '', null, '', null, null, '1000016', '2018-08-12 22:44:18', '1', '1000016', '2018-08-12 22:44:18'), ('115', '194', 'SUK', 'Sultan Kudarat', '', null, '', null, null, '1000016', '2018-08-12 22:44:48', '1', '1000016', '2018-08-12 22:44:48'), ('116', '194', 'SLU', 'Sulu', '', null, '', null, null, '1000016', '2018-08-12 22:45:25', '1', '1000016', '2018-08-12 22:45:25'), ('117', '194', 'SUN', 'Surigao del Norte', '', null, '', null, null, '1000016', '2018-08-12 22:46:00', '1', '1000016', '2018-08-12 22:46:00'), ('118', '194', 'SUR', 'Surigao del Sur', '', null, '', null, null, '1000016', '2018-08-12 22:46:33', '1', '1000016', '2018-08-12 22:46:33'), ('119', '194', 'TAR', 'Tarlac', '', null, '', null, null, '1000016', '2018-08-12 22:47:05', '1', '1000016', '2018-08-12 22:47:05'), ('120', '194', 'TAW', 'Tawi-Tawi', '', null, '', null, null, '1000016', '2018-08-12 22:47:44', '1', '1000016', '2018-08-12 22:47:44'), ('121', '194', 'ZMB', 'Zambales', '', null, '', null, null, '1000016', '2018-08-12 22:48:37', '1', '1000016', '2018-08-12 22:48:37'), ('122', '194', 'ZAN', 'Zamboanga del Norte', '', null, '', null, null, '1000016', '2018-08-12 22:49:23', '1', '1000016', '2018-08-12 22:49:23'), ('123', '194', 'ZAS', 'Zamboanga del Sur', '', null, '', null, null, '1000016', '2018-08-12 22:50:14', '1', '1000016', '2018-08-12 22:50:14'), ('124', '194', 'ZSI', 'Zamboanga Sibugay', '', null, '', null, null, '1000016', '2018-08-12 22:50:54', '1', '1000016', '2018-08-12 22:50:54'), ('125', '194', 'MNL', 'Manila', '', null, '', null, null, '1000016', '2018-08-12 22:53:44', '1', '1000016', '2018-08-12 22:53:44'), ('126', '153', 'KUL', 'Kuala Lumpur', '', null, '', null, null, '1000016', '2018-08-12 23:02:04', '1', '1000016', '2018-08-12 23:02:04'), ('127', '153', 'PEN', 'Penang', '', null, '', null, null, '1000016', '2018-08-12 23:03:11', '1', '1000016', '2018-08-12 23:03:11'), ('128', '153', 'MKZ', 'Melaka', '', null, '', null, null, '1000016', '2018-08-12 23:05:51', '1', '1000016', '2018-08-12 23:05:51'), ('129', '153', 'JHB', 'Johor Bahru', '', null, '', null, null, '1000016', '2018-08-12 23:15:02', '1', '1000016', '2018-08-12 23:15:02'), ('130', '153', 'LGK', 'Langkawi', '', null, '', null, null, '1000016', '2018-08-12 23:16:17', '1', '1000016', '2018-08-12 23:16:17'), ('131', '153', 'IPH', 'Ipoh', '', null, '', null, null, '1000016', '2018-08-12 23:19:38', '1', '1000016', '2018-08-12 23:19:38'), ('132', '153', 'KBR', 'Kota Bharu', '', null, '', null, null, '1000016', '2018-08-12 23:21:09', '1', '1000016', '2018-08-12 23:21:09'), ('133', '153', 'TGG', 'Kuala Terengganu', '', null, '', null, null, '1000016', '2018-08-12 23:21:56', '1', '1000016', '2018-08-12 23:21:56'), ('134', '153', 'KUA', 'Kuantan', '', null, '', null, null, '1000016', '2018-08-12 23:22:58', '1', '1000016', '2018-08-12 23:22:58'), ('135', '153', 'KCH', 'Kuching', '', null, '', null, null, '1000016', '2018-08-12 23:25:12', '1', '1000016', '2018-08-12 23:25:12'), ('136', '153', 'BKI', 'Kota Kinabalu', '', null, '', null, null, '1000016', '2018-08-12 23:28:59', '1', '1000016', '2018-08-12 23:28:59'), ('137', '153', 'SZB', 'Subang', '', null, '', null, null, '1000016', '2018-08-12 23:35:40', '1', '1000016', '2018-08-12 23:35:40'), ('138', '153', 'TWU', 'Tawau', '', null, '', null, null, '1000016', '2018-08-12 23:38:44', '1', '1000016', '2018-08-12 23:38:44'), ('139', '153', 'SDK', 'Sandakan', '', null, '', null, null, '1000016', '2018-08-12 23:39:39', '1', '1000016', '2018-08-12 23:39:39'), ('140', '121', 'BXW', 'Bawean', '', null, '', null, null, '1000016', '2018-08-13 00:01:57', '1', '1000016', '2018-08-13 00:01:57'), ('141', '121', 'BDO', 'Bandung', '', null, '', null, null, '1000016', '2018-08-13 00:02:36', '1', '1000016', '2018-08-13 00:02:36'), ('142', '121', 'BWX', 'Banyuwangi ', '', null, '', null, null, '1000016', '2018-08-13 00:03:22', '1', '1000016', '2018-08-13 00:03:22'), ('143', '121', 'TSY', 'Tasikmalaya', '', null, '', null, null, '1000016', '2018-08-13 00:03:55', '1', '1000016', '2018-08-13 00:03:55'), ('144', '121', 'CBN', 'Cirebon', '', null, '', null, null, '1000016', '2018-08-13 00:04:39', '1', '1000016', '2018-08-13 00:04:39'), ('145', '121', 'CXP', 'Cilacap', '', null, '', null, null, '1000016', '2018-08-13 00:05:06', '1', '1000016', '2018-08-13 00:05:06'), ('146', '121', 'CGK', 'Jakarta', '', null, '', null, null, '1000016', '2018-08-13 00:05:52', '1', '1000016', '2018-08-13 00:05:52'), ('147', '121', 'BTO', 'Tangerang', '', null, '', null, null, '1000016', '2018-08-13 00:09:22', '1', '1000016', '2018-08-13 00:09:22'), ('148', '121', 'KJT', 'Majalengka', '', null, '', null, null, '1000016', '2018-08-13 00:09:55', '1', '1000016', '2018-08-13 00:09:55'), ('149', '121', 'SRG', 'Semarang', '', null, '', null, null, '1000016', '2018-08-13 00:10:32', '1', '1000016', '2018-08-13 00:10:32'), ('150', '121', 'SUB', 'Surabaya', '', null, '', null, null, '1000016', '2018-08-13 00:11:04', '1', '1000016', '2018-08-13 00:11:04'), ('151', '121', 'SOC', 'Surakarta', '', null, '', null, null, '1000016', '2018-08-13 00:11:48', '1', '1000016', '2018-08-13 00:11:48'), ('152', '121', 'JOG', 'Yogyakarta', '', null, '', null, null, '1000016', '2018-08-13 00:12:49', '1', '1000016', '2018-08-13 00:12:49'), ('154', '121', 'TKG', 'Bandar Lampung', '', null, '', null, null, '1000016', '2018-08-13 00:15:20', '1', '1000016', '2018-08-13 00:15:20'), ('155', '121', 'BTH', 'Batam', '', null, '', null, null, '1000016', '2018-08-13 00:15:53', '1', '1000016', '2018-08-13 00:15:53'), ('156', '121', 'LSE', 'Batu Islands', '', null, '', null, null, '1000016', '2018-08-13 00:16:47', '1', '1000016', '2018-08-13 00:16:47'), ('157', '121', 'BKS', 'Bengkulu', '', null, '', null, null, '1000016', '2018-08-13 00:18:00', '1', '1000016', '2018-08-13 00:18:00'), ('158', '121', 'DUM', 'Dumai', '', null, '', null, null, '1000016', '2018-08-13 00:18:45', '1', '1000016', '2018-08-13 00:18:45'), ('159', '121', 'GNS', 'Gunung Sitoli', '', null, '', null, null, '1000016', '2018-08-13 00:19:23', '1', '1000016', '2018-08-13 00:19:23'), ('160', '121', 'DJB', 'Jambi City', '', null, '', null, null, '1000016', '2018-08-13 00:20:04', '1', '1000016', '2018-08-13 00:20:04'), ('161', '121', 'LLG', 'Lubuklinggau', '', null, '', null, null, '1000016', '2018-08-13 00:20:57', '1', '1000016', '2018-08-13 00:20:57'), ('162', '121', 'KNO ', 'Medan', '', null, '', null, null, '1000016', '2018-08-13 00:21:42', '1', '1000016', '2018-08-13 00:21:42'), ('163', '121', 'PDG', 'Padang', '', null, '', null, null, '1000016', '2018-08-13 00:22:27', '1', '1000016', '2018-08-13 00:22:27'), ('164', '121', 'PLM', 'Palembang', '', null, '', null, null, '1000016', '2018-08-13 00:23:15', '1', '1000016', '2018-08-13 00:23:15'), ('165', '121', 'PGK', 'Pangkal Pinang', '', null, '', null, null, '1000016', '2018-08-13 00:23:52', '1', '1000016', '2018-08-13 00:23:52'), ('166', '121', 'PKU', 'Pekanbaru', '', null, '', null, null, '1000016', '2018-08-13 00:24:36', '1', '1000016', '2018-08-13 00:24:36'), ('167', '121', 'NTX', 'Ranai', '', null, '', null, null, '1000016', '2018-08-13 00:25:16', '1', '1000016', '2018-08-13 00:25:16'), ('168', '121', 'FLZ', 'Sibolga', '', null, '', null, null, '1000016', '2018-08-13 00:25:43', '1', '1000016', '2018-08-13 00:25:43'), ('169', '121', 'DTB', 'Siborong-Borong', '', null, '', null, null, '1000016', '2018-08-13 00:28:09', '1', '1000016', '2018-08-13 00:28:09'), ('170', '121', 'SNX', 'Sinabang', '', null, '', null, null, '1000016', '2018-08-13 00:29:15', '1', '1000016', '2018-08-13 00:29:15'), ('171', '121', 'RKI', 'Sipora', '', null, '', null, null, '1000016', '2018-08-13 00:29:55', '1', '1000016', '2018-08-13 00:29:55'), ('172', '121', 'MEQ', 'Suka Makmue', '', null, '', null, null, '1000016', '2018-08-13 00:30:35', '1', '1000016', '2018-08-13 00:30:35'), ('173', '121', 'TXE', 'Takengon', '', null, '', null, null, '1000016', '2018-08-13 00:31:09', '1', '1000016', '2018-08-13 00:31:09'), ('174', '121', 'TJQ', 'Tanjung Pandan', '', null, '', null, null, '1000016', '2018-08-13 00:31:39', '1', '1000016', '2018-08-13 00:31:39'), ('175', '121', 'TNJ', 'Tanjung Pinang', '', null, '', null, null, '1000016', '2018-08-13 00:32:06', '1', '1000016', '2018-08-13 00:32:06'), ('176', '121', 'BPN', 'Balikpapan', '', null, '', null, null, '1000016', '2018-08-13 00:32:37', '1', '1000016', '2018-08-13 00:32:37'), ('177', '121', 'BDJ', 'Banjarmasin', '', null, '', null, null, '1000016', '2018-08-13 00:33:09', '1', '1000016', '2018-08-13 00:33:09'), ('178', '121', 'BEJ', 'Tanjung Redep', '', null, '', null, null, '1000016', '2018-08-13 00:34:20', '1', '1000016', '2018-08-13 00:34:20'), ('179', '121', 'BXT', 'Bontang', '', null, '', null, null, '1000016', '2018-08-13 00:34:59', '1', '1000016', '2018-08-13 00:34:59'), ('180', '121', 'DTD', 'Mahakam Ulu', '', null, '', null, null, '1000016', '2018-08-13 00:35:29', '1', '1000016', '2018-08-13 00:35:29'), ('181', '121', 'KTG', 'Ketapang', '', null, '', null, null, '1000016', '2018-08-13 00:35:55', '1', '1000016', '2018-08-13 00:35:55'), ('182', '121', 'LPU', 'Long Apung', '', null, '', null, null, '1000016', '2018-08-13 00:36:23', '1', '1000016', '2018-08-13 00:36:23'), ('183', '121', 'LBW', 'Long Bawan', '', null, '', null, null, '1000016', '2018-08-13 00:36:52', '1', '1000016', '2018-08-13 00:36:52'), ('184', '121', 'NNX', 'Nunukan', '', null, '', null, null, '1000016', '2018-08-13 00:37:21', '1', '1000016', '2018-08-13 00:37:21'), ('185', '121', 'PKY', 'Palangkaraya', '', null, '', null, null, '1000016', '2018-08-13 00:37:53', '1', '1000016', '2018-08-13 00:37:53'), ('186', '121', 'PKN', 'Pangkalanbun', '', null, '', null, null, '1000016', '2018-08-13 00:38:18', '1', '1000016', '2018-08-13 00:38:18'), ('187', '121', 'PNK', 'Pontianak', '', null, '', null, null, '1000016', '2018-08-13 00:38:43', '1', '1000016', '2018-08-13 00:38:43'), ('188', '121', 'PSU', 'Putussibau', '', null, '', null, null, '1000016', '2018-08-13 00:39:06', '1', '1000016', '2018-08-13 00:39:06'), ('189', '121', 'SRI', 'Samarinda', '', null, '', null, null, '1000016', '2018-08-13 00:39:45', '1', '1000016', '2018-08-13 00:39:44'), ('190', '121', 'TRK', 'Tarakan', '', null, '', null, null, '1000016', '2018-08-13 00:45:46', '1', '1000016', '2018-08-13 00:45:46'), ('191', '121', 'BUW', 'Bau-Bau', '', null, '', null, null, '1000016', '2018-08-13 00:47:02', '1', '1000016', '2018-08-13 00:47:02'), ('192', '121', 'GTO', 'Gorontalo', '', null, '', null, null, '1000016', '2018-08-13 00:47:30', '1', '1000016', '2018-08-13 00:47:30'), ('193', '121', 'KDI', 'Kendari', '', null, '', null, null, '1000016', '2018-08-13 00:48:02', '1', '1000016', '2018-08-13 00:48:02'), ('194', '121', 'UPG', 'Makassar', '', null, '', null, null, '1000016', '2018-08-13 00:48:31', '1', '1000016', '2018-08-13 00:48:31'), ('195', '121', 'MJU', 'Mamuju', '', null, '', null, null, '1000016', '2018-08-13 00:49:06', '1', '1000016', '2018-08-13 00:49:06'), ('196', '121', 'MDC', 'Manado', '', null, '', null, null, '1000016', '2018-08-13 00:49:45', '1', '1000016', '2018-08-13 00:49:45'), ('197', '58', 'YYJ', 'British Columbia', '', null, 'fRwR9oqvNsM', '38', '77', '1000017', '2018-08-13 13:22:58', '1', '1000017', '2018-08-13 12:46:10'), ('198', '258', 'VCA', 'Can Tho', '', null, '', '0', '0', '1000028', '2018-08-13 17:59:36', '1', '35', '2018-08-12 20:42:41'), ('199', '258', 'VCL', 'Chu Lai', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('200', '258', 'DLI', 'Da Lat', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('201', '258', 'DAD', 'Da Nang', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('202', '258', 'HPH', 'Hai Phong', '', null, '', '20.8648', '106.683', '1000028', '2018-08-13 18:11:12', '1', '35', '2018-08-12 20:42:41'), ('203', '258', 'HAN', 'Hanoi', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('204', '258', 'SGN', 'Ho Chi Minh City', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('205', '258', 'HUI', 'Hue', '', null, '', '0', '0', '1000028', '2018-08-13 17:59:54', '1', '35', '2018-08-12 20:42:41'), ('206', '258', 'CXR', 'Nha Trang', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('207', '258', 'PQC', 'Phu Quoc', '', null, '', '0', '0', '1000028', '2018-08-13 18:00:12', '1', '35', '2018-08-12 20:42:41'), ('208', '258', 'VII', 'Vinh', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('209', '258', 'BMV', 'Buon Ma Thuot', '', null, '', '0', '0', '1000028', '2018-08-13 18:00:29', '1', '35', '2018-08-12 20:42:41'), ('210', '258', 'CAH', 'Ca Mau', '', null, '', '0', '0', '1000028', '2018-08-13 18:01:17', '1', '35', '2018-08-12 20:42:41'), ('211', '258', 'VCS', 'Con Dao', '', null, '', '0', '0', '1000028', '2018-08-13 18:04:55', '1', '35', '2018-08-12 20:42:41'), ('212', '258', 'DIN', 'Dien Bien Phu', '', null, '', '0', '0', '1000028', '2018-08-13 18:04:33', '1', '35', '2018-08-12 20:42:41'), ('213', '258', 'VDH', 'Dong Hoi', '', null, '', '0', '0', '1000028', '2018-08-13 18:02:00', '1', '35', '2018-08-12 20:42:41'), ('214', '258', 'PXU', 'Pleiku', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('215', '258', 'UIH', 'Qui Nh?n', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('216', '258', 'VKG', 'Rach Gia', '', null, '', '0', '0', '1000028', '2018-08-13 18:04:17', '1', '35', '2018-08-12 20:42:41'), ('217', '258', 'SQH', 'S?n La', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('218', '258', 'TBB', 'Tuy Hoa', '', null, '', '0', '0', '1000028', '2018-08-13 18:02:19', '1', '35', '2018-08-12 20:42:41'), ('219', '258', 'VTG', 'Vung Tau', '', null, '', '0', '0', '1000028', '2018-08-13 18:05:56', '1', '35', '2018-08-12 20:42:41'), ('220', '258', 'THD', 'Thanh Hoa', '', null, '', '0', '0', '1000028', '2018-08-13 18:06:16', '1', '35', '2018-08-12 20:42:41'), ('224', '237', 'ACR', 'Amnat Charoen', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('225', '237', 'ATG', 'Ang Thong', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('226', '237', 'BKN', 'Bueng Kan', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('227', '237', 'BRM', 'Buriram', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('228', '237', 'CCO', 'Chachoengsao', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('229', '237', 'CNT', 'Chai Nat', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('230', '237', 'CPM', 'Chaiyaphum', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('231', '237', 'CTI', 'Chanthaburi', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('232', '237', 'CMI', 'Chiang Mai', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('233', '237', 'CRI', 'Chiang Rai', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('234', '237', 'CBI', 'Chonburi', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('235', '237', 'CPN', 'Chumphon', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('236', '237', 'KSN', 'Kalasin', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('237', '237', 'KPT', 'Kamphaeng Phet', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('238', '237', 'KRI', 'Kanchanaburi', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('239', '237', 'KKN', 'Khon Kaen', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('240', '237', 'KBI', 'Krabi', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('241', '237', 'LPG', 'Lampang', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('242', '237', 'LPN', 'Lamphun', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('243', '237', 'LEI', 'Loei', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('244', '237', 'LRI', 'Lopburi', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('245', '237', 'MSN', 'Mae Hong Son', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('246', '237', 'MKM', 'Maha Sarakham', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('247', '237', 'MDH', 'Mukdahan', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('248', '237', 'NYK', 'Nakhon Nayok', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('249', '237', 'NPT', 'Nakhon Pathom', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('250', '237', 'NPM', 'Nakhon Phanom', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('251', '237', 'NMA', 'Nakhon Ratchasima', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('252', '237', 'NSN', 'Nakhon Sawan', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('253', '237', 'NRT', 'Nakhon Si Thammarat', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('254', '237', 'NAN', 'Nan', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('255', '237', 'NWT', 'Narathiwat', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('256', '237', 'NBP', 'Nong Bua Lam Phu', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('257', '237', 'NKI', 'Nong Khai', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('258', '237', 'NBI', 'Nonthaburi', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('259', '237', 'PTE', 'Pathum Thani', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('260', '237', 'PTN', 'Pattani', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('261', '237', 'PNA', 'Phang Nga', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('262', '237', 'PLG', 'Phatthalung', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('263', '237', 'PYO', 'Phayao', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('264', '237', 'PNB', 'Phetchabun', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('265', '237', 'PBI', 'Phetchaburi', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('266', '237', 'PCT', 'Phichit', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('267', '237', 'PLK', 'Phitsanulok', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('268', '237', 'AYA', 'Phra Nakhon Si Ayutthaya', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('269', '237', 'PRE', 'Phrae', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('270', '237', 'PKT', 'Phuket', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('271', '237', 'PRI', 'Prachinburi', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('272', '237', 'PKN', 'Prachuap Khiri Khan', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('273', '237', 'RNG', 'Ranong', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('274', '237', 'RBR', 'Ratchaburi', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('275', '237', 'RYG', 'Rayong', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('276', '237', 'RET', 'Roi Et', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('277', '237', 'SKW', 'Sa Kaeo', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('278', '237', 'SNK', 'Sakon Nakhon', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('279', '237', 'SPK', 'Samut Prakan', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('280', '237', 'SKN', 'Samut Sakhon', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('281', '237', 'SKM', 'Samut Songkhram', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('282', '237', 'SRI', 'Saraburi', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('283', '237', 'STN', 'Satun', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('284', '237', 'SBR', 'Sing Buri', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('285', '237', 'SSK', 'Sisaket', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('286', '237', 'SKA', 'Songkhla', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('287', '237', 'STI', 'Sukhothai', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('288', '237', 'SPB', 'Suphan Buri', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('289', '237', 'SNI', 'Surat Thani', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('290', '237', 'SRN', 'Surin', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('291', '237', 'TAK', 'Tak', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('292', '237', 'TRG', 'Trang', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('293', '237', 'TRT', 'Trat', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('294', '237', 'UBN', 'Ubon Ratchathani', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('295', '237', 'UDN', 'Udon Thani', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('296', '237', 'UTI', 'Uthai Thani', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('297', '237', 'UTD', 'Uttaradit', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('298', '237', 'YLA', 'Yala', null, null, null, null, null, '35', '2018-08-12 20:42:41', '1', '35', '2018-08-12 20:42:41'), ('299', '237', 'YST', 'Yasothon', '', null, '', '0', '0', '35', '2018-08-13 16:09:26', '1', '35', '2018-08-13 16:09:26'), ('300', '140', 'AOU', 'Attopeu', '', null, '', '14.8209', '106.815', '1000028', '2018-08-13 17:46:47', '1', '1000028', '2018-08-13 17:22:19'), ('301', '140', 'HOE', 'Ban Hat Tai', '', null, '', '20.2578', '100.437', '1000028', '2018-08-13 17:45:55', '1', '1000028', '2018-08-13 17:24:14'), ('302', '140', 'KOG', 'Khong Island', '', null, '', '14.047', '105.833', '1000028', '2018-08-13 17:44:55', '1', '1000028', '2018-08-13 17:24:46'), ('303', '140', 'LXG', 'Luang Namtha', '', null, '', '20.95', '101.4', '1000028', '2018-08-13 17:43:27', '1', '1000028', '2018-08-13 17:26:28'), ('304', '140', 'LPQ', 'Luang Prabang', '', null, '', '19.8833', '102.133', '1000028', '2018-08-13 17:42:52', '1', '1000028', '2018-08-13 17:27:24'), ('305', '140', 'ODY', 'Muang Xay', '', null, '', '20.7', '101.817', '1000028', '2018-08-13 17:42:11', '1', '1000028', '2018-08-13 17:28:07'), ('306', '140', 'PKZ', 'Pakse', '', null, '', '15.1167', '105.783', '1000028', '2018-08-13 17:41:29', '1', '1000028', '2018-08-13 17:28:53'), ('307', '140', 'XKH', 'Phonsavan', '', null, '', '19.46', '103.18', '1000028', '2018-08-13 17:40:09', '1', '1000028', '2018-08-13 17:29:20'), ('308', '140', 'VNA', 'Saravane', '', null, '', '15.7167', '106.417', '1000028', '2018-08-13 17:31:17', '1', '1000028', '2018-08-13 17:30:05'), ('309', '140', 'NEU', 'Sam Neua', '', null, '', '20.4133', '104.048', '1000028', '2018-08-13 17:32:37', '1', '1000028', '2018-08-13 17:32:37'), ('310', '140', 'ZVK', 'Savannakhet', '', null, '', '16.55', '104.75', '1000028', '2018-08-13 17:33:47', '1', '1000028', '2018-08-13 17:33:47'), ('311', '140', 'ZBY', 'Sayaboury', '', null, '', '19.25', '101.75', '1000028', '2018-08-13 17:35:27', '1', '1000028', '2018-08-13 17:35:27'), ('312', '140', 'THK', 'Thakhek', '', null, '', '17.4032', '104.835', '1000028', '2018-08-13 17:37:05', '1', '1000028', '2018-08-13 17:37:05'), ('313', '140', 'VTE', 'Vientiane', '', null, '', '17.9667', '102.6', '1000028', '2018-08-13 17:39:00', '1', '1000028', '2018-08-13 17:39:00'), ('314', '140', 'PKB', 'Pak Beng', '', null, '', '19.8955', '101.132', '1000028', '2018-08-13 17:58:43', '1', '1000028', '2018-08-13 17:58:43'), ('315', '258', 'CDO', 'Cho Dok', '', null, '', '10.7', '105.117', '1000028', '2018-08-13 18:09:43', '1', '1000028', '2018-08-13 18:09:43'), ('316', '258', 'SAP', 'SA PA', '', null, '', '22.3402', '103.844', '1000028', '2018-08-13 18:13:05', '1', '1000028', '2018-08-13 18:13:05'), ('317', '171', 'MDL', 'Mandalay', '', null, '', '21.9574', '96.0891', '1000028', '2018-08-13 18:27:24', '1', '1000028', '2018-08-13 18:27:23'), ('318', '171', 'RGN', 'Yangon', '', null, '', '16.9072', '96.1331', '1000028', '2018-08-13 18:28:26', '1', '1000028', '2018-08-13 18:28:26'), ('319', '171', 'NYT', 'Naypyidaw', '', null, '', '19.6233', '96.2008', '1000028', '2018-08-13 18:30:13', '1', '1000028', '2018-08-13 18:30:13'), ('320', '171', 'BGO', 'Bago', '', null, '', '17.3011', '96.4281', '1000028', '2018-08-13 18:31:30', '1', '1000028', '2018-08-13 18:31:30'), ('321', '171', 'NYU', 'Bagan', '', null, '', '21.1786', '94.93', '1000028', '2018-08-13 18:32:33', '1', '1000028', '2018-08-13 18:32:33'), ('322', '171', 'HEH', 'Heho', '', null, '', '20.7469', '96.7919', '1000028', '2018-08-13 18:41:16', '1', '1000028', '2018-08-13 18:41:16'), ('323', '119', 'MAA', 'Chennai', '', null, '', '13.0833', '80.2667', '35', '2018-08-16 00:06:24', '1', '35', '2018-08-16 00:06:24'), ('324', '119', 'DEL', 'New Delhi', '', null, '', '28.61', '77.23', '35', '2018-08-16 00:08:06', '1', '35', '2018-08-16 00:08:06'), ('325', '119', 'BOM', 'Mumbai', '', null, '', '18.975', '72.8258', '35', '2018-08-16 00:09:27', '1', '35', '2018-08-16 00:09:27'), ('326', '119', 'CCU', 'Kolkata', '', null, '', '22.5667', '88.3667', '35', '2018-08-16 00:11:15', '1', '35', '2018-08-16 00:11:15'), ('327', '119', 'BLR', 'Bangalore', '', null, '', '12.9833', '77.5833', '35', '2018-08-16 00:17:43', '1', '35', '2018-08-16 00:17:43'), ('328', '119', 'HYD', 'Hyderabad', '', null, '', '17.37', '78.48', '35', '2018-08-16 00:19:02', '1', '35', '2018-08-16 00:19:02'), ('329', '119', 'AMD', 'Ahmedabad', '', null, '', '23.03', '72.58', '35', '2018-08-16 00:20:21', '1', '35', '2018-08-16 00:20:21'), ('330', '119', 'STV', 'Surat', '', null, '', '21.1702', '72.8311', '35', '2018-08-16 00:22:01', '1', '35', '2018-08-16 00:22:01'), ('331', '119', 'PNQ', 'Pune', '', null, '', '18.5203', '73.8567', '35', '2018-08-16 00:22:59', '1', '35', '2018-08-16 00:22:59'), ('332', '119', 'JAI', 'Jaipur', '', null, '', '26.9', '75.8', '35', '2018-08-16 00:24:14', '1', '35', '2018-08-16 00:24:13'), ('333', '119', 'LKO', 'Lucknow', '', null, '', '26.85', '80.95', '35', '2018-08-16 00:25:03', '1', '35', '2018-08-16 00:25:03'), ('334', '119', 'KNU', 'Kanpur', '', null, '', '26.4499', '80.3319', '35', '2018-08-16 00:26:55', '1', '35', '2018-08-16 00:26:55'), ('335', '119', 'NAG', 'Nagpur', '', null, '', '21.15', '79.09', '35', '2018-08-16 00:27:59', '1', '35', '2018-08-16 00:27:59'), ('336', '119', 'VTZ', 'Visakhapatnam', '', null, '', '17.7042', '83.2978', '35', '2018-08-16 00:29:06', '1', '35', '2018-08-16 00:29:06'), ('337', '119', 'IDR', 'Indore', '', null, '', '22.7167', '75.8472', '35', '2018-08-16 00:30:13', '1', '35', '2018-08-16 00:30:13'), ('338', '119', 'BHO', 'Bhopal', '', null, '', '23.25', '77.4167', '35', '2018-08-16 00:33:17', '1', '35', '2018-08-16 00:33:17'), ('339', '119', 'PAT', 'Patna', '', null, '', '25.6', '85.1', '35', '2018-08-16 00:34:12', '1', '35', '2018-08-16 00:34:12'), ('340', '119', 'BDQ', 'Vadodara', '', null, '', '22.3', '73.2', '35', '2018-08-16 00:35:21', '1', '35', '2018-08-16 00:35:21'), ('341', '119', 'LUH', 'Ludhiana', '', null, '', '30.91', '75.85', '35', '2018-08-16 00:37:16', '1', '35', '2018-08-16 00:37:16'), ('342', '119', 'CJB', 'Coimbatore', '', null, '', '11.0183', '76.9725', '35', '2018-08-16 00:38:18', '1', '35', '2018-08-16 00:38:18'), ('343', '119', 'AGR', 'Agra', '', null, '', '27.18', '78.02', '35', '2018-08-16 00:39:21', '1', '35', '2018-08-16 00:39:21'), ('344', '119', 'IXM', 'Madurai', '', null, '', '9.9', '78.1', '35', '2018-08-16 00:40:32', '1', '35', '2018-08-16 00:40:32'), ('345', '119', 'GOI', 'Goa', '', null, '', '15.5', '73.83', '35', '2018-08-16 00:47:39', '1', '35', '2018-08-16 00:47:39'), ('346', '119', 'IXC', 'Chandigarh', '', null, '', '30.75', '76.78', '35', '2018-08-16 00:48:50', '1', '35', '2018-08-16 00:48:50'), ('347', '119', 'GAY', 'Gaya', '', null, '', '24.75', '85.01', '35', '2018-08-16 00:49:53', '1', '35', '2018-08-16 00:49:53'), ('348', '119', 'GAU', 'Guwahati', '', null, '', '26.1833', '91.7333', '35', '2018-08-16 00:51:16', '1', '35', '2018-08-16 00:51:16'), ('349', '119', 'TIR', 'Tirupati', '', null, '', '13.65', '79.42', '35', '2018-08-16 00:52:31', '1', '35', '2018-08-16 00:52:31'), ('350', '119', 'VGA', 'Vijayawada', '', null, '', '16.5193', '80.6305', '35', '2018-08-16 00:53:58', '1', '35', '2018-08-16 00:53:58'), ('351', '119', 'KLH', 'Kolhapur', '', null, '', '16.6917', '74.2333', '1000029', '2018-08-17 21:05:49', '1', '1000029', '2018-08-17 21:05:49'), ('352', '33', '+61 2', 'Sydney ', '', null, '', null, null, '15', '2019-01-05 14:33:52', '1', '15', '2019-01-05 14:33:52'), ('353', '100', '+49', 'Munich (München)', '', null, '', null, null, '15', '2019-01-08 14:52:05', '1', '15', '2019-01-08 14:52:05'), ('354', '215', 'SIN', 'Singapore', '', null, '', '0', '0', '8', '2019-01-17 16:23:58', '1', '15', '2019-01-15 16:53:51'), ('355', '126', 'RO', 'Rovigo', '', null, '', '47.5172', '20.3906', '1', '2019-01-17 16:27:49', '1', '8', '2019-01-17 16:23:37'), ('356', '126', 'VRN', 'Verona', '', null, '', '45.3957', '10.8885', '8', '2019-01-17 16:28:51', '1', '8', '2019-01-17 16:28:51'), ('357', '126', 'BLQ', 'Bologna', '', null, '', '44.5354', '11.2887', '8', '2019-01-17 16:29:49', '1', '8', '2019-01-17 16:29:49'), ('358', '126', 'TSF', 'Treviso', '', null, '', '45.6484', '12.1944', '8', '2019-01-17 16:30:52', '1', '8', '2019-01-17 16:30:52'), ('359', '126', 'VCE', 'Venice', '', null, '', '45.5053', '12.3519', '8', '2019-01-17 16:32:00', '1', '8', '2019-01-17 16:32:00'), ('360', '126', 'ROM', 'Rome', '', null, '', '41.9', '12.5', '8', '2019-01-17 16:34:49', '1', '8', '2019-01-17 16:34:49'), ('361', '237', 'CNX', 'Chiang Mai', '', null, '', '18.7961', '98.9793', '1', '2019-01-28 15:37:39', '1', '1', '2019-01-28 15:36:49');
COMMIT;

-- ----------------------------
--  Table structure for `company_profile`
-- ----------------------------
DROP TABLE IF EXISTS `company_profile`;
CREATE TABLE `company_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) DEFAULT NULL,
  `names` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `description` text,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `quotation_term_and_condition` text,
  `updated_by` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `vattin` varchar(50) DEFAULT NULL,
  `bill_and_payment` text,
  `what_we_do` text,
  `mission` varchar(500) DEFAULT NULL,
  `vision` varchar(500) DEFAULT NULL,
  `credit_arrangment` text,
  `cancellation_agreement` text,
  `confidentiality` text,
  PRIMARY KEY (`id`,`names`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `company_profile`
-- ----------------------------
BEGIN;
INSERT INTO `company_profile` VALUES ('1', '8', 'eOcambo Technology', 'info@eocambo.com', '(+855) 69 955 179', 'www.eocambo.com', 'Street 13, Treang Village, Slor Kram Commune, Krong Siem Reap, Cambodia.', 'eOcambo Technology started in 2014  with a small team partnering with accommodation providers to help  them take control of their online digital marketing and booking management using cutting edge technologies through our Hotel Link Solutions products.\r\n\r\nWe have been expanding and developing rapidly especially over the past 2 years with more solutions available to accommodation providers including offering high quality custom designed websites that become a major driver for any businesses online presence.\r\n\r\nThere is now a very large number of Online Travel Agents (OTA) and other online accommodation third parties where hotels and guesthouses can gain bookings, along with the massive use of Social Media by potential guests eOcambo Technology provides our clients with advice and the tools to navigate through often confusing technologies and increase their bookings and revenue.\r\n\r\neOcambo Technology is based in Siem Reap and is now the leading provider of online digital solutions for all Cambodian accommodation providers and most importantly we have a local Khmer Support Team who are always available to offer advice and back up for our clients.\r\n\r\nOur Mission: Always create innovative solutions that meet our clients expectations.\r\n\r\nOur Vision: Be recognised as the technology company that fulfills the clients needs.', '2019-07-23 09:18:01', '1', '2019-09-18 14:26:14', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '1', '1', 'CAM-200341', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '<p>We have our own application development team who during this year have created a unique online management system for Travel agents and Tour companies to improve their operations and profitability. This exciting new technology solution will be launched in the second half of 2018 increasing the growth and reputation of eOcambo Technology as the leader in creating innovative solutions for the Cambodian Hospitality Industry.</p>\r\n', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n');
COMMIT;

-- ----------------------------
--  Table structure for `contract`
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` varchar(50) DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `id_bank` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `contract_value` decimal(10,2) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `id_contract_type` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `credit_arrangment` text,
  `cancellation_agreement` text,
  `confidentiality` text,
  `id_discount` int(11) DEFAULT NULL,
  `discount_value` decimal(10,2) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `id_tax` int(11) DEFAULT NULL,
  `is_tax` tinyint(1) DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `contract`
-- ----------------------------
BEGIN;
INSERT INTO `contract` VALUES ('1', 'None19090001', '1', '13', null, null, null, null, '2', null, null, null, null, '1', '2019-10-02 14:20:51', '1', '2019-09-18 14:33:33', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '1', '0.00', '0.00', '1', '0', '0.00', '22.00', '22.00');
COMMIT;

-- ----------------------------
--  Table structure for `contract_customer_contact`
-- ----------------------------
DROP TABLE IF EXISTS `contract_customer_contact`;
CREATE TABLE `contract_customer_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_contract` int(11) DEFAULT NULL,
  `id_customer_contact` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `contract_data`
-- ----------------------------
DROP TABLE IF EXISTS `contract_data`;
CREATE TABLE `contract_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_contract` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `qty` int(11) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `other_charge` decimal(10,2) DEFAULT NULL,
  `discount_type` int(11) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `contract_data`
-- ----------------------------
BEGIN;
INSERT INTO `contract_data` VALUES ('2', '1', '1', 'eO-BMS (Standard)', '2222', '1', '22.00', '0.00', '1', '0.00', '22.00');
COMMIT;

-- ----------------------------
--  Table structure for `contract_note`
-- ----------------------------
DROP TABLE IF EXISTS `contract_note`;
CREATE TABLE `contract_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(11) DEFAULT NULL,
  `id_contract` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `contract_type`
-- ----------------------------
DROP TABLE IF EXISTS `contract_type`;
CREATE TABLE `contract_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `contract_description` text,
  `credit_arrangment` text,
  `cancellation_agreement` text,
  `confidentiality` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `contract_type`
-- ----------------------------
BEGIN;
INSERT INTO `contract_type` VALUES ('2', 'Monthly paid contract', 'wwwwwww', '1', '2019-09-18 14:30:33', null, null, '1', null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_area` int(11) DEFAULT NULL,
  `names` varchar(250) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `description` text,
  `img` varchar(250) DEFAULT NULL,
  `video_link` varchar(50) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `names` (`names`) USING BTREE,
  KEY `id_area` (`id_area`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `country`
-- ----------------------------
BEGIN;
INSERT INTO `country` VALUES ('21', '1', 'Afghanistan', 'AF', '', null, 'JDrScVo7aBs', '0', '0', '38', '2018-08-12 17:24:29', '1', '35', '2018-08-12 16:19:01'), ('22', '2', 'Albania', 'AL', '', null, '', '0', '0', '38', '2018-08-12 17:25:50', '1', '35', '2018-08-12 16:19:01'), ('23', '3', 'Algeria', 'DZ', '', null, '', '0', '0', '38', '2018-08-12 17:50:07', '1', '35', '2018-08-12 16:19:01'), ('24', '6', 'American Samoa', 'DS', '', null, '', '0', '0', '38', '2018-08-12 18:31:58', '1', '35', '2018-08-12 16:19:01'), ('25', '2', 'Andorra', 'AD', '', null, '', '0', '0', '38', '2018-08-12 17:26:21', '1', '35', '2018-08-12 16:19:01'), ('26', '3', 'Angola', 'AO', '', null, '', '0', '0', '38', '2018-08-12 17:50:29', '1', '35', '2018-08-12 16:19:01'), ('27', '1', 'Anguilla', 'AI', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('28', '1', 'Antarctica', 'AQ', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('29', '4', 'Antigua and Barbuda', 'AG', '', null, '', '0', '0', '38', '2018-08-12 18:15:11', '1', '35', '2018-08-12 16:19:01'), ('30', '5', 'Argentina', 'AR', '', null, '', '0', '0', '38', '2018-08-12 18:24:31', '1', '35', '2018-08-12 16:19:01'), ('31', '2', 'Armenia', 'AM', '', null, '', '0', '0', '38', '2018-08-12 17:26:40', '1', '35', '2018-08-12 16:19:01'), ('32', '1', 'Aruba', 'AW', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('33', '6', 'Australia', 'AU', '', null, '', '0', '0', '38', '2018-08-12 18:28:59', '1', '35', '2018-08-12 16:19:01'), ('34', '2', 'Austria', 'AT', '', null, '', '0', '0', '38', '2018-08-12 17:27:02', '1', '35', '2018-08-12 16:19:01'), ('35', '2', 'Azerbaijan', 'AZ', '', null, '', '0', '0', '38', '2018-08-12 17:27:31', '1', '35', '2018-08-12 16:19:01'), ('36', '4', 'Bahamas', 'BS', '', null, '', '0', '0', '38', '2018-08-12 18:15:50', '1', '35', '2018-08-12 16:19:01'), ('37', '1', 'Bahrain', 'BH', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('38', '1', 'Bangladesh', 'BD', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('39', '4', 'Barbados', 'BB', '', null, '', '0', '0', '38', '2018-08-12 18:16:08', '1', '35', '2018-08-12 16:19:01'), ('40', '2', 'Belarus', 'BY', '', null, '', '0', '0', '38', '2018-08-12 17:27:57', '1', '35', '2018-08-12 16:19:01'), ('41', '2', 'Belgium', 'BE', '', null, '', '0', '0', '38', '2018-08-12 17:28:16', '1', '35', '2018-08-12 16:19:01'), ('42', '4', 'Belize', 'BZ', '', null, '', '0', '0', '38', '2018-08-12 18:16:28', '1', '35', '2018-08-12 16:19:01'), ('43', '3', 'Benin', 'BJ', '', null, '', '0', '0', '38', '2018-08-12 17:51:11', '1', '35', '2018-08-12 16:19:01'), ('44', '1', 'Bermuda', 'BM', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('45', '1', 'Bhutan', 'BT', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('46', '5', 'Bolivia', 'BO', '', null, '', '0', '0', '38', '2018-08-12 18:24:54', '1', '35', '2018-08-12 16:19:01'), ('47', '2', 'Bosnia and Herzegovina', 'BA', '', null, '', '0', '0', '38', '2018-08-12 17:28:36', '1', '35', '2018-08-12 16:19:01'), ('48', '3', 'Botswana', 'BW', '', null, '', '0', '0', '38', '2018-08-12 17:51:30', '1', '35', '2018-08-12 16:19:01'), ('49', '1', 'Bouvet Island', 'BV', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('50', '5', 'Brazil', 'BR', '', null, '', '0', '0', '38', '2018-08-12 18:25:16', '1', '35', '2018-08-12 16:19:01'), ('51', '1', 'British Indian Ocean Territory', 'IO', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('52', '1', 'Brunei Darussalam', 'BN', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('53', '2', 'Bulgaria', 'BG', '', null, '', '0', '0', '38', '2018-08-12 17:29:23', '1', '35', '2018-08-12 16:19:01'), ('54', '3', 'Burkina Faso', 'BF', '', null, '', '0', '0', '38', '2018-08-12 17:52:12', '1', '35', '2018-08-12 16:19:01'), ('55', '3', 'Burundi', 'BI', '', null, '', '0', '0', '38', '2018-08-12 17:52:41', '1', '35', '2018-08-12 16:19:01'), ('56', '1', 'Cambodia', 'KH', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('57', '3', 'Cameroon', 'CM', '', null, '', '0', '0', '38', '2018-08-12 17:53:29', '1', '35', '2018-08-12 16:19:01'), ('58', '4', 'Canada', 'CA', '', null, '', '0', '0', '38', '2018-08-12 18:16:47', '1', '35', '2018-08-12 16:19:01'), ('59', '1', 'Cape Verde', 'CV', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('60', '1', 'Cayman Islands', 'KY', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('61', '3', 'Central African Republic', 'CF', '', null, '', '0', '0', '38', '2018-08-12 17:53:58', '1', '35', '2018-08-12 16:19:01'), ('62', '3', 'Chad', 'TD', '', null, '', '0', '0', '38', '2018-08-12 17:54:18', '1', '35', '2018-08-12 16:19:01'), ('63', '5', 'Chile', 'CL', '', null, '', '0', '0', '38', '2018-08-12 18:25:32', '1', '35', '2018-08-12 16:19:01'), ('64', '1', 'China', 'CN', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('65', '1', 'Christmas Island', 'CX', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('66', '1', 'Cocos (Keeling) Islands', 'CC', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('67', '5', 'Colombia', 'CO', '', null, '', '0', '0', '38', '2018-08-12 18:26:01', '1', '35', '2018-08-12 16:19:01'), ('68', '3', 'Comoros', 'KM', '', null, '', '0', '0', '38', '2018-08-12 17:54:40', '1', '35', '2018-08-12 16:19:01'), ('69', '3', 'Congo', 'CG', '', null, '', '0', '0', '38', '2018-08-12 17:55:49', '1', '35', '2018-08-12 16:19:01'), ('70', '1', 'Cook Islands', 'CK', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('71', '4', 'Costa Rica', 'CR', '', null, '', '0', '0', '38', '2018-08-12 18:17:05', '1', '35', '2018-08-12 16:19:01'), ('72', '2', 'Croatia (Hrvatska)', 'HR', '', null, '', '0', '0', '38', '2018-08-12 17:29:47', '1', '35', '2018-08-12 16:19:01'), ('73', '4', 'Cuba', 'CU', '', null, '', '0', '0', '38', '2018-08-12 18:17:23', '1', '35', '2018-08-12 16:19:01'), ('74', '2', 'Cyprus', 'CY', '', null, '', '0', '0', '38', '2018-08-12 17:30:07', '1', '35', '2018-08-12 16:19:01'), ('75', '2', 'Czech Republic', 'CZ', '', null, '', '0', '0', '38', '2018-08-12 17:30:29', '1', '35', '2018-08-12 16:19:01'), ('76', '2', 'Denmark', 'DK', '', null, '', '0', '0', '38', '2018-08-12 17:30:49', '1', '35', '2018-08-12 16:19:01'), ('77', '3', 'Djibouti', 'DJ', '', null, '', '0', '0', '38', '2018-08-12 17:56:46', '1', '35', '2018-08-12 16:19:01'), ('78', '4', 'Dominica', 'DM', '', null, '', '0', '0', '38', '2018-08-12 18:17:44', '1', '35', '2018-08-12 16:19:01'), ('79', '4', 'Dominican Republic', 'DO', '', null, '', '0', '0', '38', '2018-08-12 18:17:55', '1', '35', '2018-08-12 16:19:01'), ('80', '1', 'East Timor', 'TP', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('81', '5', 'Ecuador', 'EC', '', null, '', '0', '0', '38', '2018-08-12 18:26:22', '1', '35', '2018-08-12 16:19:01'), ('82', '3', 'Egypt', 'EG', '', null, '', '0', '0', '38', '2018-08-12 17:57:20', '1', '35', '2018-08-12 16:19:01'), ('83', '4', 'El Salvador', 'SV', '', null, '', '0', '0', '38', '2018-08-12 18:18:19', '1', '35', '2018-08-12 16:19:01'), ('84', '3', 'Equatorial Guinea', 'GQ', '', null, '', '0', '0', '38', '2018-08-12 17:57:47', '1', '35', '2018-08-12 16:19:01'), ('85', '3', 'Eritrea', 'ER', '', null, '', '0', '0', '38', '2018-08-12 17:58:09', '1', '35', '2018-08-12 16:19:01'), ('86', '2', 'Estonia', 'EE', '', null, '', '0', '0', '38', '2018-08-12 17:31:22', '1', '35', '2018-08-12 16:19:01'), ('87', '3', 'Ethiopia', 'ET', '', null, '', '0', '0', '38', '2018-08-12 17:58:53', '1', '35', '2018-08-12 16:19:01'), ('88', '1', 'Falkland Islands (Malvinas)', 'FK', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('89', '1', 'Faroe Islands', 'FO', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('90', '6', 'Fiji', 'FJ', '', null, '', '0', '0', '38', '2018-08-12 18:29:19', '1', '35', '2018-08-12 16:19:01'), ('91', '2', 'Finland', 'FI', '', null, '', '0', '0', '38', '2018-08-12 17:31:43', '1', '35', '2018-08-12 16:19:01'), ('92', '2', 'France', 'FR', '', null, '', '0', '0', '38', '2018-08-12 17:32:09', '1', '35', '2018-08-12 16:19:01'), ('93', '2', 'France, Metropolitan', 'FX', '', null, '', '0', '0', '38', '2018-08-12 17:32:21', '1', '35', '2018-08-12 16:19:01'), ('94', '1', 'French Guiana', 'GF', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('95', '1', 'French Polynesia', 'PF', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('96', '1', 'French Southern Territories', 'TF', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('97', '3', 'Gabon', 'GA', '', null, '', '0', '0', '38', '2018-08-12 17:59:35', '1', '35', '2018-08-12 16:19:01'), ('98', '3', 'Gambia', 'GM', '', null, '', '0', '0', '38', '2018-08-12 17:59:52', '1', '35', '2018-08-12 16:19:01'), ('99', '2', 'Georgia', 'GE', '', null, '', '0', '0', '38', '2018-08-12 17:32:51', '1', '35', '2018-08-12 16:19:01'), ('100', '2', 'Germany', 'DE', '', null, '', '0', '0', '38', '2018-08-12 17:33:33', '1', '35', '2018-08-12 16:19:01'), ('101', '3', 'Ghana', 'GH', '', null, '', '0', '0', '38', '2018-08-12 18:00:11', '1', '35', '2018-08-12 16:19:01'), ('102', '1', 'Gibraltar', 'GI', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('103', '1', 'Guernsey', 'GK', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('104', '2', 'Greece', 'GR', '', null, '', '0', '0', '38', '2018-08-12 17:34:02', '1', '35', '2018-08-12 16:19:01'), ('105', '1', 'Greenland', 'GL', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('106', '4', 'Grenada', 'GD', '', null, '', '0', '0', '38', '2018-08-12 18:18:42', '1', '35', '2018-08-12 16:19:01'), ('107', '1', 'Guadeloupe', 'GP', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('108', '1', 'Guam', 'GU', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('109', '4', 'Guatemala', 'GT', '', null, '', '0', '0', '38', '2018-08-12 18:19:05', '1', '35', '2018-08-12 16:19:01'), ('110', '3', 'Guinea', 'GN', '', null, '', '0', '0', '38', '2018-08-12 18:00:42', '1', '35', '2018-08-12 16:19:01'), ('111', '3', 'Guinea-Bissau', 'GW', '', null, '', '0', '0', '38', '2018-08-12 18:00:55', '1', '35', '2018-08-12 16:19:01'), ('112', '5', 'Guyana', 'GY', '', null, '', '0', '0', '38', '2018-08-12 18:26:41', '1', '35', '2018-08-12 16:19:01'), ('113', '4', 'Haiti', 'HT', '', null, '', '0', '0', '38', '2018-08-12 18:19:22', '1', '35', '2018-08-12 16:19:01'), ('114', '1', 'Heard and Mc Donald Islands', 'HM', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('115', '4', 'Honduras', 'HN', '', null, '', '0', '0', '38', '2018-08-12 18:19:39', '1', '35', '2018-08-12 16:19:01'), ('116', '1', 'Hong Kong', 'HK', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('117', '2', 'Hungary', 'HU', '', null, '', '0', '0', '38', '2018-08-12 17:34:27', '1', '35', '2018-08-12 16:19:01'), ('118', '2', 'Iceland', 'IS', '', null, '', '0', '0', '38', '2018-08-12 17:34:46', '1', '35', '2018-08-12 16:19:01'), ('119', '1', 'India', 'IN', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('120', '1', 'Isle of Man', 'IM', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('121', '1', 'Indonesia', 'ID', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('122', '1', 'Iran (Islamic Republic of)', 'IR', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('123', '1', 'Iraq', 'IQ', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('124', '2', 'Ireland', 'IE', '', null, '', '0', '0', '38', '2018-08-12 17:35:09', '1', '35', '2018-08-12 16:19:01'), ('125', '1', 'Israel', 'IL', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('126', '2', 'Italy', 'IT', '', null, '', '0', '0', '38', '2018-08-12 17:35:37', '1', '35', '2018-08-12 16:19:01'), ('127', '1', 'Ivory Coast', 'CI', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('128', '1', 'Jersey', 'JE', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('129', '4', 'Jamaica', 'JM', '', null, '', '0', '0', '38', '2018-08-12 18:20:09', '1', '35', '2018-08-12 16:19:01'), ('130', '1', 'Japan', 'JP', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('131', '1', 'Jordan', 'JO', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('132', '2', 'Kazakhstan', 'KZ', '', null, '', '0', '0', '38', '2018-08-12 17:36:08', '1', '35', '2018-08-12 16:19:01'), ('133', '3', 'Kenya', 'KE', '', null, '', '0', '0', '38', '2018-08-12 18:01:30', '1', '35', '2018-08-12 16:19:01'), ('134', '6', 'Kiribati', 'KI', '', null, '', '0', '0', '38', '2018-08-12 18:29:36', '1', '35', '2018-08-12 16:19:01'), ('135', '1', 'Korea, Democratic People\'s Republic of', 'KP', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('136', '1', 'Korea, Republic of', 'KR', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('137', '2', 'Kosovo', 'XK', '', null, '', '0', '0', '38', '2018-08-12 17:36:29', '1', '35', '2018-08-12 16:19:01'), ('138', '1', 'Kuwait', 'KW', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('139', '1', 'Kyrgyzstan', 'KG', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('140', '1', 'Laos', 'LA', '', null, '', '0', '0', '1000028', '2018-08-13 17:23:16', '1', '35', '2018-08-12 16:19:01'), ('141', '2', 'Latvia', 'LV', '', null, '', '0', '0', '38', '2018-08-12 17:36:53', '1', '35', '2018-08-12 16:19:01'), ('142', '1', 'Lebanon', 'LB', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('143', '3', 'Lesotho', 'LS', '', null, '', '0', '0', '38', '2018-08-12 18:01:49', '1', '35', '2018-08-12 16:19:01'), ('144', '3', 'Liberia', 'LR', '', null, '', '0', '0', '38', '2018-08-12 18:02:07', '1', '35', '2018-08-12 16:19:01'), ('145', '3', 'Libyan Arab Jamahiriya', 'LY', '', null, '', '0', '0', '38', '2018-08-12 18:02:25', '1', '35', '2018-08-12 16:19:01'), ('146', '2', 'Liechtenstein', 'LI', '', null, '', '0', '0', '38', '2018-08-12 17:37:12', '1', '35', '2018-08-12 16:19:01'), ('147', '2', 'Lithuania', 'LT', '', null, '', '0', '0', '38', '2018-08-12 17:38:01', '1', '35', '2018-08-12 16:19:01'), ('148', '2', 'Luxembourg', 'LU', '', null, '', '0', '0', '38', '2018-08-12 17:38:42', '1', '35', '2018-08-12 16:19:01'), ('149', '1', 'Macau', 'MO', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('150', '2', 'Macedonia', 'MK', '', null, '', '0', '0', '38', '2018-08-12 17:39:10', '1', '35', '2018-08-12 16:19:01'), ('151', '3', 'Madagascar', 'MG', '', null, '', '0', '0', '38', '2018-08-12 18:02:42', '1', '35', '2018-08-12 16:19:01'), ('152', '3', 'Malawi', 'MW', '', null, '', '0', '0', '38', '2018-08-12 18:03:01', '1', '35', '2018-08-12 16:19:01'), ('153', '1', 'Malaysia', 'MY', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('154', '1', 'Maldives', 'MV', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('155', '3', 'Mali', 'ML', '', null, '', '0', '0', '38', '2018-08-12 18:03:19', '1', '35', '2018-08-12 16:19:01'), ('156', '2', 'Malta', 'MT', '', null, '', '0', '0', '38', '2018-08-12 17:39:34', '1', '35', '2018-08-12 16:19:01'), ('157', '6', 'Marshall Islands', 'MH', '', null, '', '0', '0', '38', '2018-08-12 18:29:55', '1', '35', '2018-08-12 16:19:01'), ('158', '1', 'Martinique', 'MQ', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('159', '3', 'Mauritania', 'MR', '', null, '', '0', '0', '38', '2018-08-12 18:03:55', '1', '35', '2018-08-12 16:19:01'), ('160', '3', 'Mauritius', 'MU', '', null, '', '0', '0', '38', '2018-08-12 18:04:17', '1', '35', '2018-08-12 16:19:01'), ('161', '1', 'Mayotte', 'TY', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('162', '4', 'Mexico', 'MX', '', null, '', '0', '0', '38', '2018-08-12 18:20:31', '1', '35', '2018-08-12 16:19:01'), ('163', '6', 'Micronesia, Federated States of', 'FM', '', null, '', '0', '0', '38', '2018-08-12 18:30:13', '1', '35', '2018-08-12 16:19:01'), ('164', '2', 'Moldova, Republic of', 'MD', '', null, '', '0', '0', '38', '2018-08-12 17:39:57', '1', '35', '2018-08-12 16:19:01'), ('165', '2', 'Monaco', 'MC', '', null, '', '0', '0', '38', '2018-08-12 17:40:15', '1', '35', '2018-08-12 16:19:01'), ('166', '1', 'Mongolia', 'MN', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('167', '2', 'Montenegro', 'ME', '', null, '', '0', '0', '38', '2018-08-12 17:40:35', '1', '35', '2018-08-12 16:19:01'), ('168', '1', 'Montserrat', 'MS', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('169', '3', 'Morocco', 'MA', '', null, '', '0', '0', '38', '2018-08-12 18:04:37', '1', '35', '2018-08-12 16:19:01'), ('170', '3', 'Mozambique', 'MZ', '', null, '', '0', '0', '38', '2018-08-12 18:04:55', '1', '35', '2018-08-12 16:19:01'), ('171', '1', 'Myanmar', 'MM', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('172', '3', 'Namibia', 'NA', '', null, '', '0', '0', '38', '2018-08-12 18:05:12', '1', '35', '2018-08-12 16:19:01'), ('173', '6', 'Nauru', 'NR', '', null, '', '0', '0', '38', '2018-08-12 18:30:32', '1', '35', '2018-08-12 16:19:01'), ('174', '1', 'Nepal', 'NP', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('175', '2', 'Netherlands', 'NL', '', null, '', '0', '0', '38', '2018-08-12 17:41:05', '1', '35', '2018-08-12 16:19:01'), ('176', '2', 'Netherlands Antilles', 'AN', '', null, '', '0', '0', '38', '2018-08-12 17:41:17', '1', '35', '2018-08-12 16:19:01'), ('177', '1', 'New Caledonia', 'NC', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('178', '6', 'New Zealand', 'NZ', '', null, '', '0', '0', '38', '2018-08-12 18:30:52', '1', '35', '2018-08-12 16:19:01'), ('179', '4', 'Nicaragua', 'NI', '', null, '', '0', '0', '38', '2018-08-12 18:20:50', '1', '35', '2018-08-12 16:19:01'), ('180', '3', 'Niger', 'NE', '', null, '', '0', '0', '38', '2018-08-12 18:05:30', '1', '35', '2018-08-12 16:19:01'), ('181', '3', 'Nigeria', 'NG', '', null, '', '0', '0', '38', '2018-08-12 18:05:42', '1', '35', '2018-08-12 16:19:01'), ('182', '1', 'Niue', 'NU', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('183', '1', 'Norfolk Island', 'NF', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('184', '1', 'Northern Mariana Islands', 'MP', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('185', '2', 'Norway', 'NO', '', null, '', '0', '0', '38', '2018-08-12 17:41:50', '1', '35', '2018-08-12 16:19:01'), ('186', '1', 'Oman', 'OM', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('187', '1', 'Pakistan', 'PK', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('188', '6', 'Palau', 'PW', '', null, '', '0', '0', '38', '2018-08-12 18:31:14', '1', '35', '2018-08-12 16:19:01'), ('189', '1', 'Palestine', 'PS', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('190', '4', 'Panama', 'PA', '', null, '', '0', '0', '38', '2018-08-12 18:21:18', '1', '35', '2018-08-12 16:19:01'), ('191', '6', 'Papua New Guinea', 'PG', '', null, '', '0', '0', '38', '2018-08-12 18:31:39', '1', '35', '2018-08-12 16:19:01'), ('192', '5', 'Paraguay', 'PY', '', null, '', '0', '0', '38', '2018-08-12 18:27:08', '1', '35', '2018-08-12 16:19:01'), ('193', '5', 'Peru', 'PE', '', null, '', '0', '0', '38', '2018-08-12 18:27:27', '1', '35', '2018-08-12 16:19:01'), ('194', '1', 'Philippines', 'PH', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('195', '1', 'Pitcairn', 'PN', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('196', '2', 'Poland', 'PL', '', null, '', '0', '0', '38', '2018-08-12 17:42:25', '1', '35', '2018-08-12 16:19:01'), ('197', '2', 'Portugal', 'PT', '', null, '', '0', '0', '38', '2018-08-12 17:42:43', '1', '35', '2018-08-12 16:19:01'), ('198', '1', 'Puerto Rico', 'PR', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('199', '1', 'Qatar', 'QA', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('200', '1', 'Reunion', 'RE', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('201', '2', 'Romania', 'RO', '', null, '', '0', '0', '38', '2018-08-12 17:43:03', '1', '35', '2018-08-12 16:19:01'), ('202', '2', 'Russian Federation', 'RU', '', null, '', '0', '0', '38', '2018-08-12 17:43:22', '1', '35', '2018-08-12 16:19:01'), ('203', '3', 'Rwanda', 'RW', '', null, '', '0', '0', '38', '2018-08-12 18:06:21', '1', '35', '2018-08-12 16:19:01'), ('204', '4', 'Saint Kitts and Nevis', 'KN', '', null, '', '0', '0', '38', '2018-08-12 18:21:42', '1', '35', '2018-08-12 16:19:01'), ('205', '4', 'Saint Lucia', 'LC', '', null, '', '0', '0', '38', '2018-08-12 18:21:59', '1', '35', '2018-08-12 16:19:01'), ('206', '4', 'Saint Vincent and the Grenadines', 'VC', '', null, '', '0', '0', '38', '2018-08-12 18:22:23', '1', '35', '2018-08-12 16:19:01'), ('207', '6', 'Samoa', 'WS', '', null, '', '0', '0', '38', '2018-08-12 18:32:16', '1', '35', '2018-08-12 16:19:01'), ('208', '2', 'San Marino', 'SM', '', null, '', '0', '0', '38', '2018-08-12 17:43:50', '1', '35', '2018-08-12 16:19:01'), ('209', '3', 'Sao Tome and Principe', 'ST', '', null, '', '0', '0', '38', '2018-08-12 18:06:40', '1', '35', '2018-08-12 16:19:01'), ('210', '1', 'Saudi Arabia', 'SA', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('211', '3', 'Senegal', 'SN', '', null, '', '0', '0', '38', '2018-08-12 18:07:01', '1', '35', '2018-08-12 16:19:01'), ('212', '2', 'Serbia', 'RS', '', null, '', '0', '0', '38', '2018-08-12 17:44:37', '1', '35', '2018-08-12 16:19:01'), ('213', '3', 'Seychelles', 'SC', '', null, '', '0', '0', '38', '2018-08-12 18:07:29', '1', '35', '2018-08-12 16:19:01'), ('214', '3', 'Sierra Leone', 'SL', '', null, '', '0', '0', '38', '2018-08-12 18:07:48', '1', '35', '2018-08-12 16:19:01'), ('215', '1', 'Singapore', 'SG', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('216', '2', 'Slovakia', 'SK', '', null, '', '0', '0', '38', '2018-08-12 17:45:20', '1', '35', '2018-08-12 16:19:01'), ('217', '2', 'Slovenia', 'SI', '', null, '', '0', '0', '38', '2018-08-12 17:46:01', '1', '35', '2018-08-12 16:19:01'), ('218', '6', 'Solomon Islands', 'SB', '', null, '', '0', '0', '38', '2018-08-12 18:32:37', '1', '35', '2018-08-12 16:19:01'), ('219', '3', 'Somalia', 'SO', '', null, '', '0', '0', '38', '2018-08-12 18:03:40', '1', '35', '2018-08-12 16:19:01'), ('220', '3', 'South Africa', 'ZA', '', null, '', '0', '0', '38', '2018-08-12 18:08:30', '1', '35', '2018-08-12 16:19:01'), ('221', '2', 'South Georgia South Sandwich Islands', 'GS', '', null, '', '0', '0', '38', '2018-08-12 17:33:10', '1', '35', '2018-08-12 16:19:01'), ('222', '3', 'South Sudan', 'SS', '', null, '', '0', '0', '38', '2018-08-12 18:11:16', '1', '35', '2018-08-12 16:19:01'), ('223', '2', 'Spain', 'ES', '', null, '', '0', '0', '38', '2018-08-12 17:46:15', '1', '35', '2018-08-12 16:19:01'), ('224', '1', 'Sri Lanka', 'LK', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('225', '1', 'St. Helena', 'SH', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('226', '1', 'St. Pierre and Miquelon', 'PM', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('227', '3', 'Sudan', 'SD', '', null, '', '0', '0', '38', '2018-08-12 18:11:35', '1', '35', '2018-08-12 16:19:01'), ('228', '5', 'Suriname', 'SR', '', null, '', '0', '0', '38', '2018-08-12 18:27:46', '1', '35', '2018-08-12 16:19:01'), ('229', '1', 'Svalbard and Jan Mayen Islands', 'SJ', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('230', '1', 'Swaziland', 'SZ', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('231', '2', 'Sweden', 'SE', '', null, '', '0', '0', '38', '2018-08-12 17:46:34', '1', '35', '2018-08-12 16:19:01'), ('232', '2', 'Switzerland', 'CH', '', null, '', '0', '0', '38', '2018-08-12 17:46:58', '1', '35', '2018-08-12 16:19:01'), ('233', '1', 'Syrian Arab Republic', 'SY', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('234', '1', 'Taiwan', 'TW', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('235', '1', 'Tajikistan', 'TJ', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('236', '3', 'Tanzania, United Republic of', 'TZ', '', null, '', '0', '0', '38', '2018-08-12 18:12:48', '1', '35', '2018-08-12 16:19:01'), ('237', '1', 'Thailand', 'TH', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('238', '3', 'Togo', 'TG', '', null, '', '0', '0', '38', '2018-08-12 18:13:10', '1', '35', '2018-08-12 16:19:01'), ('239', '1', 'Tokelau', 'TK', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('240', '6', 'Tonga', 'TO', '', null, '', '0', '0', '38', '2018-08-12 18:33:08', '1', '35', '2018-08-12 16:19:01'), ('241', '4', 'Trinidad and Tobago', 'TT', '', null, '', '0', '0', '38', '2018-08-12 18:22:43', '1', '35', '2018-08-12 16:19:01'), ('242', '3', 'Tunisia', 'TN', '', null, '', '0', '0', '38', '2018-08-12 18:13:30', '1', '35', '2018-08-12 16:19:01'), ('243', '2', 'Turkey', 'TR', '', null, '', '0', '0', '38', '2018-08-12 17:47:55', '1', '35', '2018-08-12 16:19:01'), ('244', '1', 'Turkmenistan', 'TM', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('245', '1', 'Turks and Caicos Islands', 'TC', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('246', '6', 'Tuvalu', 'TV', '', null, '', '0', '0', '38', '2018-08-12 18:33:29', '1', '35', '2018-08-12 16:19:01'), ('247', '3', 'Uganda', 'UG', '', null, '', '0', '0', '38', '2018-08-12 18:13:49', '1', '35', '2018-08-12 16:19:01'), ('248', '2', 'Ukraine', 'UA', '', null, '', '0', '0', '38', '2018-08-12 17:48:22', '1', '35', '2018-08-12 16:19:01'), ('249', '1', 'United Arab Emirates', 'AE', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('250', '2', 'United Kingdom', 'GB', '', null, '', '0', '0', '38', '2018-08-12 17:49:03', '1', '35', '2018-08-12 16:19:01'), ('251', '4', 'United States', 'US', '', null, '', '0', '0', '38', '2018-08-12 18:23:19', '1', '35', '2018-08-12 16:19:01'), ('252', '4', 'United States minor outlying islands', 'UM', '', null, '', '0', '0', '38', '2018-08-12 18:23:31', '1', '35', '2018-08-12 16:19:01'), ('253', '5', 'Uruguay', 'UY', '', null, '', '0', '0', '38', '2018-08-12 18:28:08', '1', '35', '2018-08-12 16:19:01'), ('254', '1', 'Uzbekistan', 'UZ', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('255', '6', 'Vanuatu', 'VU', '', null, '', '0', '0', '38', '2018-08-12 18:33:47', '1', '35', '2018-08-12 16:19:01'), ('256', '2', 'Vatican City State', 'VA', '', null, '', '0', '0', '38', '2018-08-12 17:49:24', '1', '35', '2018-08-12 16:19:01'), ('257', '5', 'Venezuela', 'VE', '', null, '', '0', '0', '38', '2018-08-12 18:28:26', '1', '35', '2018-08-12 16:19:01'), ('258', '1', 'Vietnam', 'VN', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('259', '1', 'Virgin Islands (British)', 'VG', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('260', '1', 'Virgin Islands (U.S.)', 'VI', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('261', '1', 'Wallis and Futuna Islands', 'WF', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('262', '1', 'Western Sahara', 'EH', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('263', '1', 'Yemen', 'YE', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('264', '1', 'Zaire', 'ZR', null, null, null, '0', '0', '35', '2018-08-12 16:19:01', '1', '35', '2018-08-12 16:19:01'), ('265', '3', 'Zambia', 'ZM', '', null, '', '0', '0', '38', '2018-08-12 18:14:10', '1', '35', '2018-08-12 16:19:01'), ('266', '3', 'Zimbabwe', 'ZW', '', null, '', '0', '0', '38', '2018-08-12 18:14:28', '1', '35', '2018-08-12 16:19:01');
COMMIT;

-- ----------------------------
--  Table structure for `currency`
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `currency`
-- ----------------------------
BEGIN;
INSERT INTO `currency` VALUES ('1', 'USD $', '1');
COMMIT;

-- ----------------------------
--  Table structure for `customer_group`
-- ----------------------------
DROP TABLE IF EXISTS `customer_group`;
CREATE TABLE `customer_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `customer_group`
-- ----------------------------
BEGIN;
INSERT INTO `customer_group` VALUES ('1', 'VIP', null, null, null, null, null, '1'), ('2', 'Wholesaler', null, null, null, null, null, '1'), ('3', 'High Budget', null, null, null, null, null, '1'), ('4', 'Low Budget', null, null, null, null, null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `customer_invoice`
-- ----------------------------
DROP TABLE IF EXISTS `customer_invoice`;
CREATE TABLE `customer_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `id_project` int(11) DEFAULT NULL,
  `id_payment_method` int(11) DEFAULT NULL,
  `total_tax` decimal(10,2) DEFAULT NULL,
  `id_recurring_invoice` int(11) DEFAULT NULL,
  `recurring_value` int(11) DEFAULT NULL,
  `recurring_type` int(11) DEFAULT NULL,
  `admin_note` varchar(255) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `receive_amount` decimal(10,2) DEFAULT NULL,
  `balance_amount` decimal(10,2) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `term_condition` text,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `id_sale_agent` int(11) DEFAULT NULL,
  `client_note` varchar(255) DEFAULT NULL,
  `id_discount` int(11) DEFAULT NULL,
  `discount_value` decimal(10,2) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `id_tax` int(11) DEFAULT NULL,
  `is_tax` tinyint(1) DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  `is_converted_from_proposal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `customer_invoice`
-- ----------------------------
BEGIN;
INSERT INTO `customer_invoice` VALUES ('1', 'INV19090001', '2019-09-16', '2019-10-16', '1', '1', '1', null, '1', null, null, '', '19.80', '0.00', '19.80', null, '', '3', '1', '2019-09-17 09:57:26', '1', '2019-09-16 14:23:26', '1', null, '', '1', '10.00', '2.20', '1', '0', '0.00', '22.00', null), ('2', 'INV19090002', '2019-09-16', '2019-10-16', '1', '1', '1', null, '1', null, null, '', '19.80', '19.80', '0.00', null, '', '1', '1', '2019-09-16 15:34:11', '1', '2019-09-16 15:17:09', '1', null, '', '1', '10.00', '2.20', '1', '0', '0.00', '22.00', null), ('3', 'INV19090003', '2019-09-17', '2019-10-17', '1', '1', '1', null, '1', null, null, '', '39.60', '0.00', '39.60', null, '', '3', '1', '2019-09-17 10:01:19', '1', '2019-09-17 09:57:11', '1', null, '', '1', '10.00', '4.40', '1', '0', '0.00', '44.00', null);
COMMIT;

-- ----------------------------
--  Table structure for `customer_invoice_data`
-- ----------------------------
DROP TABLE IF EXISTS `customer_invoice_data`;
CREATE TABLE `customer_invoice_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer_invoice` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `qty` int(11) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `discount_type` int(11) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `customer_invoice_data`
-- ----------------------------
BEGIN;
INSERT INTO `customer_invoice_data` VALUES ('6', '2', '1', 'eO-BMS (Standard)', '2222', '1', '22.00', '1', '0.00', '22.00'), ('8', '1', '1', 'eO-BMS (Standard)', '2222', '1', '22.00', '1', '0.00', '22.00'), ('10', '3', '1', 'eO-BMS (Standard)', '2222', '2', '22.00', '1', '0.00', '44.00');
COMMIT;

-- ----------------------------
--  Table structure for `customer_invoice_tag`
-- ----------------------------
DROP TABLE IF EXISTS `customer_invoice_tag`;
CREATE TABLE `customer_invoice_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer_invoice` int(11) DEFAULT NULL,
  `id_tag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `customer_payment`
-- ----------------------------
DROP TABLE IF EXISTS `customer_payment`;
CREATE TABLE `customer_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer_invoice` int(11) DEFAULT NULL,
  `id_project` int(11) DEFAULT NULL,
  `doc_id` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `receive_amount` decimal(10,2) DEFAULT NULL,
  `id_payment_method` int(11) DEFAULT NULL,
  `cheque_number` varchar(20) DEFAULT NULL,
  `clearing_date` date DEFAULT NULL,
  `chart_of_account` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `customer_payment`
-- ----------------------------
BEGIN;
INSERT INTO `customer_payment` VALUES ('1', '2', '1', 'REC19090001', '2019-09-16', '19.80', '1', '', null, '38', 'testing payment invoice', '0', '1', '2019-09-16 15:34:11', '1', '2019-09-16 15:27:38'), ('2', '2', '1', 'REC19090002', '2019-09-16', '19.80', '1', '', null, '38', '', '1', null, null, '1', '2019-09-16 15:36:01'), ('3', '3', '1', 'REC19090003', '2019-09-17', '22.00', '1', '', null, '38', '', '0', '1', '2019-09-17 10:01:19', '1', '2019-09-17 09:57:54');
COMMIT;

-- ----------------------------
--  Table structure for `customer_profile`
-- ----------------------------
DROP TABLE IF EXISTS `customer_profile`;
CREATE TABLE `customer_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(250) DEFAULT NULL,
  `company_name` varchar(250) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `latitute` decimal(16,10) DEFAULT NULL,
  `longitute` decimal(16,10) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `id_country` int(11) DEFAULT NULL,
  `id_city` int(11) DEFAULT NULL,
  `group_names` varchar(250) DEFAULT NULL,
  `billing_address` varchar(250) DEFAULT NULL,
  `id_billing_city` int(11) DEFAULT NULL,
  `id_billing_country` int(11) DEFAULT NULL,
  `shipping_address` varchar(250) DEFAULT NULL,
  `id_shipping_city` int(11) DEFAULT NULL,
  `id_shipping_country` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `zip_code` varchar(50) DEFAULT NULL,
  `customer_status` int(1) DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `accommodation_type` int(11) DEFAULT NULL,
  `star_rating` decimal(10,2) DEFAULT NULL,
  `number_of_rooms` int(11) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `accomodation_status` int(11) DEFAULT NULL COMMENT '1=lived , 2 = Inprocesing , 0 = Deactived',
  `lived_date` date DEFAULT NULL,
  `passed_by` int(11) DEFAULT NULL,
  `handle_by` int(11) DEFAULT NULL,
  `deactivated_at` varchar(20) DEFAULT NULL,
  `deactivated_reason` text,
  `deactivated_requested_by` varchar(255) DEFAULT NULL,
  `deactivated_requested_contact_detail` text,
  `deactivated_by` int(11) DEFAULT NULL,
  `id_customer_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `customer_profile`
-- ----------------------------
BEGIN;
INSERT INTO `customer_profile` VALUES ('1', 'Peter', 'EOH', '0987654321', 'peter@eoh.com', null, null, 'SR', null, null, null, '', null, null, '', null, null, '1', '1', '2019-09-16 10:28:03', null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('2', 'test', 'Testing customer', '', 'd@d.d', null, null, 'ddd', '22', '1', null, 'ddd', '1', '22', 'ddd', '1', '22', '1', '1', '2019-09-18 15:51:27', null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `customer_profile_contact`
-- ----------------------------
DROP TABLE IF EXISTS `customer_profile_contact`;
CREATE TABLE `customer_profile_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer` int(11) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `customer_profile_group`
-- ----------------------------
DROP TABLE IF EXISTS `customer_profile_group`;
CREATE TABLE `customer_profile_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer_profile` int(11) DEFAULT NULL,
  `id_customer_group` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `customer_profile_note`
-- ----------------------------
DROP TABLE IF EXISTS `customer_profile_note`;
CREATE TABLE `customer_profile_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(11) DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `customer_profile_solution`
-- ----------------------------
DROP TABLE IF EXISTS `customer_profile_solution`;
CREATE TABLE `customer_profile_solution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer` int(11) DEFAULT NULL,
  `id_solution` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `customer_profile_status`
-- ----------------------------
DROP TABLE IF EXISTS `customer_profile_status`;
CREATE TABLE `customer_profile_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `customer_profile_status`
-- ----------------------------
BEGIN;
INSERT INTO `customer_profile_status` VALUES ('1', 'New', null, null, null, null, '1'), ('2', 'Contacted', null, null, null, null, '1'), ('3', 'Qualified', null, null, null, null, '1'), ('4', 'Working', null, null, null, null, '1'), ('5', 'Proposal Sent', null, null, null, null, '1'), ('6', 'Customer', null, null, null, null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `customer_solution_status`
-- ----------------------------
DROP TABLE IF EXISTS `customer_solution_status`;
CREATE TABLE `customer_solution_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `order_by` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `customer_solution_status`
-- ----------------------------
BEGIN;
INSERT INTO `customer_solution_status` VALUES ('1', 'Inprocessing', '2'), ('2', 'Lived', '3'), ('3', 'Terminated', '4'), ('4', 'New Sale', '1');
COMMIT;

-- ----------------------------
--  Table structure for `customer_type`
-- ----------------------------
DROP TABLE IF EXISTS `customer_type`;
CREATE TABLE `customer_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `status` int(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `customer_type`
-- ----------------------------
BEGIN;
INSERT INTO `customer_type` VALUES ('1', 'Hotel', '', '1', '2019-09-01 22:38:59', '1', '2019-09-01 22:41:32', '1'), ('2', 'Hostel', '', '1', '2019-09-01 22:39:08', '1', null, null), ('3', 'Villa', null, '1', null, null, null, null), ('4', 'Boutique', null, '1', null, null, null, null), ('5', 'Apartment', null, '1', null, null, null, null), ('6', 'Resort', null, '1', null, null, null, null), ('7', 'Boutique Hotel', null, '1', null, null, null, null), ('8', 'Holiday House', null, '1', null, null, null, null), ('9', 'Guesthouse', null, '1', null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `data_option_phone_number_country_code`
-- ----------------------------
DROP TABLE IF EXISTS `data_option_phone_number_country_code`;
CREATE TABLE `data_option_phone_number_country_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_name` varchar(10) DEFAULT NULL,
  `names` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `data_option_phone_number_country_code`
-- ----------------------------
BEGIN;
INSERT INTO `data_option_phone_number_country_code` VALUES ('1', 'AD', 'ANDORRA', '376', '1', '1', '2019-01-09 09:58:14', '1', '2019-04-24 16:52:44'), ('2', 'AE', 'UNITED ARAB EMIRATES', '971', '1', '1', '2019-01-09 09:58:14', null, null), ('3', 'AF', 'AFGHANISTAN', '93', '1', '1', '2019-01-09 09:58:14', null, null), ('4', 'AG', 'ANTIGUA AND BARBUDA', '1268', '1', '1', '2019-01-09 09:58:14', null, null), ('5', 'AI', 'ANGUILLA', '1264', '1', '1', '2019-01-09 09:58:14', null, null), ('6', 'AL', 'ALBANIA', '355', '1', '1', '2019-01-09 09:58:14', null, null), ('7', 'AM', 'ARMENIA', '374', '1', '1', '2019-01-09 09:58:14', null, null), ('8', 'AN', 'NETHERLANDS ANTILLES', '599', '1', '1', '2019-01-09 09:58:14', null, null), ('9', 'AO', 'ANGOLA', '244', '1', '1', '2019-01-09 09:58:14', null, null), ('10', 'AQ', 'ANTARCTICA', '672', '1', '1', '2019-01-09 09:58:14', null, null), ('11', 'AR', 'ARGENTINA', '54', '1', '1', '2019-01-09 09:58:14', null, null), ('12', 'AS', 'AMERICAN SAMOA', '1684', '1', '1', '2019-01-09 09:58:14', null, null), ('13', 'AT', 'AUSTRIA', '43', '1', '1', '2019-01-09 09:58:14', null, null), ('14', 'AU', 'AUSTRALIA', '61', '1', '1', '2019-01-09 09:58:14', null, null), ('15', 'AW', 'ARUBA', '297', '1', '1', '2019-01-09 09:58:14', null, null), ('16', 'AZ', 'AZERBAIJAN', '994', '1', '1', '2019-01-09 09:58:14', null, null), ('17', 'BA', 'BOSNIA AND HERZEGOVINA', '387', '1', '1', '2019-01-09 09:58:14', null, null), ('18', 'BB', 'BARBADOS', '1246', '1', '1', '2019-01-09 09:58:14', null, null), ('19', 'BD', 'BANGLADESH', '880', '1', '1', '2019-01-09 09:58:14', null, null), ('20', 'BE', 'BELGIUM', '32', '1', '1', '2019-01-09 09:58:14', null, null), ('21', 'BF', 'BURKINA FASO', '226', '1', '1', '2019-01-09 09:58:14', null, null), ('22', 'BG', 'BULGARIA', '359', '1', '1', '2019-01-09 09:58:14', null, null), ('23', 'BH', 'BAHRAIN', '973', '1', '1', '2019-01-09 09:58:14', null, null), ('24', 'BI', 'BURUNDI', '257', '1', '1', '2019-01-09 09:58:14', null, null), ('25', 'BJ', 'BENIN', '229', '1', '1', '2019-01-09 09:58:14', null, null), ('26', 'BL', 'SAINT BARTHELEMY', '590', '1', '1', '2019-01-09 09:58:14', null, null), ('27', 'BM', 'BERMUDA', '1441', '1', '1', '2019-01-09 09:58:14', null, null), ('28', 'BN', 'BRUNEI DARUSSALAM', '673', '1', '1', '2019-01-09 09:58:14', null, null), ('29', 'BO', 'BOLIVIA', '591', '1', '1', '2019-01-09 09:58:14', null, null), ('30', 'BR', 'BRAZIL', '55', '1', '1', '2019-01-09 09:58:14', null, null), ('31', 'BS', 'BAHAMAS', '1242', '1', '1', '2019-01-09 09:58:14', null, null), ('32', 'BT', 'BHUTAN', '975', '1', '1', '2019-01-09 09:58:14', null, null), ('33', 'BW', 'BOTSWANA', '267', '1', '1', '2019-01-09 09:58:14', null, null), ('34', 'BY', 'BELARUS', '375', '1', '1', '2019-01-09 09:58:14', null, null), ('35', 'BZ', 'BELIZE', '501', '1', '1', '2019-01-09 09:58:14', null, null), ('36', 'CA', 'CANADA', '1', '1', '1', '2019-01-09 09:58:14', null, null), ('37', 'CC', 'COCOS (KEELING) ISLANDS', '61', '1', '1', '2019-01-09 09:58:14', null, null), ('38', 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', '243', '1', '1', '2019-01-09 09:58:14', null, null), ('39', 'CF', 'CENTRAL AFRICAN REPUBLIC', '236', '1', '1', '2019-01-09 09:58:14', null, null), ('40', 'CG', 'CONGO', '242', '1', '1', '2019-01-09 09:58:14', null, null), ('41', 'CH', 'SWITZERLAND', '41', '1', '1', '2019-01-09 09:58:14', null, null), ('42', 'CI', 'COTE D IVOIRE', '225', '1', '1', '2019-01-09 09:58:14', null, null), ('43', 'CK', 'COOK ISLANDS', '682', '1', '1', '2019-01-09 09:58:14', null, null), ('44', 'CL', 'CHILE', '56', '1', '1', '2019-01-09 09:58:14', null, null), ('45', 'CM', 'CAMEROON', '237', '1', '1', '2019-01-09 09:58:14', null, null), ('46', 'CN', 'CHINA', '86', '1', '1', '2019-01-09 09:58:14', null, null), ('47', 'CO', 'COLOMBIA', '57', '1', '1', '2019-01-09 09:58:14', null, null), ('48', 'CR', 'COSTA RICA', '506', '1', '1', '2019-01-09 09:58:14', null, null), ('49', 'CU', 'CUBA', '53', '1', '1', '2019-01-09 09:58:14', null, null), ('50', 'CV', 'CAPE VERDE', '238', '1', '1', '2019-01-09 09:58:14', null, null), ('51', 'CX', 'CHRISTMAS ISLAND', '61', '1', '1', '2019-01-09 09:58:14', null, null), ('52', 'CY', 'CYPRUS', '357', '1', '1', '2019-01-09 09:58:14', null, null), ('53', 'CZ', 'CZECH REPUBLIC', '420', '1', '1', '2019-01-09 09:58:14', null, null), ('54', 'DE', 'GERMANY', '49', '1', '1', '2019-01-09 09:58:14', null, null), ('55', 'DJ', 'DJIBOUTI', '253', '1', '1', '2019-01-09 09:58:14', null, null), ('56', 'DK', 'DENMARK', '45', '1', '1', '2019-01-09 09:58:14', null, null), ('57', 'DM', 'DOMINICA', '1767', '1', '1', '2019-01-09 09:58:14', null, null), ('58', 'DO', 'DOMINICAN REPUBLIC', '1809', '1', '1', '2019-01-09 09:58:14', null, null), ('59', 'DZ', 'ALGERIA', '213', '1', '1', '2019-01-09 09:58:14', null, null), ('60', 'EC', 'ECUADOR', '593', '1', '1', '2019-01-09 09:58:14', null, null), ('61', 'EE', 'ESTONIA', '372', '1', '1', '2019-01-09 09:58:14', null, null), ('62', 'EG', 'EGYPT', '20', '1', '1', '2019-01-09 09:58:14', null, null), ('63', 'ER', 'ERITREA', '291', '1', '1', '2019-01-09 09:58:14', null, null), ('64', 'ES', 'SPAIN', '34', '1', '1', '2019-01-09 09:58:14', null, null), ('65', 'ET', 'ETHIOPIA', '251', '1', '1', '2019-01-09 09:58:14', null, null), ('66', 'FI', 'FINLAND', '358', '1', '1', '2019-01-09 09:58:14', null, null), ('67', 'FJ', 'FIJI', '679', '1', '1', '2019-01-09 09:58:14', null, null), ('68', 'FK', 'FALKLAND ISLANDS (MALVINAS)', '500', '1', '1', '2019-01-09 09:58:14', null, null), ('69', 'FM', 'MICRONESIA, FEDERATED STATES OF', '691', '1', '1', '2019-01-09 09:58:14', null, null), ('70', 'FO', 'FAROE ISLANDS', '298', '1', '1', '2019-01-09 09:58:14', null, null), ('71', 'FR', 'FRANCE', '33', '1', '1', '2019-01-09 09:58:14', null, null), ('72', 'GA', 'GABON', '241', '1', '1', '2019-01-09 09:58:14', null, null), ('73', 'GB', 'UNITED KINGDOM', '44', '1', '1', '2019-01-09 09:58:14', null, null), ('74', 'GD', 'GRENADA', '1473', '1', '1', '2019-01-09 09:58:14', null, null), ('75', 'GE', 'GEORGIA', '995', '1', '1', '2019-01-09 09:58:14', null, null), ('76', 'GH', 'GHANA', '233', '1', '1', '2019-01-09 09:58:14', null, null), ('77', 'GI', 'GIBRALTAR', '350', '1', '1', '2019-01-09 09:58:14', null, null), ('78', 'GL', 'GREENLAND', '299', '1', '1', '2019-01-09 09:58:14', null, null), ('79', 'GM', 'GAMBIA', '220', '1', '1', '2019-01-09 09:58:14', null, null), ('80', 'GN', 'GUINEA', '224', '1', '1', '2019-01-09 09:58:14', null, null), ('81', 'GQ', 'EQUATORIAL GUINEA', '240', '1', '1', '2019-01-09 09:58:14', null, null), ('82', 'GR', 'GREECE', '30', '1', '1', '2019-01-09 09:58:14', null, null), ('83', 'GT', 'GUATEMALA', '502', '1', '1', '2019-01-09 09:58:14', null, null), ('84', 'GU', 'GUAM', '1671', '1', '1', '2019-01-09 09:58:14', null, null), ('85', 'GW', 'GUINEA-BISSAU', '245', '1', '1', '2019-01-09 09:58:14', null, null), ('86', 'GY', 'GUYANA', '592', '1', '1', '2019-01-09 09:58:14', null, null), ('87', 'HK', 'HONG KONG', '852', '1', '1', '2019-01-09 09:58:14', null, null), ('88', 'HN', 'HONDURAS', '504', '1', '1', '2019-01-09 09:58:14', null, null), ('89', 'HR', 'CROATIA', '385', '1', '1', '2019-01-09 09:58:14', null, null), ('90', 'HT', 'HAITI', '509', '1', '1', '2019-01-09 09:58:14', null, null), ('91', 'HU', 'HUNGARY', '36', '1', '1', '2019-01-09 09:58:14', null, null), ('92', 'ID', 'INDONESIA', '62', '1', '1', '2019-01-09 09:58:14', null, null), ('93', 'IE', 'IRELAND', '353', '1', '1', '2019-01-09 09:58:14', null, null), ('94', 'IL', 'ISRAEL', '972', '1', '1', '2019-01-09 09:58:14', null, null), ('95', 'IM', 'ISLE OF MAN', '44', '1', '1', '2019-01-09 09:58:14', null, null), ('96', 'IN', 'INDIA', '91', '1', '1', '2019-01-09 09:58:14', null, null), ('97', 'IQ', 'IRAQ', '964', '1', '1', '2019-01-09 09:58:14', null, null), ('98', 'IR', 'IRAN, ISLAMIC REPUBLIC OF', '98', '1', '1', '2019-01-09 09:58:14', null, null), ('99', 'IS', 'ICELAND', '354', '1', '1', '2019-01-09 09:58:14', null, null), ('100', 'IT', 'ITALY', '39', '1', '1', '2019-01-09 09:58:14', null, null), ('101', 'JM', 'JAMAICA', '1876', '1', '1', '2019-01-09 09:58:14', null, null), ('102', 'JO', 'JORDAN', '962', '1', '1', '2019-01-09 09:58:14', null, null), ('103', 'JP', 'JAPAN', '81', '1', '1', '2019-01-09 09:58:14', null, null), ('104', 'KE', 'KENYA', '254', '1', '1', '2019-01-09 09:58:14', null, null), ('105', 'KG', 'KYRGYZSTAN', '996', '1', '1', '2019-01-09 09:58:14', null, null), ('106', 'KH', 'CAMBODIA', '855', '1', '1', '2019-01-09 09:58:14', null, null), ('107', 'KI', 'KIRIBATI', '686', '1', '1', '2019-01-09 09:58:14', null, null), ('108', 'KM', 'COMOROS', '269', '1', '1', '2019-01-09 09:58:14', null, null), ('109', 'KN', 'SAINT KITTS AND NEVIS', '1869', '1', '1', '2019-01-09 09:58:14', null, null), ('110', 'KP', 'KOREA DEMOCRATIC PEOPLES REPUBLIC OF', '850', '1', '1', '2019-01-09 09:58:14', null, null), ('111', 'KR', 'KOREA REPUBLIC OF', '82', '1', '1', '2019-01-09 09:58:14', null, null), ('112', 'KW', 'KUWAIT', '965', '1', '1', '2019-01-09 09:58:14', null, null), ('113', 'KY', 'CAYMAN ISLANDS', '1345', '1', '1', '2019-01-09 09:58:14', null, null), ('114', 'KZ', 'KAZAKSTAN', '7', '1', '1', '2019-01-09 09:58:14', null, null), ('115', 'LA', 'LAO PEOPLES DEMOCRATIC REPUBLIC', '856', '1', '1', '2019-01-09 09:58:14', null, null), ('116', 'LB', 'LEBANON', '961', '1', '1', '2019-01-09 09:58:14', null, null), ('117', 'LC', 'SAINT LUCIA', '1758', '1', '1', '2019-01-09 09:58:14', null, null), ('118', 'LI', 'LIECHTENSTEIN', '423', '1', '1', '2019-01-09 09:58:14', null, null), ('119', 'LK', 'SRI LANKA', '94', '1', '1', '2019-01-09 09:58:14', null, null), ('120', 'LR', 'LIBERIA', '231', '1', '1', '2019-01-09 09:58:14', null, null), ('121', 'LS', 'LESOTHO', '266', '1', '1', '2019-01-09 09:58:14', null, null), ('122', 'LT', 'LITHUANIA', '370', '1', '1', '2019-01-09 09:58:14', null, null), ('123', 'LU', 'LUXEMBOURG', '352', '1', '1', '2019-01-09 09:58:14', null, null), ('124', 'LV', 'LATVIA', '371', '1', '1', '2019-01-09 09:58:14', null, null), ('125', 'LY', 'LIBYAN ARAB JAMAHIRIYA', '218', '1', '1', '2019-01-09 09:58:14', null, null), ('126', 'MA', 'MOROCCO', '212', '1', '1', '2019-01-09 09:58:14', null, null), ('127', 'MC', 'MONACO', '377', '1', '1', '2019-01-09 09:58:14', null, null), ('128', 'MD', 'MOLDOVA, REPUBLIC OF', '373', '1', '1', '2019-01-09 09:58:14', null, null), ('129', 'ME', 'MONTENEGRO', '382', '1', '1', '2019-01-09 09:58:14', null, null), ('130', 'MF', 'SAINT MARTIN', '1599', '1', '1', '2019-01-09 09:58:14', null, null), ('131', 'MG', 'MADAGASCAR', '261', '1', '1', '2019-01-09 09:58:14', null, null), ('132', 'MH', 'MARSHALL ISLANDS', '692', '1', '1', '2019-01-09 09:58:14', null, null), ('133', 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', '389', '1', '1', '2019-01-09 09:58:14', null, null), ('134', 'ML', 'MALI', '223', '1', '1', '2019-01-09 09:58:14', null, null), ('135', 'MM', 'MYANMAR', '95', '1', '1', '2019-01-09 09:58:14', null, null), ('136', 'MN', 'MONGOLIA', '976', '1', '1', '2019-01-09 09:58:14', null, null), ('137', 'MO', 'MACAU', '853', '1', '1', '2019-01-09 09:58:14', null, null), ('138', 'MP', 'NORTHERN MARIANA ISLANDS', '1670', '1', '1', '2019-01-09 09:58:14', null, null), ('139', 'MR', 'MAURITANIA', '222', '1', '1', '2019-01-09 09:58:14', null, null), ('140', 'MS', 'MONTSERRAT', '1664', '1', '1', '2019-01-09 09:58:14', null, null), ('141', 'MT', 'MALTA', '356', '1', '1', '2019-01-09 09:58:14', null, null), ('142', 'MU', 'MAURITIUS', '230', '1', '1', '2019-01-09 09:58:14', null, null), ('143', 'MV', 'MALDIVES', '960', '1', '1', '2019-01-09 09:58:14', null, null), ('144', 'MW', 'MALAWI', '265', '1', '1', '2019-01-09 09:58:14', null, null), ('145', 'MX', 'MEXICO', '52', '1', '1', '2019-01-09 09:58:14', null, null), ('146', 'MY', 'MALAYSIA', '60', '1', '1', '2019-01-09 09:58:14', null, null), ('147', 'MZ', 'MOZAMBIQUE', '258', '1', '1', '2019-01-09 09:58:14', null, null), ('148', 'NA', 'NAMIBIA', '264', '1', '1', '2019-01-09 09:58:14', null, null), ('149', 'NC', 'NEW CALEDONIA', '687', '1', '1', '2019-01-09 09:58:14', null, null), ('150', 'NE', 'NIGER', '227', '1', '1', '2019-01-09 09:58:14', null, null), ('151', 'NG', 'NIGERIA', '234', '1', '1', '2019-01-09 09:58:14', null, null), ('152', 'NI', 'NICARAGUA', '505', '1', '1', '2019-01-09 09:58:14', null, null), ('153', 'NL', 'NETHERLANDS', '31', '1', '1', '2019-01-09 09:58:14', null, null), ('154', 'NO', 'NORWAY', '47', '1', '1', '2019-01-09 09:58:14', null, null), ('155', 'NP', 'NEPAL', '977', '1', '1', '2019-01-09 09:58:14', null, null), ('156', 'NR', 'NAURU', '674', '1', '1', '2019-01-09 09:58:14', null, null), ('157', 'NU', 'NIUE', '683', '1', '1', '2019-01-09 09:58:14', null, null), ('158', 'NZ', 'NEW ZEALAND', '64', '1', '1', '2019-01-09 09:58:14', null, null), ('159', 'OM', 'OMAN', '968', '1', '1', '2019-01-09 09:58:14', null, null), ('160', 'PA', 'PANAMA', '507', '1', '1', '2019-01-09 09:58:14', null, null), ('161', 'PE', 'PERU', '51', '1', '1', '2019-01-09 09:58:14', null, null), ('162', 'PF', 'FRENCH POLYNESIA', '689', '1', '1', '2019-01-09 09:58:14', null, null), ('163', 'PG', 'PAPUA NEW GUINEA', '675', '1', '1', '2019-01-09 09:58:14', null, null), ('164', 'PH', 'PHILIPPINES', '63', '1', '1', '2019-01-09 09:58:14', null, null), ('165', 'PK', 'PAKISTAN', '92', '1', '1', '2019-01-09 09:58:14', null, null), ('166', 'PL', 'POLAND', '48', '1', '1', '2019-01-09 09:58:14', null, null), ('167', 'PM', 'SAINT PIERRE AND MIQUELON', '508', '1', '1', '2019-01-09 09:58:14', null, null), ('168', 'PN', 'PITCAIRN', '870', '1', '1', '2019-01-09 09:58:14', null, null), ('169', 'PR', 'PUERTO RICO', '1', '1', '1', '2019-01-09 09:58:14', null, null), ('170', 'PT', 'PORTUGAL', '351', '1', '1', '2019-01-09 09:58:14', null, null), ('171', 'PW', 'PALAU', '680', '1', '1', '2019-01-09 09:58:14', null, null), ('172', 'PY', 'PARAGUAY', '595', '1', '1', '2019-01-09 09:58:14', null, null), ('173', 'QA', 'QATAR', '974', '1', '1', '2019-01-09 09:58:14', null, null), ('174', 'RO', 'ROMANIA', '40', '1', '1', '2019-01-09 09:58:14', null, null), ('175', 'RS', 'SERBIA', '381', '1', '1', '2019-01-09 09:58:14', null, null), ('176', 'RU', 'RUSSIAN FEDERATION', '7', '1', '1', '2019-01-09 09:58:14', null, null), ('177', 'RW', 'RWANDA', '250', '1', '1', '2019-01-09 09:58:14', null, null), ('178', 'SA', 'SAUDI ARABIA', '966', '1', '1', '2019-01-09 09:58:14', null, null), ('179', 'SB', 'SOLOMON ISLANDS', '677', '1', '1', '2019-01-09 09:58:14', null, null), ('180', 'SC', 'SEYCHELLES', '248', '1', '1', '2019-01-09 09:58:14', null, null), ('181', 'SD', 'SUDAN', '249', '1', '1', '2019-01-09 09:58:14', null, null), ('182', 'SE', 'SWEDEN', '46', '1', '1', '2019-01-09 09:58:14', null, null), ('183', 'SG', 'SINGAPORE', '65', '1', '1', '2019-01-09 09:58:14', null, null), ('184', 'SH', 'SAINT HELENA', '290', '1', '1', '2019-01-09 09:58:14', null, null), ('185', 'SI', 'SLOVENIA', '386', '1', '1', '2019-01-09 09:58:14', null, null), ('186', 'SK', 'SLOVAKIA', '421', '1', '1', '2019-01-09 09:58:14', null, null), ('187', 'SL', 'SIERRA LEONE', '232', '1', '1', '2019-01-09 09:58:14', null, null), ('188', 'SM', 'SAN MARINO', '378', '1', '1', '2019-01-09 09:58:14', null, null), ('189', 'SN', 'SENEGAL', '221', '1', '1', '2019-01-09 09:58:14', null, null), ('190', 'SO', 'SOMALIA', '252', '1', '1', '2019-01-09 09:58:14', null, null), ('191', 'SR', 'SURINAME', '597', '1', '1', '2019-01-09 09:58:14', null, null), ('192', 'ST', 'SAO TOME AND PRINCIPE', '239', '1', '1', '2019-01-09 09:58:14', null, null), ('193', 'SV', 'EL SALVADOR', '503', '1', '1', '2019-01-09 09:58:14', null, null), ('194', 'SY', 'SYRIAN ARAB REPUBLIC', '963', '1', '1', '2019-01-09 09:58:14', null, null), ('195', 'SZ', 'SWAZILAND', '268', '1', '1', '2019-01-09 09:58:14', null, null), ('196', 'TC', 'TURKS AND CAICOS ISLANDS', '1649', '1', '1', '2019-01-09 09:58:14', null, null), ('197', 'TD', 'CHAD', '235', '1', '1', '2019-01-09 09:58:14', null, null), ('198', 'TG', 'TOGO', '228', '1', '1', '2019-01-09 09:58:14', null, null), ('199', 'TH', 'THAILAND', '66', '1', '1', '2019-01-09 09:58:14', null, null), ('200', 'TJ', 'TAJIKISTAN', '992', '1', '1', '2019-01-09 09:58:14', null, null), ('201', 'TK', 'TOKELAU', '690', '1', '1', '2019-01-09 09:58:14', null, null), ('202', 'TL', 'TIMOR-LESTE', '670', '1', '1', '2019-01-09 09:58:14', null, null), ('203', 'TM', 'TURKMENISTAN', '993', '1', '1', '2019-01-09 09:58:14', null, null), ('204', 'TN', 'TUNISIA', '216', '1', '1', '2019-01-09 09:58:14', null, null), ('205', 'TO', 'TONGA', '676', '1', '1', '2019-01-09 09:58:14', null, null), ('206', 'TR', 'TURKEY', '90', '1', '1', '2019-01-09 09:58:14', null, null), ('207', 'TT', 'TRINIDAD AND TOBAGO', '1868', '1', '1', '2019-01-09 09:58:14', null, null), ('208', 'TV', 'TUVALU', '688', '1', '1', '2019-01-09 09:58:14', null, null), ('209', 'TW', 'TAIWAN, PROVINCE OF CHINA', '886', '1', '1', '2019-01-09 09:58:14', null, null), ('210', 'TZ', 'TANZANIA, UNITED REPUBLIC OF', '255', '1', '1', '2019-01-09 09:58:14', null, null), ('211', 'UA', 'UKRAINE', '380', '1', '1', '2019-01-09 09:58:14', null, null), ('212', 'UG', 'UGANDA', '256', '1', '1', '2019-01-09 09:58:14', null, null), ('213', 'US', 'UNITED STATES', '1', '1', '1', '2019-01-09 09:58:14', null, null), ('214', 'UY', 'URUGUAY', '598', '1', '1', '2019-01-09 09:58:14', null, null), ('215', 'UZ', 'UZBEKISTAN', '998', '1', '1', '2019-01-09 09:58:14', null, null), ('216', 'VA', 'HOLY SEE (VATICAN CITY STATE)', '39', '1', '1', '2019-01-09 09:58:14', null, null), ('217', 'VC', 'SAINT VINCENT AND THE GRENADINES', '1784', '1', '1', '2019-01-09 09:58:14', null, null), ('218', 'VE', 'VENEZUELA', '58', '1', '1', '2019-01-09 09:58:14', null, null), ('219', 'VG', 'VIRGIN ISLANDS, BRITISH', '1284', '1', '1', '2019-01-09 09:58:14', null, null), ('220', 'VI', 'VIRGIN ISLANDS, U.S.', '1340', '1', '1', '2019-01-09 09:58:14', null, null), ('221', 'VN', 'VIET NAM', '84', '1', '1', '2019-01-09 09:58:14', null, null), ('222', 'VU', 'VANUATU', '678', '1', '1', '2019-01-09 09:58:14', null, null), ('223', 'WF', 'WALLIS AND FUTUNA', '681', '1', '1', '2019-01-09 09:58:14', null, null), ('224', 'WS', 'SAMOA', '685', '1', '1', '2019-01-09 09:58:14', null, null), ('225', 'XK', 'KOSOVO', '381', '1', '1', '2019-01-09 09:58:14', null, null), ('226', 'YE', 'YEMEN', '967', '1', '1', '2019-01-09 09:58:14', null, null), ('227', 'YT', 'MAYOTTE', '262', '1', '1', '2019-01-09 09:58:14', null, null), ('228', 'ZA', 'SOUTH AFRICA', '27', '1', '1', '2019-01-09 09:58:14', null, null), ('229', 'ZM', 'ZAMBIA', '260', '1', '1', '2019-01-09 09:58:14', null, null), ('230', 'ZW', 'ZIMBABWE', '263', '1', '1', '2019-01-09 09:58:14', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `data_option_prefix`
-- ----------------------------
DROP TABLE IF EXISTS `data_option_prefix`;
CREATE TABLE `data_option_prefix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(250) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `data_option_prefix`
-- ----------------------------
BEGIN;
INSERT INTO `data_option_prefix` VALUES ('1', 'Mr.', '1', '2017-12-11 15:34:00', '1', '1', '2017-12-13 17:15:11'), ('2', 'Ms.', '1', '2017-12-11 15:34:08', '1', '1', '2017-12-13 17:15:11'), ('3', 'Mrs.', '1', '2017-12-11 15:34:05', '1', '1', '2017-12-13 17:15:11'), ('4', 'Dr.', '1', '2017-12-11 15:34:03', '1', '1', '2017-12-13 17:15:11'), ('5', 'Prof.', '1', '2017-12-13 17:14:59', '1', '1', '2017-12-13 17:15:11');
COMMIT;

-- ----------------------------
--  Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `department`
-- ----------------------------
BEGIN;
INSERT INTO `department` VALUES ('2', 'Web Application Development', '', '', '', '2019-09-16 09:50:28', '1', null, null, '1'), ('3', 'Sales Department', '0987654321', 'sales@eocambo.com', '', '2019-09-20 13:55:05', '1', null, null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `document`
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` float DEFAULT '0',
  `id_folder` int(11) DEFAULT '0',
  `id_membership_profile` int(11) DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `document_permission` int(1) DEFAULT NULL,
  `id_event_list` int(11) DEFAULT NULL,
  `id_employee_profile` int(11) DEFAULT NULL,
  `id_customer_profile` int(11) DEFAULT NULL,
  `id_project` int(11) DEFAULT NULL,
  `id_contract` int(11) DEFAULT NULL,
  `id_lead_profile` int(11) DEFAULT NULL,
  `id_standard_operation_procedure_set_up` int(11) DEFAULT NULL,
  `file_extention` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `document`
-- ----------------------------
BEGIN;
INSERT INTO `document` VALUES ('2', 'quotation-summary-report-by-customer_from_03-sep-2019_to_03-sep-2019.xls', '2045', '1', null, 'uploads/lead-profile/1/quotation-summary-report-by-customer_from_03-sep-2019_to_03-sep-2019-15678225755d7312ef714b0617295875.xls', 'thumbs/icon-excel.png', null, '1', '2019-09-07 09:16:15', null, null, '1', null, null, null, null, null, null, '3', null, '1'), ('3', 'sop-web app dev-15673999095d6c9fe5cc483174131561.docx', '56346', '1', null, 'uploads/lead-profile/1/sop-web app dev-15673999095d6c9fe5cc483174131561-15678225755d7312ef7cd0c903080409.docx', 'thumbs/icon-word.png', null, '1', '2019-09-07 09:16:15', null, null, '1', null, null, null, null, null, null, '3', null, '1'), ('6', 'sale-report-by-quotation (1).xls', '1402', '2', null, 'uploads/customer-profile/2/sale-report-by-quotation (1)-15678228455d7313fd867b3121064415.xls', 'thumbs/icon-excel.png', null, '1', '2019-09-07 09:20:45', null, null, '1', null, null, null, '1', null, null, null, null, '1'), ('8', 'sale-report-by-quotation (1).xls', '1402', '3', null, 'uploads/project/3/sale-report-by-quotation (1)-15678232515d731593cf19a945742718.xls', 'thumbs/icon-excel.png', null, '1', '2019-09-07 09:27:31', null, null, '1', null, null, null, null, '1', null, null, null, '1'), ('10', 'sale-report-by-quotation (1).xls', '1402', '4', null, 'uploads/standard-operation-procedure-set-up/4/sale-report-by-quotation (1)-15678235185d73169ee4cbe404562932.xls', 'thumbs/icon-excel.png', null, '1', '2019-09-07 09:31:58', null, null, '1', null, null, null, null, null, null, null, '3', '1'), ('11', 'sop-web app dev-15673999095d6c9fe5cc483174131561.docx', '56346', '2', null, 'uploads/customer-profile/2/sop-web app dev-15673999095d6c9fe5cc483174131561-15678239495d73184d46ad0866178589.docx', 'thumbs/icon-word.png', null, '1', '2019-09-07 09:39:09', null, null, '1', null, null, null, '1', null, null, null, null, '1'), ('12', 'bms-2bc-business-center-data-gathering.docx', '163108', '2', null, 'uploads/project/2/bms-2bc-business-center-data-gathering-15686219555d7f458328ba3838713754.docx', 'thumbs/icon-word.png', null, '1', '2019-09-16 15:19:15', null, null, '1', null, null, null, null, '1', null, null, null, '1'), ('14', 'eo_volunteer_profile.png', '56814', '4', null, 'uploads/employee-profile/4/eo_volunteer_profile-15687828125d81b9dcdf962713990325.png', 'uploads/thumb/employee-profile/4/eo_volunteer_profile-15687828125d81b9dcdf962713990325.png', null, '1', '2019-09-18 12:00:12', null, null, '1', null, null, '1', null, null, null, null, null, null), ('24', 'workbook39.pdf', '1161160', '1', null, 'uploads/customer-profile/1/workbook39-15687875935d81cc89f1087188548743.pdf', 'thumbs/icon-pdf.png', null, '1', '2019-09-18 13:19:53', null, null, '1', null, null, null, '1', null, null, null, null, '1'), ('25', '_ pdf preview.pdf', '677732', '2', null, 'uploads/project/2/_ pdf preview-15687878135d81cd65db2be424196361.pdf', 'thumbs/icon-pdf.png', null, '1', '2019-09-18 13:23:33', null, null, '1', null, null, null, null, '1', null, null, null, '1'), ('28', 'financial-performance-dashboard.png', '73224', '2', null, 'uploads/project/2/financial-performance-dashboard-15687879115d81cdc72a6e7376897741.png', 'uploads/thumb/project/2/financial-performance-dashboard-15687879115d81cdc72a6e7376897741.png', null, '1', '2019-09-18 13:25:11', null, null, '1', null, null, null, null, '1', null, null, null, '0'), ('32', 'gettyimages-543352018-1024x1024.jpg', '135137', '5', null, 'uploads/standard-operation-procedure-set-up/5/gettyimages-543352018-1024x1024-15687881675d81cec71e489389048698.jpg', 'uploads/thumb/standard-operation-procedure-set-up/5/gettyimages-543352018-1024x1024-15687881675d81cec71e489389048698.jpg', null, '1', '2019-09-18 13:29:27', null, null, '1', null, null, null, null, null, null, null, '1', '0'), ('33', 'gettyimages-543352018-1024x1024.jpg', '135137', '4', null, 'uploads/employee-profile/4/gettyimages-543352018-1024x1024-15687883655d81cf8d3b6ac325794378.jpg', 'uploads/thumb/employee-profile/4/gettyimages-543352018-1024x1024-15687883655d81cf8d3b6ac325794378.jpg', null, '1', '2019-09-18 13:32:45', null, null, '1', null, null, '1', null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `document_format`
-- ----------------------------
DROP TABLE IF EXISTS `document_format`;
CREATE TABLE `document_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_type` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `document_format`
-- ----------------------------
BEGIN;
INSERT INTO `document_format` VALUES ('1', '1', 'INV'), ('2', '2', 'REC'), ('3', '3', 'EXP'), ('4', '4', 'PRO'), ('5', '5', 'QUT'), ('6', '6', 'ADV'), ('7', '7', 'PRE'), ('8', '8', 'ERO');
COMMIT;

-- ----------------------------
--  Table structure for `employee_position`
-- ----------------------------
DROP TABLE IF EXISTS `employee_position`;
CREATE TABLE `employee_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `id_department` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `employee_position`
-- ----------------------------
BEGIN;
INSERT INTO `employee_position` VALUES ('1', 'Sale', '', '2019-09-17 09:34:45', '1', '2019-10-04 13:09:39', '1', '1', '3'), ('2', 'senior testor', '', '2019-09-20 09:22:39', '1', null, null, '1', '2');
COMMIT;

-- ----------------------------
--  Table structure for `employee_profile`
-- ----------------------------
DROP TABLE IF EXISTS `employee_profile`;
CREATE TABLE `employee_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_prefix` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `join_date` date DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nationality` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_country` int(11) DEFAULT NULL,
  `id_city` int(11) DEFAULT NULL,
  `marital_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_department` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_position` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `confirm_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user_type` int(11) DEFAULT NULL,
  `job_description` text COLLATE utf8_unicode_ci,
  `employee_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_joint_date` date DEFAULT NULL,
  `basic_salary` decimal(10,2) DEFAULT NULL,
  `id_working_group` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `employee_profile`
-- ----------------------------
BEGIN;
INSERT INTO `employee_profile` VALUES ('1', 'Mr.', 'dara', 'tester', null, null, '', '1', '56', '', null, null, '', '', '2', '', '1', 'tester', '', '', '', '2019-09-17 09:35:41', '1', '2019-10-02 08:32:43', '1', '1', '7', '1', '', '', null, null, null), ('2', 'Ms.', 'mara', 'ko', '2019-09-24', null, '', '1', '56', '', null, null, '', '', '3', '', '1', 'marako', '', '', '', '2019-09-20 09:09:28', '1', '2019-10-04 13:10:10', '1', '1', '12', '3', '', 'tt22', null, null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `eot_customer`
-- ----------------------------
DROP TABLE IF EXISTS `eot_customer`;
CREATE TABLE `eot_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` text,
  `country` int(11) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `general_email` varchar(255) DEFAULT NULL,
  `reservation_email` varchar(255) DEFAULT NULL,
  `invoice_email` varchar(255) DEFAULT NULL,
  `mobile_number_invoice` varchar(255) DEFAULT NULL,
  `main_phone_1` varchar(255) DEFAULT NULL,
  `main_phone_2` varchar(255) DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `accommodation_type` int(11) DEFAULT NULL,
  `star_rating` decimal(10,1) DEFAULT NULL,
  `number_of_rooms` int(11) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `service_agreement` varchar(255) DEFAULT NULL,
  `fee` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `accomodation_stats` int(11) DEFAULT NULL COMMENT '1=lived , 2 = Inprocesing , 0 = Deactived',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `passed_by` int(11) DEFAULT NULL,
  `handle_by` int(11) DEFAULT NULL,
  `deactivated_at` date DEFAULT NULL,
  `deactivated_reason` text,
  `deactivated_requested_by` varchar(255) DEFAULT NULL,
  `deactivated_requested_contact_detail` text,
  `deactivated_by` int(11) NOT NULL,
  `lived_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `event_list`
-- ----------------------------
DROP TABLE IF EXISTS `event_list`;
CREATE TABLE `event_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `number_of_audient` int(11) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address_line_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_country` int(11) DEFAULT NULL,
  `id_city` int(11) DEFAULT NULL,
  `id_province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefix_phone_code` int(11) DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefix_phone_code_line_2` int(11) DEFAULT NULL,
  `phone_number_line_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `fee_for_membership` decimal(10,2) DEFAULT '0.00',
  `fee_for_subscriber` decimal(10,2) DEFAULT '0.00',
  `authorized` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `expense`
-- ----------------------------
DROP TABLE IF EXISTS `expense`;
CREATE TABLE `expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` varchar(50) DEFAULT NULL,
  `id_related_to` int(11) DEFAULT NULL,
  `id_related_profile` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `chart_of_account` int(11) DEFAULT NULL,
  `chart_of_account_amount` decimal(10,2) DEFAULT NULL,
  `id_payment_method` int(11) DEFAULT NULL,
  `cheque_number` varchar(10) DEFAULT NULL,
  `clearing_date` date DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `paid_amount` decimal(10,2) DEFAULT NULL,
  `balance_amount` decimal(10,2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `expense`
-- ----------------------------
BEGIN;
INSERT INTO `expense` VALUES ('1', 'EXP19090001', '3', '1', '2019-09-16', '38', null, '1', '', null, '10.00', '10.00', '0.00', '', '1', '2019-09-16 15:37:19', '1', '2019-09-16 15:37:19', '1', '3'), ('2', 'EXP19090002', '3', '1', '2019-09-16', '38', null, '1', '', null, '9.00', '9.00', '0.00', '', '1', '2019-09-16 15:38:10', '1', '2019-09-16 15:38:10', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `expense_data`
-- ----------------------------
DROP TABLE IF EXISTS `expense_data`;
CREATE TABLE `expense_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_expense` int(11) DEFAULT NULL,
  `chart_of_account` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `expense_data`
-- ----------------------------
BEGIN;
INSERT INTO `expense_data` VALUES ('1', '1', '30', 'testing', '10.00', '1'), ('2', '2', '237', '', '9.00', '1');
COMMIT;

-- ----------------------------
--  Table structure for `expense_related_to`
-- ----------------------------
DROP TABLE IF EXISTS `expense_related_to`;
CREATE TABLE `expense_related_to` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `expense_related_to`
-- ----------------------------
BEGIN;
INSERT INTO `expense_related_to` VALUES ('1', 'Supplier'), ('2', 'Customer'), ('3', 'Project');
COMMIT;

-- ----------------------------
--  Table structure for `finance_chart_of_account`
-- ----------------------------
DROP TABLE IF EXISTS `finance_chart_of_account`;
CREATE TABLE `finance_chart_of_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `transaction_type` varchar(100) DEFAULT NULL,
  `doc_id` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `name_type` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `debit` decimal(10,2) DEFAULT NULL,
  `credit` decimal(10,2) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `account_type` int(11) DEFAULT NULL,
  `chart_of_account` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `finance_chart_of_account`
-- ----------------------------
BEGIN;
INSERT INTO `finance_chart_of_account` VALUES ('11', '2019-09-16', 'Invoice', 'INV19090002', '1', 'Customer', 'INV19090002', '0.00', '19.80', '19.80', '1', '1', '2019-09-16 15:17:09', '1', '1', null, null), ('12', '2019-09-16', 'Invoice', 'INV19090002', '1', 'Customer', 'INV19090002', '19.80', '0.00', '19.80', '45', '63', '2019-09-16 15:17:09', '1', '1', null, null), ('15', '2019-09-16', 'Payment', 'REC19090002', '1', 'customer', 'REC19090002', '0.00', '19.80', '0.00', '45', '63', '2019-09-16 15:36:01', '1', '1', null, null), ('16', '2019-09-16', 'Payment', 'REC19090002', '1', 'customer', 'REC19090002', '19.80', '0.00', '19.80', '3', '38', '2019-09-16 15:36:01', '1', '1', null, null), ('17', '2019-09-16', 'Expense', 'EXP19090001', '1', 'project', '', '10.00', '0.00', '10.00', '2', '30', '2019-09-16 15:37:19', '1', '1', null, null), ('18', '2019-09-16', 'Expense', 'EXP19090001', '1', 'project', '', '0.00', '10.00', '9.80', '3', '38', '2019-09-16 15:37:19', '1', '1', null, null), ('19', '2019-09-16', 'Expense', 'EXP19090002', '1', 'project', '', '9.00', '0.00', '9.00', '46', '237', '2019-09-16 15:38:10', '1', '1', null, null), ('20', '2019-09-16', 'Expense', 'EXP19090002', '1', 'project', '', '0.00', '9.00', '0.80', '3', '38', '2019-09-16 15:38:10', '1', '1', null, null), ('23', '2019-09-16', 'Invoice', 'INV19090001', '1', 'customer', 'INV19090001', '0.00', '19.80', '39.60', '1', '1', '2019-09-17 09:57:26', '1', '1', null, null), ('24', '2019-09-16', 'Invoice', 'INV19090001', '1', 'customer', 'INV19090001', '19.80', '0.00', '19.80', '45', '63', '2019-09-17 09:57:26', '1', '1', null, null), ('29', '2019-09-17', 'Invoice', 'INV19090003', '1', 'customer', 'INV19090003', '0.00', '39.60', '79.20', '1', '1', '2019-09-17 10:00:25', '1', '1', null, null), ('30', '2019-09-17', 'Invoice', 'INV19090003', '1', 'customer', 'INV19090003', '39.60', '0.00', '59.40', '45', '63', '2019-09-17 10:00:25', '1', '1', null, null), ('31', '2019-09-17', 'Cash Advance', 'ADV19090001', '1', 'employee', 'xxx - ADV19090001', '0.00', '0.50', '0.30', '3', '38', '2019-09-17 11:05:01', '1', '1', null, null), ('32', '2019-09-17', 'Cash Advance', 'ADV19090001', '1', 'employee', 'xxx - ADV19090001', '0.00', '0.50', '0.50', '9', '51', '2019-09-17 11:05:01', '1', '1', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `finance_chart_of_account_amount`
-- ----------------------------
DROP TABLE IF EXISTS `finance_chart_of_account_amount`;
CREATE TABLE `finance_chart_of_account_amount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type` int(11) DEFAULT NULL,
  `chart_of_account` int(11) DEFAULT NULL,
  `ending_balance` decimal(10,2) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `name_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `finance_chart_of_account_amount`
-- ----------------------------
BEGIN;
INSERT INTO `finance_chart_of_account_amount` VALUES ('1', '9', '51', '0.50', '1', 'Employee');
COMMIT;

-- ----------------------------
--  Table structure for `folder`
-- ----------------------------
DROP TABLE IF EXISTS `folder`;
CREATE TABLE `folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_membership_profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `id_document_permission` int(1) DEFAULT NULL,
  `id_event_list` int(11) DEFAULT NULL,
  `id_employee_profile` int(11) DEFAULT NULL,
  `id_customer_profile` int(11) DEFAULT NULL,
  `id_project` int(11) DEFAULT NULL,
  `id_contract` int(11) DEFAULT NULL,
  `id_lead_profile` int(11) DEFAULT NULL,
  `id_standard_operation_procedure_set_up` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `folder`
-- ----------------------------
BEGIN;
INSERT INTO `folder` VALUES ('1', 'test', null, '1', '1', '2019-09-16 14:53:41', null, null, null, null, null, '1', null, null, null, null), ('2', 'Testing SOP Document', null, '1', '1', '2019-09-16 15:18:59', null, null, null, null, null, null, '1', null, null, null), ('3', 'testing', '', '1', '1', '2019-09-18 11:59:21', null, null, '1', null, null, null, null, null, null, null), ('4', 'emp', null, '1', '1', '2019-09-18 12:00:03', null, null, null, null, '1', null, null, null, null, null), ('5', 'Testing SOP Document', null, '1', '1', '2019-09-18 13:27:10', null, null, null, null, null, null, null, null, null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `hls_solutions`
-- ----------------------------
DROP TABLE IF EXISTS `hls_solutions`;
CREATE TABLE `hls_solutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `description` text,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `hr_approval_permission`
-- ----------------------------
DROP TABLE IF EXISTS `hr_approval_permission`;
CREATE TABLE `hr_approval_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approver_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `hr_approval_permission`
-- ----------------------------
BEGIN;
INSERT INTO `hr_approval_permission` VALUES ('4', '2', '2019-09-21', '1', null, null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `hr_approval_permission_data`
-- ----------------------------
DROP TABLE IF EXISTS `hr_approval_permission_data`;
CREATE TABLE `hr_approval_permission_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hr_approval_permission_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `hr_approval_permission_data`
-- ----------------------------
BEGIN;
INSERT INTO `hr_approval_permission_data` VALUES ('31', '2', '1'), ('32', '2', '2'), ('46', '4', '1'), ('47', '4', '2');
COMMIT;

-- ----------------------------
--  Table structure for `hr_approval_permission_department`
-- ----------------------------
DROP TABLE IF EXISTS `hr_approval_permission_department`;
CREATE TABLE `hr_approval_permission_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hr_approval_permission_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `hr_approval_permission_department`
-- ----------------------------
BEGIN;
INSERT INTO `hr_approval_permission_department` VALUES ('7', '2', '2'), ('8', '2', '3'), ('11', '4', '2'), ('12', '4', '3');
COMMIT;

-- ----------------------------
--  Table structure for `invoice_status`
-- ----------------------------
DROP TABLE IF EXISTS `invoice_status`;
CREATE TABLE `invoice_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `css_class` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `invoice_status`
-- ----------------------------
BEGIN;
INSERT INTO `invoice_status` VALUES ('1', 'PAID', 'label-info', '1'), ('2', 'OVERDUE', 'label-warning', '1'), ('3', 'PARTIALLY PAID', 'label-success', '1'), ('4', 'UNPAID', 'label-mint', '1'), ('5', 'VOIDED', 'label-danger', '1');
COMMIT;

-- ----------------------------
--  Table structure for `item`
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `long_description` text,
  `short_description` varchar(255) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT '0.00',
  `setup_fee` decimal(10,2) DEFAULT '0.00',
  `id_tax` int(11) DEFAULT NULL,
  `id_group` int(11) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `item`
-- ----------------------------
BEGIN;
INSERT INTO `item` VALUES ('1', 'eO-BMS (Standard)', '22', '2222', '22.00', '0.00', null, '1', null, '1', '1', '2019-09-17 09:28:22', '1', '2019-09-16 09:10:24');
COMMIT;

-- ----------------------------
--  Table structure for `item_data`
-- ----------------------------
DROP TABLE IF EXISTS `item_data`;
CREATE TABLE `item_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) DEFAULT NULL,
  `id_data` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `item_group`
-- ----------------------------
DROP TABLE IF EXISTS `item_group`;
CREATE TABLE `item_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(11) DEFAULT NULL,
  `main_logo` varchar(255) DEFAULT NULL,
  `description` text,
  `inclusive_benefit` text,
  `plan_detail` text,
  `setup_label` varchar(255) DEFAULT NULL,
  `order_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `item_group`
-- ----------------------------
BEGIN;
INSERT INTO `item_group` VALUES ('1', 'www', 'eo', '2019-09-16 09:29:38', '1', '1', '2019-09-18 14:39:16', '1', '10', '', '', null, null, null), ('2', 'test12', 'sdf', '2019-09-18 14:52:41', null, '1', null, '1', null, '', '', null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `item_group_data`
-- ----------------------------
DROP TABLE IF EXISTS `item_group_data`;
CREATE TABLE `item_group_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_type` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `item_group_department`
-- ----------------------------
DROP TABLE IF EXISTS `item_group_department`;
CREATE TABLE `item_group_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item_group` int(11) DEFAULT NULL,
  `id_department` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `item_group_template_detail`
-- ----------------------------
DROP TABLE IF EXISTS `item_group_template_detail`;
CREATE TABLE `item_group_template_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item_group` int(11) DEFAULT NULL,
  `id_item_group_type` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `item_group_template_detail`
-- ----------------------------
BEGIN;
INSERT INTO `item_group_template_detail` VALUES ('5', '1', null, '', ''), ('6', '2', null, '', '');
COMMIT;

-- ----------------------------
--  Table structure for `item_group_type`
-- ----------------------------
DROP TABLE IF EXISTS `item_group_type`;
CREATE TABLE `item_group_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `item_group_type`
-- ----------------------------
BEGIN;
INSERT INTO `item_group_type` VALUES ('1', 'Essential', '1', '1', '2019-09-18 10:01:37', null, null), ('2', 'Main Feature', '1', '1', '2019-09-18 10:01:40', null, null), ('3', 'Support', '1', '1', '2019-09-18 10:01:45', null, null), ('4', 'Hosting', '1', '1', '2019-09-18 10:01:49', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `knowledge_base`
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_base`;
CREATE TABLE `knowledge_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varbinary(255) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  `internal_article` tinyint(1) DEFAULT NULL COMMENT '1= yes, 0 = No',
  `disabled` tinyint(1) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `short_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `knowledge_base_position`
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_base_position`;
CREATE TABLE `knowledge_base_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_knowledge_base` int(11) DEFAULT NULL,
  `id_position` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `lead_profile`
-- ----------------------------
DROP TABLE IF EXISTS `lead_profile`;
CREATE TABLE `lead_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_name` varchar(250) DEFAULT NULL,
  `company_name` varchar(250) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `latitute` decimal(16,10) DEFAULT NULL,
  `longitute` decimal(16,10) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `id_country` int(11) DEFAULT NULL,
  `id_city` int(11) DEFAULT NULL,
  `group_names` varchar(250) DEFAULT NULL,
  `billing_address` varchar(250) DEFAULT NULL,
  `id_billing_city` int(11) DEFAULT NULL,
  `id_billing_country` int(11) DEFAULT NULL,
  `shipping_address` varchar(250) DEFAULT NULL,
  `id_shipping_city` int(11) DEFAULT NULL,
  `id_shipping_country` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `zip_code` varchar(50) DEFAULT NULL,
  `customer_status` int(1) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `id_source` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `star_rating` decimal(10,2) DEFAULT NULL,
  `id_customer_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `lead_profile`
-- ----------------------------
BEGIN;
INSERT INTO `lead_profile` VALUES ('1', 'Peter', 'EOH', '0987654321', 'peter@eoh.com', null, null, 'SR', null, null, null, '', null, null, '', null, null, '1', '1', '2019-09-16 08:15:51', null, '2019-09-16 10:28:03', '1', '', '6', null, null, '', null, '1'), ('2', 'dfb', 'fvd', '', 'dfg@gmail.cp', null, null, 'fdgd', null, null, null, '', null, null, '', null, null, '1', '1', '2019-09-16 13:25:57', null, '2019-09-16 13:26:59', '1', '', '1', null, null, '', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `lead_profile_note`
-- ----------------------------
DROP TABLE IF EXISTS `lead_profile_note`;
CREATE TABLE `lead_profile_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(11) DEFAULT NULL,
  `id_lead_profile` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `lead_profile_note`
-- ----------------------------
BEGIN;
INSERT INTO `lead_profile_note` VALUES ('1', 'testing note\r\n', '2019-09-16 14:06:12', null, '1', null, null, '2');
COMMIT;

-- ----------------------------
--  Table structure for `leave_application`
-- ----------------------------
DROP TABLE IF EXISTS `leave_application`;
CREATE TABLE `leave_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_approver` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL,
  `is_half_day` tinyint(1) DEFAULT NULL,
  `id_leave_type_name` int(11) DEFAULT NULL,
  `leave_reason` varchar(255) DEFAULT NULL,
  `reject_reason` varchar(255) DEFAULT NULL,
  `id_leave_status` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `number_of_day` int(11) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `address_during_leave` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `leave_application`
-- ----------------------------
BEGIN;
INSERT INTO `leave_application` VALUES ('1', '2', '2019-08-27', '2019-08-28', '13', '2', '0', '1', 'testing te', 'testing reject', '2', '1', '2019-09-18 14:50:15', '3', '2019-09-23 13:59:45', null, null, null), ('2', '2', '2019-09-03', '2019-09-17', null, '1', '0', '6', 'testing te', '', '2', '2', '2019-09-23 10:47:16', '3', '2019-09-23 13:28:32', null, null, null), ('3', null, '2019-09-03', '2019-09-05', null, '2', '1', '1', 'testing tesss', '', '1', '3', '2019-09-23 13:03:02', null, null, null, null, null), ('4', null, '2019-09-11', '2019-09-12', null, '1', '0', '3', '333', null, '1', '2', '2019-09-23 13:15:27', null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `leave_in_the_year`
-- ----------------------------
DROP TABLE IF EXISTS `leave_in_the_year`;
CREATE TABLE `leave_in_the_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varbinary(255) DEFAULT NULL,
  `id_year_list` int(11) DEFAULT NULL,
  `id_month_list` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `leave_in_the_year_data`
-- ----------------------------
DROP TABLE IF EXISTS `leave_in_the_year_data`;
CREATE TABLE `leave_in_the_year_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_leave_in_the_year` int(11) DEFAULT NULL,
  `leave_type_value` int(11) DEFAULT NULL,
  `id_leave_type` int(11) DEFAULT NULL,
  `id_month_list` int(11) DEFAULT NULL,
  `id_year_list` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `leave_monthly`
-- ----------------------------
DROP TABLE IF EXISTS `leave_monthly`;
CREATE TABLE `leave_monthly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_employee` int(11) DEFAULT NULL,
  `id_month` int(11) DEFAULT NULL,
  `id_year` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `leave_monthly`
-- ----------------------------
BEGIN;
INSERT INTO `leave_monthly` VALUES ('4', '1', '1', '2', '1', null, null, '1', '2019-10-03 17:04:19');
COMMIT;

-- ----------------------------
--  Table structure for `leave_monthly_data`
-- ----------------------------
DROP TABLE IF EXISTS `leave_monthly_data`;
CREATE TABLE `leave_monthly_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_leave_monthly` int(11) DEFAULT NULL,
  `id_leave_type` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `leave_monthly_data`
-- ----------------------------
BEGIN;
INSERT INTO `leave_monthly_data` VALUES ('14', '4', '1', '2.00', '2019-10-02');
COMMIT;

-- ----------------------------
--  Table structure for `leave_role`
-- ----------------------------
DROP TABLE IF EXISTS `leave_role`;
CREATE TABLE `leave_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(250) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `leave_role`
-- ----------------------------
BEGIN;
INSERT INTO `leave_role` VALUES ('1', 'Maximum of leaving Day. ', '11', '2017-12-13 17:33:19', '1', '11', '2017-12-13 17:33:19');
COMMIT;

-- ----------------------------
--  Table structure for `leave_setup`
-- ----------------------------
DROP TABLE IF EXISTS `leave_setup`;
CREATE TABLE `leave_setup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_month` int(11) DEFAULT NULL,
  `id_year` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `leave_setup`
-- ----------------------------
BEGIN;
INSERT INTO `leave_setup` VALUES ('3', '2', '1', '1', null, null, '1', '2019-10-03 16:06:42'), ('4', '1', '1', '1', null, null, '1', '2019-10-03 17:01:37'), ('5', '3', '1', '1', '1', '2019-10-04 09:12:08', '1', '2019-10-03 17:02:56');
COMMIT;

-- ----------------------------
--  Table structure for `leave_setup_data`
-- ----------------------------
DROP TABLE IF EXISTS `leave_setup_data`;
CREATE TABLE `leave_setup_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_leave_setup` int(11) DEFAULT NULL,
  `id_leave_type` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `leave_setup_data`
-- ----------------------------
BEGIN;
INSERT INTO `leave_setup_data` VALUES ('13', '3', '1', '1.00'), ('14', '4', '1', '0.00'), ('16', '5', '1', '1.00'), ('17', '5', '2', '2.00'), ('18', '5', '3', '3.00'), ('19', '5', '4', '0.00'), ('20', '5', '5', '0.00'), ('21', '5', '6', '0.00'), ('22', '5', '7', '0.00'), ('23', '5', '8', '0.00'), ('24', '5', '9', '0.00'), ('25', '5', '10', '0.00');
COMMIT;

-- ----------------------------
--  Table structure for `leave_status`
-- ----------------------------
DROP TABLE IF EXISTS `leave_status`;
CREATE TABLE `leave_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `css` varchar(255) DEFAULT NULL,
  `approve_status_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `leave_status`
-- ----------------------------
BEGIN;
INSERT INTO `leave_status` VALUES ('1', 'label-warning', 'Pending'), ('2', 'label-success', 'Approved'), ('3', 'label-danger', 'Rejected');
COMMIT;

-- ----------------------------
--  Table structure for `leave_type_condition`
-- ----------------------------
DROP TABLE IF EXISTS `leave_type_condition`;
CREATE TABLE `leave_type_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(250) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `leave_type_condition`
-- ----------------------------
BEGIN;
INSERT INTO `leave_type_condition` VALUES ('1', 'Paid', '11', '2017-12-13 17:32:50', '1', '11', '2017-12-13 17:32:50'), ('2', 'Unpaid', '11', '2017-12-13 17:32:56', '1', '11', '2017-12-13 17:32:56'), ('3', 'Compensatory Off', '11', '2017-12-13 17:33:01', '1', '11', '2017-12-13 17:33:01'), ('4', 'On Duty', '11', '2017-12-13 17:33:06', '1', '11', '2017-12-13 17:33:06');
COMMIT;

-- ----------------------------
--  Table structure for `leave_type_name`
-- ----------------------------
DROP TABLE IF EXISTS `leave_type_name`;
CREATE TABLE `leave_type_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(250) NOT NULL,
  `shortcut` varchar(255) DEFAULT NULL,
  `css_style` varchar(255) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `leave_type_name`
-- ----------------------------
BEGIN;
INSERT INTO `leave_type_name` VALUES ('1', 'WORKING DAY', 'WD', '#1eb1ed', '1', '2018-12-03 13:05:31', '1', '11', '2017-12-13 17:32:17'), ('2', 'DAY OFF', 'OFF', '#1072bd', '11', '2017-12-13 17:32:36', '1', '11', '2017-12-13 17:32:36'), ('3', 'HALF PUBLIC HOLIDAY', 'HPH', '#e06b21', '1', '2018-12-03 13:05:56', '1', '11', '2017-12-13 17:32:41'), ('4', 'PUBLIC HOLIDAY', 'PH', '#964714', '1', '2018-12-03 13:06:01', '1', '1', '2018-12-03 13:06:01'), ('5', 'HALF ANNUAL LEAVE', 'HAL', '#8eb5e0', '1', '2018-12-03 13:06:16', '1', '1', '2018-12-03 13:06:16'), ('6', 'ANNUAL LEAVE', 'AL', '#568ed3', '1', '2018-12-03 13:06:23', '1', '1', '2018-12-03 13:06:23'), ('7', 'HALF DAY SICK LEAVE', 'HSL', '#fdbf2d', null, null, '1', null, null), ('8', 'SICK LEAVE', 'SL', '#fffd38', null, null, '1', null, null), ('9', 'ABSENCE', 'ABS', '#6f359e', null, null, '1', null, null), ('10', 'LATE', 'L', '#fc0d1b', null, null, '1', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `marital_status`
-- ----------------------------
DROP TABLE IF EXISTS `marital_status`;
CREATE TABLE `marital_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(250) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `marital_status`
-- ----------------------------
BEGIN;
INSERT INTO `marital_status` VALUES ('1', 'Single', null, null, '1', '1', '2019-04-22 08:44:08'), ('2', 'Married', null, null, '1', '1', '2019-04-22 08:46:07'), ('3', 'Widowed', null, null, '1', '1', '2019-04-22 08:46:30'), ('4', 'Divorced', null, null, '1', '1', '2019-04-22 08:47:16');
COMMIT;

-- ----------------------------
--  Table structure for `membership_document`
-- ----------------------------
DROP TABLE IF EXISTS `membership_document`;
CREATE TABLE `membership_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_membership_profile` int(11) NOT NULL,
  `document_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_size` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uploaded_date` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `membership_event`
-- ----------------------------
DROP TABLE IF EXISTS `membership_event`;
CREATE TABLE `membership_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_membership_profile` int(11) NOT NULL,
  `id_event_list` int(11) NOT NULL,
  `number_of_audient` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address_line_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_country` int(11) DEFAULT NULL,
  `id_city` int(11) DEFAULT NULL,
  `id_province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefix_phone_code` int(11) DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefix_phone_code_line_2` int(11) DEFAULT NULL,
  `phone_number_line_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `id_payment_type` int(11) DEFAULT NULL,
  `id_payment_method` int(11) DEFAULT NULL,
  `member_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paid` decimal(10,2) DEFAULT NULL,
  `event_fee` decimal(10,2) DEFAULT NULL,
  `approval_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `membership_payment`
-- ----------------------------
DROP TABLE IF EXISTS `membership_payment`;
CREATE TABLE `membership_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_membership_profile` int(11) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `paid` decimal(10,2) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `id_payment_type` int(11) DEFAULT NULL,
  `id_payment_method` int(11) DEFAULT NULL,
  `id_membership_type` int(11) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `id_payment_for` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `membership_profile`
-- ----------------------------
DROP TABLE IF EXISTS `membership_profile`;
CREATE TABLE `membership_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_prefix` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `passport_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nationality` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address_line_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_country` int(11) DEFAULT NULL,
  `id_city` int(11) DEFAULT NULL,
  `id_province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marital_status` int(2) DEFAULT NULL,
  `prefix_phone_code` int(11) DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefix_phone_code_line_2` int(11) DEFAULT NULL,
  `phone_number_line_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_person` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mot_licence_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year_of_establishment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_of_business` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `confirm_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `membership_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `membership_type`
-- ----------------------------
DROP TABLE IF EXISTS `membership_type`;
CREATE TABLE `membership_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membership_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `membership_type`
-- ----------------------------
BEGIN;
INSERT INTO `membership_type` VALUES ('1', 'Diamond', 'sdfsd', '2019-04-18 08:57:41', '1', '2019-04-18 08:57:41', '1', '1'), ('2', 'Gold', '', '2019-04-18 10:36:33', '1', '2019-04-18 10:36:33', '1', '1'), ('4', 'Silver', '', '2019-04-18 14:02:07', '1', '2019-04-22 11:05:15', '1', '1'), ('5', 'Brone', '', '2019-04-18 14:03:38', '1', '2019-04-18 14:12:47', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `migration`
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `migration`
-- ----------------------------
BEGIN;
INSERT INTO `migration` VALUES ('m000000_000000_base', '1552447078'), ('m130524_201442_init', '1552447085');
COMMIT;

-- ----------------------------
--  Table structure for `milestone_data`
-- ----------------------------
DROP TABLE IF EXISTS `milestone_data`;
CREATE TABLE `milestone_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_milestone_type` int(11) DEFAULT NULL,
  `id_project` int(11) DEFAULT NULL,
  `id_task` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `month_list`
-- ----------------------------
DROP TABLE IF EXISTS `month_list`;
CREATE TABLE `month_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `month_list`
-- ----------------------------
BEGIN;
INSERT INTO `month_list` VALUES ('1', 'January'), ('2', 'February'), ('3', 'March'), ('4', 'April'), ('5', 'May'), ('6', 'June'), ('7', 'July'), ('8', 'August'), ('9', 'September'), ('10', 'October'), ('11', 'November'), ('12', 'December');
COMMIT;

-- ----------------------------
--  Table structure for `pay_period`
-- ----------------------------
DROP TABLE IF EXISTS `pay_period`;
CREATE TABLE `pay_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `pay_period`
-- ----------------------------
BEGIN;
INSERT INTO `pay_period` VALUES ('1', '1 month'), ('2', '2 months'), ('3', '3 months'), ('4', '4 months'), ('5', '5 months'), ('6', '6 months');
COMMIT;

-- ----------------------------
--  Table structure for `payment_for`
-- ----------------------------
DROP TABLE IF EXISTS `payment_for`;
CREATE TABLE `payment_for` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(250) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `payment_for`
-- ----------------------------
BEGIN;
INSERT INTO `payment_for` VALUES ('1', 'Membership', null, null, '1', '1', '2019-05-17 11:19:01'), ('2', 'Event', null, null, '1', '1', '2019-05-17 11:19:11');
COMMIT;

-- ----------------------------
--  Table structure for `payment_method`
-- ----------------------------
DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE `payment_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(250) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `payment_method`
-- ----------------------------
BEGIN;
INSERT INTO `payment_method` VALUES ('1', 'Cash', '1', '2019-04-23 15:34:27', '1', '11', '2017-12-13 17:20:12'), ('2', 'Transfer Money', '11', '2017-12-13 17:20:18', '1', '11', '2017-12-13 17:20:18'), ('3', 'Cheque', '11', '2017-12-13 17:20:24', '1', '11', '2017-12-13 17:20:24'), ('5', 'E-payment', '11', '2017-12-13 17:20:29', '1', '11', '2017-12-13 17:20:29'), ('6', 'POS Credit Card', '35', '2018-08-11 19:23:31', '1', '35', '2018-08-11 19:23:31');
COMMIT;

-- ----------------------------
--  Table structure for `payment_status`
-- ----------------------------
DROP TABLE IF EXISTS `payment_status`;
CREATE TABLE `payment_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(250) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `payment_status`
-- ----------------------------
BEGIN;
INSERT INTO `payment_status` VALUES ('1', 'Paid', '1', '2019-06-03 11:34:41', '1', '1', '2019-05-17 08:50:14'), ('2', 'Pending', null, null, '1', '1', '2019-05-17 08:50:26'), ('3', 'Overdue', null, null, '1', '1', '2019-05-17 08:50:35'), ('4', 'Expired', '1', '2019-06-03 11:35:57', '1', '1', '2019-05-17 08:50:47');
COMMIT;

-- ----------------------------
--  Table structure for `payment_type`
-- ----------------------------
DROP TABLE IF EXISTS `payment_type`;
CREATE TABLE `payment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(250) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `payment_type`
-- ----------------------------
BEGIN;
INSERT INTO `payment_type` VALUES ('1', 'Pre-payment', '1', '2019-07-03 13:30:09', '1', '11', '2017-12-13 17:20:41'), ('2', 'Cash on Arrival', '1', '2019-07-03 13:30:40', '1', '11', '2017-12-13 17:20:46'), ('3', 'Before check out', '1', '2019-07-03 13:30:45', '1', '11', '2017-12-13 17:20:52'), ('4', 'Credit', '1', '2019-07-03 13:30:48', '1', '11', '2017-12-13 17:20:59'), ('5', 'Deposit', '1', '2019-07-03 13:31:03', '1', '11', '2017-12-13 17:21:05');
COMMIT;

-- ----------------------------
--  Table structure for `payroll`
-- ----------------------------
DROP TABLE IF EXISTS `payroll`;
CREATE TABLE `payroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_payroll_request` int(11) DEFAULT NULL,
  `doc_id` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `pay_for` int(11) DEFAULT NULL,
  `total_net_pay` decimal(10,2) DEFAULT NULL,
  `chart_of_account` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `amount_in_word` varchar(255) DEFAULT NULL,
  `chart_of_account_option` int(11) DEFAULT NULL,
  `amount_option` decimal(10,2) DEFAULT NULL,
  `amount_in_word_option` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `payroll_data`
-- ----------------------------
DROP TABLE IF EXISTS `payroll_data`;
CREATE TABLE `payroll_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_payroll` int(11) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `payroll_request`
-- ----------------------------
DROP TABLE IF EXISTS `payroll_request`;
CREATE TABLE `payroll_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `id_year` int(11) DEFAULT NULL,
  `id_month` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `id_prepared_by` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `grand_total_basic_salary` decimal(10,2) DEFAULT NULL,
  `grand_total_probation_pass_amount` decimal(10,2) DEFAULT NULL,
  `grand_total_probation_working_day` int(11) DEFAULT NULL,
  `grand_total_probation_per_day_amount` decimal(10,2) DEFAULT NULL,
  `grand_total_probation_pass_total_amount` decimal(10,2) DEFAULT NULL,
  `grand_total_absent` int(11) DEFAULT NULL,
  `grand_total_absent_deduct_amount` decimal(10,2) DEFAULT NULL,
  `grand_total_advance_deduct_amount` decimal(10,2) DEFAULT NULL,
  `grand_total_increase_amount` decimal(10,2) DEFAULT NULL,
  `grand_total_other_amount` decimal(10,2) DEFAULT NULL,
  `grand_total_balance_amount` decimal(10,2) DEFAULT NULL,
  `grand_total_service_charge_amount` decimal(10,2) DEFAULT NULL,
  `grand_total_bonus_amount` decimal(10,2) DEFAULT NULL,
  `grand_total_net_pay_amount` decimal(10,2) DEFAULT NULL,
  `grand_total_tip_amount` decimal(10,2) DEFAULT NULL,
  `grand_total_total_net_pay_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `payroll_request`
-- ----------------------------
BEGIN;
INSERT INTO `payroll_request` VALUES ('1', '2019-09-17', '1', '9', null, '1', '3', null, null, '1', '2019-09-17 11:11:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `payroll_request_data`
-- ----------------------------
DROP TABLE IF EXISTS `payroll_request_data`;
CREATE TABLE `payroll_request_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_payroll_request` int(11) DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL,
  `basic_salary` decimal(10,2) DEFAULT NULL,
  `probation_pass_amount` decimal(10,2) DEFAULT NULL,
  `probation_working_day` int(11) DEFAULT NULL,
  `probation_per_day_amount` decimal(10,2) DEFAULT NULL,
  `probation_pass_total_amount` decimal(10,2) DEFAULT NULL,
  `absent` int(11) DEFAULT NULL,
  `absent_deduct_amount` decimal(10,2) DEFAULT NULL,
  `advance_deduct_amount` decimal(10,2) DEFAULT NULL,
  `increase_amount` decimal(10,2) DEFAULT NULL,
  `other_amount` decimal(10,2) DEFAULT NULL,
  `balance_amount` decimal(10,2) DEFAULT NULL,
  `service_charge_amount` decimal(10,2) DEFAULT NULL,
  `bonus_amount` decimal(10,2) DEFAULT NULL,
  `net_pay_amount` decimal(10,2) DEFAULT NULL,
  `id_payment_method` int(11) DEFAULT NULL,
  `tip_amount` decimal(10,2) DEFAULT NULL,
  `total_net_pay_amount` decimal(10,2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `payroll_request_status`
-- ----------------------------
DROP TABLE IF EXISTS `payroll_request_status`;
CREATE TABLE `payroll_request_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `css_class` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `payroll_request_status`
-- ----------------------------
BEGIN;
INSERT INTO `payroll_request_status` VALUES ('1', 'Approved', 'label label-info', '1'), ('2', 'Requested', 'label label-primary', '1'), ('3', 'Preparing', 'label label-danger', '1');
COMMIT;

-- ----------------------------
--  Table structure for `payroll_status`
-- ----------------------------
DROP TABLE IF EXISTS `payroll_status`;
CREATE TABLE `payroll_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `css_class` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `payroll_status`
-- ----------------------------
BEGIN;
INSERT INTO `payroll_status` VALUES ('1', 'Approved', 'label label-info', '1'), ('2', 'Paid', 'label label-primary', '1'), ('3', 'Rejected', 'label label-danger', '1'), ('4', 'Waiting for Approval', 'label label-mint', '1');
COMMIT;

-- ----------------------------
--  Table structure for `payroll_type`
-- ----------------------------
DROP TABLE IF EXISTS `payroll_type`;
CREATE TABLE `payroll_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `payroll_type`
-- ----------------------------
BEGIN;
INSERT INTO `payroll_type` VALUES ('1', 'Basic Salary', '1', null, null, null, null), ('2', 'Overtime', '1', null, null, null, null), ('3', 'Allowance', '1', null, null, null, null), ('4', 'Deduct', '1', null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `permission_action`
-- ----------------------------
DROP TABLE IF EXISTS `permission_action`;
CREATE TABLE `permission_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) DEFAULT NULL,
  `permission_menu_id` int(11) DEFAULT NULL,
  `is_show_menu` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1063 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `permission_action`
-- ----------------------------
BEGIN;
INSERT INTO `permission_action` VALUES ('840', '2', '1', null), ('841', '2', '23', null), ('842', '2', '44', null), ('843', '2', '20', null), ('844', '2', '24', null), ('845', '2', '64', null), ('846', '2', '31', null), ('847', '2', '33', null), ('848', '2', '45', null), ('849', '2', '28', null), ('850', '2', '32', null), ('851', '2', '43', null), ('852', '2', '21', null), ('853', '2', '63', null), ('854', '2', '30', null), ('855', '2', '25', null), ('856', '2', '39', null), ('857', '2', '29', null), ('858', '2', '38', null), ('859', '2', '40', null), ('860', '2', '57', null), ('861', '2', '60', null), ('862', '2', '58', null), ('863', '2', '59', null), ('864', '2', '52', null), ('865', '2', '22', null), ('866', '2', '55', null), ('867', '2', '35', null), ('868', '2', '54', null), ('869', '2', '6', null), ('893', '3', '1', null), ('894', '3', '20', null), ('895', '3', '21', null), ('896', '3', '63', null), ('897', '3', '57', null), ('898', '3', '59', null), ('899', '3', '60', null), ('900', '3', '58', null), ('901', '3', '50', null), ('902', '3', '55', null), ('903', '3', '22', null), ('904', '3', '35', null), ('905', '3', '6', null), ('906', '4', '1', null), ('907', '4', '23', null), ('908', '4', '20', null), ('909', '4', '63', null), ('910', '4', '57', null), ('911', '4', '60', null), ('912', '4', '58', null), ('913', '4', '59', null), ('914', '4', '50', null), ('915', '4', '22', null), ('916', '4', '55', null), ('917', '4', '35', null), ('918', '4', '52', null), ('919', '4', '6', null), ('1014', '1', '1', null), ('1015', '1', '60', null), ('1016', '1', '44', null), ('1017', '1', '23', null), ('1018', '1', '20', null), ('1019', '1', '21', null), ('1020', '1', '63', null), ('1021', '1', '59', null), ('1022', '1', '54', null), ('1023', '1', '35', null), ('1024', '1', '6', null), ('1025', '1', '24', null), ('1026', '1', '33', null), ('1027', '1', '43', null), ('1028', '1', '31', null), ('1029', '1', '49', null), ('1030', '1', '29', null), ('1031', '1', '30', null), ('1032', '1', '25', null), ('1033', '1', '51', null), ('1034', '1', '42', null), ('1035', '1', '50', null), ('1036', '1', '22', null), ('1037', '1', '55', null), ('1038', '1', '52', null), ('1039', '1', '56', null), ('1040', '1', '27', null), ('1041', '1', '48', null), ('1042', '1', '41', null), ('1043', '1', '46', null), ('1044', '1', '8', null), ('1045', '1', '58', null), ('1046', '1', '13', null), ('1047', '1', '17', null), ('1048', '1', '34', null), ('1049', '1', '28', null), ('1050', '1', '32', null), ('1051', '1', '64', null), ('1052', '1', '45', null), ('1053', '1', '38', null), ('1054', '1', '39', null), ('1055', '1', '40', null), ('1056', '1', '11', null), ('1057', '1', '47', null), ('1058', '1', '62', null), ('1059', '1', '66', null), ('1060', '1', '65', null), ('1061', '1', '67', null), ('1062', '1', '69', null);
COMMIT;

-- ----------------------------
--  Table structure for `permission_action_data`
-- ----------------------------
DROP TABLE IF EXISTS `permission_action_data`;
CREATE TABLE `permission_action_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_permission_action` int(11) DEFAULT NULL,
  `allow_action` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `permission_menu`
-- ----------------------------
DROP TABLE IF EXISTS `permission_menu`;
CREATE TABLE `permission_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_parent` tinyint(1) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `menu_name` varchar(100) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `menu_icon` varchar(50) DEFAULT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `css_class` varchar(500) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `contoller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `extra_action` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `permission_menu`
-- ----------------------------
BEGIN;
INSERT INTO `permission_menu` VALUES ('1', '1', '0', 'Dashboard', '1', 'demo-pli-home', '/', 'index dashboard', '1', 'site', 'index', 'index,create,view,update,delete'), ('2', '1', '0', 'Subscriber', null, 'fa fa-group', 'membership-profile/subscriber', 'membership-profile-subscriber membership-profile-subscriber membership-payment-subscriber membership-event-subscriber membership-document-subscriber', '0', 'membership-profile', 'subscriber', 'index,create,view,update,delete'), ('3', '1', '0', 'Event', null, 'fa fa-calendar', 'event-list/index', 'event-list-index', '0', 'event-list', 'index', 'index,create,view,update,delete'), ('4', '1', '0', 'Task', null, 'fa fa-tasks', 'membership-event/task', 'membership-event-task', '0', 'event-list', 'index', 'index,create,view,update,delete'), ('5', '1', '0', 'Payment', null, 'demo-pli-coin', 'membership-payment/payment', 'membership-payment-payment', '0', 'membership-payment', 'payment', 'index,create,view,update,delete'), ('6', '1', '0', 'Document', '11', 'fa fa-file-text-o', 'document/index', 'document-index document-subscriber', '1', 'document', 'index', 'index,create,view,update,delete,,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download'), ('7', '1', '0', 'User', '0', 'demo-pli-male icon-fw', 'user/index', 'user-index', '0', 'user', 'index', 'index,create,view,update,delete'), ('8', '1', '0', 'Setup', '16', 'demo-pli-gear icon-lg icon-fw', '#', 'leave-setup-index item-group-type-index supplier-profile-type-index working-group-index company-profile-index payment-status-index data-option-phone-country-code-index data-option-prefix-index marital-status-index country-index city-index payment-method-index user-type-index department-index employee-position-index bank-index chart-account-index item-group-data-index item-index item-group-index contract-type-index account-type-index standard-operation-step-index hr-approval-permission-index', '1', null, null, 'index,create,view,update,delete'), ('9', '0', '8', 'Payment Status', '0', null, 'payment-status/index', 'payment-status-index', '0', 'payment-status', 'index', 'index,create,view,update,delete'), ('10', '0', '8', 'Payment For', '0', null, 'payment-for/index', 'payment-for-index', '0', 'payment-for', 'index', 'index,create,view,update,delete'), ('11', '0', '8', 'Position', '12', null, 'employee-position/index', 'employee-position-index', '1', 'employee-position', 'index', 'index,create,view,update,delete'), ('12', '0', '8', 'Permission', '0', null, 'permission/index', 'permission-index', '0', 'permission', 'index', 'index,create,view,update,delete'), ('13', '0', '8', 'Prefix', '2', null, 'data-option-prefix/index', 'data-option-prefix-index', '1', 'data-option-prefix', 'index', 'index,create,view,update,delete'), ('14', '0', '8', 'Phone country code', '0', null, 'data-option-phone-country-code/index', 'data-option-phone-country-code-index', '0', 'data-option-phone-country-code', 'index', 'index,create,view,update,delete'), ('15', '0', '8', 'Marital Status', '0', null, 'marital-status/index', 'marital-status-index', '0', 'marital-status', 'index', 'index,create,view,update,delete'), ('16', '0', '8', 'Country', '0', null, 'country/index', 'country-index', '0', 'country', 'index', 'index,create,view,update,delete'), ('17', '0', '8', 'City', '3', null, 'city/index', 'city-index', '1', 'city', 'index', 'index,create,view,update,delete'), ('18', '0', '8', 'Payment Type', '0', null, 'payment-type/index', 'payment-type-index', '0', 'payment-type', 'index', 'index,create,view,update,delete'), ('19', '0', '8', 'Payment Method', '0', null, 'payment-method/index', 'payment-method-index', '0', 'payment-method', 'index', 'index,create,view,update,delete'), ('20', '1', '0', 'Projects', '5', 'fa fa-cubes', 'project/index', 'project-index', '1', 'project', 'index', 'index,create,view,update,delete,overview,task,copy,timesheet,sale-invoice,sale-payment,sale-quotation,dependent-get-customer-info,sale-expense,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download,note,pin'), ('21', '1', '0', 'Tasks', '6', 'fa fa-tasks', 'task/index', 'task-index', '1', 'task', 'index', 'index,create,view,update,delete,copy'), ('22', '0', '50', 'Employee', '1', '', 'employee-profile/index', 'employee-profile-index', '1', 'employee-profile', 'index', 'index,create,view,update,delete,profile,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download,get-department'), ('23', '1', '0', 'Customer', '4', 'fa fa-user-o', 'customer-profile/index', 'customer-profile-index', '1', 'customer-profile', 'index', 'index,create,view,update,delete,import-csv,download-sample-csv,profile,solution,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download'), ('24', '1', '0', 'Sales', '12', 'fa fa-balance-scale', '#', 'quotation-index proposal-index contract-index', '1', 'sale', 'index', 'index,create,view,update,delete'), ('25', '0', '49', 'Expense', '3', 'fa fa-file-text-o', 'expense/index', 'expense-index', '1', 'expense', 'index', 'index,create,view,update,delete'), ('27', '1', '0', 'Report', '15', 'fa fa-area-chart', 'report/index', 'finance-chart-of-account-index index employee-report-report', '1', 'report', 'index', 'index,create,view,update,delete,report'), ('28', '0', '8', 'Items', '5', null, 'item/index', 'item-index', '1', 'item', 'index', 'index,create,view,update,delete'), ('29', '0', '49', 'Invoices', '1', null, 'customer-invoice/index', 'customer-invoice-index customer-invoice-view', '1', 'customer-invoice', 'index', 'index,create,view,update,delete,void,validation-payment'), ('30', '0', '49', 'Payments', '2', null, 'customer-payment/index', 'customer-payment-index customer-payment-view', '1', 'customer-payment', 'index', 'index,create,view,update,delete'), ('31', '0', '24', 'Contracts', '3', null, 'contract/index', 'contract-index', '1', 'contract', 'index', 'index,create,view,update,delete,detail,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download,overview'), ('32', '0', '8', 'Item Group', '6', null, 'item-group/index', 'item-group-index', '1', 'item-group', 'index', 'index,create,view,update,delete'), ('33', '0', '24', 'Proposal', '1', null, 'proposal/index', 'proposal-index', '1', 'proposal', 'index', 'index,create,view,update,delete,overview,note,dependent-get-customer-info'), ('34', '0', '8', 'Company Profile', '4', null, 'company-profile/index', 'company-profile-index', '1', 'company-profile', 'index', 'index,create,view,update,delete'), ('35', '1', '0', 'Knowledge Base', '10', 'fa fa-file-text-o', 'knowledge-base/index', 'knowledge-base-index', '1', 'knowledge-base', 'index', 'index,create,view,update,delete,article'), ('38', '0', '8', 'Account Type', '9', null, 'account-type/index', 'account-type-index', '1', 'account-type', null, 'index,create,view,update,delete'), ('39', '0', '8', 'Chart of Account', '10', null, 'chart-account/index', 'chart-account-index', '1', 'chart-account', null, 'index,create,view,update,delete'), ('40', '0', '8', 'Bank', '11', null, 'bank/index', 'bank-index', '1', 'bank', null, 'index,create,view,update,delete'), ('41', '0', '27', 'Chart of Account', '0', null, 'finance-chart-of-account/index', 'finance-chart-of-account-index', '1', 'finance-chart-of-account', null, 'index,create,view,update,delete'), ('42', '0', '49', 'Supplier', '5', 'demo-pli-male-female', 'supplier-profile/index', 'supplier-profile-index', '1', 'supplier-profile', null, 'index,create,view,update,delete'), ('43', '0', '24', 'Quotation', '2', null, 'quotation/index', 'quotation-index', '1', 'quotation', 'index', 'index,create,view,update,delete,overview,pdf,dependent-get-customer-info,download'), ('44', '1', '0', 'Lead', '3', 'fa fa-tty', 'lead-profile/index', 'lead-profile-index', '1', 'lead-profile', 'index', 'index,create,view,update,delete,import-csv,download-sample-csv,profile,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download,convert-lead'), ('45', '0', '8', 'Contract Type', '8', null, 'contract-type/index', 'contract-type-index', '1', 'contract-type', 'index', 'index,create,view,update,delete'), ('46', '0', '27', 'Sale Report', '0', null, 'sale-report/invoice?smMenu=1', 'sale-report-invoice', '1', 'sale-report', 'invoice', 'index,create,view,update,delete,invoice,proposal,quotation'), ('47', '0', '8', 'Department', '13', null, 'department/index', 'department-index', '1', 'department', 'index', 'index,create,view,update,delete'), ('48', '0', '27', 'Employee Report', null, null, 'employee-report/report?smMenu=1', 'employee-report-project', '1', 'employee-report', 'project', 'index,create,view,update,delete,report,tasks,project'), ('49', '1', '0', 'Finance', '13', 'fa fa-money', '#', 'payroll-index customer-invoice-index customer-invoice-view  customer-payment-index customer-payment-view expense-index supplier-profile-index', '1', ' ', null, 'index,create,view,update,delete'), ('50', '1', '0', 'Human Resource', '14', 'demo-pli-address-book', '#', 'leave-monthly-index leave-in-the-year-index leave-application-index payroll-request-index payroll-type-index cash-advance-request-index employee-profile-index ', '1', 'hr', 'index', 'index,create,view,update,delete'), ('51', '0', '49', 'Payroll', '4', null, 'payroll/index', 'payroll-index', '1', 'payroll', 'index', 'index,create,view,update,delete'), ('52', '0', '50', 'Cash Advance Request', '3', null, 'cash-advance-request/index', 'cash-advance-request-index', '1', 'cash-advance-request', 'index', 'index,create,view,update,delete'), ('53', '0', '50', 'Payroll Type', '0', null, 'payroll-type/index', 'payroll-type-index', '0', 'payroll-type', 'index', 'index,create,view,update,delete'), ('54', '1', '0', 'Budget Setup', '9', 'demo-pli-coin', 'budget-set-up/index', 'budget-set-up-index', '1', 'budget-set-up', 'index', 'index,create,view,update,delete'), ('55', '0', '50', 'Leave Application', '2', null, 'leave-application/index', 'leave-application-index', '1', 'leave-application', 'index', 'index,create,view,update,delete'), ('56', '0', '50', 'Payroll Request', '4', null, 'payroll-request/index', 'payroll-request-index', '1', 'payroll-request', 'index', 'index,create,view,update,delete'), ('57', '1', '0', 'K.P.I', '8', 'demo-pli-tactic', 'standard-operation/index', 'standard-operation-index sop-goal-setup-index', '0', 'standard-operation', 'index', 'index,create,view,update,delete,form-view'), ('58', '0', '8', 'K.P.I Set Up', '1', null, 'standard-operation-step/index', 'standard-operation-step-index', '1', 'standard-operation-step', 'index', 'index,create,view,update,delete,form-view'), ('59', '1', '0', 'K.P.I', '8', 'demo-pli-tactic', 'sop-goal-setup/index', 'sop-goal-setup-index', '1', 'sop-goal-setup', 'index', 'index,create,view,update,delete'), ('60', '1', '0', 'Milestone', '2', 'fa fa-history', 'standard-operation/index', 'standard-operation-index', '1', 'standard-operation', 'index', 'index,create,view,update,delete,update-step-sop'), ('61', '0', '50', 'Leave Setup', '0', null, 'leave-in-the-year/index', 'leave-in-the-year-index', '0', 'leave-in-the-year', 'index', 'index,create,view,update,delete'), ('62', '0', '8', 'User Type & Roles', '13', 'demo-pli-computer-secure', 'user-type/index', 'user-type-index user-type-roles user-type-update', '1', 'user-type', 'index', 'index,create,view,update,delete,roles'), ('63', '1', '0', 'S.O.P', '7', 'demo-pli-receipt-4', 'standard-operation-procedure-set-up/index', 'standard-operation-procedure-set-up-index', '1', 'standard-operation-procedure-set-up', 'index', 'index,create,view,update,delete,sop-setup,,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download'), ('64', '0', '8', 'Item Group Data', '7', null, 'item-group-data/index', 'item-group-data-index', '1', 'item-group-data', 'index', 'index,create,view,update,delete,item'), ('65', '0', '8', 'Working Group', '20', null, 'working-group/index', 'working-group-index', '1', 'working-group', 'index', 'index,create,view,update,delete,item'), ('66', '0', '8', 'Supplier Type', '19', null, 'supplier-profile-type/index', 'supplier-profile-type-index', '1', 'supplier-profile-type', 'index', 'index,create,view,update,delete'), ('67', '0', '8', 'Customer Type', '22', null, 'customer-type/index', 'customer-type-index', '1', 'customer-type', 'index', 'index,create,view,update,delete'), ('68', '0', '8', 'Item Group Type', '6', null, 'item-group-type/index', 'item-group-type-index', '1', 'item-group-type', 'index', 'index,create,view,update,delete,item'), ('69', '0', '8', 'HR Approval Permission', '23', null, 'hr-approval-permission/index', 'hr-approval-permission-index', '1', 'hr-approval-permission', 'index', 'index,create,view,update,delete'), ('70', '0', '8', 'Leave Setup', '2', null, 'leave-setup/index', 'leave-setup-index', '1', 'leave-setup', 'index', 'index,create,view,update,delete'), ('71', '0', '50', 'Monthly Leave', '2', null, 'leave-monthly/index', 'leave-monthly-index', '1', 'leave-monthly', 'index', 'index,create,view,update,delete');
COMMIT;

-- ----------------------------
--  Table structure for `permission_menu_live`
-- ----------------------------
DROP TABLE IF EXISTS `permission_menu_live`;
CREATE TABLE `permission_menu_live` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_parent` tinyint(1) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `menu_name` varchar(100) DEFAULT NULL,
  `menu_icon` varchar(50) DEFAULT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `css_class` varchar(500) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `contoller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `extra_action` text,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `priority`
-- ----------------------------
DROP TABLE IF EXISTS `priority`;
CREATE TABLE `priority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `css_class` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `priority`
-- ----------------------------
BEGIN;
INSERT INTO `priority` VALUES ('1', 'Low', 'label-primary'), ('2', 'Medium', 'label-info'), ('3', 'High', 'label-warning'), ('4', 'Urgent', 'label-danger');
COMMIT;

-- ----------------------------
--  Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `is_calculate` tinyint(4) DEFAULT NULL,
  `project_progress` decimal(10,2) DEFAULT NULL,
  `id_billing_type` tinyint(1) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `estimated_hour` decimal(10,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `id_priority` int(11) DEFAULT NULL,
  `description` text,
  `cut_off_day` int(11) DEFAULT NULL,
  `note` text,
  `is_pin` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `project`
-- ----------------------------
BEGIN;
INSERT INTO `project` VALUES ('1', 'eOBMS - EOH', '1', '1', null, null, null, null, '2019-09-01', '2019-09-08', '2019-10-10', '1', '', '2', null, '0', '2', '1', '2019-09-18 13:57:20', '1', '2019-09-16 14:58:04');
COMMIT;

-- ----------------------------
--  Table structure for `project_member`
-- ----------------------------
DROP TABLE IF EXISTS `project_member`;
CREATE TABLE `project_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_project` int(11) DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `project_member`
-- ----------------------------
BEGIN;
INSERT INTO `project_member` VALUES ('1', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `project_note`
-- ----------------------------
DROP TABLE IF EXISTS `project_note`;
CREATE TABLE `project_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_project` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `project_status`
-- ----------------------------
DROP TABLE IF EXISTS `project_status`;
CREATE TABLE `project_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `css_class` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `project_status`
-- ----------------------------
BEGIN;
INSERT INTO `project_status` VALUES ('1', 'Not Started', 'label-mint'), ('2', 'In Progress', 'label-success'), ('3', 'On Hold', 'label-warning'), ('4', 'Cancelled', 'label-danger'), ('5', 'Finished', 'label-info');
COMMIT;

-- ----------------------------
--  Table structure for `project_tag`
-- ----------------------------
DROP TABLE IF EXISTS `project_tag`;
CREATE TABLE `project_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_project` int(11) DEFAULT NULL,
  `id_tag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `project_timesheet`
-- ----------------------------
DROP TABLE IF EXISTS `project_timesheet`;
CREATE TABLE `project_timesheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `start_time` varchar(20) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `end_time` varchar(20) DEFAULT NULL,
  `id_project` int(11) DEFAULT NULL,
  `id_task` int(11) DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `description` text,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `project_timesheet`
-- ----------------------------
BEGIN;
INSERT INTO `project_timesheet` VALUES ('1', '2019-09-16', '1:00 AM', '2019-09-16', '2:00 AM', '1', '5', null, 'test', '', '1', '1', '2019-09-16 15:12:39', '1', '2019-09-16 15:11:33');
COMMIT;

-- ----------------------------
--  Table structure for `project_timesheet_description`
-- ----------------------------
DROP TABLE IF EXISTS `project_timesheet_description`;
CREATE TABLE `project_timesheet_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_project_timesheet` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `project_timesheet_description`
-- ----------------------------
BEGIN;
INSERT INTO `project_timesheet_description` VALUES ('4', '1', '');
COMMIT;

-- ----------------------------
--  Table structure for `project_timesheet_member`
-- ----------------------------
DROP TABLE IF EXISTS `project_timesheet_member`;
CREATE TABLE `project_timesheet_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_project_timesheet` int(11) DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `project_timesheet_tag`
-- ----------------------------
DROP TABLE IF EXISTS `project_timesheet_tag`;
CREATE TABLE `project_timesheet_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_project_timesheet` int(11) DEFAULT NULL,
  `id_tag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `proposal`
-- ----------------------------
DROP TABLE IF EXISTS `proposal`;
CREATE TABLE `proposal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL COMMENT '1= lead 2 = customer',
  `date` date DEFAULT NULL,
  `open_till` date DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `discount_type` int(11) DEFAULT NULL,
  `allow_comment` tinyint(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `assigned` int(11) DEFAULT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `id_lead_customer` int(11) DEFAULT NULL,
  `id_discount` int(11) DEFAULT NULL,
  `discount_value` decimal(10,2) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `id_tax` int(11) DEFAULT NULL,
  `is_tax` tinyint(1) DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  `grand_total` decimal(10,2) DEFAULT NULL,
  `id_project` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `proposal`
-- ----------------------------
BEGIN;
INSERT INTO `proposal` VALUES ('1', 'test', '1', '2019-09-11', '2019-08-27', null, null, '1', '2', null, '', '', '', '', '', '', '', 'PRO19090001', '19.80', '2019-09-16 13:29:10', '1', '2019-09-17 08:51:50', '1', '1', '1', '10.00', '2.20', '1', '0', '0.00', '22.00', '19.80', null);
COMMIT;

-- ----------------------------
--  Table structure for `proposal_data`
-- ----------------------------
DROP TABLE IF EXISTS `proposal_data`;
CREATE TABLE `proposal_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_proposal` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `qty` int(11) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `discount_type` int(11) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `proposal_data`
-- ----------------------------
BEGIN;
INSERT INTO `proposal_data` VALUES ('4', '1', '1', 'eO-BMS (Standard)', '2222', '1', '22.00', '1', '0.00', '22.00');
COMMIT;

-- ----------------------------
--  Table structure for `proposal_note`
-- ----------------------------
DROP TABLE IF EXISTS `proposal_note`;
CREATE TABLE `proposal_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_proposal` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `proposal_related_to`
-- ----------------------------
DROP TABLE IF EXISTS `proposal_related_to`;
CREATE TABLE `proposal_related_to` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `proposal_related_to`
-- ----------------------------
BEGIN;
INSERT INTO `proposal_related_to` VALUES ('1', 'Customer', '1'), ('2', 'Lead', '1');
COMMIT;

-- ----------------------------
--  Table structure for `proposal_status`
-- ----------------------------
DROP TABLE IF EXISTS `proposal_status`;
CREATE TABLE `proposal_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `css_class` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `proposal_status`
-- ----------------------------
BEGIN;
INSERT INTO `proposal_status` VALUES ('1', 'Draft', 'label-default'), ('2', 'Sent', 'label-success'), ('3', 'Open', 'label-warning'), ('4', 'Revised', 'label-info'), ('5', 'Declined', 'label-danger'), ('6', 'Accepted', 'label-purple');
COMMIT;

-- ----------------------------
--  Table structure for `quotation`
-- ----------------------------
DROP TABLE IF EXISTS `quotation`;
CREATE TABLE `quotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL COMMENT '1= lead 2 = customer',
  `date` date DEFAULT NULL,
  `open_till` date DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `discount_type` int(11) DEFAULT NULL,
  `allow_comment` tinyint(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `assigned` int(11) DEFAULT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `id_discount` int(11) DEFAULT NULL,
  `discount_value` decimal(10,2) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `id_tax` int(11) DEFAULT NULL,
  `is_tax` tinyint(1) DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  `is_converted_from_proposal` tinyint(1) DEFAULT NULL,
  `grand_total` decimal(10,2) DEFAULT NULL,
  `id_project` int(11) DEFAULT NULL,
  `close_sale_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `quotation`
-- ----------------------------
BEGIN;
INSERT INTO `quotation` VALUES ('1', null, '1', '2019-09-11', '2019-09-03', null, null, '1', '2', '1', 'EOH', 'SR', '', '', '', 'peter@eoh.com', '0987654321', 'QUT19090001', '22.00', '2019-09-17 09:37:02', '1', '2019-09-17 09:37:28', '1', '0', '0.00', '0.00', '1', '0', '0.00', '22.00', null, '22.00', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `quotation_data`
-- ----------------------------
DROP TABLE IF EXISTS `quotation_data`;
CREATE TABLE `quotation_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_quotation` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `qty` int(11) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `discount_type` int(11) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `quotation_data`
-- ----------------------------
BEGIN;
INSERT INTO `quotation_data` VALUES ('2', '1', '1', 'eO-BMS (Standard)', '2222', '1', '22.00', '1', '0.00', '22.00');
COMMIT;

-- ----------------------------
--  Table structure for `quotation_status`
-- ----------------------------
DROP TABLE IF EXISTS `quotation_status`;
CREATE TABLE `quotation_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `css_class` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `quotation_status`
-- ----------------------------
BEGIN;
INSERT INTO `quotation_status` VALUES ('1', 'Draft', 'label-default'), ('2', 'Sent', 'label-success'), ('4', 'Expired', 'label-info'), ('5', 'Declined', 'label-danger'), ('6', 'Accepted', 'label-purple');
COMMIT;

-- ----------------------------
--  Table structure for `repeater_type`
-- ----------------------------
DROP TABLE IF EXISTS `repeater_type`;
CREATE TABLE `repeater_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `repeater_type`
-- ----------------------------
BEGIN;
INSERT INTO `repeater_type` VALUES ('1', 'None'), ('2', 'Day'), ('3', 'Week'), ('4', '2 Weeks'), ('5', '1 Month'), ('6', '2 Months'), ('7', '3 Months'), ('8', '6 Months'), ('9', '1 Year');
COMMIT;

-- ----------------------------
--  Table structure for `setting`
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `names` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `sop_goal_setup`
-- ----------------------------
DROP TABLE IF EXISTS `sop_goal_setup`;
CREATE TABLE `sop_goal_setup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_position` int(11) DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL,
  `id_sop_step` int(11) DEFAULT NULL,
  `id_sop_step_list` int(11) DEFAULT NULL,
  `id_year` int(11) DEFAULT NULL,
  `quarter_1` int(11) DEFAULT NULL,
  `quarter_2` int(11) DEFAULT NULL,
  `quarter_3` int(11) DEFAULT NULL,
  `quarter_4` int(11) DEFAULT NULL,
  `yearly` int(11) DEFAULT NULL,
  `note` text,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sop_goal_setup_data`
-- ----------------------------
DROP TABLE IF EXISTS `sop_goal_setup_data`;
CREATE TABLE `sop_goal_setup_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sop_set_up` int(11) DEFAULT NULL,
  `id_month` int(11) DEFAULT NULL,
  `daily` int(11) DEFAULT NULL,
  `weekly` int(11) DEFAULT NULL,
  `monthly` int(11) DEFAULT NULL,
  `actual_id_month` int(11) DEFAULT NULL,
  `actual_monthly` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sop_set_up_assign_position`
-- ----------------------------
DROP TABLE IF EXISTS `sop_set_up_assign_position`;
CREATE TABLE `sop_set_up_assign_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sop_set_up_id` int(11) DEFAULT NULL,
  `id_position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sop_set_up_assign_position`
-- ----------------------------
BEGIN;
INSERT INTO `sop_set_up_assign_position` VALUES ('4', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `source`
-- ----------------------------
DROP TABLE IF EXISTS `source`;
CREATE TABLE `source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `source`
-- ----------------------------
BEGIN;
INSERT INTO `source` VALUES ('1', 'Facebook', null, null, null, null, '1'), ('2', 'Google', null, null, null, null, '1'), ('3', 'Market Research', null, null, null, null, '1'), ('4', 'Other', null, null, null, null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `standard_operation`
-- ----------------------------
DROP TABLE IF EXISTS `standard_operation`;
CREATE TABLE `standard_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `assign_to` int(11) DEFAULT NULL,
  `id_employee_possition` int(11) DEFAULT NULL,
  `id_standard_operation_step` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `id_priority` int(11) DEFAULT NULL,
  `id_related_to` int(11) DEFAULT NULL,
  `id_related_profile` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `standard_operation`
-- ----------------------------
BEGIN;
INSERT INTO `standard_operation` VALUES ('1', 'SSS', '1', null, '1', '2019-09-18 14:55:57', '1', '2019-09-23 16:55:11', '0000-00-00 00:00:00', null, '', '2019-09-18', null, null, '2', '1', '1'), ('2', 'mara testing milestone', '2', null, '1', '2019-09-20 09:25:11', '1', '2019-10-03 11:26:07', '0000-00-00 00:00:00', null, '', null, null, null, '3', '3', '1'), ('3', 'test', '1', null, '2', '2019-10-03 10:40:41', '1', null, null, null, '', '2019-10-03', '2019-10-09', '2019-10-23', null, '1', '1'), ('4', '13123123123', '1', null, '1', '2019-10-03 11:30:31', '1', null, null, null, '', '2019-10-03', '2019-10-10', '2019-10-10', '1', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `standard_operation_check_list`
-- ----------------------------
DROP TABLE IF EXISTS `standard_operation_check_list`;
CREATE TABLE `standard_operation_check_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `assign_to` int(11) DEFAULT NULL,
  `id_standard_operation` int(11) DEFAULT NULL,
  `id_standard_operation_step` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `is_done` int(1) DEFAULT NULL,
  `description` text,
  `id_standard_operation_step_list` int(11) DEFAULT NULL,
  `done_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `standard_operation_check_list`
-- ----------------------------
BEGIN;
INSERT INTO `standard_operation_check_list` VALUES ('2', null, null, '1', '1', '2019-09-23 16:55:11', '1', null, null, '1', '0', 'ss', '1', null), ('3', null, null, '2', '1', '2019-10-03 11:26:07', '1', null, null, '1', '1', '', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `standard_operation_procedure_article`
-- ----------------------------
DROP TABLE IF EXISTS `standard_operation_procedure_article`;
CREATE TABLE `standard_operation_procedure_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_standard_operation_procedure_set_up` int(11) DEFAULT NULL,
  `id_position` int(11) DEFAULT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `description` text,
  `status` int(1) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `standard_operation_procedure_article`
-- ----------------------------
BEGIN;
INSERT INTO `standard_operation_procedure_article` VALUES ('1', 'hello world', '1', null, 'hello world testing', '<p>hello world testing in long text<br></p>', '1', '2019-09-18', '1', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `standard_operation_procedure_set_up`
-- ----------------------------
DROP TABLE IF EXISTS `standard_operation_procedure_set_up`;
CREATE TABLE `standard_operation_procedure_set_up` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `standard_operation_procedure_set_up`
-- ----------------------------
BEGIN;
INSERT INTO `standard_operation_procedure_set_up` VALUES ('1', 'testing on id position 7', '1', '2019-09-18', '1', '2019-10-01', '3', '<p>Date August 2019&nbsp;<br />\r\nTelephone Etiquette in hotels<br />\r\nSOP Number:&nbsp;FO-01 (SOP serial number and department code)<br />\r\nDepartment:&nbsp;Front Office - General<br />\r\nBasic Telephone Etiquettes:<br />\r\nWhat all points should be taken care of while answering a call?<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Phone should be answered within three rings.<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Smile even though you are on the telephone.<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Sit or stand up straight.<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Use a low voice pitch.<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Match your speaking rate to the caller&#39;s.<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Avoid extremes in volume.<br />\r\nStandard Phrase:<br />\r\nHow to answer an External call?<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Wish according to the time of the day (Good Morning, Afternoon or Evening), (Your Hotel Name), How may I help you.<br />\r\n&bull;&nbsp;&nbsp; &nbsp;How to answer Internal Guest calls?<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Wish according to the time of the day (Good Morning, Afternoon or Evening) Mr. _________ (Guest last name), This is ________(Your first name), How may I help you.<br />\r\n&bull;&nbsp;&nbsp; &nbsp;How to answer interdepartmental calls?<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Wish according to the time of the day (Good Morning, Afternoon or Evening), this is _______ (Your first name), How may I help you.<br />\r\nNote:&nbsp;check out more sample standard greetings used in the hotel.<br />\r\nTransferring a guest call:<br />\r\nHow to transfer a guest call?<br />\r\n&bull;&nbsp;&nbsp; &nbsp;While transferring a guest call you should say:<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Transferring your call with pleasure.<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Putting a guest call on hold:<br />\r\n&bull;&nbsp;&nbsp; &nbsp;How to put a guest call on hold?<br />\r\n&bull;&nbsp;&nbsp; &nbsp;While putting a guest call on hold you should say:<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Allow me to put your call on hold while I check for the information required&rdquo;<br />\r\nOr<br />\r\n&bull;&nbsp;&nbsp; &nbsp;&ldquo;Could I put your call on hold, while I check for the information required?&rdquo;<br />\r\nGuest Query:<br />\r\n&bull;&nbsp;&nbsp; &nbsp;How to handle a guest query?<br />\r\n&bull;&nbsp;&nbsp; &nbsp;For any guest query you should say:<br />\r\n&bull;&nbsp;&nbsp; &nbsp;I will be glad to assist you.<br />\r\nTraining Summary questions:<br />\r\nQ1. In how many rings phone should be picked up? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\nQ2. What is standard phrase of Picking up External and Internal calls? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\nQ3. Why we need to smile over phone?<br />\r\nQ4. What is correct posture while attending guest calls?&nbsp;<br />\r\nQ5. What is standard phrase for any internal guest call?<br />\r\nQ6. What should be the pitch of the voice while speaking to guests?</p>\r\n');
COMMIT;

-- ----------------------------
--  Table structure for `standard_operation_step`
-- ----------------------------
DROP TABLE IF EXISTS `standard_operation_step`;
CREATE TABLE `standard_operation_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `id_employee_possition` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `css` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `standard_operation_step`
-- ----------------------------
BEGIN;
INSERT INTO `standard_operation_step` VALUES ('1', 'testing sop', '1', '2019-09-18 14:55:40', '1', '2019-09-19 16:21:10', '0000-00-00 00:00:00', '1', '', null), ('2', 'testing jet hz', '1', '2019-09-19 16:18:37', '1', '2019-09-19 16:21:17', '0000-00-00 00:00:00', '1', '#3399cc', '1');
COMMIT;

-- ----------------------------
--  Table structure for `standard_operation_step_list`
-- ----------------------------
DROP TABLE IF EXISTS `standard_operation_step_list`;
CREATE TABLE `standard_operation_step_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `id_standard_operation_step` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `is_track` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `standard_operation_step_list`
-- ----------------------------
BEGIN;
INSERT INTO `standard_operation_step_list` VALUES ('1', '111', '1', '2019-09-19 16:21:10', '1', null, null, '1', '1', '1'), ('2', '22222', '2', '2019-09-19 16:21:17', '1', null, null, '1', null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `supplier_profile`
-- ----------------------------
DROP TABLE IF EXISTS `supplier_profile`;
CREATE TABLE `supplier_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_supplier_profile_type` text,
  `supplier_name` varchar(250) DEFAULT NULL,
  `company_name` varchar(250) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `supplier_profile`
-- ----------------------------
BEGIN;
INSERT INTO `supplier_profile` VALUES ('1', '1', 'Resort Leader', 'EO-Resort & Spa', '0987654321', '', 'SR', '1', '1', '2019-09-17 10:06:55', '2019-09-17 10:08:46', '1', '6');
COMMIT;

-- ----------------------------
--  Table structure for `supplier_profile_tag`
-- ----------------------------
DROP TABLE IF EXISTS `supplier_profile_tag`;
CREATE TABLE `supplier_profile_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_supplier` int(11) DEFAULT NULL,
  `id_tag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `supplier_profile_type`
-- ----------------------------
DROP TABLE IF EXISTS `supplier_profile_type`;
CREATE TABLE `supplier_profile_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `supplier_profile_type`
-- ----------------------------
BEGIN;
INSERT INTO `supplier_profile_type` VALUES ('1', 'Vital', '1', '1', '2019-09-16 09:48:40', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `system_setting`
-- ----------------------------
DROP TABLE IF EXISTS `system_setting`;
CREATE TABLE `system_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `system_setting`
-- ----------------------------
BEGIN;
INSERT INTO `system_setting` VALUES ('1', '1', '1 => EOT, 2 => EOH, 3 => Other');
COMMIT;

-- ----------------------------
--  Table structure for `tag`
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) DEFAULT NULL,
  `id_billing_type` int(11) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `id_priority` int(11) DEFAULT NULL,
  `id_repeater` int(11) DEFAULT NULL,
  `id_related_to` int(11) DEFAULT NULL,
  `id_related_profile` int(11) DEFAULT NULL,
  `description` text,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `id_assign_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `task`
-- ----------------------------
BEGIN;
INSERT INTO `task` VALUES ('1', 'Testing', null, null, '2019-09-16', '2019-09-17', '2019-09-16', '4', '1', '6', '2', '', '2', null, null, '1', '2019-09-16 13:53:31', '1'), ('2', 'Testing', null, null, '2019-09-16', '2019-09-17', '2019-09-16', '4', '1', '6', '2', '', '2', '1', '2019-09-16 13:56:03', '1', '2019-09-16 13:56:03', '1'), ('3', 'testing', null, null, '2019-09-16', '2019-09-18', null, '2', '1', '2', '1', '', '2', null, null, '1', '2019-09-16 14:45:45', '1'), ('4', 'testing task in customer id 1', null, null, '2019-09-16', '2019-09-16', '2019-09-16', '3', '1', '7', '1', '', '3', '1', '2019-09-16 15:09:52', '1', '2019-09-16 14:48:47', '1'), ('5', 'testing task in project', null, null, '2019-09-16', '2019-10-05', '2019-09-16', '1', '1', '1', '1', '', '5', null, null, '1', '2019-09-16 15:00:26', '1'), ('6', 'testing task in project', null, null, '2019-09-16', '2019-10-05', '2019-09-16', '1', '1', '1', '2', '', '1', '1', '2019-09-16 15:17:55', '1', '2019-09-16 15:17:55', null), ('7', 'testing task in project', null, null, '2019-09-16', '2019-10-05', '2019-09-16', '1', '1', '1', '3', '', '1', '1', '2019-09-16 15:42:09', '1', '2019-09-16 15:42:09', null), ('8', 'testing task in project', null, null, '2019-09-16', '2019-10-05', '2019-09-16', '1', '1', '1', '4', '', '5', '1', '2019-09-16 15:43:45', '1', '2019-09-16 15:42:52', '0'), ('9', 'testing in main task', null, null, '2019-09-16', '2019-09-17', '2019-09-16', '2', '1', '7', '1', 'testing', '2', '1', '2019-09-18 14:07:59', '1', '2019-09-16 15:53:06', '1');
COMMIT;

-- ----------------------------
--  Table structure for `task_check_list`
-- ----------------------------
DROP TABLE IF EXISTS `task_check_list`;
CREATE TABLE `task_check_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_task` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `from_time` varchar(20) DEFAULT NULL,
  `to_time` varchar(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `task_check_list`
-- ----------------------------
BEGIN;
INSERT INTO `task_check_list` VALUES ('1', '1', 'test1', '1:00 AM', '2:00 AM', '1'), ('2', '1', 'test2', '1:00 AM', '2:00 AM', null), ('3', '2', 'test1', '1:00 AM', '2:00 AM', '1'), ('4', '2', 'test2', '1:00 AM', '2:00 AM', null), ('5', '3', 'sss', '', '', '0'), ('7', '5', 'd', '', '', '1'), ('8', '4', 'tesssss', '', '', '0'), ('12', '8', 'dsf', '4:00 AM', '5:00 AM', '1'), ('13', '9', 'sss', '1:00 AM', '2:00 AM', '1');
COMMIT;

-- ----------------------------
--  Table structure for `task_member`
-- ----------------------------
DROP TABLE IF EXISTS `task_member`;
CREATE TABLE `task_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_task` int(11) DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `task_member`
-- ----------------------------
BEGIN;
INSERT INTO `task_member` VALUES ('1', '9', '1');
COMMIT;

-- ----------------------------
--  Table structure for `task_related_to`
-- ----------------------------
DROP TABLE IF EXISTS `task_related_to`;
CREATE TABLE `task_related_to` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `task_related_to`
-- ----------------------------
BEGIN;
INSERT INTO `task_related_to` VALUES ('1', 'Project'), ('2', 'Invoice'), ('3', 'Customer'), ('4', 'Expense'), ('5', 'Contract'), ('6', 'Lead'), ('7', 'Proposal');
COMMIT;

-- ----------------------------
--  Table structure for `task_status`
-- ----------------------------
DROP TABLE IF EXISTS `task_status`;
CREATE TABLE `task_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `css_class` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `task_status`
-- ----------------------------
BEGIN;
INSERT INTO `task_status` VALUES ('1', 'Not Started', 'label-mint'), ('2', 'In Progress', 'label-success'), ('3', 'Testing', 'label-warning'), ('4', 'Awaiting Feedback', 'label-danger'), ('5', 'Complete', 'label-info');
COMMIT;

-- ----------------------------
--  Table structure for `task_tag`
-- ----------------------------
DROP TABLE IF EXISTS `task_tag`;
CREATE TABLE `task_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_task` int(11) DEFAULT NULL,
  `id_tag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `tax`
-- ----------------------------
DROP TABLE IF EXISTS `tax`;
CREATE TABLE `tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_name` varchar(255) DEFAULT NULL,
  `value` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tax`
-- ----------------------------
BEGIN;
INSERT INTO `tax` VALUES ('1', 'VAT', '5.00');
COMMIT;

-- ----------------------------
--  Table structure for `testing`
-- ----------------------------
DROP TABLE IF EXISTS `testing`;
CREATE TABLE `testing` (
  `id` int(11) NOT NULL,
  `Testing` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `uploaded_file`
-- ----------------------------
DROP TABLE IF EXISTS `uploaded_file`;
CREATE TABLE `uploaded_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `filename` varchar(256) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `uploaded_file`
-- ----------------------------
BEGIN;
INSERT INTO `uploaded_file` VALUES ('1', 'NoPicAvailable.jpg', '/backend/uploads/NoPicAvailable.jpg', '65927', 'image/jpeg', null, b'1'), ('2', 'tick.jpg', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/quotation_template/a3/f94039939d5b984e87fa6c164c11b7_tick.jpg', '39819', 'image/jpeg', null, b'1'), ('3', '64928238_1098443577031984_1099220682396401664_o-15626829075d24a6', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/expense-attachment/f4/6862f1b09fc8da7cf954ce44edec71_64928238_1098443577031984_1099220682396401664_o-15626829075d24a61b7e9e4082376956.jpg', '89372', 'image/jpeg', null, b'1'), ('4', 'eo-logo-b.png', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/company-profile/44/196fb8ea60848c1b613a8a79196d31_eo-logo-b.png', '410782', 'image/png', null, b'1'), ('5', 'eo-techno-doc.png', '/backend/uploads/employee-profile/ee/c9843033e399fc12fb8e0d1ae64e0c_eo-techno-doc.png', '33995', 'image/png', null, b'1'), ('6', 'eo-resort-800.jpg', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/supplier-profile/65/79060a97c5ef48e15033a5c9d26ab9_eo-resort-800.jpg', '94497', 'image/jpeg', null, b'1'), ('7', 'file.jpg', 'backend/uploads/employee-profile/40/7024d3e2a633cda45030fbaa8efe20_file.jpg', '133712', 'image/jpeg', null, b'1'), ('8', 'eo-logo-b.png', 'backend/uploads/company-profile/f6/eb7c2f682f850a0e6185336c16bde2_eo-logo-b.png', '410782', 'image/png', null, b'1'), ('9', 'eo_foundation_profile.jpg', 'backend/uploads/quotation_template/c7/6d244e1d97b79ec7a222198fc7ced1_eo_foundation_profile.jpg', '57268', 'image/jpeg', null, b'1'), ('10', 'eo_foundation_profile.png', 'backend/uploads/quotation_template/8a/955dc1dc24e202e685394097b12acc_eo_foundation_profile.png', '56848', 'image/png', null, b'1'), ('11', 'eo_foundation_profile.png', 'backend/uploads/employee-profile/64/015969315b91483fa2d9b71eee183f_eo_foundation_profile.png', '56848', 'image/png', null, b'1'), ('12', 'tick.png', 'backend/uploads/employee-profile/84/c3acbb9945d8e69ce4353ba5849fc7_tick.png', '34089', 'image/png', null, b'1'), ('13', 'tick.png', 'backend/uploads/employee-profile/a0/ed2dd46e3a89532e6d6c844ca17086_tick.png', '34089', 'image/png', null, b'1');
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `password_hash` varchar(500) DEFAULT NULL,
  `password_reset_token` varchar(500) DEFAULT NULL,
  `auth_key` varchar(500) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `img_url` varchar(500) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `membership_id` int(11) DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL,
  `id_position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', '1', 'systemadmin@eocambo.com', '$2y$13$58f7hH5s7s9X.R/V7fge2.gdJ0Wmr9bqjYHz0yuQtlEapokTIsH46', null, '8tdRr0KstxcAKFdZ00UWb_SjnK73M5uz', '1', '1', '2019-07-10 20:07:12', '2019-07-17 08:38:48', '1', null, null, null, 'System', 'Admin', '', '', '20', 'systemadmin', '2', null, null), ('2', '1', '', '$2y$13$H6n2o8go1ZUH/HpUY8nu/uOeAw8hc78YAE8pM93FSOcnXkknqUkqu', null, 'YiACVobBWoDyCpt9qU_pbNdc0-oD6LOS', '1', '1', '2019-09-17 09:35:41', '2019-10-02 08:32:43', '1', null, null, null, 'dara', 'tester', 'Mr.', '', '7', 'tester', null, '1', '1'), ('3', '3', '', '$2y$13$RL6MA6M5IUI50XIcfy080OcLSScyy.E./w..hrDu90NO1xoI5Toka', null, 'jMKjHHF_-SYEUz7HAViFEfaiPrDOXhDa', '1', '1', '2019-09-20 09:09:28', '2019-10-04 13:10:10', '1', null, null, null, 'mara', 'ko', 'Ms.', '', '12', 'marako', null, '2', '1');
COMMIT;

-- ----------------------------
--  Table structure for `user_type`
-- ----------------------------
DROP TABLE IF EXISTS `user_type`;
CREATE TABLE `user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` bit(1) DEFAULT NULL,
  `user_type_name` varchar(500) DEFAULT NULL,
  `default_view_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user_type`
-- ----------------------------
BEGIN;
INSERT INTO `user_type` VALUES ('1', b'1', 'Super Admin', '1', null, null, '2019-09-20 11:56:33', '1'), ('2', b'1', 'Sales', '1', null, null, '2019-09-03 15:17:16', '13'), ('3', b'1', 'Web Developer', '1', null, null, '2019-09-03 16:23:38', '1'), ('4', b'1', 'Senior Web Developer', null, '2019-09-04 10:01:05', '1', '2019-09-04 10:02:18', '1');
COMMIT;

-- ----------------------------
--  Table structure for `working_group`
-- ----------------------------
DROP TABLE IF EXISTS `working_group`;
CREATE TABLE `working_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `working_group`
-- ----------------------------
BEGIN;
INSERT INTO `working_group` VALUES ('1', 'Web Department', '', '1', '1', '2019-09-16 09:50:40', '1', '2019-09-16 09:50:09');
COMMIT;

-- ----------------------------
--  Table structure for `working_group_data`
-- ----------------------------
DROP TABLE IF EXISTS `working_group_data`;
CREATE TABLE `working_group_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_working_group` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `working_group_data`
-- ----------------------------
BEGIN;
INSERT INTO `working_group_data` VALUES ('3', '1', '3');
COMMIT;

-- ----------------------------
--  Table structure for `working_group_department`
-- ----------------------------
DROP TABLE IF EXISTS `working_group_department`;
CREATE TABLE `working_group_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_working_group` int(11) DEFAULT NULL,
  `id_department` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `working_group_department`
-- ----------------------------
BEGIN;
INSERT INTO `working_group_department` VALUES ('1', '1', '2');
COMMIT;

-- ----------------------------
--  Table structure for `year_list`
-- ----------------------------
DROP TABLE IF EXISTS `year_list`;
CREATE TABLE `year_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `year_list`
-- ----------------------------
BEGIN;
INSERT INTO `year_list` VALUES ('1', '2019'), ('2', '2020'), ('3', '2021'), ('4', '2022'), ('5', '2023'), ('6', '2024'), ('7', '2025'), ('8', '2026'), ('9', '2027'), ('10', '2028'), ('11', '2029'), ('12', '2030');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
