/*
 Navicat Premium Data Transfer

 Source Server         : 2bc business center
 Source Server Type    : MySQL
 Source Server Version : 50640
 Source Host           : aa17jpkkt3nza3d.ctdeev5h7fgi.ap-southeast-1.rds.amazonaws.com:3306
 Source Schema         : ebdb

 Target Server Type    : MySQL
 Target Server Version : 50640
 File Encoding         : 65001

 Date: 05/10/2019 08:59:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_type
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
-- Records of account_type
-- ----------------------------
BEGIN;
INSERT INTO `account_type` VALUES (1, 0, 'Income', 1, '2017-12-13 12:01:22', 1, '', 1, '2017-12-13 12:01:22');
INSERT INTO `account_type` VALUES (2, 0, 'Expense', 1, '2017-12-13 12:06:49', 1, '', 1, '2017-12-13 12:01:22');
INSERT INTO `account_type` VALUES (3, 0, 'Bank', 1, '2017-12-13 12:07:12', 1, '', 1, '2017-12-13 12:01:22');
INSERT INTO `account_type` VALUES (4, 0, 'Cost of Sales', 1, '2017-12-13 12:07:46', 1, '', 1, '2017-12-13 12:01:22');
INSERT INTO `account_type` VALUES (5, 0, 'Other Expense', 1, '2017-12-13 12:08:14', 1, '', 1, '2017-12-13 12:01:22');
INSERT INTO `account_type` VALUES (6, 0, 'Other Income', 1, '2017-12-13 12:01:22', 1, '', 1, '2017-12-13 12:01:22');
INSERT INTO `account_type` VALUES (7, 0, 'Equity', 1, '2017-12-13 12:01:22', 1, '', 1, '2017-12-13 12:01:22');
INSERT INTO `account_type` VALUES (8, 0, 'Current Liabilities', 1, '2017-12-13 12:01:22', 1, '', 1, '2017-12-13 12:01:22');
INSERT INTO `account_type` VALUES (9, 0, 'Current Assets', 1, '2017-12-13 12:01:22', 1, '', 1, '2017-12-13 12:01:22');
INSERT INTO `account_type` VALUES (10, 0, 'Non-Current Assets', 1, '2017-12-13 12:01:22', 1, '', 1, '2017-12-13 12:01:22');
INSERT INTO `account_type` VALUES (11, 2, 'Administrative Expenses ', 1, '2017-12-13 12:07:02', 1, '', 1, '2017-12-13 12:02:56');
INSERT INTO `account_type` VALUES (12, 2, 'Bad Debts', 1, '2017-12-13 12:07:32', 1, '', 1, '2017-12-13 12:03:19');
INSERT INTO `account_type` VALUES (13, 2, 'Bank Charge ', 1, '2017-12-13 12:08:00', 1, '', 1, '2017-12-13 12:03:56');
INSERT INTO `account_type` VALUES (14, 2, 'Payroll Expenses', 1, '2017-12-13 12:08:34', 1, '', 1, '2017-12-13 12:04:22');
INSERT INTO `account_type` VALUES (15, 2, 'Entertainment ', 1, '2017-12-13 12:09:21', 1, '', 1, '2017-12-13 12:09:24');
INSERT INTO `account_type` VALUES (16, 2, 'Marketing Expense', 1, '2017-12-13 13:38:35', 1, '', 1, '2017-12-13 13:37:44');
INSERT INTO `account_type` VALUES (17, 2, 'Repaire & Maintenance ', 1, '2017-12-13 13:38:43', 1, '', 1, '2017-12-13 13:37:51');
INSERT INTO `account_type` VALUES (18, 2, 'Travel Expenses', 1, '2017-12-13 13:38:51', 1, '', 1, '2017-12-13 13:37:56');
INSERT INTO `account_type` VALUES (19, 2, 'Insurrance', 1, '2017-12-13 13:38:55', 1, '', 1, '2017-12-13 13:38:02');
INSERT INTO `account_type` VALUES (20, 3, 'Cash in Bank', 1, '2017-12-13 13:42:29', 1, '', 1, '0000-00-00 00:00:00');
INSERT INTO `account_type` VALUES (21, 3, 'Cash on Hand', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (22, 5, 'Depreciation', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (23, 5, 'Other Expense', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (24, 6, 'Other Investment Revenue', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (25, 6, 'Interest Earned', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (26, 7, 'Opening Balance Equity', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (27, 7, 'Owner\'s Equity', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (28, 7, 'Partner\'s Equity', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (29, 8, 'Interest Payable ', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (30, 8, 'Insurance Payable', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (31, 8, 'Loan Payable', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (32, 8, 'Payroll Liabilities', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (33, 8, 'Prepaid Expense Liabilities', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (34, 9, 'Employee Cash Advances', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (35, 9, 'Inventory', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (36, 9, 'Loans to Shareholders', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (37, 9, 'Other Current Assets', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (38, 9, 'Prepaid Expense', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (39, 9, 'Loans to Officers', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (40, 10, 'Goodwill', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (41, 10, 'Licenses', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (42, 10, 'Member Fee', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00');
INSERT INTO `account_type` VALUES (43, 2, 'Commission Expense', 1, '2017-12-14 00:00:00', 1, '', 1, '2017-12-14 00:00:00');
INSERT INTO `account_type` VALUES (44, 0, 'Account Payable', 1, '2017-12-14 00:00:00', 1, '', 1, '2017-12-14 00:00:00');
INSERT INTO `account_type` VALUES (45, 0, 'Account Receivable', 1, '2017-12-14 00:00:00', 1, '', 1, '2017-12-14 00:00:00');
INSERT INTO `account_type` VALUES (46, 0, 'Fixed Asset', 1, '2017-12-14 00:00:00', 1, '', 1, '2017-12-14 00:00:00');
INSERT INTO `account_type` VALUES (47, 8, 'Tax Payable Liabilities', 1, '2018-08-17 08:47:01', 1, 'For all kind of Tax Payable Liabilities', 1, '2018-08-17 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for bank
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
-- Records of bank
-- ----------------------------
BEGIN;
INSERT INTO `bank` VALUES (13, 'Sacom Bank', 1, 'No.0665 Sangkat Sla Kram, Siem Reap City, Siem Reap Province', 'eOcambo Technology', '00032882', '', 0, 20, '2019-06-26 13:48:39', 1, 20, '2019-06-26 13:45:06', 'SGTTVNVX');
COMMIT;

-- ----------------------------
-- Table structure for bank_account_type
-- ----------------------------
DROP TABLE IF EXISTS `bank_account_type`;
CREATE TABLE `bank_account_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(200) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of bank_account_type
-- ----------------------------
BEGIN;
INSERT INTO `bank_account_type` VALUES (1, 'Saving Account');
INSERT INTO `bank_account_type` VALUES (2, 'Current Account');
COMMIT;

-- ----------------------------
-- Table structure for billing_type
-- ----------------------------
DROP TABLE IF EXISTS `billing_type`;
CREATE TABLE `billing_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of billing_type
-- ----------------------------
BEGIN;
INSERT INTO `billing_type` VALUES (1, 'Fixed Rate');
COMMIT;

-- ----------------------------
-- Table structure for budget_set_up
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
-- Table structure for budget_set_up_data
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
-- Table structure for budget_setup_value
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
-- Table structure for cash_advance_request
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for chart_account
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
-- Records of chart_account
-- ----------------------------
BEGIN;
INSERT INTO `chart_account` VALUES (1, 'Sales Income', 1, '2018-08-17 14:06:23', 1, 1, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 40000);
INSERT INTO `chart_account` VALUES (2, 'Franchise Sales Revenue', 1, '2018-08-26 15:56:39', 1, 6, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 41000);
INSERT INTO `chart_account` VALUES (3, 'Interest Income', 1, '2018-08-26 15:57:00', 1, 6, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 42000);
INSERT INTO `chart_account` VALUES (4, 'Cost of Sales', 1, '2018-08-17 14:07:44', 1, 4, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 50000);
INSERT INTO `chart_account` VALUES (5, 'Cost of Accommodation', 1, '2018-08-26 16:09:53', 1, 4, NULL, 4, 1, '2018-07-02 16:23:21', NULL, 50100);
INSERT INTO `chart_account` VALUES (6, 'Cost of Guide', 1, '2018-08-26 16:10:08', 1, 4, NULL, 4, 1, '2018-07-02 16:23:21', NULL, 50200);
INSERT INTO `chart_account` VALUES (7, 'Cost of Ticket', 1, '2018-08-26 16:10:23', 1, 4, NULL, 4, 1, '2018-07-02 16:23:21', NULL, 50300);
INSERT INTO `chart_account` VALUES (8, 'Cost of Transport', 1, '2018-08-26 16:10:42', 1, 4, NULL, 4, 1, '2018-07-02 16:23:21', NULL, 50400);
INSERT INTO `chart_account` VALUES (10, 'Cost of Misc', 1, '2018-08-26 16:11:14', 1, 4, NULL, 4, 1, '2018-07-02 16:23:21', NULL, 50600);
INSERT INTO `chart_account` VALUES (11, 'Cost of Tour & Activities', 1, '2018-08-26 16:11:28', 1, 4, NULL, 4, 1, '2018-07-02 16:23:21', NULL, 50700);
INSERT INTO `chart_account` VALUES (12, 'Cost of Restaurant', 1, '2018-08-26 16:11:44', 1, 4, NULL, 4, 1, '2018-07-02 16:23:21', NULL, 50800);
INSERT INTO `chart_account` VALUES (13, 'Cost of Cruise', 1, '2018-08-26 16:11:58', 1, 4, NULL, 4, 1, '2018-07-02 16:23:21', NULL, 50900);
INSERT INTO `chart_account` VALUES (15, 'Utilities Expanse', 1, '2018-08-24 22:50:41', 1, 2, NULL, 92, 1, '2018-07-02 16:23:21', NULL, 61100);
INSERT INTO `chart_account` VALUES (16, 'Staff\'s Food Expense', 1, '2018-08-26 14:35:32', 1, 2, NULL, 97, 1, '2018-07-02 16:23:21', NULL, 61510);
INSERT INTO `chart_account` VALUES (17, 'Gastroline Expense', 1, '2018-08-26 15:40:05', 1, 2, NULL, 15, 1, '2018-07-02 16:23:21', NULL, 61105);
INSERT INTO `chart_account` VALUES (18, 'Cellcard Expense', 1, '2018-08-26 14:19:49', 1, 2, NULL, 96, 1, '2018-07-02 16:23:21', NULL, 61410);
INSERT INTO `chart_account` VALUES (19, 'Internet Expense', 1, '2018-08-26 14:20:29', 1, 2, NULL, 96, 1, '2018-07-02 16:23:21', NULL, 61420);
INSERT INTO `chart_account` VALUES (20, 'Bad Debts', 1, '2018-08-26 15:16:56', 1, 2, NULL, 101, 1, '2018-07-02 16:23:21', NULL, 64010);
INSERT INTO `chart_account` VALUES (21, 'Bank Charge', 1, '2018-08-26 15:17:13', 1, 2, NULL, 101, 1, '2018-07-02 16:23:21', NULL, 64020);
INSERT INTO `chart_account` VALUES (22, 'Payroll Expense', 1, '2018-08-24 22:57:37', 1, 2, NULL, 92, 1, '2018-07-02 16:23:21', NULL, 61200);
INSERT INTO `chart_account` VALUES (23, 'Bonus Expense', 1, '2018-08-26 15:28:07', 1, 2, NULL, 22, 1, '2018-07-02 16:23:21', NULL, 61201);
INSERT INTO `chart_account` VALUES (24, 'Commission for Supplier Expense', 1, '2018-08-26 14:50:59', 1, 2, NULL, 98, 1, '2018-07-02 16:23:21', NULL, 62010);
INSERT INTO `chart_account` VALUES (25, 'Anual Staff Party', 1, '2018-08-26 14:36:11', 1, 2, NULL, 97, 1, '2018-07-02 16:23:21', NULL, 61521);
INSERT INTO `chart_account` VALUES (26, 'Business Adverting Expense', 1, '2018-08-26 14:57:51', 1, 2, NULL, 98, 1, '2018-07-02 16:23:21', NULL, 62020);
INSERT INTO `chart_account` VALUES (27, 'Sponsor Expense', 1, '2018-08-26 14:58:17', 1, 2, NULL, 98, 1, '2018-07-02 16:23:21', NULL, 62030);
INSERT INTO `chart_account` VALUES (28, 'Car Maintenance Expense', 1, '2018-08-26 14:25:41', 1, 2, NULL, 99, 1, '2018-07-02 16:23:21', NULL, 61901);
INSERT INTO `chart_account` VALUES (29, 'Computer Maintenance Expense', 1, '2018-08-26 14:26:02', 1, 2, NULL, 99, 1, '2018-07-02 16:23:21', NULL, 61902);
INSERT INTO `chart_account` VALUES (30, 'Accommodation Expense', 1, '2018-08-26 15:05:39', 1, 2, NULL, 182, 1, '2018-07-02 16:23:21', NULL, 62191);
INSERT INTO `chart_account` VALUES (31, 'Meal\'s Expense', 1, '2018-08-26 15:05:23', 1, 2, NULL, 182, 1, '2018-07-02 16:23:21', NULL, 62192);
INSERT INTO `chart_account` VALUES (32, 'Air ticket Expense', 1, '2018-08-26 15:05:58', 1, 2, NULL, 182, 1, '2018-07-02 16:23:21', NULL, 62193);
INSERT INTO `chart_account` VALUES (33, 'Staff Insurrance', 1, '2018-08-26 15:28:26', 1, 2, NULL, 22, 1, '2018-07-02 16:23:21', NULL, 61202);
INSERT INTO `chart_account` VALUES (36, 'Other Expense', 1, '2018-08-26 16:18:00', 1, 5, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 70000);
INSERT INTO `chart_account` VALUES (37, 'Cash on Hand in Cambodia', 1, '2018-08-25 23:22:33', 1, 3, NULL, 102, 1, '2018-07-02 16:23:21', NULL, 10100);
INSERT INTO `chart_account` VALUES (38, 'Cash on Hand in Siem Reap office', 1, '2018-08-25 23:25:31', 1, 3, NULL, 37, 1, '2018-07-02 16:23:21', NULL, 10101);
INSERT INTO `chart_account` VALUES (39, 'Cash on Hand in Phnom Penh office', 1, '2018-08-25 23:26:04', 1, 3, NULL, 37, 1, '2018-07-02 16:23:21', NULL, 10102);
INSERT INTO `chart_account` VALUES (40, 'Cash on Hand in Philippine', 1, '2018-08-25 23:22:57', 1, 3, NULL, 102, 1, '2018-07-02 16:23:21', NULL, 10200);
INSERT INTO `chart_account` VALUES (42, 'Shareholders\' Equity', 1, '2018-08-26 16:21:27', 1, 7, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 30000);
INSERT INTO `chart_account` VALUES (43, 'Owner\'s Withdrawal', 1, '2018-08-26 16:24:33', 1, 7, NULL, 42, 1, '2018-07-02 16:23:21', NULL, 33000);
INSERT INTO `chart_account` VALUES (44, 'Retained Earnings', 1, '2018-08-26 16:23:14', 1, 7, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 39000);
INSERT INTO `chart_account` VALUES (46, 'Interest Payable ', 1, '2018-08-26 17:17:38', 1, 8, NULL, 48, 1, '2018-07-02 16:23:21', NULL, 26010);
INSERT INTO `chart_account` VALUES (47, 'Insurrance Payable', 1, '2018-08-26 17:24:50', 1, 8, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 22000);
INSERT INTO `chart_account` VALUES (48, 'Loan Payable ', 1, '2018-08-26 17:14:00', 1, 8, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 26000);
INSERT INTO `chart_account` VALUES (49, 'Payroll Liabilities', 1, '2018-08-26 17:13:23', 1, 8, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 21000);
INSERT INTO `chart_account` VALUES (51, 'Employee Cash Advances', 1, '2018-08-26 17:56:50', 1, 9, NULL, 218, 1, '2018-07-02 16:23:21', NULL, 14030);
INSERT INTO `chart_account` VALUES (52, 'Inventory', 1, '2018-08-26 18:00:01', 1, 9, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 13000);
INSERT INTO `chart_account` VALUES (53, 'Loans to Shareholders', 1, '2018-08-26 17:55:40', 1, 9, NULL, 218, 1, '2018-07-02 16:23:21', NULL, 14010);
INSERT INTO `chart_account` VALUES (54, 'Other Current Assets', 1, '2018-08-26 18:14:03', 1, 9, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 17000);
INSERT INTO `chart_account` VALUES (55, 'Prepaid Expense', 1, '2018-08-24 23:15:50', 1, 9, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 15000);
INSERT INTO `chart_account` VALUES (56, 'Loans to Officers', 1, '2018-08-26 17:57:46', 1, 9, NULL, 218, 1, '2018-07-02 16:23:21', NULL, 14040);
INSERT INTO `chart_account` VALUES (62, 'Account Payable', 1, '2018-08-24 23:12:20', 1, 44, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 20000);
INSERT INTO `chart_account` VALUES (63, 'Account Receivable', 1, '2018-08-24 23:11:17', 1, 45, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 12000);
INSERT INTO `chart_account` VALUES (64, 'Cash in Bank Cambodia', 1, '2018-08-25 23:29:34', 1, 3, NULL, 104, 1, '2018-07-02 16:23:21', NULL, 11100);
INSERT INTO `chart_account` VALUES (65, 'Cash in Bank Phillippine', 1, '2018-08-26 15:21:22', 1, 3, NULL, 104, 1, '2018-07-02 16:23:21', NULL, 11200);
INSERT INTO `chart_account` VALUES (67, 'Vehicle', 1, '2018-08-27 22:46:53', 1, 46, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 18100);
INSERT INTO `chart_account` VALUES (68, 'Building', 1, '2018-08-27 22:47:17', 1, 46, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 18200);
INSERT INTO `chart_account` VALUES (69, 'Bank Deposit (Business Bank Guaranteed)', 1, '2018-08-26 18:35:16', 1, 9, NULL, 221, 1, '2018-07-02 16:23:21', NULL, 16500);
INSERT INTO `chart_account` VALUES (70, 'Trade Discount & Promotion(-)', 1, '2018-08-26 16:05:19', 1, 1, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 43000);
INSERT INTO `chart_account` VALUES (71, 'Unearned Revenue', 1, '2018-08-26 17:09:13', 1, 8, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 25000);
INSERT INTO `chart_account` VALUES (72, 'Guide Advances', 1, '2018-08-26 17:56:25', 1, 9, NULL, 218, 1, '2018-07-02 16:54:32', NULL, 14020);
INSERT INTO `chart_account` VALUES (73, 'Staff Allowance Expense', 1, '2018-08-26 15:28:46', 1, 2, NULL, 22, 1, '2018-07-10 16:07:46', NULL, 61203);
INSERT INTO `chart_account` VALUES (75, 'Guide Advance Liabilities', 1, '2018-08-26 17:08:43', 1, 8, NULL, 0, 1, '2018-08-15 15:54:13', NULL, 24000);
INSERT INTO `chart_account` VALUES (79, 'Cash on Hand in Myanmar', 1, '2018-08-25 23:23:24', 1, 3, NULL, 102, 1, '2018-08-16 23:45:17', NULL, 10300);
INSERT INTO `chart_account` VALUES (80, 'Cash in Bank Vietnam', 1, '2018-08-25 23:34:50', 1, 3, NULL, 104, 1, '2018-08-16 23:46:25', NULL, 11300);
INSERT INTO `chart_account` VALUES (82, 'Cash in Bank Thailand', 1, '2018-08-26 15:22:27', 1, 3, NULL, 104, 1, '2018-08-16 23:51:18', NULL, 11400);
INSERT INTO `chart_account` VALUES (85, 'Cash on Hand in Indonesia', 1, '2018-08-25 23:23:48', 1, 3, NULL, 102, 1, '2018-08-16 23:55:32', NULL, 10400);
INSERT INTO `chart_account` VALUES (87, 'Salary Tax Payable', 1, '2018-08-26 16:56:12', 1, 8, NULL, 206, 1, '2018-08-17 01:50:59', NULL, 23010);
INSERT INTO `chart_account` VALUES (88, 'Value Added Tax Payable', 1, '2018-08-26 16:57:37', 1, 8, NULL, 206, 1, '2018-08-17 01:52:33', NULL, 23030);
INSERT INTO `chart_account` VALUES (89, 'Profit Tax Payable', 1, '2018-08-26 16:57:08', 1, 8, NULL, 206, 1, '2018-08-17 01:53:35', NULL, 23020);
INSERT INTO `chart_account` VALUES (90, 'Withholding Tax Payable', 1, '2018-08-26 16:58:06', 1, 8, NULL, 206, 1, '2018-08-17 01:56:06', NULL, 23040);
INSERT INTO `chart_account` VALUES (91, 'Operation & Admin Expense', 1, '2018-08-20 12:47:55', 1, 2, NULL, 0, 1, '2018-08-20 12:47:55', NULL, 60000);
INSERT INTO `chart_account` VALUES (92, 'General Expense', 1, '2018-08-20 12:49:34', 1, 2, NULL, 91, 1, '2018-08-20 12:49:34', NULL, 61000);
INSERT INTO `chart_account` VALUES (95, 'Rental Expense', 1, '2018-08-24 22:58:11', 1, 2, NULL, 92, 1, '2018-08-24 22:53:11', NULL, 61300);
INSERT INTO `chart_account` VALUES (96, 'Communication Expense', 1, '2018-08-24 22:59:21', 1, 2, NULL, 92, 1, '2018-08-24 22:59:21', NULL, 61400);
INSERT INTO `chart_account` VALUES (97, 'Admin Expense', 1, '2018-08-24 23:00:22', 1, 2, NULL, 92, 1, '2018-08-24 23:00:22', NULL, 61500);
INSERT INTO `chart_account` VALUES (98, 'Marketing Expense', 1, '2018-08-26 14:11:55', 1, 2, NULL, 91, 1, '2018-08-24 23:02:05', NULL, 62000);
INSERT INTO `chart_account` VALUES (99, 'Maintenance & Repair Expense', 1, '2018-08-26 14:25:00', 1, 2, NULL, 92, 1, '2018-08-24 23:03:27', NULL, 61900);
INSERT INTO `chart_account` VALUES (100, 'Taxes Expense', 1, '2018-08-26 14:12:32', 1, 2, NULL, 91, 1, '2018-08-24 23:07:14', NULL, 63000);
INSERT INTO `chart_account` VALUES (101, 'Finance Expense', 1, '2018-08-26 14:13:08', 1, 2, NULL, 91, 1, '2018-08-24 23:08:59', NULL, 64000);
INSERT INTO `chart_account` VALUES (102, 'Cash on Hand', 1, '2018-08-26 09:48:33', 1, 3, NULL, 0, 1, '2018-08-24 23:18:16', NULL, 10000);
INSERT INTO `chart_account` VALUES (104, 'Cash in Bank', 1, '2018-08-25 23:27:49', 1, 3, NULL, 0, 1, '2018-08-25 23:27:49', NULL, 11000);
INSERT INTO `chart_account` VALUES (105, 'Telephone Expense', 1, '2018-08-26 14:20:47', 1, 2, NULL, 96, 1, '2018-08-26 10:02:45', NULL, 61430);
INSERT INTO `chart_account` VALUES (107, 'Post Office Fee', 1, '2018-08-26 14:21:08', 1, 2, NULL, 96, 1, '2018-08-26 10:09:47', NULL, 61440);
INSERT INTO `chart_account` VALUES (108, 'Security Expense', 1, '2018-08-26 14:36:55', 1, 2, NULL, 97, 1, '2018-08-26 10:18:29', NULL, 61522);
INSERT INTO `chart_account` VALUES (109, 'Donations and Charity Expense', 1, '2018-08-26 14:58:40', 1, 2, NULL, 98, 1, '2018-08-26 10:20:06', NULL, 62040);
INSERT INTO `chart_account` VALUES (110, 'Printing Expense', 1, '2018-08-26 14:37:19', 1, 2, NULL, 97, 1, '2018-08-26 10:20:37', NULL, 61523);
INSERT INTO `chart_account` VALUES (111, 'Insurrance Expense', 1, '2018-08-26 14:37:38', 1, 2, NULL, 97, 1, '2018-08-26 10:21:38', NULL, 61524);
INSERT INTO `chart_account` VALUES (112, 'Newspaper & Margazine Expense', 1, '2018-08-26 14:37:54', 1, 2, NULL, 97, 1, '2018-08-26 10:22:48', NULL, 61525);
INSERT INTO `chart_account` VALUES (113, 'Office Supplies Expense', 1, '2018-08-26 14:38:14', 1, 2, NULL, 97, 1, '2018-08-26 10:23:25', NULL, 61526);
INSERT INTO `chart_account` VALUES (114, 'Small Tools & Equipment', 1, '2018-08-26 14:39:18', 1, 2, NULL, 97, 1, '2018-08-26 10:24:31', NULL, 61527);
INSERT INTO `chart_account` VALUES (115, 'Domain Hosting Expense', 1, '2018-08-26 14:39:49', 1, 2, NULL, 97, 1, '2018-08-26 10:25:15', NULL, 61528);
INSERT INTO `chart_account` VALUES (116, 'Professional Fee Expense', 1, '2018-08-26 14:40:17', 1, 2, NULL, 97, 1, '2018-08-26 10:26:11', NULL, 61529);
INSERT INTO `chart_account` VALUES (117, 'Staff Retreatment Trip Expense', 1, '2018-08-26 14:40:35', 1, 2, NULL, 97, 1, '2018-08-26 10:27:24', NULL, 61530);
INSERT INTO `chart_account` VALUES (118, 'Staff Training Expense', 1, '2018-08-26 14:40:55', 1, 2, NULL, 97, 1, '2018-08-26 10:33:23', NULL, 61531);
INSERT INTO `chart_account` VALUES (119, 'Staff Entertainment Expense', 1, '2018-08-26 14:41:15', 1, 2, NULL, 97, 1, '2018-08-26 10:33:58', NULL, 61532);
INSERT INTO `chart_account` VALUES (120, 'Staff Uniform Expense', 1, '2018-08-26 14:41:34', 1, 2, NULL, 97, 1, '2018-08-26 10:34:36', NULL, 61533);
INSERT INTO `chart_account` VALUES (121, 'Office Stationaries Expense', 1, '2018-08-26 14:41:52', 1, 2, NULL, 97, 1, '2018-08-26 10:36:31', NULL, 61534);
INSERT INTO `chart_account` VALUES (122, 'Tips Expense', 1, '2018-08-26 14:42:08', 1, 2, NULL, 97, 1, '2018-08-26 10:38:02', NULL, 61535);
INSERT INTO `chart_account` VALUES (123, 'Delivery & Shipping Expense', 1, '2018-08-26 14:42:28', 1, 2, NULL, 97, 1, '2018-08-26 10:38:49', NULL, 61536);
INSERT INTO `chart_account` VALUES (124, 'Staff Recruitment Expense', 1, '2018-08-26 14:42:45', 1, 2, NULL, 97, 1, '2018-08-26 10:39:38', NULL, 61537);
INSERT INTO `chart_account` VALUES (125, 'Religious Ceremony Expense', 1, '2018-08-26 14:44:04', 1, 2, NULL, 97, 1, '2018-08-26 10:40:23', NULL, 61538);
INSERT INTO `chart_account` VALUES (126, 'Commission for Customer Expense', 1, '2018-08-26 14:59:11', 1, 2, NULL, 98, 1, '2018-08-26 11:05:31', NULL, 62050);
INSERT INTO `chart_account` VALUES (127, 'Commission for Staff Expense', 1, '2018-08-26 14:59:47', 1, 2, NULL, 98, 1, '2018-08-26 11:06:42', NULL, 62060);
INSERT INTO `chart_account` VALUES (128, 'Agent Fam Trip Expense', 1, '2018-08-26 15:00:08', 1, 2, NULL, 98, 1, '2018-08-26 11:07:56', NULL, 62070);
INSERT INTO `chart_account` VALUES (129, 'Trade & Expo attending Expense', 1, '2018-08-26 15:00:31', 1, 2, NULL, 98, 1, '2018-08-26 11:10:33', NULL, 62080);
INSERT INTO `chart_account` VALUES (130, 'Membership & Affiliate Expense', 1, '2018-08-26 15:00:52', 1, 2, NULL, 98, 1, '2018-08-26 11:12:19', NULL, 62090);
INSERT INTO `chart_account` VALUES (131, 'Rep. Marketing Fee', 1, '2018-08-26 15:01:23', 1, 2, NULL, 98, 1, '2018-08-26 11:14:06', NULL, 62100);
INSERT INTO `chart_account` VALUES (132, 'Entertainment Supplier', 1, '2018-08-26 15:01:46', 1, 2, NULL, 98, 1, '2018-08-26 11:15:40', NULL, 62110);
INSERT INTO `chart_account` VALUES (133, 'Entertainment Customer', 1, '2018-08-26 15:02:04', 1, 2, NULL, 98, 1, '2018-08-26 11:17:24', NULL, 62120);
INSERT INTO `chart_account` VALUES (134, 'Business Gift Expense', 1, '2018-08-26 15:02:26', 1, 2, NULL, 98, 1, '2018-08-26 11:22:04', NULL, 62130);
INSERT INTO `chart_account` VALUES (135, 'Compensation Expense', 1, '2018-08-26 15:02:57', 1, 2, NULL, 98, 1, '2018-08-26 11:25:25', NULL, 62140);
INSERT INTO `chart_account` VALUES (136, 'Business Promotion', 1, '2018-08-26 15:03:18', 1, 2, NULL, 98, 1, '2018-08-26 11:27:10', NULL, 62150);
INSERT INTO `chart_account` VALUES (137, 'Art & Graphic Expense', 1, '2018-08-26 15:03:38', 1, 2, NULL, 98, 1, '2018-08-26 11:36:49', NULL, 62160);
INSERT INTO `chart_account` VALUES (138, 'Broucher & Marketing Meterial', 1, '2018-08-26 15:04:01', 1, 2, NULL, 98, 1, '2018-08-26 11:38:17', NULL, 62170);
INSERT INTO `chart_account` VALUES (139, 'Sales Promotion Expense', 1, '2018-08-26 15:04:23', 1, 2, NULL, 98, 1, '2018-08-26 11:40:28', NULL, 62180);
INSERT INTO `chart_account` VALUES (140, 'Web Design Expense', 1, '2018-08-26 14:44:22', 1, 2, NULL, 97, 1, '2018-08-26 11:45:47', NULL, 61539);
INSERT INTO `chart_account` VALUES (141, 'Refriedgerator Maintenance', 1, '2018-08-26 14:26:24', 1, 2, NULL, 99, 1, '2018-08-26 11:55:46', NULL, 61903);
INSERT INTO `chart_account` VALUES (142, 'Air-conditioner Maintenance', 1, '2018-08-26 14:26:47', 1, 2, NULL, 99, 1, '2018-08-26 11:56:30', NULL, 61904);
INSERT INTO `chart_account` VALUES (143, 'Printer & Scanner Maintenance', 1, '2018-08-26 14:27:10', 1, 2, NULL, 99, 1, '2018-08-26 11:57:52', NULL, 61905);
INSERT INTO `chart_account` VALUES (144, 'Building Maintenance', 1, '2018-08-26 14:27:32', 1, 2, NULL, 99, 1, '2018-08-26 11:58:55', NULL, 61906);
INSERT INTO `chart_account` VALUES (145, 'Electricity Maintenance', 1, '2018-08-26 14:27:58', 1, 2, NULL, 99, 1, '2018-08-26 11:59:51', NULL, 61907);
INSERT INTO `chart_account` VALUES (146, 'Kitchen Equipment Maintenance', 1, '2018-08-26 14:29:31', 1, 2, NULL, 99, 1, '2018-08-26 12:00:41', NULL, 61908);
INSERT INTO `chart_account` VALUES (147, 'Server Maintenance', 1, '2018-08-26 14:29:52', 1, 2, NULL, 99, 1, '2018-08-26 12:01:55', NULL, 61909);
INSERT INTO `chart_account` VALUES (148, 'Office Space Maintenance', 1, '2018-08-26 14:30:12', 1, 2, NULL, 99, 1, '2018-08-26 12:02:39', NULL, 61910);
INSERT INTO `chart_account` VALUES (149, 'Bathroom Maintenance', 1, '2018-08-26 14:30:43', 1, 2, NULL, 99, 1, '2018-08-26 12:03:33', NULL, 61911);
INSERT INTO `chart_account` VALUES (150, 'Solar System Maintenance', 1, '2018-08-26 14:31:06', 1, 2, NULL, 99, 1, '2018-08-26 12:04:11', NULL, 61912);
INSERT INTO `chart_account` VALUES (151, 'Sound System Maintenance', 1, '2018-08-26 14:31:25', 1, 2, NULL, 99, 1, '2018-08-26 12:04:46', NULL, 61913);
INSERT INTO `chart_account` VALUES (152, 'Telephone Maintenance', 1, '2018-08-26 14:31:46', 1, 2, NULL, 99, 1, '2018-08-26 12:06:00', NULL, 61914);
INSERT INTO `chart_account` VALUES (153, 'TV Maintenance', 1, '2018-08-26 14:32:07', 1, 2, NULL, 99, 1, '2018-08-26 12:06:35', NULL, 61915);
INSERT INTO `chart_account` VALUES (154, 'Water System Maintenance', 1, '2018-08-26 14:32:30', 1, 2, NULL, 99, 1, '2018-08-26 12:07:26', NULL, 61916);
INSERT INTO `chart_account` VALUES (155, 'Fire Extinguishing System', 1, '2018-08-26 14:33:02', 1, 2, NULL, 99, 1, '2018-08-26 12:08:07', NULL, 61917);
INSERT INTO `chart_account` VALUES (156, 'Wooden Equipment', 1, '2018-08-26 14:33:21', 1, 2, NULL, 99, 1, '2018-08-26 12:08:56', NULL, 61918);
INSERT INTO `chart_account` VALUES (157, 'Lighting Repair', 1, '2018-08-26 14:34:03', 1, 2, NULL, 99, 1, '2018-08-26 12:10:18', NULL, 61919);
INSERT INTO `chart_account` VALUES (158, 'Painting Maintenance', 1, '2018-08-26 14:34:24', 1, 2, NULL, 99, 1, '2018-08-26 12:11:27', NULL, 61920);
INSERT INTO `chart_account` VALUES (159, 'Garden & Landscap Maintenance', 1, '2018-08-26 14:34:43', 1, 2, NULL, 99, 1, '2018-08-26 12:42:28', NULL, 61921);
INSERT INTO `chart_account` VALUES (160, 'Logo and Banner Tax', 1, '2018-08-26 15:08:46', 1, 2, NULL, 100, 1, '2018-08-26 12:45:15', NULL, 63010);
INSERT INTO `chart_account` VALUES (161, 'Withholding Tax', 1, '2018-08-26 15:09:07', 1, 2, NULL, 100, 1, '2018-08-26 12:46:56', NULL, 63020);
INSERT INTO `chart_account` VALUES (162, 'Authority Tax', 1, '2018-08-26 15:09:32', 1, 2, NULL, 100, 1, '2018-08-26 12:47:29', NULL, 63030);
INSERT INTO `chart_account` VALUES (163, 'Patent Tax Expense', 1, '2018-08-26 15:10:34', 1, 2, NULL, 100, 1, '2018-08-26 12:48:15', NULL, 63040);
INSERT INTO `chart_account` VALUES (164, 'Salary Tax Expense', 1, '2018-08-26 16:59:26', 1, 2, NULL, 100, 1, '2018-08-26 12:49:01', NULL, 63050);
INSERT INTO `chart_account` VALUES (165, 'Profit Tax', 1, '2018-08-26 15:11:10', 1, 2, NULL, 100, 1, '2018-08-26 12:49:50', NULL, 63060);
INSERT INTO `chart_account` VALUES (166, 'Value Added Tax Payable', 1, '2018-08-26 17:05:50', 1, 2, NULL, 100, 1, '2018-08-26 12:50:37', NULL, 63070);
INSERT INTO `chart_account` VALUES (167, 'Office Rental Tax', 1, '2018-08-26 15:11:57', 1, 2, NULL, 100, 1, '2018-08-26 12:52:08', NULL, 63080);
INSERT INTO `chart_account` VALUES (168, 'Penalty Tax', 1, '2018-08-26 15:12:21', 1, 2, NULL, 100, 1, '2018-08-26 12:52:51', NULL, 63090);
INSERT INTO `chart_account` VALUES (169, 'Tax Registration/ Update Tax', 1, '2018-08-26 15:13:36', 1, 2, NULL, 100, 1, '2018-08-26 12:53:40', NULL, 63100);
INSERT INTO `chart_account` VALUES (170, 'Prepayment Profit Tax', 1, '2018-08-26 15:14:01', 1, 2, NULL, 100, 1, '2018-08-26 12:54:40', NULL, 63110);
INSERT INTO `chart_account` VALUES (171, 'Tax Services', 1, '2018-08-26 15:14:35', 1, 2, NULL, 100, 1, '2018-08-26 12:55:09', NULL, 63120);
INSERT INTO `chart_account` VALUES (172, 'Credit Card Fee Expense', 1, '2018-08-26 15:17:41', 1, 2, NULL, 101, 1, '2018-08-26 13:26:02', NULL, 64030);
INSERT INTO `chart_account` VALUES (173, 'Interest Expense', 1, '2018-08-26 15:18:02', 1, 2, NULL, 101, 1, '2018-08-26 13:27:10', NULL, 63040);
INSERT INTO `chart_account` VALUES (174, 'Gian & Loss Exchange Rate', 1, '2018-08-26 15:18:33', 1, 2, NULL, 101, 1, '2018-08-26 13:27:55', NULL, 63050);
INSERT INTO `chart_account` VALUES (175, 'Cheque Book Expense', 1, '2018-08-26 15:18:50', 1, 2, NULL, 101, 1, '2018-08-26 13:28:45', NULL, 63060);
INSERT INTO `chart_account` VALUES (176, 'Depreciation Expense', 1, '2018-08-26 15:19:09', 1, 2, NULL, 101, 1, '2018-08-26 13:29:16', NULL, 63070);
INSERT INTO `chart_account` VALUES (177, 'Office - Siem Reap Rental', 1, '2018-08-26 14:18:12', 1, 2, NULL, 95, 1, '2018-08-26 13:36:19', NULL, 61310);
INSERT INTO `chart_account` VALUES (178, 'Office - Phnom Penh Rental', 1, '2018-08-26 14:18:33', 1, 2, NULL, 95, 1, '2018-08-26 13:37:01', NULL, 61320);
INSERT INTO `chart_account` VALUES (179, 'Office - Manila Rental', 1, '2018-08-26 14:18:52', 1, 2, NULL, 95, 1, '2018-08-26 13:37:51', NULL, 61330);
INSERT INTO `chart_account` VALUES (180, 'Office - Jakarta Rental', 1, '2018-08-26 14:19:08', 1, 2, NULL, 95, 1, '2018-08-26 13:38:52', NULL, 61340);
INSERT INTO `chart_account` VALUES (181, 'Office - Yangon Rental', 1, '2018-08-26 14:19:24', 1, 2, NULL, 95, 1, '2018-08-26 13:41:43', NULL, 61350);
INSERT INTO `chart_account` VALUES (182, 'Business Trip Expense', 1, '2018-08-26 15:04:43', 1, 2, NULL, 98, 1, '2018-08-26 13:45:48', NULL, 62190);
INSERT INTO `chart_account` VALUES (183, 'Taxi & Transport\'s Expense', 1, '2018-08-26 15:06:13', 1, 2, NULL, 182, 1, '2018-08-26 13:50:26', NULL, 62194);
INSERT INTO `chart_account` VALUES (184, 'Visa & Permission fee', 1, '2018-08-26 15:06:34', 1, 2, NULL, 182, 1, '2018-08-26 13:52:02', NULL, 62195);
INSERT INTO `chart_account` VALUES (185, 'Staff Meal', 1, '2018-08-26 14:45:50', 1, 2, NULL, 16, 1, '2018-08-26 13:57:55', NULL, 61511);
INSERT INTO `chart_account` VALUES (186, 'Staff Mineral Water', 1, '2018-08-26 14:46:06', 1, 2, NULL, 16, 1, '2018-08-26 13:58:33', NULL, 61512);
INSERT INTO `chart_account` VALUES (187, 'Staff Rice Supply', 1, '2018-08-26 14:46:26', 1, 2, NULL, 16, 1, '2018-08-26 13:59:08', NULL, 61513);
INSERT INTO `chart_account` VALUES (188, 'Kitchen Supplies', 1, '2018-08-26 14:46:47', 1, 2, NULL, 16, 1, '2018-08-26 14:03:34', NULL, 61514);
INSERT INTO `chart_account` VALUES (189, 'Staff Cake & Birthday', 1, '2018-08-26 14:44:51', 1, 2, NULL, 97, 1, '2018-08-26 14:07:01', NULL, 61540);
INSERT INTO `chart_account` VALUES (190, 'Snack & Coffee Expense', 1, '2018-08-26 14:48:39', 1, 2, NULL, 16, 1, '2018-08-26 14:48:14', NULL, 61515);
INSERT INTO `chart_account` VALUES (191, 'Salary Expense', 1, '2018-08-26 15:29:16', 1, 2, NULL, 22, 1, '2018-08-26 15:29:16', NULL, 61204);
INSERT INTO `chart_account` VALUES (192, 'Medical Expense', 1, '2018-08-26 15:30:55', 1, 2, NULL, 22, 1, '2018-08-26 15:30:55', NULL, 61205);
INSERT INTO `chart_account` VALUES (193, 'Business License', 1, '2018-08-26 15:33:11', 1, 2, NULL, 97, 1, '2018-08-26 15:33:11', NULL, 61541);
INSERT INTO `chart_account` VALUES (194, 'Tourism License', 1, '2018-08-26 15:33:44', 1, 2, NULL, 97, 1, '2018-08-26 15:33:44', NULL, 61542);
INSERT INTO `chart_account` VALUES (195, 'Electricity Expense', 1, '2018-08-26 15:35:52', 1, 2, NULL, 15, 1, '2018-08-26 15:35:52', NULL, 61101);
INSERT INTO `chart_account` VALUES (196, 'Water usage Expense', 1, '2018-08-26 15:36:52', 1, 2, NULL, 15, 1, '2018-08-26 15:36:52', NULL, 61102);
INSERT INTO `chart_account` VALUES (197, 'City Cleaning fee', 1, '2018-08-26 15:37:21', 1, 2, NULL, 15, 1, '2018-08-26 15:37:21', NULL, 61103);
INSERT INTO `chart_account` VALUES (198, 'Cable TV', 1, '2018-08-26 15:38:01', 1, 2, NULL, 15, 1, '2018-08-26 15:38:01', NULL, 61104);
INSERT INTO `chart_account` VALUES (200, 'Commission', 1, '2018-08-26 16:14:05', 1, 4, NULL, 4, 1, '2018-08-26 16:14:05', NULL, 51000);
INSERT INTO `chart_account` VALUES (202, 'Owner\'s Equity', 1, '2018-08-26 16:28:55', 1, 7, NULL, 42, 1, '2018-08-26 16:28:55', NULL, 31000);
INSERT INTO `chart_account` VALUES (204, 'Owner\'s Investment', 1, '2018-08-26 16:31:24', 1, 7, NULL, 42, 1, '2018-08-26 16:31:24', NULL, 32000);
INSERT INTO `chart_account` VALUES (206, 'Taxation Liability', 1, '2018-08-26 16:55:15', 1, 8, NULL, 0, 1, '2018-08-26 16:55:15', NULL, 23000);
INSERT INTO `chart_account` VALUES (208, 'Loan from Bank', 1, '2018-08-26 17:18:41', 1, 8, NULL, 48, 1, '2018-08-26 17:18:41', NULL, 26020);
INSERT INTO `chart_account` VALUES (209, 'Loan from outside', 1, '2018-08-26 17:19:37', 1, 8, NULL, 48, 1, '2018-08-26 17:19:37', NULL, 26030);
INSERT INTO `chart_account` VALUES (210, 'Business License', 1, '2018-08-26 17:45:04', 1, 9, NULL, 55, 1, '2018-08-26 17:45:04', NULL, 15010);
INSERT INTO `chart_account` VALUES (211, 'Prepaid Office Rental', 1, '2018-08-26 17:46:24', 1, 9, NULL, 55, 1, '2018-08-26 17:46:24', NULL, 15020);
INSERT INTO `chart_account` VALUES (212, 'Prepaid Insurrance', 1, '2018-08-26 17:47:08', 1, 9, NULL, 55, 1, '2018-08-26 17:47:08', NULL, 15030);
INSERT INTO `chart_account` VALUES (213, 'Prepaid Advertising', 1, '2018-08-26 17:48:33', 1, 9, NULL, 55, 1, '2018-08-26 17:48:33', NULL, 15040);
INSERT INTO `chart_account` VALUES (214, 'Prepaid Cable TV', 1, '2018-08-26 17:49:53', 1, 9, NULL, 55, 1, '2018-08-26 17:49:37', NULL, 15050);
INSERT INTO `chart_account` VALUES (215, 'Prepaid of Profit Tax', 1, '2018-08-26 17:50:40', 1, 9, NULL, 55, 1, '2018-08-26 17:50:40', NULL, 15060);
INSERT INTO `chart_account` VALUES (216, 'Prepaid Internet', 1, '2018-08-26 17:51:17', 1, 9, NULL, 55, 1, '2018-08-26 17:51:17', NULL, 15070);
INSERT INTO `chart_account` VALUES (217, 'Prepaid Telephone', 1, '2018-08-26 17:51:55', 1, 9, NULL, 55, 1, '2018-08-26 17:51:55', NULL, 15080);
INSERT INTO `chart_account` VALUES (218, 'Cash Advance', 1, '2018-08-26 17:55:01', 1, 9, NULL, 0, 1, '2018-08-26 17:55:01', NULL, 14000);
INSERT INTO `chart_account` VALUES (219, 'Undeposited fund', 1, '2018-08-26 18:03:49', 1, 9, NULL, 0, 1, '2018-08-26 18:03:49', NULL, 12100);
INSERT INTO `chart_account` VALUES (220, 'Barter Account Clearance', 1, '2018-08-26 18:04:46', 1, 9, NULL, 0, 1, '2018-08-26 18:04:46', NULL, 12200);
INSERT INTO `chart_account` VALUES (221, 'Deposit fund', 1, '2018-08-26 18:15:01', 1, 9, NULL, 0, 1, '2018-08-26 18:15:01', NULL, 16000);
INSERT INTO `chart_account` VALUES (222, 'Deposit for Office Rental', 1, '2018-08-26 18:16:59', 1, 9, NULL, 221, 1, '2018-08-26 18:16:59', NULL, 16100);
INSERT INTO `chart_account` VALUES (223, 'Deposit for Phone Connection', 1, '2018-08-26 18:17:36', 1, 9, NULL, 221, 1, '2018-08-26 18:17:36', NULL, 16200);
INSERT INTO `chart_account` VALUES (224, 'Deposit for Internet', 1, '2018-08-26 18:18:04', 1, 9, NULL, 221, 1, '2018-08-26 18:18:04', NULL, 16300);
INSERT INTO `chart_account` VALUES (225, 'Deposit To Supplier', 1, '2018-08-26 18:18:49', 1, 9, NULL, 221, 1, '2018-08-26 18:18:49', NULL, 16400);
INSERT INTO `chart_account` VALUES (226, 'Deposit Holding', 1, '2018-08-26 18:23:44', 1, 8, NULL, 0, 1, '2018-08-26 18:23:44', NULL, 27000);
INSERT INTO `chart_account` VALUES (227, 'Deposit from Customer', 1, '2018-08-26 18:24:32', 1, 8, NULL, 226, 1, '2018-08-26 18:24:32', NULL, 27100);
INSERT INTO `chart_account` VALUES (228, 'Deposit from Franchise', 1, '2018-08-26 18:28:45', 1, 8, NULL, 226, 1, '2018-08-26 18:28:14', NULL, 27200);
INSERT INTO `chart_account` VALUES (229, 'Accumulated Depreciation', 1, '2018-08-26 18:45:14', 1, 46, NULL, 0, 1, '2018-08-26 18:45:14', NULL, 17000);
INSERT INTO `chart_account` VALUES (230, 'Fixed Asset Class I (5%)', 1, '2018-08-26 18:47:26', 1, 46, NULL, 0, 1, '2018-08-26 18:46:47', NULL, 17100);
INSERT INTO `chart_account` VALUES (231, 'Fixed Asset Class II (50%)', 1, '2018-08-26 18:48:23', 1, 46, NULL, 0, 1, '2018-08-26 18:48:23', NULL, 17200);
INSERT INTO `chart_account` VALUES (232, 'Fixed Asset Class III (25%)', 1, '2018-08-26 18:48:59', 1, 46, NULL, 0, 1, '2018-08-26 18:48:59', NULL, 17300);
INSERT INTO `chart_account` VALUES (233, 'Fixed Asset Class IV (20%)', 1, '2018-08-26 18:49:48', 1, 46, NULL, 0, 1, '2018-08-26 18:49:48', NULL, 17400);
INSERT INTO `chart_account` VALUES (234, 'Cost of Renovate Building', 1, '2018-08-26 18:51:14', 1, 46, NULL, 230, 1, '2018-08-26 18:51:14', NULL, 17101);
INSERT INTO `chart_account` VALUES (235, 'Cost of Plant & Landscape', 1, '2018-08-26 18:52:02', 1, 46, NULL, 230, 1, '2018-08-26 18:52:02', NULL, 17102);
INSERT INTO `chart_account` VALUES (236, 'Cost of Pool Side', 1, '2018-08-26 18:52:36', 1, 46, NULL, 230, 1, '2018-08-26 18:52:36', NULL, 17103);
INSERT INTO `chart_account` VALUES (237, 'Acc. Depre. of Fixed Asset I', 1, '2018-08-26 18:53:20', 1, 46, NULL, 230, 1, '2018-08-26 18:53:20', NULL, 17107);
INSERT INTO `chart_account` VALUES (238, 'Cost of Housekeeping Equipment', 1, '2018-08-26 18:55:05', 1, 46, NULL, 231, 1, '2018-08-26 18:55:05', NULL, 17201);
INSERT INTO `chart_account` VALUES (239, 'Cost of Office Supplies', 1, '2018-08-26 18:55:55', 1, 46, NULL, 231, 1, '2018-08-26 18:55:55', NULL, 17203);
INSERT INTO `chart_account` VALUES (240, 'Cost of Housekeeping Linen', 1, '2018-08-26 18:56:49', 1, 46, NULL, 231, 1, '2018-08-26 18:56:49', NULL, 17204);
INSERT INTO `chart_account` VALUES (241, 'Cost of Finger Print', 1, '2018-08-26 18:57:23', 1, 46, NULL, 231, 1, '2018-08-26 18:57:23', NULL, 17205);
INSERT INTO `chart_account` VALUES (242, 'Cost of Restaurant Linen', 1, '2018-08-26 18:58:51', 1, 46, NULL, 231, 1, '2018-08-26 18:58:51', NULL, 17206);
INSERT INTO `chart_account` VALUES (243, 'Cost of Fire Extinguisher', 1, '2018-08-26 18:59:20', 1, 46, NULL, 231, 1, '2018-08-26 18:59:20', NULL, 17207);
INSERT INTO `chart_account` VALUES (244, 'Cost of Computer & Printer', 1, '2018-08-26 19:00:02', 1, 46, NULL, 231, 1, '2018-08-26 19:00:02', NULL, 17209);
INSERT INTO `chart_account` VALUES (245, 'Cost of Restaurant Funiture', 1, '2018-08-26 19:00:42', 1, 46, NULL, 231, 1, '2018-08-26 19:00:42', NULL, 17210);
INSERT INTO `chart_account` VALUES (246, 'Acc. Depre. of Fixed Asset II', 1, '2018-08-26 19:01:40', 1, 46, NULL, 231, 1, '2018-08-26 19:01:40', NULL, 17220);
INSERT INTO `chart_account` VALUES (247, 'Cost of Machine', 1, '2018-08-26 19:02:30', 1, 46, NULL, 232, 1, '2018-08-26 19:02:30', NULL, 17301);
INSERT INTO `chart_account` VALUES (248, 'Cost of Camera', 1, '2018-08-26 19:03:07', 1, 46, NULL, 232, 1, '2018-08-26 19:03:07', NULL, 17302);
INSERT INTO `chart_account` VALUES (250, 'Cost of Coffee Machine', 1, '2018-08-26 19:04:19', 1, 46, NULL, 232, 1, '2018-08-26 19:04:19', NULL, 17304);
INSERT INTO `chart_account` VALUES (251, 'Cost of Office Equipment', 1, '2018-08-26 19:05:06', 1, 46, NULL, 232, 1, '2018-08-26 19:05:06', NULL, 17305);
INSERT INTO `chart_account` VALUES (252, 'Cost of Housekeeping Tool', 1, '2018-08-26 19:05:56', 1, 46, NULL, 232, 1, '2018-08-26 19:05:56', NULL, 17306);
INSERT INTO `chart_account` VALUES (253, 'Cost of Sound System', 1, '2018-08-26 19:06:29', 1, 46, NULL, 232, 1, '2018-08-26 19:06:29', NULL, 17307);
INSERT INTO `chart_account` VALUES (254, 'Cost of Funiture & Fixture', 1, '2018-08-26 19:07:35', 1, 46, NULL, 232, 1, '2018-08-26 19:07:35', NULL, 17308);
INSERT INTO `chart_account` VALUES (255, 'Cost of Statues', 1, '2018-08-26 19:08:09', 1, 46, NULL, 232, 1, '2018-08-26 19:08:09', NULL, 17309);
INSERT INTO `chart_account` VALUES (256, 'Kitchen Equipment', 1, '2018-08-26 19:08:57', 1, 46, NULL, 232, 1, '2018-08-26 19:08:57', NULL, 17310);
INSERT INTO `chart_account` VALUES (257, 'Cost of Kitchen Equipment', 1, '2018-08-26 19:09:30', 1, 46, NULL, 232, 1, '2018-08-26 19:09:30', NULL, 17311);
INSERT INTO `chart_account` VALUES (258, 'Cost of Painting', 1, '2018-08-26 19:18:23', 1, 46, NULL, 232, 1, '2018-08-26 19:18:23', NULL, 17312);
INSERT INTO `chart_account` VALUES (259, 'Cost of Telephone System', 1, '2018-08-26 19:20:33', 1, 46, NULL, 232, 1, '2018-08-26 19:20:33', NULL, 17313);
INSERT INTO `chart_account` VALUES (260, 'Cost of Kitchen Utensil', 1, '2018-08-26 19:22:26', 1, 46, NULL, 232, 1, '2018-08-26 19:22:26', NULL, 17314);
INSERT INTO `chart_account` VALUES (261, 'Cost of Restaurant Utensils', 1, '2018-08-26 19:23:01', 1, 46, NULL, 232, 1, '2018-08-26 19:23:01', NULL, 17315);
INSERT INTO `chart_account` VALUES (262, 'Cost of Restaurant Equipment', 1, '2018-08-26 19:23:38', 1, 46, NULL, 232, 1, '2018-08-26 19:23:38', NULL, 17316);
INSERT INTO `chart_account` VALUES (263, 'Cost of Water System', 1, '2018-08-26 19:24:08', 1, 46, NULL, 232, 1, '2018-08-26 19:24:08', NULL, 17317);
INSERT INTO `chart_account` VALUES (264, 'Cost of Main Server System', 1, '2018-08-26 19:24:40', 1, 46, NULL, 232, 1, '2018-08-26 19:24:40', NULL, 17319);
INSERT INTO `chart_account` VALUES (265, 'Cost of Internet & Wifi Setup', 1, '2018-08-26 19:25:20', 1, 46, NULL, 232, 1, '2018-08-26 19:25:20', NULL, 17321);
INSERT INTO `chart_account` VALUES (266, 'Acc. Depre. of Fixed Asset III', 1, '2018-08-26 19:26:02', 1, 46, NULL, 232, 1, '2018-08-26 19:26:02', NULL, 17330);
INSERT INTO `chart_account` VALUES (267, 'Cost of Air-conditioner', 1, '2018-08-26 19:27:47', 1, 46, NULL, 233, 1, '2018-08-26 19:27:47', NULL, 17402);
INSERT INTO `chart_account` VALUES (268, 'Cost of Electricity System', 1, '2018-08-26 19:28:27', 1, 46, NULL, 233, 1, '2018-08-26 19:28:27', NULL, 17408);
INSERT INTO `chart_account` VALUES (269, 'Acc. Depre. of Fixed Asset IV', 1, '2018-08-26 19:29:08', 1, 46, NULL, 233, 1, '2018-08-26 19:29:08', NULL, 17410);
INSERT INTO `chart_account` VALUES (270, 'Long Term Liabilities', 1, '2018-08-27 22:42:07', 1, 8, NULL, 0, 1, '2018-08-27 22:35:19', NULL, 28000);
INSERT INTO `chart_account` VALUES (271, 'Lease ? Vehicles', 1, '2018-08-27 22:42:54', 1, 8, NULL, 270, 1, '2018-08-27 22:37:14', NULL, 28100);
INSERT INTO `chart_account` VALUES (272, 'Lease ? Building', 1, '2018-08-27 22:43:09', 1, 8, NULL, 270, 1, '2018-08-27 22:37:51', NULL, 28200);
INSERT INTO `chart_account` VALUES (273, 'Opening Balance Equity', 1, '2019-01-13 16:53:06', 1, 7, 26, 42, 1, '2019-01-13 16:52:24', NULL, 34000);
INSERT INTO `chart_account` VALUES (274, 'Sacom Bank : eOcambo Technology | 00032882', 1, '2019-06-26 13:45:42', 1, 3, NULL, 64, 1, '2018-07-02 16:23:21', 13, 11101);
INSERT INTO `chart_account` VALUES (275, 'ABA Bank: PHICH SOKDA (No. 000120354)', 1, '2019-06-24 08:16:55', 1, 3, NULL, 64, 1, '2018-08-11 19:18:30', 1, 11102);
COMMIT;

-- ----------------------------
-- Table structure for city
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
-- Records of city
-- ----------------------------
BEGIN;
INSERT INTO `city` VALUES (1, 56, 'PNH', 'Phnom Penh', '', NULL, '', 0, 0, 1000016, '2018-08-12 19:46:33', 1, 1000016, '2018-08-12 19:45:12');
INSERT INTO `city` VALUES (2, 56, 'BMC', 'Banteay Meanchey', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:43:53', 1, 1000016, '2018-08-12 20:43:53');
INSERT INTO `city` VALUES (3, 56, 'BBM', 'Battambang', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:44:12', 1, 1000016, '2018-08-12 20:44:12');
INSERT INTO `city` VALUES (4, 56, 'KPC', 'Kampong Cham', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:44:57', 1, 1000016, '2018-08-12 20:44:57');
INSERT INTO `city` VALUES (5, 56, 'KZC', 'Kampong Chhnang', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:45:45', 1, 1000016, '2018-08-12 20:45:45');
INSERT INTO `city` VALUES (6, 56, 'KPS', 'Kampong Speu', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:46:13', 1, 1000016, '2018-08-12 20:46:13');
INSERT INTO `city` VALUES (7, 56, 'KZK', 'Kampong Thom', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:46:32', 1, 1000016, '2018-08-12 20:46:32');
INSERT INTO `city` VALUES (8, 56, 'KMT', 'Kampot', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:46:59', 1, 1000016, '2018-08-12 20:46:59');
INSERT INTO `city` VALUES (9, 56, 'KDL', 'Kandal', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:47:18', 1, 1000016, '2018-08-12 20:47:18');
INSERT INTO `city` VALUES (10, 56, 'KKZ', 'Koh Kong', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:47:44', 1, 1000016, '2018-08-12 20:47:44');
INSERT INTO `city` VALUES (11, 56, 'KEP', 'Kep', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:38:22', 1, 1000016, '2018-08-12 20:38:22');
INSERT INTO `city` VALUES (12, 56, 'KTI', 'Kratie', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:38:51', 1, 1000016, '2018-08-12 20:38:51');
INSERT INTO `city` VALUES (13, 56, 'MWV', 'Mondulkiri', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:39:19', 1, 1000016, '2018-08-12 20:39:19');
INSERT INTO `city` VALUES (14, 56, 'OMC', 'Oddar Meanchey', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:39:41', 1, 1000016, '2018-08-12 20:39:41');
INSERT INTO `city` VALUES (15, 56, 'PAI', 'Pailin', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:40:35', 1, 1000016, '2018-08-12 20:40:35');
INSERT INTO `city` VALUES (16, 56, 'KOS', 'Sihanoukville', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:41:11', 1, 1000016, '2018-08-12 20:41:11');
INSERT INTO `city` VALUES (17, 56, 'OMY', 'Preah Vihear', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:42:09', 1, 1000016, '2018-08-12 20:42:09');
INSERT INTO `city` VALUES (18, 56, 'KZD', 'Pursat', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:42:41', 1, 1000016, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (19, 56, 'PVG', 'Prey Veng', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:43:07', 1, 1000016, '2018-08-12 20:43:07');
INSERT INTO `city` VALUES (20, 56, 'RBE', 'Rattankiri', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:43:27', 1, 1000016, '2018-08-12 20:43:27');
INSERT INTO `city` VALUES (21, 56, 'REP', 'Siem Reap', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:33:40', 1, 1000016, '2018-08-12 20:33:40');
INSERT INTO `city` VALUES (22, 56, 'TNX', 'Stung Treng', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:34:20', 1, 1000016, '2018-08-12 20:34:20');
INSERT INTO `city` VALUES (23, 56, 'SVR', 'Svay Rieng', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:36:23', 1, 1000016, '2018-08-12 20:36:23');
INSERT INTO `city` VALUES (24, 56, 'TKO', 'Takeo', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:36:59', 1, 1000016, '2018-08-12 20:36:59');
INSERT INTO `city` VALUES (25, 56, 'TBK', 'Tbong Khmum', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:37:25', 1, 1000016, '2018-08-12 20:37:25');
INSERT INTO `city` VALUES (26, 237, 'BKK', 'Bangkok', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:37:58', 1, 1000016, '2018-08-12 20:37:58');
INSERT INTO `city` VALUES (44, 194, 'ABR', 'Abra', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:27:04', 1, 1000016, '2018-08-12 21:27:04');
INSERT INTO `city` VALUES (45, 194, 'AGN', 'Agusan del Norte', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:29:25', 1, 1000016, '2018-08-12 21:29:25');
INSERT INTO `city` VALUES (46, 194, 'AGS', 'Agusan del Sur', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:30:12', 1, 1000016, '2018-08-12 21:30:12');
INSERT INTO `city` VALUES (47, 194, 'AKL', 'Aklan', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:30:59', 1, 1000016, '2018-08-12 21:30:59');
INSERT INTO `city` VALUES (48, 194, 'ALB', 'Albay', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:31:53', 1, 1000016, '2018-08-12 21:31:53');
INSERT INTO `city` VALUES (49, 194, 'ANT', 'Antique', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:32:51', 1, 1000016, '2018-08-12 21:32:51');
INSERT INTO `city` VALUES (50, 194, 'APA', 'Apayao', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:33:45', 1, 1000016, '2018-08-12 21:33:45');
INSERT INTO `city` VALUES (51, 194, 'AUR', 'Aurora', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:34:22', 1, 1000016, '2018-08-12 21:34:22');
INSERT INTO `city` VALUES (52, 194, 'BAS', 'Basilan', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:35:13', 1, 1000016, '2018-08-12 21:35:13');
INSERT INTO `city` VALUES (53, 194, 'BAN', 'Bataan', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:35:49', 1, 1000016, '2018-08-12 21:35:49');
INSERT INTO `city` VALUES (54, 194, 'BTN', 'Batanes', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:36:57', 1, 1000016, '2018-08-12 21:36:57');
INSERT INTO `city` VALUES (55, 194, 'BTG', 'Batangas', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:37:44', 1, 1000016, '2018-08-12 21:37:44');
INSERT INTO `city` VALUES (56, 194, 'BEN', 'Benguet', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:38:27', 1, 1000016, '2018-08-12 21:38:27');
INSERT INTO `city` VALUES (57, 194, 'BIL', 'Biliran', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:40:16', 1, 1000016, '2018-08-12 21:40:16');
INSERT INTO `city` VALUES (58, 194, 'BOH', 'Bohol', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:41:00', 1, 1000016, '2018-08-12 21:41:00');
INSERT INTO `city` VALUES (59, 194, 'BUK', 'Bukidnon', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:41:42', 1, 1000016, '2018-08-12 21:41:42');
INSERT INTO `city` VALUES (60, 194, 'BUL', 'Bulacan', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:42:18', 1, 1000016, '2018-08-12 21:42:18');
INSERT INTO `city` VALUES (61, 194, 'CAG', 'Cagayan', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:42:55', 1, 1000016, '2018-08-12 21:42:55');
INSERT INTO `city` VALUES (62, 194, 'CAN', 'Camarines Norte', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:43:41', 1, 1000016, '2018-08-12 21:43:41');
INSERT INTO `city` VALUES (63, 194, 'CAS', 'Camarines Sur', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:45:13', 1, 1000016, '2018-08-12 21:45:13');
INSERT INTO `city` VALUES (64, 194, 'CAM', 'Camiguin', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:47:36', 1, 1000016, '2018-08-12 21:47:36');
INSERT INTO `city` VALUES (65, 194, 'CAP', 'Capiz', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:48:18', 1, 1000016, '2018-08-12 21:48:18');
INSERT INTO `city` VALUES (66, 194, 'CAT', 'Catanduanes', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:49:12', 1, 1000016, '2018-08-12 21:49:12');
INSERT INTO `city` VALUES (67, 194, 'CAV', 'Cavite', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:49:54', 1, 1000016, '2018-08-12 21:49:54');
INSERT INTO `city` VALUES (68, 194, 'CEB', 'Cebu', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:50:32', 1, 1000016, '2018-08-12 21:50:32');
INSERT INTO `city` VALUES (69, 194, 'COM', 'Compostela Valley', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:51:28', 1, 1000016, '2018-08-12 21:51:28');
INSERT INTO `city` VALUES (70, 194, 'NCO', 'Cotabato', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:51:58', 1, 1000016, '2018-08-12 21:51:58');
INSERT INTO `city` VALUES (71, 194, 'DAV', 'Davao del Norte', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:52:54', 1, 1000016, '2018-08-12 21:52:54');
INSERT INTO `city` VALUES (72, 194, 'DAS', 'Davao del Sur', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:53:45', 1, 1000016, '2018-08-12 21:53:45');
INSERT INTO `city` VALUES (73, 194, 'DVO', 'Davao Occidental', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:54:16', 1, 1000016, '2018-08-12 21:54:16');
INSERT INTO `city` VALUES (74, 194, 'DAO', 'Davao Oriental', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:54:58', 1, 1000016, '2018-08-12 21:54:58');
INSERT INTO `city` VALUES (75, 194, 'DIN', 'Dinagat Islands', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:55:46', 1, 1000016, '2018-08-12 21:55:46');
INSERT INTO `city` VALUES (76, 194, 'EAS', 'Eastern Samar', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:56:28', 1, 1000016, '2018-08-12 21:56:28');
INSERT INTO `city` VALUES (77, 194, 'GUI', 'Guimaras', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:59:20', 1, 1000016, '2018-08-12 21:59:20');
INSERT INTO `city` VALUES (78, 194, 'IFU', 'Ifugao', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:59:54', 1, 1000016, '2018-08-12 21:59:54');
INSERT INTO `city` VALUES (79, 194, 'ILN', 'Ilocos Norte', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:00:44', 1, 1000016, '2018-08-12 22:00:44');
INSERT INTO `city` VALUES (80, 194, 'ILS', 'Ilocos Sur', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:01:33', 1, 1000016, '2018-08-12 22:01:33');
INSERT INTO `city` VALUES (81, 194, 'ILI', 'Iloilo', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:02:23', 1, 1000016, '2018-08-12 22:02:23');
INSERT INTO `city` VALUES (82, 194, 'ISA', 'Isabela', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:03:06', 1, 1000016, '2018-08-12 22:03:06');
INSERT INTO `city` VALUES (83, 194, 'KAL', 'Kalinga', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:03:39', 1, 1000016, '2018-08-12 22:03:39');
INSERT INTO `city` VALUES (84, 194, 'LUN', 'La Union', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:04:15', 1, 1000016, '2018-08-12 22:04:15');
INSERT INTO `city` VALUES (85, 194, 'LAG', 'Laguna', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:05:08', 1, 1000016, '2018-08-12 22:05:08');
INSERT INTO `city` VALUES (86, 194, 'LAN', 'Lanao del Norte', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:05:53', 1, 1000016, '2018-08-12 22:05:53');
INSERT INTO `city` VALUES (87, 194, 'LAS', 'Lanao del Sur', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:06:27', 1, 1000016, '2018-08-12 22:06:27');
INSERT INTO `city` VALUES (88, 194, 'LEY', 'Leyte', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:07:04', 1, 1000016, '2018-08-12 22:07:04');
INSERT INTO `city` VALUES (89, 194, 'MAG', 'Maguindanao', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:07:58', 1, 1000016, '2018-08-12 22:07:58');
INSERT INTO `city` VALUES (90, 194, 'MAD', 'Marinduque', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:08:32', 1, 1000016, '2018-08-12 22:08:32');
INSERT INTO `city` VALUES (91, 194, 'MAS', 'Masbate', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:09:00', 1, 1000016, '2018-08-12 22:09:00');
INSERT INTO `city` VALUES (92, 194, 'MSC', 'Misamis Occidental', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:09:42', 1, 1000016, '2018-08-12 22:09:42');
INSERT INTO `city` VALUES (93, 194, 'MSR', 'Misamis Oriental', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:14:50', 1, 1000016, '2018-08-12 22:14:50');
INSERT INTO `city` VALUES (94, 194, 'MOU', 'Mountain', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:16:01', 1, 1000016, '2018-08-12 22:16:01');
INSERT INTO `city` VALUES (95, 194, 'NEC', 'Negros Occidental', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:17:39', 1, 1000016, '2018-08-12 22:17:39');
INSERT INTO `city` VALUES (96, 194, 'NER', 'Negros Oriental', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:18:13', 1, 1000016, '2018-08-12 22:18:13');
INSERT INTO `city` VALUES (97, 194, 'NSA', 'Northern Samar', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:19:23', 1, 1000016, '2018-08-12 22:19:23');
INSERT INTO `city` VALUES (98, 194, 'NUE', 'Nueva Ecija', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:20:23', 1, 1000016, '2018-08-12 22:20:23');
INSERT INTO `city` VALUES (99, 194, 'NUV', 'Nueva Vizcaya', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:21:16', 1, 1000016, '2018-08-12 22:21:16');
INSERT INTO `city` VALUES (100, 194, 'MDC', 'Occidental Mindoro', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:22:01', 1, 1000016, '2018-08-12 22:22:01');
INSERT INTO `city` VALUES (101, 194, 'MDR', 'Oriental Mindoro', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:23:39', 1, 1000016, '2018-08-12 22:23:39');
INSERT INTO `city` VALUES (102, 194, 'PLW', 'Palawan', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:25:32', 1, 1000016, '2018-08-12 22:25:32');
INSERT INTO `city` VALUES (103, 194, 'PAM', 'Pampanga', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:26:25', 1, 1000016, '2018-08-12 22:26:25');
INSERT INTO `city` VALUES (104, 194, 'PAN', 'Pangasinan', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:27:01', 1, 1000016, '2018-08-12 22:27:01');
INSERT INTO `city` VALUES (105, 194, 'QUE', 'Quezon', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:27:42', 1, 1000016, '2018-08-12 22:27:42');
INSERT INTO `city` VALUES (106, 194, 'QUI', 'Quirino', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:28:46', 1, 1000016, '2018-08-12 22:28:46');
INSERT INTO `city` VALUES (107, 194, 'RIZ', 'Rizal', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:29:37', 1, 1000016, '2018-08-12 22:29:37');
INSERT INTO `city` VALUES (108, 194, 'ROM', 'Romblon', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:30:47', 1, 1000016, '2018-08-12 22:30:47');
INSERT INTO `city` VALUES (109, 194, 'WSA', 'Samar', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:31:45', 1, 1000016, '2018-08-12 22:31:45');
INSERT INTO `city` VALUES (110, 194, 'SAR', 'Sarangani', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:32:27', 1, 1000016, '2018-08-12 22:32:27');
INSERT INTO `city` VALUES (111, 194, 'SIG', 'Siquijor', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:33:18', 1, 1000016, '2018-08-12 22:33:18');
INSERT INTO `city` VALUES (112, 194, 'SOR', 'Sorsogon', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:42:49', 1, 1000016, '2018-08-12 22:42:49');
INSERT INTO `city` VALUES (113, 194, 'SCO', 'South Cotabato', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:43:31', 1, 1000016, '2018-08-12 22:43:31');
INSERT INTO `city` VALUES (114, 194, 'SLE', 'Southern Leyte', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:44:18', 1, 1000016, '2018-08-12 22:44:18');
INSERT INTO `city` VALUES (115, 194, 'SUK', 'Sultan Kudarat', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:44:48', 1, 1000016, '2018-08-12 22:44:48');
INSERT INTO `city` VALUES (116, 194, 'SLU', 'Sulu', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:45:25', 1, 1000016, '2018-08-12 22:45:25');
INSERT INTO `city` VALUES (117, 194, 'SUN', 'Surigao del Norte', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:46:00', 1, 1000016, '2018-08-12 22:46:00');
INSERT INTO `city` VALUES (118, 194, 'SUR', 'Surigao del Sur', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:46:33', 1, 1000016, '2018-08-12 22:46:33');
INSERT INTO `city` VALUES (119, 194, 'TAR', 'Tarlac', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:47:05', 1, 1000016, '2018-08-12 22:47:05');
INSERT INTO `city` VALUES (120, 194, 'TAW', 'Tawi-Tawi', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:47:44', 1, 1000016, '2018-08-12 22:47:44');
INSERT INTO `city` VALUES (121, 194, 'ZMB', 'Zambales', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:48:37', 1, 1000016, '2018-08-12 22:48:37');
INSERT INTO `city` VALUES (122, 194, 'ZAN', 'Zamboanga del Norte', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:49:23', 1, 1000016, '2018-08-12 22:49:23');
INSERT INTO `city` VALUES (123, 194, 'ZAS', 'Zamboanga del Sur', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:50:14', 1, 1000016, '2018-08-12 22:50:14');
INSERT INTO `city` VALUES (124, 194, 'ZSI', 'Zamboanga Sibugay', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:50:54', 1, 1000016, '2018-08-12 22:50:54');
INSERT INTO `city` VALUES (125, 194, 'MNL', 'Manila', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:53:44', 1, 1000016, '2018-08-12 22:53:44');
INSERT INTO `city` VALUES (126, 153, 'KUL', 'Kuala Lumpur', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:02:04', 1, 1000016, '2018-08-12 23:02:04');
INSERT INTO `city` VALUES (127, 153, 'PEN', 'Penang', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:03:11', 1, 1000016, '2018-08-12 23:03:11');
INSERT INTO `city` VALUES (128, 153, 'MKZ', 'Melaka', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:05:51', 1, 1000016, '2018-08-12 23:05:51');
INSERT INTO `city` VALUES (129, 153, 'JHB', 'Johor Bahru', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:15:02', 1, 1000016, '2018-08-12 23:15:02');
INSERT INTO `city` VALUES (130, 153, 'LGK', 'Langkawi', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:16:17', 1, 1000016, '2018-08-12 23:16:17');
INSERT INTO `city` VALUES (131, 153, 'IPH', 'Ipoh', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:19:38', 1, 1000016, '2018-08-12 23:19:38');
INSERT INTO `city` VALUES (132, 153, 'KBR', 'Kota Bharu', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:21:09', 1, 1000016, '2018-08-12 23:21:09');
INSERT INTO `city` VALUES (133, 153, 'TGG', 'Kuala Terengganu', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:21:56', 1, 1000016, '2018-08-12 23:21:56');
INSERT INTO `city` VALUES (134, 153, 'KUA', 'Kuantan', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:22:58', 1, 1000016, '2018-08-12 23:22:58');
INSERT INTO `city` VALUES (135, 153, 'KCH', 'Kuching', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:25:12', 1, 1000016, '2018-08-12 23:25:12');
INSERT INTO `city` VALUES (136, 153, 'BKI', 'Kota Kinabalu', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:28:59', 1, 1000016, '2018-08-12 23:28:59');
INSERT INTO `city` VALUES (137, 153, 'SZB', 'Subang', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:35:40', 1, 1000016, '2018-08-12 23:35:40');
INSERT INTO `city` VALUES (138, 153, 'TWU', 'Tawau', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:38:44', 1, 1000016, '2018-08-12 23:38:44');
INSERT INTO `city` VALUES (139, 153, 'SDK', 'Sandakan', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:39:39', 1, 1000016, '2018-08-12 23:39:39');
INSERT INTO `city` VALUES (140, 121, 'BXW', 'Bawean', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:01:57', 1, 1000016, '2018-08-13 00:01:57');
INSERT INTO `city` VALUES (141, 121, 'BDO', 'Bandung', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:02:36', 1, 1000016, '2018-08-13 00:02:36');
INSERT INTO `city` VALUES (142, 121, 'BWX', 'Banyuwangi ', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:03:22', 1, 1000016, '2018-08-13 00:03:22');
INSERT INTO `city` VALUES (143, 121, 'TSY', 'Tasikmalaya', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:03:55', 1, 1000016, '2018-08-13 00:03:55');
INSERT INTO `city` VALUES (144, 121, 'CBN', 'Cirebon', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:04:39', 1, 1000016, '2018-08-13 00:04:39');
INSERT INTO `city` VALUES (145, 121, 'CXP', 'Cilacap', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:05:06', 1, 1000016, '2018-08-13 00:05:06');
INSERT INTO `city` VALUES (146, 121, 'CGK', 'Jakarta', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:05:52', 1, 1000016, '2018-08-13 00:05:52');
INSERT INTO `city` VALUES (147, 121, 'BTO', 'Tangerang', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:09:22', 1, 1000016, '2018-08-13 00:09:22');
INSERT INTO `city` VALUES (148, 121, 'KJT', 'Majalengka', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:09:55', 1, 1000016, '2018-08-13 00:09:55');
INSERT INTO `city` VALUES (149, 121, 'SRG', 'Semarang', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:10:32', 1, 1000016, '2018-08-13 00:10:32');
INSERT INTO `city` VALUES (150, 121, 'SUB', 'Surabaya', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:11:04', 1, 1000016, '2018-08-13 00:11:04');
INSERT INTO `city` VALUES (151, 121, 'SOC', 'Surakarta', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:11:48', 1, 1000016, '2018-08-13 00:11:48');
INSERT INTO `city` VALUES (152, 121, 'JOG', 'Yogyakarta', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:12:49', 1, 1000016, '2018-08-13 00:12:49');
INSERT INTO `city` VALUES (154, 121, 'TKG', 'Bandar Lampung', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:15:20', 1, 1000016, '2018-08-13 00:15:20');
INSERT INTO `city` VALUES (155, 121, 'BTH', 'Batam', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:15:53', 1, 1000016, '2018-08-13 00:15:53');
INSERT INTO `city` VALUES (156, 121, 'LSE', 'Batu Islands', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:16:47', 1, 1000016, '2018-08-13 00:16:47');
INSERT INTO `city` VALUES (157, 121, 'BKS', 'Bengkulu', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:18:00', 1, 1000016, '2018-08-13 00:18:00');
INSERT INTO `city` VALUES (158, 121, 'DUM', 'Dumai', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:18:45', 1, 1000016, '2018-08-13 00:18:45');
INSERT INTO `city` VALUES (159, 121, 'GNS', 'Gunung Sitoli', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:19:23', 1, 1000016, '2018-08-13 00:19:23');
INSERT INTO `city` VALUES (160, 121, 'DJB', 'Jambi City', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:20:04', 1, 1000016, '2018-08-13 00:20:04');
INSERT INTO `city` VALUES (161, 121, 'LLG', 'Lubuklinggau', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:20:57', 1, 1000016, '2018-08-13 00:20:57');
INSERT INTO `city` VALUES (162, 121, 'KNO ', 'Medan', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:21:42', 1, 1000016, '2018-08-13 00:21:42');
INSERT INTO `city` VALUES (163, 121, 'PDG', 'Padang', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:22:27', 1, 1000016, '2018-08-13 00:22:27');
INSERT INTO `city` VALUES (164, 121, 'PLM', 'Palembang', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:23:15', 1, 1000016, '2018-08-13 00:23:15');
INSERT INTO `city` VALUES (165, 121, 'PGK', 'Pangkal Pinang', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:23:52', 1, 1000016, '2018-08-13 00:23:52');
INSERT INTO `city` VALUES (166, 121, 'PKU', 'Pekanbaru', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:24:36', 1, 1000016, '2018-08-13 00:24:36');
INSERT INTO `city` VALUES (167, 121, 'NTX', 'Ranai', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:25:16', 1, 1000016, '2018-08-13 00:25:16');
INSERT INTO `city` VALUES (168, 121, 'FLZ', 'Sibolga', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:25:43', 1, 1000016, '2018-08-13 00:25:43');
INSERT INTO `city` VALUES (169, 121, 'DTB', 'Siborong-Borong', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:28:09', 1, 1000016, '2018-08-13 00:28:09');
INSERT INTO `city` VALUES (170, 121, 'SNX', 'Sinabang', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:29:15', 1, 1000016, '2018-08-13 00:29:15');
INSERT INTO `city` VALUES (171, 121, 'RKI', 'Sipora', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:29:55', 1, 1000016, '2018-08-13 00:29:55');
INSERT INTO `city` VALUES (172, 121, 'MEQ', 'Suka Makmue', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:30:35', 1, 1000016, '2018-08-13 00:30:35');
INSERT INTO `city` VALUES (173, 121, 'TXE', 'Takengon', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:31:09', 1, 1000016, '2018-08-13 00:31:09');
INSERT INTO `city` VALUES (174, 121, 'TJQ', 'Tanjung Pandan', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:31:39', 1, 1000016, '2018-08-13 00:31:39');
INSERT INTO `city` VALUES (175, 121, 'TNJ', 'Tanjung Pinang', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:32:06', 1, 1000016, '2018-08-13 00:32:06');
INSERT INTO `city` VALUES (176, 121, 'BPN', 'Balikpapan', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:32:37', 1, 1000016, '2018-08-13 00:32:37');
INSERT INTO `city` VALUES (177, 121, 'BDJ', 'Banjarmasin', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:33:09', 1, 1000016, '2018-08-13 00:33:09');
INSERT INTO `city` VALUES (178, 121, 'BEJ', 'Tanjung Redep', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:34:20', 1, 1000016, '2018-08-13 00:34:20');
INSERT INTO `city` VALUES (179, 121, 'BXT', 'Bontang', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:34:59', 1, 1000016, '2018-08-13 00:34:59');
INSERT INTO `city` VALUES (180, 121, 'DTD', 'Mahakam Ulu', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:35:29', 1, 1000016, '2018-08-13 00:35:29');
INSERT INTO `city` VALUES (181, 121, 'KTG', 'Ketapang', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:35:55', 1, 1000016, '2018-08-13 00:35:55');
INSERT INTO `city` VALUES (182, 121, 'LPU', 'Long Apung', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:36:23', 1, 1000016, '2018-08-13 00:36:23');
INSERT INTO `city` VALUES (183, 121, 'LBW', 'Long Bawan', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:36:52', 1, 1000016, '2018-08-13 00:36:52');
INSERT INTO `city` VALUES (184, 121, 'NNX', 'Nunukan', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:37:21', 1, 1000016, '2018-08-13 00:37:21');
INSERT INTO `city` VALUES (185, 121, 'PKY', 'Palangkaraya', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:37:53', 1, 1000016, '2018-08-13 00:37:53');
INSERT INTO `city` VALUES (186, 121, 'PKN', 'Pangkalanbun', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:38:18', 1, 1000016, '2018-08-13 00:38:18');
INSERT INTO `city` VALUES (187, 121, 'PNK', 'Pontianak', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:38:43', 1, 1000016, '2018-08-13 00:38:43');
INSERT INTO `city` VALUES (188, 121, 'PSU', 'Putussibau', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:39:06', 1, 1000016, '2018-08-13 00:39:06');
INSERT INTO `city` VALUES (189, 121, 'SRI', 'Samarinda', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:39:45', 1, 1000016, '2018-08-13 00:39:44');
INSERT INTO `city` VALUES (190, 121, 'TRK', 'Tarakan', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:45:46', 1, 1000016, '2018-08-13 00:45:46');
INSERT INTO `city` VALUES (191, 121, 'BUW', 'Bau-Bau', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:47:02', 1, 1000016, '2018-08-13 00:47:02');
INSERT INTO `city` VALUES (192, 121, 'GTO', 'Gorontalo', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:47:30', 1, 1000016, '2018-08-13 00:47:30');
INSERT INTO `city` VALUES (193, 121, 'KDI', 'Kendari', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:48:02', 1, 1000016, '2018-08-13 00:48:02');
INSERT INTO `city` VALUES (194, 121, 'UPG', 'Makassar', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:48:31', 1, 1000016, '2018-08-13 00:48:31');
INSERT INTO `city` VALUES (195, 121, 'MJU', 'Mamuju', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:49:06', 1, 1000016, '2018-08-13 00:49:06');
INSERT INTO `city` VALUES (196, 121, 'MDC', 'Manado', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:49:45', 1, 1000016, '2018-08-13 00:49:45');
INSERT INTO `city` VALUES (197, 58, 'YYJ', 'British Columbia', '', NULL, 'fRwR9oqvNsM', 38, 77, 1000017, '2018-08-13 13:22:58', 1, 1000017, '2018-08-13 12:46:10');
INSERT INTO `city` VALUES (198, 258, 'VCA', 'Can Tho', '', NULL, '', 0, 0, 1000028, '2018-08-13 17:59:36', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (199, 258, 'VCL', 'Chu Lai', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (200, 258, 'DLI', 'Da Lat', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (201, 258, 'DAD', 'Da Nang', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (202, 258, 'HPH', 'Hai Phong', '', NULL, '', 20.8648, 106.683, 1000028, '2018-08-13 18:11:12', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (203, 258, 'HAN', 'Hanoi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (204, 258, 'SGN', 'Ho Chi Minh City', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (205, 258, 'HUI', 'Hue', '', NULL, '', 0, 0, 1000028, '2018-08-13 17:59:54', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (206, 258, 'CXR', 'Nha Trang', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (207, 258, 'PQC', 'Phu Quoc', '', NULL, '', 0, 0, 1000028, '2018-08-13 18:00:12', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (208, 258, 'VII', 'Vinh', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (209, 258, 'BMV', 'Buon Ma Thuot', '', NULL, '', 0, 0, 1000028, '2018-08-13 18:00:29', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (210, 258, 'CAH', 'Ca Mau', '', NULL, '', 0, 0, 1000028, '2018-08-13 18:01:17', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (211, 258, 'VCS', 'Con Dao', '', NULL, '', 0, 0, 1000028, '2018-08-13 18:04:55', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (212, 258, 'DIN', 'Dien Bien Phu', '', NULL, '', 0, 0, 1000028, '2018-08-13 18:04:33', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (213, 258, 'VDH', 'Dong Hoi', '', NULL, '', 0, 0, 1000028, '2018-08-13 18:02:00', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (214, 258, 'PXU', 'Pleiku', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (215, 258, 'UIH', 'Qui Nh?n', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (216, 258, 'VKG', 'Rach Gia', '', NULL, '', 0, 0, 1000028, '2018-08-13 18:04:17', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (217, 258, 'SQH', 'S?n La', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (218, 258, 'TBB', 'Tuy Hoa', '', NULL, '', 0, 0, 1000028, '2018-08-13 18:02:19', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (219, 258, 'VTG', 'Vung Tau', '', NULL, '', 0, 0, 1000028, '2018-08-13 18:05:56', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (220, 258, 'THD', 'Thanh Hoa', '', NULL, '', 0, 0, 1000028, '2018-08-13 18:06:16', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (224, 237, 'ACR', 'Amnat Charoen', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (225, 237, 'ATG', 'Ang Thong', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (226, 237, 'BKN', 'Bueng Kan', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (227, 237, 'BRM', 'Buriram', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (228, 237, 'CCO', 'Chachoengsao', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (229, 237, 'CNT', 'Chai Nat', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (230, 237, 'CPM', 'Chaiyaphum', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (231, 237, 'CTI', 'Chanthaburi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (232, 237, 'CMI', 'Chiang Mai', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (233, 237, 'CRI', 'Chiang Rai', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (234, 237, 'CBI', 'Chonburi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (235, 237, 'CPN', 'Chumphon', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (236, 237, 'KSN', 'Kalasin', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (237, 237, 'KPT', 'Kamphaeng Phet', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (238, 237, 'KRI', 'Kanchanaburi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (239, 237, 'KKN', 'Khon Kaen', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (240, 237, 'KBI', 'Krabi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (241, 237, 'LPG', 'Lampang', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (242, 237, 'LPN', 'Lamphun', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (243, 237, 'LEI', 'Loei', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (244, 237, 'LRI', 'Lopburi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (245, 237, 'MSN', 'Mae Hong Son', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (246, 237, 'MKM', 'Maha Sarakham', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (247, 237, 'MDH', 'Mukdahan', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (248, 237, 'NYK', 'Nakhon Nayok', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (249, 237, 'NPT', 'Nakhon Pathom', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (250, 237, 'NPM', 'Nakhon Phanom', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (251, 237, 'NMA', 'Nakhon Ratchasima', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (252, 237, 'NSN', 'Nakhon Sawan', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (253, 237, 'NRT', 'Nakhon Si Thammarat', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (254, 237, 'NAN', 'Nan', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (255, 237, 'NWT', 'Narathiwat', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (256, 237, 'NBP', 'Nong Bua Lam Phu', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (257, 237, 'NKI', 'Nong Khai', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (258, 237, 'NBI', 'Nonthaburi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (259, 237, 'PTE', 'Pathum Thani', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (260, 237, 'PTN', 'Pattani', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (261, 237, 'PNA', 'Phang Nga', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (262, 237, 'PLG', 'Phatthalung', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (263, 237, 'PYO', 'Phayao', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (264, 237, 'PNB', 'Phetchabun', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (265, 237, 'PBI', 'Phetchaburi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (266, 237, 'PCT', 'Phichit', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (267, 237, 'PLK', 'Phitsanulok', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (268, 237, 'AYA', 'Phra Nakhon Si Ayutthaya', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (269, 237, 'PRE', 'Phrae', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (270, 237, 'PKT', 'Phuket', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (271, 237, 'PRI', 'Prachinburi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (272, 237, 'PKN', 'Prachuap Khiri Khan', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (273, 237, 'RNG', 'Ranong', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (274, 237, 'RBR', 'Ratchaburi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (275, 237, 'RYG', 'Rayong', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (276, 237, 'RET', 'Roi Et', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (277, 237, 'SKW', 'Sa Kaeo', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (278, 237, 'SNK', 'Sakon Nakhon', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (279, 237, 'SPK', 'Samut Prakan', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (280, 237, 'SKN', 'Samut Sakhon', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (281, 237, 'SKM', 'Samut Songkhram', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (282, 237, 'SRI', 'Saraburi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (283, 237, 'STN', 'Satun', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (284, 237, 'SBR', 'Sing Buri', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (285, 237, 'SSK', 'Sisaket', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (286, 237, 'SKA', 'Songkhla', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (287, 237, 'STI', 'Sukhothai', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (288, 237, 'SPB', 'Suphan Buri', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (289, 237, 'SNI', 'Surat Thani', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (290, 237, 'SRN', 'Surin', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (291, 237, 'TAK', 'Tak', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (292, 237, 'TRG', 'Trang', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (293, 237, 'TRT', 'Trat', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (294, 237, 'UBN', 'Ubon Ratchathani', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (295, 237, 'UDN', 'Udon Thani', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (296, 237, 'UTI', 'Uthai Thani', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (297, 237, 'UTD', 'Uttaradit', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (298, 237, 'YLA', 'Yala', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41');
INSERT INTO `city` VALUES (299, 237, 'YST', 'Yasothon', '', NULL, '', 0, 0, 35, '2018-08-13 16:09:26', 1, 35, '2018-08-13 16:09:26');
INSERT INTO `city` VALUES (300, 140, 'AOU', 'Attopeu', '', NULL, '', 14.8209, 106.815, 1000028, '2018-08-13 17:46:47', 1, 1000028, '2018-08-13 17:22:19');
INSERT INTO `city` VALUES (301, 140, 'HOE', 'Ban Hat Tai', '', NULL, '', 20.2578, 100.437, 1000028, '2018-08-13 17:45:55', 1, 1000028, '2018-08-13 17:24:14');
INSERT INTO `city` VALUES (302, 140, 'KOG', 'Khong Island', '', NULL, '', 14.047, 105.833, 1000028, '2018-08-13 17:44:55', 1, 1000028, '2018-08-13 17:24:46');
INSERT INTO `city` VALUES (303, 140, 'LXG', 'Luang Namtha', '', NULL, '', 20.95, 101.4, 1000028, '2018-08-13 17:43:27', 1, 1000028, '2018-08-13 17:26:28');
INSERT INTO `city` VALUES (304, 140, 'LPQ', 'Luang Prabang', '', NULL, '', 19.8833, 102.133, 1000028, '2018-08-13 17:42:52', 1, 1000028, '2018-08-13 17:27:24');
INSERT INTO `city` VALUES (305, 140, 'ODY', 'Muang Xay', '', NULL, '', 20.7, 101.817, 1000028, '2018-08-13 17:42:11', 1, 1000028, '2018-08-13 17:28:07');
INSERT INTO `city` VALUES (306, 140, 'PKZ', 'Pakse', '', NULL, '', 15.1167, 105.783, 1000028, '2018-08-13 17:41:29', 1, 1000028, '2018-08-13 17:28:53');
INSERT INTO `city` VALUES (307, 140, 'XKH', 'Phonsavan', '', NULL, '', 19.46, 103.18, 1000028, '2018-08-13 17:40:09', 1, 1000028, '2018-08-13 17:29:20');
INSERT INTO `city` VALUES (308, 140, 'VNA', 'Saravane', '', NULL, '', 15.7167, 106.417, 1000028, '2018-08-13 17:31:17', 1, 1000028, '2018-08-13 17:30:05');
INSERT INTO `city` VALUES (309, 140, 'NEU', 'Sam Neua', '', NULL, '', 20.4133, 104.048, 1000028, '2018-08-13 17:32:37', 1, 1000028, '2018-08-13 17:32:37');
INSERT INTO `city` VALUES (310, 140, 'ZVK', 'Savannakhet', '', NULL, '', 16.55, 104.75, 1000028, '2018-08-13 17:33:47', 1, 1000028, '2018-08-13 17:33:47');
INSERT INTO `city` VALUES (311, 140, 'ZBY', 'Sayaboury', '', NULL, '', 19.25, 101.75, 1000028, '2018-08-13 17:35:27', 1, 1000028, '2018-08-13 17:35:27');
INSERT INTO `city` VALUES (312, 140, 'THK', 'Thakhek', '', NULL, '', 17.4032, 104.835, 1000028, '2018-08-13 17:37:05', 1, 1000028, '2018-08-13 17:37:05');
INSERT INTO `city` VALUES (313, 140, 'VTE', 'Vientiane', '', NULL, '', 17.9667, 102.6, 1000028, '2018-08-13 17:39:00', 1, 1000028, '2018-08-13 17:39:00');
INSERT INTO `city` VALUES (314, 140, 'PKB', 'Pak Beng', '', NULL, '', 19.8955, 101.132, 1000028, '2018-08-13 17:58:43', 1, 1000028, '2018-08-13 17:58:43');
INSERT INTO `city` VALUES (315, 258, 'CDO', 'Cho Dok', '', NULL, '', 10.7, 105.117, 1000028, '2018-08-13 18:09:43', 1, 1000028, '2018-08-13 18:09:43');
INSERT INTO `city` VALUES (316, 258, 'SAP', 'SA PA', '', NULL, '', 22.3402, 103.844, 1000028, '2018-08-13 18:13:05', 1, 1000028, '2018-08-13 18:13:05');
INSERT INTO `city` VALUES (317, 171, 'MDL', 'Mandalay', '', NULL, '', 21.9574, 96.0891, 1000028, '2018-08-13 18:27:24', 1, 1000028, '2018-08-13 18:27:23');
INSERT INTO `city` VALUES (318, 171, 'RGN', 'Yangon', '', NULL, '', 16.9072, 96.1331, 1000028, '2018-08-13 18:28:26', 1, 1000028, '2018-08-13 18:28:26');
INSERT INTO `city` VALUES (319, 171, 'NYT', 'Naypyidaw', '', NULL, '', 19.6233, 96.2008, 1000028, '2018-08-13 18:30:13', 1, 1000028, '2018-08-13 18:30:13');
INSERT INTO `city` VALUES (320, 171, 'BGO', 'Bago', '', NULL, '', 17.3011, 96.4281, 1000028, '2018-08-13 18:31:30', 1, 1000028, '2018-08-13 18:31:30');
INSERT INTO `city` VALUES (321, 171, 'NYU', 'Bagan', '', NULL, '', 21.1786, 94.93, 1000028, '2018-08-13 18:32:33', 1, 1000028, '2018-08-13 18:32:33');
INSERT INTO `city` VALUES (322, 171, 'HEH', 'Heho', '', NULL, '', 20.7469, 96.7919, 1000028, '2018-08-13 18:41:16', 1, 1000028, '2018-08-13 18:41:16');
INSERT INTO `city` VALUES (323, 119, 'MAA', 'Chennai', '', NULL, '', 13.0833, 80.2667, 35, '2018-08-16 00:06:24', 1, 35, '2018-08-16 00:06:24');
INSERT INTO `city` VALUES (324, 119, 'DEL', 'New Delhi', '', NULL, '', 28.61, 77.23, 35, '2018-08-16 00:08:06', 1, 35, '2018-08-16 00:08:06');
INSERT INTO `city` VALUES (325, 119, 'BOM', 'Mumbai', '', NULL, '', 18.975, 72.8258, 35, '2018-08-16 00:09:27', 1, 35, '2018-08-16 00:09:27');
INSERT INTO `city` VALUES (326, 119, 'CCU', 'Kolkata', '', NULL, '', 22.5667, 88.3667, 35, '2018-08-16 00:11:15', 1, 35, '2018-08-16 00:11:15');
INSERT INTO `city` VALUES (327, 119, 'BLR', 'Bangalore', '', NULL, '', 12.9833, 77.5833, 35, '2018-08-16 00:17:43', 1, 35, '2018-08-16 00:17:43');
INSERT INTO `city` VALUES (328, 119, 'HYD', 'Hyderabad', '', NULL, '', 17.37, 78.48, 35, '2018-08-16 00:19:02', 1, 35, '2018-08-16 00:19:02');
INSERT INTO `city` VALUES (329, 119, 'AMD', 'Ahmedabad', '', NULL, '', 23.03, 72.58, 35, '2018-08-16 00:20:21', 1, 35, '2018-08-16 00:20:21');
INSERT INTO `city` VALUES (330, 119, 'STV', 'Surat', '', NULL, '', 21.1702, 72.8311, 35, '2018-08-16 00:22:01', 1, 35, '2018-08-16 00:22:01');
INSERT INTO `city` VALUES (331, 119, 'PNQ', 'Pune', '', NULL, '', 18.5203, 73.8567, 35, '2018-08-16 00:22:59', 1, 35, '2018-08-16 00:22:59');
INSERT INTO `city` VALUES (332, 119, 'JAI', 'Jaipur', '', NULL, '', 26.9, 75.8, 35, '2018-08-16 00:24:14', 1, 35, '2018-08-16 00:24:13');
INSERT INTO `city` VALUES (333, 119, 'LKO', 'Lucknow', '', NULL, '', 26.85, 80.95, 35, '2018-08-16 00:25:03', 1, 35, '2018-08-16 00:25:03');
INSERT INTO `city` VALUES (334, 119, 'KNU', 'Kanpur', '', NULL, '', 26.4499, 80.3319, 35, '2018-08-16 00:26:55', 1, 35, '2018-08-16 00:26:55');
INSERT INTO `city` VALUES (335, 119, 'NAG', 'Nagpur', '', NULL, '', 21.15, 79.09, 35, '2018-08-16 00:27:59', 1, 35, '2018-08-16 00:27:59');
INSERT INTO `city` VALUES (336, 119, 'VTZ', 'Visakhapatnam', '', NULL, '', 17.7042, 83.2978, 35, '2018-08-16 00:29:06', 1, 35, '2018-08-16 00:29:06');
INSERT INTO `city` VALUES (337, 119, 'IDR', 'Indore', '', NULL, '', 22.7167, 75.8472, 35, '2018-08-16 00:30:13', 1, 35, '2018-08-16 00:30:13');
INSERT INTO `city` VALUES (338, 119, 'BHO', 'Bhopal', '', NULL, '', 23.25, 77.4167, 35, '2018-08-16 00:33:17', 1, 35, '2018-08-16 00:33:17');
INSERT INTO `city` VALUES (339, 119, 'PAT', 'Patna', '', NULL, '', 25.6, 85.1, 35, '2018-08-16 00:34:12', 1, 35, '2018-08-16 00:34:12');
INSERT INTO `city` VALUES (340, 119, 'BDQ', 'Vadodara', '', NULL, '', 22.3, 73.2, 35, '2018-08-16 00:35:21', 1, 35, '2018-08-16 00:35:21');
INSERT INTO `city` VALUES (341, 119, 'LUH', 'Ludhiana', '', NULL, '', 30.91, 75.85, 35, '2018-08-16 00:37:16', 1, 35, '2018-08-16 00:37:16');
INSERT INTO `city` VALUES (342, 119, 'CJB', 'Coimbatore', '', NULL, '', 11.0183, 76.9725, 35, '2018-08-16 00:38:18', 1, 35, '2018-08-16 00:38:18');
INSERT INTO `city` VALUES (343, 119, 'AGR', 'Agra', '', NULL, '', 27.18, 78.02, 35, '2018-08-16 00:39:21', 1, 35, '2018-08-16 00:39:21');
INSERT INTO `city` VALUES (344, 119, 'IXM', 'Madurai', '', NULL, '', 9.9, 78.1, 35, '2018-08-16 00:40:32', 1, 35, '2018-08-16 00:40:32');
INSERT INTO `city` VALUES (345, 119, 'GOI', 'Goa', '', NULL, '', 15.5, 73.83, 35, '2018-08-16 00:47:39', 1, 35, '2018-08-16 00:47:39');
INSERT INTO `city` VALUES (346, 119, 'IXC', 'Chandigarh', '', NULL, '', 30.75, 76.78, 35, '2018-08-16 00:48:50', 1, 35, '2018-08-16 00:48:50');
INSERT INTO `city` VALUES (347, 119, 'GAY', 'Gaya', '', NULL, '', 24.75, 85.01, 35, '2018-08-16 00:49:53', 1, 35, '2018-08-16 00:49:53');
INSERT INTO `city` VALUES (348, 119, 'GAU', 'Guwahati', '', NULL, '', 26.1833, 91.7333, 35, '2018-08-16 00:51:16', 1, 35, '2018-08-16 00:51:16');
INSERT INTO `city` VALUES (349, 119, 'TIR', 'Tirupati', '', NULL, '', 13.65, 79.42, 35, '2018-08-16 00:52:31', 1, 35, '2018-08-16 00:52:31');
INSERT INTO `city` VALUES (350, 119, 'VGA', 'Vijayawada', '', NULL, '', 16.5193, 80.6305, 35, '2018-08-16 00:53:58', 1, 35, '2018-08-16 00:53:58');
INSERT INTO `city` VALUES (351, 119, 'KLH', 'Kolhapur', '', NULL, '', 16.6917, 74.2333, 1000029, '2018-08-17 21:05:49', 1, 1000029, '2018-08-17 21:05:49');
INSERT INTO `city` VALUES (352, 33, '+61 2', 'Sydney ', '', NULL, '', NULL, NULL, 15, '2019-01-05 14:33:52', 1, 15, '2019-01-05 14:33:52');
INSERT INTO `city` VALUES (353, 100, '+49', 'Munich (München)', '', NULL, '', NULL, NULL, 15, '2019-01-08 14:52:05', 1, 15, '2019-01-08 14:52:05');
INSERT INTO `city` VALUES (354, 215, 'SIN', 'Singapore', '', NULL, '', 0, 0, 8, '2019-01-17 16:23:58', 1, 15, '2019-01-15 16:53:51');
INSERT INTO `city` VALUES (355, 126, 'RO', 'Rovigo', '', NULL, '', 47.5172, 20.3906, 1, '2019-01-17 16:27:49', 1, 8, '2019-01-17 16:23:37');
INSERT INTO `city` VALUES (356, 126, 'VRN', 'Verona', '', NULL, '', 45.3957, 10.8885, 8, '2019-01-17 16:28:51', 1, 8, '2019-01-17 16:28:51');
INSERT INTO `city` VALUES (357, 126, 'BLQ', 'Bologna', '', NULL, '', 44.5354, 11.2887, 8, '2019-01-17 16:29:49', 1, 8, '2019-01-17 16:29:49');
INSERT INTO `city` VALUES (358, 126, 'TSF', 'Treviso', '', NULL, '', 45.6484, 12.1944, 8, '2019-01-17 16:30:52', 1, 8, '2019-01-17 16:30:52');
INSERT INTO `city` VALUES (359, 126, 'VCE', 'Venice', '', NULL, '', 45.5053, 12.3519, 8, '2019-01-17 16:32:00', 1, 8, '2019-01-17 16:32:00');
INSERT INTO `city` VALUES (360, 126, 'ROM', 'Rome', '', NULL, '', 41.9, 12.5, 8, '2019-01-17 16:34:49', 1, 8, '2019-01-17 16:34:49');
INSERT INTO `city` VALUES (361, 237, 'CNX', 'Chiang Mai', '', NULL, '', 18.7961, 98.9793, 1, '2019-01-28 15:37:39', 1, 1, '2019-01-28 15:36:49');
COMMIT;

-- ----------------------------
-- Table structure for company_profile
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
  PRIMARY KEY (`id`,`names`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer` int(11) DEFAULT NULL,
  `id_bank` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `contract_value` decimal(10,2) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `id_contract_type` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `discount_type` int(11) DEFAULT NULL,
  `description` text,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `credit_arrangment` text,
  `cancellation_agreement` text,
  `confidentiality` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for contract_customer_contact
-- ----------------------------
DROP TABLE IF EXISTS `contract_customer_contact`;
CREATE TABLE `contract_customer_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_contract` int(11) DEFAULT NULL,
  `id_customer_contact` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for contract_note
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
-- Table structure for contract_type
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for country
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
-- Records of country
-- ----------------------------
BEGIN;
INSERT INTO `country` VALUES (21, 1, 'Afghanistan', 'AF', '', NULL, 'JDrScVo7aBs', 0, 0, 38, '2018-08-12 17:24:29', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (22, 2, 'Albania', 'AL', '', NULL, '', 0, 0, 38, '2018-08-12 17:25:50', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (23, 3, 'Algeria', 'DZ', '', NULL, '', 0, 0, 38, '2018-08-12 17:50:07', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (24, 6, 'American Samoa', 'DS', '', NULL, '', 0, 0, 38, '2018-08-12 18:31:58', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (25, 2, 'Andorra', 'AD', '', NULL, '', 0, 0, 38, '2018-08-12 17:26:21', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (26, 3, 'Angola', 'AO', '', NULL, '', 0, 0, 38, '2018-08-12 17:50:29', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (27, 1, 'Anguilla', 'AI', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (28, 1, 'Antarctica', 'AQ', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (29, 4, 'Antigua and Barbuda', 'AG', '', NULL, '', 0, 0, 38, '2018-08-12 18:15:11', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (30, 5, 'Argentina', 'AR', '', NULL, '', 0, 0, 38, '2018-08-12 18:24:31', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (31, 2, 'Armenia', 'AM', '', NULL, '', 0, 0, 38, '2018-08-12 17:26:40', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (32, 1, 'Aruba', 'AW', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (33, 6, 'Australia', 'AU', '', NULL, '', 0, 0, 38, '2018-08-12 18:28:59', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (34, 2, 'Austria', 'AT', '', NULL, '', 0, 0, 38, '2018-08-12 17:27:02', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (35, 2, 'Azerbaijan', 'AZ', '', NULL, '', 0, 0, 38, '2018-08-12 17:27:31', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (36, 4, 'Bahamas', 'BS', '', NULL, '', 0, 0, 38, '2018-08-12 18:15:50', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (37, 1, 'Bahrain', 'BH', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (38, 1, 'Bangladesh', 'BD', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (39, 4, 'Barbados', 'BB', '', NULL, '', 0, 0, 38, '2018-08-12 18:16:08', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (40, 2, 'Belarus', 'BY', '', NULL, '', 0, 0, 38, '2018-08-12 17:27:57', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (41, 2, 'Belgium', 'BE', '', NULL, '', 0, 0, 38, '2018-08-12 17:28:16', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (42, 4, 'Belize', 'BZ', '', NULL, '', 0, 0, 38, '2018-08-12 18:16:28', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (43, 3, 'Benin', 'BJ', '', NULL, '', 0, 0, 38, '2018-08-12 17:51:11', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (44, 1, 'Bermuda', 'BM', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (45, 1, 'Bhutan', 'BT', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (46, 5, 'Bolivia', 'BO', '', NULL, '', 0, 0, 38, '2018-08-12 18:24:54', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (47, 2, 'Bosnia and Herzegovina', 'BA', '', NULL, '', 0, 0, 38, '2018-08-12 17:28:36', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (48, 3, 'Botswana', 'BW', '', NULL, '', 0, 0, 38, '2018-08-12 17:51:30', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (49, 1, 'Bouvet Island', 'BV', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (50, 5, 'Brazil', 'BR', '', NULL, '', 0, 0, 38, '2018-08-12 18:25:16', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (51, 1, 'British Indian Ocean Territory', 'IO', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (52, 1, 'Brunei Darussalam', 'BN', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (53, 2, 'Bulgaria', 'BG', '', NULL, '', 0, 0, 38, '2018-08-12 17:29:23', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (54, 3, 'Burkina Faso', 'BF', '', NULL, '', 0, 0, 38, '2018-08-12 17:52:12', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (55, 3, 'Burundi', 'BI', '', NULL, '', 0, 0, 38, '2018-08-12 17:52:41', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (56, 1, 'Cambodia', 'KH', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (57, 3, 'Cameroon', 'CM', '', NULL, '', 0, 0, 38, '2018-08-12 17:53:29', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (58, 4, 'Canada', 'CA', '', NULL, '', 0, 0, 38, '2018-08-12 18:16:47', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (59, 1, 'Cape Verde', 'CV', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (60, 1, 'Cayman Islands', 'KY', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (61, 3, 'Central African Republic', 'CF', '', NULL, '', 0, 0, 38, '2018-08-12 17:53:58', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (62, 3, 'Chad', 'TD', '', NULL, '', 0, 0, 38, '2018-08-12 17:54:18', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (63, 5, 'Chile', 'CL', '', NULL, '', 0, 0, 38, '2018-08-12 18:25:32', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (64, 1, 'China', 'CN', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (65, 1, 'Christmas Island', 'CX', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (66, 1, 'Cocos (Keeling) Islands', 'CC', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (67, 5, 'Colombia', 'CO', '', NULL, '', 0, 0, 38, '2018-08-12 18:26:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (68, 3, 'Comoros', 'KM', '', NULL, '', 0, 0, 38, '2018-08-12 17:54:40', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (69, 3, 'Congo', 'CG', '', NULL, '', 0, 0, 38, '2018-08-12 17:55:49', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (70, 1, 'Cook Islands', 'CK', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (71, 4, 'Costa Rica', 'CR', '', NULL, '', 0, 0, 38, '2018-08-12 18:17:05', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (72, 2, 'Croatia (Hrvatska)', 'HR', '', NULL, '', 0, 0, 38, '2018-08-12 17:29:47', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (73, 4, 'Cuba', 'CU', '', NULL, '', 0, 0, 38, '2018-08-12 18:17:23', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (74, 2, 'Cyprus', 'CY', '', NULL, '', 0, 0, 38, '2018-08-12 17:30:07', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (75, 2, 'Czech Republic', 'CZ', '', NULL, '', 0, 0, 38, '2018-08-12 17:30:29', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (76, 2, 'Denmark', 'DK', '', NULL, '', 0, 0, 38, '2018-08-12 17:30:49', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (77, 3, 'Djibouti', 'DJ', '', NULL, '', 0, 0, 38, '2018-08-12 17:56:46', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (78, 4, 'Dominica', 'DM', '', NULL, '', 0, 0, 38, '2018-08-12 18:17:44', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (79, 4, 'Dominican Republic', 'DO', '', NULL, '', 0, 0, 38, '2018-08-12 18:17:55', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (80, 1, 'East Timor', 'TP', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (81, 5, 'Ecuador', 'EC', '', NULL, '', 0, 0, 38, '2018-08-12 18:26:22', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (82, 3, 'Egypt', 'EG', '', NULL, '', 0, 0, 38, '2018-08-12 17:57:20', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (83, 4, 'El Salvador', 'SV', '', NULL, '', 0, 0, 38, '2018-08-12 18:18:19', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (84, 3, 'Equatorial Guinea', 'GQ', '', NULL, '', 0, 0, 38, '2018-08-12 17:57:47', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (85, 3, 'Eritrea', 'ER', '', NULL, '', 0, 0, 38, '2018-08-12 17:58:09', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (86, 2, 'Estonia', 'EE', '', NULL, '', 0, 0, 38, '2018-08-12 17:31:22', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (87, 3, 'Ethiopia', 'ET', '', NULL, '', 0, 0, 38, '2018-08-12 17:58:53', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (88, 1, 'Falkland Islands (Malvinas)', 'FK', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (89, 1, 'Faroe Islands', 'FO', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (90, 6, 'Fiji', 'FJ', '', NULL, '', 0, 0, 38, '2018-08-12 18:29:19', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (91, 2, 'Finland', 'FI', '', NULL, '', 0, 0, 38, '2018-08-12 17:31:43', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (92, 2, 'France', 'FR', '', NULL, '', 0, 0, 38, '2018-08-12 17:32:09', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (93, 2, 'France, Metropolitan', 'FX', '', NULL, '', 0, 0, 38, '2018-08-12 17:32:21', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (94, 1, 'French Guiana', 'GF', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (95, 1, 'French Polynesia', 'PF', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (96, 1, 'French Southern Territories', 'TF', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (97, 3, 'Gabon', 'GA', '', NULL, '', 0, 0, 38, '2018-08-12 17:59:35', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (98, 3, 'Gambia', 'GM', '', NULL, '', 0, 0, 38, '2018-08-12 17:59:52', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (99, 2, 'Georgia', 'GE', '', NULL, '', 0, 0, 38, '2018-08-12 17:32:51', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (100, 2, 'Germany', 'DE', '', NULL, '', 0, 0, 38, '2018-08-12 17:33:33', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (101, 3, 'Ghana', 'GH', '', NULL, '', 0, 0, 38, '2018-08-12 18:00:11', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (102, 1, 'Gibraltar', 'GI', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (103, 1, 'Guernsey', 'GK', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (104, 2, 'Greece', 'GR', '', NULL, '', 0, 0, 38, '2018-08-12 17:34:02', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (105, 1, 'Greenland', 'GL', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (106, 4, 'Grenada', 'GD', '', NULL, '', 0, 0, 38, '2018-08-12 18:18:42', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (107, 1, 'Guadeloupe', 'GP', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (108, 1, 'Guam', 'GU', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (109, 4, 'Guatemala', 'GT', '', NULL, '', 0, 0, 38, '2018-08-12 18:19:05', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (110, 3, 'Guinea', 'GN', '', NULL, '', 0, 0, 38, '2018-08-12 18:00:42', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (111, 3, 'Guinea-Bissau', 'GW', '', NULL, '', 0, 0, 38, '2018-08-12 18:00:55', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (112, 5, 'Guyana', 'GY', '', NULL, '', 0, 0, 38, '2018-08-12 18:26:41', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (113, 4, 'Haiti', 'HT', '', NULL, '', 0, 0, 38, '2018-08-12 18:19:22', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (114, 1, 'Heard and Mc Donald Islands', 'HM', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (115, 4, 'Honduras', 'HN', '', NULL, '', 0, 0, 38, '2018-08-12 18:19:39', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (116, 1, 'Hong Kong', 'HK', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (117, 2, 'Hungary', 'HU', '', NULL, '', 0, 0, 38, '2018-08-12 17:34:27', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (118, 2, 'Iceland', 'IS', '', NULL, '', 0, 0, 38, '2018-08-12 17:34:46', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (119, 1, 'India', 'IN', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (120, 1, 'Isle of Man', 'IM', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (121, 1, 'Indonesia', 'ID', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (122, 1, 'Iran (Islamic Republic of)', 'IR', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (123, 1, 'Iraq', 'IQ', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (124, 2, 'Ireland', 'IE', '', NULL, '', 0, 0, 38, '2018-08-12 17:35:09', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (125, 1, 'Israel', 'IL', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (126, 2, 'Italy', 'IT', '', NULL, '', 0, 0, 38, '2018-08-12 17:35:37', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (127, 1, 'Ivory Coast', 'CI', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (128, 1, 'Jersey', 'JE', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (129, 4, 'Jamaica', 'JM', '', NULL, '', 0, 0, 38, '2018-08-12 18:20:09', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (130, 1, 'Japan', 'JP', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (131, 1, 'Jordan', 'JO', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (132, 2, 'Kazakhstan', 'KZ', '', NULL, '', 0, 0, 38, '2018-08-12 17:36:08', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (133, 3, 'Kenya', 'KE', '', NULL, '', 0, 0, 38, '2018-08-12 18:01:30', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (134, 6, 'Kiribati', 'KI', '', NULL, '', 0, 0, 38, '2018-08-12 18:29:36', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (135, 1, 'Korea, Democratic People\'s Republic of', 'KP', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (136, 1, 'Korea, Republic of', 'KR', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (137, 2, 'Kosovo', 'XK', '', NULL, '', 0, 0, 38, '2018-08-12 17:36:29', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (138, 1, 'Kuwait', 'KW', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (139, 1, 'Kyrgyzstan', 'KG', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (140, 1, 'Laos', 'LA', '', NULL, '', 0, 0, 1000028, '2018-08-13 17:23:16', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (141, 2, 'Latvia', 'LV', '', NULL, '', 0, 0, 38, '2018-08-12 17:36:53', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (142, 1, 'Lebanon', 'LB', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (143, 3, 'Lesotho', 'LS', '', NULL, '', 0, 0, 38, '2018-08-12 18:01:49', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (144, 3, 'Liberia', 'LR', '', NULL, '', 0, 0, 38, '2018-08-12 18:02:07', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (145, 3, 'Libyan Arab Jamahiriya', 'LY', '', NULL, '', 0, 0, 38, '2018-08-12 18:02:25', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (146, 2, 'Liechtenstein', 'LI', '', NULL, '', 0, 0, 38, '2018-08-12 17:37:12', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (147, 2, 'Lithuania', 'LT', '', NULL, '', 0, 0, 38, '2018-08-12 17:38:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (148, 2, 'Luxembourg', 'LU', '', NULL, '', 0, 0, 38, '2018-08-12 17:38:42', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (149, 1, 'Macau', 'MO', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (150, 2, 'Macedonia', 'MK', '', NULL, '', 0, 0, 38, '2018-08-12 17:39:10', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (151, 3, 'Madagascar', 'MG', '', NULL, '', 0, 0, 38, '2018-08-12 18:02:42', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (152, 3, 'Malawi', 'MW', '', NULL, '', 0, 0, 38, '2018-08-12 18:03:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (153, 1, 'Malaysia', 'MY', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (154, 1, 'Maldives', 'MV', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (155, 3, 'Mali', 'ML', '', NULL, '', 0, 0, 38, '2018-08-12 18:03:19', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (156, 2, 'Malta', 'MT', '', NULL, '', 0, 0, 38, '2018-08-12 17:39:34', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (157, 6, 'Marshall Islands', 'MH', '', NULL, '', 0, 0, 38, '2018-08-12 18:29:55', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (158, 1, 'Martinique', 'MQ', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (159, 3, 'Mauritania', 'MR', '', NULL, '', 0, 0, 38, '2018-08-12 18:03:55', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (160, 3, 'Mauritius', 'MU', '', NULL, '', 0, 0, 38, '2018-08-12 18:04:17', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (161, 1, 'Mayotte', 'TY', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (162, 4, 'Mexico', 'MX', '', NULL, '', 0, 0, 38, '2018-08-12 18:20:31', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (163, 6, 'Micronesia, Federated States of', 'FM', '', NULL, '', 0, 0, 38, '2018-08-12 18:30:13', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (164, 2, 'Moldova, Republic of', 'MD', '', NULL, '', 0, 0, 38, '2018-08-12 17:39:57', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (165, 2, 'Monaco', 'MC', '', NULL, '', 0, 0, 38, '2018-08-12 17:40:15', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (166, 1, 'Mongolia', 'MN', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (167, 2, 'Montenegro', 'ME', '', NULL, '', 0, 0, 38, '2018-08-12 17:40:35', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (168, 1, 'Montserrat', 'MS', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (169, 3, 'Morocco', 'MA', '', NULL, '', 0, 0, 38, '2018-08-12 18:04:37', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (170, 3, 'Mozambique', 'MZ', '', NULL, '', 0, 0, 38, '2018-08-12 18:04:55', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (171, 1, 'Myanmar', 'MM', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (172, 3, 'Namibia', 'NA', '', NULL, '', 0, 0, 38, '2018-08-12 18:05:12', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (173, 6, 'Nauru', 'NR', '', NULL, '', 0, 0, 38, '2018-08-12 18:30:32', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (174, 1, 'Nepal', 'NP', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (175, 2, 'Netherlands', 'NL', '', NULL, '', 0, 0, 38, '2018-08-12 17:41:05', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (176, 2, 'Netherlands Antilles', 'AN', '', NULL, '', 0, 0, 38, '2018-08-12 17:41:17', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (177, 1, 'New Caledonia', 'NC', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (178, 6, 'New Zealand', 'NZ', '', NULL, '', 0, 0, 38, '2018-08-12 18:30:52', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (179, 4, 'Nicaragua', 'NI', '', NULL, '', 0, 0, 38, '2018-08-12 18:20:50', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (180, 3, 'Niger', 'NE', '', NULL, '', 0, 0, 38, '2018-08-12 18:05:30', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (181, 3, 'Nigeria', 'NG', '', NULL, '', 0, 0, 38, '2018-08-12 18:05:42', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (182, 1, 'Niue', 'NU', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (183, 1, 'Norfolk Island', 'NF', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (184, 1, 'Northern Mariana Islands', 'MP', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (185, 2, 'Norway', 'NO', '', NULL, '', 0, 0, 38, '2018-08-12 17:41:50', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (186, 1, 'Oman', 'OM', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (187, 1, 'Pakistan', 'PK', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (188, 6, 'Palau', 'PW', '', NULL, '', 0, 0, 38, '2018-08-12 18:31:14', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (189, 1, 'Palestine', 'PS', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (190, 4, 'Panama', 'PA', '', NULL, '', 0, 0, 38, '2018-08-12 18:21:18', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (191, 6, 'Papua New Guinea', 'PG', '', NULL, '', 0, 0, 38, '2018-08-12 18:31:39', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (192, 5, 'Paraguay', 'PY', '', NULL, '', 0, 0, 38, '2018-08-12 18:27:08', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (193, 5, 'Peru', 'PE', '', NULL, '', 0, 0, 38, '2018-08-12 18:27:27', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (194, 1, 'Philippines', 'PH', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (195, 1, 'Pitcairn', 'PN', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (196, 2, 'Poland', 'PL', '', NULL, '', 0, 0, 38, '2018-08-12 17:42:25', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (197, 2, 'Portugal', 'PT', '', NULL, '', 0, 0, 38, '2018-08-12 17:42:43', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (198, 1, 'Puerto Rico', 'PR', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (199, 1, 'Qatar', 'QA', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (200, 1, 'Reunion', 'RE', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (201, 2, 'Romania', 'RO', '', NULL, '', 0, 0, 38, '2018-08-12 17:43:03', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (202, 2, 'Russian Federation', 'RU', '', NULL, '', 0, 0, 38, '2018-08-12 17:43:22', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (203, 3, 'Rwanda', 'RW', '', NULL, '', 0, 0, 38, '2018-08-12 18:06:21', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (204, 4, 'Saint Kitts and Nevis', 'KN', '', NULL, '', 0, 0, 38, '2018-08-12 18:21:42', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (205, 4, 'Saint Lucia', 'LC', '', NULL, '', 0, 0, 38, '2018-08-12 18:21:59', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (206, 4, 'Saint Vincent and the Grenadines', 'VC', '', NULL, '', 0, 0, 38, '2018-08-12 18:22:23', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (207, 6, 'Samoa', 'WS', '', NULL, '', 0, 0, 38, '2018-08-12 18:32:16', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (208, 2, 'San Marino', 'SM', '', NULL, '', 0, 0, 38, '2018-08-12 17:43:50', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (209, 3, 'Sao Tome and Principe', 'ST', '', NULL, '', 0, 0, 38, '2018-08-12 18:06:40', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (210, 1, 'Saudi Arabia', 'SA', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (211, 3, 'Senegal', 'SN', '', NULL, '', 0, 0, 38, '2018-08-12 18:07:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (212, 2, 'Serbia', 'RS', '', NULL, '', 0, 0, 38, '2018-08-12 17:44:37', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (213, 3, 'Seychelles', 'SC', '', NULL, '', 0, 0, 38, '2018-08-12 18:07:29', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (214, 3, 'Sierra Leone', 'SL', '', NULL, '', 0, 0, 38, '2018-08-12 18:07:48', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (215, 1, 'Singapore', 'SG', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (216, 2, 'Slovakia', 'SK', '', NULL, '', 0, 0, 38, '2018-08-12 17:45:20', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (217, 2, 'Slovenia', 'SI', '', NULL, '', 0, 0, 38, '2018-08-12 17:46:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (218, 6, 'Solomon Islands', 'SB', '', NULL, '', 0, 0, 38, '2018-08-12 18:32:37', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (219, 3, 'Somalia', 'SO', '', NULL, '', 0, 0, 38, '2018-08-12 18:03:40', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (220, 3, 'South Africa', 'ZA', '', NULL, '', 0, 0, 38, '2018-08-12 18:08:30', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (221, 2, 'South Georgia South Sandwich Islands', 'GS', '', NULL, '', 0, 0, 38, '2018-08-12 17:33:10', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (222, 3, 'South Sudan', 'SS', '', NULL, '', 0, 0, 38, '2018-08-12 18:11:16', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (223, 2, 'Spain', 'ES', '', NULL, '', 0, 0, 38, '2018-08-12 17:46:15', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (224, 1, 'Sri Lanka', 'LK', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (225, 1, 'St. Helena', 'SH', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (226, 1, 'St. Pierre and Miquelon', 'PM', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (227, 3, 'Sudan', 'SD', '', NULL, '', 0, 0, 38, '2018-08-12 18:11:35', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (228, 5, 'Suriname', 'SR', '', NULL, '', 0, 0, 38, '2018-08-12 18:27:46', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (229, 1, 'Svalbard and Jan Mayen Islands', 'SJ', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (230, 1, 'Swaziland', 'SZ', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (231, 2, 'Sweden', 'SE', '', NULL, '', 0, 0, 38, '2018-08-12 17:46:34', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (232, 2, 'Switzerland', 'CH', '', NULL, '', 0, 0, 38, '2018-08-12 17:46:58', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (233, 1, 'Syrian Arab Republic', 'SY', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (234, 1, 'Taiwan', 'TW', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (235, 1, 'Tajikistan', 'TJ', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (236, 3, 'Tanzania, United Republic of', 'TZ', '', NULL, '', 0, 0, 38, '2018-08-12 18:12:48', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (237, 1, 'Thailand', 'TH', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (238, 3, 'Togo', 'TG', '', NULL, '', 0, 0, 38, '2018-08-12 18:13:10', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (239, 1, 'Tokelau', 'TK', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (240, 6, 'Tonga', 'TO', '', NULL, '', 0, 0, 38, '2018-08-12 18:33:08', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (241, 4, 'Trinidad and Tobago', 'TT', '', NULL, '', 0, 0, 38, '2018-08-12 18:22:43', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (242, 3, 'Tunisia', 'TN', '', NULL, '', 0, 0, 38, '2018-08-12 18:13:30', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (243, 2, 'Turkey', 'TR', '', NULL, '', 0, 0, 38, '2018-08-12 17:47:55', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (244, 1, 'Turkmenistan', 'TM', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (245, 1, 'Turks and Caicos Islands', 'TC', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (246, 6, 'Tuvalu', 'TV', '', NULL, '', 0, 0, 38, '2018-08-12 18:33:29', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (247, 3, 'Uganda', 'UG', '', NULL, '', 0, 0, 38, '2018-08-12 18:13:49', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (248, 2, 'Ukraine', 'UA', '', NULL, '', 0, 0, 38, '2018-08-12 17:48:22', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (249, 1, 'United Arab Emirates', 'AE', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (250, 2, 'United Kingdom', 'GB', '', NULL, '', 0, 0, 38, '2018-08-12 17:49:03', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (251, 4, 'United States', 'US', '', NULL, '', 0, 0, 38, '2018-08-12 18:23:19', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (252, 4, 'United States minor outlying islands', 'UM', '', NULL, '', 0, 0, 38, '2018-08-12 18:23:31', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (253, 5, 'Uruguay', 'UY', '', NULL, '', 0, 0, 38, '2018-08-12 18:28:08', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (254, 1, 'Uzbekistan', 'UZ', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (255, 6, 'Vanuatu', 'VU', '', NULL, '', 0, 0, 38, '2018-08-12 18:33:47', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (256, 2, 'Vatican City State', 'VA', '', NULL, '', 0, 0, 38, '2018-08-12 17:49:24', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (257, 5, 'Venezuela', 'VE', '', NULL, '', 0, 0, 38, '2018-08-12 18:28:26', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (258, 1, 'Vietnam', 'VN', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (259, 1, 'Virgin Islands (British)', 'VG', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (260, 1, 'Virgin Islands (U.S.)', 'VI', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (261, 1, 'Wallis and Futuna Islands', 'WF', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (262, 1, 'Western Sahara', 'EH', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (263, 1, 'Yemen', 'YE', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (264, 1, 'Zaire', 'ZR', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (265, 3, 'Zambia', 'ZM', '', NULL, '', 0, 0, 38, '2018-08-12 18:14:10', 1, 35, '2018-08-12 16:19:01');
INSERT INTO `country` VALUES (266, 3, 'Zimbabwe', 'ZW', '', NULL, '', 0, 0, 38, '2018-08-12 18:14:28', 1, 35, '2018-08-12 16:19:01');
COMMIT;

-- ----------------------------
-- Table structure for currency
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of currency
-- ----------------------------
BEGIN;
INSERT INTO `currency` VALUES (1, 'USD $', 1);
COMMIT;

-- ----------------------------
-- Table structure for customer_group
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
-- Records of customer_group
-- ----------------------------
BEGIN;
INSERT INTO `customer_group` VALUES (1, 'VIP', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `customer_group` VALUES (2, 'Wholesaler', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `customer_group` VALUES (3, 'High Budget', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `customer_group` VALUES (4, 'Low Budget', NULL, NULL, NULL, NULL, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for customer_invoice
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_invoice_data
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_invoice_tag
-- ----------------------------
DROP TABLE IF EXISTS `customer_invoice_tag`;
CREATE TABLE `customer_invoice_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer_invoice` int(11) DEFAULT NULL,
  `id_tag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for customer_payment
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_profile
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of customer_profile
-- ----------------------------
BEGIN;
INSERT INTO `customer_profile` VALUES (1, 'Saody', 'eOcambo Technology', '087666888', 'saody@eocambo.com', NULL, NULL, 'Siem Reap,Cambodia', 56, 21, NULL, 'Siem Reap,Cambodia', 21, 56, 'Siem Reap,Cambodia', 21, 56, 1, 1, '2019-09-10 16:17:54', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for customer_profile_contact
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for customer_profile_group
-- ----------------------------
DROP TABLE IF EXISTS `customer_profile_group`;
CREATE TABLE `customer_profile_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer_profile` int(11) DEFAULT NULL,
  `id_customer_group` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for customer_profile_note
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
-- Table structure for customer_profile_solution
-- ----------------------------
DROP TABLE IF EXISTS `customer_profile_solution`;
CREATE TABLE `customer_profile_solution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer` int(11) DEFAULT NULL,
  `id_solution` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for customer_profile_status
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
-- Records of customer_profile_status
-- ----------------------------
BEGIN;
INSERT INTO `customer_profile_status` VALUES (1, 'New', NULL, NULL, NULL, NULL, 1);
INSERT INTO `customer_profile_status` VALUES (2, 'Contacted', NULL, NULL, NULL, NULL, 1);
INSERT INTO `customer_profile_status` VALUES (3, 'Qualified', NULL, NULL, NULL, NULL, 1);
INSERT INTO `customer_profile_status` VALUES (4, 'Working', NULL, NULL, NULL, NULL, 1);
INSERT INTO `customer_profile_status` VALUES (5, 'Proposal Sent', NULL, NULL, NULL, NULL, 1);
INSERT INTO `customer_profile_status` VALUES (6, 'Customer', NULL, NULL, NULL, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for customer_solution_status
-- ----------------------------
DROP TABLE IF EXISTS `customer_solution_status`;
CREATE TABLE `customer_solution_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `order_by` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_solution_status
-- ----------------------------
BEGIN;
INSERT INTO `customer_solution_status` VALUES (1, 'Inprocessing', 2);
INSERT INTO `customer_solution_status` VALUES (2, 'Lived', 3);
INSERT INTO `customer_solution_status` VALUES (3, 'Terminated', 4);
INSERT INTO `customer_solution_status` VALUES (4, 'New Sale', 1);
COMMIT;

-- ----------------------------
-- Table structure for customer_type
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
-- Records of customer_type
-- ----------------------------
BEGIN;
INSERT INTO `customer_type` VALUES (1, 'Hotel', '', 1, '2019-09-01 22:38:59', 1, '2019-09-01 22:41:32', 1);
INSERT INTO `customer_type` VALUES (2, 'Hostel', '', 1, '2019-09-01 22:39:08', 1, NULL, NULL);
INSERT INTO `customer_type` VALUES (3, 'Villa', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `customer_type` VALUES (4, 'Boutique', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `customer_type` VALUES (5, 'Apartment', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `customer_type` VALUES (6, 'Resort', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `customer_type` VALUES (7, 'Boutique Hotel', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `customer_type` VALUES (8, 'Holiday House', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `customer_type` VALUES (9, 'Guesthouse', NULL, 1, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for data_option_phone_number_country_code
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
-- Records of data_option_phone_number_country_code
-- ----------------------------
BEGIN;
INSERT INTO `data_option_phone_number_country_code` VALUES (1, 'AD', 'ANDORRA', '376', 1, 1, '2019-01-09 09:58:14', 1, '2019-04-24 16:52:44');
INSERT INTO `data_option_phone_number_country_code` VALUES (2, 'AE', 'UNITED ARAB EMIRATES', '971', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (3, 'AF', 'AFGHANISTAN', '93', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (4, 'AG', 'ANTIGUA AND BARBUDA', '1268', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (5, 'AI', 'ANGUILLA', '1264', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (6, 'AL', 'ALBANIA', '355', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (7, 'AM', 'ARMENIA', '374', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (8, 'AN', 'NETHERLANDS ANTILLES', '599', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (9, 'AO', 'ANGOLA', '244', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (10, 'AQ', 'ANTARCTICA', '672', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (11, 'AR', 'ARGENTINA', '54', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (12, 'AS', 'AMERICAN SAMOA', '1684', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (13, 'AT', 'AUSTRIA', '43', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (14, 'AU', 'AUSTRALIA', '61', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (15, 'AW', 'ARUBA', '297', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (16, 'AZ', 'AZERBAIJAN', '994', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (17, 'BA', 'BOSNIA AND HERZEGOVINA', '387', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (18, 'BB', 'BARBADOS', '1246', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (19, 'BD', 'BANGLADESH', '880', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (20, 'BE', 'BELGIUM', '32', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (21, 'BF', 'BURKINA FASO', '226', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (22, 'BG', 'BULGARIA', '359', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (23, 'BH', 'BAHRAIN', '973', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (24, 'BI', 'BURUNDI', '257', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (25, 'BJ', 'BENIN', '229', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (26, 'BL', 'SAINT BARTHELEMY', '590', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (27, 'BM', 'BERMUDA', '1441', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (28, 'BN', 'BRUNEI DARUSSALAM', '673', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (29, 'BO', 'BOLIVIA', '591', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (30, 'BR', 'BRAZIL', '55', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (31, 'BS', 'BAHAMAS', '1242', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (32, 'BT', 'BHUTAN', '975', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (33, 'BW', 'BOTSWANA', '267', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (34, 'BY', 'BELARUS', '375', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (35, 'BZ', 'BELIZE', '501', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (36, 'CA', 'CANADA', '1', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (37, 'CC', 'COCOS (KEELING) ISLANDS', '61', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (38, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', '243', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (39, 'CF', 'CENTRAL AFRICAN REPUBLIC', '236', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (40, 'CG', 'CONGO', '242', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (41, 'CH', 'SWITZERLAND', '41', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (42, 'CI', 'COTE D IVOIRE', '225', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (43, 'CK', 'COOK ISLANDS', '682', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (44, 'CL', 'CHILE', '56', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (45, 'CM', 'CAMEROON', '237', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (46, 'CN', 'CHINA', '86', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (47, 'CO', 'COLOMBIA', '57', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (48, 'CR', 'COSTA RICA', '506', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (49, 'CU', 'CUBA', '53', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (50, 'CV', 'CAPE VERDE', '238', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (51, 'CX', 'CHRISTMAS ISLAND', '61', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (52, 'CY', 'CYPRUS', '357', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (53, 'CZ', 'CZECH REPUBLIC', '420', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (54, 'DE', 'GERMANY', '49', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (55, 'DJ', 'DJIBOUTI', '253', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (56, 'DK', 'DENMARK', '45', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (57, 'DM', 'DOMINICA', '1767', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (58, 'DO', 'DOMINICAN REPUBLIC', '1809', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (59, 'DZ', 'ALGERIA', '213', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (60, 'EC', 'ECUADOR', '593', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (61, 'EE', 'ESTONIA', '372', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (62, 'EG', 'EGYPT', '20', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (63, 'ER', 'ERITREA', '291', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (64, 'ES', 'SPAIN', '34', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (65, 'ET', 'ETHIOPIA', '251', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (66, 'FI', 'FINLAND', '358', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (67, 'FJ', 'FIJI', '679', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (68, 'FK', 'FALKLAND ISLANDS (MALVINAS)', '500', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (69, 'FM', 'MICRONESIA, FEDERATED STATES OF', '691', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (70, 'FO', 'FAROE ISLANDS', '298', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (71, 'FR', 'FRANCE', '33', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (72, 'GA', 'GABON', '241', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (73, 'GB', 'UNITED KINGDOM', '44', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (74, 'GD', 'GRENADA', '1473', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (75, 'GE', 'GEORGIA', '995', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (76, 'GH', 'GHANA', '233', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (77, 'GI', 'GIBRALTAR', '350', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (78, 'GL', 'GREENLAND', '299', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (79, 'GM', 'GAMBIA', '220', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (80, 'GN', 'GUINEA', '224', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (81, 'GQ', 'EQUATORIAL GUINEA', '240', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (82, 'GR', 'GREECE', '30', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (83, 'GT', 'GUATEMALA', '502', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (84, 'GU', 'GUAM', '1671', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (85, 'GW', 'GUINEA-BISSAU', '245', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (86, 'GY', 'GUYANA', '592', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (87, 'HK', 'HONG KONG', '852', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (88, 'HN', 'HONDURAS', '504', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (89, 'HR', 'CROATIA', '385', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (90, 'HT', 'HAITI', '509', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (91, 'HU', 'HUNGARY', '36', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (92, 'ID', 'INDONESIA', '62', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (93, 'IE', 'IRELAND', '353', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (94, 'IL', 'ISRAEL', '972', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (95, 'IM', 'ISLE OF MAN', '44', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (96, 'IN', 'INDIA', '91', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (97, 'IQ', 'IRAQ', '964', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (98, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', '98', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (99, 'IS', 'ICELAND', '354', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (100, 'IT', 'ITALY', '39', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (101, 'JM', 'JAMAICA', '1876', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (102, 'JO', 'JORDAN', '962', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (103, 'JP', 'JAPAN', '81', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (104, 'KE', 'KENYA', '254', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (105, 'KG', 'KYRGYZSTAN', '996', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (106, 'KH', 'CAMBODIA', '855', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (107, 'KI', 'KIRIBATI', '686', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (108, 'KM', 'COMOROS', '269', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (109, 'KN', 'SAINT KITTS AND NEVIS', '1869', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (110, 'KP', 'KOREA DEMOCRATIC PEOPLES REPUBLIC OF', '850', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (111, 'KR', 'KOREA REPUBLIC OF', '82', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (112, 'KW', 'KUWAIT', '965', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (113, 'KY', 'CAYMAN ISLANDS', '1345', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (114, 'KZ', 'KAZAKSTAN', '7', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (115, 'LA', 'LAO PEOPLES DEMOCRATIC REPUBLIC', '856', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (116, 'LB', 'LEBANON', '961', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (117, 'LC', 'SAINT LUCIA', '1758', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (118, 'LI', 'LIECHTENSTEIN', '423', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (119, 'LK', 'SRI LANKA', '94', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (120, 'LR', 'LIBERIA', '231', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (121, 'LS', 'LESOTHO', '266', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (122, 'LT', 'LITHUANIA', '370', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (123, 'LU', 'LUXEMBOURG', '352', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (124, 'LV', 'LATVIA', '371', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (125, 'LY', 'LIBYAN ARAB JAMAHIRIYA', '218', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (126, 'MA', 'MOROCCO', '212', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (127, 'MC', 'MONACO', '377', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (128, 'MD', 'MOLDOVA, REPUBLIC OF', '373', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (129, 'ME', 'MONTENEGRO', '382', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (130, 'MF', 'SAINT MARTIN', '1599', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (131, 'MG', 'MADAGASCAR', '261', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (132, 'MH', 'MARSHALL ISLANDS', '692', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (133, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', '389', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (134, 'ML', 'MALI', '223', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (135, 'MM', 'MYANMAR', '95', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (136, 'MN', 'MONGOLIA', '976', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (137, 'MO', 'MACAU', '853', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (138, 'MP', 'NORTHERN MARIANA ISLANDS', '1670', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (139, 'MR', 'MAURITANIA', '222', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (140, 'MS', 'MONTSERRAT', '1664', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (141, 'MT', 'MALTA', '356', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (142, 'MU', 'MAURITIUS', '230', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (143, 'MV', 'MALDIVES', '960', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (144, 'MW', 'MALAWI', '265', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (145, 'MX', 'MEXICO', '52', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (146, 'MY', 'MALAYSIA', '60', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (147, 'MZ', 'MOZAMBIQUE', '258', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (148, 'NA', 'NAMIBIA', '264', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (149, 'NC', 'NEW CALEDONIA', '687', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (150, 'NE', 'NIGER', '227', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (151, 'NG', 'NIGERIA', '234', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (152, 'NI', 'NICARAGUA', '505', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (153, 'NL', 'NETHERLANDS', '31', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (154, 'NO', 'NORWAY', '47', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (155, 'NP', 'NEPAL', '977', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (156, 'NR', 'NAURU', '674', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (157, 'NU', 'NIUE', '683', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (158, 'NZ', 'NEW ZEALAND', '64', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (159, 'OM', 'OMAN', '968', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (160, 'PA', 'PANAMA', '507', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (161, 'PE', 'PERU', '51', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (162, 'PF', 'FRENCH POLYNESIA', '689', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (163, 'PG', 'PAPUA NEW GUINEA', '675', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (164, 'PH', 'PHILIPPINES', '63', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (165, 'PK', 'PAKISTAN', '92', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (166, 'PL', 'POLAND', '48', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (167, 'PM', 'SAINT PIERRE AND MIQUELON', '508', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (168, 'PN', 'PITCAIRN', '870', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (169, 'PR', 'PUERTO RICO', '1', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (170, 'PT', 'PORTUGAL', '351', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (171, 'PW', 'PALAU', '680', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (172, 'PY', 'PARAGUAY', '595', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (173, 'QA', 'QATAR', '974', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (174, 'RO', 'ROMANIA', '40', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (175, 'RS', 'SERBIA', '381', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (176, 'RU', 'RUSSIAN FEDERATION', '7', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (177, 'RW', 'RWANDA', '250', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (178, 'SA', 'SAUDI ARABIA', '966', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (179, 'SB', 'SOLOMON ISLANDS', '677', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (180, 'SC', 'SEYCHELLES', '248', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (181, 'SD', 'SUDAN', '249', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (182, 'SE', 'SWEDEN', '46', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (183, 'SG', 'SINGAPORE', '65', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (184, 'SH', 'SAINT HELENA', '290', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (185, 'SI', 'SLOVENIA', '386', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (186, 'SK', 'SLOVAKIA', '421', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (187, 'SL', 'SIERRA LEONE', '232', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (188, 'SM', 'SAN MARINO', '378', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (189, 'SN', 'SENEGAL', '221', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (190, 'SO', 'SOMALIA', '252', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (191, 'SR', 'SURINAME', '597', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (192, 'ST', 'SAO TOME AND PRINCIPE', '239', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (193, 'SV', 'EL SALVADOR', '503', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (194, 'SY', 'SYRIAN ARAB REPUBLIC', '963', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (195, 'SZ', 'SWAZILAND', '268', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (196, 'TC', 'TURKS AND CAICOS ISLANDS', '1649', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (197, 'TD', 'CHAD', '235', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (198, 'TG', 'TOGO', '228', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (199, 'TH', 'THAILAND', '66', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (200, 'TJ', 'TAJIKISTAN', '992', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (201, 'TK', 'TOKELAU', '690', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (202, 'TL', 'TIMOR-LESTE', '670', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (203, 'TM', 'TURKMENISTAN', '993', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (204, 'TN', 'TUNISIA', '216', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (205, 'TO', 'TONGA', '676', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (206, 'TR', 'TURKEY', '90', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (207, 'TT', 'TRINIDAD AND TOBAGO', '1868', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (208, 'TV', 'TUVALU', '688', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (209, 'TW', 'TAIWAN, PROVINCE OF CHINA', '886', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', '255', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (211, 'UA', 'UKRAINE', '380', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (212, 'UG', 'UGANDA', '256', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (213, 'US', 'UNITED STATES', '1', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (214, 'UY', 'URUGUAY', '598', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (215, 'UZ', 'UZBEKISTAN', '998', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (216, 'VA', 'HOLY SEE (VATICAN CITY STATE)', '39', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (217, 'VC', 'SAINT VINCENT AND THE GRENADINES', '1784', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (218, 'VE', 'VENEZUELA', '58', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (219, 'VG', 'VIRGIN ISLANDS, BRITISH', '1284', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (220, 'VI', 'VIRGIN ISLANDS, U.S.', '1340', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (221, 'VN', 'VIET NAM', '84', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (222, 'VU', 'VANUATU', '678', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (223, 'WF', 'WALLIS AND FUTUNA', '681', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (224, 'WS', 'SAMOA', '685', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (225, 'XK', 'KOSOVO', '381', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (226, 'YE', 'YEMEN', '967', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (227, 'YT', 'MAYOTTE', '262', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (228, 'ZA', 'SOUTH AFRICA', '27', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (229, 'ZM', 'ZAMBIA', '260', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
INSERT INTO `data_option_phone_number_country_code` VALUES (230, 'ZW', 'ZIMBABWE', '263', 1, 1, '2019-01-09 09:58:14', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for data_option_prefix
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
-- Records of data_option_prefix
-- ----------------------------
BEGIN;
INSERT INTO `data_option_prefix` VALUES (1, 'Mr.', 1, '2017-12-11 15:34:00', 1, 1, '2017-12-13 17:15:11');
INSERT INTO `data_option_prefix` VALUES (2, 'Ms.', 1, '2017-12-11 15:34:08', 1, 1, '2017-12-13 17:15:11');
INSERT INTO `data_option_prefix` VALUES (3, 'Mrs.', 1, '2017-12-11 15:34:05', 1, 1, '2017-12-13 17:15:11');
INSERT INTO `data_option_prefix` VALUES (4, 'Dr.', 1, '2017-12-11 15:34:03', 1, 1, '2017-12-13 17:15:11');
INSERT INTO `data_option_prefix` VALUES (5, 'Prof.', 1, '2017-12-13 17:14:59', 1, 1, '2017-12-13 17:15:11');
COMMIT;

-- ----------------------------
-- Table structure for department
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for document
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for document_format
-- ----------------------------
DROP TABLE IF EXISTS `document_format`;
CREATE TABLE `document_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_type` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of document_format
-- ----------------------------
BEGIN;
INSERT INTO `document_format` VALUES (1, 1, 'INV');
INSERT INTO `document_format` VALUES (2, 2, 'REC');
INSERT INTO `document_format` VALUES (3, 3, 'EXP');
INSERT INTO `document_format` VALUES (4, 4, 'PRO');
INSERT INTO `document_format` VALUES (5, 5, 'QUT');
INSERT INTO `document_format` VALUES (6, 6, 'ADV');
INSERT INTO `document_format` VALUES (7, 7, 'PRE');
INSERT INTO `document_format` VALUES (8, 8, 'ERO');
COMMIT;

-- ----------------------------
-- Table structure for employee_position
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for employee_profile
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for eot_customer
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
-- Table structure for event_list
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
-- Table structure for expense
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for expense_data
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for expense_related_to
-- ----------------------------
DROP TABLE IF EXISTS `expense_related_to`;
CREATE TABLE `expense_related_to` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expense_related_to
-- ----------------------------
BEGIN;
INSERT INTO `expense_related_to` VALUES (1, 'Supplier');
INSERT INTO `expense_related_to` VALUES (2, 'Customer');
INSERT INTO `expense_related_to` VALUES (3, 'Project');
COMMIT;

-- ----------------------------
-- Table structure for finance_chart_of_account
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for finance_chart_of_account_amount
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for folder
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for hls_solutions
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
-- Table structure for invoice_status
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
-- Records of invoice_status
-- ----------------------------
BEGIN;
INSERT INTO `invoice_status` VALUES (1, 'PAID', 'label-info', 1);
INSERT INTO `invoice_status` VALUES (2, 'OVERDUE', 'label-warning', 1);
INSERT INTO `invoice_status` VALUES (3, 'PARTIALLY PAID', 'label-success', 1);
INSERT INTO `invoice_status` VALUES (4, 'UNPAID', 'label-mint', 1);
INSERT INTO `invoice_status` VALUES (5, 'VOIDED', 'label-danger', 1);
COMMIT;

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `long_description` text,
  `short_description` varchar(255) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `setup_fee` decimal(10,2) DEFAULT NULL,
  `id_tax` int(11) DEFAULT NULL,
  `id_group` int(11) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for item_data
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
-- Table structure for item_group
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for item_group_data
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
-- Table structure for item_group_department
-- ----------------------------
DROP TABLE IF EXISTS `item_group_department`;
CREATE TABLE `item_group_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item_group` int(11) DEFAULT NULL,
  `id_department` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for item_group_template_detail
-- ----------------------------
DROP TABLE IF EXISTS `item_group_template_detail`;
CREATE TABLE `item_group_template_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item_group` int(11) DEFAULT NULL,
  `id_item_group_type` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for item_group_type
-- ----------------------------
DROP TABLE IF EXISTS `item_group_type`;
CREATE TABLE `item_group_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for knowledge_base
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
-- Table structure for knowledge_base_position
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_base_position`;
CREATE TABLE `knowledge_base_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_knowledge_base` int(11) DEFAULT NULL,
  `id_position` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for lead_profile
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of lead_profile
-- ----------------------------
BEGIN;
INSERT INTO `lead_profile` VALUES (1, 'Saody', 'eOcambo Technology', '087666888', 'saody@eocambo.com', NULL, NULL, 'Siem Reap,Cambodia', 56, 21, NULL, 'Siem Reap,Cambodia', 21, 56, 'Siem Reap,Cambodia', 21, 56, 1, 1, '2019-09-10 16:02:03', NULL, '2019-09-10 16:17:54', 1, '', 6, NULL, 3, '', 1000.00, NULL);
COMMIT;

-- ----------------------------
-- Table structure for lead_profile_note
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for leave_application
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for leave_in_the_year
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
-- Table structure for leave_in_the_year_data
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
-- Table structure for leave_role
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
-- Records of leave_role
-- ----------------------------
BEGIN;
INSERT INTO `leave_role` VALUES (1, 'Maximum of leaving Day. ', 11, '2017-12-13 17:33:19', 1, 11, '2017-12-13 17:33:19');
COMMIT;

-- ----------------------------
-- Table structure for leave_status
-- ----------------------------
DROP TABLE IF EXISTS `leave_status`;
CREATE TABLE `leave_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `css` varchar(255) DEFAULT NULL,
  `approve_status_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of leave_status
-- ----------------------------
BEGIN;
INSERT INTO `leave_status` VALUES (1, 'label-warning', 'Pending');
INSERT INTO `leave_status` VALUES (2, 'label-success', 'Approved');
INSERT INTO `leave_status` VALUES (3, 'label-danger', 'Rejected');
COMMIT;

-- ----------------------------
-- Table structure for leave_type_condition
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
-- Records of leave_type_condition
-- ----------------------------
BEGIN;
INSERT INTO `leave_type_condition` VALUES (1, 'Paid', 11, '2017-12-13 17:32:50', 1, 11, '2017-12-13 17:32:50');
INSERT INTO `leave_type_condition` VALUES (2, 'Unpaid', 11, '2017-12-13 17:32:56', 1, 11, '2017-12-13 17:32:56');
INSERT INTO `leave_type_condition` VALUES (3, 'Compensatory Off', 11, '2017-12-13 17:33:01', 1, 11, '2017-12-13 17:33:01');
INSERT INTO `leave_type_condition` VALUES (4, 'On Duty', 11, '2017-12-13 17:33:06', 1, 11, '2017-12-13 17:33:06');
COMMIT;

-- ----------------------------
-- Table structure for leave_type_name
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
-- Records of leave_type_name
-- ----------------------------
BEGIN;
INSERT INTO `leave_type_name` VALUES (1, 'WORKING DAY', 'WD', '#1eb1ed', 1, '2018-12-03 13:05:31', 1, 11, '2017-12-13 17:32:17');
INSERT INTO `leave_type_name` VALUES (2, 'DAY OFF', 'OFF', '#1072bd', 11, '2017-12-13 17:32:36', 1, 11, '2017-12-13 17:32:36');
INSERT INTO `leave_type_name` VALUES (3, 'HALF PUBLIC HOLIDAY', 'HPH', '#e06b21', 1, '2018-12-03 13:05:56', 1, 11, '2017-12-13 17:32:41');
INSERT INTO `leave_type_name` VALUES (4, 'PUBLIC HOLIDAY', 'PH', '#964714', 1, '2018-12-03 13:06:01', 1, 1, '2018-12-03 13:06:01');
INSERT INTO `leave_type_name` VALUES (5, 'HALF ANNUAL LEAVE', 'HAL', '#8eb5e0', 1, '2018-12-03 13:06:16', 1, 1, '2018-12-03 13:06:16');
INSERT INTO `leave_type_name` VALUES (6, 'ANNUAL LEAVE', 'AL', '#568ed3', 1, '2018-12-03 13:06:23', 1, 1, '2018-12-03 13:06:23');
INSERT INTO `leave_type_name` VALUES (7, 'HALF DAY SICK LEAVE', 'HSL', '#fdbf2d', NULL, NULL, 1, NULL, NULL);
INSERT INTO `leave_type_name` VALUES (8, 'SICK LEAVE', 'SL', '#fffd38', NULL, NULL, 1, NULL, NULL);
INSERT INTO `leave_type_name` VALUES (9, 'ABSENCE', 'ABS', '#6f359e', NULL, NULL, 1, NULL, NULL);
INSERT INTO `leave_type_name` VALUES (10, 'LATE', 'L', '#fc0d1b', NULL, NULL, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for marital_status
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
-- Records of marital_status
-- ----------------------------
BEGIN;
INSERT INTO `marital_status` VALUES (1, 'Single', NULL, NULL, 1, 1, '2019-04-22 08:44:08');
INSERT INTO `marital_status` VALUES (2, 'Married', NULL, NULL, 1, 1, '2019-04-22 08:46:07');
INSERT INTO `marital_status` VALUES (3, 'Widowed', NULL, NULL, 1, 1, '2019-04-22 08:46:30');
INSERT INTO `marital_status` VALUES (4, 'Divorced', NULL, NULL, 1, 1, '2019-04-22 08:47:16');
COMMIT;

-- ----------------------------
-- Table structure for membership_document
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
-- Table structure for membership_event
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
-- Table structure for membership_payment
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
-- Table structure for membership_profile
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
-- Table structure for membership_type
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
-- Records of membership_type
-- ----------------------------
BEGIN;
INSERT INTO `membership_type` VALUES (1, 'Diamond', 'sdfsd', '2019-04-18 08:57:41', 1, '2019-04-18 08:57:41', 1, 1);
INSERT INTO `membership_type` VALUES (2, 'Gold', '', '2019-04-18 10:36:33', 1, '2019-04-18 10:36:33', 1, 1);
INSERT INTO `membership_type` VALUES (4, 'Silver', '', '2019-04-18 14:02:07', 1, '2019-04-22 11:05:15', 1, 1);
INSERT INTO `membership_type` VALUES (5, 'Brone', '', '2019-04-18 14:03:38', 1, '2019-04-18 14:12:47', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migration
-- ----------------------------
BEGIN;
INSERT INTO `migration` VALUES ('m000000_000000_base', 1552447078);
INSERT INTO `migration` VALUES ('m130524_201442_init', 1552447085);
COMMIT;

-- ----------------------------
-- Table structure for milestone_data
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
-- Table structure for month_list
-- ----------------------------
DROP TABLE IF EXISTS `month_list`;
CREATE TABLE `month_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of month_list
-- ----------------------------
BEGIN;
INSERT INTO `month_list` VALUES (1, 'January');
INSERT INTO `month_list` VALUES (2, 'February');
INSERT INTO `month_list` VALUES (3, 'March');
INSERT INTO `month_list` VALUES (4, 'April');
INSERT INTO `month_list` VALUES (5, 'May');
INSERT INTO `month_list` VALUES (6, 'June');
INSERT INTO `month_list` VALUES (7, 'July');
INSERT INTO `month_list` VALUES (8, 'August');
INSERT INTO `month_list` VALUES (9, 'September');
INSERT INTO `month_list` VALUES (10, 'October');
INSERT INTO `month_list` VALUES (11, 'November');
INSERT INTO `month_list` VALUES (12, 'December');
COMMIT;

-- ----------------------------
-- Table structure for pay_period
-- ----------------------------
DROP TABLE IF EXISTS `pay_period`;
CREATE TABLE `pay_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_period
-- ----------------------------
BEGIN;
INSERT INTO `pay_period` VALUES (1, '1 month');
INSERT INTO `pay_period` VALUES (2, '2 months');
INSERT INTO `pay_period` VALUES (3, '3 months');
INSERT INTO `pay_period` VALUES (4, '4 months');
INSERT INTO `pay_period` VALUES (5, '5 months');
INSERT INTO `pay_period` VALUES (6, '6 months');
COMMIT;

-- ----------------------------
-- Table structure for payment_for
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
-- Records of payment_for
-- ----------------------------
BEGIN;
INSERT INTO `payment_for` VALUES (1, 'Membership', NULL, NULL, 1, 1, '2019-05-17 11:19:01');
INSERT INTO `payment_for` VALUES (2, 'Event', NULL, NULL, 1, 1, '2019-05-17 11:19:11');
COMMIT;

-- ----------------------------
-- Table structure for payment_method
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
-- Records of payment_method
-- ----------------------------
BEGIN;
INSERT INTO `payment_method` VALUES (1, 'Cash', 1, '2019-04-23 15:34:27', 1, 11, '2017-12-13 17:20:12');
INSERT INTO `payment_method` VALUES (2, 'Transfer Money', 11, '2017-12-13 17:20:18', 1, 11, '2017-12-13 17:20:18');
INSERT INTO `payment_method` VALUES (3, 'Cheque', 11, '2017-12-13 17:20:24', 1, 11, '2017-12-13 17:20:24');
INSERT INTO `payment_method` VALUES (5, 'E-payment', 11, '2017-12-13 17:20:29', 1, 11, '2017-12-13 17:20:29');
INSERT INTO `payment_method` VALUES (6, 'POS Credit Card', 35, '2018-08-11 19:23:31', 1, 35, '2018-08-11 19:23:31');
COMMIT;

-- ----------------------------
-- Table structure for payment_status
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
-- Records of payment_status
-- ----------------------------
BEGIN;
INSERT INTO `payment_status` VALUES (1, 'Paid', 1, '2019-06-03 11:34:41', 1, 1, '2019-05-17 08:50:14');
INSERT INTO `payment_status` VALUES (2, 'Pending', NULL, NULL, 1, 1, '2019-05-17 08:50:26');
INSERT INTO `payment_status` VALUES (3, 'Overdue', NULL, NULL, 1, 1, '2019-05-17 08:50:35');
INSERT INTO `payment_status` VALUES (4, 'Expired', 1, '2019-06-03 11:35:57', 1, 1, '2019-05-17 08:50:47');
COMMIT;

-- ----------------------------
-- Table structure for payment_type
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
-- Records of payment_type
-- ----------------------------
BEGIN;
INSERT INTO `payment_type` VALUES (1, 'Pre-payment', 1, '2019-07-03 13:30:09', 1, 11, '2017-12-13 17:20:41');
INSERT INTO `payment_type` VALUES (2, 'Cash on Arrival', 1, '2019-07-03 13:30:40', 1, 11, '2017-12-13 17:20:46');
INSERT INTO `payment_type` VALUES (3, 'Before check out', 1, '2019-07-03 13:30:45', 1, 11, '2017-12-13 17:20:52');
INSERT INTO `payment_type` VALUES (4, 'Credit', 1, '2019-07-03 13:30:48', 1, 11, '2017-12-13 17:20:59');
INSERT INTO `payment_type` VALUES (5, 'Deposit', 1, '2019-07-03 13:31:03', 1, 11, '2017-12-13 17:21:05');
COMMIT;

-- ----------------------------
-- Table structure for payroll
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
-- Table structure for payroll_data
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
-- Table structure for payroll_request
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for payroll_request_data
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
-- Table structure for payroll_request_status
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
-- Records of payroll_request_status
-- ----------------------------
BEGIN;
INSERT INTO `payroll_request_status` VALUES (1, 'Approved', 'label label-info', 1);
INSERT INTO `payroll_request_status` VALUES (2, 'Requested', 'label label-primary', 1);
INSERT INTO `payroll_request_status` VALUES (3, 'Preparing', 'label label-danger', 1);
COMMIT;

-- ----------------------------
-- Table structure for payroll_status
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
-- Records of payroll_status
-- ----------------------------
BEGIN;
INSERT INTO `payroll_status` VALUES (1, 'Approved', 'label label-info', 1);
INSERT INTO `payroll_status` VALUES (2, 'Paid', 'label label-primary', 1);
INSERT INTO `payroll_status` VALUES (3, 'Rejected', 'label label-danger', 1);
INSERT INTO `payroll_status` VALUES (4, 'Waiting for Approval', 'label label-mint', 1);
COMMIT;

-- ----------------------------
-- Table structure for payroll_type
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
-- Records of payroll_type
-- ----------------------------
BEGIN;
INSERT INTO `payroll_type` VALUES (1, 'Basic Salary', 1, NULL, NULL, NULL, NULL);
INSERT INTO `payroll_type` VALUES (2, 'Overtime', 1, NULL, NULL, NULL, NULL);
INSERT INTO `payroll_type` VALUES (3, 'Allowance', 1, NULL, NULL, NULL, NULL);
INSERT INTO `payroll_type` VALUES (4, 'Deduct', 1, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for permission_action
-- ----------------------------
DROP TABLE IF EXISTS `permission_action`;
CREATE TABLE `permission_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) DEFAULT NULL,
  `permission_menu_id` int(11) DEFAULT NULL,
  `is_show_menu` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=966 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission_action
-- ----------------------------
BEGIN;
INSERT INTO `permission_action` VALUES (840, 2, 1, NULL);
INSERT INTO `permission_action` VALUES (841, 2, 23, NULL);
INSERT INTO `permission_action` VALUES (842, 2, 44, NULL);
INSERT INTO `permission_action` VALUES (843, 2, 20, NULL);
INSERT INTO `permission_action` VALUES (844, 2, 24, NULL);
INSERT INTO `permission_action` VALUES (845, 2, 64, NULL);
INSERT INTO `permission_action` VALUES (846, 2, 31, NULL);
INSERT INTO `permission_action` VALUES (847, 2, 33, NULL);
INSERT INTO `permission_action` VALUES (848, 2, 45, NULL);
INSERT INTO `permission_action` VALUES (849, 2, 28, NULL);
INSERT INTO `permission_action` VALUES (850, 2, 32, NULL);
INSERT INTO `permission_action` VALUES (851, 2, 43, NULL);
INSERT INTO `permission_action` VALUES (852, 2, 21, NULL);
INSERT INTO `permission_action` VALUES (853, 2, 63, NULL);
INSERT INTO `permission_action` VALUES (854, 2, 30, NULL);
INSERT INTO `permission_action` VALUES (855, 2, 25, NULL);
INSERT INTO `permission_action` VALUES (856, 2, 39, NULL);
INSERT INTO `permission_action` VALUES (857, 2, 29, NULL);
INSERT INTO `permission_action` VALUES (858, 2, 38, NULL);
INSERT INTO `permission_action` VALUES (859, 2, 40, NULL);
INSERT INTO `permission_action` VALUES (860, 2, 57, NULL);
INSERT INTO `permission_action` VALUES (861, 2, 60, NULL);
INSERT INTO `permission_action` VALUES (862, 2, 58, NULL);
INSERT INTO `permission_action` VALUES (863, 2, 59, NULL);
INSERT INTO `permission_action` VALUES (864, 2, 52, NULL);
INSERT INTO `permission_action` VALUES (865, 2, 22, NULL);
INSERT INTO `permission_action` VALUES (866, 2, 55, NULL);
INSERT INTO `permission_action` VALUES (867, 2, 35, NULL);
INSERT INTO `permission_action` VALUES (868, 2, 54, NULL);
INSERT INTO `permission_action` VALUES (869, 2, 6, NULL);
INSERT INTO `permission_action` VALUES (893, 3, 1, NULL);
INSERT INTO `permission_action` VALUES (894, 3, 20, NULL);
INSERT INTO `permission_action` VALUES (895, 3, 21, NULL);
INSERT INTO `permission_action` VALUES (896, 3, 63, NULL);
INSERT INTO `permission_action` VALUES (897, 3, 57, NULL);
INSERT INTO `permission_action` VALUES (898, 3, 59, NULL);
INSERT INTO `permission_action` VALUES (899, 3, 60, NULL);
INSERT INTO `permission_action` VALUES (900, 3, 58, NULL);
INSERT INTO `permission_action` VALUES (901, 3, 50, NULL);
INSERT INTO `permission_action` VALUES (902, 3, 55, NULL);
INSERT INTO `permission_action` VALUES (903, 3, 22, NULL);
INSERT INTO `permission_action` VALUES (904, 3, 35, NULL);
INSERT INTO `permission_action` VALUES (905, 3, 6, NULL);
INSERT INTO `permission_action` VALUES (906, 4, 1, NULL);
INSERT INTO `permission_action` VALUES (907, 4, 23, NULL);
INSERT INTO `permission_action` VALUES (908, 4, 20, NULL);
INSERT INTO `permission_action` VALUES (909, 4, 63, NULL);
INSERT INTO `permission_action` VALUES (910, 4, 57, NULL);
INSERT INTO `permission_action` VALUES (911, 4, 60, NULL);
INSERT INTO `permission_action` VALUES (912, 4, 58, NULL);
INSERT INTO `permission_action` VALUES (913, 4, 59, NULL);
INSERT INTO `permission_action` VALUES (914, 4, 50, NULL);
INSERT INTO `permission_action` VALUES (915, 4, 22, NULL);
INSERT INTO `permission_action` VALUES (916, 4, 55, NULL);
INSERT INTO `permission_action` VALUES (917, 4, 35, NULL);
INSERT INTO `permission_action` VALUES (918, 4, 52, NULL);
INSERT INTO `permission_action` VALUES (919, 4, 6, NULL);
INSERT INTO `permission_action` VALUES (920, 1, 1, NULL);
INSERT INTO `permission_action` VALUES (921, 1, 60, NULL);
INSERT INTO `permission_action` VALUES (922, 1, 44, NULL);
INSERT INTO `permission_action` VALUES (923, 1, 23, NULL);
INSERT INTO `permission_action` VALUES (924, 1, 20, NULL);
INSERT INTO `permission_action` VALUES (925, 1, 21, NULL);
INSERT INTO `permission_action` VALUES (926, 1, 63, NULL);
INSERT INTO `permission_action` VALUES (927, 1, 59, NULL);
INSERT INTO `permission_action` VALUES (928, 1, 54, NULL);
INSERT INTO `permission_action` VALUES (929, 1, 35, NULL);
INSERT INTO `permission_action` VALUES (930, 1, 6, NULL);
INSERT INTO `permission_action` VALUES (931, 1, 24, NULL);
INSERT INTO `permission_action` VALUES (932, 1, 33, NULL);
INSERT INTO `permission_action` VALUES (933, 1, 43, NULL);
INSERT INTO `permission_action` VALUES (934, 1, 31, NULL);
INSERT INTO `permission_action` VALUES (935, 1, 49, NULL);
INSERT INTO `permission_action` VALUES (936, 1, 29, NULL);
INSERT INTO `permission_action` VALUES (937, 1, 30, NULL);
INSERT INTO `permission_action` VALUES (938, 1, 25, NULL);
INSERT INTO `permission_action` VALUES (939, 1, 51, NULL);
INSERT INTO `permission_action` VALUES (940, 1, 42, NULL);
INSERT INTO `permission_action` VALUES (941, 1, 50, NULL);
INSERT INTO `permission_action` VALUES (942, 1, 22, NULL);
INSERT INTO `permission_action` VALUES (943, 1, 55, NULL);
INSERT INTO `permission_action` VALUES (944, 1, 52, NULL);
INSERT INTO `permission_action` VALUES (945, 1, 56, NULL);
INSERT INTO `permission_action` VALUES (946, 1, 27, NULL);
INSERT INTO `permission_action` VALUES (947, 1, 48, NULL);
INSERT INTO `permission_action` VALUES (948, 1, 41, NULL);
INSERT INTO `permission_action` VALUES (949, 1, 46, NULL);
INSERT INTO `permission_action` VALUES (950, 1, 8, NULL);
INSERT INTO `permission_action` VALUES (951, 1, 58, NULL);
INSERT INTO `permission_action` VALUES (952, 1, 13, NULL);
INSERT INTO `permission_action` VALUES (953, 1, 17, NULL);
INSERT INTO `permission_action` VALUES (954, 1, 34, NULL);
INSERT INTO `permission_action` VALUES (955, 1, 28, NULL);
INSERT INTO `permission_action` VALUES (956, 1, 32, NULL);
INSERT INTO `permission_action` VALUES (957, 1, 64, NULL);
INSERT INTO `permission_action` VALUES (958, 1, 45, NULL);
INSERT INTO `permission_action` VALUES (959, 1, 38, NULL);
INSERT INTO `permission_action` VALUES (960, 1, 39, NULL);
INSERT INTO `permission_action` VALUES (961, 1, 40, NULL);
INSERT INTO `permission_action` VALUES (962, 1, 11, NULL);
INSERT INTO `permission_action` VALUES (963, 1, 47, NULL);
INSERT INTO `permission_action` VALUES (964, 1, 62, NULL);
INSERT INTO `permission_action` VALUES (965, 1, 65, NULL);
COMMIT;

-- ----------------------------
-- Table structure for permission_action_data
-- ----------------------------
DROP TABLE IF EXISTS `permission_action_data`;
CREATE TABLE `permission_action_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_permission_action` int(11) DEFAULT NULL,
  `allow_action` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for permission_menu
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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission_menu
-- ----------------------------
BEGIN;
INSERT INTO `permission_menu` VALUES (1, 1, 0, 'Dashboard', 1, 'demo-pli-home', '/', 'index dashboard', 1, 'site', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (2, 1, 0, 'Subscriber', NULL, 'fa fa-group', 'membership-profile/subscriber', 'membership-profile-subscriber membership-profile-subscriber membership-payment-subscriber membership-event-subscriber membership-document-subscriber', 0, 'membership-profile', 'subscriber', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (3, 1, 0, 'Event', NULL, 'fa fa-calendar', 'event-list/index', 'event-list-index', 0, 'event-list', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (4, 1, 0, 'Task', NULL, 'fa fa-tasks', 'membership-event/task', 'membership-event-task', 0, 'event-list', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (5, 1, 0, 'Payment', NULL, 'demo-pli-coin', 'membership-payment/payment', 'membership-payment-payment', 0, 'membership-payment', 'payment', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (6, 1, 0, 'Document', 11, 'fa fa-file-text-o', 'document/index', 'document-index document-subscriber', 1, 'document', 'index', 'index,create,view,update,delete,,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download');
INSERT INTO `permission_menu` VALUES (7, 1, 0, 'User', 0, 'demo-pli-male icon-fw', 'user/index', 'user-index', 0, 'user', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (8, 1, 0, 'Setting', 16, 'demo-pli-gear icon-lg icon-fw', '#', 'company-profile-index payment-status-index data-option-phone-country-code-index data-option-prefix-index marital-status-index country-index city-index payment-method-index user-type-index department-index employee-position-index bank-index chart-account-index item-group-data-index item-index item-group-index contract-type-index account-type-index standard-operation-step-index working-group-index', 1, NULL, NULL, 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (9, 0, 8, 'Payment Status', 0, NULL, 'payment-status/index', 'payment-status-index', 0, 'payment-status', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (10, 0, 8, 'Payment For', 0, NULL, 'payment-for/index', 'payment-for-index', 0, 'payment-for', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (11, 0, 8, 'Position', 12, NULL, 'employee-position/index', 'employee-position-index', 1, 'employee-position', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (12, 0, 8, 'Permission', 0, NULL, 'permission/index', 'permission-index', 0, 'permission', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (13, 0, 8, 'Prefix', 2, NULL, 'data-option-prefix/index', 'data-option-prefix-index', 1, 'data-option-prefix', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (14, 0, 8, 'Phone country code', 0, NULL, 'data-option-phone-country-code/index', 'data-option-phone-country-code-index', 0, 'data-option-phone-country-code', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (15, 0, 8, 'Marital Status', 0, NULL, 'marital-status/index', 'marital-status-index', 0, 'marital-status', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (16, 0, 8, 'Country', 0, NULL, 'country/index', 'country-index', 0, 'country', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (17, 0, 8, 'City', 3, NULL, 'city/index', 'city-index', 1, 'city', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (18, 0, 8, 'Payment Type', 0, NULL, 'payment-type/index', 'payment-type-index', 0, 'payment-type', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (19, 0, 8, 'Payment Method', 0, NULL, 'payment-method/index', 'payment-method-index', 0, 'payment-method', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (20, 1, 0, 'Projects', 5, 'fa fa-cubes', 'project/index', 'project-index', 1, 'project', 'index', 'index,create,view,update,delete,overview,task,copy,timesheet,sale-invoice,sale-payment,sale-quotation,dependent-get-customer-info,sale-expense,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download,note');
INSERT INTO `permission_menu` VALUES (21, 1, 0, 'Tasks', 6, 'fa fa-tasks', 'task/index', 'task-index', 1, 'task', 'index', 'index,create,view,update,delete,copy');
INSERT INTO `permission_menu` VALUES (22, 0, 50, 'Employee', 1, '', 'employee-profile/index', 'employee-profile-index', 1, 'employee-profile', 'index', 'index,create,view,update,delete,profile,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download,get-department');
INSERT INTO `permission_menu` VALUES (23, 1, 0, 'Customer', 4, 'fa fa-user-o', 'customer-profile/index', 'customer-profile-index', 1, 'customer-profile', 'index', 'index,create,view,update,delete,import-csv,download-sample-csv,profile,solution,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download');
INSERT INTO `permission_menu` VALUES (24, 1, 0, 'Sales', 12, 'fa fa-balance-scale', '#', 'quotation-index proposal-index contract-index', 1, 'sale', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (25, 0, 49, 'Expense', 3, 'fa fa-file-text-o', 'expense/index', 'expense-index', 1, 'expense', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (27, 1, 0, 'Report', 15, 'fa fa-area-chart', 'report/index', 'finance-chart-of-account-index index employee-report-report', 1, 'report', 'index', 'index,create,view,update,delete,report');
INSERT INTO `permission_menu` VALUES (28, 0, 8, 'Items', 5, NULL, 'item/index', 'item-index', 1, 'item', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (29, 0, 49, 'Invoices', 1, NULL, 'customer-invoice/index', 'customer-invoice-index customer-invoice-view', 1, 'customer-invoice', 'index', 'index,create,view,update,delete,void,validation-payment');
INSERT INTO `permission_menu` VALUES (30, 0, 49, 'Payments', 2, NULL, 'customer-payment/index', 'customer-payment-index customer-payment-view', 1, 'customer-payment', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (31, 0, 24, 'Contracts', 3, NULL, 'contract/index', 'contract-index', 1, 'contract', 'index', 'index,create,view,update,delete,detail,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download,overview');
INSERT INTO `permission_menu` VALUES (32, 0, 8, 'Item Group', 6, NULL, 'item-group/index', 'item-group-index', 1, 'item-group', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (33, 0, 24, 'Proposal', 1, NULL, 'proposal/index', 'proposal-index', 1, 'proposal', 'index', 'index,create,view,update,delete,overview,note');
INSERT INTO `permission_menu` VALUES (34, 0, 8, 'Company Profile', 4, NULL, 'company-profile/index', 'company-profile-index', 1, 'company-profile', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (35, 1, 0, 'Knowledge Base', 10, 'fa fa-file-text-o', 'knowledge-base/index', 'knowledge-base-index', 1, 'knowledge-base', 'index', 'index,create,view,update,delete,article');
INSERT INTO `permission_menu` VALUES (38, 0, 8, 'Account Type', 9, NULL, 'account-type/index', 'account-type-index', 1, 'account-type', NULL, 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (39, 0, 8, 'Chart of Account', 10, NULL, 'chart-account/index', 'chart-account-index', 1, 'chart-account', NULL, 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (40, 0, 8, 'Bank', 11, NULL, 'bank/index', 'bank-index', 1, 'bank', NULL, 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (41, 0, 27, 'Chart of Account', 0, NULL, 'finance-chart-of-account/index', 'finance-chart-of-account-index', 1, 'finance-chart-of-account', NULL, 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (42, 0, 49, 'Supplier', 5, 'demo-pli-male-female', 'supplier-profile/index', 'supplier-profile-index', 1, 'supplier-profile', NULL, 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (43, 0, 24, 'Quotation', 2, NULL, 'quotation/index', 'quotation-index', 1, 'quotation', 'index', 'index,create,view,update,delete,overview,pdf,dependent-get-customer-info,download');
INSERT INTO `permission_menu` VALUES (44, 1, 0, 'Lead', 3, 'fa fa-tty', 'lead-profile/index', 'lead-profile-index', 1, 'lead-profile', 'index', 'index,create,view,update,delete,import-csv,download-sample-csv,profile,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download,convert-lead');
INSERT INTO `permission_menu` VALUES (45, 0, 8, 'Contract Type', 8, NULL, 'contract-type/index', 'contract-type-index', 1, 'contract-type', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (46, 0, 27, 'Sale Report', 0, NULL, 'sale-report/invoice?smMenu=1', 'sale-report-invoice', 1, 'sale-report', 'invoice', 'index,create,view,update,delete,invoice,proposal,quotation');
INSERT INTO `permission_menu` VALUES (47, 0, 8, 'Department', 13, NULL, 'department/index', 'department-index', 1, 'department', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (48, 0, 27, 'Employee Report', NULL, NULL, 'employee-report/report?smMenu=1', 'employee-report-project', 1, 'employee-report', 'project', 'index,create,view,update,delete,report,tasks,project');
INSERT INTO `permission_menu` VALUES (49, 1, 0, 'Finance', 13, 'fa fa-money', '#', 'payroll-index customer-invoice-index customer-invoice-view  customer-payment-index customer-payment-view expense-index supplier-profile-index', 1, ' ', NULL, 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (50, 1, 0, 'Human Resource', 14, 'demo-pli-address-book', '#', 'leave-in-the-year-index leave-application-index payroll-request-index payroll-type-index cash-advance-request-index employee-profile-index ', 1, 'hr', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (51, 0, 49, 'Payroll', 4, NULL, 'payroll/index', 'payroll-index', 1, 'payroll', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (52, 0, 50, 'Cash Advance Request', 3, NULL, 'cash-advance-request/index', 'cash-advance-request-index', 1, 'cash-advance-request', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (53, 0, 50, 'Payroll Type', 0, NULL, 'payroll-type/index', 'payroll-type-index', 0, 'payroll-type', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (54, 1, 0, 'Budget Setup', 9, 'demo-pli-coin', 'budget-set-up/index', 'budget-set-up-index', 1, 'budget-set-up', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (55, 0, 50, 'Leave Application', 2, NULL, 'leave-application/index', 'leave-application-index', 1, 'leave-application', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (56, 0, 50, 'Payroll Request', 4, NULL, 'payroll-request/index', 'payroll-request-index', 1, 'payroll-request', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (57, 1, 0, 'K.P.I', 8, 'demo-pli-tactic', 'standard-operation/index', 'standard-operation-index sop-goal-setup-index', 0, 'standard-operation', 'index', 'index,create,view,update,delete,form-view');
INSERT INTO `permission_menu` VALUES (58, 0, 8, 'K.P.I Set Up', 1, NULL, 'standard-operation-step/index', 'standard-operation-step-index', 1, 'standard-operation-step', 'index', 'index,create,view,update,delete,form-view');
INSERT INTO `permission_menu` VALUES (59, 1, 0, 'K.P.I', 8, 'demo-pli-tactic', 'sop-goal-setup/index', 'sop-goal-setup-index', 1, 'sop-goal-setup', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (60, 1, 0, 'Milestone', 2, 'fa fa-history', 'standard-operation/index', 'standard-operation-index', 1, 'standard-operation', 'index', 'index,create,view,update,delete,update-step-sop');
INSERT INTO `permission_menu` VALUES (61, 0, 50, 'Leave Setup', 0, NULL, 'leave-in-the-year/index', 'leave-in-the-year-index', 0, 'leave-in-the-year', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (62, 0, 8, 'User Type & Roles', 13, 'demo-pli-computer-secure', 'user-type/index', 'user-type-index user-type-roles user-type-update', 1, 'user-type', 'index', 'index,create,view,update,delete,roles');
INSERT INTO `permission_menu` VALUES (63, 1, 0, 'S.O.P', 7, 'demo-pli-receipt-4', 'standard-operation-procedure-set-up/index', 'standard-operation-procedure-set-up-index', 1, 'standard-operation-procedure-set-up', 'index', 'index,create,view,update,delete,sop-setup,,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download');
INSERT INTO `permission_menu` VALUES (64, 0, 8, 'Item Group Data', 7, NULL, 'item-group-data/index', 'item-group-data-index', 1, 'item-group-data', 'index', 'index,create,view,update,delete,item');
INSERT INTO `permission_menu` VALUES (65, 0, 8, 'Working Group', 20, NULL, 'working-group/index', 'working-group-index', 1, 'working-group', 'index', 'index,create,view,update,delete,item');
COMMIT;

-- ----------------------------
-- Table structure for permission_menu_live
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
-- Table structure for priority
-- ----------------------------
DROP TABLE IF EXISTS `priority`;
CREATE TABLE `priority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `css_class` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of priority
-- ----------------------------
BEGIN;
INSERT INTO `priority` VALUES (1, 'Low', 'label-primary');
INSERT INTO `priority` VALUES (2, 'Medium', 'label-info');
INSERT INTO `priority` VALUES (3, 'High', 'label-warning');
INSERT INTO `priority` VALUES (4, 'Urgent', 'label-danger');
COMMIT;

-- ----------------------------
-- Table structure for project
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for project_member
-- ----------------------------
DROP TABLE IF EXISTS `project_member`;
CREATE TABLE `project_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_project` int(11) DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for project_note
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
-- Table structure for project_status
-- ----------------------------
DROP TABLE IF EXISTS `project_status`;
CREATE TABLE `project_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `css_class` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of project_status
-- ----------------------------
BEGIN;
INSERT INTO `project_status` VALUES (1, 'Not Started', 'label-mint');
INSERT INTO `project_status` VALUES (2, 'In Progress', 'label-success');
INSERT INTO `project_status` VALUES (3, 'On Hold', 'label-warning');
INSERT INTO `project_status` VALUES (4, 'Cancelled', 'label-danger');
INSERT INTO `project_status` VALUES (5, 'Finished', 'label-info');
COMMIT;

-- ----------------------------
-- Table structure for project_tag
-- ----------------------------
DROP TABLE IF EXISTS `project_tag`;
CREATE TABLE `project_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_project` int(11) DEFAULT NULL,
  `id_tag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for project_timesheet
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for project_timesheet_description
-- ----------------------------
DROP TABLE IF EXISTS `project_timesheet_description`;
CREATE TABLE `project_timesheet_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_project_timesheet` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for project_timesheet_member
-- ----------------------------
DROP TABLE IF EXISTS `project_timesheet_member`;
CREATE TABLE `project_timesheet_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_project_timesheet` int(11) DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for project_timesheet_tag
-- ----------------------------
DROP TABLE IF EXISTS `project_timesheet_tag`;
CREATE TABLE `project_timesheet_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_project_timesheet` int(11) DEFAULT NULL,
  `id_tag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for proposal
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for proposal_data
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for proposal_note
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
-- Table structure for proposal_related_to
-- ----------------------------
DROP TABLE IF EXISTS `proposal_related_to`;
CREATE TABLE `proposal_related_to` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of proposal_related_to
-- ----------------------------
BEGIN;
INSERT INTO `proposal_related_to` VALUES (1, 'Customer', 1);
INSERT INTO `proposal_related_to` VALUES (2, 'Lead', 1);
COMMIT;

-- ----------------------------
-- Table structure for proposal_status
-- ----------------------------
DROP TABLE IF EXISTS `proposal_status`;
CREATE TABLE `proposal_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `css_class` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of proposal_status
-- ----------------------------
BEGIN;
INSERT INTO `proposal_status` VALUES (1, 'Draft', 'label-default');
INSERT INTO `proposal_status` VALUES (2, 'Sent', 'label-success');
INSERT INTO `proposal_status` VALUES (3, 'Open', 'label-warning');
INSERT INTO `proposal_status` VALUES (4, 'Revised', 'label-info');
INSERT INTO `proposal_status` VALUES (5, 'Declined', 'label-danger');
INSERT INTO `proposal_status` VALUES (6, 'Accepted', 'label-purple');
COMMIT;

-- ----------------------------
-- Table structure for quotation
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for quotation_data
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for quotation_status
-- ----------------------------
DROP TABLE IF EXISTS `quotation_status`;
CREATE TABLE `quotation_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `css_class` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of quotation_status
-- ----------------------------
BEGIN;
INSERT INTO `quotation_status` VALUES (1, 'Draft', 'label-default');
INSERT INTO `quotation_status` VALUES (2, 'Sent', 'label-success');
INSERT INTO `quotation_status` VALUES (4, 'Expired', 'label-info');
INSERT INTO `quotation_status` VALUES (5, 'Declined', 'label-danger');
INSERT INTO `quotation_status` VALUES (6, 'Accepted', 'label-purple');
COMMIT;

-- ----------------------------
-- Table structure for repeater_type
-- ----------------------------
DROP TABLE IF EXISTS `repeater_type`;
CREATE TABLE `repeater_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of repeater_type
-- ----------------------------
BEGIN;
INSERT INTO `repeater_type` VALUES (1, 'None');
INSERT INTO `repeater_type` VALUES (2, 'Day');
INSERT INTO `repeater_type` VALUES (3, 'Week');
INSERT INTO `repeater_type` VALUES (4, '2 Weeks');
INSERT INTO `repeater_type` VALUES (5, '1 Month');
INSERT INTO `repeater_type` VALUES (6, '2 Months');
INSERT INTO `repeater_type` VALUES (7, '3 Months');
INSERT INTO `repeater_type` VALUES (8, '6 Months');
INSERT INTO `repeater_type` VALUES (9, '1 Year');
COMMIT;

-- ----------------------------
-- Table structure for setting
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
-- Table structure for sop_goal_setup
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
-- Table structure for sop_goal_setup_data
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
-- Table structure for sop_set_up_assign_position
-- ----------------------------
DROP TABLE IF EXISTS `sop_set_up_assign_position`;
CREATE TABLE `sop_set_up_assign_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sop_set_up_id` int(11) DEFAULT NULL,
  `id_position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for source
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
-- Records of source
-- ----------------------------
BEGIN;
INSERT INTO `source` VALUES (1, 'Facebook', NULL, NULL, NULL, NULL, 1);
INSERT INTO `source` VALUES (2, 'Google', NULL, NULL, NULL, NULL, 1);
INSERT INTO `source` VALUES (3, 'Market Research', NULL, NULL, NULL, NULL, 1);
INSERT INTO `source` VALUES (4, 'Other', NULL, NULL, NULL, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for standard_operation
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for standard_operation_check_list
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for standard_operation_procedure_article
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for standard_operation_procedure_set_up
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for standard_operation_step
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for standard_operation_step_list
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for supplier_profile
-- ----------------------------
DROP TABLE IF EXISTS `supplier_profile`;
CREATE TABLE `supplier_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for supplier_profile_tag
-- ----------------------------
DROP TABLE IF EXISTS `supplier_profile_tag`;
CREATE TABLE `supplier_profile_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_supplier` int(11) DEFAULT NULL,
  `id_tag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for system_setting
-- ----------------------------
DROP TABLE IF EXISTS `system_setting`;
CREATE TABLE `system_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_setting
-- ----------------------------
BEGIN;
INSERT INTO `system_setting` VALUES (1, 1, '1 => EOT, 2 => EOH, 3 => Other');
COMMIT;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for task
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for task_check_list
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for task_member
-- ----------------------------
DROP TABLE IF EXISTS `task_member`;
CREATE TABLE `task_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_task` int(11) DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for task_related_to
-- ----------------------------
DROP TABLE IF EXISTS `task_related_to`;
CREATE TABLE `task_related_to` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task_related_to
-- ----------------------------
BEGIN;
INSERT INTO `task_related_to` VALUES (1, 'Project');
INSERT INTO `task_related_to` VALUES (2, 'Invoice');
INSERT INTO `task_related_to` VALUES (3, 'Customer');
INSERT INTO `task_related_to` VALUES (4, 'Expense');
INSERT INTO `task_related_to` VALUES (5, 'Contract');
INSERT INTO `task_related_to` VALUES (6, 'Lead');
INSERT INTO `task_related_to` VALUES (7, 'Proposal');
COMMIT;

-- ----------------------------
-- Table structure for task_status
-- ----------------------------
DROP TABLE IF EXISTS `task_status`;
CREATE TABLE `task_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `css_class` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of task_status
-- ----------------------------
BEGIN;
INSERT INTO `task_status` VALUES (1, 'Not Started', 'label-mint');
INSERT INTO `task_status` VALUES (2, 'In Progress', 'label-success');
INSERT INTO `task_status` VALUES (3, 'Testing', 'label-warning');
INSERT INTO `task_status` VALUES (4, 'Awaiting Feedback', 'label-danger');
INSERT INTO `task_status` VALUES (5, 'Complete', 'label-info');
COMMIT;

-- ----------------------------
-- Table structure for task_tag
-- ----------------------------
DROP TABLE IF EXISTS `task_tag`;
CREATE TABLE `task_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_task` int(11) DEFAULT NULL,
  `id_tag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for tax
-- ----------------------------
DROP TABLE IF EXISTS `tax`;
CREATE TABLE `tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_name` varchar(255) DEFAULT NULL,
  `value` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tax
-- ----------------------------
BEGIN;
INSERT INTO `tax` VALUES (1, 'VAT', 5.00);
COMMIT;

-- ----------------------------
-- Table structure for testing
-- ----------------------------
DROP TABLE IF EXISTS `testing`;
CREATE TABLE `testing` (
  `id` int(11) NOT NULL,
  `Testing` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uploaded_file
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of uploaded_file
-- ----------------------------
BEGIN;
INSERT INTO `uploaded_file` VALUES (1, 'NoPicAvailable.jpg', '/backend/uploads/NoPicAvailable.jpg', 65927, 'image/jpeg', NULL, b'1');
COMMIT;

-- ----------------------------
-- Table structure for user
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 1, 'systemadmin@eocambo.com', '$2y$13$58f7hH5s7s9X.R/V7fge2.gdJ0Wmr9bqjYHz0yuQtlEapokTIsH46', NULL, '8tdRr0KstxcAKFdZ00UWb_SjnK73M5uz', 1, 1, '2019-07-10 20:07:12', '2019-07-17 08:38:48', 1, NULL, NULL, NULL, 'System', 'Admin', '', '', '20', 'systemadmin', 2, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for user_type
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
-- Records of user_type
-- ----------------------------
BEGIN;
INSERT INTO `user_type` VALUES (1, b'1', 'Super Admin', 1, NULL, NULL, '2019-08-20 13:53:07', 1);
INSERT INTO `user_type` VALUES (2, b'1', 'Sales', 1, NULL, NULL, '2019-09-03 15:17:16', 13);
INSERT INTO `user_type` VALUES (3, b'1', 'Web Developer', 1, NULL, NULL, '2019-09-03 16:23:38', 1);
INSERT INTO `user_type` VALUES (4, b'1', 'Senior Web Developer', NULL, '2019-09-04 10:01:05', 1, '2019-09-04 10:02:18', 1);
COMMIT;

-- ----------------------------
-- Table structure for working_group
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for working_group_data
-- ----------------------------
DROP TABLE IF EXISTS `working_group_data`;
CREATE TABLE `working_group_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_working_group` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for working_group_department
-- ----------------------------
DROP TABLE IF EXISTS `working_group_department`;
CREATE TABLE `working_group_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_working_group` int(11) DEFAULT NULL,
  `id_department` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for year_list
-- ----------------------------
DROP TABLE IF EXISTS `year_list`;
CREATE TABLE `year_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of year_list
-- ----------------------------
BEGIN;
INSERT INTO `year_list` VALUES (1, '2019');
INSERT INTO `year_list` VALUES (2, '2020');
INSERT INTO `year_list` VALUES (3, '2021');
INSERT INTO `year_list` VALUES (4, '2022');
INSERT INTO `year_list` VALUES (5, '2023');
INSERT INTO `year_list` VALUES (6, '2024');
INSERT INTO `year_list` VALUES (7, '2025');
INSERT INTO `year_list` VALUES (8, '2026');
INSERT INTO `year_list` VALUES (9, '2027');
INSERT INTO `year_list` VALUES (10, '2028');
INSERT INTO `year_list` VALUES (11, '2029');
INSERT INTO `year_list` VALUES (12, '2030');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
