/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100133
 Source Host           : localhost:3306
 Source Schema         : 2bc_bms

 Target Server Type    : MySQL
 Target Server Version : 100133
 File Encoding         : 65001

 Date: 27/11/2019 08:21:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_type
-- ----------------------------
DROP TABLE IF EXISTS `account_type`;
CREATE TABLE `account_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_parent` int(11) NULL DEFAULT NULL,
  `names` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `detail_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account_type
-- ----------------------------
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

-- ----------------------------
-- Table structure for bank
-- ----------------------------
DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account_type` int(11) NULL DEFAULT NULL,
  `bank_address` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account_number` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `default` int(11) NOT NULL DEFAULT 0,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `swift_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bank_account_type
-- ----------------------------
DROP TABLE IF EXISTS `bank_account_type`;
CREATE TABLE `bank_account_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bank_account_type
-- ----------------------------
INSERT INTO `bank_account_type` VALUES (1, 'Saving Account');
INSERT INTO `bank_account_type` VALUES (2, 'Current Account');

-- ----------------------------
-- Table structure for billing_type
-- ----------------------------
DROP TABLE IF EXISTS `billing_type`;
CREATE TABLE `billing_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of billing_type
-- ----------------------------
INSERT INTO `billing_type` VALUES (1, 'Fixed Rate');

-- ----------------------------
-- Table structure for budget_set_up
-- ----------------------------
DROP TABLE IF EXISTS `budget_set_up`;
CREATE TABLE `budget_set_up`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_department` int(11) NULL DEFAULT NULL,
  `id_position` int(11) NULL DEFAULT NULL,
  `id_employee` int(11) NULL DEFAULT NULL,
  `year` int(111) NULL DEFAULT NULL,
  `unit_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `budget_value` decimal(10, 2) NULL DEFAULT NULL,
  `actual` decimal(10, 2) NULL DEFAULT NULL,
  `under_or_over` decimal(10, 2) NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `status` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `quarter_1` decimal(10, 2) NULL DEFAULT NULL,
  `quarter_2` decimal(10, 2) NULL DEFAULT NULL,
  `quarter_3` decimal(10, 2) NULL DEFAULT NULL,
  `quarter_4` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for budget_set_up_data
-- ----------------------------
DROP TABLE IF EXISTS `budget_set_up_data`;
CREATE TABLE `budget_set_up_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_budget_set_up` int(11) NULL DEFAULT NULL,
  `id_month` int(11) NULL DEFAULT NULL,
  `daily` decimal(10, 2) NULL DEFAULT NULL,
  `weekly` decimal(10, 2) NULL DEFAULT NULL,
  `monthly` decimal(10, 2) NULL DEFAULT NULL,
  `quarterly` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for budget_setup_value
-- ----------------------------
DROP TABLE IF EXISTS `budget_setup_value`;
CREATE TABLE `budget_setup_value`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_budget_set_up` int(11) NULL DEFAULT NULL,
  `for_month` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `daily_budget` decimal(10, 2) NULL DEFAULT NULL,
  `weekly_budget` decimal(10, 2) NULL DEFAULT NULL,
  `monthly_budget` decimal(10, 2) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cash_advance_request
-- ----------------------------
DROP TABLE IF EXISTS `cash_advance_request`;
CREATE TABLE `cash_advance_request`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `id_employee` int(11) NULL DEFAULT NULL,
  `chart_of_account` int(11) NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  `amount_in_word` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_pay_type` int(11) NULL DEFAULT NULL,
  `approved_by` int(11) NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for chart_account
-- ----------------------------
DROP TABLE IF EXISTS `chart_account`;
CREATE TABLE `chart_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `id_account_type` int(11) NULL DEFAULT NULL,
  `id_is_parent` int(11) NULL DEFAULT NULL,
  `is_parent` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `id_bank` int(11) NULL DEFAULT NULL,
  `number_code` int(5) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 278 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of chart_account
-- ----------------------------
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
INSERT INTO `chart_account` VALUES (276, 'THEOM BUNTHEOUN ABA | 000270506', 1, '2019-10-19 08:23:07', 1, 3, NULL, 64, NULL, NULL, 16, 11103);
INSERT INTO `chart_account` VALUES (277, 'Cost of Domain and Hosting', 1, '2019-10-19 09:01:22', 1, 46, NULL, 232, NULL, NULL, NULL, 17322);

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_country` int(11) NULL DEFAULT NULL,
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `names` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `video_link` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `latitude` float NULL DEFAULT NULL,
  `longitude` float NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_country`(`id_country`) USING BTREE,
  INDEX `id`(`id`, `id_country`, `code`, `names`, `description`, `img`, `video_link`, `latitude`, `longitude`, `updated_by`, `updated_date`, `status`, `created_by`, `created_date`) USING BTREE,
  INDEX `id_2`(`id`, `id_country`, `code`, `names`, `description`, `img`, `video_link`, `latitude`, `longitude`, `updated_by`, `updated_date`, `status`, `created_by`, `created_date`) USING BTREE,
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 362 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of city
-- ----------------------------
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

-- ----------------------------
-- Table structure for company_profile
-- ----------------------------
DROP TABLE IF EXISTS `company_profile`;
CREATE TABLE `company_profile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `names` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mailing_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `quotation_term_and_condition` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `vattin` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_and_payment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `what_we_do` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `mission` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vision` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `credit_arrangment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cancellation_agreement` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `confidentiality` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `info_invoice` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `info_payment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `info_expense` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `info_bill` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `info_pay_bill` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `info_opening_balance` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `info_journal_entry` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`, `names`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of company_profile
-- ----------------------------
INSERT INTO `company_profile` VALUES (1, '174', 'JCUC Constraction', 'bunthanjcuc@gmail.com', 'info@construction.com', '(+855) 92 90 99 85 / (+855) 93 90 99 85', 'https://www.jcucconstruction.com/', 'Steung tmey, Svay Dangkum, Krong Siem Reap', 'eOcambo Technology started in 2014  with a small team partnering with accommodation providers to help  them take control of their online digital marketing and booking management using cutting edge technologies through our Hotel Link Solutions products.\r\n\r\nWe have been expanding and developing rapidly especially over the past 2 years with more solutions available to accommodation providers including offering high quality custom designed websites that become a major driver for any businesses online presence.\r\n\r\nThere is now a very large number of Online Travel Agents (OTA) and other online accommodation third parties where hotels and guesthouses can gain bookings, along with the massive use of Social Media by potential guests eOcambo Technology provides our clients with advice and the tools to navigate through often confusing technologies and increase their bookings and revenue.\r\n\r\neOcambo Technology is based in Siem Reap and is now the leading provider of online digital solutions for all Cambodian accommodation providers and most importantly we have a local Khmer Support Team who are always available to offer advice and back up for our clients.\r\n\r\nOur Mission: Always create innovative solutions that meet our clients expectations.\r\n\r\nOur Vision: Be recognised as the technology company that fulfills the clients needs.', '2019-07-23 09:18:01', 1, '2019-11-23 08:41:54', '<p><span style=\"font-size:15px\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:black\">Company reserves the right to accept or decline this job description on our availability of resource at the time of client confirmation</span></span></span></p>\r\n', 21, 1, '', '', '<p>We are specialized in building pool, villa, modern house and decoration with the best quality equipment import from others famous countries. We have had experienced in building pool and housing for our clients and received good reviews from them.</p>\r\n\r\n<p>We are pleasure to be a part of your dream house, Villa and fascinating projects.</p>\r\n', '', '', '', '', '', '', NULL, '', '', '<p>Validity: 30 days from the date of quotation.</p>\r\n\r\n<p>Payment: 20% advance 80% progress of works</p>\r\n', '', '');

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_customer` int(11) NULL DEFAULT NULL,
  `id_bank` int(11) NULL DEFAULT NULL,
  `id_item` int(11) NULL DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contract_value` decimal(10, 2) NULL DEFAULT NULL,
  `signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_contract_type` int(11) NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `credit_arrangment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cancellation_agreement` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `confidentiality` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `id_discount` int(11) NULL DEFAULT NULL,
  `discount_value` decimal(10, 2) NULL DEFAULT NULL,
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL,
  `id_tax` int(11) NULL DEFAULT NULL,
  `is_tax` tinyint(1) NULL DEFAULT NULL,
  `tax_amount` decimal(10, 2) NULL DEFAULT NULL,
  `sub_total` decimal(10, 2) NULL DEFAULT NULL,
  `total_amount` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for contract_customer_contact
-- ----------------------------
DROP TABLE IF EXISTS `contract_customer_contact`;
CREATE TABLE `contract_customer_contact`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_contract` int(11) NULL DEFAULT NULL,
  `id_customer_contact` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for contract_data
-- ----------------------------
DROP TABLE IF EXISTS `contract_data`;
CREATE TABLE `contract_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_contract` int(11) NULL DEFAULT NULL,
  `id_item` int(11) NULL DEFAULT NULL,
  `item_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `qty` int(11) NULL DEFAULT NULL,
  `rate` decimal(10, 2) NULL DEFAULT NULL,
  `other_charge` decimal(10, 2) NULL DEFAULT NULL,
  `discount_type` int(11) NULL DEFAULT NULL,
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of contract_data
-- ----------------------------
INSERT INTO `contract_data` VALUES (10, 3, 15, 'eO-BMS (Standard Package) ', 'A Business Management System is a set of tools for planning and implementing policies, practices, guidelines, processes and procedures that are used in the development, deployment and execution of business plans and strategies and all associated managemen', 1, 159.00, 250.00, 1, 0.00, 409.00);
INSERT INTO `contract_data` VALUES (13, 4, 10, 'Channel Manager 11-29 rooms ', '', 1, 70.00, 0.00, 2, 20.00, 50.00);
INSERT INTO `contract_data` VALUES (14, 4, 13, 'Template Website Unlimited rooms', '', 1, 35.00, 0.00, 1, 0.00, 35.00);
INSERT INTO `contract_data` VALUES (17, 5, 10, 'Channel Manager 11-29 rooms ', '', 1, 70.00, 0.00, 2, 20.00, 50.00);
INSERT INTO `contract_data` VALUES (19, 6, 18, 'Domain and Hosting', 'goldennicebuildingsiemreaphotel.com *	The above contract rates are in USD, nett, inclusive of 10% VAT.*	The rates are non-commissionable.*	The rate is per year.', 1, 70.00, 0.00, 2, 50.00, 20.00);
INSERT INTO `contract_data` VALUES (20, 1, 18, 'Domain and Hosting', '*	The above contract rates are in USD, nett, inclusive of 10% VAT.*	The rates are non-commissionable.*	The rate is per year.', 1, 70.00, 0.00, 1, 0.00, 70.00);
INSERT INTO `contract_data` VALUES (23, 7, 10, 'Channel Manager 11-29 rooms ', '', 1, 70.00, 0.00, 2, 10.00, 60.00);
INSERT INTO `contract_data` VALUES (25, 8, 10, 'Channel Manager 11-29 rooms ', '', 1, 70.00, 0.00, 2, 10.00, 60.00);
INSERT INTO `contract_data` VALUES (30, 2, 15, 'eO-BMS (Standard Package) ', 'A Business Management System is a set of tools for planning and implementing policies, practices, guidelines, processes and procedures that are used in the development, deployment and execution of business plans and strategies and all associated managemen', 1, 159.00, 250.00, 2, 0.00, 409.00);
INSERT INTO `contract_data` VALUES (36, 9, 17, 'Premium Website (Gold)', '-Maintenance 6 months-Website Speed 70 - 80', 1, 1500.00, 0.00, 1, 0.00, 1500.00);
INSERT INTO `contract_data` VALUES (44, 10, 20, 'Fresh Content Writing', '', 1, 1000.00, 0.00, 1, 10.00, 900.00);
INSERT INTO `contract_data` VALUES (45, 11, 20, 'Fresh Content Writing', '', 1, 1000.00, 0.00, 1, 10.00, 900.00);
INSERT INTO `contract_data` VALUES (46, 12, 17, 'Premium Website (Gold)', '-Maintenance 6 months-Website Speed 70 - 80', 1, 1500.00, 0.00, 1, 10.00, 1350.00);
INSERT INTO `contract_data` VALUES (47, 13, 21, 'eO-CSMA', '', 1, 159.00, 0.00, 1, 0.00, 159.00);
INSERT INTO `contract_data` VALUES (50, 14, 22, 'Photo Shooting', '', 1, 500.00, 0.00, 1, 0.00, 500.00);
INSERT INTO `contract_data` VALUES (51, 14, 23, 'Video Shooting', '', 1, 500.00, 0.00, 1, 0.00, 500.00);
INSERT INTO `contract_data` VALUES (52, 15, 1, 'Premium Website (Silver)', '-Maintenance  3 months-Website Speed 60 - 70', 1, 1000.00, 0.00, 1, 0.00, 1000.00);
INSERT INTO `contract_data` VALUES (53, 16, 18, 'Domain and Hosting', '*	The above contract rates are in USD, nett, inclusive of 10% VAT.*	The rates are non-commissionable.*	The rate is per year.', 1, 70.00, 0.00, 1, 0.00, 70.00);
INSERT INTO `contract_data` VALUES (54, 17, 20, 'Fresh Content Writing', '', 1, 1000.00, 0.00, 1, 0.00, 1000.00);
INSERT INTO `contract_data` VALUES (55, 18, 10, 'Channel Manager 11-29 rooms ', '', 1, 70.00, 0.00, 2, 20.00, 50.00);
INSERT INTO `contract_data` VALUES (56, 19, 3, 'Booking Engine 11-29 Rooms', '', 1, 50.00, 0.00, 2, 10.00, 40.00);
INSERT INTO `contract_data` VALUES (57, 20, 13, 'Template Website Unlimited rooms', '', 1, 35.00, 0.00, 1, 0.00, 35.00);
INSERT INTO `contract_data` VALUES (58, 21, 3, 'Booking Engine 11-29 Rooms', '', 1, 50.00, 0.00, 2, 10.00, 40.00);
INSERT INTO `contract_data` VALUES (59, 22, NULL, '', '', 1, 0.00, 0.00, 1, 0.00, 0.00);
INSERT INTO `contract_data` VALUES (60, 22, 7, 'Channel Manger 1-10 Rooms', '', 1, 60.00, 0.00, 1, 0.00, 60.00);
INSERT INTO `contract_data` VALUES (61, 22, 14, 'Front Desk Unlimited Rooms ', '', 1, 40.00, 0.00, 1, 0.00, 40.00);
INSERT INTO `contract_data` VALUES (62, 23, 1, 'Premium Website (Silver)', '-Maintenance  3 months-Website Speed 60 - 70', 1, 1000.00, 0.00, 1, 0.00, 1000.00);
INSERT INTO `contract_data` VALUES (63, 24, 14, 'Front Desk Unlimited Rooms ', '', 1, 40.00, 0.00, 2, 10.00, 30.00);
INSERT INTO `contract_data` VALUES (64, 25, 10, 'Channel Manager 11-29 rooms ', '', 1, 70.00, 0.00, 2, 25.00, 45.00);
INSERT INTO `contract_data` VALUES (65, 26, 17, 'Premium Website (Gold)', '-Maintenance 6 months-Website Speed 70 - 80', 1, 1500.00, 0.00, 1, 10.00, 1350.00);
INSERT INTO `contract_data` VALUES (66, 27, 20, 'Fresh Content Writing', '', 1, 1000.00, 0.00, 1, 10.00, 900.00);

-- ----------------------------
-- Table structure for contract_note
-- ----------------------------
DROP TABLE IF EXISTS `contract_note`;
CREATE TABLE `contract_note`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(11) NULL DEFAULT NULL,
  `id_contract` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for contract_type
-- ----------------------------
DROP TABLE IF EXISTS `contract_type`;
CREATE TABLE `contract_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `contract_description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `credit_arrangment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cancellation_agreement` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `confidentiality` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_area` int(11) NULL DEFAULT NULL,
  `names` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `img` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `video_link` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `latitude` double NULL DEFAULT NULL,
  `longitude` double NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `names`(`names`) USING BTREE,
  INDEX `id_area`(`id_area`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 267 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of country
-- ----------------------------
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

-- ----------------------------
-- Table structure for currency
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of currency
-- ----------------------------
INSERT INTO `currency` VALUES (1, 'USD $', 1);

-- ----------------------------
-- Table structure for customer_group
-- ----------------------------
DROP TABLE IF EXISTS `customer_group`;
CREATE TABLE `customer_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer_invoice
-- ----------------------------
DROP TABLE IF EXISTS `customer_invoice`;
CREATE TABLE `customer_invoice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `due_date` date NULL DEFAULT NULL,
  `id_customer` int(11) NULL DEFAULT NULL,
  `id_project` int(11) NULL DEFAULT NULL,
  `id_payment_method` int(11) NULL DEFAULT NULL,
  `total_tax` decimal(10, 2) NULL DEFAULT NULL,
  `id_recurring_invoice` int(11) NULL DEFAULT NULL,
  `recurring_value` int(11) NULL DEFAULT NULL,
  `recurring_type` int(11) NULL DEFAULT NULL,
  `admin_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_amount` decimal(10, 2) NULL DEFAULT NULL,
  `receive_amount` decimal(10, 2) NULL DEFAULT NULL,
  `balance_amount` decimal(10, 2) NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `term_condition` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `currency` int(11) NULL DEFAULT NULL,
  `id_sale_agent` int(11) NULL DEFAULT NULL,
  `client_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_discount` int(11) NULL DEFAULT NULL,
  `discount_value` decimal(10, 2) NULL DEFAULT NULL,
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL,
  `id_tax` int(11) NULL DEFAULT NULL,
  `is_tax` tinyint(1) NULL DEFAULT NULL,
  `tax_amount` decimal(10, 2) NULL DEFAULT NULL,
  `sub_total` decimal(10, 2) NULL DEFAULT NULL,
  `is_converted_from_proposal` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer_invoice_data
-- ----------------------------
DROP TABLE IF EXISTS `customer_invoice_data`;
CREATE TABLE `customer_invoice_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer_invoice` int(11) NULL DEFAULT NULL,
  `id_item` int(11) NULL DEFAULT NULL,
  `item_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `qty` int(11) NULL DEFAULT NULL,
  `rate` decimal(10, 2) NULL DEFAULT NULL,
  `discount_type` int(11) NULL DEFAULT NULL,
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer_invoice_tag
-- ----------------------------
DROP TABLE IF EXISTS `customer_invoice_tag`;
CREATE TABLE `customer_invoice_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer_invoice` int(11) NULL DEFAULT NULL,
  `id_tag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer_payment
-- ----------------------------
DROP TABLE IF EXISTS `customer_payment`;
CREATE TABLE `customer_payment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer_invoice` int(11) NULL DEFAULT NULL,
  `id_project` int(11) NULL DEFAULT NULL,
  `doc_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `receive_amount` decimal(10, 2) NULL DEFAULT NULL,
  `id_payment_method` int(11) NULL DEFAULT NULL,
  `cheque_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clearing_date` date NULL DEFAULT NULL,
  `chart_of_account` int(11) NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer_profile
-- ----------------------------
DROP TABLE IF EXISTS `customer_profile`;
CREATE TABLE `customer_profile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `latitute` decimal(16, 10) NULL DEFAULT NULL,
  `longitute` decimal(16, 10) NULL DEFAULT NULL,
  `address` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_country` int(11) NULL DEFAULT NULL,
  `id_city` int(11) NULL DEFAULT NULL,
  `group_names` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `billing_address` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_billing_city` int(11) NULL DEFAULT NULL,
  `id_billing_country` int(11) NULL DEFAULT NULL,
  `shipping_address` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_shipping_city` int(11) NULL DEFAULT NULL,
  `id_shipping_country` int(11) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `zip_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_status` int(1) NULL DEFAULT NULL,
  `website_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accommodation_type` int(11) NULL DEFAULT NULL,
  `star_rating` decimal(10, 2) NULL DEFAULT NULL,
  `number_of_rooms` int(11) NULL DEFAULT NULL,
  `sale_date` date NULL DEFAULT NULL,
  `accomodation_status` int(11) NULL DEFAULT NULL COMMENT '1=lived , 2 = Inprocesing , 0 = Deactived',
  `lived_date` date NULL DEFAULT NULL,
  `passed_by` int(11) NULL DEFAULT NULL,
  `handle_by` int(11) NULL DEFAULT NULL,
  `deactivated_at` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deactivated_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `deactivated_requested_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deactivated_requested_contact_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `deactivated_by` int(11) NULL DEFAULT NULL,
  `id_customer_type` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer_profile
-- ----------------------------
INSERT INTO `customer_profile` VALUES (1, 'Ms. Sachiko Kojima', 'N/A', 'N/A', '', 'sachikokojima@gmail.com', NULL, NULL, 'Svay Chek -Siem Reap', 56, 21, NULL, '', NULL, NULL, '', NULL, NULL, 1, 21, '2019-11-21 10:48:12', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for customer_profile_contact
-- ----------------------------
DROP TABLE IF EXISTS `customer_profile_contact`;
CREATE TABLE `customer_profile_contact`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer` int(11) NOT NULL,
  `contact_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer_profile_group
-- ----------------------------
DROP TABLE IF EXISTS `customer_profile_group`;
CREATE TABLE `customer_profile_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer_profile` int(11) NULL DEFAULT NULL,
  `id_customer_group` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer_profile_group
-- ----------------------------
INSERT INTO `customer_profile_group` VALUES (6, 304, 1);
INSERT INTO `customer_profile_group` VALUES (7, 304, 3);

-- ----------------------------
-- Table structure for customer_profile_note
-- ----------------------------
DROP TABLE IF EXISTS `customer_profile_note`;
CREATE TABLE `customer_profile_note`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(11) NULL DEFAULT NULL,
  `id_customer` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer_profile_solution
-- ----------------------------
DROP TABLE IF EXISTS `customer_profile_solution`;
CREATE TABLE `customer_profile_solution`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer` int(11) NULL DEFAULT NULL,
  `id_solution` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 783 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer_profile_solution
-- ----------------------------
INSERT INTO `customer_profile_solution` VALUES (5, 4, 1);
INSERT INTO `customer_profile_solution` VALUES (6, 4, 3);
INSERT INTO `customer_profile_solution` VALUES (7, 4, 6);
INSERT INTO `customer_profile_solution` VALUES (8, 4, 7);
INSERT INTO `customer_profile_solution` VALUES (9, 5, 1);
INSERT INTO `customer_profile_solution` VALUES (10, 5, 2);
INSERT INTO `customer_profile_solution` VALUES (11, 5, 6);
INSERT INTO `customer_profile_solution` VALUES (12, 5, 7);
INSERT INTO `customer_profile_solution` VALUES (13, 6, 1);
INSERT INTO `customer_profile_solution` VALUES (14, 6, 4);
INSERT INTO `customer_profile_solution` VALUES (15, 6, 6);
INSERT INTO `customer_profile_solution` VALUES (16, 7, 1);
INSERT INTO `customer_profile_solution` VALUES (17, 7, 4);
INSERT INTO `customer_profile_solution` VALUES (18, 7, 5);
INSERT INTO `customer_profile_solution` VALUES (19, 7, 6);
INSERT INTO `customer_profile_solution` VALUES (20, 8, 1);
INSERT INTO `customer_profile_solution` VALUES (21, 8, 3);
INSERT INTO `customer_profile_solution` VALUES (22, 8, 4);
INSERT INTO `customer_profile_solution` VALUES (23, 8, 6);
INSERT INTO `customer_profile_solution` VALUES (24, 8, 7);
INSERT INTO `customer_profile_solution` VALUES (25, 9, 1);
INSERT INTO `customer_profile_solution` VALUES (26, 9, 4);
INSERT INTO `customer_profile_solution` VALUES (27, 9, 6);
INSERT INTO `customer_profile_solution` VALUES (28, 9, 7);
INSERT INTO `customer_profile_solution` VALUES (29, 11, 3);
INSERT INTO `customer_profile_solution` VALUES (30, 11, 6);
INSERT INTO `customer_profile_solution` VALUES (31, 13, 1);
INSERT INTO `customer_profile_solution` VALUES (32, 13, 3);
INSERT INTO `customer_profile_solution` VALUES (33, 13, 6);
INSERT INTO `customer_profile_solution` VALUES (34, 13, 7);
INSERT INTO `customer_profile_solution` VALUES (35, 14, 1);
INSERT INTO `customer_profile_solution` VALUES (36, 14, 4);
INSERT INTO `customer_profile_solution` VALUES (37, 14, 6);
INSERT INTO `customer_profile_solution` VALUES (38, 15, 1);
INSERT INTO `customer_profile_solution` VALUES (39, 15, 4);
INSERT INTO `customer_profile_solution` VALUES (40, 15, 6);
INSERT INTO `customer_profile_solution` VALUES (41, 16, 1);
INSERT INTO `customer_profile_solution` VALUES (42, 16, 4);
INSERT INTO `customer_profile_solution` VALUES (43, 16, 6);
INSERT INTO `customer_profile_solution` VALUES (44, 16, 7);
INSERT INTO `customer_profile_solution` VALUES (45, 17, 1);
INSERT INTO `customer_profile_solution` VALUES (46, 17, 4);
INSERT INTO `customer_profile_solution` VALUES (47, 17, 6);
INSERT INTO `customer_profile_solution` VALUES (48, 18, 1);
INSERT INTO `customer_profile_solution` VALUES (49, 18, 4);
INSERT INTO `customer_profile_solution` VALUES (50, 18, 6);
INSERT INTO `customer_profile_solution` VALUES (51, 18, 7);
INSERT INTO `customer_profile_solution` VALUES (52, 19, 1);
INSERT INTO `customer_profile_solution` VALUES (53, 19, 4);
INSERT INTO `customer_profile_solution` VALUES (54, 19, 6);
INSERT INTO `customer_profile_solution` VALUES (55, 20, 1);
INSERT INTO `customer_profile_solution` VALUES (56, 20, 4);
INSERT INTO `customer_profile_solution` VALUES (57, 20, 6);
INSERT INTO `customer_profile_solution` VALUES (58, 20, 7);
INSERT INTO `customer_profile_solution` VALUES (59, 22, 1);
INSERT INTO `customer_profile_solution` VALUES (60, 22, 6);
INSERT INTO `customer_profile_solution` VALUES (61, 22, 7);
INSERT INTO `customer_profile_solution` VALUES (62, 23, 1);
INSERT INTO `customer_profile_solution` VALUES (63, 23, 4);
INSERT INTO `customer_profile_solution` VALUES (64, 23, 6);
INSERT INTO `customer_profile_solution` VALUES (65, 23, 7);
INSERT INTO `customer_profile_solution` VALUES (66, 25, 1);
INSERT INTO `customer_profile_solution` VALUES (67, 25, 3);
INSERT INTO `customer_profile_solution` VALUES (68, 25, 6);
INSERT INTO `customer_profile_solution` VALUES (69, 25, 7);
INSERT INTO `customer_profile_solution` VALUES (70, 26, 1);
INSERT INTO `customer_profile_solution` VALUES (71, 26, 4);
INSERT INTO `customer_profile_solution` VALUES (72, 26, 5);
INSERT INTO `customer_profile_solution` VALUES (73, 26, 6);
INSERT INTO `customer_profile_solution` VALUES (74, 26, 7);
INSERT INTO `customer_profile_solution` VALUES (75, 27, 1);
INSERT INTO `customer_profile_solution` VALUES (76, 27, 3);
INSERT INTO `customer_profile_solution` VALUES (77, 27, 6);
INSERT INTO `customer_profile_solution` VALUES (78, 28, 1);
INSERT INTO `customer_profile_solution` VALUES (79, 28, 3);
INSERT INTO `customer_profile_solution` VALUES (80, 28, 6);
INSERT INTO `customer_profile_solution` VALUES (81, 29, 1);
INSERT INTO `customer_profile_solution` VALUES (82, 29, 4);
INSERT INTO `customer_profile_solution` VALUES (83, 29, 6);
INSERT INTO `customer_profile_solution` VALUES (84, 30, 1);
INSERT INTO `customer_profile_solution` VALUES (85, 30, 2);
INSERT INTO `customer_profile_solution` VALUES (86, 30, 4);
INSERT INTO `customer_profile_solution` VALUES (87, 30, 6);
INSERT INTO `customer_profile_solution` VALUES (88, 30, 7);
INSERT INTO `customer_profile_solution` VALUES (89, 31, 1);
INSERT INTO `customer_profile_solution` VALUES (90, 31, 3);
INSERT INTO `customer_profile_solution` VALUES (91, 31, 6);
INSERT INTO `customer_profile_solution` VALUES (92, 31, 7);
INSERT INTO `customer_profile_solution` VALUES (93, 32, 1);
INSERT INTO `customer_profile_solution` VALUES (94, 32, 4);
INSERT INTO `customer_profile_solution` VALUES (95, 32, 5);
INSERT INTO `customer_profile_solution` VALUES (96, 32, 6);
INSERT INTO `customer_profile_solution` VALUES (97, 32, 7);
INSERT INTO `customer_profile_solution` VALUES (98, 33, 1);
INSERT INTO `customer_profile_solution` VALUES (99, 33, 6);
INSERT INTO `customer_profile_solution` VALUES (100, 33, 7);
INSERT INTO `customer_profile_solution` VALUES (101, 34, 1);
INSERT INTO `customer_profile_solution` VALUES (102, 34, 4);
INSERT INTO `customer_profile_solution` VALUES (103, 34, 5);
INSERT INTO `customer_profile_solution` VALUES (104, 34, 6);
INSERT INTO `customer_profile_solution` VALUES (105, 34, 7);
INSERT INTO `customer_profile_solution` VALUES (106, 36, 1);
INSERT INTO `customer_profile_solution` VALUES (107, 36, 4);
INSERT INTO `customer_profile_solution` VALUES (108, 36, 6);
INSERT INTO `customer_profile_solution` VALUES (109, 36, 7);
INSERT INTO `customer_profile_solution` VALUES (110, 37, 1);
INSERT INTO `customer_profile_solution` VALUES (111, 37, 3);
INSERT INTO `customer_profile_solution` VALUES (112, 37, 6);
INSERT INTO `customer_profile_solution` VALUES (113, 37, 7);
INSERT INTO `customer_profile_solution` VALUES (114, 38, 1);
INSERT INTO `customer_profile_solution` VALUES (115, 38, 3);
INSERT INTO `customer_profile_solution` VALUES (116, 38, 6);
INSERT INTO `customer_profile_solution` VALUES (117, 39, 1);
INSERT INTO `customer_profile_solution` VALUES (118, 39, 3);
INSERT INTO `customer_profile_solution` VALUES (119, 39, 6);
INSERT INTO `customer_profile_solution` VALUES (120, 40, 1);
INSERT INTO `customer_profile_solution` VALUES (121, 40, 4);
INSERT INTO `customer_profile_solution` VALUES (122, 40, 6);
INSERT INTO `customer_profile_solution` VALUES (123, 40, 7);
INSERT INTO `customer_profile_solution` VALUES (124, 41, 1);
INSERT INTO `customer_profile_solution` VALUES (125, 41, 3);
INSERT INTO `customer_profile_solution` VALUES (126, 41, 6);
INSERT INTO `customer_profile_solution` VALUES (127, 41, 7);
INSERT INTO `customer_profile_solution` VALUES (128, 42, 1);
INSERT INTO `customer_profile_solution` VALUES (129, 42, 3);
INSERT INTO `customer_profile_solution` VALUES (130, 42, 6);
INSERT INTO `customer_profile_solution` VALUES (131, 43, 1);
INSERT INTO `customer_profile_solution` VALUES (132, 43, 3);
INSERT INTO `customer_profile_solution` VALUES (133, 43, 6);
INSERT INTO `customer_profile_solution` VALUES (134, 43, 7);
INSERT INTO `customer_profile_solution` VALUES (135, 44, 1);
INSERT INTO `customer_profile_solution` VALUES (136, 44, 3);
INSERT INTO `customer_profile_solution` VALUES (137, 44, 6);
INSERT INTO `customer_profile_solution` VALUES (138, 45, 1);
INSERT INTO `customer_profile_solution` VALUES (139, 45, 2);
INSERT INTO `customer_profile_solution` VALUES (140, 45, 4);
INSERT INTO `customer_profile_solution` VALUES (141, 45, 6);
INSERT INTO `customer_profile_solution` VALUES (142, 45, 7);
INSERT INTO `customer_profile_solution` VALUES (143, 46, 1);
INSERT INTO `customer_profile_solution` VALUES (144, 46, 3);
INSERT INTO `customer_profile_solution` VALUES (145, 46, 6);
INSERT INTO `customer_profile_solution` VALUES (146, 47, 1);
INSERT INTO `customer_profile_solution` VALUES (147, 47, 3);
INSERT INTO `customer_profile_solution` VALUES (148, 47, 6);
INSERT INTO `customer_profile_solution` VALUES (149, 48, 1);
INSERT INTO `customer_profile_solution` VALUES (150, 48, 4);
INSERT INTO `customer_profile_solution` VALUES (151, 48, 6);
INSERT INTO `customer_profile_solution` VALUES (152, 48, 7);
INSERT INTO `customer_profile_solution` VALUES (153, 49, 1);
INSERT INTO `customer_profile_solution` VALUES (154, 49, 4);
INSERT INTO `customer_profile_solution` VALUES (155, 49, 6);
INSERT INTO `customer_profile_solution` VALUES (156, 50, 1);
INSERT INTO `customer_profile_solution` VALUES (157, 50, 4);
INSERT INTO `customer_profile_solution` VALUES (158, 50, 6);
INSERT INTO `customer_profile_solution` VALUES (159, 51, 1);
INSERT INTO `customer_profile_solution` VALUES (160, 51, 4);
INSERT INTO `customer_profile_solution` VALUES (161, 51, 6);
INSERT INTO `customer_profile_solution` VALUES (162, 51, 7);
INSERT INTO `customer_profile_solution` VALUES (163, 54, 1);
INSERT INTO `customer_profile_solution` VALUES (164, 54, 4);
INSERT INTO `customer_profile_solution` VALUES (165, 54, 6);
INSERT INTO `customer_profile_solution` VALUES (166, 54, 7);
INSERT INTO `customer_profile_solution` VALUES (167, 55, 1);
INSERT INTO `customer_profile_solution` VALUES (168, 55, 3);
INSERT INTO `customer_profile_solution` VALUES (169, 55, 6);
INSERT INTO `customer_profile_solution` VALUES (170, 56, 1);
INSERT INTO `customer_profile_solution` VALUES (171, 56, 4);
INSERT INTO `customer_profile_solution` VALUES (172, 56, 6);
INSERT INTO `customer_profile_solution` VALUES (173, 57, 1);
INSERT INTO `customer_profile_solution` VALUES (174, 57, 3);
INSERT INTO `customer_profile_solution` VALUES (175, 57, 6);
INSERT INTO `customer_profile_solution` VALUES (176, 57, 7);
INSERT INTO `customer_profile_solution` VALUES (177, 58, 1);
INSERT INTO `customer_profile_solution` VALUES (178, 58, 3);
INSERT INTO `customer_profile_solution` VALUES (179, 58, 6);
INSERT INTO `customer_profile_solution` VALUES (180, 59, 1);
INSERT INTO `customer_profile_solution` VALUES (181, 59, 5);
INSERT INTO `customer_profile_solution` VALUES (182, 59, 6);
INSERT INTO `customer_profile_solution` VALUES (183, 60, 1);
INSERT INTO `customer_profile_solution` VALUES (184, 60, 4);
INSERT INTO `customer_profile_solution` VALUES (185, 60, 6);
INSERT INTO `customer_profile_solution` VALUES (186, 60, 7);
INSERT INTO `customer_profile_solution` VALUES (187, 61, 1);
INSERT INTO `customer_profile_solution` VALUES (188, 61, 3);
INSERT INTO `customer_profile_solution` VALUES (189, 61, 6);
INSERT INTO `customer_profile_solution` VALUES (190, 61, 7);
INSERT INTO `customer_profile_solution` VALUES (191, 62, 1);
INSERT INTO `customer_profile_solution` VALUES (192, 62, 4);
INSERT INTO `customer_profile_solution` VALUES (193, 62, 5);
INSERT INTO `customer_profile_solution` VALUES (194, 62, 6);
INSERT INTO `customer_profile_solution` VALUES (195, 63, 1);
INSERT INTO `customer_profile_solution` VALUES (196, 63, 4);
INSERT INTO `customer_profile_solution` VALUES (197, 63, 6);
INSERT INTO `customer_profile_solution` VALUES (198, 63, 7);
INSERT INTO `customer_profile_solution` VALUES (199, 64, 1);
INSERT INTO `customer_profile_solution` VALUES (200, 64, 3);
INSERT INTO `customer_profile_solution` VALUES (201, 64, 6);
INSERT INTO `customer_profile_solution` VALUES (202, 66, 1);
INSERT INTO `customer_profile_solution` VALUES (203, 66, 3);
INSERT INTO `customer_profile_solution` VALUES (204, 66, 6);
INSERT INTO `customer_profile_solution` VALUES (205, 66, 7);
INSERT INTO `customer_profile_solution` VALUES (206, 72, 1);
INSERT INTO `customer_profile_solution` VALUES (207, 72, 4);
INSERT INTO `customer_profile_solution` VALUES (208, 72, 5);
INSERT INTO `customer_profile_solution` VALUES (209, 72, 6);
INSERT INTO `customer_profile_solution` VALUES (210, 74, 1);
INSERT INTO `customer_profile_solution` VALUES (211, 74, 3);
INSERT INTO `customer_profile_solution` VALUES (212, 74, 6);
INSERT INTO `customer_profile_solution` VALUES (213, 74, 7);
INSERT INTO `customer_profile_solution` VALUES (214, 81, 1);
INSERT INTO `customer_profile_solution` VALUES (215, 81, 4);
INSERT INTO `customer_profile_solution` VALUES (216, 81, 6);
INSERT INTO `customer_profile_solution` VALUES (217, 83, 1);
INSERT INTO `customer_profile_solution` VALUES (218, 83, 3);
INSERT INTO `customer_profile_solution` VALUES (219, 83, 6);
INSERT INTO `customer_profile_solution` VALUES (220, 96, 1);
INSERT INTO `customer_profile_solution` VALUES (221, 96, 4);
INSERT INTO `customer_profile_solution` VALUES (222, 96, 6);
INSERT INTO `customer_profile_solution` VALUES (223, 96, 7);
INSERT INTO `customer_profile_solution` VALUES (224, 100, 1);
INSERT INTO `customer_profile_solution` VALUES (225, 100, 6);
INSERT INTO `customer_profile_solution` VALUES (226, 100, 7);
INSERT INTO `customer_profile_solution` VALUES (227, 101, 1);
INSERT INTO `customer_profile_solution` VALUES (228, 101, 4);
INSERT INTO `customer_profile_solution` VALUES (229, 101, 6);
INSERT INTO `customer_profile_solution` VALUES (230, 102, 1);
INSERT INTO `customer_profile_solution` VALUES (231, 102, 2);
INSERT INTO `customer_profile_solution` VALUES (232, 102, 3);
INSERT INTO `customer_profile_solution` VALUES (233, 102, 6);
INSERT INTO `customer_profile_solution` VALUES (234, 102, 7);
INSERT INTO `customer_profile_solution` VALUES (235, 103, 1);
INSERT INTO `customer_profile_solution` VALUES (236, 103, 4);
INSERT INTO `customer_profile_solution` VALUES (237, 103, 5);
INSERT INTO `customer_profile_solution` VALUES (238, 103, 6);
INSERT INTO `customer_profile_solution` VALUES (239, 105, 1);
INSERT INTO `customer_profile_solution` VALUES (240, 105, 4);
INSERT INTO `customer_profile_solution` VALUES (241, 105, 6);
INSERT INTO `customer_profile_solution` VALUES (242, 106, 1);
INSERT INTO `customer_profile_solution` VALUES (243, 106, 4);
INSERT INTO `customer_profile_solution` VALUES (244, 106, 6);
INSERT INTO `customer_profile_solution` VALUES (245, 106, 7);
INSERT INTO `customer_profile_solution` VALUES (246, 107, 1);
INSERT INTO `customer_profile_solution` VALUES (247, 107, 4);
INSERT INTO `customer_profile_solution` VALUES (248, 107, 6);
INSERT INTO `customer_profile_solution` VALUES (249, 107, 7);
INSERT INTO `customer_profile_solution` VALUES (250, 109, 1);
INSERT INTO `customer_profile_solution` VALUES (251, 109, 4);
INSERT INTO `customer_profile_solution` VALUES (252, 109, 6);
INSERT INTO `customer_profile_solution` VALUES (253, 109, 7);
INSERT INTO `customer_profile_solution` VALUES (254, 111, 1);
INSERT INTO `customer_profile_solution` VALUES (255, 111, 2);
INSERT INTO `customer_profile_solution` VALUES (256, 111, 4);
INSERT INTO `customer_profile_solution` VALUES (257, 111, 6);
INSERT INTO `customer_profile_solution` VALUES (258, 111, 7);
INSERT INTO `customer_profile_solution` VALUES (259, 112, 1);
INSERT INTO `customer_profile_solution` VALUES (260, 112, 2);
INSERT INTO `customer_profile_solution` VALUES (261, 112, 4);
INSERT INTO `customer_profile_solution` VALUES (262, 112, 6);
INSERT INTO `customer_profile_solution` VALUES (263, 112, 7);
INSERT INTO `customer_profile_solution` VALUES (264, 113, 1);
INSERT INTO `customer_profile_solution` VALUES (265, 113, 4);
INSERT INTO `customer_profile_solution` VALUES (266, 113, 6);
INSERT INTO `customer_profile_solution` VALUES (267, 113, 7);
INSERT INTO `customer_profile_solution` VALUES (268, 114, 1);
INSERT INTO `customer_profile_solution` VALUES (269, 114, 4);
INSERT INTO `customer_profile_solution` VALUES (270, 114, 6);
INSERT INTO `customer_profile_solution` VALUES (271, 114, 7);
INSERT INTO `customer_profile_solution` VALUES (272, 124, 1);
INSERT INTO `customer_profile_solution` VALUES (273, 124, 4);
INSERT INTO `customer_profile_solution` VALUES (274, 124, 6);
INSERT INTO `customer_profile_solution` VALUES (275, 124, 7);
INSERT INTO `customer_profile_solution` VALUES (276, 125, 1);
INSERT INTO `customer_profile_solution` VALUES (277, 125, 4);
INSERT INTO `customer_profile_solution` VALUES (278, 125, 6);
INSERT INTO `customer_profile_solution` VALUES (279, 125, 7);
INSERT INTO `customer_profile_solution` VALUES (280, 126, 1);
INSERT INTO `customer_profile_solution` VALUES (281, 126, 2);
INSERT INTO `customer_profile_solution` VALUES (282, 126, 4);
INSERT INTO `customer_profile_solution` VALUES (283, 126, 6);
INSERT INTO `customer_profile_solution` VALUES (284, 126, 7);
INSERT INTO `customer_profile_solution` VALUES (285, 127, 1);
INSERT INTO `customer_profile_solution` VALUES (286, 127, 4);
INSERT INTO `customer_profile_solution` VALUES (287, 127, 6);
INSERT INTO `customer_profile_solution` VALUES (288, 127, 7);
INSERT INTO `customer_profile_solution` VALUES (289, 131, 1);
INSERT INTO `customer_profile_solution` VALUES (290, 131, 2);
INSERT INTO `customer_profile_solution` VALUES (291, 131, 3);
INSERT INTO `customer_profile_solution` VALUES (292, 131, 6);
INSERT INTO `customer_profile_solution` VALUES (293, 131, 7);
INSERT INTO `customer_profile_solution` VALUES (294, 132, 1);
INSERT INTO `customer_profile_solution` VALUES (295, 132, 2);
INSERT INTO `customer_profile_solution` VALUES (296, 132, 4);
INSERT INTO `customer_profile_solution` VALUES (297, 132, 6);
INSERT INTO `customer_profile_solution` VALUES (298, 132, 7);
INSERT INTO `customer_profile_solution` VALUES (299, 136, 1);
INSERT INTO `customer_profile_solution` VALUES (300, 136, 2);
INSERT INTO `customer_profile_solution` VALUES (301, 136, 4);
INSERT INTO `customer_profile_solution` VALUES (302, 136, 6);
INSERT INTO `customer_profile_solution` VALUES (303, 136, 7);
INSERT INTO `customer_profile_solution` VALUES (304, 139, 1);
INSERT INTO `customer_profile_solution` VALUES (305, 139, 6);
INSERT INTO `customer_profile_solution` VALUES (306, 139, 7);
INSERT INTO `customer_profile_solution` VALUES (307, 141, 1);
INSERT INTO `customer_profile_solution` VALUES (308, 141, 4);
INSERT INTO `customer_profile_solution` VALUES (309, 141, 6);
INSERT INTO `customer_profile_solution` VALUES (310, 141, 7);
INSERT INTO `customer_profile_solution` VALUES (311, 142, 1);
INSERT INTO `customer_profile_solution` VALUES (312, 142, 3);
INSERT INTO `customer_profile_solution` VALUES (313, 142, 6);
INSERT INTO `customer_profile_solution` VALUES (314, 142, 7);
INSERT INTO `customer_profile_solution` VALUES (315, 151, 1);
INSERT INTO `customer_profile_solution` VALUES (316, 151, 3);
INSERT INTO `customer_profile_solution` VALUES (317, 151, 6);
INSERT INTO `customer_profile_solution` VALUES (318, 151, 7);
INSERT INTO `customer_profile_solution` VALUES (319, 154, 1);
INSERT INTO `customer_profile_solution` VALUES (320, 154, 2);
INSERT INTO `customer_profile_solution` VALUES (321, 154, 4);
INSERT INTO `customer_profile_solution` VALUES (322, 154, 6);
INSERT INTO `customer_profile_solution` VALUES (323, 154, 7);
INSERT INTO `customer_profile_solution` VALUES (324, 157, 1);
INSERT INTO `customer_profile_solution` VALUES (325, 157, 3);
INSERT INTO `customer_profile_solution` VALUES (326, 157, 6);
INSERT INTO `customer_profile_solution` VALUES (327, 157, 7);
INSERT INTO `customer_profile_solution` VALUES (328, 158, 1);
INSERT INTO `customer_profile_solution` VALUES (329, 158, 4);
INSERT INTO `customer_profile_solution` VALUES (330, 158, 6);
INSERT INTO `customer_profile_solution` VALUES (331, 158, 7);
INSERT INTO `customer_profile_solution` VALUES (332, 160, 1);
INSERT INTO `customer_profile_solution` VALUES (333, 160, 2);
INSERT INTO `customer_profile_solution` VALUES (334, 160, 6);
INSERT INTO `customer_profile_solution` VALUES (335, 160, 7);
INSERT INTO `customer_profile_solution` VALUES (336, 165, 1);
INSERT INTO `customer_profile_solution` VALUES (337, 165, 4);
INSERT INTO `customer_profile_solution` VALUES (338, 165, 6);
INSERT INTO `customer_profile_solution` VALUES (339, 166, 1);
INSERT INTO `customer_profile_solution` VALUES (340, 166, 4);
INSERT INTO `customer_profile_solution` VALUES (341, 166, 6);
INSERT INTO `customer_profile_solution` VALUES (342, 169, 1);
INSERT INTO `customer_profile_solution` VALUES (343, 169, 6);
INSERT INTO `customer_profile_solution` VALUES (344, 169, 7);
INSERT INTO `customer_profile_solution` VALUES (345, 170, 1);
INSERT INTO `customer_profile_solution` VALUES (346, 170, 2);
INSERT INTO `customer_profile_solution` VALUES (347, 170, 4);
INSERT INTO `customer_profile_solution` VALUES (348, 170, 6);
INSERT INTO `customer_profile_solution` VALUES (349, 170, 7);
INSERT INTO `customer_profile_solution` VALUES (350, 177, 1);
INSERT INTO `customer_profile_solution` VALUES (351, 177, 4);
INSERT INTO `customer_profile_solution` VALUES (352, 177, 6);
INSERT INTO `customer_profile_solution` VALUES (353, 177, 7);
INSERT INTO `customer_profile_solution` VALUES (354, 178, 1);
INSERT INTO `customer_profile_solution` VALUES (355, 178, 2);
INSERT INTO `customer_profile_solution` VALUES (356, 178, 6);
INSERT INTO `customer_profile_solution` VALUES (357, 179, 1);
INSERT INTO `customer_profile_solution` VALUES (358, 179, 2);
INSERT INTO `customer_profile_solution` VALUES (359, 179, 3);
INSERT INTO `customer_profile_solution` VALUES (360, 179, 6);
INSERT INTO `customer_profile_solution` VALUES (361, 179, 7);
INSERT INTO `customer_profile_solution` VALUES (362, 180, 1);
INSERT INTO `customer_profile_solution` VALUES (363, 180, 2);
INSERT INTO `customer_profile_solution` VALUES (364, 180, 6);
INSERT INTO `customer_profile_solution` VALUES (365, 183, 1);
INSERT INTO `customer_profile_solution` VALUES (366, 183, 4);
INSERT INTO `customer_profile_solution` VALUES (367, 183, 6);
INSERT INTO `customer_profile_solution` VALUES (368, 183, 7);
INSERT INTO `customer_profile_solution` VALUES (369, 188, 1);
INSERT INTO `customer_profile_solution` VALUES (370, 188, 4);
INSERT INTO `customer_profile_solution` VALUES (371, 188, 6);
INSERT INTO `customer_profile_solution` VALUES (372, 188, 7);
INSERT INTO `customer_profile_solution` VALUES (373, 189, 1);
INSERT INTO `customer_profile_solution` VALUES (374, 189, 4);
INSERT INTO `customer_profile_solution` VALUES (375, 189, 6);
INSERT INTO `customer_profile_solution` VALUES (376, 189, 7);
INSERT INTO `customer_profile_solution` VALUES (377, 192, 1);
INSERT INTO `customer_profile_solution` VALUES (378, 192, 4);
INSERT INTO `customer_profile_solution` VALUES (379, 192, 6);
INSERT INTO `customer_profile_solution` VALUES (380, 193, 1);
INSERT INTO `customer_profile_solution` VALUES (381, 193, 4);
INSERT INTO `customer_profile_solution` VALUES (382, 193, 6);
INSERT INTO `customer_profile_solution` VALUES (383, 193, 7);
INSERT INTO `customer_profile_solution` VALUES (384, 194, 1);
INSERT INTO `customer_profile_solution` VALUES (385, 194, 2);
INSERT INTO `customer_profile_solution` VALUES (386, 194, 4);
INSERT INTO `customer_profile_solution` VALUES (387, 194, 6);
INSERT INTO `customer_profile_solution` VALUES (388, 194, 7);
INSERT INTO `customer_profile_solution` VALUES (389, 197, 1);
INSERT INTO `customer_profile_solution` VALUES (390, 197, 4);
INSERT INTO `customer_profile_solution` VALUES (391, 197, 6);
INSERT INTO `customer_profile_solution` VALUES (392, 198, 1);
INSERT INTO `customer_profile_solution` VALUES (393, 198, 3);
INSERT INTO `customer_profile_solution` VALUES (394, 198, 6);
INSERT INTO `customer_profile_solution` VALUES (395, 198, 7);
INSERT INTO `customer_profile_solution` VALUES (396, 199, 1);
INSERT INTO `customer_profile_solution` VALUES (397, 199, 4);
INSERT INTO `customer_profile_solution` VALUES (398, 199, 6);
INSERT INTO `customer_profile_solution` VALUES (399, 206, 1);
INSERT INTO `customer_profile_solution` VALUES (400, 206, 4);
INSERT INTO `customer_profile_solution` VALUES (401, 206, 6);
INSERT INTO `customer_profile_solution` VALUES (402, 206, 7);
INSERT INTO `customer_profile_solution` VALUES (403, 212, 1);
INSERT INTO `customer_profile_solution` VALUES (404, 212, 2);
INSERT INTO `customer_profile_solution` VALUES (405, 212, 3);
INSERT INTO `customer_profile_solution` VALUES (406, 212, 6);
INSERT INTO `customer_profile_solution` VALUES (407, 214, 1);
INSERT INTO `customer_profile_solution` VALUES (408, 214, 3);
INSERT INTO `customer_profile_solution` VALUES (409, 214, 6);
INSERT INTO `customer_profile_solution` VALUES (410, 217, 1);
INSERT INTO `customer_profile_solution` VALUES (411, 217, 4);
INSERT INTO `customer_profile_solution` VALUES (412, 217, 6);
INSERT INTO `customer_profile_solution` VALUES (413, 217, 7);
INSERT INTO `customer_profile_solution` VALUES (414, 218, 1);
INSERT INTO `customer_profile_solution` VALUES (415, 218, 3);
INSERT INTO `customer_profile_solution` VALUES (416, 218, 6);
INSERT INTO `customer_profile_solution` VALUES (417, 218, 7);
INSERT INTO `customer_profile_solution` VALUES (418, 219, 1);
INSERT INTO `customer_profile_solution` VALUES (419, 219, 4);
INSERT INTO `customer_profile_solution` VALUES (420, 219, 6);
INSERT INTO `customer_profile_solution` VALUES (421, 223, 1);
INSERT INTO `customer_profile_solution` VALUES (422, 223, 4);
INSERT INTO `customer_profile_solution` VALUES (423, 223, 5);
INSERT INTO `customer_profile_solution` VALUES (424, 223, 6);
INSERT INTO `customer_profile_solution` VALUES (425, 226, 1);
INSERT INTO `customer_profile_solution` VALUES (426, 226, 3);
INSERT INTO `customer_profile_solution` VALUES (427, 226, 6);
INSERT INTO `customer_profile_solution` VALUES (428, 226, 7);
INSERT INTO `customer_profile_solution` VALUES (429, 227, 1);
INSERT INTO `customer_profile_solution` VALUES (430, 227, 4);
INSERT INTO `customer_profile_solution` VALUES (431, 227, 6);
INSERT INTO `customer_profile_solution` VALUES (432, 229, 1);
INSERT INTO `customer_profile_solution` VALUES (433, 229, 3);
INSERT INTO `customer_profile_solution` VALUES (434, 229, 6);
INSERT INTO `customer_profile_solution` VALUES (435, 229, 7);
INSERT INTO `customer_profile_solution` VALUES (436, 230, 1);
INSERT INTO `customer_profile_solution` VALUES (437, 230, 4);
INSERT INTO `customer_profile_solution` VALUES (438, 230, 6);
INSERT INTO `customer_profile_solution` VALUES (439, 230, 7);
INSERT INTO `customer_profile_solution` VALUES (440, 231, 1);
INSERT INTO `customer_profile_solution` VALUES (441, 231, 3);
INSERT INTO `customer_profile_solution` VALUES (442, 231, 6);
INSERT INTO `customer_profile_solution` VALUES (443, 231, 7);
INSERT INTO `customer_profile_solution` VALUES (444, 234, 1);
INSERT INTO `customer_profile_solution` VALUES (445, 234, 6);
INSERT INTO `customer_profile_solution` VALUES (446, 234, 7);
INSERT INTO `customer_profile_solution` VALUES (447, 236, 1);
INSERT INTO `customer_profile_solution` VALUES (448, 236, 3);
INSERT INTO `customer_profile_solution` VALUES (449, 236, 6);
INSERT INTO `customer_profile_solution` VALUES (450, 236, 7);
INSERT INTO `customer_profile_solution` VALUES (451, 237, 1);
INSERT INTO `customer_profile_solution` VALUES (452, 237, 6);
INSERT INTO `customer_profile_solution` VALUES (453, 237, 7);
INSERT INTO `customer_profile_solution` VALUES (454, 241, 1);
INSERT INTO `customer_profile_solution` VALUES (455, 241, 3);
INSERT INTO `customer_profile_solution` VALUES (456, 241, 6);
INSERT INTO `customer_profile_solution` VALUES (457, 241, 7);
INSERT INTO `customer_profile_solution` VALUES (458, 242, 1);
INSERT INTO `customer_profile_solution` VALUES (459, 242, 2);
INSERT INTO `customer_profile_solution` VALUES (460, 242, 4);
INSERT INTO `customer_profile_solution` VALUES (461, 242, 6);
INSERT INTO `customer_profile_solution` VALUES (462, 242, 7);
INSERT INTO `customer_profile_solution` VALUES (463, 245, 1);
INSERT INTO `customer_profile_solution` VALUES (464, 245, 4);
INSERT INTO `customer_profile_solution` VALUES (465, 245, 6);
INSERT INTO `customer_profile_solution` VALUES (466, 246, 1);
INSERT INTO `customer_profile_solution` VALUES (467, 246, 6);
INSERT INTO `customer_profile_solution` VALUES (468, 246, 7);
INSERT INTO `customer_profile_solution` VALUES (469, 248, 1);
INSERT INTO `customer_profile_solution` VALUES (470, 248, 3);
INSERT INTO `customer_profile_solution` VALUES (471, 248, 6);
INSERT INTO `customer_profile_solution` VALUES (472, 248, 7);
INSERT INTO `customer_profile_solution` VALUES (473, 250, 1);
INSERT INTO `customer_profile_solution` VALUES (474, 250, 4);
INSERT INTO `customer_profile_solution` VALUES (475, 250, 6);
INSERT INTO `customer_profile_solution` VALUES (476, 250, 7);
INSERT INTO `customer_profile_solution` VALUES (477, 251, 7);
INSERT INTO `customer_profile_solution` VALUES (478, 252, 1);
INSERT INTO `customer_profile_solution` VALUES (479, 252, 2);
INSERT INTO `customer_profile_solution` VALUES (480, 252, 4);
INSERT INTO `customer_profile_solution` VALUES (481, 252, 6);
INSERT INTO `customer_profile_solution` VALUES (482, 252, 7);
INSERT INTO `customer_profile_solution` VALUES (483, 255, 1);
INSERT INTO `customer_profile_solution` VALUES (484, 255, 4);
INSERT INTO `customer_profile_solution` VALUES (485, 255, 6);
INSERT INTO `customer_profile_solution` VALUES (486, 256, 1);
INSERT INTO `customer_profile_solution` VALUES (487, 256, 4);
INSERT INTO `customer_profile_solution` VALUES (488, 256, 6);
INSERT INTO `customer_profile_solution` VALUES (489, 256, 7);
INSERT INTO `customer_profile_solution` VALUES (490, 257, 1);
INSERT INTO `customer_profile_solution` VALUES (491, 257, 4);
INSERT INTO `customer_profile_solution` VALUES (492, 257, 6);
INSERT INTO `customer_profile_solution` VALUES (493, 259, 1);
INSERT INTO `customer_profile_solution` VALUES (494, 259, 4);
INSERT INTO `customer_profile_solution` VALUES (495, 259, 6);
INSERT INTO `customer_profile_solution` VALUES (496, 259, 7);
INSERT INTO `customer_profile_solution` VALUES (497, 260, 1);
INSERT INTO `customer_profile_solution` VALUES (498, 260, 4);
INSERT INTO `customer_profile_solution` VALUES (499, 260, 6);
INSERT INTO `customer_profile_solution` VALUES (500, 260, 7);
INSERT INTO `customer_profile_solution` VALUES (501, 261, 1);
INSERT INTO `customer_profile_solution` VALUES (502, 261, 2);
INSERT INTO `customer_profile_solution` VALUES (503, 261, 6);
INSERT INTO `customer_profile_solution` VALUES (504, 261, 7);
INSERT INTO `customer_profile_solution` VALUES (505, 262, 1);
INSERT INTO `customer_profile_solution` VALUES (506, 262, 3);
INSERT INTO `customer_profile_solution` VALUES (507, 262, 6);
INSERT INTO `customer_profile_solution` VALUES (508, 262, 7);
INSERT INTO `customer_profile_solution` VALUES (509, 263, 1);
INSERT INTO `customer_profile_solution` VALUES (510, 263, 2);
INSERT INTO `customer_profile_solution` VALUES (511, 263, 4);
INSERT INTO `customer_profile_solution` VALUES (512, 263, 6);
INSERT INTO `customer_profile_solution` VALUES (513, 263, 7);
INSERT INTO `customer_profile_solution` VALUES (514, 264, 1);
INSERT INTO `customer_profile_solution` VALUES (515, 264, 2);
INSERT INTO `customer_profile_solution` VALUES (516, 264, 3);
INSERT INTO `customer_profile_solution` VALUES (517, 264, 6);
INSERT INTO `customer_profile_solution` VALUES (518, 264, 7);
INSERT INTO `customer_profile_solution` VALUES (519, 265, 1);
INSERT INTO `customer_profile_solution` VALUES (520, 265, 4);
INSERT INTO `customer_profile_solution` VALUES (521, 265, 6);
INSERT INTO `customer_profile_solution` VALUES (522, 265, 7);
INSERT INTO `customer_profile_solution` VALUES (523, 266, 1);
INSERT INTO `customer_profile_solution` VALUES (524, 266, 2);
INSERT INTO `customer_profile_solution` VALUES (525, 266, 3);
INSERT INTO `customer_profile_solution` VALUES (526, 266, 6);
INSERT INTO `customer_profile_solution` VALUES (527, 266, 7);
INSERT INTO `customer_profile_solution` VALUES (528, 267, 1);
INSERT INTO `customer_profile_solution` VALUES (529, 267, 6);
INSERT INTO `customer_profile_solution` VALUES (530, 267, 7);
INSERT INTO `customer_profile_solution` VALUES (531, 268, 1);
INSERT INTO `customer_profile_solution` VALUES (532, 268, 4);
INSERT INTO `customer_profile_solution` VALUES (533, 268, 6);
INSERT INTO `customer_profile_solution` VALUES (534, 269, 1);
INSERT INTO `customer_profile_solution` VALUES (535, 269, 2);
INSERT INTO `customer_profile_solution` VALUES (536, 269, 4);
INSERT INTO `customer_profile_solution` VALUES (537, 269, 6);
INSERT INTO `customer_profile_solution` VALUES (538, 269, 7);
INSERT INTO `customer_profile_solution` VALUES (539, 270, 1);
INSERT INTO `customer_profile_solution` VALUES (540, 270, 2);
INSERT INTO `customer_profile_solution` VALUES (541, 270, 3);
INSERT INTO `customer_profile_solution` VALUES (542, 270, 6);
INSERT INTO `customer_profile_solution` VALUES (543, 270, 7);
INSERT INTO `customer_profile_solution` VALUES (544, 271, 1);
INSERT INTO `customer_profile_solution` VALUES (545, 271, 4);
INSERT INTO `customer_profile_solution` VALUES (546, 271, 6);
INSERT INTO `customer_profile_solution` VALUES (547, 271, 7);
INSERT INTO `customer_profile_solution` VALUES (548, 274, 1);
INSERT INTO `customer_profile_solution` VALUES (549, 274, 2);
INSERT INTO `customer_profile_solution` VALUES (550, 274, 4);
INSERT INTO `customer_profile_solution` VALUES (551, 274, 7);
INSERT INTO `customer_profile_solution` VALUES (552, 275, 1);
INSERT INTO `customer_profile_solution` VALUES (553, 275, 3);
INSERT INTO `customer_profile_solution` VALUES (554, 275, 6);
INSERT INTO `customer_profile_solution` VALUES (555, 275, 7);
INSERT INTO `customer_profile_solution` VALUES (556, 277, 1);
INSERT INTO `customer_profile_solution` VALUES (557, 277, 2);
INSERT INTO `customer_profile_solution` VALUES (558, 277, 4);
INSERT INTO `customer_profile_solution` VALUES (559, 277, 6);
INSERT INTO `customer_profile_solution` VALUES (560, 277, 7);
INSERT INTO `customer_profile_solution` VALUES (561, 278, 1);
INSERT INTO `customer_profile_solution` VALUES (562, 278, 4);
INSERT INTO `customer_profile_solution` VALUES (563, 278, 6);
INSERT INTO `customer_profile_solution` VALUES (564, 278, 7);
INSERT INTO `customer_profile_solution` VALUES (565, 279, 1);
INSERT INTO `customer_profile_solution` VALUES (566, 279, 2);
INSERT INTO `customer_profile_solution` VALUES (567, 279, 4);
INSERT INTO `customer_profile_solution` VALUES (568, 279, 6);
INSERT INTO `customer_profile_solution` VALUES (569, 279, 7);
INSERT INTO `customer_profile_solution` VALUES (733, 1, 1);
INSERT INTO `customer_profile_solution` VALUES (734, 1, 2);
INSERT INTO `customer_profile_solution` VALUES (735, 1, 3);
INSERT INTO `customer_profile_solution` VALUES (736, 1, 4);
INSERT INTO `customer_profile_solution` VALUES (737, 1, 6);
INSERT INTO `customer_profile_solution` VALUES (738, 1, 7);
INSERT INTO `customer_profile_solution` VALUES (742, 2, 1);
INSERT INTO `customer_profile_solution` VALUES (743, 2, 2);
INSERT INTO `customer_profile_solution` VALUES (744, 2, 8);
INSERT INTO `customer_profile_solution` VALUES (761, 290, 3);
INSERT INTO `customer_profile_solution` VALUES (774, 292, 1);
INSERT INTO `customer_profile_solution` VALUES (775, 292, 6);
INSERT INTO `customer_profile_solution` VALUES (776, 292, 7);
INSERT INTO `customer_profile_solution` VALUES (777, 294, 1);
INSERT INTO `customer_profile_solution` VALUES (778, 294, 2);
INSERT INTO `customer_profile_solution` VALUES (779, 294, 3);
INSERT INTO `customer_profile_solution` VALUES (780, 294, 4);
INSERT INTO `customer_profile_solution` VALUES (781, 294, 6);
INSERT INTO `customer_profile_solution` VALUES (782, 294, 7);

-- ----------------------------
-- Table structure for customer_profile_status
-- ----------------------------
DROP TABLE IF EXISTS `customer_profile_status`;
CREATE TABLE `customer_profile_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer_profile_status
-- ----------------------------
INSERT INTO `customer_profile_status` VALUES (1, 'New', NULL, NULL, NULL, NULL, 1);
INSERT INTO `customer_profile_status` VALUES (2, 'Contacted', NULL, NULL, NULL, NULL, 1);
INSERT INTO `customer_profile_status` VALUES (3, 'Qualified', NULL, NULL, NULL, NULL, 1);
INSERT INTO `customer_profile_status` VALUES (4, 'Working', NULL, NULL, NULL, NULL, 1);
INSERT INTO `customer_profile_status` VALUES (5, 'Proposal Sent', NULL, NULL, NULL, NULL, 1);
INSERT INTO `customer_profile_status` VALUES (6, 'Customer', NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for customer_solution_status
-- ----------------------------
DROP TABLE IF EXISTS `customer_solution_status`;
CREATE TABLE `customer_solution_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_by` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer_solution_status
-- ----------------------------
INSERT INTO `customer_solution_status` VALUES (1, 'Inprocessing', 2);
INSERT INTO `customer_solution_status` VALUES (2, 'Lived', 3);
INSERT INTO `customer_solution_status` VALUES (3, 'Terminated', 4);
INSERT INTO `customer_solution_status` VALUES (4, 'New Sale', 1);

-- ----------------------------
-- Table structure for customer_type
-- ----------------------------
DROP TABLE IF EXISTS `customer_type`;
CREATE TABLE `customer_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `status` int(1) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_option_phone_number_country_code
-- ----------------------------
DROP TABLE IF EXISTS `data_option_phone_number_country_code`;
CREATE TABLE `data_option_phone_number_country_code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `names` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 231 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of data_option_phone_number_country_code
-- ----------------------------
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

-- ----------------------------
-- Table structure for data_option_prefix
-- ----------------------------
DROP TABLE IF EXISTS `data_option_prefix`;
CREATE TABLE `data_option_prefix`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of data_option_prefix
-- ----------------------------
INSERT INTO `data_option_prefix` VALUES (1, 'Mr.', 1, '2017-12-11 15:34:00', 1, 1, '2017-12-13 17:15:11');
INSERT INTO `data_option_prefix` VALUES (2, 'Ms.', 1, '2017-12-11 15:34:08', 1, 1, '2017-12-13 17:15:11');
INSERT INTO `data_option_prefix` VALUES (3, 'Mrs.', 1, '2017-12-11 15:34:05', 1, 1, '2017-12-13 17:15:11');
INSERT INTO `data_option_prefix` VALUES (4, 'Dr.', 1, '2017-12-11 15:34:03', 1, 1, '2017-12-13 17:15:11');
INSERT INTO `data_option_prefix` VALUES (5, 'Prof.', 1, '2017-12-13 17:14:59', 1, 1, '2017-12-13 17:15:11');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, 'Management', '+855 92 909 985', 'info@construction.com', 'Top management department', '2019-11-23 08:45:59', 21, NULL, NULL, 1);
INSERT INTO `department` VALUES (2, 'Workers', '+855 92 909 985', 'info@construction.com', 'the workers department', '2019-11-23 08:46:45', 21, NULL, NULL, 1);

-- ----------------------------
-- Table structure for document
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file_size` float NULL DEFAULT 0,
  `id_folder` int(11) NULL DEFAULT 0,
  `id_membership_profile` int(11) NULL DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime(0) NOT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT 1,
  `document_permission` int(1) NULL DEFAULT NULL,
  `id_event_list` int(11) NULL DEFAULT NULL,
  `id_employee_profile` int(11) NULL DEFAULT NULL,
  `id_customer_profile` int(11) NULL DEFAULT NULL,
  `id_project` int(11) NULL DEFAULT NULL,
  `id_contract` int(11) NULL DEFAULT NULL,
  `id_lead_profile` int(11) NULL DEFAULT NULL,
  `id_standard_operation_procedure_set_up` int(11) NULL DEFAULT NULL,
  `file_extention` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of document
-- ----------------------------
INSERT INTO `document` VALUES (2, 'sop-web-developer.pdf', 146827, 3, NULL, 'uploads/employee-profile/3/sop-web-developer-15680314075d7642af346fb864752720.pdf', 'thumbs/icon-pdf.png', NULL, 23, '2019-09-09 19:16:47', NULL, NULL, 1, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `document` VALUES (4, 'photo_2019-09-16_12-43-58.jpg', 113945, 8, NULL, 'uploads/project/8/photo_2019-09-16_12-43-58-15686851765d803c78ccaea759446169.jpg', 'uploads/thumb/project/8/photo_2019-09-16_12-43-58-15686851765d803c78ccaea759446169.jpg', NULL, 16, '2019-09-17 08:52:56', NULL, NULL, 1, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, 0);
INSERT INTO `document` VALUES (5, 'photo_2019-09-16_12-43-58 (2).jpg', 87476, 8, NULL, 'uploads/project/8/photo_2019-09-16_12-43-58 (2)-15686852965d803cf0340c1938668654.jpg', 'uploads/thumb/project/8/photo_2019-09-16_12-43-58 (2)-15686852965d803cf0340c1938668654.jpg', NULL, 16, '2019-09-17 08:54:56', NULL, NULL, 1, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, 0);
INSERT INTO `document` VALUES (6, 'contract .png', 2064350, 10, NULL, 'uploads/project/10/contract -15689641975d847e6520f53747899332.png', 'uploads/thumb/project/10/contract -15689641975d847e6520f53747899332.png', NULL, 16, '2019-09-20 14:23:17', NULL, NULL, 1, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 0);
INSERT INTO `document` VALUES (7, 'bms - contract agreement - eta cambodia.pdf', 422288, 13, NULL, 'uploads/document/13/bms - contract agreement - eta cambodia-15693823765d8adfe83d0d6175403310.pdf', 'thumbs/icon-pdf.png', NULL, 20, '2019-09-25 10:32:56', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `document` VALUES (8, 'bms - contract agreement - 2bc.pdf', 428775, 13, NULL, 'uploads/document/13/bms - contract agreement - 2bc-15693830815d8ae2a940cdc200201203.pdf', 'thumbs/icon-pdf.png', NULL, 20, '2019-09-25 10:44:41', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `document` VALUES (9, 'signature by eta.jpg', 593991, 13, NULL, 'uploads/document/13/signature by eta-15693833175d8ae3953ba04867300941.jpg', 'uploads/thumb/document/13/signature by eta-15693833175d8ae3953ba04867300941.jpg', NULL, 20, '2019-09-25 10:48:37', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `document` VALUES (10, 'signature by 2bc.png', 2025920, 13, NULL, 'uploads/document/13/signature by 2bc-15693834225d8ae3fe23be8981832346.png', 'uploads/thumb/document/13/signature by 2bc-15693834225d8ae3fe23be8981832346.png', NULL, 20, '2019-09-25 10:50:22', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `document` VALUES (11, 'contract.png', 357689, 14, NULL, 'uploads/project/14/contract-15694808735d8c60a9e7aa8194088553.png', 'uploads/thumb/project/14/contract-15694808735d8c60a9e7aa8194088553.png', NULL, 16, '2019-09-26 13:54:33', NULL, NULL, 1, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, 0);
INSERT INTO `document` VALUES (15, 'photo_2019-10-16_11-17-07.jpg', 110527, 18, NULL, 'uploads/project/18/photo_2019-10-16_11-17-07-15711996035da69a73c932f165891908.jpg', 'uploads/thumb/project/18/photo_2019-10-16_11-17-07-15711996035da69a73c932f165891908.jpg', NULL, 16, '2019-10-16 11:20:03', NULL, NULL, 1, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, 0);
INSERT INTO `document` VALUES (16, 'photo_2019-10-18_17-12-21.jpg', 93934, 19, NULL, 'uploads/project/19/photo_2019-10-18_17-12-21-15713935575da990155edaf051726707.jpg', 'uploads/thumb/project/19/photo_2019-10-18_17-12-21-15713935575da990155edaf051726707.jpg', NULL, 1, '2019-10-18 17:12:37', NULL, NULL, 1, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, 0);
INSERT INTO `document` VALUES (17, 'eo-bms frontend.pdf', 24012, 20, NULL, 'uploads/project/20/eo-bms frontend-15716405155dad54c3bc09d762336929.pdf', 'thumbs/icon-pdf.png', NULL, 14, '2019-10-21 13:48:35', NULL, NULL, 1, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for document_format
-- ----------------------------
DROP TABLE IF EXISTS `document_format`;
CREATE TABLE `document_format`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_type` int(11) NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of document_format
-- ----------------------------
INSERT INTO `document_format` VALUES (1, 1, 'INV');
INSERT INTO `document_format` VALUES (2, 2, 'REC');
INSERT INTO `document_format` VALUES (3, 3, 'EXP');
INSERT INTO `document_format` VALUES (4, 4, 'PRO');
INSERT INTO `document_format` VALUES (5, 5, 'QUT');
INSERT INTO `document_format` VALUES (6, 6, 'ADV');
INSERT INTO `document_format` VALUES (7, 7, 'PRE');
INSERT INTO `document_format` VALUES (8, 8, 'ERO');
INSERT INTO `document_format` VALUES (9, 9, 'CTR');
INSERT INTO `document_format` VALUES (10, 9, 'OPN');
INSERT INTO `document_format` VALUES (11, 10, 'PBI');
INSERT INTO `document_format` VALUES (12, 11, 'FTR');
INSERT INTO `document_format` VALUES (13, 12, 'JEN');

-- ----------------------------
-- Table structure for employee_position
-- ----------------------------
DROP TABLE IF EXISTS `employee_position`;
CREATE TABLE `employee_position`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `id_department` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of employee_position
-- ----------------------------
INSERT INTO `employee_position` VALUES (1, 'Manager', '', '2019-10-05 08:24:18', 1, '2019-11-23 08:52:16', 21, 1, 1);
INSERT INTO `employee_position` VALUES (19, 'Worker', '', '2019-11-23 08:52:34', 21, NULL, NULL, 1, 2);
INSERT INTO `employee_position` VALUES (20, 'Construction Manager', '', '2019-11-23 08:54:29', 21, NULL, NULL, 1, 1);
INSERT INTO `employee_position` VALUES (21, 'Accountant', '', '2019-11-23 08:54:42', 21, '2019-11-23 09:13:16', 21, 1, 1);
INSERT INTO `employee_position` VALUES (22, 'than', '', '2019-11-23 08:58:14', 21, NULL, NULL, 1, 2);

-- ----------------------------
-- Table structure for employee_profile
-- ----------------------------
DROP TABLE IF EXISTS `employee_profile`;
CREATE TABLE `employee_profile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_prefix` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `join_date` date NULL DEFAULT NULL,
  `date_of_birth` date NULL DEFAULT NULL,
  `place_of_birth` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `sex` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `nationality` int(11) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_country` int(11) NULL DEFAULT NULL,
  `id_city` int(11) NULL DEFAULT NULL,
  `marital_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `id_department` int(11) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `id_position` int(11) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `confirm_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `signature_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `id_user_type` int(11) NULL DEFAULT NULL,
  `job_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `employee_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `employee_joint_date` date NULL DEFAULT NULL,
  `basic_salary` decimal(10, 2) NULL DEFAULT NULL,
  `id_working_group` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of employee_profile
-- ----------------------------
INSERT INTO `employee_profile` VALUES (1, 'Mr.', '-', 'Hors', NULL, NULL, '', '1', 56, '', NULL, NULL, 'Married', '', 2, '', 22, '', '', '', '', '2019-11-23 08:59:00', 21, '2019-11-23 08:59:16', 21, 1, NULL, NULL, NULL, '', '', NULL, NULL, NULL);
INSERT INTO `employee_profile` VALUES (2, 'Mr.', '-', 'Chroeng', NULL, NULL, '', '1', 56, '', NULL, NULL, 'Single', '', 2, '', 19, '', '', '', '', '2019-11-23 09:00:14', 21, NULL, NULL, 1, NULL, NULL, NULL, '', '', NULL, NULL, NULL);
INSERT INTO `employee_profile` VALUES (3, 'Mr.', 'Hong', '(Sor)', NULL, NULL, '', '1', 56, '', NULL, NULL, 'Single', '', 2, '', 19, '', '', '', '', '2019-11-23 09:01:19', 21, NULL, NULL, 1, NULL, NULL, NULL, '', '', NULL, NULL, NULL);
INSERT INTO `employee_profile` VALUES (4, 'Mr.', '-', 'Pung', NULL, NULL, '', '1', 56, '', NULL, NULL, 'Single', '', 2, '', 19, '', '', '', '', '2019-11-23 09:02:06', 21, NULL, NULL, 1, NULL, NULL, NULL, '', '', NULL, NULL, NULL);
INSERT INTO `employee_profile` VALUES (5, 'Mr.', '-', 'Treob', NULL, NULL, '', '1', 56, '', NULL, NULL, 'Single', '', 2, '', 22, '', '', '', '', '2019-11-23 09:02:39', 21, '2019-11-23 09:03:00', 21, 1, NULL, NULL, NULL, '', '', NULL, NULL, NULL);
INSERT INTO `employee_profile` VALUES (6, 'Mr.', '-', 'Ny', NULL, NULL, '', '1', 56, '', NULL, NULL, 'Married', '', 2, '', 22, '', '', '', '', '2019-11-23 09:03:53', 21, NULL, NULL, 1, NULL, NULL, NULL, '', '', NULL, NULL, NULL);
INSERT INTO `employee_profile` VALUES (7, 'Mr.', '-', 'Tha', NULL, NULL, '', '0', 56, '', NULL, NULL, 'Married', '', 2, '', 19, '', '', '', '', '2019-11-23 09:04:24', 21, NULL, NULL, 1, NULL, NULL, NULL, '', '', NULL, NULL, NULL);
INSERT INTO `employee_profile` VALUES (8, 'Mr.', '-', 'Por', NULL, NULL, '', '1', 56, '', NULL, NULL, 'Single', '', 2, '', 19, '', '', '', '', '2019-11-23 09:04:47', 21, NULL, NULL, 1, NULL, NULL, NULL, '', '', NULL, NULL, NULL);
INSERT INTO `employee_profile` VALUES (9, 'Mr.', '-', 'Veng', NULL, NULL, '', '0', 56, '', NULL, NULL, 'Single', '', 2, '', 19, '', '', '', '', '2019-11-23 09:05:24', 21, NULL, NULL, 1, NULL, NULL, NULL, '', '', NULL, NULL, NULL);
INSERT INTO `employee_profile` VALUES (10, 'Mr.', 'Srey', 'Vin', NULL, NULL, '', '1', 56, '', NULL, NULL, 'Single', '', 2, '', 19, '', '', '', '', '2019-11-23 09:05:50', 21, NULL, NULL, 1, NULL, NULL, NULL, '', '', NULL, NULL, NULL);
INSERT INTO `employee_profile` VALUES (11, 'Mr.', '-', 'Yarn', NULL, NULL, '', '0', 56, '', 56, 21, 'Single', '', 2, '', 19, '', '', '', '', '2019-11-23 09:06:55', 21, '2019-11-26 08:22:19', 21, 1, NULL, NULL, NULL, '', '', NULL, NULL, NULL);
INSERT INTO `employee_profile` VALUES (12, 'Mr.', 'Bun', 'Than', NULL, NULL, '', '1', 56, '', NULL, NULL, 'Married', '', 1, '', 1, '', '', '', '', '2019-11-23 09:08:29', 21, NULL, NULL, 1, NULL, NULL, NULL, '', '', NULL, NULL, NULL);
INSERT INTO `employee_profile` VALUES (13, 'Mr.', 'Vann', 'Nak', NULL, NULL, '', '1', 56, '', NULL, NULL, 'Single', '', 1, '', 20, '', '', '', '', '2019-11-23 09:09:11', 21, NULL, NULL, 1, NULL, NULL, NULL, '', '', NULL, NULL, NULL);
INSERT INTO `employee_profile` VALUES (14, 'Mr.', 'Chea', 'Sela', NULL, NULL, '', '0', 56, '', NULL, NULL, '', '', 1, '', 20, '', '', '', '', '2019-11-23 09:10:09', 21, NULL, NULL, 1, NULL, NULL, NULL, '', '', NULL, NULL, NULL);
INSERT INTO `employee_profile` VALUES (15, 'Mr.', '-', 'Makara', NULL, NULL, '', '0', 56, '', NULL, NULL, 'Single', '', 1, '', 20, '', '', '', '', '2019-11-23 09:10:47', 21, NULL, NULL, 1, NULL, NULL, NULL, '', '', NULL, NULL, NULL);
INSERT INTO `employee_profile` VALUES (16, 'Mr.', 'Jorj', 'Horn', NULL, NULL, '', '0', 56, '', NULL, NULL, 'Married', '', 1, '', 21, '', '', '', '', '2019-11-23 09:11:21', 21, '2019-11-23 09:11:35', 21, 1, NULL, NULL, NULL, '', '', NULL, NULL, NULL);
INSERT INTO `employee_profile` VALUES (17, 'Mr.', 'Jom', 'Rern', NULL, NULL, '', '0', 56, '', NULL, NULL, 'Married', '', 1, '', 20, '', '', '', '', '2019-11-23 09:12:08', 21, NULL, NULL, 1, NULL, NULL, NULL, '', '', NULL, NULL, NULL);
INSERT INTO `employee_profile` VALUES (18, 'Mr.', '-', 'Vai', NULL, NULL, '', '0', 56, '', NULL, NULL, 'Single', '', 1, '', 20, '', '', '', '', '2019-11-23 09:12:44', 21, NULL, NULL, 1, NULL, NULL, NULL, '', '', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for eot_customer
-- ----------------------------
DROP TABLE IF EXISTS `eot_customer`;
CREATE TABLE `eot_customer`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `country` int(11) NULL DEFAULT NULL,
  `city` int(11) NULL DEFAULT NULL,
  `postal_code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contact_person` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `general_email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `reservation_email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `invoice_email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mobile_number_invoice` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `main_phone_1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `main_phone_2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `website_url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `accommodation_type` int(11) NULL DEFAULT NULL,
  `star_rating` decimal(10, 1) NULL DEFAULT NULL,
  `number_of_rooms` int(11) NULL DEFAULT NULL,
  `sale_date` date NULL DEFAULT NULL,
  `service_agreement` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fee` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `accomodation_stats` int(11) NULL DEFAULT NULL COMMENT '1=lived , 2 = Inprocesing , 0 = Deactived',
  `created_by` int(11) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `passed_by` int(11) NULL DEFAULT NULL,
  `handle_by` int(11) NULL DEFAULT NULL,
  `deactivated_at` date NULL DEFAULT NULL,
  `deactivated_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `deactivated_requested_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `deactivated_requested_contact_detail` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `deactivated_by` int(11) NOT NULL,
  `lived_date` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of eot_customer
-- ----------------------------
INSERT INTO `eot_customer` VALUES (1, '1920 Hotel ', 'Street #9, Old Market, Siem Reap, Cambodia', 1, 1, '1', 'Mr. Senghak KOL', 'info@1920hotel.com', 'info@1920hotel.com', 'info@1920hotel.com', '+855 63 969 920', '+855 99 915 918', '+855 99 915 918', 'http://the1920.com', 1, 4.0, 10, '2016-05-23', '13', '', NULL, 2, 12, '2018-09-02 12:59:03', '2018-09-02 12:59:03', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (4, 'Advaya Residence', 'Vihear Chin Village, Svay Dangkum, Siem Reap', 1, 1, '17252', 'Mr. Korn Kosal', 'gm@advayaresidence.com', 'reservations@advayaresidence.com, gm@advayaresidence.com', 'gm@advayaresidence.com', '+855 17 465 120', '+855 17 465 120', '+855 63 766 365', 'http://advayaresidence.com', 1, 5.0, 17, '2018-08-21', NULL, '1', NULL, 2, 12, '2018-11-01 14:01:09', '2018-11-01 14:01:09', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (5, 'Adventure Hostel Siem Reap', 'Siem Reap, Cambodia', 1, 1, '17252', 'Mr. Chhun Sochetra', 'chhunsochetra@gmail.com', 'thekingteam999@gmail.com', 'thekingteam999@gmail.com', '+855 77 460 077', '+855 12 380 484', '+855 77 460 077', 'http://adventurehostelsiemreap.com', 2, 3.0, 20, '2018-08-21', NULL, '', NULL, 2, 12, '2018-11-01 14:02:34', '2018-11-01 14:02:34', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (6, 'Alibi Guesthouse ', 'Royal Palace, Sothearos Blvd', 1, 2, '17252', 'Mr. Christian Husel', 'info@alibiguesthouse.com', 'info@alibiguesthouse.com', 'info@alibiguesthouse.com', '+855 16 901 590', '+855 88 890 1590', '+855 16 901 590', 'http://alibiguesthouse.com', 4, 4.0, 10, '2018-08-21', NULL, '', NULL, 2, 12, '2018-11-01 14:03:57', '2018-11-01 14:03:57', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (7, 'Alison Angkor Boutique Villa & Resort', '#826, Street 22, Wat Bo Village', 1, 1, '', 'Mr. Sok Chanthou', 'info@alisonangkor.com, booking@alisonangkor.com', 'info@alisonangkor.com, booking@alisonangkor.com', 'info@alisonangkor.com, booking@alisonangkor.com', '', '+855 63 968 808', '+855 86 691 589', 'http://alisonangkor.com', 7, 4.0, 12, '2015-03-25', NULL, '50', NULL, 3, 2, '2018-10-31 16:14:43', '2018-10-31 16:14:43', 2, 2, 5, '2016-10-26', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (8, 'Amatao Tropical Residence', 'Svay Prey Village', 1, 1, '', 'Mrs. Naomi Basler', 'gm@amatao.com, rsvn@amatao.com, welcome@amatao.com', 'rsvn@amatao.com', 'rsvn@amatao.com', '', '+855 12 590 645', '+855 12 590 645', 'http://amatao.com', 8, 4.0, 4, '2017-10-02', NULL, '100', NULL, 2, 2, '2018-08-27 23:03:49', '2018-08-27 23:03:49', 2, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (9, 'Anachak Boutique Hotel', 'Steung Thmey village, Svay Dungkom commune', 1, 1, '', 'Mr. Vutha Hour ', 'info@anachakboutiquehotel.com', 'reservation@anachakboutiquehotel.com', 'ac@anachakboutiquehotel.com', '', '+855 63 769 898', '+855 70 966 637', 'http://anachakboutiquehotel.com', 1, 4.0, 19, '2015-02-07', NULL, '100', NULL, 3, 12, '2018-10-31 10:28:32', '2018-10-31 10:28:32', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (11, 'Angkor Boutique Villa', 'No.335, Wat Damnak, Sala Kamreuok', 1, 1, '', 'Pen Sokema', 'booking@angkorboutiquevilla.com', 'booking@angkorboutiquevilla.com', 'booking@angkorboutiquevilla.com', '', '+855 12 914 909', '+855 63 765 558', 'http://angkorboutiquevilla.com', 7, 3.0, 8, '2014-10-25', NULL, '35', NULL, 3, 2, '2018-10-31 16:16:13', '2018-10-31 16:16:13', 2, 2, 5, '2016-10-26', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (13, 'Angkor Century Resort and Spa', 'Komay Road, Khum Svay Dangkom', 1, 1, '17252', 'Mr. Eng Borey ', 'info@angkorcentury.com', 'resa@angkorcentury.com, e-commerce@angkorcentury.com', 'ap@angkorcentury.com, e-commerce@angkorcentury.com', '', '+855 63 963 777', '+855 63 963 789', 'http://angkorcentury.com', 1, 5.0, 190, '2014-10-01', NULL, '185', NULL, 2, 12, '2018-11-01 14:11:50', '2018-11-01 14:11:50', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (14, 'Angkor Heart Bungalow', 'Ring Road Krovat - krong Street,Sangkat svay dangkum,', 1, 1, '', 'Mr. Meas Sopheap', 'info@angkorheartbungalow.com', 'info@angkorheartbungalow.com', 'info@angkorheartbungalow.com', '', '+855 92 508 863', '+855 95 732 009', 'http://angkorheartbungalow.com', 1, 3.0, 7, '2018-02-02', NULL, '50', NULL, 2, 12, '2019-05-31 16:00:14', '2019-05-31 16:00:14', 12, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (15, 'Angkor Holiday Hotel', 'National Road No.6,', 1, 1, '1710', 'Cheung Sokha', 'gm@angkorholidayhotel.com, reservation@angkorholidayhotel.com, sales@angkorholidayhotel.com', 'reservation@angkorholidayhotel.com, gm@angkorholidayhotel.com, e-commerce@angkorholidayhotel.com', 'gm@angkorholidayhotel.com', '', '+855 63 966 777', '', 'http://angkorholidayhotel.com', 1, 4.0, 162, '2014-10-25', NULL, '80', NULL, 3, 13, '2019-02-21 10:15:34', '2019-02-21 10:15:34', 13, 2, 5, '1970-01-01', 'They want to test other company system,', 'Mr. Kakada (e-commerce)', '+855 63 966 777', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (16, 'Angkor Howard Hotel and Convention Center', 'National Road No 6 | Phum Kaksekam, Khum Sror Nge, Siem Reap Province', 1, 1, '', 'Ms. Sorphia Nguon', 'info@angkorhoward.com', 'reservation@angkorhoward.com', 'gcashier@angkorhoward.com', '', '+855 63 965 000', '+855077510429', 'http://angkorhoward.com', 1, 5.0, 343, '2016-04-29', NULL, '215', NULL, 2, 12, '2018-11-01 14:19:22', '2018-11-01 14:19:22', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (17, 'Angkor International Hotel', '#50, Street 148', 1, 2, '122022', 'Mr. Noun Leng', 'angkorhotel11@gmail.com', 'angkorhotel11@gmail.com', 'angkorhotel11@gmail.com', '', '+855 23 217 609', '+855 17 518 827', 'http://angkorinternationalhotel.com', 1, 3.0, 78, '2015-11-17', NULL, '75', NULL, 3, 13, '2018-11-08 08:24:58', '2018-11-08 08:24:58', 13, 2, 5, '2018-11-05', 'Auto Deactivate', 'Mr. Noun Leng', '+855 17 518 827\r\n+855 23 217 609', 4, NULL);
INSERT INTO `eot_customer` VALUES (18, 'Angkor Miracle Resort & Spa', 'National Road No. 6A. Khum Sra Nge (opposite of Cambodian cultural Village) Siem Reap', 1, 1, '', 'Mr. Daravichhay SENG ', 'em@angkormiracle.com, ee@angkormiracle.com, reservations@angkormiracle.com', 'reservations@angkormiracle.com, ee@angkormiracle.com, em@angkormiracle.com', 'acc@angkormiracle.com', '', '+855 63 969 900', '+855 87 882 244', 'http://angkormiracle.com/resort', 6, 5.0, 247, '2015-11-30', NULL, '150', NULL, 3, 12, '2018-10-31 10:31:23', '2018-10-31 10:31:23', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (19, 'Angkor Mithona Guesthouse', '# 19, Street 172 L13, Sangkat Chey Chumneah, Phsar Kandal, Khan Daun Penh', 1, 2, '', 'Mr. Piseth', 'info@angkormithonaguesthouse.com', 'reservation@angkormithonaguesthouse.com', 'info@angkormithonaguesthouse.com', '', '+855 23 990 323', '+855 12 760 673', 'http://angkormithonaguesthouse.com', 9, 2.0, 34, '2015-08-15', NULL, '50', NULL, 3, 12, '2018-10-31 10:32:04', '2018-10-31 10:32:04', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (20, 'Angkor Pearl Hotel', '', 1, 1, '1710', 'Mr. Peter Phoeng', 'pphoeng@angkorpearl.com', 'pphoeng@angkorpearl.com, info@angkorpearl.com', 'pphoeng@angkorpearl.com', '', '+855 92 571 520', '+855 63 966 202', 'http://angkorpearl.com', 1, 3.0, 45, '2014-12-25', NULL, '100', NULL, 3, 12, '2018-10-31 10:33:47', '2018-10-31 10:33:47', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (22, 'Angkor Rendezvous Villa', 'Neelka Way', 1, 1, '', 'Mr. Meng Dy', 'millmengdy@gmail.com', 'arvhotelink@gmail.com, millmengdy@gmail.com', 'millmengdy@gmail.com', '', '+855 77 588 788', '', 'http://angkorrendezvousvillas.com', 3, 5.0, 10, '2017-02-01', NULL, '60', NULL, 3, 12, '2018-10-31 10:51:17', '2018-10-31 10:51:17', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (23, 'Angkor Siesta Villa', '#12, Phum Beung Don Pa, Sangkat Slor Kram', 1, 1, '17251', 'Ms. Chenda Lam', 'info@angkorsiestavilla.com', 'info@angkorsiestavilla.com', 'info@angkorsiestavilla.com', '', '+855 70 808 182', '+855 70 808 182', 'http://angkorsiestavilla.com', 7, 4.0, 7, '2018-01-19', NULL, '60', NULL, 3, 12, '2019-01-11 10:59:34', '2019-01-11 10:59:34', 12, 2, 4, '2018-11-30', 'Dear Maranet,\r\n\r\nGreetings from Angkor Siesta Villa\r\n\r\nI am writing to you to inform you that we have disconnected your Channel Manager & IBE (hotellinksolutions) from our hotel recently as we do not have any budget to continue on this.', 'Mr. Sophath ', '012 981 089 ', 5, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (24, 'Angkor Twinkle Boutique Villa', 'Lok Taneuy (St.), Phum Wat Bo, Sangkat Sala Kamreuk', 1, 1, '', 'Angkor Twinkle Boutique Villa', 'booking@angkortwinklevilla.com', 'booking@angkortwinklevilla.com', 'booking@angkortwinklevilla.com ', '', '+855 63 963 368', '+855 17 666 609', 'http://angkortwinkleboutiquevilla.com', 7, 3.5, 22, '2016-01-12', NULL, '130', NULL, 3, 13, '2018-10-31 14:00:01', '2018-10-31 14:00:01', 13, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (25, 'Anise Hotel', 'Nº 2C, St 278 off 57, Beoung Keng Kang I, Chamkamorn', 1, 2, '', 'Mr. Duy Sophal', 'reservation@anisehotel.com.kh', 'reservation@anisehotel.com.kh', 'manager@anisehotel.com.kh', '', '+855 23 222 522', '+855 12 730 099', 'http://anisehotel.com.kh', 1, 3.0, 18, '2015-05-11', NULL, '155', NULL, 2, 12, '2018-11-01 14:35:20', '2018-11-01 14:35:20', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (26, 'Anise Villa Boutique Hotel', '18 Street 400, Beoung Keng Kang 1', 1, 2, '', 'Mr. Sophal', ' reservation@anisevilla.com', ' reservation@anisevilla.com', ' reservation@anisevilla.com', '', '+855 23 225 400', '+855 12 985 400', 'http://anisevilla.com', 1, 3.0, 21, '2015-03-13', NULL, '155', NULL, 2, 12, '2018-11-01 14:41:27', '2018-11-01 14:41:27', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (27, 'Apsara Centrepole Hotel', '522 Svay Dungkum, Old Sok San Street', 1, 1, '', 'Mr. Vann Enghong', 'book@apsaracentrepole.com', 'book@apsaracentrepole.com', 'book@apsaracentrepole.com, account@apsaracentrepole.com', '', '+855 63 968 098', '+855 95 214 209', 'http://apsaracentrepole.com', 1, 3.5, 19, '2016-10-01', NULL, '80', NULL, 2, 12, '2018-11-01 14:43:04', '2018-11-01 14:43:04', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (28, 'Apsara Residence', 'St. 27, Wat Bo Village, Sala Kamreuk Commune', 1, 1, '', 'Mr. Suy Sophanith', 'book@apsara-residence.com', 'book@apsara-residence.com', 'book@apsara-residence.com, account@apsara-residence.com', '', '+855 63 968 668', '+855 17 353 980', 'http://apsara-residence.com', 1, 4.0, 22, '2016-10-01', NULL, '80', NULL, 2, 12, '2018-11-01 14:46:17', '2018-11-01 14:46:17', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (29, 'Aqua Boutique Guesthouse', 'No.126, Street 63', 1, 2, '', 'Ms. Tep Sothyda', 'info@aqua-boutique-guesthouse.com', 'reservation@aqua-boutique-guesthouse.com', 'info@aqua-boutique-guesthouse.com', '', '+855 77 528 530', '', 'http://aqua-boutique-guesthouse.com', 9, 0.0, 20, '2015-03-31', NULL, '28', NULL, 3, 12, '2018-10-31 10:56:26', '2018-10-31 10:56:26', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (30, 'Asarita Angkor Resort & Spa', 'National Road No 6A, Khum Sra Nge', 1, 1, '17260', 'Ms. Nora', 'sales@asaritaangkor.com, asaritaangkor@gmail.com', 'reservations@asaritaangkor.com, asaritaangkor@gmail.com', 'info@asaritaangkor.com', '', '+855 63 768 444', '+855 93 965 189', 'http://asaritaangkor.com', 6, 4.0, 33, '2017-01-16', NULL, '150', NULL, 3, 12, '2018-10-31 10:57:23', '2018-10-31 10:57:23', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (31, 'Ashia Hotel & Lounge', 'P Charles De Gaulle, Krong Siem Reap', 1, 1, '', 'Mr. Komsorth', 'info@ashiahotel.com', 'reservation@ashiahotel.com', 'info@ashiahotel.com', '', '+855 63 968 960', '+855 70 770 002', 'http://ashiahotel.com', 1, 3.0, 20, '2017-07-11', NULL, '100', NULL, 2, 12, '2018-11-01 14:48:58', '2018-11-01 14:48:58', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (32, 'Babel Guesthouse', 'No.738 Wat Bo Road, Salakamroeuk', 1, 1, '1710', 'Simen Julner', 'babelsiemreap@gmail.com', 'babelsiemreap@gmail.com', 'babelsiemreap@gmail.com', '', '+855 78 858 469', '+855 78 332 301', 'http://babel-siemreap.com', 9, 2.0, 24, '2014-12-25', NULL, '70', NULL, 2, 12, '2018-11-02 11:11:33', '2018-11-02 11:11:33', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (33, 'Bamboo Angkor Boutique', ' Phum Salar Kanseng, Khum Svay Dangkum, Central Area', 1, 1, '1710', 'Mr. Chon Savun ', 'reservation@bambooangkorboutique.com', 'info@bambooangkorboutique.com', 'reservation@bambooangkorboutique.com', '', '+855 10 394 646', '+855 10 394 646', 'http://bamboo-angkorboutique.com', 7, 4.0, 12, '2015-06-09', NULL, '50', NULL, 3, 12, '2018-10-31 10:59:09', '2018-10-31 10:59:09', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (34, 'Tanei Boutique Villa', '#017, Steung Thmey Village, Svay Dangkom', 1, 1, '17252', 'Mr. Lao Sokun', 'lao_sukun007@yahoo.com', 'lao_sukun007@yahoo.com, info@taneiboutiquevilla.com', 'lao_sukun007@yahoo.com', '+855 12 757 867', '+855 12 757 867', '+855 97 746 8787', 'http://taneiboutiquevilla.com', 4, 3.0, 28, '2015-05-25', NULL, '65', NULL, 3, 12, '2018-10-31 11:00:15', '2018-10-31 11:00:15', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (36, 'La Da Kiri Boutique Hotel', 'Soksan Street, Khum Svay Dangkom', 1, 1, '17251', 'Ms. Saradin Ly', 'info@ladakiriboutique.com', 'reservation@ladakiriboutique.com', 'reservation@ladakiriboutique.com', '+855 12 781 675', '+855 12 781 675', '+855 12 781 675', 'http://ladakiriboutique.com', 7, 4.0, 26, '2015-02-06', NULL, '50', NULL, 3, 12, '2019-04-24 09:27:02', '2019-04-24 09:27:02', 12, 2, 4, '2019-04-24', 'They want to change solutions ', 'B. Sema', '070 811 558', 5, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (37, 'Cheathata Angkor Hotel', 'City Center, Angkor Night Market Road, Old Market Area', 1, 1, '17252', 'Mr. Soeum Makara', 'gm@ctaangkorhotel.com, res@ctaangkorhotel.com', 'cheathatahotel@gmail.com, res@ctaangkorhotel.com', 'chiv.kouy@ctaangkorhotel.com, res@ctaangkorhotel.com', '+855 63 968 777', '+855 63 968 777', '+855 63 968 777', 'http://angkor.ctaangkorhotel.com', 1, 3.5, 28, '8900-08-03', NULL, '70', NULL, 2, 12, '2018-11-01 14:56:48', '2018-11-01 14:56:48', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (38, 'Base Villa Phnom Penh', 'No #29 Street 222', 1, 2, '', 'Mr. Sokpheak', 'reservation@basevillaphnompenh.com', 'reservation@basevillaphnompenh.com', 'reservation@basevillaphnompenh.com', '', '+855 10 292 229', '+855 96 888 9197', 'http://basevillaphnompenh.com', 1, 3.0, 12, '2015-11-30', NULL, '100', NULL, 3, 12, '2018-10-31 11:03:19', '2018-10-31 11:03:19', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (39, 'Bavyra  Boutique', 'Slor Kram Village, Slor kram Commune', 1, 1, '1710', 'Mr. Kenvin Harris', 'Kevinrharris62@gmail.com ', 'Kevinrharris62@gmail.com', 'Kevinrharris62@gmail.com ', '', '+855 63 963 987', '+855 15 820 227', 'http://bavyraboutique.com', 7, 3.0, 9, '2015-01-25', NULL, '50', NULL, 3, 12, '2018-10-31 11:14:58', '2018-10-31 11:14:58', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (40, 'Bayon Boutique', 'Stueng Thmey, Svay Dangkum', 1, 1, '', 'Mr. Tola Hak (Seyha)', 'gm@bayonboutique.com', 'rsvn@bayonboutique.com, gm@bayonboutique.com, fm@bayonboutique.com', 'fm@bayonboutique.com', '', '+855 63 969 456', '+855 96 678 7208', 'http://bayonboutique.com/index.php', 7, 3.5, 18, '2016-10-10', NULL, '100', NULL, 2, 12, '2018-11-01 15:07:36', '2018-11-01 15:07:36', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (41, 'Bayon Shadow Villa', 'Stueng Thmey, Svay Dangkum', 1, 1, '', 'Mr. Tola Hak (Seyha)', 'gm@bayonboutique.com', 'rsvn@bayonshadow.com, gm@bayonboutique.com, fm@bayonboutique.com', 'rsvn@bayonshadow.com, fm@bayonboutique.com', '', '+855 63 765 443', '+855 96 678 7208', 'http://bayonshadow.com', 3, 2.5, 18, '2016-10-10', NULL, '100', NULL, 2, 12, '2018-11-01 15:08:40', '2018-11-01 15:08:40', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (42, 'Bella Mia Villa', 'Soksan Road, Svay Damkom Village, Svay Damkom commune', 1, 1, '17259', 'jonathon Vallieres', 'gm.bellamiavilla@gmail.com, gm@bellamiaangkor.com, gm@bellamiaangkor.com', 'reservation@bellamiaangkor.com, gm.bellamiavilla@gmail.com', 'gm.bellamiavilla@gmail.com, gm@bellamiaangkor.com', '', '+855 63 962 111', '+855 17 940 344', 'http://bellamiaangkor.com', 3, 3.5, 9, '2015-10-01', NULL, '75', NULL, 3, 12, '2018-10-31 11:15:31', '2018-10-31 11:15:31', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (43, 'Big Lyna Villa', 'Wat Bo Village, Sangkat Salakamroeuk', 1, 1, '1710', 'Sam Tina', 'biglyna@yahoo.com', 'biglyna@yahoo.com', 'biglyna@yahoo.com', '', '+855 63 964 807', '+855 92 630 597', 'http://biglynavilla.com', 9, 1.0, 10, '2015-02-11', NULL, '50', NULL, 3, 12, '2018-10-31 11:16:45', '2018-10-31 11:16:45', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (44, 'Bliss Villa ', '# 051, Sok San Street, Svay Dangkum Village', 1, 1, '17252', 'Sieng Saline', 'blissvilla@asia.com', 'blissvilla@asia.com', 'blissvilla@asia.com', '', '+855 63 630 0978', '', 'http://theblissvilla.com', 1, 4.0, 21, '2014-12-27', NULL, '80', NULL, 3, 13, '2019-01-03 08:34:09', '2019-01-03 08:34:09', 13, 2, 5, '2019-01-03', 'Change Company Solutions', 'Vathana', '+(855) 81 832 181(LINE / WeChat / WhatsApp / Viber / Telegram)', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (45, 'Bokre Angkor Hostel ', '363 Taphul Village, Svay Dangkum Commune', 1, 1, '', 'Ms. Ung Annie', 'Info@bokreangkorhostel.com', 'reservation@bokreangkorhostel.com', 'Info@bokreangkorhostel.com', '', '+855 85 511 118', '+855 10 698 777', 'http://eocambovilla.com', 2, 3.0, 30, '2017-10-09', NULL, '100', NULL, 2, 12, '2018-11-01 15:12:19', '2018-11-01 15:12:19', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (46, 'Garden Village Guesthouse', '#434, Sok San Street, Steng Thmey Village, Svaydangkum Commune', 1, 1, '17252', 'Vann pohin', 'gardenvillage@asia.com', 'gardenvillage@asia.com', 'gardenvillage@asia.com', '+855 17 297 777', '+855 17 297 777', '+855 17 297 777', 'http://guesthouse.gardenvillageguesthouse.com', 9, 1.0, 29, '2014-12-25', NULL, '40', NULL, 2, 12, '2018-11-01 15:12:55', '2018-11-01 15:12:55', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (48, 'Botoum Hostel', 'Sangkat Svay Dangkum,', 1, 1, '', 'Mr. Sokdana Choung ', 'info@botoumhostel.com', 'info@botoumhostel.com', 'info@botoumhostel.com', '', '+855 16 913 999', '+855 16 913 999', 'http://botoumhostel.com', 1, 3.0, 15, '2018-06-23', NULL, '40', NULL, 2, 12, '2018-11-01 15:13:29', '2018-11-01 15:13:29', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (49, 'Garden Village Hostel', 'Steung Thmey Village, Svay Dungkom commune', 1, 1, '17252', 'Mr.Vann pohin', 'gardenvillage@asia.com', 'gardenvillage@asia.com', 'gardenvillage@asia.com', '+855 17 297 777', '+855 17 297 777', '+855 17 297 777http://gardenvillagehostel.com', 'http://gardenvillagehostel.com', 2, 1.0, 12, '2015-07-08', NULL, '30', NULL, 3, 12, '2018-10-31 11:24:38', '2018-10-31 11:24:38', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (50, 'Garden Village Villa', 'Garden Village Villa is located close to the Old Market in walking distance to bars, restaurants', 1, 1, '17252', 'Vann pohin', 'gardenvillage@asia.com', 'gardenvillage@asia.com', 'gardenvillage@asia.com', '+855 17 297 777', '+855 17 297 777', '+855 17 297 777', 'http://villa.gardenvillagevilla.com', 3, 2.0, 8, '2015-07-08', NULL, '30', NULL, 3, 12, '2019-08-01 10:30:39', '2019-08-01 10:30:39', 12, 19, 4, '2019-08-01', 'Low season ', 'Mr. Pohin', '070 630 000', 5, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (51, 'Mane Boutique Hotel & Spa', 'Village Salakomroeuk, Sangkat Salakomroeuk', 1, 1, '17252', 'Mr. Rath', 'ecom@maneboutiquehotel.com', 'reservations@maneboutiquehotel.com, ecom@maneboutiquehotel.com', 'gm@maneboutiquehotel.com, md@maneboutiquehotel.com, phann.vanrath@gmail.com', '+855 97 552 2222', '+855 63 768 899', '+855 97 552 2222', 'http://maneboutiquehotel.com', 1, 5.0, 18, '2015-08-26', NULL, '120', NULL, 3, 12, '2018-10-31 11:29:08', '2018-10-31 11:29:08', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (52, 'Lynnaya Urban River Resort & Spa', 'Street 20 Krong Siem Reap', 1, 1, '17000', 'Mr.Kan Chansathya', 'gm@lynnaya.com', 'reservation@lynnaya.com', 'reservation@lynnaya.com ', '+855 63 967 755', '+855 63 967 755', '+855 63 967 755', 'http://lynnaya-hotel-angkor.com', 1, 4.0, 46, '2015-08-27', NULL, '130', NULL, 3, 13, '2018-10-31 13:50:25', '2018-10-31 13:50:25', 13, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (54, 'Bou Savy Guesthouse (Bed & Breakfast)', '#261, Group 07, Salakanseng Village, Svaydangkum Commune. ', 1, 1, '17252', 'Horn Bovorn', 'bousavy7777@gmail.com', 'bousavy7777@gmail.com, savy7777@hotmail.com', 'savy7777@hotmail.com', '+855 12 369 600', '+855 12 369 600', '+855 77 752 075', 'http://bousavyguesthouse.com', 9, 2.0, 30, '2015-09-11', NULL, '100', NULL, 2, 12, '2018-11-01 15:15:02', '2018-11-01 15:15:02', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (55, 'La Villa du Bonheur', '#056, Viheachen, Svaydangkum', 1, 1, '17252', 'La Villa du Bonheur', 'reservation@lavilladubonheur.com ', 'reservation@lavilladubonheur.com ', 'reservation@lavilladubonheur.com ', '+855 77 567 605', '+855 77 567 605', '+855 63 765 761', 'http://lavilladubonheur.com', 3, 1.0, 18, '2015-02-16', NULL, '40', NULL, 3, 12, '2018-10-31 11:46:55', '2018-10-31 11:46:55', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (56, 'Sarai Resort & Spa', 'P.O Box 93193, Wat Damnak Village, Sangkat Sala Komreuk ', 1, 1, '17251', 'Mr. Oeun Seakheng', 'info@sarairesort.com, ecommerce@sarairesort.com, book@sarairesort.com', 'book@sarairesort.com, ecommerce@sarairesort.com', 'account@sarairesort.com', '+855 93 962 204', '+855 93 962 204', '+855 63 962 200', 'http://sarairesort.com', 6, 5.0, 48, '2015-01-12', NULL, '65', NULL, 3, 12, '2018-10-31 11:48:34', '2018-10-31 11:48:34', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (57, 'Seven Happiness Holiday HOTEL', 'Road Lorkta neuy Slor Kram Commune', 1, 1, '17251', 'MR.LING', 'sevenhappinessholidayhotel@gmail.com', 'reservations7happinesshotel@gmail.com', 'accsevenhappinessholidayhotel@gmail.com', '+855 63 968 899', '+855 63 968 899', '+855 63 968 899', 'http://siemreapevergreenhotel.com', 1, 3.0, 50, '2014-12-25', NULL, '120', NULL, 3, 12, '2018-10-31 11:49:25', '2018-10-31 11:49:25', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (59, 'Pacific Hotel', ' Road No. 6, Kaksekam Village, Sror Nge Commune', 1, 1, '17000', 'Mr. Pok Dilux', ' reservations@pacifichotel.com.kh', ' reservations@pacifichotel.com.kh', ' reservations@pacifichotel.com.kh', '+855 63 761 818', '+855 63 761 818', '+855 63 761 020', 'http://pacifichotel.com.kh', 1, 4.0, 200, '2015-01-22', NULL, '15', NULL, 3, 12, '2018-10-31 11:52:05', '2018-10-31 11:52:05', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (60, 'Heng Kim Ny Boutique', '#333, Bakheng (St), Sangkat Svay Dangkum, Siem Reap Province. ', 1, 1, '17252', 'Mr. Long Sopha', 'info@hengkimnyboutique.com', 'reservation@hengkimnyboutique.com', 'info@hengkimnyboutique.com', '+855 93 557 717', '+855 93 557 717 ', '+855 63 965 959', 'http://hengkimnyboutique.com', 1, 4.0, 21, '2015-08-01', NULL, '70', NULL, 3, 12, '2018-10-31 11:52:45', '2018-10-31 11:52:45', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (61, 'Cheathata Suite Hotel', 'City Cente, Angkor Night Market Road, Old Market Area', 1, 1, '17252', 'Mr. Soeum Makara', 'res@ctaangkorhotel.com', 'cheathatahotel@gmail.com, res@ctaangkorhotel.com', 'chiv.kouy@ctaangkorhotel.com', '+855 69 966 777', '+855 63 968 777', '+855 69 966 777', 'https://suite.cheathatasuitehotel.com', 1, 4.0, 38, '2014-12-14', NULL, '70', NULL, 2, 12, '2018-11-01 15:15:33', '2018-11-01 15:15:33', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (62, 'Hotel Be Angkor', 'On The Passage, Old Market Area', 1, 1, '17252', 'Martin Disman', 'md@theonehotelcollection.com', 'md@theonehotelcollection.com', 'md@theonehotelcollection.com', '+855 12 755 311', '+855 12 755 311', '+855 63 965 321', 'http://hotelbeangkor.com', 1, 3.0, 3, '2015-03-25', NULL, '50', NULL, 3, 12, '2018-10-31 11:54:09', '2018-10-31 11:54:09', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (63, 'Diamond D\'Angkor Boutique', 'Road# 50 (Sok San Street) , Group 8, Stoeung Thmey, Sangkat Svay Dang Kom', 1, 1, '17252', 'Khoun Sokhemra', 'booking@diamondangkor.com', 'booking@diamondangkor.com', 'booking@diamondangkor.com', '+855 63 966 987', '+855 63 966 987', '+855 63 966 987', 'http://diamondangkor.com', 1, 2.0, 15, '2015-12-25', NULL, '40', NULL, 2, 12, '2018-11-01 15:16:06', '2018-11-01 15:16:06', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (64, 'Bunseda Angkor Villa', 'House 169, Group 4, Sivatha Road, Svay Dangkum Commune', 1, 1, '17252', 'Mr. Vichhay', 'vi_chhay@yahoo.com', 'vi_chhay@yahoo.com', 'vi_chhay@yahoo.com', '+855 12 933 080', '+855 12 933 080', '+855 12 933 080', 'http://bunsedaangkorvilla.com', 3, 1.0, 27, '2014-12-25', NULL, '70', NULL, 3, 12, '2018-10-31 11:55:18', '2018-10-31 11:55:18', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (66, 'Relax Inn Boutique Hotel', 'Bakheng Road, Phum Krous, Sangkat Svay Dangkom', 1, 1, '17252', 'Mr. Sopheak', 'sopheakkhoeuth@gmail.com, om@relaxinn.asia', 'reservation@relaxinn.asia ', 'reservation@relaxinn.asia ', '+855 96 556 5999', '+855 96 556 5999', '  +855 63 502 3999', 'http://relaxinn.asia', 1, 3.0, 5, '2015-01-25', NULL, '100', NULL, 3, 12, '2018-10-31 11:57:13', '2018-10-31 11:57:13', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (68, 'Golden Temple Residence', '# 558, Steung Thmey Village, Sangkat Svaydangkum ', 1, 1, '17252', 'Mr. Luon Thea', 'info@goldentempleresidence.com', 'reservations@goldentempleresidence.com', 'fc@goldentempleresidence.com, reservations@goldentempleresidence.com', '+855 63 210 522', '+855 63 212 222', '+855 63 210 522', 'http://goldentempleresidence.com', 1, 4.5, 28, '2014-12-25', NULL, '85', NULL, 3, 13, '2018-08-27 10:26:35', '2018-08-27 10:26:35', 13, 2, 4, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `eot_customer` VALUES (69, 'Gloria Angkor Hotel', 'National Road Nº 6, Choung Kaosou Village', 1, 1, '17251', 'Sovann Touch', 'info@gloriaangkorhotel.com', 'reservation@gloriaangkorhotel.com', 'acc@gloriaangkorhotel.com', '+855 63 763 163', '+855 63 763 163', '+855 63 763 163', 'http://gloriaangkorhotel.com', 1, 3.0, 3, '2014-12-25', NULL, '70', NULL, 3, 13, '2018-08-27 10:31:53', '2018-08-27 10:31:53', 13, 2, 4, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `eot_customer` VALUES (71, 'Khemara Angkor Hotel', 'National Road No.6 Sala kanseng, Khum Svaydangkum', 1, 1, '17252', 'Mr. Sophat', 'sales@khemaraangkor.com ', ' info@khemaraangkor.com', 'info@khemaraangkor.com, account@khemaraangkor.com', '+855 63 760 555', '+855 63 760 555', '+855 63 760 777', 'http://khemaraangkor.com', 1, 4.0, 160, '2015-02-25', '14', '50', NULL, 3, 13, '2018-08-27 14:34:28', '2018-08-27 14:34:28', 13, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (72, 'The Moon Boutique Hotel', 'Phum Wat Bo, Sala Kamreuk Commune', 1, 1, '17000', 'Mr. Vanna', 'reservation@themoonboutiquehotel.com', 'reservation@themoonboutiquehotel.com', 'fc@themoonboutiquehotel.com', '+855 17 359 908', '+855 17 359 908', '+855 63 964 577', 'http://themoonboutiquehotel.com', 1, 3.0, 17, '2015-03-17', NULL, '55', NULL, 3, 13, '2019-01-03 08:36:05', '2019-01-03 08:36:05', 13, 2, 4, '2019-01-03', 'Change Company Solutions', 'Sokvanna BOU ', '017 359 908', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (74, 'Happy Guesthouse', 'No. 0134 Wat Bo Village, Salakamroeuk Commune', 1, 1, '17251', 'Phem Chhorpoan', 'info@happyangkorguesthouse.com', 'info@happyangkorguesthouse.com, happy_ghouse@yahoo.com', 'info@happyangkorguesthouse.com', '+855 12 960 879', '+855 12 960 879', '+855 63 963 815', 'http://happyangkorguesthouse.com', 9, 2.0, 9, '2014-12-25', NULL, '60', NULL, 2, 12, '2018-11-01 15:18:32', '2018-11-01 15:18:32', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (77, 'Rambutan Hotel - Siem Reap', 'Wat Damnak Village, Salakamreuk commune', 1, 1, '17000', 'Mr. Tommy Baert', 'bookings@rambutansr.com', 'bookings@rambutansr.com', 'bookings@rambutansr.com', '+855 12 654 638', '+855 12 654 638', '+855 63 766 655', 'http://rambutanhotelsr.com', 1, 3.0, 12, '2015-03-25', NULL, '45', NULL, 3, 13, '2018-08-29 20:59:04', '2018-08-29 20:59:04', 13, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (78, 'Rambutan Resort - Siem Reap ', 'Wat Damnak Village, Salakamreuk commune', 1, 1, '17252', 'Mr. Tommy Baert', 'bookings@rambutansr.com', 'bookings@rambutansr.com', 'bookings@rambutansr.com', '+855 12 654 638', '+855 12 654 638', '+855 63 766 655', 'http://rambutanresortsr.com', 6, 3.0, 19, '2015-03-19', NULL, '45', NULL, 3, 13, '2018-08-29 20:58:42', '2018-08-29 20:58:42', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (80, 'Angkor Pearl Hotel', 'Taphul Village Svay Dangkum  ', 1, 1, '17252', 'Mr. Peter Phoeng', 'pphoeng@angkorpearl.com', 'pphoeng@angkorpearl.com', 'pphoeng@angkorpearl.com', '+855 92 571 520', '+855 92 571 520', '+855 63 966 202', 'http://angkorpearl.com', 1, 3.0, 45, '2014-03-25', NULL, '100', NULL, 3, 13, '2018-08-29 21:04:10', '2018-08-29 21:04:10', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (81, 'The Moon Residence', '#100, St.267, Vihear Chen Village, Svay Dangkum Commune', 1, 1, '17252', 'Cheng Bunsan', 'reservation@themoonresidence.com', 'reservation@themoonresidence.com', 'reservation@themoonresidence.com', '+855 69 585 566', '+855 69 585 566', '+855 63 900 085', 'http://themoonresidence.com', 1, 4.0, 22, '2015-08-29', NULL, '55', NULL, 2, 12, '2018-11-02 11:43:22', '2018-11-02 11:43:22', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (82, 'The Moon Villa ', 'National Road 06,Phum Banteay Chas, Samaki Market zone', 1, 1, '17000', 'Mr.Has Sophal', 'reservation@themoonvilla.com', 'reservation@themoonvilla.com', 'reservation@themoonvilla.com', '+855 12 629 969', '+855 12 629 969', '+855 12 629 969', 'http://themoonvilla.com', 3, 3.0, 19, '2015-08-29', NULL, '55', NULL, 3, 13, '2018-08-29 21:18:54', '2018-08-29 21:18:54', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (83, 'Royal Crown Hotel', '#7 Makara Street, Wat Bo Village, Salakamreuk Commune', 1, 1, '17000', 'Mr. Mom Phirith', 'gm@royalcrownhotel.com.kh', 'reservations@royalcrownhotel.com.kh', 'gm@royalcrownhotel.com.kh', '+855 92 373 114', '+855 92 373 114', '+855 63 760 212', 'http://royalcrownhotel.com.kh', 7, 4.0, 139, '2015-11-27', NULL, '110', NULL, 2, 12, '2018-11-01 15:19:10', '2018-11-01 15:19:10', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (84, 'Chronicle Residence And Spa', '# Road 30, 200m way from Borei Phreumprey.', 1, 1, '17000', 'Kyry Sok', 'gm@chronicleresidenceandspa.com, operation@chronicleresidenceandspa.com, info@chronicleresidenceandspa.com', 'reservation@chronicleresidenceandspa.com, operation@chronicleresidenceandspa.com, info@chronicleresidenceandspa.com', 'account@chronicleresidenceandspa.com', '+855 12 677 939', '+855 12 677 939', '+855 63 963 693', 'http://chronicleresidenceandspa.com', 1, 3.0, 22, '2015-11-27', NULL, '100', NULL, 3, 13, '2018-08-29 21:27:24', '2018-08-29 21:27:24', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (85, 'Three Room D\'Angkor', 'Wat Leu Road, Village 3, Slor Kram', 1, 1, '17000', 'Mr. Chhorng Chhaiya', 'info@threeroomdangkor.com', 'info@threeroomdangkor.com', 'info@threeroomdangkor.com', '+855 16 907 567', '+855 16 907 567', '+855 87 727 273', 'http://threeroomdangkor.com ', 7, 4.0, 3, '2014-08-24', NULL, '60', NULL, 3, 13, '2018-08-29 21:30:07', '2018-08-29 21:30:07', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (86, 'Angkor Miracle Resort & Spa', 'National Road No. 6A. Khum Sra Nge (opposite of Cambodian cultural Village) Siem Reap', 1, 1, '17000', 'Mr. Daravichhay SENG ', 'em@angkormiracle.com, ee@angkormiracle.com, reservations@angkormiracle.com', 'reservations@angkormiracle.com, ee@angkormiracle.com, em@angkormiracle.com', 'acc@angkormiracle.com', '+855 87 882 244', '+855 87 882 244', '+855 63 969 900', 'http://angkormiracle.com/resort', 1, 5.0, 247, '2015-11-30', NULL, '150', NULL, 3, 13, '2018-08-29 21:32:57', '2018-08-29 21:32:57', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (87, 'Nagara Angkor Boutique Hotel ', 'Sok San Road, Stueng Thmei Village, Svay Dangkum Commune', 1, 1, '17252', 'Mr. Sophat', 'booking@nagaraangkor-boutique.com', 'booking@nagaraangkor-boutique.com', 'account@nagaraangkor-boutique.com', '+855 70 559 536', '+855 70 559 536', '+855 63 766 082', 'http://nagaraangkor-boutique.com', 7, 3.5, 36, '2015-11-21', NULL, '150', NULL, 3, 13, '2018-08-29 21:35:10', '2018-08-29 21:35:10', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (88, 'Shadow of Angkor Guesthouse', 'No 353, Pokambor AV, on the river side, near Old Market', 1, 1, '17000', 'Nareth', 'shadowofangkor@gmail.com', 'bookings@shadowofangkor.com', 'shadowofangkor@gmail.com', '+855 12 968 881', '+855 12 968 881', '+855 63 964 774', 'http://shadowofangkor.com', 9, 1.0, 16, '2014-12-25', NULL, '70', NULL, 3, 13, '2018-08-29 21:37:22', '2018-08-29 21:37:22', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (89, 'Vilada Angkor Boutique', 'Kor Kranch Village, Sangkat Siem Reap', 1, 1, '17000', 'Mr. Seng Sakada', 'gm@viladaangkorboutique.com', 'gm@viladaangkorboutique.com', 'gm@viladaangkorboutique.com', '+855 12 565 856', '+855 12 565 856', '+855 17 688 568', 'http://viladaangkorboutique.com', 7, 4.0, 7, '2015-11-03', NULL, '70', NULL, 3, 13, '2018-08-29 21:40:23', '2018-08-29 21:40:23', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (92, 'La Residence Blanc D\'Angkor', ' #194 Krous Village, Svay Dangkum and 6th Street', 1, 1, '17000', 'Laot Tre', 'sm@residenceblancangkor.com', 'reservation@residenceblancangkor.com', 'accountant@residenceblancangkor.com, sm@residenceblancangkor.com', '+855 70 261 397', '+855 70 261 397', '+855 63 963 332', 'http://residenceblancangkor.com', 1, 4.0, 26, '2014-11-30', NULL, '90', NULL, 3, 12, '2018-11-01 15:22:30', '2018-11-01 15:22:30', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (93, 'The Unique Angkor Villa', ' # 558, Steung Thmey Village, Sangkat Svaydangkum', 1, 1, '17252', 'Mr. Loy Salith', 'info@theuniqueangkorvilla.com', 'info@theuniqueangkorvilla.com, reservation@theuniqueangkorvilla.com', 'info@theuniqueangkorvilla.com', '+855 93 305 297', '+855 93 305 297', '+855 12 927 731', 'http://theuniqueangkorvilla.com', 3, 3.0, 18, '2015-02-07', NULL, '70', NULL, 3, 13, '2018-08-29 22:01:41', '2018-08-29 22:01:41', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (94, 'The One Villa Angkor', 'Just off Street 52, Sambour Village.  5km from Old Market area and Hotel Be.', 1, 1, '17000', 'Mr. Martin Dishman', 'md@theonehotelcollection.com', 'md@theonehotelcollection.com', 'md@theonehotelcollection.com', '+855 12 755 311', '+855 12 755 311', '+855 63 965 321', 'http://theonehotelangkor.com', 1, 5.0, 20, '2014-12-25', NULL, '45', NULL, 3, 13, '2018-08-29 22:04:16', '2018-08-29 22:04:16', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (96, 'CHEZ MOI SUITE', '#0378, Sombai road, Wat Damnak commune, Sangkat Salakamroeuk ', 1, 1, '17000', 'Ms. Vann Narin ', 'reservation@chezmoi.asia', 'reservation@chezmoi.asia', 'reservation@chezmoi.asia', '+855 12 584 897', '+855 12 584 897', '+855 63 765 995', 'http://suite.chezmoi.asia', 7, 4.0, 10, '2016-01-11', NULL, '60', NULL, 3, 12, '2019-06-14 09:08:29', '2019-06-14 09:08:29', 12, 2, 4, '2019-06-13', 'They want to save budget for low season ', 'Ms. Narin', '098 958 387', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (97, 'Siem Reap Vacation Hotel', 'Taneuy Street, Wat Bo Village, Salakamreuk Commune', 1, 1, '17000', 'Chuon Chantola', 'sales@siemreapvacationhotel.com', 'sales@siemreapvacationhotel.com', 'sales@siemreapvacationhotel.com', '+855 95 800 881', '+855 95 800 881', '+855 95 800 881', 'http://siemreapvacationhotel.com', 1, 3.0, 48, '2014-12-25', NULL, '50', NULL, 3, 13, '2018-08-29 22:12:47', '2018-08-29 22:12:47', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (98, 'Tropicana Residence & Resort', 'Angkor High School Road, Phum Wat Bo, Salakamreuk', 1, 1, '17000', 'Mr. Seang Sovann', 'rm@tropicanaresidence.com', 'reservation@tropicanaresidence.com', 'rm@tropicanaresidence.com, acc@tropicanaresidence.com', '+855 12 842 349', '+855 12 842 349', '+855 63 210 600', 'http://tropicanaresidence.com', 6, 4.0, 9, '2016-01-11', NULL, '75', NULL, 3, 13, '2018-08-29 22:16:28', '2018-08-29 22:16:28', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (100, 'Asia Tune Hotel', 'No. 85, St. 19 Corner 148, Sangkat Phsar Kandal 2, Khan Daun Penh', 1, 2, '', 'Oul Van', 'gm@asiatunehotel.com', 'asia-tune-hotel@googlegroups.com, hls.booking.system.pp@gmail.com', 'reservation@asiatunehotel.com, ap@asiatunehotel.com, om@asiatunehotel.com', '', '+855 23 977 789', '+855 85 266 668', 'http://asiatunehotel.com', 1, 4.0, 83, '2014-12-01', NULL, '125', NULL, 3, 12, '2019-05-02 10:46:47', '2019-05-02 10:46:47', 12, 2, 5, '2019-05-02', 'They want to prepare their property and they will back. ', 'Ms. LONG Kimly   ', 'Request by email ', 5, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (101, 'Bou Savy Villa', 'Sok San Road, Phum Svay Dangkum, Sangkat Svay Dangkum', 1, 1, '063', 'Mr. Horn Bovuth', 'info@bousavyvilla.com, bousavyvilla7777@hotmail.com', 'info@bousavyvilla.com, bousavyvilla7777@hotmail.com', 'info@bousavyvilla.com', '', '+855 12 898 627', '+855 12 898 627', 'http://bousavyvilla.com', 3, 3.5, 20, '2017-08-02', NULL, '40', NULL, 2, 12, '2018-11-01 15:26:24', '2018-11-01 15:26:24', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (102, 'Boutique Kampot Hotel', '#10 of 68 Specialty Lodging in Kampot 1 Ousaphea Village, Kampong Kandal', 1, 7, '', 'Mr. Nath kananda', 'kananda.nath@gmail.com', 'kananda.nath@gmail.com, duyen@whl.travel', 'kananda.nath@gmail.com', '', '+855 61 888 626', '+855 61 888 626', 'http://boutiquekampot.com', 7, 4.0, 18, '2018-01-29', NULL, '150', NULL, 2, 12, '2018-11-01 15:27:14', '2018-11-01 15:27:14', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (103, 'Bunwin Boutique Hotel', 'National Road 06, Phum Banteay Chas, Opposite Samaki Market', 1, 1, '', 'Mr. Chivid', 'reservation@bunwinboutique.com', 'reservation@bunwinboutique.com', 'account@bunwinboutique.com, reservation@bunwinboutique.com', '', '+855 63 969 158', '+855 12 346 644', 'http://bunwinboutique.com', 1, 4.0, 11, '2015-08-29', NULL, '80', NULL, 2, 12, '2018-11-01 15:27:49', '2018-11-01 15:27:49', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (104, 'Bunwin Plantation', 'Kakranh Village', 1, 1, '', 'Mr. Has Sophal', 'gm@bunwinboutique.com', 'reservation@bunwinplantation.com', 'reservation@bunwinplantation.com', '', '+855 17 310 229', '+855 17 310 229', 'http://plantation.bunwinplantation.com', 1, 3.0, 14, '2015-09-14', NULL, '55', NULL, 3, 12, '2018-09-02 14:02:00', '2018-09-02 14:02:00', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (105, 'Bunwin Residence', 'Kor Kranh Village ', 1, 1, '', 'Mr. Phasy Sun', 'reservation@bunwinresidence.com', 'reservation@bunwinresidence.com', 'reservation@bunwinresidence.com', '', '+855 63 763 677', '+855 71 368 2967', 'http://bunwinresidence.com', 3, 4.0, 10, '2015-09-14', NULL, '80', NULL, 3, 13, '2019-02-05 08:54:10', '2019-02-05 08:54:10', 13, 2, 5, '2019-02-04', 'Stop selling online', 'Chivid Yem', '(855) 12346644/86 24 06 89', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (106, 'Casa Villa Independence Boutique Hotel', '#4, Street 294, Boeung Keng Kong 1', 1, 2, '', 'Ms. Shierlyn', 'reservation@casa-villa.com', 'reservation@casa-villa.com, casavillareservation@gmail.com', 'reservation@casa-villa.com', '', '+855 23 211 729', '+855 96 856 2622', 'http://casa-villa.com', 1, 4.0, 12, '2015-01-01', NULL, '130', NULL, 2, 12, '2018-11-01 15:29:23', '2018-11-01 15:29:23', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (107, 'Central Boutique Angkor Hotel', 'In front of Sala Bai Hospitality School, Tapoul villa, Svay Dangkum commune.', 1, 1, '', 'Mr. Thorn Ve', 'info@centralboutiqueangkorhotel.com', 'info@centralboutiqueangkorhotel.com, dm@centralboutiqueangkor.com', 'info@centralboutiqueangkorhotel.com', '', '+855 63 764 030', '', 'http://centralboutiqueangkorhotel.com', 1, 3.0, 54, '2016-06-23', NULL, '150', NULL, 2, 12, '2018-11-01 15:30:17', '2018-11-01 15:30:17', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (108, 'Central Suite Residence', 'City Center, Sok San Road, Old Market Area', 1, 1, '17000', 'Ms. Kimly Cheak', 'relations@centralsuiteresidence.com', 'relations@centralsuiteresidence.com, om@centralsuiteresidence.com, gm@centralsuiteresidence.com', 'chief-ac@centralsuiteresidence.com, gm@centralsuiteresidence.com', '', '+855 63 969 691', '+855 95 907 676', 'http://centralsuiteresidence.com', 1, 4.0, 32, '2016-03-03', NULL, '60', NULL, 3, 12, '2018-09-02 14:14:07', '2018-09-02 14:14:07', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (109, 'Chateau The Meliya Hotel & Apartment', '10B, St. 264, Sangkat Chaktomuk,  Khan Doun Penh', 1, 2, '', 'Mrs.  ABDOUNE', 'jessica.a@chateauthemeliya.com', 'jessica.a@chateauthemeliya.com, reservation@chateauthemeliya.com', 'jessica.a@chateauthemeliya.com, sreypich.1992@gmail.com', '', '+855 23 987 212', '+855 16 747 524', 'http://chateauthemeliya.com', 1, 4.0, 54, '2017-03-20', NULL, '120', NULL, 3, 12, '2019-07-01 11:24:50', '2019-07-01 11:24:50', 12, 2, 5, '2019-07-01', 'They have a new property and their management team wants to change to another system.', 'Samkot LY ', 'Sent email ', 5, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (110, 'Colina Boutique Hotel', 'No. 26,  At corner of street 123 and 440, Tuoltompoung I, Chamkarmorn', 1, 2, '', 'Mr. Prosa', 'om@colinaboutiquehotel.com', 'fo@colinaboutiquehotel.com', 'account@colinaboutiquehotel.com', '', '+855 23 221 088', '', 'http://colinaboutiquehotel.com', 7, 4.0, 44, '2015-04-03', NULL, '60', NULL, 3, 12, '2018-09-02 14:40:53', '2018-09-02 14:40:53', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (111, 'Cubby House Resort', 'Otres River Village', 1, 6, '', 'Kamala Thomas', 'info@cubbyhouse.asia', 'info@cubbyhouse.asia', 'info@cubbyhouse.asia', '', '+855016388573', '+855016388573', 'http://cubbyhouse.asia', 8, 2.5, 2, '2015-10-27', NULL, '100', NULL, 2, 12, '2018-11-01 15:32:27', '2018-11-01 15:32:27', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (112, 'Damnak Villa Retreat ', ' | #92,Group#6,Trapeang Ses, Kork Chak, Siem Reap, Cambodia', 1, 1, '17252', 'Mr. Sophal Phoeun ', 'info@damnakvillaretreat.com', 'info@damnakvillaretreat.com', 'info@damnakvillaretreat.com', '+855 77 979 711', '+855 77 979 711', '+855 77 979 711', 'http://damnakvillaretreat.com', 3, 3.0, 6, '2018-07-21', NULL, '85', NULL, 2, 12, '2018-11-01 15:37:08', '2018-11-01 15:37:08', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (113, 'Damrei Angkor Hotel', 'Street 20, Wat Bo Village, Salakomroek Commune', 1, 1, '', 'Mr. Sombo', 'info@damreiangkorhotel.com', 'reservations@damreiangkorhotel.com ', 'info@damreiangkorhotel.com', '', '+855 63 968 717', '+855 16 885 378', 'http://damreiangkorhotel.com', 1, 4.0, 50, '2017-06-12', NULL, '100', NULL, 2, 12, '2018-11-01 15:39:22', '2018-11-01 15:39:22', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (114, 'De I\'homme ', 'Phnom Penh', 1, 2, '', 'Mr. Peter', 'reservation@hoteldelhomme.com', 'reservation@hoteldelhomme.com', 'reservation@hoteldelhomme.com', '', '+855 96 829 3544', '+855 23 211 498', 'http://deihomme.com', 1, 4.0, 15, '2018-03-29', NULL, '100', NULL, 3, 13, '2019-05-29 09:38:58', '2019-05-29 09:38:58', 13, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (115, 'De Sarann Suites', '#092, Group 6, Trapeang Ses Village | Sangkat Kork Chork, Siem Reap', 1, 1, '', 'Mr. Mike Hob', 'info@desarannvilla.com, info@desarannsuites.com', 'info@desarannvilla.com, info@desarannsuites.com, duyen@whl.travel', 'info@desarannvilla.com, info@desarannsuites.com', '', '+855 63 900 050', '+855 88 299 9923', 'http://desarannsuites.com', 1, 4.0, 8, '2016-08-19', NULL, '80', NULL, 3, 12, '2018-09-02 14:58:51', '2018-09-02 14:58:51', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (116, 'De Sarann Villa', '#37 Trang Village, Sangkat Slorkram', 1, 1, '', 'Mr. Andrew Pan', 'info@desarannvilla.com', 'info@desarannvilla.com', 'info@desarannvilla.com', '', '+855 88 299 9923', '+855 97 750 8545', 'http://desarannvilla.com', 3, 4.0, 4, '2016-03-27', NULL, '80', NULL, 3, 12, '2018-09-02 15:01:36', '2018-09-02 15:01:36', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (117, 'Dechasey Residence', 'Off Route Six, About 300 meters down Korean-Cambodian Friendship Rd', 1, 1, '', 'Mr. Kim May', 'operation@dechaseyresidence.com', 'operation@dechaseyresidence.com', 'operation@dechaseyresidence.com', '', '+855 63 965 945', '+855 15 374 477', 'http://communityresidencesiemreap.com', 1, 4.0, 10, '2017-04-28', NULL, '40', NULL, 3, 13, '2018-10-31 13:56:45', '2018-10-31 13:56:45', 13, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (118, 'Demo', 'slarkram', 1, 1, '17000', 'Mr. Maco', 'info@eocambo.com', 'info@eocambo.com', 'info@eocambo.com', '+855 69 955 179', '+855 69 955 179', '+855 77 466 082', 'http://eocambo.com', 6, 5.0, 20, '2018-07-02', NULL, '1', NULL, 1, 2, '2019-01-02 16:05:01', '2019-01-02 16:05:01', 2, 2, 5, '1970-01-01', '', '', '', 4, '2019-01-24 00:00:00');
INSERT INTO `eot_customer` VALUES (119, 'Dinata Angkor Boutique', 'Taphul Road, Svay Dangkum Commune', 1, 1, '', 'Mr. Heng Sothea', 'gm@dinataangkor.com', 'gm@dinataangkor.com', 'gm@dinataangkor.com', '', '+855 63 968 836', '+855 77 447 900', 'http://dinataangkor.com', 7, 3.0, 28, '2017-09-22', NULL, '100', NULL, 3, 13, '2019-02-05 08:51:10', '2019-02-05 08:51:10', 13, 2, 5, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (120, 'Dom Boutique Hotel', 'Wat Damnak village, Sangkat Sala Kamreuk Siem Reap Cambodia', 1, 1, '', 'Mr. Paolo', 'domsiemreap@gmail.com', 'domsiemreap@gmail.com', 'domsiemreap@gmail.com', '', '+855 96 330 6403', '+855 68 639 123', 'http://domsiemreap.com/en-us', 7, 3.0, 26, '2018-04-06', NULL, '30', NULL, 3, 12, '2018-09-02 15:28:07', '2018-09-02 15:28:07', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (121, 'Double Leaf Boutique Hotel', '#32, Street 123, Toul Tom Pong I, Khan Chamkamon', 1, 2, '', 'Mr. Phanith Lmoth', 'gm@doubleleafhotel.com', 'info@doubleleafhotel.com, hls.booking.system.pp@gmail.com', 'gm@doubleleafhotel.com', '', '+855 23 226 299', '+855 23 226 299', 'http://doubleleafhotel.com', 7, 4.0, 48, '2014-12-01', NULL, '166.5', NULL, 3, 12, '2018-09-02 15:32:15', '2018-09-02 15:32:15', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (122, 'Dyna Boutique Hotel', 'Phum Salar Kanseng, Khum Svay DangKum', 1, 1, '', 'Mr. Vorn Savoeun', 'gm@dynaboutiquehotel.com', 'gm@dynaboutiquehotel.com', 'gm@dynaboutiquehotel.com', '', '+855 63 968 881', '+855 77 529 856', 'http://dynaboutiquehotel.com', 7, 3.0, 12, '2015-03-30', NULL, '75', NULL, 3, 12, '2018-09-02 15:45:54', '2018-09-02 15:45:54', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (123, 'Eco Villa', '# Road 30, Behind Krous High School, Infront of Tropical Restaurant, Kruos, Siem Reap', 1, 1, '', 'Mr. Den', 'den@ehotelbiz.com', 'den@ehotelbiz.com, royal@ehotelbiz.net', 'den@ehotelbiz.com', '', '+855 92 307 314', '', 'http://ecovillasiemreap.com', 3, 4.0, 10, '2017-02-09', NULL, '60', NULL, 3, 12, '2018-09-02 15:48:26', '2018-09-02 15:48:26', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (124, 'eOcambo Residence', '#Street 22 (Tea Csales@eocamboresidence.comhamrat), Wat Bo Village, Siem Reap', 1, 1, '', 'Mr. Peter Phich', 'reservation@eocamboresidence.com', 'gm@eocambo.com, sales@eocamboresidence.com, reservation@eocamboresidence.com, peter@eocambo.com, kimkhorn@eocambo.com', 'sales@eocamboresidence.com', '', '+855 70 379 905', '+855 92 991 005', 'http://eocamboresidence.com', 1, 4.0, 22, '2017-08-09', NULL, '100', NULL, 2, 12, '2018-11-01 15:41:56', '2018-11-01 15:41:56', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (125, 'eOcambo Resort', 'BBU Road, Vihear Chen Village, Sangkat Svay Dangkum, Siem Reap', 1, 1, '17252', 'Mr. Peter Phich', 'peter@eocambo.com', 'info@eocamboresort.com, sales@eocamboresidence.com, peter@eocambo.com, kimkhorn@eocambo.com, gm@eocambo.com', 'peter@eocambo.com', '', '+855 70 379 905', '+855 70 379 905', 'http://eocamboresort.com', 6, 5.0, 28, '2018-08-02', NULL, '1', NULL, 2, 12, '2018-11-01 15:42:47', '2018-11-01 15:42:47', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (126, 'eOCambo Villa', 'BBU road, Vihear Chen Village, Svaydangkum Cummune, Siem Reap', 1, 1, '', 'Mr. Peter', 'info@eocambovilla.com', 'info@eocambovilla.com, gm@eocambo.com, peter@eocambo.com', 'info@eocambovilla.com', '', '+855 70 379 905', '+855 70 379 905', 'http://villa.eocambovilla.com', 3, 2.0, 8, '2017-05-30', NULL, '40', NULL, 2, 12, '2018-11-01 15:43:39', '2018-11-01 15:43:39', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (127, 'eOcambo Village', 'Street 22 (Tea Chamrat), Wat Bo Village', 1, 1, '', 'Mr. Peter Phich', 'reservation@eocambovillage.com', 'kimkhorn@eocambo.com, gm@eocambo.com, reservation@eocambovillage.com, peter@eocambo.com, sales@eocamboresidence.com', 'sales@eocamboresidence.com', '', '+855 70 379 905', '+855 92 991 005', 'http://eocambovillage.com', 1, 4.0, 28, '2017-08-19', NULL, '40', NULL, 2, 12, '2018-11-01 15:44:50', '2018-11-01 15:44:50', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (128, 'F&B Hostel', 'Sok San Road, Phum Svay Dangkum, Sangkat Svay Dangkum', 1, 1, '', 'Mr. Vannak', 'phoanvannak@gmail.com', 'phoanvannak@gmail.com', 'phoanvannak@gmail.com', '', '+855 89 672 722', '+855 98 640 885', 'http://fbsiemreaphostel.com', 1, 3.0, 12, '2017-08-09', NULL, '100', NULL, 3, 12, '2018-09-02 16:04:51', '2018-09-02 16:04:51', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (129, 'Fancy Boutique Villa', 'Samdach Tep Vong Street, Group 2, Steung Thmey Village, Sangkat Svaydangkom', 1, 1, '', 'Mr.Krishna ', 'gm@fancyboutiquevilla.com', 'book@fancyboutiquevilla.com, gm@fancyboutiquevilla.com', 'book@fancyboutiquevilla.com, gm@fancyboutiquevilla.com', '', '+855 63 965 377', '+855 70 892 850', 'http://fancyboutiquevilla.com', 7, 4.0, 13, '2016-01-15', NULL, '90', NULL, 3, 12, '2018-09-02 16:07:20', '2018-09-02 16:07:20', 12, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (130, 'Fancy Guest House', 'No. 169B, Street 15, Phsar Kandal 2, Khan Daun Penh', 1, 2, '', 'Mr. Phannak ', 'fancyguesthouse@yahoo.com', 'fanscyguesthouse@yahoo.com', 'fancyguesthouse@yahoo.com', '', '+855 23 211 829', '+855 11 943 219', 'http://fancyguesthouse.com', 9, 0.0, 21, '2014-10-20', NULL, '85', NULL, 3, 12, '2018-09-02 16:10:12', '2018-09-02 16:10:12', 12, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (131, 'Feliz Hostel Cafe & Bar', 'Z6-132, St 51, Buoeng Keng Kong 1 Commune, Chamkarmon District', 1, 2, '12302', 'Mr. Arun Raing', ' bookings@felizhostel.com', 'bookings@felizhostel.com', 'felizhostel@gmail.com', '', '+855 23 216 596', '+855 17 664 495', 'http://felizhostel.com', 2, 3.0, 18, '2016-07-12', NULL, '100', NULL, 2, 12, '2018-11-01 15:45:31', '2018-11-01 15:45:31', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (132, 'Feliz Urban Hotel', ' #3 Bis, Street 288, Boeung Keng Kang Commune, Chamkarmon District, PhnomPenh', 1, 2, '12302', 'Mr. Arun Raing', 'generalmanager.feliz@gmail.com', 'felizurbanhotel@gmail.com', 'panharith.sitthy@gmail.com', '', '+855 23 212 555', '+855 17 664 495', 'http://', 1, 4.0, 36, '2017-03-09', NULL, '150', NULL, 2, 12, '2018-11-01 15:46:49', '2018-11-01 15:46:49', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (133, 'Flourishing Boutique Hotel', 'Country Road Wat Chowk, Svay Dangkum, Siem Reap, Cambodja', 1, 1, '', 'Mr. CHHAI', 'info@flourishingboutique.com', 'info@flourishingboutique.com, reservation@flourishingboutique.com', 'info@flourishingboutique.com', '', '+855 61 222 637', '+855 70 643 747', 'http://flourishingboutique.com', 1, 4.0, 6, '2016-10-31', NULL, '70', NULL, 3, 12, '2018-09-02 16:20:40', '2018-09-02 16:20:40', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (134, 'G & Z Angkor Hotel', 'Siem Reap', 1, 1, '', 'Mr. Sarat Yoeung', 'Sarath.y@wegoalconsulting.com', 'Sarath.y@wegoalconsulting.com', 'Sarath.y@wegoalconsulting.com', '+855 10 339 235', '+855 10 339 235', '+855 10 339 235', 'http://gzangkorhotel.com', 1, 3.0, 21, '2018-04-30', NULL, '40', NULL, 3, 13, '2018-09-07 09:08:14', '2018-09-07 09:08:14', 13, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (135, 'G & Z Angkor Boutique', 'Siem Reap', 1, 1, '', 'Mr. David Chhun', 'gm@gzinvestmentgroups.com', 'reservations@gzinvestmentgroups.com', 'account@gzinvestmentgroups.com', '', '+855 87 757 555', '+855 87 757 555', 'http://gzangkorboutique.com', 7, 4.0, 18, '2018-04-30', NULL, '60', NULL, 3, 12, '2018-09-02 16:26:17', '2018-09-02 16:26:17', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (136, 'Garden Flower Resort ', ' Phum Khnar, Khum Chreav, Siem Reap district,Siem Reap province', 1, 1, '17256', 'Mr. Oem Sopha', 'info@gardenflowerresort.com', 'info@gardenflowerresort.com', 'info@gardenflowerresort.com', '', '+855 96 868 6296', '', 'http://gardenflowerresort.com', 6, 4.0, 30, '2019-02-08', NULL, '157', NULL, 3, 12, '2019-03-23 08:45:12', '2019-03-23 08:45:12', 12, 14, 5, '2019-03-22', 'They don\'t have any OTAs that make a reservation and they want to prepare their property.', 'General Manager (B Nisa)', '+855 78 299 995', 5, '2019-02-12 00:00:00');
INSERT INTO `eot_customer` VALUES (137, 'GBT 3 Guesthouse', 'Serendipity Street', 1, 6, '1800', 'Mr. Hom Sokleng', 'gbt_beach@yahoo.com', 'gbt_beach@yahoo.com', 'gbt_beach@yahoo.com', '', '+855 16 777 818', '+855 16 999 818', 'http://gbt3guesthouse.com', 9, 2.0, 46, '2015-05-07', NULL, '150', NULL, 3, 12, '2018-09-02 16:35:57', '2018-09-02 16:35:57', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (138, 'Genevieve\'s Khmer Villa', '#0141, Wat Damnak Street, Old Market', 1, 1, '', 'Mr. Bill Longo', 'billlongotemp@gmail.com', 'booking@damnakriverside.com', 'booking@damnakriverside.com', '', '+855 63 966 566', '+855 70 245 189', 'http://genevieveskhmervilla.com', 1, 3.0, 29, '2017-09-14', NULL, '125', NULL, 3, 12, '2018-09-02 16:37:57', '2018-09-02 16:37:57', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (139, 'Glory Angkor Hotel', 'Wat Bo Road, Wat Bo Village,  Salakormrouk Commune, ', 1, 1, '', 'Chhem Samnang', 'info@gloryangkorhotel.com', 'info@gloryangkorhotel.com', 'info@gloryangkorhotel.com', '', '+855 12 366 657', '+855 63 966 687', 'http://gloryangkorhotel.com', 1, 4.0, 16, '2018-02-02', NULL, '60', NULL, 2, 12, '2018-11-01 15:48:23', '2018-11-01 15:48:23', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (140, 'Golden Banana Residence ', 'Siem Reap', 1, 1, '', 'Mr. Laot Tre', 'gm@golden-banana.com', 'booking@golden-banana.com, sales@golden-banana.com, sales@villawatdamnak.com, sales@residencewatdamnak.com', 'gm@golden-banana.com, accountant@residencewatdamnak.com', '', '+855 70 261 397', '+855 70 261 397', 'http://golden-banana.com', 1, 3.0, 30, '2017-12-04', NULL, '30', NULL, 3, 13, '2018-10-31 13:50:52', '2018-10-31 13:50:52', 13, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (141, 'Golden Butterfly Villa', 'Stung Thmey, Svay Dangkum near Pub Street, Pub Street Alley', 1, 1, '1710', 'Mr. Chen ', 'info@goldenbutterflyvilla.com', 'reservations@goldenbutterflyvilla.com', 'info@goldenbutterflyvilla.com', '', '+855 96 801 0338', '+855 92 646 439', 'http://goldenbutterflyvilla.com', 3, 3.0, 25, '2016-08-29', NULL, '100', NULL, 2, 12, '2018-11-01 15:49:04', '2018-11-01 15:49:04', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (142, 'Golden House International Hotel', '#23-25 St.136, Phsar Kandal 1  Daun Penh', 1, 2, '12204', 'Mrs. Lim Siv Mey', 'mail@goldenhouse.asia', 'stay@goldenhouse.asia, mail@goldenhouse.asia, hls.booking.system.pp@gmail.com', 'mail@goldenhouse.asia, stay@goldenhouse.asia', '', '+855 23 222 167', '+855 95 566 766', 'http://goldenhouse.asia', 1, 3.0, 21, '2014-08-19', NULL, '155', NULL, 2, 12, '2018-11-01 15:50:57', '2018-11-01 15:50:57', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (143, 'Golden Mango Inn', 'Road 6, Chongkaosou Village, Slorkram Commune', 1, 1, '', 'Mr. Cheab Sokvann', 'info@goldenmangoinn.com ', 'info@goldenmangoinn.com', 'info@goldenmangoinn.com ', '', '+855 63 761 857', '+855 12 952 741', 'http://goldenmangoinn.com', 1, 3.0, 24, '2017-06-16', NULL, '50', NULL, 3, 12, '2018-11-01 12:04:33', '2018-11-01 12:04:33', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (144, 'Golden Sand Hotel ', 'Ochheuteal beach, St. 23 Tola, Sangkat 4', 1, 6, '', 'Mr. Sok Sopheng', 'info@goldensandhotel.com.kh', 'sales@goldensandhotel.com.kh ', 'acc@goldensandhotel.com.kh', '', '+855 34 933 607', '+855 93 776 666', 'http://goldensandhotel.com.kh', 1, 4.0, 120, '2015-03-18', NULL, '120', NULL, 3, 12, '2018-09-02 16:53:57', '2018-09-02 16:53:57', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (145, 'Golden Sea Beach Hotel & Casino', 'Victory Beach, Vithey Krong, Sangkat 3', 1, 6, '', 'Mr. Chang Suk Oh', 'hotel@goldenseabeach.com', 'goldenseabeach567@gmail.com', 'goldenseabeach567@gmail.com', '', '+855 12 603 600', '+855 16 896 600', 'http://goldenseabeach.com', 1, 4.0, 40, '2015-01-26', NULL, '185', NULL, 3, 12, '2018-09-02 16:56:08', '2018-09-02 16:56:08', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (146, 'Golden Sea Hotel & Casino', 'Ekareach St,Sangkat3, Sihanouk vill Preach Sihanouk Province,Kingdom of Cambodia', 1, 6, '', 'Mr. Charkrong Chhong', 'gm@goldenseahotels.com', 'sales@goldenseahotels.com  ', 'fn@goldenseahotels.com', '', '+855 92 230 888', '+855 97 276 8780', 'http://goldenseahotels.com', 1, 4.0, 105, '2016-06-27', NULL, '35', NULL, 3, 12, '2018-09-02 16:58:39', '2018-09-02 16:58:39', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (147, 'Golden Temple Boutique', 'Steung Thmey Village, Savay Dangkum Commune, Siem Reap', 1, 1, '17252', 'Mr. Chot Barang', 'reservations@goldentempleboutique.com', 'reservations@goldentempleboutique.com', 'reservations@goldentempleboutique.com', '', '+855 63 212 222', '+855 98 374 079', 'https://www.goldentempleboutique.com/home', 7, 4.0, 19, '2017-07-21', NULL, '115', NULL, 3, 12, '2018-09-02 17:01:27', '2018-09-02 17:01:27', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (148, 'Golden Temple Hotel', '7 Makara road, or Angkor High School road', 1, 1, '', 'Mr. Luon Thea', 'info@goldentemplehotel.com, fom@goldentemplehotel.com, gm@goldentempleresidence.com', 'reservation@goldentemplehotel.com, fom@goldentemplehotel.com', 'reservation@goldentemplehotel.com, gm@goldentemplehotel.com, ac@goldentemplehotel.com, fom@goldentemple.com, info@goldentemplehotel.com', '', '+855 63 967 996', '+855 12 756 655', 'http://goldentemplehotel.com', 7, 4.0, 29, '2015-09-28', NULL, '115', NULL, 3, 12, '2018-09-02 17:03:33', '2018-09-02 17:03:33', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (149, 'Golden Temple Retreat', 'Wat Damnak, Sala Kamreuk, Siem Reap', 1, 1, '17252', 'Mr. Loun Thea', 'gm@goldentempleretreat.com, it@goldentempleresidence.com', 'reservation@goldentempleretreat.com', 'ac@goldentempleretreat.com', '', '+855 63 217 777', '', 'http://retreat.goldentempleretreat.com', 1, 4.0, 32, '2016-12-22', NULL, '115', NULL, 3, 12, '2018-09-02 17:10:27', '2018-09-02 17:10:27', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (150, 'Golden Temple Villa', 'Sok San Road, Svay Dangkum', 1, 1, '17252', 'Mr. Luon Thea', 'reservations@goldentemplevilla.com, info@goldentempleresidence.com', 'reservations@goldentemplevilla.com', 'gm@goldentemplevilla.com, acm@goldentemplevilla.com', '', '+855 12 794 938', '+855 12 794 938', 'http://villa.goldentemplevilla.com', 3, 4.0, 23, '2015-10-16', NULL, '115', NULL, 3, 12, '2018-09-02 17:13:13', '2018-09-02 17:13:13', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (151, 'Grand Elevation Hotel ', 'House G6 G7 G8, St. Sothearos, Tonle Basac Charmkarmon, Chamkar Morn, Phnom Penh, Cambodia', 1, 2, '', 'Ms. Nimol Tha', 'elevation.hotel@yahoo.com', 'elevation.hotel@yahoo.com', 'elevation.hotel@yahoo.com', '', '+855 77 556 528', '+855 77 556 528', 'https://grandelevationhotel.com', 1, 3.0, 54, '2018-08-16', NULL, '90', NULL, 2, 12, '2018-11-01 15:52:01', '2018-11-01 15:52:01', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (152, 'Green Amazon Residence', 'Phneachey Village, Svay Dangkom Commune', 1, 1, '', 'Mr. Phu Vireak', 'book@greenamazonresidence.com', 'book@greenamazonresidence.com', 'book@greenamazonresidence.com, fc@greenamazonresidence.com', '', '+855 63 767 7000', '+855 63 767 7000', 'http://greenamazonresidence.com', 1, 4.0, 52, '2017-12-04', NULL, '60', NULL, 3, 12, '2018-09-02 17:32:34', '2018-09-02 17:32:34', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (153, 'La Parranda Residence & Hotel', 'No.207, St. Mao Tsetoung, Sangkat Toul Svay Prey 2, Khan Chomkamorn', 1, 2, '', 'Ms. Sothy Samrith', 'info@laparrandahotels.com', 'ecommerce@laparrandahotels.com', 'sale@laparrandahotels.com', '', '+855 23 424 106', '+855 12 212 100', 'http://laparrandahotels.com', 1, 3.0, 56, '2015-03-05', NULL, '60', NULL, 3, 12, '2018-09-02 17:34:54', '2018-09-02 17:34:54', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (154, 'KT Apartment Siem Reap', 'Street 26, Siem Reap', 1, 1, '', 'Mr. Piseth', 'info@kt-apartments.com', 'info@kt-apartments.com', 'info@kt-apartments.com', '', '+855 12 415 774', '+855 87 396 999', 'http://kt-apartments.com', 5, 0.0, 12, '2017-05-12', NULL, '80', NULL, 2, 12, '2018-11-01 15:53:05', '2018-11-01 15:53:05', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (155, 'Kralanh Petite Villa', 'Veal Village | Sangkat Kouk Chork', 1, 1, '', 'Mr. Srey Meng Ly', 'gm@kralanhpetitevilla.com', 'reservation@kralanhpetitevilla.com', 'gm@kralanhpetitevilla.com', '', '+855 17 597 513', '+855 60 486 666', 'http://kralanhpetitevilla.com', 3, 3.5, 6, '2016-04-21', NULL, '40', NULL, 3, 12, '2018-09-02 17:42:32', '2018-09-02 17:42:32', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (156, 'KOUPREY HOTEL', 'Top Town Road, Krous Village, Svay Dangkum', 1, 1, '', 'Mr. Korm Sopheng', 'info@hotelkoupreyangkor.org', 'info@hotelkoupreyangkor.org', 'info@hotelkoupreyangkor.org', '', '+855 63 765 674', '+855 95 595 943', 'http://hotelkoupreyangkor.org', 1, 3.5, 57, '2015-10-01', NULL, '50', NULL, 3, 12, '2018-09-02 17:44:53', '2018-09-02 17:44:53', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (157, 'Kolab Sor Phnom Penh Hotel', '#436, Street 310, Sangkat Boeung Keng Kang III, Khan Chamkarmon', 1, 2, '', 'Ms. KEO SONY', 'info@kolabsorhotel.com ', 'onewoman168@gmail.com, info@kolabsorhotel.com', 'koesony@kolabsorhotel.com, info@kolabsorhotel.com', '', '+855 12 802 707', '+855 23 979 798', 'http://kolabsorhotel.com', 1, 4.0, 52, '2015-02-04', NULL, '126', NULL, 2, 12, '2018-11-01 15:53:47', '2018-11-01 15:53:47', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (158, 'Koh Rong Love Resort', 'Koh Rong Island , Sok San Village, Sangkat Koh Rong, Sihanouk Ville, Sihanouk province', 1, 6, '', 'Mr. Sitha Nhem ', 'gm@kohrongloveresort.com', 'gm@kohrongloveresort.com', 'gm@kohrongloveresort.com', '', '+855 16 963 198', '+855 85 311 161', 'http://kohrongloveresort.com', 6, 0.0, 48, '2017-10-09', NULL, '150', NULL, 2, 12, '2018-11-01 15:55:16', '2018-11-01 15:55:16', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (159, 'Klampuu Villa Hostel', 'st 53, Stueng Thmei Village, Svay Dangkum Commune', 1, 1, '', 'Mr. Long Vansak', 'long.vansak@gmail.com', 'long.vansak@gmail.com', 'long.vansak@gmail.com', '', '+855 10 556 191', '+855 10 556 191', 'http://klampuuvillahostel.com', 2, 3.0, 11, '2018-01-03', NULL, '80', NULL, 3, 13, '2018-10-31 13:09:26', '2018-10-31 13:09:26', 13, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (160, 'Klampuu Villa', 'Street 53, Stueng Thmei Village, Svay Dangkum Commune', 1, 1, '17252', 'Mr. Long Vansak', 'long.vansak@gmail.com', 'long.vansak@gmail.com', 'long.vansak@gmail.com', '', '+855 12 926 020', '+855 10 556 191', 'http://klampuuvilla.com', 3, 3.0, 11, '2017-10-31', NULL, '90', NULL, 2, 12, '2018-11-01 15:55:53', '2018-11-01 15:55:53', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (161, 'King Rock Boutique Hotel', 'Group #7, Wat Damnak, Sala Kamreouk', 1, 1, '17254', 'Mr. Hem Sophoun', 'om@kingrockboutique.com', 'om@kingrockboutique.com, room@kingrockboutique.com, info@kingrockboutique.com', 'account@kingrockboutique.com', '', '+855 63 766 141', '+855 10 712 425', 'http://kingrockboutique.com', 7, 4.0, 18, '2016-06-25', NULL, '50', NULL, 3, 12, '2018-09-02 17:57:32', '2018-09-02 17:57:32', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (162, 'King Boutique Hotel', '251 Samdach Tep Vong, Siem Reap 17252', 1, 1, '', 'Mr. Sam', 'kingboutiquehotel@gmail.com', 'kingboutiquehotel@gmail.com', 'kingboutiquehotel@gmail.com', '', '+855 63 760 655', '+855 12 930 011', 'http://kingboutiquehotel.com', 1, 3.0, 24, '2016-10-19', NULL, '45', NULL, 3, 12, '2018-09-02 17:59:30', '2018-09-02 17:59:30', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (163, 'Khmere Maison D\'Angkor', '#482, BO POX 93090, City Center, National Road No.6, Wat Kesaram Street, Sangkat Svay Dangkum,', 1, 1, '17000', 'Jacky LONG ', 'jacky@khmeremaisondangkor.com', 'relations@khmeremaisondangkor.com', 'jacky@khmeremaisondangkor.com', '', '+855 63 766 062', '+855 12 660 160', 'http://khmeremaisondangkor.com', 7, 3.0, 6, '2015-11-02', NULL, '30', NULL, 3, 12, '2018-09-02 18:03:37', '2018-09-02 18:03:37', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (164, 'Khmer Wooden Hostel', '#144, Taphul Village, Svaydangkum', 1, 1, '', 'Ms. Vichna Run', 'info@khmerwoodenhostel.com', 'info@khmerwoodenhostel.com', 'info@khmerwoodenhostel.com', '', '+855 63 965 444', '+855 12 458 338', 'http://khmerwoodenhostel.com', 2, 0.0, 4, '2016-02-23', NULL, '100', NULL, 3, 12, '2018-09-02 18:05:41', '2018-09-02 18:05:41', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (165, 'Khmer Mansion Residence', 'Sok San Street, Stung Thmey Village, Svay Dangkum Commune', 1, 1, '', 'Ms. Chea Komrong', 'reservation@khmermansionresidence.com, gm@khmermansionresidence.com', 'reservation@khmermansionresidence.com, gm@khmermansionresidence.com, chhnakchhai99@gmail.com', 'accountant@khmermansionresidence.com', '', '+855 63 762 333', '+855 77 708 558', 'http://khmermansionresidence.com/residence.html', 1, 3.0, 47, '2017-08-29', NULL, '50', NULL, 2, 12, '2018-11-01 15:57:48', '2018-11-01 15:57:48', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (166, 'Khmer Mansion Boutique Hotel', 'Sok San Street, Stung Thmer Village, Svay Dangkum Commune', 1, 1, '', 'Ms. Chea Komrong', 'gm@khmermansion.com', 'gm@khmermansion.com', 'accountant@khmermansion.com', '', '+855 63 762 333', '+855 77 708 558', 'http://khmermansion.com', 1, 4.0, 22, '2017-06-01', NULL, '50', NULL, 2, 12, '2018-11-01 15:58:17', '2018-11-01 15:58:17', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (167, 'Khavi Villa', '#12 st 258', 1, 2, '', 'Mr. Khavi Sang', 'khavicambodia@yahoo.com', 'khavicambodia@yahoo.com', 'khavicambodia@yahoo.com', '', '+855 12 766 624', '', 'http://khavivilla.com', 3, 4.0, 23, '2015-02-24', NULL, '150', NULL, 3, 12, '2018-09-02 18:15:26', '2018-09-02 18:15:26', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (168, 'Khavi Guesthouse', '#7DD, Street 258 , S/K Chaktomuk, Khan Daun Penh', 1, 2, '', 'Mr. Khavi Sang', 'khavicambodia@yahoo.com', 'khavicambodia@yahoo.com', 'khavicambodia@yahoo.com', '', '+855 23 632 4466', '+855 12 766 624', 'http://khavi-guesthouse.com', 9, 3.0, 23, '2015-02-23', NULL, '100', NULL, 3, 12, '2018-09-02 18:18:02', '2018-09-02 18:18:02', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (169, 'Kafu Resort and Spa', 'River Road, Slarkram Commune', 1, 1, '', 'Ms. Vann Narin', 'info@kafu-resort.com', 'info@kafu-resort.com', 'info@kafu-resort.com', '', '+855 63 964 242', '+855 15 364 686', 'http://kafu-resort.com', 1, 3.0, 28, '2017-11-10', NULL, '60', NULL, 3, 12, '2019-06-14 08:58:55', '2019-06-14 08:58:55', 12, 2, 5, '2019-06-14', 'They want to save budget for low season', 'Mr. Pisith Roeum', 'By Email ', 5, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (170, 'Jasmin Monument Hotel', ' #22s, Street 29, BKK1, Tonlebassac, Chamkarmon', 1, 2, '', 'Mr. Sok Chan', 'gm@j-monumenthotel.com', 'manager@j-monumenthotel.com, gm@j-monumenthotel.com, stay@j-monumenthotel.com', 'manager@j-monumenthotel.com, gm@j-monumenthotel.com', '', '+855 23 221 322', '+855 86 565 959', 'http://j-monumenthotel.com', 1, 4.0, 23, '2017-04-20', NULL, '100', NULL, 3, 13, '2019-01-15 09:21:01', '2019-01-15 09:21:01', 13, 2, 5, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (171, 'Isann Villa', 'Svay Dongkom,', 1, 1, '', 'Mr. Sothea Seng', 'sothea@mahobkhmer.com', 'sothea@mahobkhmer.com', 'sothea@mahobkhmer.com', '', '+855 12 926 562', '+855 12 926 562', 'http://isannvilla.com', 3, 3.0, 15, '2018-02-01', NULL, '100', NULL, 3, 13, '2018-09-07 09:08:26', '2018-09-07 09:08:26', 13, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (172, 'Isann Lodge', 'Chong Kao Su Village, Sangkat Slor Kram', 1, 1, '', 'Mr. Sothea Seng ', 'info@isannlodge.com', 'info@isannlodge.com', 'info@isannlodge.com', '', '+855 63 966 986', '+855 12 926 562', 'http://isannlodge.com', 6, 3.5, 12, '2017-06-21', NULL, '100', NULL, 3, 12, '2018-09-02 18:33:33', '2018-09-02 18:33:33', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (173, 'Indradevi Boutique Hotel', 'Krous Village, Svay Dankum, Sieam Reap', 1, 1, '', 'Mr. Chhuney', 'info@indradeviboutiquehotel.com, Keochhunyu@gmail.com', 'info@indradeviboutiquehotel.com, Keochhunyu@gmail.com', 'info@indradeviboutiquehotel.com, Keochhunyu@gmail.com', '', '+855 63 766 398', '+855 95 566 262', 'http://indradeviboutiquehotel.com', 7, 3.5, 20, '2016-12-12', NULL, '100', NULL, 3, 12, '2018-09-02 18:35:52', '2018-09-02 18:35:52', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (174, 'Indra Porak Residence', 'Betong Street, Village Vihear Chen, Sangkat Svay Dangkom,near by Pub Street', 1, 1, '17252', 'Mr. Lim Rithy', 'sales@indraporak.com', 'reservation@indraporak.com, sales@indraporak.com', 'limrithy27@yahoo.com', '', '+855 93 859 007', '+855 63 963 373', 'http://indraporak.com', 7, 4.0, 16, '2015-09-15', NULL, '50', NULL, 3, 12, '2018-09-02 18:39:11', '2018-09-02 18:39:11', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (175, 'Indochine 2 Hotel', 'No. 28-30, Street 130, Phsar Kandal I, Daun Penh, Phnom Penh, Cambodia.', 1, 2, '12000', 'Ms. Sivly Lim', 'lim.sivly@indochine2hotel.com', 'reservation@indochine2hotel.com, hls.booking.system.pp@gmail.com', 'lim.sivly@indochine2hotel.com', '', '+855 23 211 525', '+855 23 211 787', 'http://indochine2hotel.com', 1, 2.0, 30, '2014-12-01', NULL, '85', NULL, 3, 12, '2018-09-02 18:41:32', '2018-09-02 18:41:32', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (176, 'In Miles Boutique Hotel', 'No. 042, Charle De Gaulle Blvd (Main Road to Angkor Wat), Mondul 3 village, Sangkat Slor Kram', 1, 1, '', 'Mr. Pheakdey', 'info@inmilesboutique.com', 'info@inmilesboutique.com, inmilesboutique@gmail.com', 'info@inmilesboutique.com', '', '+855 17 995 567', '', 'http://inmilesboutique.com', 1, 2.0, 10, '2017-02-10', NULL, '50', NULL, 3, 12, '2018-09-02 18:46:53', '2018-09-02 18:46:53', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (177, 'Hotel Tokyo Service Apartment and Spa', 'Phnom Penh', 1, 2, '', 'Mr. Kaizo', 'contact@kihoteltokyo.com', 'contact@kihoteltokyo.com', 'contact@kihoteltokyo.com', '', '+855 23 901 358', '', 'http://hoteltokyoserviceapartmentandspa.com', 1, 2.0, 100, '2018-02-26', NULL, '70', NULL, 3, 13, '2019-05-29 09:34:55', '2019-05-29 09:34:55', 13, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (178, 'Hotel Records', 'Phnom Penh', 1, 2, '', 'Mr. Ea Tola', 'records@journeyside.com', 'records@journeyside.com', 'records@journeyside.com', '', '+855 23 981 818', '+855 12 850 488', 'http://hotelrecords.com', 1, 3.0, 15, '2018-06-29', NULL, '30', NULL, 3, 13, '2019-01-15 09:05:04', '2019-01-15 09:05:04', 13, 2, 5, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (179, 'Hotel Five.S ', 'Krang Vilage, KrangAmpil Commune,', 1, 7, '07452', 'Mr. Jimmy', 'info@hotelfives.com', 'info@hotelfives.com', 'gentillesun@gmail.com', '', '+855 81 375 375', '+855 69 370 000', 'http://hotelfives.com', 1, 3.0, 15, '2016-09-20', NULL, '100', NULL, 2, 12, '2018-11-01 16:02:59', '2018-11-01 16:02:59', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (180, 'Hotel Corduroy', 'Phnom Penh', 1, 2, '', 'Mr. Ear Tola', 'tola@journeyside.com', 'tola@journeyside.com', 'tola@journeyside.com', '+855 12 850 488', '+855 12 850 488', '+855 12 850 488', 'http://hotelcorduroy.com', 1, 4.0, 23, '2018-07-10', NULL, '30', NULL, 3, 13, '2019-01-15 09:04:40', '2019-01-15 09:04:40', 13, 2, 5, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (181, 'Hostel 543', 'Wat Bo road', 1, 1, '', 'Mr. Chris', 'thehostel543@gmail.com', 'thehostel543@gmail.com', 'thehostel543@gmail.com', '', '+855 68 386 903', '+855 93 215 253', 'http://hostel543.com', 2, 0.0, 4, '2015-12-03', NULL, '135', NULL, 3, 12, '2018-09-02 19:04:46', '2018-09-02 19:04:46', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (182, 'Horizons Cambodia', 'Street #23, Wat Bo Village, Siem Reap Cambodia', 1, 1, '', 'Mr. Chanthou Choun', 'info@horizonscambodia.com', 'info@horizonscambodia.com', 'info@horizonscambodia.com', '', '+855 92 730 031', '+855 86 730 031', 'http://horizonscambodia.com', 7, 3.0, 12, '2018-02-28', NULL, '70', NULL, 3, 12, '2018-09-02 19:07:04', '2018-09-02 19:07:04', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (183, 'Home Chic Hotel', 'NO. 17, ST. 282, Boeung Keng Kang I | Sangkat BKKI, Khan Chamkarmon', 1, 2, '', 'Ms. Tha Nimol', 'homechichotel@yahoo.com', 'homechichotel@yahoo.com', 'homechichotel@yahoo.com', '+855 11 846 484', '+855 11 846 484', '+855 11 846 484', 'http://homechichotel.com/index.php', 1, 3.0, 50, '2018-04-11', NULL, '100', NULL, 2, 12, '2018-10-31 11:34:49', '2018-10-31 11:34:49', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (184, 'Hillocks Hotel & Spa', 'Sala Kamreuk Villiage, Sala Kamreuk Commune', 1, 1, '1710', 'Narin Hem', 'info@hillockshotel.com', 'book@hillockshotel.com, info@hillockshotel.com, sm@hillockshotel.com', 'account@hillockshotel.com', '', '+855 63 966 699', '+855 95 345 676', 'http://hillockshotel.com', 1, 5.0, 38, '2016-09-26', NULL, '60', NULL, 3, 12, '2018-09-02 19:14:20', '2018-09-02 19:14:20', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (185, 'Hilary\'s Boutique Hotel', '#16 Bis, Street 302, Sangkat Boeng Keng Kang I,  Khan Chamkamorn', 1, 2, '', 'Mr. Sum Chhey', 'info@hilarysboutiquehotel.com ', 'info@hilarysboutiquehotel.com, hls.booking.system.pp@gmail.com', 'info@hilarysboutiquehotel.com ', '', '+855 12 884 467', '+855 23 555 2360', 'http://hilarysboutiquehotel.com', 7, 3.0, 13, '2014-12-01', NULL, '90', NULL, 3, 12, '2018-09-02 19:18:00', '2018-09-02 19:18:00', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (186, 'Hideaway Boutique Resort', 'Siem Reap', 1, 1, '', 'Mr. Rossi', 'reservation@hideawayboutiqueresort.com', 'reservation@hideawayboutiqueresort.com, rossi.is@gmail.com, jd@jaromirdvoracek.com', 'gm@hideawayboutiqueresort.com', '', '+855 12 264 700', '+855 96 369 2665', 'http://hideawayboutiqueresort.com', 6, 0.0, 30, '2017-01-19', NULL, '60', NULL, 3, 12, '2018-09-02 19:20:39', '2018-09-02 19:20:39', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (187, 'Heritage Suites Hotel', 'Near Wat Polanka, Slokram Village, Khum Slok Kram, Siem Reap', 1, 1, '93101', 'Ms. Oma Ho', 'oma@heritagesuiteshotel.com', 'info@heritagesuiteshotel.com, reservation@heritagesuiteshotel.com', 'oma@heritagesuiteshotel.com', '', '+855 63 969 100', '+855 11 969 100', 'https://www.heritagesuiteshotel.com', 7, 5.0, 26, '2016-11-19', NULL, '120', NULL, 3, 12, '2018-09-02 19:23:44', '2018-09-02 19:23:44', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (188, 'Hello Cambodia Boutique', 'Bakheng Road, Siem Reap Central Area,', 1, 1, '', 'Mr. Sin Senghong', 'gm@hellocambodiaboutique.com', 'reservation@hellocambodiaboutique.com', 'booking@hellocambodiaboutique.com', '', '+855 77 519 967', '+855 63 969 699', 'http://hellocambodiaboutique.com', 7, 4.0, 23, '2018-03-17', NULL, '80', NULL, 3, 13, '2019-05-29 09:33:29', '2019-05-29 09:33:29', 13, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (189, 'Skor Boutique', '#0517, Street 7 Makara, Wat Bo Village, Sangkat Salakamroeuk, Siem Reap', 1, 1, '', 'Mr. Majid Wazir', 'info@heavenangkorresidence.com', 'info@heavenangkorresidence.com, reservation@heavenangkorresidence.com', 'info@heavenangkorresidence.com', '', '+855 63 966 737', '+855 92 627 046', 'http://heavenangkorresidence.com', 7, 4.0, 15, '2017-02-20', NULL, '100', NULL, 2, 12, '2019-04-19 15:35:27', '2019-04-19 15:35:27', 12, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (190, 'Harmony River Hotel', '#337, Preah Sisowath Blvd, Sangkat Chey', 1, 2, '', 'Mr. Vong Senvichet', 'harmonyriverhotel@yahoo.com', 'harmonyriverhotel@yahoo.com', 'harmonyriverhotel@yahoo.com', '', '+855 89 232 678', '', 'http://harmonyriverhotel.com', 1, 2.0, 17, '2015-12-08', NULL, '100', NULL, 3, 12, '2018-09-02 19:36:54', '2018-09-02 19:36:54', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (191, 'HanumanAlaya Colonial House', 'Treang Village, Slar Kram Commune', 1, 1, '17254', 'Mr. Boren Chhay', 'boren@hanumanalaya.com', 'reservations@hanumanalaya.com', 'reservations@hanumanalaya.com', '', '+855 63 760 581', '+855 12 789 857', 'http://colonialhouse.hanumanalaya.com', 6, 4.0, 11, '2016-12-30', NULL, '70', NULL, 3, 12, '2018-09-02 19:41:02', '2018-09-02 19:41:02', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (192, 'Green Palace Hotel Phnom Penh', '7 No 61, St. 111 Corner 232 Boeung Pralit | Makara District', 1, 2, '', 'Mr. Kosal Sou', 'kosal.sou@greenpalacehotel.com', 'kosal.sou@greenpalacehotel.com, E-commerce@greenpalacehotel.com, Reservation@greenpalacehotel.com', 'kosal.sou@greenpalacehotel.com', '', '+855 16 570 057', '+855 16 570 057', 'http://greenpalacehotel.com', 1, 4.0, 144, '2018-02-20', NULL, '75', NULL, 3, 12, '2019-07-01 11:08:45', '2019-07-01 11:08:45', 12, 2, 5, '2019-07-01', 'Use solutions from another company ', 'Mr. Kosa', '016 570 057', 5, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (193, 'Champey Sor Angkor Boutique', 'Phum Svay Dangkum, Svay Dangkum ', 1, 1, '17252', 'Mr. Seng Saymeng ', 'info@champeysorangkorboutique.com', 'info@champeysorangkorboutique.com', 'info@champeysorangkorboutique.com', '+855 96 444 1411', '+855 96 444 1411', '070770002', 'http://champeysorangkorboutique.com', 7, 3.5, 20, '2018-09-04', NULL, '110', NULL, 2, 12, '2018-10-31 11:22:20', '2018-10-31 11:22:20', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (194, 'Pearl Resort Cambodia', 'Koh Rong ', 1, 6, '', 'Mr. Ruzaini Rulloda Bin Abdullah ', 'rrarico@gmail.com', 'rrarico@gmail.com, it@pearlresortcambodia.com', 'rrarico@gmail.com', '+855 78 284 949', '+855 12 201 285', '+855 12 201 285', 'http://pearlresortcambodia.com', 1, 5.0, 30, '2018-09-03', '15', '100', NULL, 2, 12, '2018-11-02 11:36:11', '2018-11-02 11:36:11', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (195, 'Mango Rain Boutique Hotel', 'No. 108 Wat Svay Village, Near Phsar Krom Market, Siem Reap River Side ', 1, 1, '17000', 'Mr. Sophy', 'gm@mangorainboutique.com', 'info@mangorainboutique.com, reservation@mangorainboutique.com', 'info@mangorainboutique.com, reservation@mangorainboutique.com', '+855 69 755 554', '+855 69 755 554', '+855 69 755 554', 'http://mangorainboutique.com', 7, 3.0, 17, '2015-09-11', NULL, '80', NULL, 3, 13, '2018-09-09 18:26:20', '2018-09-09 18:26:20', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (196, 'Indra Porak Residence', 'Betong Street, Village Vihear Chen, Sangkat Svay Dangkom,near by Pub Street', 1, 1, '17000', 'Mr. Lim Rithy', 'sales@indraporak.com', 'reservation@indraporak.com, sales@indraporak.com', 'limrithy27@yahoo.com', '+855 93 859 007', '+855 93 859 007', '+855 63 963 373', 'http://indraporak.com', 7, 3.0, 16, '2015-09-15', NULL, '50', NULL, 3, 13, '2018-09-09 18:28:28', '2018-09-09 18:28:28', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (198, 'Popular Residence Hotel ', 'Sala Kamroeuk Village, Sala Kamroeuk Commune ', 1, 1, '17000', 'Mr. Bonn', 'gm@popularresidence.com', 'gm@popularresidence.com, rdm@popularresidence.com', 'fc@popularresidence.com', '+855 81 566 377', '+855 81 566 377', '+855 16 783 425', '+855 16 783 425', 1, 4.0, 26, '2015-09-19', NULL, '100', NULL, 2, 12, '2018-10-31 09:33:07', '2018-10-31 09:33:07', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (199, 'Ladear Angkor Boutique Hotel', 'Street 27, Wat Bo Road, Phum Wat Bo, Khum Salakamroeuk', 1, 1, '17000', 'Ran Sophea', 'gm@ladearangkorhotel.com', 'reservation@ladearangkorhotel.com', 'fc@ladearangkorhotel.com, ac@ladearangkorhotel.com', '+855 12 849 190', '+855 12 849 190', '+855 63 963 070', 'http://ladearangkorhotel.com', 7, 3.0, 12, '2015-09-21', NULL, '50', NULL, 2, 12, '2018-10-31 09:24:40', '2018-10-31 09:24:40', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (200, 'Var Sunny Angkor Suite Hotel', 'National Road 6, Chong Kaosur Village', 1, 1, '17000', 'Mr. Mom Chomroeun', 'gm@varsunnyangkorsuite.com', 'gm@varsunnyangkorsuite.com', 'gm@varsunnyangkorsuite.com', '+855 17 673 609', '+855 17 673 609', '+855 69 577 599', 'http://varsunnyangkorsuite.com', 1, 3.0, 28, '2015-09-25', NULL, '155', NULL, 3, 13, '2018-09-09 18:35:04', '2018-09-09 18:35:04', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (201, 'Villa Medamrei Boutique Hotel', 'Vihear Chin Village, Svay Dangkum Commnuce', 1, 1, '17000', 'Ms.Hok Rachana', 'info@villamedamrei.com', 'info@villamedamrei.com', 'info@villamedamrei.com', '+855 12 782 316', '+855 12 782 316', '+855 63 763 636 ', 'http://villamedamrei.com', 1, 3.0, 19, '2015-10-28', NULL, '80', NULL, 3, 13, '2018-09-09 18:36:39', '2018-09-09 18:36:39', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (202, 'Panary Angkor Boutique ', 'Behind New Apsara Supermarket 200 meters on the right hand side, # 20 Road, Wat Bo Street', 1, 1, '17000', 'Seng Parob', 'info@panaryangkorboutique.com ', 'info@panaryangkorboutique.com, sokros@hotellinksolutions.com.kh', 'info@panaryangkorboutique.com ', '+855 12 920 737', '+855 12 920 737', '+855 12 920 737', 'http://panaryangkorboutique.com', 7, 3.5, 14, '2015-11-02', NULL, '50', NULL, 3, 13, '2018-09-09 18:38:19', '2018-09-09 18:38:19', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (204, 'Hostel 543', 'Wat Bo road', 1, 1, '17000', 'Mr. Chris', 'thehostel543@gmail.com', 'thehostel543@gmail.com', 'thehostel543@gmail.com', '+855 93 215 253', '+855 93 215 253', '+855 68 386 903', 'http://hostel543.com', 2, 2.0, 4, '2015-12-03', NULL, '135', NULL, 3, 13, '2018-09-09 18:41:36', '2018-09-09 18:41:36', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (205, 'Chez Moi Residence and Spa', '#Street 22, Wat Bo, Sangkat Salar Komreuk', 1, 1, '17000', 'Ms. Vann Narin', 'residence@chezmoi.asia', 'residence@chezmoi.asia', 'residence@chezmoi.asia', '+855 12 584 897', '+855 12 584 897', '+855 12 584 897', 'http://residence.chezmoi.asia', 1, 4.0, 16, '2016-01-08', NULL, '60', NULL, 3, 13, '2018-09-09 18:43:15', '2018-09-09 18:43:15', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (207, 'Tropicana Residence & Resort', 'Angkor High School Road, Phum Wat Bo, Salakamreuk', 1, 1, '17000', 'Mr. Seang Sovann', 'rm@tropicanaresidence.com', 'reservation@tropicanaresidence.com', 'rm@tropicanaresidence.com, acc@tropicanaresidence.com', '+855 12 842 349', '+855 12 842 349', '+855 63 210 600', 'http://tropicanaresidence.com ', 1, 4.0, 16, '2016-01-11', NULL, '75', NULL, 3, 13, '2018-09-09 18:46:27', '2018-09-09 18:46:27', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (208, 'Angkor Miracle Resort & Spa', 'National Road No. 6A. Khum Sra Nge (opposite of Cambodian cultural Village) Siem Reap', 1, 1, '17000', 'Mr. Daravichhay SENG ', 'em@angkormiracle.com, ee@angkormiracle.com, reservations@angkormiracle.com', 'reservations@angkormiracle.com, ee@angkormiracle.com, em@angkormiracle.com', 'acc@angkormiracle.com', '+855 87 882 244', '+855 87 882 244', '+855 63 969 900', 'http://angkormiracle.com/resort', 1, 5.0, 247, '2015-11-30', NULL, '150', NULL, 3, 13, '2018-09-09 18:48:21', '2018-09-09 18:48:21', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (209, 'Chronicle Residence And Spa', '# Road 30, 200m way from Borei Phreumprey.', 1, 1, '17000', 'Kyry Sok', 'gm@chronicleresidenceandspa.com, operation@chronicleresidenceandspa.com, info@chronicleresidenceandspa.com', 'reservation@chronicleresidenceandspa.com, operation@chronicleresidenceandspa.com, info@chronicleresidenceandspa.com', 'account@chronicleresidenceandspa.com', '+855 12 677 939', '+855 12 677 939', '+855 63 963 693', 'http://chronicleresidenceandspa.com', 1, 3.0, 22, '2015-11-27', NULL, '100', NULL, 3, 13, '2018-09-09 18:50:14', '2018-09-09 18:50:14', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (210, 'Vilada Angkor Boutique', 'Kor Kranch Village, Sangkat Siem Reap', 1, 1, '17000', 'Mr. Seng Sakada', 'gm@viladaangkorboutique.com', 'gm@viladaangkorboutique.com', 'gm@viladaangkorboutique.com', '+855 12 565 856', '+855 12 565 856', '+855 17 688 568', 'http://viladaangkorboutique.com', 1, 4.0, 7, '2015-11-03', NULL, '70', NULL, 3, 13, '2018-09-09 18:51:37', '2018-09-09 18:51:37', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (211, 'Khmere Maison d\'Angkor', '#482, BO POX 93090, City Center, National Road No.6, Wat Kesaram Street, Sangkat Svay Dangkum,', 1, 1, '17000', 'Jacky LONG ', 'jacky@khmeremaisondangkor.com', 'relations@khmeremaisondangkor.com', 'jacky@khmeremaisondangkor.com', '+855 12 660 160', '+855 12 660 160', '+855 63 766 062', 'http://khmeremaisondangkor.com', 7, 3.0, 6, '2016-11-02', NULL, '30', NULL, 3, 13, '2018-09-09 18:53:23', '2018-09-09 18:53:23', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (212, 'Bopha Pollen Hotel', ' #202, Taphul village , Svay Dangkum Commune', 1, 1, '17000', 'Mr.Pahrida Mary', 'reservation@bophapollenhotel.com, md@bophapollenhotel.com', 'md@bophapollenhotel.com, reservation@bophapollenhotel.com', 'md@bophapollenhotel.com, reservation@bophapollenhotel.com', '+855 10 965 899', '+855 10 965 899', '+855 63 965 899', 'http://bophapollenhotel.com', 1, 4.0, 29, '2019-01-17', '24', '85', NULL, 2, 12, '2019-01-22 09:13:02', '2019-01-22 09:13:02', 12, 13, 5, '1970-01-01', '', '', '', 4, '2019-01-17 00:00:00');
INSERT INTO `eot_customer` VALUES (213, 'Nagara Angkor Boutique Hotel', 'Sok San Road, Stueng Thmei Village, Svay Dangkum Commune', 1, 1, '17000', 'Mr. Sophat', 'booking@nagaraangkor-boutique.com', 'booking@nagaraangkor-boutique.com', 'account@nagaraangkor-boutique.com', '+855 70 559 536', '+855 70 559 536', '+855 63 766 082', 'http://nagaraangkor-boutique.com', 7, 3.5, 36, '2015-11-21', NULL, '150', NULL, 3, 13, '2018-09-09 18:56:45', '2018-09-09 18:56:45', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (215, 'Bunwin Plantation', 'Kakranh Village', 1, 1, '17000', 'Mr. Has Sophal', 'gm@bunwinboutique.com', 'reservation@bunwinplantation.com', 'reservation@bunwinplantation.com', '+855 17 310 229', '+855 17 310 229', '+855 17 310 229', 'http://plantation.bunwinplantation.com', 1, 3.0, 14, '2015-09-14', NULL, '55', NULL, 3, 13, '2018-09-09 19:00:09', '2018-09-09 19:00:09', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (216, 'Popular Boutique Hotel', 'Address: #033, Vihear Chin Village, Sangkat Svay Daungkum, Siem Reap City', 1, 1, '17000', 'Mrs. CHUM Thida', 'gm@popularboutiquehotel.com', 'reservation@popularboutiquehotel.com', 'reservation@popularboutiquehotel.com', '+855 17 820 187', '+855 63 963 578', '+855 17 820 187', 'http://popularboutiquehotel.com', 1, 3.0, 36, '2015-09-26', NULL, '80', NULL, 3, 13, '2018-09-09 19:17:32', '2018-09-09 19:17:32', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (220, 'The Moon Villa ', 'National Road 06,Phum Banteay Chas, Samaki Market zone', 1, 1, '17000', 'Mr.Has Sophal', 'reservation@themoonvilla.com', 'reservation@themoonvilla.com', 'reservation@themoonvilla.com', '+855 12 629 969', '+855 12 629 969', '+855 12 629 969', 'http://themoonvilla.com', 3, 3.0, 19, '2015-08-29', NULL, '55', NULL, 3, 13, '2018-09-09 19:24:16', '2018-09-09 19:24:16', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (221, 'New Riverside Hotel', 'Chunlung Village, Sala Komrak Commune ', 1, 1, '17000', 'Mr.Xing', 'reservation@newriversidehotel.com, booking@newriversidehotel.com', 'reservation@newriversidehotel.com, booking@newriversidehotel.com', 'reservation@newriversidehotel.com, booking@newriversidehotel.com', '+855 12 550 055', '+855 12 550 055', '+855 63 765 533', 'http://newriversidehotel.com', 1, 3.0, 40, '2015-08-10', NULL, '100', NULL, 3, 13, '2018-09-09 19:26:02', '2018-09-09 19:26:02', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (222, 'Lynnaya Urban River Resort & Spa', 'Street 20 Krong', 1, 1, '17000', 'Mr.Kan Chansathya', 'gm@lynnaya.com', 'reservation@lynnaya.com', 'reservation@lynnaya.com ', '+855 63 967 755', '+855 63 967 755', '+855 63 967 755', 'http://lynnaya-hotel-angkor.com', 1, 4.0, 46, '2018-08-27', NULL, '130', NULL, 3, 13, '2018-09-09 19:27:39', '2018-09-09 19:27:39', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (224, 'Mane Boutique Hotel & Spa', 'Village Salakomroeuk, Sangkat Salakomroeuk', 1, 1, '17000', 'Mr. Rath', 'ecom@maneboutiquehotel.com', 'reservations@maneboutiquehotel.com, ecom@maneboutiquehotel.com', 'gm@maneboutiquehotel.com, md@maneboutiquehotel.com, phann.vanrath@gmail.com', '+855 97 552 2222', '+855 97 552 2222', '+855 63 768 899', 'http://maneboutiquehotel.com', 7, 5.0, 18, '2015-08-16', NULL, '120', NULL, 3, 13, '2018-09-09 19:31:05', '2018-09-09 19:31:05', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (225, 'The Clay D\' Angkor', 'Sala Kanseng Village, Svay Dangkum Commune', 1, 1, '17000', 'Mr.Kham Serey Chantha', 'info@theclaydangkor.com', 'info@theclaydangkor.com', 'info@theclaydangkor.com', '+855 12 388 797', '+855 12 388 797', '+855 63 965 596', 'http://theclaydangkor.com', 7, 4.0, 6, '2015-09-14', NULL, '50', NULL, 3, 13, '2018-09-09 19:32:43', '2018-09-09 19:32:43', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (228, 'The Palm Boutique Hotel & Residence', 'No. 270,Street 63, Sangkat Tonle Bassac (Boung Keng Kong II), Khan Chamkarmorn', 1, 2, '13000', 'Mr. Bo Channa', 'gm@thepalmboutique.com', 'info@thepalmboutique.com', 'info@thepalmboutique.com', '+855 11 855 901', '+855 11 855 901', '+855 23 226 999', 'http://thepalmboutique.com', 1, 4.0, 35, '2015-08-25', NULL, '90', NULL, 3, 13, '2018-09-09 19:38:27', '2018-09-09 19:38:27', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (229, 'Le Grand Mekong Hotel ', '253-255, Sisowath Quay, Psar Kandal I District, DaunPenh Commune', 1, 2, '17000', 'Mr. Hong', 'gm@legrandmekong.com', 'gm@legrandmekong.com, info@legrandmekong.com', 'accounts@legrandmekong.com, gm@legrandmekong.com', '+855 78 591 768', '+855 78 591 768', '+855 23 220 336', 'http://legrandmekong.com', 1, 3.5, 44, '2015-07-09', NULL, '140', NULL, 2, 12, '2018-10-31 09:46:31', '2018-10-31 09:46:31', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (232, 'Harmony River Hotel', '#337, Preah Sisowath Blvd, Sangkat Chey', 1, 2, '13000', 'Mr. Vong Senvichet', 'harmonyriverhotel@yahoo.com', 'harmonyriverhotel@yahoo.com', 'harmonyriverhotel@yahoo.com', '+855 89 232 678', '+855 89 232 678', '+855 89 232 678', 'http://harmonyriverhotel.com', 1, 2.0, 17, '2015-12-02', NULL, '100', NULL, 3, 13, '2018-09-09 19:45:14', '2018-09-09 19:45:14', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (233, 'Waterview Guesthouse', 'No. 151 Eo, River front Street', 1, 2, '13000', 'Mr. Chea Saichhour', 'waterview.gh@gmail.com', 'waterview.gh@gmail.com', 'waterview.gh@gmail.com', '+855 12 717 378', '+855 12 717 378', '+855 23 215 375', 'http://waterviewguesthouse.com', 9, 2.0, 16, '2015-06-02', NULL, '100', NULL, 3, 13, '2018-09-09 19:47:37', '2018-09-09 19:47:37', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (234, 'The 1959 Boutique Villa', '#24-25, Soramrit Blvd', 1, 2, '13000', 'Sambath Morodok', 'gm@the1959.com', 'gm@the1959.com, info@the1959.com', 'gm@the1959.com', '+855 16 511 522', '+855 16 511 522', '+855 11 887 789', 'http://the1959.com', 7, 3.5, 6, '2016-03-24', NULL, '40', NULL, 3, 13, '2018-11-08 08:24:27', '2018-11-08 08:24:27', 13, 2, 4, '2018-11-05', 'Auto Deactivate', 'Sambath Morodok', '+855 11 887 789\r\n+855 16 511 522', 4, NULL);
INSERT INTO `eot_customer` VALUES (235, 'Sokea Suites Extends Stay', 'No. 168, Monireth Boulevard, Sangkat Tomnob Tek, Khan Chamkar Mon', 1, 2, '13000', 'Mr. Khemanora', 'enquiry@sokeainternational.com.kh', 'enquiry@sokeainternational.com.kh', 'kh.keiman@yahoo.fr', '+855 12 517 590', '+855 12 517 590', '+855 23 886 778', 'http://sokeasuites.com', 1, 3.0, 30, '2015-07-20', NULL, '50', NULL, 3, 13, '2018-09-09 19:52:19', '2018-09-09 19:52:19', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (237, 'The Blue Corner Boutique Hotel', 'No.37,Corner St. 63 and St.180, Sangkat Beung Rang,Khan Daun Penh, Phnom Penh', 1, 2, '13000', 'Ms.Sak Sothavy ', 'reservation@thebluecorner.asia', 'reservation@thebluecorner.asia, thavy@thebluecorner.asia', 'narong@thebluecorner.asia', '+855 12 927 092', '+855 12 927 092', '+855 23 979 888', 'http://thebluecorner.asia', 7, 4.0, 23, '2016-03-28', NULL, '70', NULL, 2, 12, '2018-10-31 09:55:06', '2018-10-31 09:55:06', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (239, 'Royal Mekong Boutique Hotel', '#17, Street 208, Sankat Beoung Reang, Khan Daun Penh', 1, 2, '13000', 'Mrs. Sokha Pech', 'info@royalmekongboutiquehotel.com', 'info@royalmekongboutiquehotel.com, royalmekong1@gmail.com, hls.booking.system.pp@gmail.com', 'info@royalmekongboutiquehotel.com, royalmekong1@gmail.com', '+855 92 835 003', '+855 92 835 003', '+855 23 988 599', 'http://royalmekongboutiquehotel.com', 1, 3.0, 24, '2014-07-24', NULL, '150', NULL, 3, 13, '2018-09-09 20:15:59', '2018-09-09 20:15:59', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (240, 'Teav Boutique Hotel', '# 14, Street 310, Boeung Keng Kang I, Khan Chamkar Mon', 1, 2, '13000', 'Ms. Kim', 'sm@teavgroup.com', 'sm@teavgroup.com, stay@teavgroup.com', 'manage@teavgroup.com, finance@teavgroup.com', '+855 77 679 999', '+855 77 679 999', '+855 23 981 818', 'http://bkk1.teavboutiquehotel.com', 7, 4.0, 12, '2014-11-01', NULL, '85', NULL, 3, 13, '2018-09-22 10:52:27', '2018-09-22 10:52:27', 13, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (241, 'You Eng Hotel', 'Russian Federation Blvd, S/K Chorm Chao, Khan Po  Senchey', 1, 2, '13000', 'Mr. Kimly Hong', 'youenghotel@yahoo.com', 'youenghotel@yahoo.com', 'youenghotel@yahoo.com, hongkimly09@gmail.com', '+855 68 888 815', '+855 78 525 268', '+855 78 525 268', 'https://youenghotel.com', 1, 4.0, 168, '2014-11-20', NULL, '176', NULL, 2, 12, '2018-10-31 09:55:57', '2018-10-31 09:55:57', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (242, 'Omana Boutique Hotel', 'Street 9, Phnom Penh 4139', 1, 2, '13000', 'Mr. TOEM PUNLORK', 'hello@hotel-omana.com', 'hello@hotel-omana.com', 'hello@hotel-omana.com', '+855 70 904 482', '+855 70 904 482', '+855 12 430 833', 'http://hotel-omana.com', 1, 4.0, 13, '2018-06-15', NULL, '130', NULL, 3, 13, '2019-02-05 08:56:35', '2019-02-05 08:56:35', 13, 2, 4, '2019-02-04', 'They have to renovate the whole building as our electricity and water supply issue', 'Omana Hotel Owner', 'Phone:   +855 12 430 833/ 23 676 3001\r\nEmail:      hello@hotel-omana.com', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (244, 'The Little Garden Villa', '#8A, Street 398, Boeung Keng Kong I', 1, 2, '13000', 'Mr. Peou Sari', 'info@littlegarden.asia ', 'info@littlegarden.asia, hls.booking.system.pp@gmail.com', 'info@littlegarden.asia ', '+855 23 217 871', '+855 23 217 871', '+855 23 217 871', 'http://thelittlegarden.asia', 3, 3.0, 10, '2014-12-01', NULL, '121.5', NULL, 3, 13, '2018-09-09 20:27:24', '2018-09-09 20:27:24', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (245, 'La Rose Boutique Hotel and Spa', '#164B, Norodom Blvd', 1, 2, '13000', 'Mr. Vothyrith Om', 'relax@larose.com.kh', 'relax@larose.com.kh, hls.booking.system.pp@gmail.com', 'accountant@larose.com.kh', '+855 23 211 130', '+855 23 211 130', '+855 23 211 130', 'http://larose.com.kh/home.php', 7, 4.0, 10, '2014-11-03', NULL, '40', NULL, 2, 12, '2018-10-31 09:58:06', '2018-10-31 09:58:06', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (246, 'Samnang Laor Hotel', 'No 130, Street 304 & Conner 163, Sangkat Olympic, Khan Chamkamon, Phnom Penh Cambodia. ', 1, 2, '13000', 'Ms. Chea Dimong', 'gm@samnanglaorhotel.com', 'reservation@samnanglaorhotel.com, gm@samnanglaorhotel.com', 'account@samnanglaorhotel.com', '+855 87 838 326', '+855 87 838 326', '+855 61 838 326', 'http://samnanglaorhotel.com', 1, 3.5, 81, '2018-05-08', NULL, '80', NULL, 3, 13, '2019-05-29 09:36:27', '2019-05-29 09:36:27', 13, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (247, 'Indochine 2 Hotel', 'No. 28-30, Street 130, Phsar Kandal I, Daun Penh, Phnom Penh, Cambodia.', 1, 1, '13000', 'Ms. Sivly Lim', 'lim.sivly@indochine2hotel.com', 'reservation@indochine2hotel.com, hls.booking.system.pp@gmail.com', 'lim.sivly@indochine2hotel.com', '+855 23 211 787', '+855 23 211 787', '+855 23 211 525', 'http://indochine2hotel.com', 1, 2.0, 30, '2014-12-01', NULL, '85', NULL, 3, 13, '2018-09-09 20:44:26', '2018-09-09 20:44:26', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (249, 'Starry Angkor Hotel', 'No. G4, National Road 6, Banteay Chas Village, Sangkat Slorkram', 1, 1, '17000', 'Ms. Seng Sinn', 'asst.sales@starryangkorhotel.com', 'asst.sales@starryangkorhotel.com', 'asst.sales@starryangkorhotel.com', '+855 63 968 123', '+855 63 968 123', '+855 63 968 124', 'http://starryangkorhotel.com', 1, 4.0, 127, '2016-02-16', NULL, '35', NULL, 3, 13, '2018-09-22 09:16:56', '2018-09-22 09:16:56', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (250, 'Steung Siemreap Thmey Hotel', 'Street 9, Khum Svaydangkum, Old Market Area', 1, 1, '17000', 'Mr. Veasoth', 'sales@steungsiemreapthmeyhotel.com', 'resv@steungsiemreapthmeyhotel.com', 'account@steungsiemreapthmeyhotel.com', '+855 63 965 167', '+855 12 249 249', '+855 63 965 167', 'http://steungsiemreapthmeyhotel.com', 1, 4.0, 76, '2015-10-20', NULL, '185', NULL, 3, 12, '2018-10-31 10:03:46', '2018-10-31 10:03:46', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (251, 'Suon Angkor Boutique', '#211 Phum Watbo ,Sala Kamreuork, Siem Reap', 1, 1, '', 'Mr. KEO PHAL', 'Phalkeo783@gmail.com', 'Phalkeo783@gmail.com', 'Phalkeo783@gmail.com', '+855 10 277 389', '+855 10 277 389', '', 'http://suonangkorboutique.com', 4, 4.0, 27, '2019-03-18', NULL, '60', NULL, 2, 12, '2019-03-21 08:33:08', '2019-03-21 08:33:08', 12, 13, 5, '1970-01-01', '', '', '', 4, '2019-03-20 00:00:00');
INSERT INTO `eot_customer` VALUES (252, 'Ta Tai Hotel Resort & Marina', 'Dong village, Ta tai commune, Unlongback District', 1, 7, '13000', 'Mr. Piseth Dath', 'piseth.dath@tatairesort.com, info@tatairesort.com', 'piseth.dath@tatairesort.com, info@tatairesort.com', 'piseth.dath@tatairesort.com, info@tatairesort.com', '+855 92 885 115', '+855 92 885 115', '+855 15 885 115', 'http://tatai-hotel.com', 1, 4.0, 53, '2017-04-19', NULL, '180', NULL, 3, 13, '2018-10-31 13:53:13', '2018-10-31 13:53:13', 13, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (253, 'Taingleap Angkor Villa', 'Centrally located area. Taphul Street,Siem Reap City', 1, 1, '17000', 'Mr Thim Sin', 'info@taingleapangkorvilla.com', 'reservation@taingleapangkorvilla.com, info@taingleapangkorvilla.com', 'info@taingleapangkorvilla.com', '+855 78 731 861', '+855 78 731 861', '+855 63 965 589', 'http://taingleapangkorvilla.com', 1, 3.0, 24, '2014-03-14', NULL, '100', NULL, 3, 13, '2018-09-22 09:40:24', '2018-09-22 09:40:24', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (254, 'Tanei Boutique Villa', '#017, Steung Thmey Village, Svay Dangkom', 1, 1, '17000', 'Mr. Lao Sokun', 'lao_sukun007@yahoo.com', 'lao_sukun007@yahoo.com, info@taneiboutiquevilla.com', 'lao_sukun007@yahoo.com', '+855 12 757 867', '+855 12 757 867', '+855 97 746 8787', 'http://taneiboutiquevilla.com', 1, 3.0, 28, '2015-03-25', NULL, '65', NULL, 3, 13, '2018-09-22 09:52:42', '2018-09-22 09:52:42', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (255, 'Tareach Angkor Villa', 'Group 14, #781, Vihear Chin Village,  Svaydongkum Commune', 1, 1, '17000', 'Sony Lam', 'sony@tareachangkorvilla.com', 'sony@tareachangkorvilla.com', 'sony@tareachangkorvilla.com', '+855 12 771 726', '+855 12 771 726', '+855 12 771 726', 'http://tareachangkorvilla.com', 3, 1.0, 14, '2015-02-05', NULL, '45', NULL, 3, 13, '2019-05-29 09:35:21', '2019-05-29 09:35:21', 13, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (256, 'Teav Bassac Boutique Hotel', '#30, Street 09, Tonel Bassac, Khan Chamkamon', 1, 2, '13000', 'Ms. Kim Lang', 'sm@teavgroup.com', 'sm@teavgroup.com, sales@teavgroup.com, staybassac@teavgroup.com, manager@teavgroup.com', 'manager@teavgroup.com, finance@teavgroup.com', '+855 23 982 828', '+855 23 982 828', '+855 23 982 828', 'http://teavbassachotel.com', 7, 4.0, 25, '2016-10-26', NULL, '100', NULL, 3, 12, '2018-10-31 10:25:15', '2018-10-31 10:25:15', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (257, 'Tep Sodachan Villa Boutique', '# 456, Group 7, Khnar Village  Chreave Commune', 1, 1, '17000', 'Ly  Kim Hua', 'angkorkimhua@yahoo.com', 'angkorkimhua@yahoo.com', 'angkorkimhua@yahoo.com', '+855 77 466 082', '+855 77 466 082', '', 'http://tepsodachan.com', 1, 3.0, 28, '2015-02-19', NULL, '70', NULL, 3, 12, '2018-10-31 10:26:14', '2018-10-31 10:26:14', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (259, 'TravellerHome Angkor', 'Steng Thmei, Svaydongkum', 1, 1, '17252', 'Mr. Van narin', 'gm@travellerhomeangkor.com', 'info@travellerhomeangkor.com', 'gm@travellerhomeangkor.com', '', '+855 11 684 262', '+855 11 684 262', 'http://travellerhomeangkor.com', 1, 4.0, 34, '2016-09-23', NULL, '', NULL, 3, 12, '2019-05-31 08:48:30', '2019-05-31 08:48:30', 12, 2, 5, '2019-05-31', 'They want to save budget for low season', 'Mr. Sopheann', '098 93 2 662 ', 5, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (260, 'Le Mont Hotel', 'No. 196 St. 143 corner 304, Sangkat Boeng Keng Kang 2, Chamkarmon', 1, 2, '', 'Ms. Jennifer', 'gm@lemonthotel.com', 'reservation@lemonthotel.com, gm@lemonthotel.com, duyen@whl.travel', 'gm@lemonthotel.com', '', '+855 16 834 207', '+855 16 834 207', 'http://lemonthotel.com', 1, 4.0, 98, '2017-12-21', NULL, '', NULL, 2, 12, '2018-11-01 14:01:45', '2018-11-01 14:01:45', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (261, 'Our Joint Hotel & Guesthouse', ' #142, Psar Krom Street', 1, 1, '', 'Front Office', 'booking@ourjointhotel.com', 'booking@ourjointhotel.com', 'booking@ourjointhotel.com', '', '+855 96 557 4054', '+855 63 964 868', 'http://ourjointhotel.com', 1, 3.0, 26, '2017-11-14', NULL, '', NULL, 2, 12, '2018-11-01 14:03:19', '2018-11-01 14:03:19', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (262, 'Reaksmey Chanreas Hotel ', '#330 Sivutha Blvd', 1, 1, '', 'Mr. Oem Komsorth', 'info@reaksmeychanreashotel.com', 'reservation@reaksmeychanreashotel.com', 'info@reaksmeychanreashotel.com', '', '+855 12 849 967', '+855 63 963 557', 'http://reaksmeychanreashotel.com', 1, 3.0, 44, '2015-10-23', NULL, '', NULL, 2, 12, '2018-11-01 14:05:26', '2018-11-01 14:05:26', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (263, 'Le Chanthou Boutique', 'Bakheng Road, Svay Dangkum, Siem Reap', 1, 1, '17254', 'Mr.  Sous Phearith', 'info@lechanthou.com', 'info@lechanthou.com', 'info@lechanthou.com', '', '+855 63 766 417', '+855 69 518 088', 'http://lechanthouboutique.com', 7, 4.0, 15, '2016-11-28', NULL, '', NULL, 2, 12, '2018-11-01 14:06:20', '2018-11-01 14:06:20', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (264, 'Oops Hostel', 'No. B01 Sivutha Blvd, Modul I Village, Siem Reap, Cambodia.', 1, 1, '17252', 'Mr. Sem Sen Visit Veasna', 'info@oopshostel.com, reservation@oopshostel.com, fb@oopshostel.com', 'info@oopshostel.com, reservation@oopshostel.com, fb@oopshostel.com', 'info@oopshostel.com, reservation@oopshostel.com, fb@oopshostel.com', '', '+855 63 640 3809', '+855 99 926 999', 'http://oopshostel.com', 2, 2.0, 70, '2017-09-05', NULL, '', NULL, 2, 12, '2018-11-01 14:08:03', '2018-11-01 14:08:03', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (265, 'The Villa by Metta', 'Salakamreuk, Siem Reap', 1, 1, '17253', 'Mr. Rady Chum', 'info@mettavilla.com', 'info@mettavilla.com', 'info@mettavilla.com', '', '+855 92 508 545', '+855 81 333 328', 'http://mettavilla.com/html', 3, 5.0, 4, '2017-10-26', NULL, '', NULL, 2, 12, '2019-07-11 08:39:11', '2019-07-11 08:39:11', 12, 19, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (266, 'Shadow Angkor Villa', 'Wat Bo Street , Opposite Wat Preah Prom Rath Pagoda', 1, 1, '1710', 'So Visal', 'info@shadowangkorvilla.com', 'reservation@shadowangkorvilla.com', 'info@shadowangkorvilla.com', '', '+855 63 760 363', '+855 17 243 2280', 'https://shadowangkorvilla.com', 3, 3.0, 20, '2017-01-10', '27', '', NULL, 2, 12, '2019-04-18 11:41:39', '2019-04-18 11:41:39', 12, 2, 5, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (267, 'Orussey One Hotel & Apartment', 'No 14, St 111, Corner 198, Sangkat Boeung Prolit, Khan 7Makara', 1, 2, '', 'Mr. Kong Sophea', 'booking@orussey1.com, gm@orussey1.com', 'booking@orussey1.com, gm@orussey1.com, bunchea@orussey1.com', 'gm@orussey1.com, bunchea@orussey1.com, booking@orussey1.com', '', '+855 70 200 519', '+855 89 616 908', 'http://orussey1.com', 1, 4.0, 63, '2018-01-17', NULL, '', NULL, 2, 12, '2018-11-01 14:10:54', '2018-11-01 14:10:54', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (268, 'The Third Fold Hotel ', 'Krom 6, Phoum Sala Kanseng, Sangkat Svay Dangkum, Siem Reap, Cambodia', 1, 1, '', 'Mr. Song Vichay', 'vichaysong@gmail.com', 'vichaysong@gmail.com', 'vichaysong@gmail.com', '+855 12 278 273', '+855 12 278 273', '+855 12 278 273', 'http://thethirdfold.com', 1, 3.5, 24, '2018-10-22', NULL, '', NULL, 2, 12, '2018-10-31 09:09:57', '2018-10-31 09:09:57', 12, 14, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (269, 'SNOOZE Capsule', 'No. 025, Sivutha Blvd, Mondul I Village, Svaydangkum Cummune (In front of Vattanac Bank)', 1, 1, '', 'Suprabha', 'info@snoozepodhostel.com ', 'info@snoozepodhostel.com, dgranger@independentpropertyservices.com, nara@ips-cambodia.com', 'info@snoozepodhostel.com ', '', '+855 78 937 329', '+855 63 969 929', 'http://oasiscapsules.com', 2, 2.0, 14, '2016-06-15', NULL, '', NULL, 2, 12, '2018-11-20 11:10:14', '2018-11-20 11:10:14', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (270, 'Damnak Villa Boutique', 'Old Market Area, Wat Damnak Village, Salakomreuk Commune', 1, 1, '', 'Mr. Sok Piseth', 'info@moonflowersiemreap.com', 'info@moonflowersiemreap.com', 'info@moonflowersiemreap.com', '', '+855 92 686 961', '+855 77 979 711', 'https://damnakvillaboutique.com', 1, 3.0, 8, '2018-07-09', NULL, '', NULL, 2, 12, '2018-11-01 14:16:23', '2018-11-01 14:16:23', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (271, 'Udaya Residence', '#125, Sala Komroeuk Village, Sala Komroeuk Commune,', 1, 1, '', 'Mr. Son kompheak', 'ecom@udayaresidence.com', 'ecom@udayaresidence.com, info@udayaresidence.com', 'reservation@udayaresidence.com, fn@udayaresidence.com', '', '+855 78 764 111', '+855 63 764 111', 'http://udayaresidence.com', 7, 4.0, 22, '2016-09-13', NULL, '', NULL, 2, 12, '2018-11-01 14:18:32', '2018-11-01 14:18:32', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (274, 'Boreirum Terkchou', 'Teuk Chhou Road, Krong Kampot, Kampot Province, Cambodia', 1, 7, '', 'Mrs. Sreynet Muong ', 'boreirumthmordaresortkampot168@gmail.com', 'boreirumthmordaresortkampot168@gmail.com', 'boreirumthmordaresortkampot168@gmail.com', '+855 15 360 540', '+855 15 360 540', '086750280', 'http://boreirum.com', 1, 3.5, 23, '2018-10-15', '19', '120', NULL, 2, 12, '2019-07-11 08:39:35', '2019-07-11 08:39:35', 12, 19, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (275, 'Sovan Mealea Hotel', 'Loktaneuy St, Watbo Village, Salakamreuk', 1, 1, '17252', 'Mr. Boyd', 'sales@sovanmealeahotel.com', 'sales@sovanmealeahotel.com', 'sales@sovanmealeahotel.com', '+855 15 596 468', '+855 15 596 468', '+855 63 967 768', 'http://sovanmealeahotel.com', 1, 4.0, 42, '2015-12-12', NULL, '135', NULL, 2, 12, '2018-11-01 14:20:45', '2018-11-01 14:20:45', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (277, 'Makk Hotel', 'Sovansakor District, Kampot City, Kampot', 1, 7, '', 'Mr. Jimmy', 'info@makkhotel.com', 'info@makkhotel.com', 'info@makkhotel.com', '+855 69 370 000', '+855 86 375 375', '', 'http://makkhotel.com', 1, 3.0, 6, '2016-03-16', NULL, '100', NULL, 2, 12, '2018-11-01 14:28:15', '2018-11-01 14:28:15', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (278, 'Try Palace Resort', 'Phum Thmey, Sangkat Prey Thom', 1, 8, '', 'Try Palace Resort & Spa', 'it@trypalaceresort.com', 'info@trypalaceresort.com', 'it@trypalaceresort.com', '+855 17 325 352', '+855 36 210 317', '', 'http://trypalaceresort.com', 6, 5.0, 12, '2016-05-16', NULL, '100', NULL, 2, 12, '2018-11-01 14:30:20', '2018-11-01 14:30:20', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (279, 'Long Beach Resort Koh Rong', 'Sok San Village, Koh Rong (Island), Krong Phres SihanoukVille', 1, 6, '', 'Mr. Rin Sophearith', 'info@longbeachresortkohrong.com', 'reservations@longbeachresortkohrong.com  ', 'info@longbeachresortkohrong.com', '+855 78 810 009', '+855 78 810 009', '', 'http://longbeachresortkohrong.com', 6, 5.0, 6, '2018-08-07', NULL, '80', NULL, 2, 12, '2018-11-01 14:33:38', '2018-11-01 14:33:38', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (280, 'The Pipes Resort', 'Koh Rong Sanleom', 1, 6, '', 'Mr.Sivantha', 'md@thepipesresort.com', 'md@thepipesresort.com, booking@thepipesresort.com, gm@thepipesresort.com', 'booking@thepipesresort.com', '+855 12 896 111', '+855 12 896 111', '', 'http://thepipesresort.com', 6, 4.0, 12, '2016-12-16', NULL, '90', NULL, 2, 12, '2018-11-01 14:34:33', '2018-11-01 14:34:33', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (281, 'vKirirom Pine Resort', 'Preah Soramarith-Kosamak National Park', 1, 2, 'Kam Pong Speu', 'CHEN Samphea (Mr.)', 'info@vkirirom.com', 'reservation@asiato.asia, info@vkirirom.com', 'sreymom@asiato.asia, vanny@asiato.asia', '+855 78 777 284', '+855 78 777 284', '', 'http://vkirirom.com', 1, 4.0, 29, '2015-01-23', NULL, '70', NULL, 2, 12, '2018-11-01 14:36:03', '2018-11-01 14:36:03', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (282, 'Lux Riverside Hotel & Apartment', 'No.2,4,6, Street 136, Sangkat Phsar kandal Khan Daun Penh', 1, 2, '', 'Ms. Nhek Srey Mom', ' sales@luxriversidehotels.com', 'reservations@luxriversidehotels.com', 'doungrathananhek@yahoo.com, reservations@luxriversidehotels.com', '+855 88 888 0968', '+855 88 888 0968', '+855 23 722 828', 'http://luxriversidehotels.com', 1, 4.0, 102, '2015-03-20', NULL, '84', NULL, 2, 12, '2018-11-01 14:42:17', '2018-11-01 14:42:17', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (283, 'Manor House Boutique Hotel', '#21, St. 262, Daun Penh ', 1, 2, '', 'Mr. Kara', 'info@manorhousecambodia.com', 'info@manorhousecambodia.com', 'info@manorhousecambodia.com', '+855 17 802 922', '+855 17 802 922', '+855 92 230 130', 'http://manorhousecambodia.com', 1, 3.5, 13, '2018-03-28', NULL, '124', NULL, 2, 12, '2019-01-28 10:49:09', '2019-01-28 10:49:09', 12, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (284, 'Le Cocon Boutique Hotel', '#29, Street. 334, BKK I, Chamkamon, Phnom Penh', 1, 2, '', 'Mr. Lak sokchan', 'sales@lecoconboutiquehotel.com', 'info@lecoconboutiquehotel.com', 'sales@lecoconboutiquehotel.com', ' +855 17 565 959', ' +855 17 565 959', '+855 23 986 668', 'http://lecoconboutiquehotel.com', 1, 4.0, 21, '2017-08-03', NULL, '100', NULL, 2, 12, '2018-11-01 14:46:55', '2018-11-01 14:46:55', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (285, 'Sokkhak Boutique Resort', 'Kok Chork Village, Trorpeang Ses Commune, Wat Thmey', 1, 1, '', 'Mr. Sok Chesda', 'contact@sokkhak-boutiqueresort.com, om@sokkhak-boutiqueresort.com', 'contact@sokkhak-boutiqueresort.com, fm@chanreytreecoltd.com, om@sokkhak-boutiqueresort.com', 'contact@sokkhak-boutiqueresort.com', '+855 12 315 178', '+855 77 765 697', '', 'http://sokkhak-boutiqueresort.com', 1, 5.0, 12, '2014-12-25', NULL, '50', NULL, 2, 12, '2018-11-01 14:47:42', '2018-11-01 14:47:42', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (286, 'Shadow Angkor Residence', 'No 353, Pokambor AVE, on the river side, near Old Market', 1, 1, '', 'Mr. Nareth', 'info@shadowangkorresidence.com', 'info@shadowangkorresidence.com', 'info@shadowangkorresidence.com', '+855 92 334 384', '+855 92 334 384', '', 'http://shadowangkorresidence.com', 1, 4.0, 9, '2016-04-07', NULL, '50', NULL, 3, 13, '2018-11-07 08:36:51', '2018-11-07 08:36:51', 13, 2, 4, '2018-11-02', 'Owner wants Stop using our solutions', 'Nareth', '063 964 774 \r\n066 456 355', 4, NULL);
INSERT INTO `eot_customer` VALUES (287, 'The Golden Gecko Villa', '20th Street off Wat Bo Road', 1, 1, '', 'Keith Berry', 'info@thegoldengeckovilla.com', 'info@thegoldengeckovilla.com', 'info@thegoldengeckovilla.com', '+855 69 641 082', '+855 69 641 082', '', 'https://thegoldengeckovilla.com', 3, 3.0, 13, '2016-06-06', NULL, '195', NULL, 2, 12, '2018-11-01 14:32:36', '2018-11-01 14:32:36', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (288, 'La Rose Blanche Boutique', 'Wat Bo Road, Banteay Chas, Slorkram Commune', 1, 1, '', 'Mr. Ran Samrah', 'reservation@laroseblancheboutique.com', 'reservation@laroseblancheboutique.com', 'reservation@laroseblancheboutique.com', '+855 12 819 449', '+855 93 800 499', '', 'http://laroseblancheboutique.com', 1, 4.0, 12, '2016-06-24', NULL, '70', NULL, 2, 12, '2018-11-01 14:50:29', '2018-11-01 14:50:29', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (289, 'Metta Residence & Spa', 'Phum Salakamreuk, Sangkat Salakamreuk', 1, 1, '', 'Mr. Lay Sok Meng', 'info@mettaresidence.com', 'info@mettaresidence.com', 'fc@mettaresidence.com', '+855 69 228 228', '+855 63 766 388', '+855 69 228 228', 'http://mettaresidence.com', 1, 5.0, 34, '2016-12-13', NULL, '80', NULL, 2, 12, '2018-11-01 14:50:59', '2018-11-01 14:50:59', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (290, 'Monthara Angkor Residence', '# 208, Taphoul Road, Taphoul Village', 1, 1, '', 'Mr. Bunpheng', 'info@montharaangkor.com', 'info@montharaangkor.com', 'info@montharaangkor.com', '+855 15 877 766', '+855 15 877 766', '', 'http://montharaangkor.com', 1, 4.0, 11, '2017-01-17', NULL, '50', NULL, 3, 13, '2019-01-15 09:22:26', '2019-01-15 09:22:26', 13, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (291, 'The Seda Villa', 'Vat Damnak Village, Sala Kamroeuk Commune', 1, 1, '', 'Mr. Sam Sopheap', 'info@sedavilla.com', 'info@sedavilla.com, reservation@sedavilla.com', 'info@sedavilla.com', '+855 89 816 888', '+855 89 816 888', '', 'http://sedavilla.com', 3, 3.0, 11, '2017-05-09', NULL, '45', NULL, 3, 13, '2018-11-27 11:09:03', '2018-11-27 11:09:03', 13, 2, 4, '2018-11-27', 'They Sell Property', 'Mr. Sam Sopheap', '+855 89 816 888', 4, NULL);
INSERT INTO `eot_customer` VALUES (292, 'Rithy Rine Angkor Residence', 'City Center, Sok San Road, Old French Quarter, Siem Reap', 1, 1, '', 'Mr. Seab Sonan', 'info@rithyrineangkorresidence.com', 'res@rithyrineangkorresidence.com', 'acc@rithyrineangkorresidence.com', '+855 12 302 655', '+855 12 302 655', '+855 93 577 756', 'http://rithyrineangkorresidence.com', 1, 3.0, 28, '2017-09-05', NULL, '45', NULL, 2, 12, '2018-11-01 14:55:56', '2018-11-01 14:55:56', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (293, 'Vihara Residence', 'Aleah Road, Phum Wat Bo, Khum Salakamroeuk', 1, 1, '', 'Mr. Samoeun', 'gm@vihararesidence.com', 'reservation@vihararesidence.com', 'gm@vihararesidence.com', '+855 98 777 771', '+855 98 777 771', '', 'http://vihararesidence.com', 1, 4.0, 15, '2017-10-19', NULL, '50', NULL, 2, 12, '2018-11-01 14:57:17', '2018-11-01 14:57:17', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (294, 'The Night Hotel', 'Sok San Road, Stueng Thmei Village, Svay Dangkum Commune', 1, 1, '', 'Mr. Long Vansak', 'thenightboutique@gmail.com', 'thenightboutique@gmail.com', 'thenightboutique@gmail.com', '+855 10 556 191', '+855 63 762 762', '+855 10 556 191', 'http://thenight-hotel.com', 1, 4.0, 25, '2017-11-10', NULL, '70', NULL, 2, 12, '2018-11-01 14:57:51', '2018-11-01 14:57:51', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (295, 'SiZen Retreat & Spa', 'Wat Bo road, Slorkarm Commune', 1, 1, '', 'Ms. Vann Narin', 'info@sizen-retreat.com', '', '', '', '', '', '', 1, 3.5, 20, '2017-11-10', NULL, '60', NULL, 3, 12, '2019-06-14 09:09:51', '2019-06-14 09:09:51', 12, 2, 4, '2019-06-13', 'They want to save budget for low season ', 'Ms. Narin', '098 958 387', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (296, 'The Villa Sok San Square', '456, Sok San Road, Khum Svay Dangkum', 1, 1, '', 'Mr. Sous Phearith', 'info@thevillasoksansquare.com', 'info@thevillasoksansquare.com', 'info@thevillasoksansquare.com, hy.rady@thevillasoksansquare.com', '+855 77 777 356', '+855 77 777 356', '+855 63 768 877', 'http://thevillasoksansquare.com', 1, 3.0, 27, '2018-02-01', NULL, '60', NULL, 3, 13, '2019-05-29 09:40:20', '2019-05-29 09:40:20', 13, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (297, 'Okay1 Villa', 'No. 0325 Tapul, Sangkat Svay Dangkum', 1, 1, '', 'Mr. Sin Senghong', 'senghongsinn@gmail.com', 'senghongsinn@gmail.com', 'senghongsinn@gmail.com', '+855 77 519 967', '+855 77 519 967', '+855 63 966 444', 'http://okay1villa.com/home.aspx', 3, 3.5, 50, '2018-03-02', NULL, '80', NULL, 3, 13, '2019-05-29 09:34:23', '2019-05-29 09:34:23', 13, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (298, 'Maison Model D\'Angkor', 'No. 482, City center, National Road No.6, Wat Kesararam Street, Group 17, Phum Taphul, Sangkat Svay Dangkum, Siem Reap City, Cambodia.', 1, 1, '', 'Mrs.Kong Sophea ', ' res@maisonmodeldangkor.com', ' res@maisonmodeldangkor.com', ' res@maisonmodeldangkor.com', '+855 70 715 712', '+855 70 715 712', '', 'http://maisonmodeldangkor.com', 1, 2.0, 4, '2018-08-22', NULL, '40', NULL, 3, 13, '2019-01-15 09:29:34', '2019-01-15 09:29:34', 13, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (299, 'Smiling Deluxe Hotel', 'No. 6, Chong Kaosou Village, Sangkat Slor Kram', 1, 1, '', 'Mr. Sengtry NOL', 'info@smilingdeluxehotel.com', 'info@smilingdeluxehotel.com', 'info@smilingdeluxehotel.com', '+855 17 295 283', '+855 17 295 283', '+855 63 763 838', 'http://smiling-hotel.com', 1, 4.0, 36, '2018-09-07', NULL, '130', NULL, 3, 13, '2019-02-05 08:50:35', '2019-02-05 08:50:35', 13, 14, 4, '2019-02-04', 'Smiling Deluxe Hotel is going to close expense budget soon', 'SENGTRY', '0964817070', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (300, 'Sea Breeze Resort', 'St. Otres Beach, Village 6, Commune 4', 1, 6, '', 'Ms. Nataliia Shuba', 'reservation@seabreeze-sihanoukville.com', 'reservation@seabreeze-sihanoukville.com', 'gm@seabreeze-sihanoukville.com', '+855 15 899 796', '+855 15 899 796', '', 'https://seabreeze-sihanoukville.com', 1, 3.0, 18, '2015-02-07', NULL, '50', NULL, 2, 12, '2018-11-01 15:11:35', '2018-11-01 15:11:35', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (301, 'Sabara Angkor Resort & Spa', 'Sfpda Rd, Krong Siem Reap', 1, 1, '', 'Mr. chamnan En', 'gm@sabaraangkorresort.com, fo@sabaraangkorresort.com', 'reservation@sabaraangkorresort.com', 'account@sabaraangkorresort.com', '+855 11 588 830', '+855 11 588 830', '', 'http://sabaraangkorresortandspa.com', 1, 5.0, 35, '2018-10-30', NULL, '50', NULL, 2, 13, '2018-11-08 08:19:55', '2018-11-08 08:19:55', 13, 15, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (302, ' Image d\' Angkor Boutique Villa', 'Airport Road, Kruos Village, Svay Dangkum Siem Reap Cambodia', 1, 1, '', 'Mr. Nit Nimol', 'info@imagedangkor.com', 'info@imagedangkor.com', 'info@imagedangkor.com', '+855 12 466 881', '+855 12 466 881', '', 'http://imagedangkor.com', 3, 3.0, 3, '2018-11-10', NULL, '60', NULL, 2, 12, '2018-11-27 11:00:01', '2018-11-27 11:00:01', 12, 15, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (303, 'Angkor Retreat Villa Boutique & Spa', '0126, Wat Bo Rd., Slorkrame Village | Siem Reap, Siem Reap 063, Cambodia', 1, 1, '', 'Ms. Yin Sokhunthea', 'info@angkorretreat.com', 'info@angkorretreat.com', 'info@angkorretreat.com', '+855 76 789 6565', '+855 76 789 6565', '', 'http://angkorretreat.com', 1, 3.0, 13, '2018-11-16', NULL, '127', NULL, 3, 12, '2019-04-01 14:08:42', '2019-04-01 14:08:42', 12, 14, 4, '2019-04-01', 'Prepare their property ', 'Ms. Len ', '096 431 8059', 5, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (304, 'David Boutique & Spa ', 'Krous Village Road, Siem Reap, Cambodia', 1, 1, '', 'Mr. Narong Piseth', 'mr.piseth121887@gmail.com', 'mr.piseth121887@gmail.com', 'mr.piseth121887@gmail.com', '+855 70 358 788', '+855 70 358 788', '', 'http://davidboutiqueandspa.com', 4, 3.0, 10, '2018-11-15', NULL, '94', NULL, 3, 13, '2019-05-29 09:32:41', '2019-05-29 09:32:41', 13, 14, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (305, 'Norak Soeng Angkor Hotel', '7 Makara Road, | Phum Wat Bo, Sangkat Salakamroeuk, Siem Reap 17254, Cambodia', 1, 1, '', 'Mr. Orm Piseth', 'md@noraksoengangkorhotel.com', 'md@noraksoengangkorhotel.com', 'md@noraksoengangkorhotel.com', '+855 12 229 947', '+855 12 229 947', '', 'http://www.noraksoengangkorhotel.com/', 1, 3.0, 25, '2018-11-14', NULL, '145', NULL, 2, 13, '2019-01-15 09:05:15', '2019-01-15 09:05:15', 13, 14, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (306, 'Grand Champei Residence ', 'Busters Way, Svay Dangkum, Siem Reap, Kingdom of Cambodia.', 1, 1, '', 'Mr. Chin Vichea ', 'Chin.vichea@grandchampei.com', 'Chin.vichea@grandchampei.com', 'Chin.vichea@grandchampei.com', '+855 78 777 246', '+855 78 777 246', '+855 78 777 246', 'http://grandchampei.com', 1, 3.5, 35, '2018-12-08', NULL, '', NULL, 3, 13, '2019-05-29 09:49:05', '2019-05-29 09:49:05', 13, 13, 5, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (307, 'Champey Villa', '#166, Street#22 Wat Bo, Sala Kamreouk | (Near Wat Bo primary school), Siem Reap kh, Cambodia', 1, 1, '17252', 'Mrs. Sebla Kaplan Ure ', 'kalplansebla@gmail.com', 'kalplansebla@gmail.com', 'kalplansebla@gmail.com', '+855 15 765 138', '+855 15 765 138', '', 'http://champeyvilla.com', 3, 3.5, 10, '2018-12-07', NULL, '60', NULL, 3, 13, '2019-05-29 09:41:42', '2019-05-29 09:41:42', 13, 14, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00');
INSERT INTO `eot_customer` VALUES (308, 'Crystal Blue Boutique Hotel', 'No. 169 Sisowath  Daun Penh, Phnom Penh  Cambodia', 1, 2, '', 'Mr. RaBy RY', 'rithraby168@gmail.com', 'rithraby168@gmail.com', 'rithraby168@gmail.com', '+855 96 510 1168', '+855 96 510 1168', '+855 96 510 1168', 'https://www.crystalblueboutiquehotel.com/', 7, 3.5, 12, '2018-12-24', '20', '', NULL, 2, 12, '2018-12-28 13:26:35', '2018-12-28 13:26:35', 12, 13, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` VALUES (309, 'Damnak Villa Retreat 1 ', ' | #92,Group#6,Trapeang Ses, Kork Chak, Siem Reap, Cambodia', 1, 1, '', 'Ith Sakpitou', 'sakpitouith168@gmail.com', 'info@damnakvillaretreat.com, sakpitouith168@gmail.com', 'sakpitouith168@gmail.com', '+855 77 979 711', '', '', 'http://damnakvillaretreat.com', 3, 3.0, 15, '2019-01-05', NULL, '55', NULL, 2, 13, '2019-01-15 09:28:12', '2019-01-15 09:28:12', 13, 14, 4, '2019-01-15', '', '', '', 4, '2019-01-15 00:00:00');
INSERT INTO `eot_customer` VALUES (310, 'Natura Resort', 'Wat Enkosey, Phum Traing, Siem Reap, Cambodia ', 1, 1, '', 'Mr. Meng Morn ', 'operations@naturahotelresort.com', 'operations@naturahotelresort.com', 'operations@naturahotelresort.com', '+855 17 707 526', '+855 17 707 526', '', 'http://naturahotelresort.com', 1, 4.0, 23, '2019-01-19', '21', '100', NULL, 3, 12, '2019-07-01 11:17:40', '2019-07-01 11:17:40', 12, 13, 4, '2019-07-01', 'Save budget for low season ', 'Mr. Meng Morn ', '017 707 526', 5, '2019-02-12 00:00:00');
INSERT INTO `eot_customer` VALUES (311, 'The One Gardening Boutique Hotel', 'Banteay, Chas village, Slor Kram commune Siem Reap, CAMBODIA', 1, 1, '', 'Mr. Zhang Liang', 'gm@theonegardeningboutiquehotel.com', 'reservation@theonegardeningboutiquehotel.com, info@laysungboutique.com', 'gm@theonegardeningboutiquehotel.com', '', '+855 81 216 836', '+855 81 216 836', 'https://theonegardeningboutiquehotel.com', 1, 5.0, 29, '2019-01-30', '30', '130', NULL, 2, 12, '2019-07-19 10:01:07', '2019-07-19 10:01:07', 12, 19, 4, '2019-07-12', 'Due to their budget because they have to work on their new property first.', 'Ms. Keo ', '017 881 224', 5, '2019-02-04 00:00:00');
INSERT INTO `eot_customer` VALUES (312, 'Neth Socheata Hotel ', '(Pub street area)# 284, 2Thnou Street, directly opposite the Old Market, Siem Reap City, Siem Reap Province, Cambodia', 1, 1, '', 'Mrs. Douk Angkea Socheata', 'booking@nethsocheatahotel.com', 'booking@nethsocheatahotel.com', 'booking@nethsocheatahotel.com', '', '+855 63 963 294', '+855 81 832 181', 'http://nethsocheatahotel.com', 1, 2.0, 22, '2019-02-08', NULL, '102', NULL, 2, 12, '2019-02-20 15:59:16', '2019-02-20 15:59:16', 12, 13, 5, '2019-02-11', '', '', '', 4, '2019-02-20 00:00:00');
INSERT INTO `eot_customer` VALUES (313, 'Pool Party Hostel', 'Phsar Krom Road , Vihear Chin Village , Svay Dangkum Commune', 1, 1, '', 'Mr. Mam Soksann', 'poolpartyhostel@gmail.com', 'booking@poolpartyhostel.com, poolpartyhostel@gmail.com', 'poolpartyhostel@gmail.com', '+855 10 303 313', '+855 10 303 313', '', 'http://poolpartyhostel.com', 1, 2.0, 20, '2019-02-11', '26', '130', NULL, 2, 13, '2019-05-29 09:31:31', '2019-05-29 09:31:31', 13, 14, 4, '2019-02-21', '', '', '', 4, '2019-02-21 00:00:00');
INSERT INTO `eot_customer` VALUES (314, 'Best Central Point Hotel ', 'Phnom Penh ', 1, 2, '', 'Mrs. Tha Nimol', 'hometown.hotel@gmail.com', 'hometown.hotel@gmail.com', 'hometown.hotel@gmail.com', '+855 77 556 528', '+855 77 556 528', '+855 77 556 528', 'http://bestcentralpointhotel.com', 1, 3.0, 42, '2019-06-25', '34', '90', NULL, 2, 2, '2019-07-03 14:42:16', '2019-07-03 14:42:16', 2, 19, 5, '2019-06-28', '', '', '', 4, '2019-07-01 00:00:00');
INSERT INTO `eot_customer` VALUES (315, 'Nita Dream Villa', 'Near Siem Reap Court, Chreav Village, Chreav Commune, Siem Reap City', 1, 1, '17254', 'Mrs. Danh Sokhern', 'reservation@nitadreamvilla.com', 'reservation@nitadreamvilla.com', 'reservation@nitadreamvilla.com', '+855 17 410 768', '+855 17 410 768', '', 'http://nitadreamvilla.com', 1, 3.0, 4, '2019-03-04', NULL, '40', NULL, 3, 12, '2019-07-01 15:25:27', '2019-07-01 15:25:27', 12, 2, 4, '2019-07-01', 'Save budget for low season ', 'Ms. Danh Dane ', '015 737 927', 5, '2019-07-01 00:00:00');
INSERT INTO `eot_customer` VALUES (316, 'Wheel Garden Residence ', 'Psa Krolanh Street Trapeang Ses Village, Sangkat Kouk Chak, Siem Reap ', 1, 1, '17259', 'Mr. So', 'sales@wheelgarden.com', 'sales@wheelgarden.com, info@wheelgarden.com', 'acc@wheelgarden.com, gm@wheelgarden.com', '', '+855 12 458 184', '+855 70 487 618', 'http://wheelgarden.com', 1, 4.0, 30, '2019-06-28', NULL, '110', NULL, 2, 12, '2019-07-08 08:22:00', '2019-07-08 08:22:00', 12, 19, 4, '2019-07-08', '', '', '', 2, '2019-07-08 00:00:00');
INSERT INTO `eot_customer` VALUES (317, 'Romantic Angkor Residence ', 'Wat Bo Village, Sala Kamreuk Commune, Siem Reap Cambodia', 1, 1, '', 'Mr. Komsort', 'romanticangkors@gmail.com', 'romanticangkors@gmail.com', 'romanticangkors@gmail.com', '+855 70 770 002', '+855 70 770 002', '+855 70 770 002', 'http://romanticangkor.com', 7, 4.0, 15, '2019-07-08', '35', '110', NULL, 1, 12, '2019-07-08 14:52:54', '2019-07-08 14:52:54', 12, 19, 5, '2019-07-08', '', '', '', 2, '2019-07-08 00:00:00');
INSERT INTO `eot_customer` VALUES (318, 'Moon Flower Residence', 'Old Market Area, Wat Damnak Village, Salakomreuk Commune', 1, 1, '', 'Mr.Sok Piseth', 'info@moonflowersiemreap.com', 'info@moonflowersiemreap.com', 'info@moonflowersiemreap.com', '', '+855 69 700 304', '+855 77 979 711', 'https://damnakvillaboutique.com', 1, 3.0, 8, '2018-07-09', NULL, '85', NULL, 2, 12, '2019-08-07 09:37:43', '2019-08-07 09:37:43', 12, 19, 4, '2019-08-07', '', '', '', 2, '2019-08-07 00:00:00');
INSERT INTO `eot_customer` VALUES (319, 'Siem Reap Palace Residence', 'Siem Reap', 1, 1, '', 'Mr. Borei', 'book@siemreappalace-residence.com', 'book@siemreappalace-residence.com', 'book@siemreappalace-residence.com', '+855 98 675 556', '+855 98 675 556', '+855 98 675 556', 'http://siemreappalace-residence.com', 7, 4.0, 26, '2019-08-06', NULL, '50', NULL, 1, 12, '2019-08-07 10:24:13', '2019-08-07 10:24:13', 12, 19, 4, '2019-08-07', '', '', '', 2, '2019-08-07 00:00:00');

-- ----------------------------
-- Table structure for event_list
-- ----------------------------
DROP TABLE IF EXISTS `event_list`;
CREATE TABLE `event_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `event_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `number_of_audient` int(11) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address_line_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `id_country` int(11) NULL DEFAULT NULL,
  `id_city` int(11) NULL DEFAULT NULL,
  `id_province` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `prefix_phone_code` int(11) NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `prefix_phone_code_line_2` int(11) NULL DEFAULT NULL,
  `phone_number_line_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `from_date` date NULL DEFAULT NULL,
  `to_date` date NULL DEFAULT NULL,
  `fee_for_membership` decimal(10, 2) NULL DEFAULT 0.00,
  `fee_for_subscriber` decimal(10, 2) NULL DEFAULT 0.00,
  `authorized` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of event_list
-- ----------------------------
INSERT INTO `event_list` VALUES (1, '4', 'Village Excursions by Vespa Famtrip', NULL, 'River side', '', 56, 21, 'Palate Restaurant', '', NULL, '', NULL, '', '', 'Time Activity Remarks \r\n\r\n08:00 Pick up from the Hotel Departure exactly on time \r\n08:10 ? 09:00 Ride to countryside fresh palm juice gathering and tasting  \r\n09:00 ? 09:30 Ride and explanation about house temples and stroll over local market \r\n09:30 ? 10:30 Ride to  Wat Svay Romeat Pagoda,  sightseeing,   blessing ceremony and fortune teller  \r\n10:30 ? 11:45 West  Mebon temple island During rainy season transported by   boat and dui during dry season by Vespa \r\n11:45 ? 13:00 Lunch and drinks at private farm picnic  \r\n13:00 ? 13:10 Visit to basket weaving and farming family  13:10 ? 13:35 Visit to sticky rice making and Local medicine   along the road back  \r\n13:30 ? 14:00 Return to hotel and end tour \r\n  \r\nImportant: \r\no The safety of the guests is paramount and all guests must wear helmets. \r\no The price is 40 US$ per person \r\no Each guest is driven by their personal drivers (only holders of local or international driver?s license are eligible to drive in Siem Reap and road conditions demand full concentration). \r\no Every tour is accompanied by a guide. o All snacks, drinks and foods are included in the price of the tour. Individual purchases during the tour are for the account of guests. \r\no The tour program may vary, for instance due to spontaneous extra activities or if an activity should not be available due to circumstances beyond our control. \r\no Guests are advised to use sunscreen and to wear comfortable clothes and footwear that can be cleaned easily.\r\n The tour rides rain or shine. In the monsoon season first- rate raincoats are provided by VA SR ', '2019-07-03 16:39:16', 1, '2019-07-16 14:37:25', 1, 1, '2019-07-12', '2019-07-12', 40.00, 50.00, 1);

-- ----------------------------
-- Table structure for expense
-- ----------------------------
DROP TABLE IF EXISTS `expense`;
CREATE TABLE `expense`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` tinyint(1) NULL DEFAULT NULL,
  `doc_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_related_to` int(11) NULL DEFAULT NULL,
  `id_related_profile` int(11) NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `is_bill` tinyint(1) NULL DEFAULT NULL,
  `chart_of_account` int(11) NULL DEFAULT NULL,
  `chart_of_account_amount` decimal(10, 2) NULL DEFAULT NULL,
  `id_payment_method` int(11) NULL DEFAULT NULL,
  `cheque_number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clearing_date` date NULL DEFAULT NULL,
  `total_amount` decimal(10, 2) NULL DEFAULT NULL,
  `paid_amount` decimal(10, 2) NULL DEFAULT NULL,
  `balance_amount` decimal(10, 2) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for expense_data
-- ----------------------------
DROP TABLE IF EXISTS `expense_data`;
CREATE TABLE `expense_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_expense` int(11) NULL DEFAULT NULL,
  `chart_of_account` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for expense_related_to
-- ----------------------------
DROP TABLE IF EXISTS `expense_related_to`;
CREATE TABLE `expense_related_to`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of expense_related_to
-- ----------------------------
INSERT INTO `expense_related_to` VALUES (1, 'Supplier');
INSERT INTO `expense_related_to` VALUES (2, 'Customer');
INSERT INTO `expense_related_to` VALUES (3, 'Project');

-- ----------------------------
-- Table structure for finance_chart_of_account
-- ----------------------------
DROP TABLE IF EXISTS `finance_chart_of_account`;
CREATE TABLE `finance_chart_of_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NULL DEFAULT NULL,
  `transaction_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `doc_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `debit` decimal(10, 2) NULL DEFAULT NULL,
  `credit` decimal(10, 2) NULL DEFAULT NULL,
  `balance` decimal(10, 2) NULL DEFAULT NULL,
  `account_type` int(11) NULL DEFAULT NULL,
  `chart_of_account` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of finance_chart_of_account
-- ----------------------------
INSERT INTO `finance_chart_of_account` VALUES (3, '2019-09-16', 'Invoice', 'INV19090001', '5', 'customer', 'INV19090001', 0.00, 299.00, 299.00, 1, 1, '2019-09-16 13:07:36', 1, 1, NULL, NULL);
INSERT INTO `finance_chart_of_account` VALUES (4, '2019-09-16', 'Invoice', 'INV19090001', '5', 'customer', 'INV19090001', 299.00, 0.00, 299.00, 45, 63, '2019-09-16 13:07:36', 1, 1, NULL, NULL);
INSERT INTO `finance_chart_of_account` VALUES (13, '2019-10-24', 'Opening Balance', 'CTR19100002', NULL, NULL, 'Opening Balance - TEN THOUSAND DOLLAR', 10000.00, 0.00, 10000.00, 3, 276, '2019-10-24 09:40:24', 1, 1, NULL, NULL);
INSERT INTO `finance_chart_of_account` VALUES (14, '2019-10-24', 'Opening Balance', 'CTR19100002', NULL, NULL, 'Opening Balance - TEN THOUSAND DOLLAR', 0.00, 10000.00, 10000.00, 7, 273, '2019-10-24 09:40:24', 1, 1, NULL, NULL);
INSERT INTO `finance_chart_of_account` VALUES (15, '2019-10-24', 'Expense', 'EXP19100002', '1', 'supplier', '', 110.00, 0.00, 110.00, 46, 237, '2019-10-24 09:40:50', 1, 1, NULL, NULL);
INSERT INTO `finance_chart_of_account` VALUES (16, '2019-10-24', 'Expense', 'EXP19100002', '1', 'supplier', '', 0.00, 110.00, 9890.00, 3, 276, '2019-10-24 09:40:50', 1, 1, NULL, NULL);
INSERT INTO `finance_chart_of_account` VALUES (17, '2019-10-24', 'Expense', 'EXP19100003', '1', 'supplier', '', 110.00, 0.00, 220.00, 46, 237, '2019-10-24 09:41:16', 1, 1, NULL, NULL);
INSERT INTO `finance_chart_of_account` VALUES (18, '2019-10-24', 'Expense', 'EXP19100003', '1', 'supplier', '', 0.00, 110.00, 110.00, 44, 62, '2019-10-24 09:41:16', 1, 1, NULL, NULL);
INSERT INTO `finance_chart_of_account` VALUES (23, '2019-10-24', 'Pay Bill', 'PBI19100002', '1', 'supplier', '', 0.00, 100.00, 9790.00, 3, 276, '2019-10-24 09:48:24', 1, 1, NULL, NULL);
INSERT INTO `finance_chart_of_account` VALUES (24, '2019-10-24', 'Pay Bill', 'PBI19100002', '1', 'supplier', '', 100.00, 0.00, 10.00, 44, 62, '2019-10-24 09:48:24', 1, 1, NULL, NULL);
INSERT INTO `finance_chart_of_account` VALUES (27, '2019-10-24', 'Pay Bill', 'PBI19100001', '1', 'supplier', '', 0.00, 100.00, 9690.00, 3, 276, '2019-10-24 09:51:44', 1, 1, NULL, NULL);
INSERT INTO `finance_chart_of_account` VALUES (28, '2019-10-24', 'Pay Bill', 'PBI19100001', '1', 'supplier', '', 100.00, 0.00, -90.00, 44, 62, '2019-10-24 09:51:44', 1, 1, NULL, NULL);
INSERT INTO `finance_chart_of_account` VALUES (29, '2019-10-24', 'Pay Bill', 'PBI19100003', '1', 'supplier', '', 0.00, 10.00, 10.00, 3, 276, '2019-10-24 09:52:58', 1, 0, '2019-10-24 09:53:23', 1);
INSERT INTO `finance_chart_of_account` VALUES (30, '2019-10-24', 'Pay Bill', 'PBI19100003', '1', 'supplier', '', 10.00, 0.00, 10.00, 44, 62, '2019-10-24 09:52:58', 1, 0, '2019-10-24 09:53:23', 1);
INSERT INTO `finance_chart_of_account` VALUES (31, '2019-10-24', 'Pay Bill', 'PBI19100004', '1', 'supplier', '', 0.00, 10.00, 9680.00, 3, 276, '2019-10-24 10:01:54', 1, 1, NULL, NULL);
INSERT INTO `finance_chart_of_account` VALUES (32, '2019-10-24', 'Pay Bill', 'PBI19100004', '1', 'supplier', '', 10.00, 0.00, -100.00, 44, 62, '2019-10-24 10:01:54', 1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for finance_chart_of_account_amount
-- ----------------------------
DROP TABLE IF EXISTS `finance_chart_of_account_amount`;
CREATE TABLE `finance_chart_of_account_amount`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type` int(11) NULL DEFAULT NULL,
  `chart_of_account` int(11) NULL DEFAULT NULL,
  `ending_balance` decimal(10, 2) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of finance_chart_of_account_amount
-- ----------------------------
INSERT INTO `finance_chart_of_account_amount` VALUES (1, 9, 51, 0.00, '4', 'Employee');

-- ----------------------------
-- Table structure for finance_journal_entry
-- ----------------------------
DROP TABLE IF EXISTS `finance_journal_entry`;
CREATE TABLE `finance_journal_entry`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_account` int(11) NULL DEFAULT NULL,
  `to_account` int(11) NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  `amount_in_word` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for finance_opening_balance
-- ----------------------------
DROP TABLE IF EXISTS `finance_opening_balance`;
CREATE TABLE `finance_opening_balance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_chart_of_account` int(11) NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  `amount_in_word` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of finance_opening_balance
-- ----------------------------
INSERT INTO `finance_opening_balance` VALUES (1, 'CTR19100001', 276, '2019-10-19', 53.71, 'FIFTY THREE POINT SEVEN ONE DOLLAR', '', NULL, NULL, 0, 1, '2019-10-19 08:24:35');
INSERT INTO `finance_opening_balance` VALUES (2, 'CTR19100002', 276, '2019-10-24', 10000.00, 'TEN THOUSAND DOLLAR', '', NULL, NULL, 1, 1, '2019-10-24 09:40:24');

-- ----------------------------
-- Table structure for finance_pay_bill
-- ----------------------------
DROP TABLE IF EXISTS `finance_pay_bill`;
CREATE TABLE `finance_pay_bill`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_related_to` int(11) NULL DEFAULT NULL,
  `id_related_profile` int(11) NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `id_chart_of_account` int(11) NULL DEFAULT NULL,
  `id_payment_method` int(11) NULL DEFAULT NULL,
  `cheque_number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clearing_date` date NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of finance_pay_bill
-- ----------------------------
INSERT INTO `finance_pay_bill` VALUES (1, 'PBI19100001', 1, 1, '2019-10-24', 276, 1, '', NULL, 100.00, '', 1, '2019-10-24 09:41:40', 1, '2019-10-24 09:51:44', 1);
INSERT INTO `finance_pay_bill` VALUES (2, 'PBI19100002', 1, 1, '2019-10-24', 276, 1, '', NULL, 100.00, '', 1, '2019-10-24 09:41:41', 1, '2019-10-24 09:48:24', 1);
INSERT INTO `finance_pay_bill` VALUES (3, 'PBI19100003', 1, 1, '2019-10-24', 276, 1, '', NULL, 10.00, '', 1, '2019-10-24 09:52:58', 1, '2019-10-24 09:53:23', 5);
INSERT INTO `finance_pay_bill` VALUES (4, 'PBI19100004', 1, 1, '2019-10-24', 276, 1, '', NULL, 10.00, '', 1, '2019-10-24 10:01:54', NULL, NULL, 1);

-- ----------------------------
-- Table structure for finance_pay_bill_data
-- ----------------------------
DROP TABLE IF EXISTS `finance_pay_bill_data`;
CREATE TABLE `finance_pay_bill_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_bill_id` int(11) NULL DEFAULT NULL,
  `bill_date` date NULL DEFAULT NULL,
  `bill_id` int(11) NULL DEFAULT NULL,
  `doc_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_amount` decimal(10, 2) NULL DEFAULT NULL,
  `paid_amount` decimal(10, 2) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of finance_pay_bill_data
-- ----------------------------
INSERT INTO `finance_pay_bill_data` VALUES (3, 2, '2019-10-24', 3, 'EXP19100003', 'test pay bill', 110.00, 100.00, 1);
INSERT INTO `finance_pay_bill_data` VALUES (5, 1, '2019-10-24', 3, 'EXP19100003', 'test pay bill', 110.00, 100.00, 1);
INSERT INTO `finance_pay_bill_data` VALUES (6, 3, '2019-10-24', 3, 'EXP19100003', '', 10.00, 10.00, 1);
INSERT INTO `finance_pay_bill_data` VALUES (7, 4, '2019-10-24', 3, 'EXP19100003', '', 110.00, 10.00, 1);

-- ----------------------------
-- Table structure for folder
-- ----------------------------
DROP TABLE IF EXISTS `folder`;
CREATE TABLE `folder`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `id_membership_profile` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `id_document_permission` int(1) NULL DEFAULT NULL,
  `id_event_list` int(11) NULL DEFAULT NULL,
  `id_employee_profile` int(11) NULL DEFAULT NULL,
  `id_customer_profile` int(11) NULL DEFAULT NULL,
  `id_project` int(11) NULL DEFAULT NULL,
  `id_contract` int(11) NULL DEFAULT NULL,
  `id_lead_profile` int(11) NULL DEFAULT NULL,
  `id_standard_operation_procedure_set_up` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of folder
-- ----------------------------
INSERT INTO `folder` VALUES (2, 'Flow Chart', NULL, 1, 23, '2019-09-09 14:03:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14);
INSERT INTO `folder` VALUES (3, 'Pholly Handle', NULL, 1, 23, '2019-09-09 19:13:22', NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `folder` VALUES (8, 'Contract', NULL, 1, 16, '2019-09-17 08:52:35', NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL);
INSERT INTO `folder` VALUES (9, 'Web Developer', '', 1, 1, '2019-09-17 15:23:55', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `folder` VALUES (10, 'Contract', NULL, 1, 16, '2019-09-20 14:22:58', NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL);
INSERT INTO `folder` VALUES (13, 'BMS Contracts', '', 1, 20, '2019-09-25 10:31:19', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `folder` VALUES (14, 'Contract', NULL, 1, 16, '2019-09-26 13:53:25', NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL);
INSERT INTO `folder` VALUES (15, 'User Manual', NULL, 1, 14, '2019-10-10 13:50:36', NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL);
INSERT INTO `folder` VALUES (18, 'Contract', NULL, 1, 16, '2019-10-16 11:19:57', NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL);
INSERT INTO `folder` VALUES (19, 'Document Refferent', NULL, 1, 1, '2019-10-18 17:12:04', NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL);
INSERT INTO `folder` VALUES (20, 'Document reference', NULL, 1, 14, '2019-10-21 13:47:59', NULL, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for hls_solutions
-- ----------------------------
DROP TABLE IF EXISTS `hls_solutions`;
CREATE TABLE `hls_solutions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hls_solutions
-- ----------------------------
INSERT INTO `hls_solutions` VALUES (1, 'Booking Engine', 'fa fa-cog', NULL, b'1');
INSERT INTO `hls_solutions` VALUES (2, 'Front Desk', 'fa fa-desktop', NULL, b'1');
INSERT INTO `hls_solutions` VALUES (3, 'Website', 'fa fa-id-card', NULL, b'1');
INSERT INTO `hls_solutions` VALUES (4, 'Boooking Widget', 'fa fa-file-code-o', NULL, b'1');
INSERT INTO `hls_solutions` VALUES (5, 'Mobile Website', 'fa fa-mobile', NULL, b'1');
INSERT INTO `hls_solutions` VALUES (6, 'Social Media', 'fa fa-users', NULL, b'1');
INSERT INTO `hls_solutions` VALUES (7, 'Channel Manager', 'fa fa-snowflake-o', NULL, b'1');
INSERT INTO `hls_solutions` VALUES (8, 'Reputation Manager', 'fa fa-comment', NULL, b'1');
INSERT INTO `hls_solutions` VALUES (9, 'eO-DMC', 'fa fa-wpexplorer', NULL, b'1');
INSERT INTO `hls_solutions` VALUES (10, 'eO-CSMA', 'fa fa-mobile', NULL, b'1');
INSERT INTO `hls_solutions` VALUES (11, 'eO-BMS', 'fa fa-line-chart', NULL, b'1');

-- ----------------------------
-- Table structure for hr_approval_permission
-- ----------------------------
DROP TABLE IF EXISTS `hr_approval_permission`;
CREATE TABLE `hr_approval_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approver_id` int(11) NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` date NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hr_approval_permission
-- ----------------------------
INSERT INTO `hr_approval_permission` VALUES (1, 1, '2019-10-08', 1, NULL, NULL, 1);

-- ----------------------------
-- Table structure for hr_approval_permission_data
-- ----------------------------
DROP TABLE IF EXISTS `hr_approval_permission_data`;
CREATE TABLE `hr_approval_permission_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hr_approval_permission_id` int(11) NULL DEFAULT NULL,
  `employee_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hr_approval_permission_department
-- ----------------------------
DROP TABLE IF EXISTS `hr_approval_permission_department`;
CREATE TABLE `hr_approval_permission_department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hr_approval_permission_id` int(11) NULL DEFAULT NULL,
  `department_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hr_approval_permission_department
-- ----------------------------
INSERT INTO `hr_approval_permission_department` VALUES (1, 1, 2);

-- ----------------------------
-- Table structure for invoice_status
-- ----------------------------
DROP TABLE IF EXISTS `invoice_status`;
CREATE TABLE `invoice_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `css_class` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of invoice_status
-- ----------------------------
INSERT INTO `invoice_status` VALUES (1, 'PAID', 'label-info', 1);
INSERT INTO `invoice_status` VALUES (2, 'OVERDUE', 'label-warning', 1);
INSERT INTO `invoice_status` VALUES (3, 'PARTIALLY PAID', 'label-success', 1);
INSERT INTO `invoice_status` VALUES (4, 'UNPAID', 'label-mint', 1);
INSERT INTO `invoice_status` VALUES (5, 'VOIDED', 'label-danger', 1);

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `long_description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `short_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rate` decimal(10, 2) NULL DEFAULT NULL,
  `setup_fee` decimal(10, 2) NULL DEFAULT 0.00,
  `id_tax` int(11) NULL DEFAULT NULL,
  `id_group` int(11) NULL DEFAULT NULL,
  `unit` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for item_data
-- ----------------------------
DROP TABLE IF EXISTS `item_data`;
CREATE TABLE `item_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) NULL DEFAULT NULL,
  `id_data` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for item_group
-- ----------------------------
DROP TABLE IF EXISTS `item_group`;
CREATE TABLE `item_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_by` int(11) NULL DEFAULT NULL,
  `credit_arrangment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cancellation_agreement` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `confidentiality` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(11) NULL DEFAULT NULL,
  `main_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `inclusive_benefit` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `plan_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `setup_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for item_group_data
-- ----------------------------
DROP TABLE IF EXISTS `item_group_data`;
CREATE TABLE `item_group_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_type` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for item_group_department
-- ----------------------------
DROP TABLE IF EXISTS `item_group_department`;
CREATE TABLE `item_group_department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item_group` int(11) NULL DEFAULT NULL,
  `id_department` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 220 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of item_group_department
-- ----------------------------
INSERT INTO `item_group_department` VALUES (135, 2, 2);
INSERT INTO `item_group_department` VALUES (137, 3, 2);
INSERT INTO `item_group_department` VALUES (143, 5, 2);
INSERT INTO `item_group_department` VALUES (144, 6, 2);
INSERT INTO `item_group_department` VALUES (145, 7, 4);
INSERT INTO `item_group_department` VALUES (153, 10, 2);
INSERT INTO `item_group_department` VALUES (154, 10, 3);
INSERT INTO `item_group_department` VALUES (155, 9, 2);
INSERT INTO `item_group_department` VALUES (156, 9, 3);
INSERT INTO `item_group_department` VALUES (164, 4, 1);
INSERT INTO `item_group_department` VALUES (165, 4, 4);
INSERT INTO `item_group_department` VALUES (166, 4, 5);
INSERT INTO `item_group_department` VALUES (182, 1, 1);
INSERT INTO `item_group_department` VALUES (183, 1, 2);
INSERT INTO `item_group_department` VALUES (184, 1, 5);
INSERT INTO `item_group_department` VALUES (196, 11, 1);
INSERT INTO `item_group_department` VALUES (197, 11, 2);
INSERT INTO `item_group_department` VALUES (198, 11, 5);
INSERT INTO `item_group_department` VALUES (199, 8, 1);
INSERT INTO `item_group_department` VALUES (200, 8, 2);
INSERT INTO `item_group_department` VALUES (201, 8, 5);
INSERT INTO `item_group_department` VALUES (217, 12, 1);
INSERT INTO `item_group_department` VALUES (218, 12, 2);
INSERT INTO `item_group_department` VALUES (219, 12, 5);

-- ----------------------------
-- Table structure for item_group_template_detail
-- ----------------------------
DROP TABLE IF EXISTS `item_group_template_detail`;
CREATE TABLE `item_group_template_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item_group` int(11) NULL DEFAULT NULL,
  `id_item_group_type` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 809 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of item_group_template_detail
-- ----------------------------
INSERT INTO `item_group_template_detail` VALUES (484, 2, 17, 'Main Feature', '. Expand the list of OTAs you work with.\r\n. Ensure all OTAs and your website have the same rates.\r\n. Ensure all OTAs have the same room availability.');
INSERT INTO `item_group_template_detail` VALUES (486, 3, 17, 'Main Feature', '. Ensure all the Room types are matched in the system.\r\n. Ensure all OTAs and your website have the same rates and connected.\r\n. Ensure all the training of the system.');
INSERT INTO `item_group_template_detail` VALUES (523, 5, 17, 'Main Feature', '? Install an optimized booking widget on your website.\r\n? Allow travelers to make secure payments online.');
INSERT INTO `item_group_template_detail` VALUES (524, 6, 16, 'Main Feature', '. Design and Build your website look and feel.\r\n. Optimize your website for search engines.\r\n. Enhance the loading speed of your website.\r\n. Free hosting and domain.');
INSERT INTO `item_group_template_detail` VALUES (525, 7, 5, 'Create quotes in minutes', 'eO-DMCs increases productivity 10 times and more. ');
INSERT INTO `item_group_template_detail` VALUES (526, 7, 5, 'Powerful tailor-made itineraries', 'Create quality tailor-made itineraries rapidly. ');
INSERT INTO `item_group_template_detail` VALUES (527, 7, 6, 'Dynamic pricing', 'Flexible tour Pricing responding to different seasons, markets, and other arrangements.');
INSERT INTO `item_group_template_detail` VALUES (528, 7, 7, 'Accounting software compatible', 'Easily push information from tour operator software into back- office accounting software giving  a consistent flow of information from the booking through to reconciliation.');
INSERT INTO `item_group_template_detail` VALUES (529, 7, 4, 'Inbuilt CRM functionality', 'eO-DMCs provided CRM tailor made for business.');
INSERT INTO `item_group_template_detail` VALUES (530, 7, 6, 'Grow sales and increase profits', 'eO-DMCs manages clients file rapidly decreasing processing time. Staff can increase gross sales.\r\neO-DMCs allows you to invest more in sales and marketing by spending less on processing.');
INSERT INTO `item_group_template_detail` VALUES (533, 10, 4, '', '');
INSERT INTO `item_group_template_detail` VALUES (534, 9, 16, 'Main Feature', '. 7 GB Disk space.\r\n. 70 GB Bandwidth.\r\n. CMS available to install: WordPress, Joomla or Drupal. Etc. 70USD / Per year.\r\n. Domain .com.\r\n. 5 My SQL Database.\r\n. 25 Email accounts.');
INSERT INTO `item_group_template_detail` VALUES (653, 4, 4, 'Supplier Profile', '. Manage all your supplier or partner profiles and contacts');
INSERT INTO `item_group_template_detail` VALUES (654, 4, 4, 'Customer', '. Profile: general information of your customers. \r\n. Contact: create multiple contacts for your customers. \r\n. Solution: list of products or services which the customers are using. \r\n. Invoice: keep in track your invoices and items. \r\n. Payment: Track payment from invoices which are paid. \r\n. Contract: record all your customers contracts. \r\n. Proposals: create attractive proposals for customers and increase sales. \r\n. Project: keep track of your customer?s projects. \r\n. Task: keep track of tasks between customers. \r\n. Documentation: upload and manage related customer?s documents. \r\n. Note: Make notes on customers unique needed.  \r\n. Import Data: Import or upload multiple customer?s information (new customers).');
INSERT INTO `item_group_template_detail` VALUES (655, 4, 4, 'Leads', '. Profile: general information of your leads.\r\n. Proposals: create attractive proposals for leads and increase sales.\r\n. Task: keep track of tasks from leads.\r\n. Documentation: upload and manage related lead documents.\r\n. Note: Make note on leads.\r\n. Import Data: Import or upload multiple customer’s information (new leads).');
INSERT INTO `item_group_template_detail` VALUES (656, 4, 5, 'Overview', '. Overview details and track time spent on project for each staff member.');
INSERT INTO `item_group_template_detail` VALUES (657, 4, 5, 'Task', '. Split project into tasks and checklists of activities.');
INSERT INTO `item_group_template_detail` VALUES (658, 4, 5, 'Timesheet', '. Monitoring report on activities in each project.');
INSERT INTO `item_group_template_detail` VALUES (659, 4, 5, 'Sales Invoice', '. Generate the project invoice records to bill your customers promptly.');
INSERT INTO `item_group_template_detail` VALUES (660, 4, 5, 'Sales Payment', '. Record project transaction invoices to bill your customers promptly.');
INSERT INTO `item_group_template_detail` VALUES (661, 4, 5, 'Sales Quotation', '. Create and send quotations rapidly with note of next actions. \r\n. Ability to convert the quotation to invoice after customer accepts.');
INSERT INTO `item_group_template_detail` VALUES (662, 4, 5, 'Documentation', '. Upload and manage related project documents.');
INSERT INTO `item_group_template_detail` VALUES (663, 4, 5, 'Note', '. Make note on projects.');
INSERT INTO `item_group_template_detail` VALUES (664, 4, 5, 'Project Copy', '. Ability to clone project easily.');
INSERT INTO `item_group_template_detail` VALUES (665, 4, 6, 'Proposal', '. Create attractive proposals for leads or customers to increase sales.');
INSERT INTO `item_group_template_detail` VALUES (666, 4, 6, 'Quotation', '. Create and send quotations rapidly with note of next actions. ');
INSERT INTO `item_group_template_detail` VALUES (667, 4, 6, 'Contract', '. Add new contracts easily based on your clients. \r\n. Consolidate contracts by dates. ');
INSERT INTO `item_group_template_detail` VALUES (668, 4, 6, 'Item', '. Create final items or products for sales.');
INSERT INTO `item_group_template_detail` VALUES (669, 4, 6, 'Item Group', '. Create item group to separate items or products.');
INSERT INTO `item_group_template_detail` VALUES (670, 4, 7, 'Invoice', '. Keep track of invoices, items and generate reports.');
INSERT INTO `item_group_template_detail` VALUES (671, 4, 7, 'Payment', '. Record payment from invoices.');
INSERT INTO `item_group_template_detail` VALUES (672, 4, 7, 'Payroll', '. Notification of payroll request from HR.');
INSERT INTO `item_group_template_detail` VALUES (673, 4, 7, 'Expense', '. Records company, supplier and project expenses.');
INSERT INTO `item_group_template_detail` VALUES (674, 4, 8, 'S.O.P Set Up', '. Create Standard Operation Procedure (S.O.P) based on each departments unique  S.O.P.');
INSERT INTO `item_group_template_detail` VALUES (675, 4, 8, 'S.O.P', '. Create S.O.P to track time and achievements based on milestones. \r\n. Ability to Drag and Drop S.O.P between milestones.');
INSERT INTO `item_group_template_detail` VALUES (676, 4, 9, 'Goal Set Up', '. Ability for employee to set their goals by time or date and track achievements as K.P.I (Key Performance Indicator).');
INSERT INTO `item_group_template_detail` VALUES (677, 4, 10, 'Employee', '. Each employee allocated a dashboard which allow them to easily organize their work. Manage employees from one place.');
INSERT INTO `item_group_template_detail` VALUES (678, 4, 10, 'Knowledge Base', '. Share knowledge-based articles with your team or customers. ');
INSERT INTO `item_group_template_detail` VALUES (679, 4, 10, 'Cash Advance Request', '. Record employee request for cash advances and notification of HR decision.');
INSERT INTO `item_group_template_detail` VALUES (680, 4, 10, 'Leave Application', '. Record employees leave request.');
INSERT INTO `item_group_template_detail` VALUES (681, 4, 10, 'Payroll Request', '. Organize monthly payroll with the ability to deduct employee cash advances.');
INSERT INTO `item_group_template_detail` VALUES (682, 4, 11, 'Budget Setup', '. Create budget setup and track achievements. Track both budget plan and milestones.');
INSERT INTO `item_group_template_detail` VALUES (683, 4, 11, 'Comparing Actual/Budget', '. Compare budget setup and achievements to assess sales performance.');
INSERT INTO `item_group_template_detail` VALUES (684, 4, 12, 'Document Library', '. Upload files in document library. Each employee provided with their own files.');
INSERT INTO `item_group_template_detail` VALUES (685, 4, 16, 'Responsive', '. eOBMS is fully responsive, easily access data from mobile or tablet.');
INSERT INTO `item_group_template_detail` VALUES (686, 4, 18, 'Employee Report', '. Employees Report\r\n. Projects Report\r\n. Tasks Report');
INSERT INTO `item_group_template_detail` VALUES (687, 4, 18, 'Sales Report', '. Invoice Report\r\n. Proposals Report\r\n. Quotations Report');
INSERT INTO `item_group_template_detail` VALUES (688, 4, 18, 'Finance Report', '. Chart of accounts');
INSERT INTO `item_group_template_detail` VALUES (763, 1, 16, 'Unique Layout', 'Inspiring and exclusive layout to showcase the unique quality of each business.');
INSERT INTO `item_group_template_detail` VALUES (764, 1, 16, 'Default Template Page', 'Home Page, Room (Listing + Detail), Facility & Service (Listing & Detail), Package (Listing & Detail), Blog (Listing & Detail), About Us, Contact Us, Gallery');
INSERT INTO `item_group_template_detail` VALUES (765, 1, 16, 'Add more pages', 'Add up to 10 additional pages to your website.');
INSERT INTO `item_group_template_detail` VALUES (766, 1, 16, 'SEO (Yeast)', 'Plugin to manage content that is visible on search engines and help to maximize website ranking.');
INSERT INTO `item_group_template_detail` VALUES (767, 1, 16, 'Cache System', 'To improve website speed and the ranking of the website on search engines');
INSERT INTO `item_group_template_detail` VALUES (768, 1, 16, 'Security', 'High Level website security to prevent website data being compromised.');
INSERT INTO `item_group_template_detail` VALUES (769, 1, 16, 'Responsive', 'Adaptability to any screen size, Desktop, Tablet, Mobile.');
INSERT INTO `item_group_template_detail` VALUES (770, 1, 16, 'Google MY Business', 'Website will appear on Google My Business at right side while searching by business name.');
INSERT INTO `item_group_template_detail` VALUES (771, 1, 16, 'Google Maps', 'Your property will be connected to Google Maps.');
INSERT INTO `item_group_template_detail` VALUES (772, 1, 16, 'Web Mail', 'Professional business email services.');
INSERT INTO `item_group_template_detail` VALUES (773, 1, 16, 'Form Captcha', 'Security enabled to ensure contact is not a malicious internet robot.');
INSERT INTO `item_group_template_detail` VALUES (774, 1, 16, 'Fav Icon', 'Unique file containing small icons to identify services or amenities in the website.');
INSERT INTO `item_group_template_detail` VALUES (775, 1, 16, 'Hide WordPress Error', 'Hide the error in WordPress.');
INSERT INTO `item_group_template_detail` VALUES (776, 1, 16, 'Contact form', 'The website able to manage multiple contact forms, including customized forms and mail contents flexibly with simple markup. Supported by Ajax-powered submission, CAPTCHA security and, Akismet spam filtering.');
INSERT INTO `item_group_template_detail` VALUES (782, 11, 16, 'Default Page', '•	Home page\r\n•	Room (Listing + Detail)\r\n•	Facility & Service (Listing + Detail)\r\n•	Package (Listing + Detail)\r\n•	Blog (Listing + Detail)\r\n•	About Us\r\n•	Contact Us\r\n•	Gallery\r\n•	Total: 12 Pages\r\n');
INSERT INTO `item_group_template_detail` VALUES (793, 8, 17, 'Main Feature', '. Company able to monitor and manage Accommodation, Restaurant, Spa or Tour Reservations\r\n. View Restaurant menus and place food or drink orders including pre-orders.\r\n. Online hotel directory, making cumbersome paper in-room compendiums redundant.\r\n. Tour and Activity recommendations including a customer booking system.\r\n. Spa Menu including a customer booking system.\r\n. Special promotion notifications sent to guests or customers.');
INSERT INTO `item_group_template_detail` VALUES (794, 8, 20, 'Login', '. Multi Methods, Secure with beautiful Login Interface\r\n. Designed to match your business style.');
INSERT INTO `item_group_template_detail` VALUES (795, 8, 20, 'Dashboard', '. Modern Interface Design.\r\n. Digital Content Provide relevant information to attract potential customer.\r\n. ​Business’s product and service’s data center, for use by customer.');
INSERT INTO `item_group_template_detail` VALUES (796, 8, 20, 'Restaurant', '. Provides information about Food and Beverage available in restaurant.\r\n. Online Ordering by App\r\n. Categorized menu items\r\n. Each menu item includes:\r\n  . Description\r\n  . Feature and Gallery Image\r\n  . Related item\r\n  . Price by dish varieties \r\n  . Add to cart for ordering ');
INSERT INTO `item_group_template_detail` VALUES (797, 8, 20, 'Spa', '. Provide variety with spa treatments and services\r\n. The spa package categorized into different treatment varieties\r\n. Each item includes:\r\n  . Description\r\n  . Feature and Gallery Image \r\n  . Related item\r\n  . Package Price by hour \r\n  . Multi customer Booking\r\n  . Add to cart for booking');
INSERT INTO `item_group_template_detail` VALUES (798, 8, 20, 'Tour Package', '. Tour itinerary detail\r\n. Each menu item includes:\r\n  . Description\r\n  . Feature and Gallery Image\r\n  . Itinerary Description\r\n  . Itinerary Feature Image\r\n  . Included & Excluded Items\r\n  . Related item\r\n  . Price by package \r\n  . Multi customer Booking\r\n  . Add to cart for booking');
INSERT INTO `item_group_template_detail` VALUES (799, 8, 20, 'Accommodation', '. Ability to attach the Booking Widget (Booking Engine Platform) to custom mobile application.\r\n. Ability to drive direct booking from clients.');
INSERT INTO `item_group_template_detail` VALUES (800, 8, 20, 'Check out', '. Automatically fill in customer information.\r\n. Faster and more convenient.');
INSERT INTO `item_group_template_detail` VALUES (801, 8, 20, 'Order History', '. Provide customer with information on their recent order and current reservation status and progress.');
INSERT INTO `item_group_template_detail` VALUES (802, 8, 20, 'Chat', '. Instant chat to logged-in customer. \r\n. Push promotion notifications.');
INSERT INTO `item_group_template_detail` VALUES (808, 12, 21, 'Features', '*	Photograph shooting, maximum of 35 images.\r\n*	Video shooting, maximum of 5 minutes.\r\n');

-- ----------------------------
-- Table structure for item_group_type
-- ----------------------------
DROP TABLE IF EXISTS `item_group_type`;
CREATE TABLE `item_group_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for knowledge_base
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_base`;
CREATE TABLE `knowledge_base`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `slug` varbinary(255) NULL DEFAULT NULL,
  `group` int(11) NULL DEFAULT NULL,
  `internal_article` tinyint(1) NULL DEFAULT NULL COMMENT '1= yes, 0 = No',
  `disabled` tinyint(1) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `short_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of knowledge_base
-- ----------------------------
INSERT INTO `knowledge_base` VALUES (2, 'Sao nang', NULL, NULL, 0, 0, '', '2019-09-20 08:06:16', 27, NULL, NULL, '');

-- ----------------------------
-- Table structure for knowledge_base_position
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_base_position`;
CREATE TABLE `knowledge_base_position`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_knowledge_base` int(11) NULL DEFAULT NULL,
  `id_position` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of knowledge_base_position
-- ----------------------------
INSERT INTO `knowledge_base_position` VALUES (1, 2, '6');

-- ----------------------------
-- Table structure for lead_profile
-- ----------------------------
DROP TABLE IF EXISTS `lead_profile`;
CREATE TABLE `lead_profile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `latitute` decimal(16, 10) NULL DEFAULT NULL,
  `longitute` decimal(16, 10) NULL DEFAULT NULL,
  `address` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_country` int(11) NULL DEFAULT NULL,
  `id_city` int(11) NULL DEFAULT NULL,
  `group_names` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `billing_address` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_billing_city` int(11) NULL DEFAULT NULL,
  `id_billing_country` int(11) NULL DEFAULT NULL,
  `shipping_address` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_shipping_city` int(11) NULL DEFAULT NULL,
  `id_shipping_country` int(11) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `zip_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_status` int(1) NULL DEFAULT NULL,
  `assigned_to` int(11) NULL DEFAULT NULL,
  `id_source` int(11) NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `star_rating` decimal(10, 2) NULL DEFAULT NULL,
  `id_customer_type` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lead_profile_note
-- ----------------------------
DROP TABLE IF EXISTS `lead_profile_note`;
CREATE TABLE `lead_profile_note`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(11) NULL DEFAULT NULL,
  `id_lead_profile` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for leave_application
-- ----------------------------
DROP TABLE IF EXISTS `leave_application`;
CREATE TABLE `leave_application`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_approver` int(11) NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_employee` int(11) NULL DEFAULT NULL,
  `is_half_day` tinyint(1) NULL DEFAULT NULL,
  `id_leave_type_name` int(11) NULL DEFAULT NULL,
  `leave_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reject_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_leave_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `number_of_day` int(11) NULL DEFAULT NULL,
  `contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address_during_leave` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for leave_applicationx
-- ----------------------------
DROP TABLE IF EXISTS `leave_applicationx`;
CREATE TABLE `leave_applicationx`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_approver` int(11) NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_employee` int(11) NULL DEFAULT NULL,
  `is_half_day` tinyint(1) NULL DEFAULT NULL,
  `id_leave_type_name` int(11) NULL DEFAULT NULL,
  `leave_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reject_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_leave_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of leave_applicationx
-- ----------------------------
INSERT INTO `leave_applicationx` VALUES (2, NULL, '2019-09-26', '2019-09-26', NULL, 4, 0, 6, 'Go to Phnom Penh', '', '1', 15, '2019-09-25 10:34:52', NULL, NULL);

-- ----------------------------
-- Table structure for leave_in_the_year
-- ----------------------------
DROP TABLE IF EXISTS `leave_in_the_year`;
CREATE TABLE `leave_in_the_year`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varbinary(255) NULL DEFAULT NULL,
  `id_year_list` int(11) NULL DEFAULT NULL,
  `id_month_list` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of leave_in_the_year
-- ----------------------------
INSERT INTO `leave_in_the_year` VALUES (1, 0x54657374696E67204C65617665, 1, 1, 1, 22, '2019-08-19 15:41:37', NULL, NULL);

-- ----------------------------
-- Table structure for leave_in_the_year_data
-- ----------------------------
DROP TABLE IF EXISTS `leave_in_the_year_data`;
CREATE TABLE `leave_in_the_year_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_leave_in_the_year` int(11) NULL DEFAULT NULL,
  `leave_type_value` int(11) NULL DEFAULT NULL,
  `id_leave_type` int(11) NULL DEFAULT NULL,
  `id_month_list` int(11) NULL DEFAULT NULL,
  `id_year_list` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of leave_in_the_year_data
-- ----------------------------
INSERT INTO `leave_in_the_year_data` VALUES (1, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `leave_in_the_year_data` VALUES (2, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `leave_in_the_year_data` VALUES (3, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `leave_in_the_year_data` VALUES (4, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `leave_in_the_year_data` VALUES (5, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `leave_in_the_year_data` VALUES (6, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `leave_in_the_year_data` VALUES (7, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `leave_in_the_year_data` VALUES (8, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `leave_in_the_year_data` VALUES (9, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `leave_in_the_year_data` VALUES (10, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for leave_monthly
-- ----------------------------
DROP TABLE IF EXISTS `leave_monthly`;
CREATE TABLE `leave_monthly`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_employee` int(11) NULL DEFAULT NULL,
  `id_month` int(11) NULL DEFAULT NULL,
  `id_year` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for leave_monthly_data
-- ----------------------------
DROP TABLE IF EXISTS `leave_monthly_data`;
CREATE TABLE `leave_monthly_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_leave_monthly` int(11) NULL DEFAULT NULL,
  `id_leave_type` int(11) NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for leave_role
-- ----------------------------
DROP TABLE IF EXISTS `leave_role`;
CREATE TABLE `leave_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of leave_role
-- ----------------------------
INSERT INTO `leave_role` VALUES (1, 'Maximum of leaving Day. ', 11, '2017-12-13 17:33:19', 1, 11, '2017-12-13 17:33:19');

-- ----------------------------
-- Table structure for leave_setup
-- ----------------------------
DROP TABLE IF EXISTS `leave_setup`;
CREATE TABLE `leave_setup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_month` int(11) NULL DEFAULT NULL,
  `id_year` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for leave_setup_data
-- ----------------------------
DROP TABLE IF EXISTS `leave_setup_data`;
CREATE TABLE `leave_setup_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_leave_setup` int(11) NULL DEFAULT NULL,
  `id_leave_type` int(11) NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for leave_status
-- ----------------------------
DROP TABLE IF EXISTS `leave_status`;
CREATE TABLE `leave_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `css` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `approve_status_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of leave_status
-- ----------------------------
INSERT INTO `leave_status` VALUES (1, 'label-warning', 'Pending');
INSERT INTO `leave_status` VALUES (2, 'label-success', 'Approved');
INSERT INTO `leave_status` VALUES (3, 'label-danger', 'Rejected');

-- ----------------------------
-- Table structure for leave_type_condition
-- ----------------------------
DROP TABLE IF EXISTS `leave_type_condition`;
CREATE TABLE `leave_type_condition`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of leave_type_condition
-- ----------------------------
INSERT INTO `leave_type_condition` VALUES (1, 'Paid', 11, '2017-12-13 17:32:50', 1, 11, '2017-12-13 17:32:50');
INSERT INTO `leave_type_condition` VALUES (2, 'Unpaid', 11, '2017-12-13 17:32:56', 1, 11, '2017-12-13 17:32:56');
INSERT INTO `leave_type_condition` VALUES (3, 'Compensatory Off', 11, '2017-12-13 17:33:01', 1, 11, '2017-12-13 17:33:01');
INSERT INTO `leave_type_condition` VALUES (4, 'On Duty', 11, '2017-12-13 17:33:06', 1, 11, '2017-12-13 17:33:06');

-- ----------------------------
-- Table structure for leave_type_name
-- ----------------------------
DROP TABLE IF EXISTS `leave_type_name`;
CREATE TABLE `leave_type_name`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shortcut` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `css_style` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of leave_type_name
-- ----------------------------
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
INSERT INTO `leave_type_name` VALUES (11, 'NO PAY LEAVE', 'NL', '#bfbfbf', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for marital_status
-- ----------------------------
DROP TABLE IF EXISTS `marital_status`;
CREATE TABLE `marital_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of marital_status
-- ----------------------------
INSERT INTO `marital_status` VALUES (1, 'Single', NULL, NULL, 1, 1, '2019-04-22 08:44:08');
INSERT INTO `marital_status` VALUES (2, 'Married', NULL, NULL, 1, 1, '2019-04-22 08:46:07');
INSERT INTO `marital_status` VALUES (3, 'Widowed', NULL, NULL, 1, 1, '2019-04-22 08:46:30');
INSERT INTO `marital_status` VALUES (4, 'Divorced', NULL, NULL, 1, 1, '2019-04-22 08:47:16');

-- ----------------------------
-- Table structure for membership_document
-- ----------------------------
DROP TABLE IF EXISTS `membership_document`;
CREATE TABLE `membership_document`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_membership_profile` int(11) NOT NULL,
  `document_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `document_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `document_size` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `uploaded_date` datetime(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for membership_event
-- ----------------------------
DROP TABLE IF EXISTS `membership_event`;
CREATE TABLE `membership_event`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_membership_profile` int(11) NOT NULL,
  `id_event_list` int(11) NOT NULL,
  `number_of_audient` int(11) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address_line_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `id_country` int(11) NULL DEFAULT NULL,
  `id_city` int(11) NULL DEFAULT NULL,
  `id_province` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `prefix_phone_code` int(11) NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `prefix_phone_code_line_2` int(11) NULL DEFAULT NULL,
  `phone_number_line_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `from_date` date NULL DEFAULT NULL,
  `to_date` date NULL DEFAULT NULL,
  `register_date` date NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  `balance` decimal(10, 2) NULL DEFAULT NULL,
  `id_payment_type` int(11) NULL DEFAULT NULL,
  `id_payment_method` int(11) NULL DEFAULT NULL,
  `member_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `paid` decimal(10, 2) NULL DEFAULT NULL,
  `event_fee` decimal(10, 2) NULL DEFAULT NULL,
  `approval_status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of membership_event
-- ----------------------------
INSERT INTO `membership_event` VALUES (1, 1, 1, 2, 'River side', '', 56, 21, 'Palate Restaurant', '', NULL, '', NULL, '', '', 'Time Activity Remarks \r\n\r\n08:00 Pick up from the Hotel Departure exactly on time \r\n08:10 ? 09:00 Ride to countryside fresh palm juice gathering and tasting  \r\n09:00 ? 09:30 Ride and explanation about house temples and stroll over local market \r\n09:30 ? 10:30 Ride to  Wat Svay Romeat Pagoda,  sightseeing,   blessing ceremony and fortune teller  \r\n10:30 ? 11:45 West  Mebon temple island During rainy season transported by   boat and dui during dry season by Vespa \r\n11:45 ? 13:00 Lunch and drinks at private farm picnic  \r\n13:00 ? 13:10 Visit to basket weaving and farming family  13:10 ? 13:35 Visit to sticky rice making and Local medicine   along the road back  \r\n13:30 ? 14:00 Return to hotel and end tour \r\n  \r\nImportant: \r\no The safety of the guests is paramount and all guests must wear helmets. \r\no The price is 40 US$ per person \r\no Each guest is driven by their personal drivers (only holders of local or international driver?s license are eligible to drive in Siem Reap and road conditions demand full concentration). \r\no Every tour is accompanied by a guide. o All snacks, drinks and foods are included in the price of the tour. Individual purchases during the tour are for the account of guests. \r\no The tour program may vary, for instance due to spontaneous extra activities or if an activity should not be available due to circumstances beyond our control. \r\no Guests are advised to use sunscreen and to wear comfortable clothes and footwear that can be cleaned easily.\r\n The tour rides rain or shine. In the monsoon season first- rate raincoats are provided by VA SR ', '2019-07-03 16:47:53', 1, NULL, NULL, 1, '2019-07-12', '2019-07-12', '2019-07-03', 80.00, 80.00, 2, 1, '', 0.00, 40.00, 1);
INSERT INTO `membership_event` VALUES (2, 2, 1, 1, 'River side', '', 56, 21, 'Palate Restaurant', '', NULL, '', NULL, '', '', 'Time Activity Remarks \r\n\r\n08:00 Pick up from the Hotel Departure exactly on time \r\n08:10 ? 09:00 Ride to countryside fresh palm juice gathering and tasting  \r\n09:00 ? 09:30 Ride and explanation about house temples and stroll over local market \r\n09:30 ? 10:30 Ride to  Wat Svay Romeat Pagoda,  sightseeing,   blessing ceremony and fortune teller  \r\n10:30 ? 11:45 West  Mebon temple island During rainy season transported by   boat and dui during dry season by Vespa \r\n11:45 ? 13:00 Lunch and drinks at private farm picnic  \r\n13:00 ? 13:10 Visit to basket weaving and farming family  13:10 ? 13:35 Visit to sticky rice making and Local medicine   along the road back  \r\n13:30 ? 14:00 Return to hotel and end tour \r\n  \r\nImportant: \r\no The safety of the guests is paramount and all guests must wear helmets. \r\no The price is 40 US$ per person \r\no Each guest is driven by their personal drivers (only holders of local or international driver?s license are eligible to drive in Siem Reap and road conditions demand full concentration). \r\no Every tour is accompanied by a guide. o All snacks, drinks and foods are included in the price of the tour. Individual purchases during the tour are for the account of guests. \r\no The tour program may vary, for instance due to spontaneous extra activities or if an activity should not be available due to circumstances beyond our control. \r\no Guests are advised to use sunscreen and to wear comfortable clothes and footwear that can be cleaned easily.\r\n The tour rides rain or shine. In the monsoon season first- rate raincoats are provided by VA SR ', '2019-07-03 17:03:30', 1, NULL, NULL, 1, '2019-07-12', '2019-07-12', '2019-07-03', 50.00, 50.00, 2, 1, '', NULL, 50.00, 1);
INSERT INTO `membership_event` VALUES (3, 2, 1, 2, 'River side', '', NULL, NULL, 'Palate Restaurant', '', NULL, '', NULL, '', '', 'Time Activity Remarks \r\n\r\n08:00 Pick up from the Hotel Departure exactly on time \r\n08:10 ? 09:00 Ride to countryside fresh palm juice gathering and tasting  \r\n09:00 ? 09:30 Ride and explanation about house temples and stroll over local market \r\n09:30 ? 10:30 Ride to  Wat Svay Romeat Pagoda,  sightseeing,   blessing ceremony and fortune teller  \r\n10:30 ? 11:45 West  Mebon temple island During rainy season transported by   boat and dui during dry season by Vespa \r\n11:45 ? 13:00 Lunch and drinks at private farm picnic  \r\n13:00 ? 13:10 Visit to basket weaving and farming family  13:10 ? 13:35 Visit to sticky rice making and Local medicine   along the road back  \r\n13:30 ? 14:00 Return to hotel and end tour \r\n  \r\nImportant: \r\no The safety of the guests is paramount and all guests must wear helmets. \r\no The price is 40 US$ per person \r\no Each guest is driven by their personal drivers (only holders of local or international driver?s license are eligible to drive in Siem Reap and road conditions demand full concentration). \r\no Every tour is accompanied by a guide. o All snacks, drinks and foods are included in the price of the tour. Individual purchases during the tour are for the account of guests. \r\no The tour program may vary, for instance due to spontaneous extra activities or if an activity should not be available due to circumstances beyond our control. \r\no Guests are advised to use sunscreen and to wear comfortable clothes and footwear that can be cleaned easily.\r\n The tour rides rain or shine. In the monsoon season first- rate raincoats are provided by VA SR ', '2019-07-03 17:22:51', 1, NULL, NULL, 1, '2019-07-12', '2019-07-12', '2019-07-03', 80.00, NULL, NULL, NULL, NULL, NULL, 40.00, 1);
INSERT INTO `membership_event` VALUES (4, 2, 1, 3, 'River side', '', NULL, NULL, 'Palate Restaurant', '', NULL, '', NULL, '', '', 'Time Activity Remarks \r\n\r\n08:00 Pick up from the Hotel Departure exactly on time \r\n08:10 ? 09:00 Ride to countryside fresh palm juice gathering and tasting  \r\n09:00 ? 09:30 Ride and explanation about house temples and stroll over local market \r\n09:30 ? 10:30 Ride to  Wat Svay Romeat Pagoda,  sightseeing,   blessing ceremony and fortune teller  \r\n10:30 ? 11:45 West  Mebon temple island During rainy season transported by   boat and dui during dry season by Vespa \r\n11:45 ? 13:00 Lunch and drinks at private farm picnic  \r\n13:00 ? 13:10 Visit to basket weaving and farming family  13:10 ? 13:35 Visit to sticky rice making and Local medicine   along the road back  \r\n13:30 ? 14:00 Return to hotel and end tour \r\n  \r\nImportant: \r\no The safety of the guests is paramount and all guests must wear helmets. \r\no The price is 40 US$ per person \r\no Each guest is driven by their personal drivers (only holders of local or international driver?s license are eligible to drive in Siem Reap and road conditions demand full concentration). \r\no Every tour is accompanied by a guide. o All snacks, drinks and foods are included in the price of the tour. Individual purchases during the tour are for the account of guests. \r\no The tour program may vary, for instance due to spontaneous extra activities or if an activity should not be available due to circumstances beyond our control. \r\no Guests are advised to use sunscreen and to wear comfortable clothes and footwear that can be cleaned easily.\r\n The tour rides rain or shine. In the monsoon season first- rate raincoats are provided by VA SR ', '2019-07-04 08:51:16', 1, NULL, NULL, 1, '2019-07-12', '2019-07-12', '2019-07-04', 120.00, 0.00, NULL, NULL, NULL, 120.00, 40.00, 1);

-- ----------------------------
-- Table structure for membership_payment
-- ----------------------------
DROP TABLE IF EXISTS `membership_payment`;
CREATE TABLE `membership_payment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_membership_profile` int(11) NOT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  `paid` decimal(10, 2) NULL DEFAULT NULL,
  `balance` decimal(10, 2) NULL DEFAULT NULL,
  `id_payment_type` int(11) NULL DEFAULT NULL,
  `id_payment_method` int(11) NULL DEFAULT NULL,
  `id_membership_type` int(11) NULL DEFAULT NULL,
  `from_date` date NULL DEFAULT NULL,
  `to_date` date NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `id_payment_for` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of membership_payment
-- ----------------------------
INSERT INTO `membership_payment` VALUES (1, 1, 80.00, 0.00, 80.00, 2, 1, NULL, '2019-07-12', '2019-07-12', '', NULL, NULL, NULL, NULL, 1, 2);
INSERT INTO `membership_payment` VALUES (2, 2, 50.00, NULL, 50.00, 2, 1, NULL, '2019-07-12', '2019-07-12', '', NULL, NULL, NULL, NULL, 1, 2);

-- ----------------------------
-- Table structure for membership_profile
-- ----------------------------
DROP TABLE IF EXISTS `membership_profile`;
CREATE TABLE `membership_profile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_prefix` int(11) NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `passport_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `date_of_birth` date NULL DEFAULT NULL,
  `place_of_birth` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `sex` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `nationality` int(11) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address_line_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `id_country` int(11) NULL DEFAULT NULL,
  `id_city` int(11) NULL DEFAULT NULL,
  `id_province` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `marital_status` int(2) NULL DEFAULT NULL,
  `prefix_phone_code` int(11) NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `prefix_phone_code_line_2` int(11) NULL DEFAULT NULL,
  `phone_number_line_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `contact_person` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `mot_licence_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `year_of_establishment` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `type_of_business` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `confirm_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `membership_type` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of membership_profile
-- ----------------------------
INSERT INTO `membership_profile` VALUES (1, 1, 'Eng', 'Kunthea', 'Euro Khmer Voyages', '', '1980-06-01', '', '', 56, '#0677, Group 25, Slor Kram, Banteay Chas', '', 56, 21, '', '', 2, 106, '069955545', NULL, '', 'kunthea@ekvoyages.com', '', '', '', '', '', '', 'kunthea', '', '', '', '2019-07-03 16:28:05', 1, '2019-07-03 16:28:54', 1, 1, '3', 1);
INSERT INTO `membership_profile` VALUES (2, 1, 'chum', 'sokun', 'test subscriber ', '', '2019-07-03', '', '', 56, '#0677, Group 25, Slor Kram, Banteay Chas', '', NULL, NULL, '', '', 2, NULL, '', NULL, '', 'sokun@ekvoyages.com', '', '', '', '', '', '', 'sokun', '', '', '', '2019-07-03 16:58:02', 1, '2019-07-10 21:24:22', 8, 1, '16', 1);
INSERT INTO `membership_profile` VALUES (3, 4, 'Next', 'Step', 'eOcambo Village', '', NULL, '', NULL, 56, 'SR', '', NULL, NULL, '', '', NULL, NULL, '', NULL, '', 'nextstep@eocambo.com', 'eocambo.com', '', '', '', '', '', 'NextStep', '123456', '123456', '', '2019-07-10 21:24:12', 8, NULL, NULL, 1, NULL, 1);

-- ----------------------------
-- Table structure for membership_type
-- ----------------------------
DROP TABLE IF EXISTS `membership_type`;
CREATE TABLE `membership_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membership_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of membership_type
-- ----------------------------
INSERT INTO `membership_type` VALUES (1, 'Diamond', 'sdfsd', '2019-04-18 08:57:41', 1, '2019-04-18 08:57:41', 1, 1);
INSERT INTO `membership_type` VALUES (2, 'Gold', '', '2019-04-18 10:36:33', 1, '2019-04-18 10:36:33', 1, 1);
INSERT INTO `membership_type` VALUES (4, 'Silver', '', '2019-04-18 14:02:07', 1, '2019-04-22 11:05:15', 1, 1);
INSERT INTO `membership_type` VALUES (5, 'Brone', '', '2019-04-18 14:03:38', 1, '2019-04-18 14:12:47', 1, 1);

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration`  (
  `version` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apply_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', 1552447078);
INSERT INTO `migration` VALUES ('m130524_201442_init', 1552447085);

-- ----------------------------
-- Table structure for milestone_data
-- ----------------------------
DROP TABLE IF EXISTS `milestone_data`;
CREATE TABLE `milestone_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_milestone_type` int(11) NULL DEFAULT NULL,
  `id_project` int(11) NULL DEFAULT NULL,
  `id_task` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for month_list
-- ----------------------------
DROP TABLE IF EXISTS `month_list`;
CREATE TABLE `month_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of month_list
-- ----------------------------
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

-- ----------------------------
-- Table structure for pay_period
-- ----------------------------
DROP TABLE IF EXISTS `pay_period`;
CREATE TABLE `pay_period`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pay_period
-- ----------------------------
INSERT INTO `pay_period` VALUES (1, '1 month');
INSERT INTO `pay_period` VALUES (2, '2 months');
INSERT INTO `pay_period` VALUES (3, '3 months');
INSERT INTO `pay_period` VALUES (4, '4 months');
INSERT INTO `pay_period` VALUES (5, '5 months');
INSERT INTO `pay_period` VALUES (6, '6 months');

-- ----------------------------
-- Table structure for payment_for
-- ----------------------------
DROP TABLE IF EXISTS `payment_for`;
CREATE TABLE `payment_for`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of payment_for
-- ----------------------------
INSERT INTO `payment_for` VALUES (1, 'Membership', NULL, NULL, 1, 1, '2019-05-17 11:19:01');
INSERT INTO `payment_for` VALUES (2, 'Event', NULL, NULL, 1, 1, '2019-05-17 11:19:11');

-- ----------------------------
-- Table structure for payment_method
-- ----------------------------
DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE `payment_method`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of payment_method
-- ----------------------------
INSERT INTO `payment_method` VALUES (1, 'Cash', 1, '2019-04-23 15:34:27', 1, 11, '2017-12-13 17:20:12');
INSERT INTO `payment_method` VALUES (2, 'Transfer Money', 11, '2017-12-13 17:20:18', 1, 11, '2017-12-13 17:20:18');
INSERT INTO `payment_method` VALUES (3, 'Cheque', 11, '2017-12-13 17:20:24', 1, 11, '2017-12-13 17:20:24');
INSERT INTO `payment_method` VALUES (5, 'E-payment', 11, '2017-12-13 17:20:29', 1, 11, '2017-12-13 17:20:29');
INSERT INTO `payment_method` VALUES (6, 'POS Credit Card', 35, '2018-08-11 19:23:31', 1, 35, '2018-08-11 19:23:31');

-- ----------------------------
-- Table structure for payment_status
-- ----------------------------
DROP TABLE IF EXISTS `payment_status`;
CREATE TABLE `payment_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of payment_status
-- ----------------------------
INSERT INTO `payment_status` VALUES (1, 'Paid', 1, '2019-06-03 11:34:41', 1, 1, '2019-05-17 08:50:14');
INSERT INTO `payment_status` VALUES (2, 'Pending', NULL, NULL, 1, 1, '2019-05-17 08:50:26');
INSERT INTO `payment_status` VALUES (3, 'Overdue', NULL, NULL, 1, 1, '2019-05-17 08:50:35');
INSERT INTO `payment_status` VALUES (4, 'Expired', 1, '2019-06-03 11:35:57', 1, 1, '2019-05-17 08:50:47');

-- ----------------------------
-- Table structure for payment_type
-- ----------------------------
DROP TABLE IF EXISTS `payment_type`;
CREATE TABLE `payment_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of payment_type
-- ----------------------------
INSERT INTO `payment_type` VALUES (1, 'Pre-payment', 1, '2019-07-03 13:30:09', 1, 11, '2017-12-13 17:20:41');
INSERT INTO `payment_type` VALUES (2, 'Cash on Arrival', 1, '2019-07-03 13:30:40', 1, 11, '2017-12-13 17:20:46');
INSERT INTO `payment_type` VALUES (3, 'Before check out', 1, '2019-07-03 13:30:45', 1, 11, '2017-12-13 17:20:52');
INSERT INTO `payment_type` VALUES (4, 'Credit', 1, '2019-07-03 13:30:48', 1, 11, '2017-12-13 17:20:59');
INSERT INTO `payment_type` VALUES (5, 'Deposit', 1, '2019-07-03 13:31:03', 1, 11, '2017-12-13 17:21:05');

-- ----------------------------
-- Table structure for payroll
-- ----------------------------
DROP TABLE IF EXISTS `payroll`;
CREATE TABLE `payroll`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_payroll_request` int(11) NULL DEFAULT NULL,
  `doc_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `pay_for` int(11) NULL DEFAULT NULL,
  `total_net_pay` decimal(10, 2) NULL DEFAULT NULL,
  `chart_of_account` int(11) NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  `amount_in_word` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chart_of_account_option` int(11) NULL DEFAULT NULL,
  `amount_option` decimal(10, 2) NULL DEFAULT NULL,
  `amount_in_word_option` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for payroll_data
-- ----------------------------
DROP TABLE IF EXISTS `payroll_data`;
CREATE TABLE `payroll_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_payroll` int(11) NULL DEFAULT NULL,
  `id_type` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for payroll_request
-- ----------------------------
DROP TABLE IF EXISTS `payroll_request`;
CREATE TABLE `payroll_request`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NULL DEFAULT NULL,
  `id_year` int(11) NULL DEFAULT NULL,
  `id_month` int(11) NULL DEFAULT NULL,
  `total_amount` decimal(10, 2) NULL DEFAULT NULL,
  `id_prepared_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `grand_total_basic_salary` decimal(10, 2) NULL DEFAULT NULL,
  `grand_total_probation_pass_amount` decimal(10, 2) NULL DEFAULT NULL,
  `grand_total_probation_working_day` int(11) NULL DEFAULT NULL,
  `grand_total_probation_per_day_amount` decimal(10, 2) NULL DEFAULT NULL,
  `grand_total_probation_pass_total_amount` decimal(10, 2) NULL DEFAULT NULL,
  `grand_total_absent` int(11) NULL DEFAULT NULL,
  `grand_total_absent_deduct_amount` decimal(10, 2) NULL DEFAULT NULL,
  `grand_total_advance_deduct_amount` decimal(10, 2) NULL DEFAULT NULL,
  `grand_total_increase_amount` decimal(10, 2) NULL DEFAULT NULL,
  `grand_total_other_amount` decimal(10, 2) NULL DEFAULT NULL,
  `grand_total_balance_amount` decimal(10, 2) NULL DEFAULT NULL,
  `grand_total_service_charge_amount` decimal(10, 2) NULL DEFAULT NULL,
  `grand_total_bonus_amount` decimal(10, 2) NULL DEFAULT NULL,
  `grand_total_net_pay_amount` decimal(10, 2) NULL DEFAULT NULL,
  `grand_total_tip_amount` decimal(10, 2) NULL DEFAULT NULL,
  `grand_total_total_net_pay_amount` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for payroll_request_data
-- ----------------------------
DROP TABLE IF EXISTS `payroll_request_data`;
CREATE TABLE `payroll_request_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_payroll_request` int(11) NULL DEFAULT NULL,
  `id_employee` int(11) NULL DEFAULT NULL,
  `basic_salary` decimal(10, 2) NULL DEFAULT NULL,
  `probation_pass_amount` decimal(10, 2) NULL DEFAULT NULL,
  `probation_working_day` int(11) NULL DEFAULT NULL,
  `probation_per_day_amount` decimal(10, 2) NULL DEFAULT NULL,
  `probation_pass_total_amount` decimal(10, 2) NULL DEFAULT NULL,
  `absent` int(11) NULL DEFAULT NULL,
  `absent_deduct_amount` decimal(10, 2) NULL DEFAULT NULL,
  `advance_deduct_amount` decimal(10, 2) NULL DEFAULT NULL,
  `increase_amount` decimal(10, 2) NULL DEFAULT NULL,
  `other_amount` decimal(10, 2) NULL DEFAULT NULL,
  `balance_amount` decimal(10, 2) NULL DEFAULT NULL,
  `service_charge_amount` decimal(10, 2) NULL DEFAULT NULL,
  `bonus_amount` decimal(10, 2) NULL DEFAULT NULL,
  `net_pay_amount` decimal(10, 2) NULL DEFAULT NULL,
  `id_payment_method` int(11) NULL DEFAULT NULL,
  `tip_amount` decimal(10, 2) NULL DEFAULT NULL,
  `total_net_pay_amount` decimal(10, 2) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for payroll_request_status
-- ----------------------------
DROP TABLE IF EXISTS `payroll_request_status`;
CREATE TABLE `payroll_request_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `css_class` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of payroll_request_status
-- ----------------------------
INSERT INTO `payroll_request_status` VALUES (1, 'Approved', 'label label-info', 1);
INSERT INTO `payroll_request_status` VALUES (2, 'Requested', 'label label-primary', 1);
INSERT INTO `payroll_request_status` VALUES (3, 'Preparing', 'label label-danger', 1);

-- ----------------------------
-- Table structure for payroll_status
-- ----------------------------
DROP TABLE IF EXISTS `payroll_status`;
CREATE TABLE `payroll_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `css_class` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of payroll_status
-- ----------------------------
INSERT INTO `payroll_status` VALUES (1, 'Approved', 'label label-info', 1);
INSERT INTO `payroll_status` VALUES (2, 'Paid', 'label label-primary', 1);
INSERT INTO `payroll_status` VALUES (3, 'Rejected', 'label label-danger', 1);
INSERT INTO `payroll_status` VALUES (4, 'Waiting for Approval', 'label label-mint', 1);

-- ----------------------------
-- Table structure for payroll_type
-- ----------------------------
DROP TABLE IF EXISTS `payroll_type`;
CREATE TABLE `payroll_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of payroll_type
-- ----------------------------
INSERT INTO `payroll_type` VALUES (1, 'Basic Salary', 1, NULL, NULL, NULL, NULL);
INSERT INTO `payroll_type` VALUES (2, 'Overtime', 1, NULL, NULL, NULL, NULL);
INSERT INTO `payroll_type` VALUES (3, 'Allowance', 1, NULL, NULL, NULL, NULL);
INSERT INTO `payroll_type` VALUES (4, 'Deduct', 1, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for permission_action
-- ----------------------------
DROP TABLE IF EXISTS `permission_action`;
CREATE TABLE `permission_action`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) NULL DEFAULT NULL,
  `permission_menu_id` int(11) NULL DEFAULT NULL,
  `is_show_menu` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1508 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permission_action
-- ----------------------------
INSERT INTO `permission_action` VALUES (931, 3, 1, NULL);
INSERT INTO `permission_action` VALUES (932, 3, 60, NULL);
INSERT INTO `permission_action` VALUES (933, 3, 20, NULL);
INSERT INTO `permission_action` VALUES (934, 3, 21, NULL);
INSERT INTO `permission_action` VALUES (935, 3, 63, NULL);
INSERT INTO `permission_action` VALUES (936, 3, 59, NULL);
INSERT INTO `permission_action` VALUES (937, 3, 35, NULL);
INSERT INTO `permission_action` VALUES (938, 3, 6, NULL);
INSERT INTO `permission_action` VALUES (939, 3, 50, NULL);
INSERT INTO `permission_action` VALUES (940, 3, 22, NULL);
INSERT INTO `permission_action` VALUES (941, 3, 55, NULL);
INSERT INTO `permission_action` VALUES (942, 3, 58, NULL);
INSERT INTO `permission_action` VALUES (996, 2, 1, NULL);
INSERT INTO `permission_action` VALUES (997, 2, 60, NULL);
INSERT INTO `permission_action` VALUES (998, 2, 44, NULL);
INSERT INTO `permission_action` VALUES (999, 2, 23, NULL);
INSERT INTO `permission_action` VALUES (1000, 2, 20, NULL);
INSERT INTO `permission_action` VALUES (1001, 2, 21, NULL);
INSERT INTO `permission_action` VALUES (1002, 2, 63, NULL);
INSERT INTO `permission_action` VALUES (1003, 2, 59, NULL);
INSERT INTO `permission_action` VALUES (1004, 2, 54, NULL);
INSERT INTO `permission_action` VALUES (1005, 2, 35, NULL);
INSERT INTO `permission_action` VALUES (1006, 2, 6, NULL);
INSERT INTO `permission_action` VALUES (1007, 2, 24, NULL);
INSERT INTO `permission_action` VALUES (1008, 2, 33, NULL);
INSERT INTO `permission_action` VALUES (1009, 2, 43, NULL);
INSERT INTO `permission_action` VALUES (1010, 2, 31, NULL);
INSERT INTO `permission_action` VALUES (1011, 2, 29, NULL);
INSERT INTO `permission_action` VALUES (1012, 2, 30, NULL);
INSERT INTO `permission_action` VALUES (1013, 2, 25, NULL);
INSERT INTO `permission_action` VALUES (1014, 2, 22, NULL);
INSERT INTO `permission_action` VALUES (1015, 2, 55, NULL);
INSERT INTO `permission_action` VALUES (1016, 2, 52, NULL);
INSERT INTO `permission_action` VALUES (1017, 2, 8, NULL);
INSERT INTO `permission_action` VALUES (1018, 2, 58, NULL);
INSERT INTO `permission_action` VALUES (1019, 2, 28, NULL);
INSERT INTO `permission_action` VALUES (1020, 2, 32, NULL);
INSERT INTO `permission_action` VALUES (1021, 2, 64, NULL);
INSERT INTO `permission_action` VALUES (1022, 2, 45, NULL);
INSERT INTO `permission_action` VALUES (1023, 2, 38, NULL);
INSERT INTO `permission_action` VALUES (1024, 2, 39, NULL);
INSERT INTO `permission_action` VALUES (1025, 2, 40, NULL);
INSERT INTO `permission_action` VALUES (1073, 5, 1, NULL);
INSERT INTO `permission_action` VALUES (1074, 5, 60, NULL);
INSERT INTO `permission_action` VALUES (1075, 5, 23, NULL);
INSERT INTO `permission_action` VALUES (1076, 5, 20, NULL);
INSERT INTO `permission_action` VALUES (1077, 5, 21, NULL);
INSERT INTO `permission_action` VALUES (1078, 5, 63, NULL);
INSERT INTO `permission_action` VALUES (1079, 5, 59, NULL);
INSERT INTO `permission_action` VALUES (1080, 5, 35, NULL);
INSERT INTO `permission_action` VALUES (1081, 5, 6, NULL);
INSERT INTO `permission_action` VALUES (1082, 5, 50, NULL);
INSERT INTO `permission_action` VALUES (1083, 5, 22, NULL);
INSERT INTO `permission_action` VALUES (1084, 5, 55, NULL);
INSERT INTO `permission_action` VALUES (1085, 5, 8, NULL);
INSERT INTO `permission_action` VALUES (1086, 5, 58, NULL);
INSERT INTO `permission_action` VALUES (1237, 7, 1, NULL);
INSERT INTO `permission_action` VALUES (1238, 7, 60, NULL);
INSERT INTO `permission_action` VALUES (1239, 7, 23, NULL);
INSERT INTO `permission_action` VALUES (1240, 7, 20, NULL);
INSERT INTO `permission_action` VALUES (1241, 7, 21, NULL);
INSERT INTO `permission_action` VALUES (1242, 7, 63, NULL);
INSERT INTO `permission_action` VALUES (1243, 7, 59, NULL);
INSERT INTO `permission_action` VALUES (1244, 7, 54, NULL);
INSERT INTO `permission_action` VALUES (1245, 7, 35, NULL);
INSERT INTO `permission_action` VALUES (1246, 7, 6, NULL);
INSERT INTO `permission_action` VALUES (1247, 7, 50, NULL);
INSERT INTO `permission_action` VALUES (1248, 7, 55, NULL);
INSERT INTO `permission_action` VALUES (1249, 7, 52, NULL);
INSERT INTO `permission_action` VALUES (1250, 7, 58, NULL);
INSERT INTO `permission_action` VALUES (1251, 7, 13, NULL);
INSERT INTO `permission_action` VALUES (1252, 7, 17, NULL);
INSERT INTO `permission_action` VALUES (1253, 7, 34, NULL);
INSERT INTO `permission_action` VALUES (1254, 7, 28, NULL);
INSERT INTO `permission_action` VALUES (1255, 7, 32, NULL);
INSERT INTO `permission_action` VALUES (1256, 7, 64, NULL);
INSERT INTO `permission_action` VALUES (1257, 7, 45, NULL);
INSERT INTO `permission_action` VALUES (1258, 7, 38, NULL);
INSERT INTO `permission_action` VALUES (1259, 7, 39, NULL);
INSERT INTO `permission_action` VALUES (1260, 7, 40, NULL);
INSERT INTO `permission_action` VALUES (1261, 7, 11, NULL);
INSERT INTO `permission_action` VALUES (1262, 7, 47, NULL);
INSERT INTO `permission_action` VALUES (1263, 7, 62, NULL);
INSERT INTO `permission_action` VALUES (1264, 7, 65, NULL);
INSERT INTO `permission_action` VALUES (1265, 7, 66, NULL);
INSERT INTO `permission_action` VALUES (1266, 7, 68, NULL);
INSERT INTO `permission_action` VALUES (1267, 7, 69, NULL);
INSERT INTO `permission_action` VALUES (1318, 6, 1, NULL);
INSERT INTO `permission_action` VALUES (1319, 6, 60, NULL);
INSERT INTO `permission_action` VALUES (1320, 6, 44, NULL);
INSERT INTO `permission_action` VALUES (1321, 6, 23, NULL);
INSERT INTO `permission_action` VALUES (1322, 6, 20, NULL);
INSERT INTO `permission_action` VALUES (1323, 6, 21, NULL);
INSERT INTO `permission_action` VALUES (1324, 6, 63, NULL);
INSERT INTO `permission_action` VALUES (1325, 6, 59, NULL);
INSERT INTO `permission_action` VALUES (1326, 6, 54, NULL);
INSERT INTO `permission_action` VALUES (1327, 6, 35, NULL);
INSERT INTO `permission_action` VALUES (1328, 6, 6, NULL);
INSERT INTO `permission_action` VALUES (1329, 6, 24, NULL);
INSERT INTO `permission_action` VALUES (1330, 6, 33, NULL);
INSERT INTO `permission_action` VALUES (1331, 6, 43, NULL);
INSERT INTO `permission_action` VALUES (1332, 6, 31, NULL);
INSERT INTO `permission_action` VALUES (1333, 6, 49, NULL);
INSERT INTO `permission_action` VALUES (1334, 6, 73, NULL);
INSERT INTO `permission_action` VALUES (1335, 6, 29, NULL);
INSERT INTO `permission_action` VALUES (1336, 6, 30, NULL);
INSERT INTO `permission_action` VALUES (1337, 6, 25, NULL);
INSERT INTO `permission_action` VALUES (1338, 6, 51, NULL);
INSERT INTO `permission_action` VALUES (1339, 6, 42, NULL);
INSERT INTO `permission_action` VALUES (1340, 6, 50, NULL);
INSERT INTO `permission_action` VALUES (1341, 6, 22, NULL);
INSERT INTO `permission_action` VALUES (1342, 6, 72, NULL);
INSERT INTO `permission_action` VALUES (1343, 6, 55, NULL);
INSERT INTO `permission_action` VALUES (1344, 6, 52, NULL);
INSERT INTO `permission_action` VALUES (1345, 6, 56, NULL);
INSERT INTO `permission_action` VALUES (1346, 6, 27, NULL);
INSERT INTO `permission_action` VALUES (1347, 6, 48, NULL);
INSERT INTO `permission_action` VALUES (1348, 6, 41, NULL);
INSERT INTO `permission_action` VALUES (1349, 6, 46, NULL);
INSERT INTO `permission_action` VALUES (1350, 6, 8, NULL);
INSERT INTO `permission_action` VALUES (1351, 6, 58, NULL);
INSERT INTO `permission_action` VALUES (1352, 6, 71, NULL);
INSERT INTO `permission_action` VALUES (1353, 6, 13, NULL);
INSERT INTO `permission_action` VALUES (1354, 6, 17, NULL);
INSERT INTO `permission_action` VALUES (1355, 6, 34, NULL);
INSERT INTO `permission_action` VALUES (1356, 6, 28, NULL);
INSERT INTO `permission_action` VALUES (1357, 6, 32, NULL);
INSERT INTO `permission_action` VALUES (1358, 6, 64, NULL);
INSERT INTO `permission_action` VALUES (1359, 6, 45, NULL);
INSERT INTO `permission_action` VALUES (1360, 6, 38, NULL);
INSERT INTO `permission_action` VALUES (1361, 6, 39, NULL);
INSERT INTO `permission_action` VALUES (1362, 6, 40, NULL);
INSERT INTO `permission_action` VALUES (1363, 6, 11, NULL);
INSERT INTO `permission_action` VALUES (1364, 6, 47, NULL);
INSERT INTO `permission_action` VALUES (1365, 6, 62, NULL);
INSERT INTO `permission_action` VALUES (1366, 6, 74, NULL);
INSERT INTO `permission_action` VALUES (1367, 6, 66, NULL);
INSERT INTO `permission_action` VALUES (1368, 6, 68, NULL);
INSERT INTO `permission_action` VALUES (1369, 6, 65, NULL);
INSERT INTO `permission_action` VALUES (1370, 6, 69, NULL);
INSERT INTO `permission_action` VALUES (1371, 6, 70, NULL);
INSERT INTO `permission_action` VALUES (1372, 1, 1, NULL);
INSERT INTO `permission_action` VALUES (1373, 1, 44, NULL);
INSERT INTO `permission_action` VALUES (1374, 1, 23, NULL);
INSERT INTO `permission_action` VALUES (1375, 1, 20, NULL);
INSERT INTO `permission_action` VALUES (1376, 1, 21, NULL);
INSERT INTO `permission_action` VALUES (1377, 1, 63, NULL);
INSERT INTO `permission_action` VALUES (1378, 1, 59, NULL);
INSERT INTO `permission_action` VALUES (1379, 1, 54, NULL);
INSERT INTO `permission_action` VALUES (1380, 1, 35, NULL);
INSERT INTO `permission_action` VALUES (1381, 1, 6, NULL);
INSERT INTO `permission_action` VALUES (1382, 1, 24, NULL);
INSERT INTO `permission_action` VALUES (1383, 1, 33, NULL);
INSERT INTO `permission_action` VALUES (1384, 1, 43, NULL);
INSERT INTO `permission_action` VALUES (1385, 1, 31, NULL);
INSERT INTO `permission_action` VALUES (1386, 1, 49, NULL);
INSERT INTO `permission_action` VALUES (1387, 1, 74, NULL);
INSERT INTO `permission_action` VALUES (1388, 1, 72, NULL);
INSERT INTO `permission_action` VALUES (1389, 1, 75, NULL);
INSERT INTO `permission_action` VALUES (1390, 1, 29, NULL);
INSERT INTO `permission_action` VALUES (1391, 1, 30, NULL);
INSERT INTO `permission_action` VALUES (1392, 1, 25, NULL);
INSERT INTO `permission_action` VALUES (1393, 1, 51, NULL);
INSERT INTO `permission_action` VALUES (1394, 1, 76, NULL);
INSERT INTO `permission_action` VALUES (1395, 1, 42, NULL);
INSERT INTO `permission_action` VALUES (1396, 1, 77, NULL);
INSERT INTO `permission_action` VALUES (1397, 1, 78, NULL);
INSERT INTO `permission_action` VALUES (1398, 1, 66, NULL);
INSERT INTO `permission_action` VALUES (1399, 1, 50, NULL);
INSERT INTO `permission_action` VALUES (1400, 1, 22, NULL);
INSERT INTO `permission_action` VALUES (1401, 1, 55, NULL);
INSERT INTO `permission_action` VALUES (1402, 1, 52, NULL);
INSERT INTO `permission_action` VALUES (1403, 1, 56, NULL);
INSERT INTO `permission_action` VALUES (1404, 1, 27, NULL);
INSERT INTO `permission_action` VALUES (1405, 1, 48, NULL);
INSERT INTO `permission_action` VALUES (1406, 1, 41, NULL);
INSERT INTO `permission_action` VALUES (1407, 1, 46, NULL);
INSERT INTO `permission_action` VALUES (1408, 1, 8, NULL);
INSERT INTO `permission_action` VALUES (1409, 1, 58, NULL);
INSERT INTO `permission_action` VALUES (1410, 1, 13, NULL);
INSERT INTO `permission_action` VALUES (1411, 1, 70, NULL);
INSERT INTO `permission_action` VALUES (1412, 1, 17, NULL);
INSERT INTO `permission_action` VALUES (1413, 1, 34, NULL);
INSERT INTO `permission_action` VALUES (1414, 1, 28, NULL);
INSERT INTO `permission_action` VALUES (1415, 1, 32, NULL);
INSERT INTO `permission_action` VALUES (1416, 1, 68, NULL);
INSERT INTO `permission_action` VALUES (1417, 1, 64, NULL);
INSERT INTO `permission_action` VALUES (1418, 1, 45, NULL);
INSERT INTO `permission_action` VALUES (1419, 1, 38, NULL);
INSERT INTO `permission_action` VALUES (1420, 1, 39, NULL);
INSERT INTO `permission_action` VALUES (1421, 1, 40, NULL);
INSERT INTO `permission_action` VALUES (1422, 1, 11, NULL);
INSERT INTO `permission_action` VALUES (1423, 1, 73, NULL);
INSERT INTO `permission_action` VALUES (1424, 1, 47, NULL);
INSERT INTO `permission_action` VALUES (1425, 1, 62, NULL);
INSERT INTO `permission_action` VALUES (1426, 1, 65, NULL);
INSERT INTO `permission_action` VALUES (1427, 1, 67, NULL);
INSERT INTO `permission_action` VALUES (1428, 1, 69, NULL);
INSERT INTO `permission_action` VALUES (1449, 8, 1, NULL);
INSERT INTO `permission_action` VALUES (1450, 8, 20, NULL);
INSERT INTO `permission_action` VALUES (1451, 8, 21, NULL);
INSERT INTO `permission_action` VALUES (1452, 8, 63, NULL);
INSERT INTO `permission_action` VALUES (1453, 8, 59, NULL);
INSERT INTO `permission_action` VALUES (1454, 8, 49, NULL);
INSERT INTO `permission_action` VALUES (1455, 8, 75, NULL);
INSERT INTO `permission_action` VALUES (1456, 8, 72, NULL);
INSERT INTO `permission_action` VALUES (1457, 8, 74, NULL);
INSERT INTO `permission_action` VALUES (1458, 8, 29, NULL);
INSERT INTO `permission_action` VALUES (1459, 8, 30, NULL);
INSERT INTO `permission_action` VALUES (1460, 8, 25, NULL);
INSERT INTO `permission_action` VALUES (1489, 9, 1, NULL);
INSERT INTO `permission_action` VALUES (1490, 9, 20, NULL);
INSERT INTO `permission_action` VALUES (1491, 9, 21, NULL);
INSERT INTO `permission_action` VALUES (1492, 9, 35, NULL);
INSERT INTO `permission_action` VALUES (1493, 9, 6, NULL);
INSERT INTO `permission_action` VALUES (1494, 9, 22, NULL);
INSERT INTO `permission_action` VALUES (1495, 4, 1, NULL);
INSERT INTO `permission_action` VALUES (1496, 4, 23, NULL);
INSERT INTO `permission_action` VALUES (1497, 4, 20, NULL);
INSERT INTO `permission_action` VALUES (1498, 4, 21, NULL);
INSERT INTO `permission_action` VALUES (1499, 4, 63, NULL);
INSERT INTO `permission_action` VALUES (1500, 4, 59, NULL);
INSERT INTO `permission_action` VALUES (1501, 4, 35, NULL);
INSERT INTO `permission_action` VALUES (1502, 4, 6, NULL);
INSERT INTO `permission_action` VALUES (1503, 4, 50, NULL);
INSERT INTO `permission_action` VALUES (1504, 4, 22, NULL);
INSERT INTO `permission_action` VALUES (1505, 4, 55, NULL);
INSERT INTO `permission_action` VALUES (1506, 4, 52, NULL);
INSERT INTO `permission_action` VALUES (1507, 4, 58, NULL);

-- ----------------------------
-- Table structure for permission_action_data
-- ----------------------------
DROP TABLE IF EXISTS `permission_action_data`;
CREATE TABLE `permission_action_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_permission_action` int(11) NULL DEFAULT NULL,
  `allow_action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permission_action_data
-- ----------------------------
INSERT INTO `permission_action_data` VALUES (1, 1, 'index,detail,view,update');
INSERT INTO `permission_action_data` VALUES (2, 2, 'subscriber,subscriber-detail');
INSERT INTO `permission_action_data` VALUES (3, 3, 'index');
INSERT INTO `permission_action_data` VALUES (4, 4, 'index');
INSERT INTO `permission_action_data` VALUES (5, 5, 'index');
INSERT INTO `permission_action_data` VALUES (6, 6, 'index,subscriber');
INSERT INTO `permission_action_data` VALUES (7, 7, 'index');
INSERT INTO `permission_action_data` VALUES (8, 8, 'index');
INSERT INTO `permission_action_data` VALUES (9, 9, 'index');
INSERT INTO `permission_action_data` VALUES (10, 10, 'index');
INSERT INTO `permission_action_data` VALUES (11, 12, 'index');
INSERT INTO `permission_action_data` VALUES (12, 12, 'index');
INSERT INTO `permission_action_data` VALUES (13, 13, 'index');
INSERT INTO `permission_action_data` VALUES (14, 14, 'index');
INSERT INTO `permission_action_data` VALUES (15, 15, 'index');
INSERT INTO `permission_action_data` VALUES (16, 16, 'index');
INSERT INTO `permission_action_data` VALUES (17, 17, 'index');
INSERT INTO `permission_action_data` VALUES (18, 18, 'index');
INSERT INTO `permission_action_data` VALUES (19, 19, 'index');
INSERT INTO `permission_action_data` VALUES (20, 20, 'index,validation');
INSERT INTO `permission_action_data` VALUES (21, 21, 'index');
INSERT INTO `permission_action_data` VALUES (22, 22, 'index');
INSERT INTO `permission_action_data` VALUES (23, 23, 'index');
INSERT INTO `permission_action_data` VALUES (24, 24, 'index');
INSERT INTO `permission_action_data` VALUES (25, 25, 'index');
INSERT INTO `permission_action_data` VALUES (26, 26, 'index');
INSERT INTO `permission_action_data` VALUES (27, 27, 'index');
INSERT INTO `permission_action_data` VALUES (28, 28, 'index');
INSERT INTO `permission_action_data` VALUES (29, 29, 'index');
INSERT INTO `permission_action_data` VALUES (30, 30, 'index');
INSERT INTO `permission_action_data` VALUES (31, 31, 'index');
INSERT INTO `permission_action_data` VALUES (32, 32, 'index');
INSERT INTO `permission_action_data` VALUES (33, 33, 'index');
INSERT INTO `permission_action_data` VALUES (34, 34, 'index');
INSERT INTO `permission_action_data` VALUES (35, 35, 'index');
INSERT INTO `permission_action_data` VALUES (36, 36, 'index');
INSERT INTO `permission_action_data` VALUES (37, 37, 'index');
INSERT INTO `permission_action_data` VALUES (38, 38, 'index,update');
INSERT INTO `permission_action_data` VALUES (39, 39, 'index,update');
INSERT INTO `permission_action_data` VALUES (40, 40, 'index');
INSERT INTO `permission_action_data` VALUES (41, 41, 'index');
INSERT INTO `permission_action_data` VALUES (42, 42, 'index');
INSERT INTO `permission_action_data` VALUES (43, 43, 'index');
INSERT INTO `permission_action_data` VALUES (44, 44, 'index');
INSERT INTO `permission_action_data` VALUES (45, 45, 'index,profile');
INSERT INTO `permission_action_data` VALUES (46, 46, 'index');
INSERT INTO `permission_action_data` VALUES (47, 47, 'index');
INSERT INTO `permission_action_data` VALUES (48, 48, 'index');
INSERT INTO `permission_action_data` VALUES (49, 49, 'index');
INSERT INTO `permission_action_data` VALUES (50, 50, 'index');
INSERT INTO `permission_action_data` VALUES (51, 51, 'index');
INSERT INTO `permission_action_data` VALUES (52, 52, 'index');
INSERT INTO `permission_action_data` VALUES (53, 53, 'index');
INSERT INTO `permission_action_data` VALUES (54, 54, 'index');
INSERT INTO `permission_action_data` VALUES (55, 55, 'index');
INSERT INTO `permission_action_data` VALUES (56, 56, 'index');
INSERT INTO `permission_action_data` VALUES (57, 57, 'index');
INSERT INTO `permission_action_data` VALUES (58, 58, 'index');
INSERT INTO `permission_action_data` VALUES (59, 59, 'index');
INSERT INTO `permission_action_data` VALUES (60, 60, 'index');

-- ----------------------------
-- Table structure for permission_menu
-- ----------------------------
DROP TABLE IF EXISTS `permission_menu`;
CREATE TABLE `permission_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_parent` tinyint(1) NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `menu_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `menu_icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `css_class` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `contoller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `extra_action` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permission_menu
-- ----------------------------
INSERT INTO `permission_menu` VALUES (1, 1, 0, 'Dashboard', 1, 'demo-pli-home', '/', 'index dashboard', 1, 'site', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (2, 1, 0, 'Subscriber', NULL, 'fa fa-group', 'membership-profile/subscriber', 'membership-profile-subscriber membership-profile-subscriber membership-payment-subscriber membership-event-subscriber membership-document-subscriber', 0, 'membership-profile', 'subscriber', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (3, 1, 0, 'Event', NULL, 'fa fa-calendar', 'event-list/index', 'event-list-index', 0, 'event-list', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (4, 1, 0, 'Task', NULL, 'fa fa-tasks', 'membership-event/task', 'membership-event-task', 0, 'event-list', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (5, 1, 0, 'Payment', NULL, 'demo-pli-coin', 'membership-payment/payment', 'membership-payment-payment', 0, 'membership-payment', 'payment', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (6, 1, 0, 'Document', 11, 'fa fa-file-text-o', 'document/index', 'document-index document-subscriber', 1, 'document', 'index', 'index,create,view,update,delete,,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download');
INSERT INTO `permission_menu` VALUES (7, 1, 0, 'User', 0, 'demo-pli-male icon-fw', 'user/index', 'user-index', 0, 'user', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (8, 1, 0, 'Setup', 16, 'demo-pli-gear icon-lg icon-fw', '#', 'user-index hr-approval-permission-index customer-type-index leave-setup-index item-group-type-index working-group-index company-profile-index payment-status-index data-option-phone-country-code-index data-option-prefix-index marital-status-index country-index city-index payment-method-index user-type-index department-index employee-position-index bank-index chart-account-index item-group-data-index item-index item-group-index contract-type-index account-type-index sta', 1, NULL, NULL, 'index,create,view,update,delete');
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
INSERT INTO `permission_menu` VALUES (20, 1, 0, 'Projects', 5, 'fa fa-cubes', 'project/index', 'project-index', 1, 'project', 'index', 'index,create,view,update,delete,overview,task,copy,timesheet,sale-invoice,sale-payment,sale-quotation,dependent-get-customer-info,sale-expense,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download,note,pin');
INSERT INTO `permission_menu` VALUES (21, 1, 0, 'Tasks', 6, 'fa fa-tasks', 'task/index?smMenu=1', 'task-index', 1, 'task', 'index', 'index,create,view,update,delete,copy');
INSERT INTO `permission_menu` VALUES (22, 0, 50, 'Employee', 1, '', 'employee-profile/index', 'employee-profile-index', 1, 'employee-profile', 'index', 'index,create,view,update,delete,profile,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download,get-department');
INSERT INTO `permission_menu` VALUES (23, 1, 0, 'Customer', 4, 'fa fa-user-o', 'customer-profile/index', 'customer-profile-index', 1, 'customer-profile', 'index', 'index,create,view,update,delete,import-csv,download-sample-csv,profile,solution,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download');
INSERT INTO `permission_menu` VALUES (24, 1, 0, 'Sales', 12, 'fa fa-balance-scale', '#', 'quotation-index proposal-index contract-index', 1, 'sale', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (25, 0, 49, 'Expense', 3, 'fa fa-file-text-o', 'expense/index', 'expense-index', 1, 'expense', 'index', 'index,create,view,update,delete,pay-bill,update-pay-bill,void-pay-bill,void-expense');
INSERT INTO `permission_menu` VALUES (27, 1, 0, 'Report', 15, 'fa fa-area-chart', 'report/index', 'finance-chart-of-account-index index employee-report-report', 1, 'report', 'index', 'index,create,view,update,delete,report');
INSERT INTO `permission_menu` VALUES (28, 0, 8, 'Items', 5, NULL, 'item/index', 'item-index', 1, 'item', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (29, 0, 49, 'Invoices', 1, NULL, 'customer-invoice/index', 'customer-invoice-index customer-invoice-view', 1, 'customer-invoice', 'index', 'index,create,view,update,delete,void,validation-payment');
INSERT INTO `permission_menu` VALUES (30, 0, 49, 'Payments', 2, NULL, 'customer-payment/index', 'customer-payment-index customer-payment-view', 1, 'customer-payment', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (31, 0, 24, 'Contracts', 3, NULL, 'contract/index', 'contract-index', 1, 'contract', 'index', 'index,create,view,update,delete,detail,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download,overview');
INSERT INTO `permission_menu` VALUES (32, 0, 8, 'Item Group', 6, NULL, 'item-group/index', 'item-group-index', 1, 'item-group', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (33, 0, 24, 'Proposal', 1, NULL, 'proposal/index', 'proposal-index', 1, 'proposal', 'index', 'index,create,view,update,delete,overview,note,dependent-get-customer-info');
INSERT INTO `permission_menu` VALUES (34, 0, 8, 'Company Profile', 4, NULL, 'company-profile/index', 'company-profile-index', 1, 'company-profile', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (35, 1, 0, 'Knowledge Base', 10, 'fa fa-file-text-o', 'knowledge-base/index', 'knowledge-base-index', 1, 'knowledge-base', 'index', 'index,create,view,update,delete,article');
INSERT INTO `permission_menu` VALUES (38, 0, 8, 'Account Type', 9, NULL, 'account-type/index', 'account-type-index', 1, 'account-type', NULL, 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (39, 0, 8, 'Chart of Account', 10, NULL, 'chart-account/index', 'chart-account-index', 1, 'chart-account', NULL, 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (40, 0, 8, 'Bank', 11, NULL, 'bank/index', 'bank-index', 1, 'bank', NULL, 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (41, 0, 27, 'Chart of Account', 0, NULL, 'finance-chart-of-account/index', 'finance-chart-of-account-index', 1, 'finance-chart-of-account', NULL, 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (42, 0, 76, 'Supplier', 1, '', 'supplier-profile/index', 'supplier-profile-index', 1, 'supplier-profile', NULL, 'index,create,view,update,delete,contact,update-contact,create-contact,delete-contact');
INSERT INTO `permission_menu` VALUES (43, 0, 24, 'Quotation', 2, NULL, 'quotation/index', 'quotation-index', 1, 'quotation', 'index', 'index,create,view,update,delete,overview,pdf,dependent-get-customer-info,download');
INSERT INTO `permission_menu` VALUES (44, 1, 0, 'Lead', 3, 'fa fa-tty', 'lead-profile/index', 'lead-profile-index', 1, 'lead-profile', 'index', 'index,create,view,update,delete,import-csv,download-sample-csv,profile,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download,convert-lead');
INSERT INTO `permission_menu` VALUES (45, 0, 8, 'Contract Type', 8, NULL, 'contract-type/index', 'contract-type-index', 1, 'contract-type', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (46, 0, 27, 'Sale Report', 0, NULL, 'sale-report/invoice?smMenu=1', 'sale-report-invoice', 1, 'sale-report', 'invoice', 'index,create,view,update,delete,invoice,proposal,quotation');
INSERT INTO `permission_menu` VALUES (47, 0, 8, 'Department', 13, NULL, 'department/index', 'department-index', 1, 'department', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (48, 0, 27, 'Employee Report', NULL, NULL, 'employee-report/report?smMenu=1', 'employee-report-project', 1, 'employee-report', 'project', 'index,create,view,update,delete,report,tasks,project');
INSERT INTO `permission_menu` VALUES (49, 1, 0, 'Finance', 13, 'fa fa-money', '#', 'finance-journal-entry-index finance-transfer-index finance-opening-balance-index payroll-index customer-invoice-index customer-invoice-view  customer-payment-index customer-payment-view expense-index', 1, ' ', NULL, 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (50, 1, 0, 'Human Resource', 14, 'demo-pli-address-book', '#', 'leave-monthly-index leave-in-the-year-index leave-application-index payroll-request-index payroll-type-index cash-advance-request-index employee-profile-index ', 1, 'hr', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (51, 0, 49, 'Payroll', 4, NULL, 'payroll/index', 'payroll-index', 1, 'payroll', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (52, 0, 50, 'Cash Advance Request', 3, NULL, 'cash-advance-request/index', 'cash-advance-request-index', 1, 'cash-advance-request', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (53, 0, 50, 'Payroll Type', 0, NULL, 'payroll-type/index', 'payroll-type-index', 0, 'payroll-type', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (54, 1, 0, 'Budget Setup', 9, 'demo-pli-coin', 'budget-set-up/index', 'budget-set-up-index', 1, 'budget-set-up', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (55, 0, 50, 'Leave Application', 2, NULL, 'leave-application/index', 'leave-application-index', 1, 'leave-application', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (56, 0, 50, 'Payroll Request', 4, NULL, 'payroll-request/index', 'payroll-request-index', 1, 'payroll-request', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (57, 1, 0, 'K.P.I', 8, 'demo-pli-tactic', 'standard-operation/index', 'standard-operation-index sop-goal-setup-index', 0, 'standard-operation', 'index', 'index,create,view,update,delete,form-view');
INSERT INTO `permission_menu` VALUES (58, 0, 8, 'K.P.I Set Up', 1, NULL, 'standard-operation-step/index', 'standard-operation-step-index', 1, 'standard-operation-step', 'index', 'index,create,view,update,delete,form-view');
INSERT INTO `permission_menu` VALUES (59, 1, 0, 'K.P.I', 8, 'demo-pli-tactic', 'sop-goal-setup/index', 'sop-goal-setup-index', 1, 'sop-goal-setup', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (60, 1, 0, 'Milestone', 2, 'fa fa-history', 'standard-operation/index', 'standard-operation-index', 0, 'standard-operation', 'index', 'index,create,view,update,delete,update-step-sop');
INSERT INTO `permission_menu` VALUES (61, 0, 50, 'Leave Setup', 0, NULL, 'leave-in-the-year/index', 'leave-in-the-year-index', 0, 'leave-in-the-year', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (62, 0, 8, 'User Type & Roles', 13, 'demo-pli-computer-secure', 'user-type/index', 'user-type-index user-type-roles user-type-update', 1, 'user-type', 'index', 'index,create,view,update,delete,roles');
INSERT INTO `permission_menu` VALUES (63, 1, 0, 'S.O.P', 7, 'demo-pli-receipt-4', 'standard-operation-procedure-set-up/index', 'standard-operation-procedure-set-up-index', 1, 'standard-operation-procedure-set-up', 'index', 'index,create,view,update,delete,sop-setup,,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download');
INSERT INTO `permission_menu` VALUES (64, 0, 8, 'Item Group Data', 7, NULL, 'item-group-data/index', 'item-group-data-index', 1, 'item-group-data', 'index', 'index,create,view,update,delete,item');
INSERT INTO `permission_menu` VALUES (65, 0, 8, 'Working Group', 20, NULL, 'working-group/index', 'working-group-index', 1, 'working-group', 'index', 'index,create,view,update,delete,item');
INSERT INTO `permission_menu` VALUES (66, 0, 76, 'Supplier Type', 19, NULL, 'supplier-profile-type/index', 'supplier-profile-type-index', 1, 'supplier-profile-type', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (67, 0, 8, 'Customer Type', 22, NULL, 'customer-type/index', 'customer-type-index', 1, 'customer-type', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (68, 0, 8, 'Item Group Type', 6, NULL, 'item-group-type/index', 'item-group-type-index', 1, 'item-group-type', 'index', 'index,create,view,update,delete,item');
INSERT INTO `permission_menu` VALUES (69, 0, 8, 'HR Approval Permission', 23, NULL, 'hr-approval-permission/index', 'hr-approval-permission-index', 1, 'hr-approval-permission', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (70, 0, 8, 'Leave Setup', 2, NULL, 'leave-setup/index', 'leave-setup-index', 1, 'leave-setup', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (71, 0, 50, 'Monthly Leave', 2, NULL, 'leave-monthly/index', 'leave-monthly-index', 1, 'leave-monthly', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (72, 0, 49, 'Opening Balance', 0, 'fa fa-file-text-o', 'finance-opening-balance/index', 'finance-opening-balance-index', 1, 'finance-opening-balance', 'index', 'index,create,view,update,delete,void');
INSERT INTO `permission_menu` VALUES (73, 0, 8, 'User', 13, NULL, 'user/index', 'user-index', 1, 'user', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (74, 0, 49, 'Transfer', 0, NULL, 'finance-transfer/index', 'finance-transfer-index', 1, 'finance-transfer', 'index', 'index,create,view,update,delete,void');
INSERT INTO `permission_menu` VALUES (75, 0, 49, 'Journal Entry', 0, NULL, 'finance-journal-entry/index', 'finance-journal-entry-index', 1, 'finance-journal-entry', 'index', 'index,create,view,update,delete,void');
INSERT INTO `permission_menu` VALUES (76, 1, 0, 'Supplier Profile', 13, 'demo-pli-male-female', '#', 'supplier-profile-type-index supplier-position-index supplier-department-index supplier-profile-index ', 1, '', '', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (77, 0, 76, 'Department', 2, NULL, 'supplier-department/index', 'supplier-department-index', 1, 'supplier-department', 'index', 'index,create,view,update,delete');
INSERT INTO `permission_menu` VALUES (78, 0, 76, 'Position', 3, NULL, 'supplier-position/index', 'supplier-position-index', 1, 'supplier-position', 'index', 'index,create,view,update,delete');

-- ----------------------------
-- Table structure for permission_menu_live
-- ----------------------------
DROP TABLE IF EXISTS `permission_menu_live`;
CREATE TABLE `permission_menu_live`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_parent` tinyint(1) NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `menu_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `css_class` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `contoller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `extra_action` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permission_menu_live
-- ----------------------------
INSERT INTO `permission_menu_live` VALUES (1, 1, 0, 'Dashboard', 'demo-pli-home', '/', 'index dashboard', 1, 'site', 'index', 'index,create,view,update,delete', 1);
INSERT INTO `permission_menu_live` VALUES (2, 1, 0, 'Subscriber', 'fa fa-group', 'membership-profile/subscriber', 'membership-profile-subscriber membership-profile-subscriber membership-payment-subscriber membership-event-subscriber membership-document-subscriber', 0, 'membership-profile', 'subscriber', 'index,create,view,update,delete', NULL);
INSERT INTO `permission_menu_live` VALUES (3, 1, 0, 'Event', 'fa fa-calendar', 'event-list/index', 'event-list-index', 0, 'event-list', 'index', 'index,create,view,update,delete', NULL);
INSERT INTO `permission_menu_live` VALUES (4, 1, 0, 'Task', 'fa fa-tasks', 'membership-event/task', 'membership-event-task', 0, 'event-list', 'index', 'index,create,view,update,delete', NULL);
INSERT INTO `permission_menu_live` VALUES (5, 1, 0, 'Payment', 'demo-pli-coin', 'membership-payment/payment', 'membership-payment-payment', 0, 'membership-payment', 'payment', 'index,create,view,update,delete', NULL);
INSERT INTO `permission_menu_live` VALUES (6, 1, 0, 'Document', 'fa fa-file-text-o', 'document/index', 'document-index document-subscriber', 1, 'document', 'index', 'index,create,view,update,delete,,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download', 12);
INSERT INTO `permission_menu_live` VALUES (7, 1, 0, 'User', 'demo-pli-male icon-fw', 'user/index', 'user-index', 0, 'user', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (8, 1, 0, 'Setting', 'demo-pli-gear icon-lg icon-fw', '#', 'company-profile-index payment-status-index data-option-phone-country-code-index data-option-prefix-index marital-status-index country-index city-index payment-method-index', 1, NULL, NULL, 'index,create,view,update,delete', 15);
INSERT INTO `permission_menu_live` VALUES (9, 0, 8, 'Payment Status', NULL, 'payment-status/index', 'payment-status-index', 0, 'payment-status', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (10, 0, 8, 'Payment For', NULL, 'payment-for/index', 'payment-for-index', 0, 'payment-for', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (11, 0, 50, 'Position', NULL, 'employee-position/index', 'employee-position-index', 1, 'employee-position', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (12, 0, 8, 'Permission', NULL, 'permission/index', 'permission-index', 0, 'permission', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (13, 0, 8, 'Prefix', NULL, 'data-option-prefix/index', 'data-option-prefix-index', 1, 'data-option-prefix', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (14, 0, 8, 'Phone country code', NULL, 'data-option-phone-country-code/index', 'data-option-phone-country-code-index', 0, 'data-option-phone-country-code', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (15, 0, 8, 'Marital Status', NULL, 'marital-status/index', 'marital-status-index', 0, 'marital-status', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (16, 0, 8, 'Country', NULL, 'country/index', 'country-index', 0, 'country', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (17, 0, 8, 'City', NULL, 'city/index', 'city-index', 1, 'city', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (18, 0, 8, 'Payment Type', NULL, 'payment-type/index', 'payment-type-index', 0, 'payment-type', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (19, 0, 8, 'Payment Method', NULL, 'payment-method/index', 'payment-method-index', 0, 'payment-method', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (20, 1, 0, 'Projects', 'fa fa-cubes', 'project/index', 'project-index', 1, 'project', 'index', 'index,create,view,update,delete,overview,task,copy,timesheet,sale-invoice,sale-payment,sale-quotation,dependent-get-customer-info,sale-expense,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download,note', 5);
INSERT INTO `permission_menu_live` VALUES (21, 1, 0, 'Tasks', 'fa fa-tasks', 'task/index', 'task-index', 1, 'task', 'index', 'index,create,view,update,delete,copy', 7);
INSERT INTO `permission_menu_live` VALUES (22, 0, 50, 'Employee', '', 'employee-profile/index', 'employee-profile-index', 1, 'employee-profile', 'index', 'index,create,view,update,delete,profile,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download,get-department', 0);
INSERT INTO `permission_menu_live` VALUES (23, 1, 0, 'Customer', 'fa fa-user-o', 'customer-profile/index', 'customer-profile-index', 1, 'customer-profile', 'index', 'index,create,view,update,delete,import-csv,download-sample-csv,profile,solution,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download', 3);
INSERT INTO `permission_menu_live` VALUES (24, 1, 0, 'Sales', 'fa fa-balance-scale', '#', 'item-group-data-index quotation-index item-index item-group-index proposal-index contract-index contract-type-index', 1, 'sale', 'index', 'index,create,view,update,delete', 6);
INSERT INTO `permission_menu_live` VALUES (25, 0, 49, 'Expense', 'fa fa-file-text-o', 'expense/index', 'expense-index', 1, 'expense', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (27, 1, 0, 'Report', 'fa fa-area-chart', 'report/index', 'finance-chart-of-account-index index', 1, 'report', 'index', 'index,create,view,update,delete,report', 14);
INSERT INTO `permission_menu_live` VALUES (28, 0, 24, 'Items', NULL, 'item/index', 'item-index', 1, 'item', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (29, 0, 49, 'Invoices', NULL, 'customer-invoice/index', 'customer-invoice-index customer-invoice-view', 1, 'customer-invoice', 'index', 'index,create,view,update,delete,void,validation-payment', 0);
INSERT INTO `permission_menu_live` VALUES (30, 0, 49, 'Payments', NULL, 'customer-payment/index', 'customer-payment-index customer-payment-view', 1, 'customer-payment', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (31, 0, 24, 'Contracts', NULL, 'contract/index', 'contract-index', 1, 'contract', 'index', 'index,create,view,update,delete,detail,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download', 0);
INSERT INTO `permission_menu_live` VALUES (32, 0, 24, 'Item Group', NULL, 'item-group/index', 'item-group-index', 1, 'item-group', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (33, 0, 24, 'Proposal', NULL, 'proposal/index', 'proposal-index', 1, 'proposal', 'index', 'index,create,view,update,delete,overview,note', 0);
INSERT INTO `permission_menu_live` VALUES (34, 0, 8, 'Company Profile', NULL, 'company-profile/index', 'company-profile-index', 1, 'company-profile', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (35, 0, 50, 'Knowledge Base', 'fa fa-file-text-o', 'knowledge-base/index', 'knowledge-base-index', 1, 'knowledge-base', 'index', 'index,create,view,update,delete,article', 0);
INSERT INTO `permission_menu_live` VALUES (38, 0, 49, 'Account Type', NULL, 'account-type/index', 'account-type-index', 1, 'account-type', NULL, 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (39, 0, 49, 'Chart of Account', NULL, 'chart-account/index', 'chart-account-index', 1, 'chart-account', NULL, 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (40, 0, 49, 'Bank', NULL, 'bank/index', 'bank-index', 1, 'bank', NULL, 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (41, 0, 27, 'Chart of Account', NULL, 'finance-chart-of-account/index', 'finance-chart-of-account-index', 1, 'finance-chart-of-account', NULL, 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (42, 1, 0, 'Supplier', 'demo-pli-male-female', 'supplier-profile/index', 'supplier-profile-index', 1, 'supplier-profile', NULL, 'index,create,view,update,delete', 2);
INSERT INTO `permission_menu_live` VALUES (43, 0, 24, 'Quotation', NULL, 'quotation/index', 'quotation-index', 1, 'quotation', 'index', 'index,create,view,update,delete,overview,pdf,dependent-get-customer-info,download', 0);
INSERT INTO `permission_menu_live` VALUES (44, 1, 0, 'Lead', 'fa fa-tty', 'lead-profile/index', 'lead-profile-index', 1, 'lead-profile', 'index', 'index,create,view,update,delete,import-csv,download-sample-csv,profile,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download,convert-lead', 4);
INSERT INTO `permission_menu_live` VALUES (45, 0, 24, 'Contract Type', NULL, 'contract-type/index', 'contract-type-index', 1, 'contract-type', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (46, 0, 27, 'Sale Report', NULL, 'sale-report/invoice?smMenu=1', 'sale-report-invoice', 1, 'sale-report', 'invoice', 'index,create,view,update,delete,invoice,proposal,quotation', 0);
INSERT INTO `permission_menu_live` VALUES (47, 0, 50, 'Department', NULL, 'department/index', 'department-index', 1, 'department', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (48, 0, 27, 'Employee Report', NULL, 'employee-report/report?smMenu=1', 'employee-report-project', 1, 'employee-report', 'project', 'index,create,view,update,delete,report,tasks,project', NULL);
INSERT INTO `permission_menu_live` VALUES (49, 1, 0, 'Finance', 'fa fa-money', '#', 'account-type-index chart-account-index bank-index payroll-index customer-invoice-index customer-invoice-view  customer-payment-index customer-payment-view expense-index', 1, ' ', NULL, 'index,create,view,update,delete', 8);
INSERT INTO `permission_menu_live` VALUES (50, 1, 0, 'Human Resource', 'demo-pli-address-book', '#', 'department-index employee-position-index leave-in-the-year-index leave-application-index payroll-request-index payroll-type-index cash-advance-request-index employee-profile-index knowledge-base-index', 1, 'hr', 'index', 'index,create,view,update,delete', 10);
INSERT INTO `permission_menu_live` VALUES (51, 0, 49, 'Payroll', NULL, 'payroll/index', 'payroll-index', 1, 'payroll', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (52, 0, 50, 'Cash Advance Request', NULL, 'cash-advance-request/index', 'cash-advance-request-index', 1, 'cash-advance-request', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (53, 0, 50, 'Payroll Type', NULL, 'payroll-type/index', 'payroll-type-index', 0, 'payroll-type', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (54, 1, 0, 'Budget Setup', 'demo-pli-coin', 'budget-set-up/index', 'budget-set-up-index', 1, 'budget-set-up', 'index', 'index,create,view,update,delete', 11);
INSERT INTO `permission_menu_live` VALUES (55, 0, 50, 'Leave Application', NULL, 'leave-application/index', 'leave-application-index', 1, 'leave-application', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (56, 0, 50, 'Payroll Request', NULL, 'payroll-request/index', 'payroll-request-index', 1, 'payroll-request', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (57, 1, 0, 'K.P.I', 'demo-pli-tactic', 'standard-operation/index', 'standard-operation-index standard-operation-step-index sop-goal-setup-index', 1, 'standard-operation', 'index', 'index,create,view,update,delete,form-view', 9);
INSERT INTO `permission_menu_live` VALUES (58, 0, 57, 'Set Up', NULL, 'standard-operation-step/index', 'standard-operation-step-index', 1, 'standard-operation-step', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (59, 0, 57, 'K.P.I', '', 'sop-goal-setup/index', 'sop-goal-setup-index', 1, 'sop-goal-setup', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (60, 0, 57, 'Milestone', '', 'standard-operation/index', 'standard-operation-index', 1, 'standard-operation', 'index', 'index,create,view,update,delete,update-step-sop', 0);
INSERT INTO `permission_menu_live` VALUES (61, 0, 50, 'Leave Setup', NULL, 'leave-in-the-year/index', 'leave-in-the-year-index', 0, 'leave-in-the-year', 'index', 'index,create,view,update,delete', 0);
INSERT INTO `permission_menu_live` VALUES (62, 1, 0, 'User Type & Roles', 'demo-pli-computer-secure', 'user-type/index', 'user-type-index user-type-roles user-type-update', 1, 'user-type', 'index', 'index,create,view,update,delete,roles', 13);
INSERT INTO `permission_menu_live` VALUES (63, 1, 0, 'S.O.P', 'demo-pli-receipt-4', 'standard-operation-procedure-set-up/index', 'standard-operation-procedure-set-up-index', 1, 'standard-operation-procedure-set-up', 'index', 'index,create,view,update,delete,sop-setup,,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download', 8);
INSERT INTO `permission_menu_live` VALUES (64, 0, 24, 'Item Group Data', NULL, 'item-group-data/index', 'item-group-data-index', 1, 'item-group-data', 'index', 'index,create,view,update,delete,item', 0);

-- ----------------------------
-- Table structure for priority
-- ----------------------------
DROP TABLE IF EXISTS `priority`;
CREATE TABLE `priority`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `css_class` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of priority
-- ----------------------------
INSERT INTO `priority` VALUES (1, 'Low', 'label-primary');
INSERT INTO `priority` VALUES (2, 'Medium', 'label-info');
INSERT INTO `priority` VALUES (3, 'High', 'label-warning');
INSERT INTO `priority` VALUES (4, 'Urgent', 'label-danger');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_customer` int(11) NULL DEFAULT NULL,
  `is_calculate` tinyint(4) NULL DEFAULT NULL,
  `project_progress` decimal(10, 2) NULL DEFAULT NULL,
  `id_billing_type` tinyint(1) NULL DEFAULT NULL,
  `rate` decimal(10, 2) NULL DEFAULT NULL,
  `estimated_hour` decimal(10, 2) NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `due_date` date NULL DEFAULT NULL,
  `deadline` date NULL DEFAULT NULL,
  `id_priority` int(11) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cut_off_day` int(11) NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_pin` tinyint(1) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `is_under_kpi` tinyint(1) NULL DEFAULT NULL,
  `kpi_status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (1, 'Garden -Wooden House', 1, 1, NULL, NULL, NULL, NULL, '2019-10-18', NULL, '2019-12-18', 2, '', 0, NULL, 0, 1, 21, '2019-11-22 08:37:02', 21, '2019-11-21 10:52:05', NULL, NULL);

-- ----------------------------
-- Table structure for project_member
-- ----------------------------
DROP TABLE IF EXISTS `project_member`;
CREATE TABLE `project_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_project` int(11) NULL DEFAULT NULL,
  `id_employee` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project_member
-- ----------------------------
INSERT INTO `project_member` VALUES (4, 3, 6);
INSERT INTO `project_member` VALUES (5, 3, 8);
INSERT INTO `project_member` VALUES (6, 3, 10);
INSERT INTO `project_member` VALUES (8, 4, 4);
INSERT INTO `project_member` VALUES (20, 6, 4);
INSERT INTO `project_member` VALUES (22, 5, 5);
INSERT INTO `project_member` VALUES (24, 7, 5);
INSERT INTO `project_member` VALUES (25, 10, 12);
INSERT INTO `project_member` VALUES (32, 11, 5);
INSERT INTO `project_member` VALUES (42, 17, 1);
INSERT INTO `project_member` VALUES (43, 17, 2);
INSERT INTO `project_member` VALUES (44, 17, 3);
INSERT INTO `project_member` VALUES (46, 16, 1);
INSERT INTO `project_member` VALUES (47, 14, 5);
INSERT INTO `project_member` VALUES (48, 13, 5);
INSERT INTO `project_member` VALUES (53, 20, 10);
INSERT INTO `project_member` VALUES (54, 2, 6);
INSERT INTO `project_member` VALUES (55, 2, 12);
INSERT INTO `project_member` VALUES (56, 21, 1);
INSERT INTO `project_member` VALUES (61, 22, 6);
INSERT INTO `project_member` VALUES (62, 22, 7);
INSERT INTO `project_member` VALUES (63, 9, 6);
INSERT INTO `project_member` VALUES (64, 9, 7);
INSERT INTO `project_member` VALUES (65, 12, 12);
INSERT INTO `project_member` VALUES (66, 12, 16);
INSERT INTO `project_member` VALUES (67, 23, 12);
INSERT INTO `project_member` VALUES (69, 25, 12);
INSERT INTO `project_member` VALUES (70, 25, 16);
INSERT INTO `project_member` VALUES (75, 15, 5);
INSERT INTO `project_member` VALUES (76, 15, 17);
INSERT INTO `project_member` VALUES (77, 24, 10);
INSERT INTO `project_member` VALUES (84, 26, 12);
INSERT INTO `project_member` VALUES (85, 26, 16);
INSERT INTO `project_member` VALUES (92, 27, 4);
INSERT INTO `project_member` VALUES (94, 28, 4);
INSERT INTO `project_member` VALUES (95, 30, 5);
INSERT INTO `project_member` VALUES (96, 29, 5);
INSERT INTO `project_member` VALUES (97, 31, 2);
INSERT INTO `project_member` VALUES (98, 31, 7);
INSERT INTO `project_member` VALUES (100, 19, 5);
INSERT INTO `project_member` VALUES (101, 19, 17);
INSERT INTO `project_member` VALUES (102, 19, 20);
INSERT INTO `project_member` VALUES (103, 32, 5);
INSERT INTO `project_member` VALUES (104, 32, 17);
INSERT INTO `project_member` VALUES (105, 33, 22);
INSERT INTO `project_member` VALUES (106, 34, 10);
INSERT INTO `project_member` VALUES (107, 35, 10);
INSERT INTO `project_member` VALUES (108, 36, 16);
INSERT INTO `project_member` VALUES (109, 18, 17);
INSERT INTO `project_member` VALUES (110, 1, 16);

-- ----------------------------
-- Table structure for project_note
-- ----------------------------
DROP TABLE IF EXISTS `project_note`;
CREATE TABLE `project_note`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_project` int(11) NULL DEFAULT NULL,
  `id_user` int(11) NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project_note
-- ----------------------------
INSERT INTO `project_note` VALUES (1, 4, 15, '<p><br></p>');

-- ----------------------------
-- Table structure for project_status
-- ----------------------------
DROP TABLE IF EXISTS `project_status`;
CREATE TABLE `project_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `css_class` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project_status
-- ----------------------------
INSERT INTO `project_status` VALUES (1, 'Not Started', 'label-mint');
INSERT INTO `project_status` VALUES (2, 'In Progress', 'label-success');
INSERT INTO `project_status` VALUES (3, 'On Hold', 'label-warning');
INSERT INTO `project_status` VALUES (4, 'Cancelled', 'label-danger');
INSERT INTO `project_status` VALUES (5, 'Finished', 'label-info');

-- ----------------------------
-- Table structure for project_tag
-- ----------------------------
DROP TABLE IF EXISTS `project_tag`;
CREATE TABLE `project_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_project` int(11) NULL DEFAULT NULL,
  `id_tag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project_tag
-- ----------------------------
INSERT INTO `project_tag` VALUES (4, 3, 'pms');
INSERT INTO `project_tag` VALUES (5, 3, 'pos');
INSERT INTO `project_tag` VALUES (9, 4, 'website');
INSERT INTO `project_tag` VALUES (10, 4, 'trainee');
INSERT INTO `project_tag` VALUES (11, 4, 'webdeveloper');
INSERT INTO `project_tag` VALUES (18, 6, 'bms');
INSERT INTO `project_tag` VALUES (19, 6, 'bmsdoc');
INSERT INTO `project_tag` VALUES (20, 10, 'website');
INSERT INTO `project_tag` VALUES (29, 17, 'Application');
INSERT INTO `project_tag` VALUES (30, 17, 'BMS');
INSERT INTO `project_tag` VALUES (31, 17, 'Business');
INSERT INTO `project_tag` VALUES (32, 17, 'Management');
INSERT INTO `project_tag` VALUES (33, 17, 'System');
INSERT INTO `project_tag` VALUES (35, 16, 'dmc');
INSERT INTO `project_tag` VALUES (38, 20, 'bms');
INSERT INTO `project_tag` VALUES (39, 2, 'website');
INSERT INTO `project_tag` VALUES (40, 9, 'mobile');
INSERT INTO `project_tag` VALUES (41, 12, 'website');
INSERT INTO `project_tag` VALUES (42, 23, 'website');
INSERT INTO `project_tag` VALUES (47, 26, 'website');
INSERT INTO `project_tag` VALUES (48, 31, 'bms');
INSERT INTO `project_tag` VALUES (49, 1, 'website');

-- ----------------------------
-- Table structure for project_timesheet
-- ----------------------------
DROP TABLE IF EXISTS `project_timesheet`;
CREATE TABLE `project_timesheet`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date NULL DEFAULT NULL,
  `start_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `end_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_project` int(11) NULL DEFAULT NULL,
  `id_task` int(11) NULL DEFAULT NULL,
  `id_employee` int(11) NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project_timesheet
-- ----------------------------
INSERT INTO `project_timesheet` VALUES (1, '2019-09-16', '1:00 AM', '2019-09-16', '5:00 AM', 2, 2, NULL, 'Footer', '', 1, 23, '2019-10-16 16:13:36', 23, '2019-09-05 15:09:54');
INSERT INTO `project_timesheet` VALUES (2, '2019-09-06', '8:00 AM', '2019-09-06', '9:00 AM', 1, 10, NULL, 'Sao Nang', '', 1, NULL, NULL, 27, '2019-09-06 16:39:23');
INSERT INTO `project_timesheet` VALUES (3, '2019-10-11', '8:00 AM', '2019-10-11', '5:00 PM', 18, 219, NULL, 'Review System Hotel Link', '', 1, 28, '2019-10-12 11:02:13', 16, '2019-10-11 09:09:47');
INSERT INTO `project_timesheet` VALUES (4, '2019-10-11', '8:00 AM', '2019-10-11', '5:00 PM', 4, 20, NULL, 'Create Dynamic Website ', '-Create Dynamic Website \r\nNote: Contact\r\n          Gallery\r\n', 1, 15, '2019-10-11 16:46:05', 15, '2019-10-11 16:45:46');
INSERT INTO `project_timesheet` VALUES (5, '2019-10-12', '8:00 AM', '2019-10-12', '12:00 AM', 18, 219, NULL, 'Review System HLS', '', 1, NULL, NULL, 28, '2019-10-12 11:05:14');
INSERT INTO `project_timesheet` VALUES (6, '2019-10-12', '8:00 AM', '2019-10-12', '12:00 PM', 4, 20, NULL, 'Health Check meeting & Assist team to do health check ', '*Out project\r\n-Health Check meeting\r\n-Assist team to do health check 6', 1, 15, '2019-10-12 12:06:50', 15, '2019-10-12 12:06:25');
INSERT INTO `project_timesheet` VALUES (7, '2019-10-14', '10:00 AM', '2019-10-14', '11:00 AM', 19, 220, NULL, 'Booking Engine', '', 1, NULL, NULL, 31, '2019-10-14 09:51:00');
INSERT INTO `project_timesheet` VALUES (8, '2019-10-14', '10:00 AM', '2019-10-14', '11:00 AM', 19, 220, NULL, 'Booking Widget', '', 1, NULL, NULL, 31, '2019-10-14 10:17:37');
INSERT INTO `project_timesheet` VALUES (9, '2019-10-14', '8:00 AM', '2019-10-14', '5:00 PM', 4, 20, NULL, 'Do responsive page ', '-Weekly Meeting \r\n-Do responsive page \r\nNote: Home page\r\n*Out project\r\n-Go outside with B Theany (Sale consultant) to show HL system to client', 1, NULL, NULL, 15, '2019-10-14 19:53:54');
INSERT INTO `project_timesheet` VALUES (10, '2019-10-16', '8:00 AM', '2019-10-16', '12:00 AM', 10, 59, NULL, 'Pholly', '', 1, 23, '2019-10-17 11:32:48', 23, '2019-10-16 09:51:17');
INSERT INTO `project_timesheet` VALUES (11, '2019-10-16', '8:00 AM', '2019-10-16', '5:00 PM', 12, 236, NULL, 'Happy Hamster hotel', '', 1, 27, '2019-10-17 08:45:02', 27, '2019-10-16 10:25:23');
INSERT INTO `project_timesheet` VALUES (12, '2019-10-14', '8:00 AM', '2019-10-14', '5:00 AM', 12, 236, NULL, 'Conding contact us page', '', 1, 27, '2019-10-16 11:30:41', 27, '2019-10-16 10:28:06');
INSERT INTO `project_timesheet` VALUES (13, '2019-10-14', '8:00 AM', '2019-10-14', '4:00 PM', 20, 240, NULL, 'Setup', 'Awaiting for feedback and review.', 1, 21, '2019-10-16 10:50:54', 21, '2019-10-16 10:41:34');
INSERT INTO `project_timesheet` VALUES (14, '2019-10-16', '8:00 AM', '2019-10-16', '11:00 AM', 2, 242, NULL, 'Front Page > Spa Recent', '', 1, NULL, NULL, 17, '2019-10-16 11:33:28');
INSERT INTO `project_timesheet` VALUES (15, '2019-10-16', '11:00 AM', '2019-10-16', '2:30 PM', 2, 242, NULL, 'Fetch All Spa', '', 1, NULL, NULL, 17, '2019-10-16 11:34:24');
INSERT INTO `project_timesheet` VALUES (16, '2019-10-16', '2:30 PM', '2019-10-16', '4:00 PM', 2, 242, NULL, 'Fetch Spa Item Detail', '', 1, NULL, NULL, 17, '2019-10-16 11:35:01');
INSERT INTO `project_timesheet` VALUES (17, '2019-10-16', '11:00 AM', '2019-10-16', '12:00 PM', 23, 249, NULL, 'Fix problem', '', 1, NULL, NULL, 23, '2019-10-16 16:44:43');
INSERT INTO `project_timesheet` VALUES (18, '2019-10-16', '8:00 AM', '2019-10-16', '5:00 PM', 4, 20, NULL, 'Do responsive page', 'Do the responsive page\r\nNote:  Home page\r\n          About Us\r\n          Menu\r\n          Contact ', 1, NULL, NULL, 15, '2019-10-16 17:04:32');
INSERT INTO `project_timesheet` VALUES (19, '2019-10-16', '8:00 AM', '2019-10-16', '5:00 PM', 18, 219, NULL, 'Learning System HLS', '', 1, NULL, NULL, 28, '2019-10-17 08:29:13');
INSERT INTO `project_timesheet` VALUES (20, '2019-10-17', '8:00 AM', '2019-10-17', '8:00 PM', 12, 236, NULL, 'Happy hamster hostel', '', 1, 27, '2019-10-18 16:56:48', 27, '2019-10-17 08:43:52');
INSERT INTO `project_timesheet` VALUES (21, '2019-10-17', '8:00 AM', '2019-10-17', '11:00 AM', 10, 59, NULL, 'Codding', '', 1, NULL, NULL, 23, '2019-10-17 11:09:16');
INSERT INTO `project_timesheet` VALUES (22, '2019-10-17', '8:00 AM', '2019-10-17', '5:00 PM', 18, 219, NULL, 'Front Desk in system HLS', '', 1, NULL, NULL, 28, '2019-10-17 16:44:59');
INSERT INTO `project_timesheet` VALUES (23, '2019-10-17', '8:00 AM', '2019-10-17', '5:00 PM', 4, 20, NULL, 'Do responsive page & Create a new website', '-Do the responsive page | Finished \r\nNote: Gallery \r\n-Create a new website \r\nNote: Install Wordpress\r\n           Install plugins', 1, NULL, NULL, 15, '2019-10-17 17:09:58');
INSERT INTO `project_timesheet` VALUES (24, '2019-10-17', '1:00 AM', '2019-10-17', '3:00 AM', 2, 2, NULL, 'page about us,page single rooms', '', 1, 23, '2019-10-18 08:18:28', 23, '2019-10-18 08:15:54');
INSERT INTO `project_timesheet` VALUES (25, '2019-10-18', '8:00 AM', '2019-10-18', '5:00 PM', 12, 236, NULL, 'Happy Hamster Hostel ', '', 1, NULL, NULL, 27, '2019-10-18 16:56:27');
INSERT INTO `project_timesheet` VALUES (26, '2019-10-18', '8:00 AM', '2019-10-18', '5:00 PM', 4, 18, NULL, 'Create a new website ', '-Create a new website \r\nNote: Menu\r\n          Banner ', 1, NULL, NULL, 15, '2019-10-18 23:42:40');
INSERT INTO `project_timesheet` VALUES (27, '2019-10-18', '8:30 AM', '2019-10-19', '10:30 AM', 18, 219, NULL, 'Website', '', 1, NULL, NULL, 31, '2019-10-19 09:21:48');
INSERT INTO `project_timesheet` VALUES (28, '2019-10-18', '8:30 AM', '2019-10-19', '10:30 AM', 19, 220, NULL, 'Website', '', 1, NULL, NULL, 31, '2019-10-19 09:36:34');
INSERT INTO `project_timesheet` VALUES (29, '2019-10-19', '9:30 AM', '2019-10-19', '11:30 AM', 19, 220, NULL, 'Mobile Website', '', 1, NULL, NULL, 31, '2019-10-19 09:38:07');
INSERT INTO `project_timesheet` VALUES (30, '2019-10-19', '8:00 AM', '2019-10-19', '12:00 PM', 4, 18, NULL, 'Create a new website and update weekly report ', '-Create a new website \r\nNote: Content \r\n           -Room Type\r\n           -Story\r\n*Out project\r\n-Update weekly report ', 1, 15, '2019-10-19 11:56:55', 15, '2019-10-19 11:42:14');
INSERT INTO `project_timesheet` VALUES (31, '2019-10-19', '8:00 AM', '2019-10-19', '12:01 PM', 18, 219, NULL, 'Review HLS', '', 1, NULL, NULL, 28, '2019-10-19 11:52:14');
INSERT INTO `project_timesheet` VALUES (32, '2019-10-21', '9:00 AM', '2019-10-21', '10:30 AM', 19, 220, NULL, 'Website ', '', 1, 31, '2019-10-21 14:19:11', 31, '2019-10-21 09:02:12');
INSERT INTO `project_timesheet` VALUES (33, '2019-10-21', '2:17 PM', '2019-10-21', '3:30 PM', 19, 220, NULL, 'mobile website', '', 1, NULL, NULL, 31, '2019-10-21 14:18:52');
INSERT INTO `project_timesheet` VALUES (34, '2019-10-21', '8:00 AM', '2019-10-21', '5:00 PM', 12, 236, NULL, 'Happy Hamster hostel', '', 1, 27, '2019-10-21 16:42:47', 27, '2019-10-21 16:11:32');
INSERT INTO `project_timesheet` VALUES (35, '2019-10-21', '8:00 AM', '2019-10-21', '5:00 PM', 12, 236, NULL, 'Happy hamster hostel', '', 1, 27, '2019-10-21 16:13:16', 27, '2019-10-21 16:12:46');
INSERT INTO `project_timesheet` VALUES (36, '2019-10-21', '8:00 AM', '2019-10-21', '5:00 PM', 18, 219, NULL, 'Reports', '', 1, 16, '2019-10-22 16:52:43', 28, '2019-10-21 16:47:46');
INSERT INTO `project_timesheet` VALUES (37, '2019-10-21', '8:00 AM', '2019-10-21', '5:00 PM', 4, 20, NULL, 'Finished static home page and start dynamic', '-Weekly meeting\r\n-Start dynamic home page \r\nNote: Menu\r\n           Banner\r\n           Room Type \r\n', 1, NULL, NULL, 15, '2019-10-21 18:52:30');
INSERT INTO `project_timesheet` VALUES (38, '2019-10-22', '8:17 AM', '2019-10-22', '9:30 AM', 19, 220, NULL, 'Channel Management ', '', 1, NULL, NULL, 31, '2019-10-22 09:10:14');
INSERT INTO `project_timesheet` VALUES (39, '2019-10-22', '2:20 PM', '2019-10-22', '3:30 PM', 19, 220, NULL, 'social media ', '', 1, NULL, NULL, 31, '2019-10-22 15:47:25');
INSERT INTO `project_timesheet` VALUES (40, '2019-10-22', '3:50 PM', '2019-10-22', '4:20 PM', 19, 220, NULL, 'front desk', '', 1, NULL, NULL, 31, '2019-10-22 15:50:04');
INSERT INTO `project_timesheet` VALUES (41, '2019-10-22', '8:00 AM', '2019-10-22', '5:00 PM', 12, 236, NULL, 'Happy hamster hostel', '', 1, 27, '2019-10-22 16:46:51', 27, '2019-10-22 16:34:13');
INSERT INTO `project_timesheet` VALUES (42, '2019-10-22', '8:00 AM', '2019-10-22', '5:00 PM', 18, 219, NULL, 'Reports', '', 1, NULL, NULL, 28, '2019-10-22 16:55:16');
INSERT INTO `project_timesheet` VALUES (43, '2019-10-24', '9:40 AM', '2019-10-24', '11:00 AM', 19, 220, NULL, 'Booking Engine-Front desk', '', 1, NULL, NULL, 31, '2019-10-24 09:23:42');
INSERT INTO `project_timesheet` VALUES (44, '2019-10-22', '8:00 AM', '2019-10-22', '5:00 PM', 4, 20, NULL, 'Dynamic page ', '-Dynamic page \r\n +Restaurant \r\n +About Us\r\n +Gallery\r\n +Footer', 1, NULL, NULL, 15, '2019-10-24 09:45:39');
INSERT INTO `project_timesheet` VALUES (45, '2019-10-24', '8:00 AM', '2019-10-24', '5:00 PM', 18, 219, NULL, 'Learning HLS', '', 1, NULL, NULL, 28, '2019-10-24 16:39:51');
INSERT INTO `project_timesheet` VALUES (46, '2019-10-24', '8:00 AM', '2019-10-24', '5:00 PM', 4, 20, NULL, 'Dynamic page and single ', '-Dynamic page: \r\n +Contact\r\n-Dynamic single page:\r\n +Room Type\r\n +Restaurant \r\n', 1, NULL, NULL, 15, '2019-10-24 16:50:39');
INSERT INTO `project_timesheet` VALUES (47, '2019-10-25', '8:00 AM', '2019-10-25', '5:00 PM', 12, 236, NULL, 'happy hamster hostel', '', 1, 27, '2019-10-25 17:07:00', 27, '2019-10-25 13:37:40');
INSERT INTO `project_timesheet` VALUES (48, '2019-10-25', '8:00 AM', '2019-10-25', '3:00 PM', 15, 68, NULL, 'Processing ', '', 1, NULL, NULL, 28, '2019-10-25 14:25:00');
INSERT INTO `project_timesheet` VALUES (49, '2019-10-25', '8:00 AM', '2019-10-25', '5:00 PM', 4, 20, NULL, 'Do the responsive page', '-Do the responsive page\r\nNote: Menu', 1, NULL, NULL, 15, '2019-10-26 08:20:36');
INSERT INTO `project_timesheet` VALUES (50, '2019-10-26', '8:00 AM', '2019-10-26', '12:00 PM', 4, 20, NULL, 'Do the responsive page', '-Do the responsive page \r\n Note: Done Menu\r\n          Contact Us (fixing)\r\n*Out of project\r\n -Update weekly report', 1, NULL, NULL, 15, '2019-10-26 11:50:52');
INSERT INTO `project_timesheet` VALUES (51, '2019-10-26', '8:30 AM', '2019-10-26', '12:00 PM', 18, 219, NULL, 'Review system HLS', '', 1, NULL, NULL, 28, '2019-10-26 11:54:08');
INSERT INTO `project_timesheet` VALUES (52, '2019-10-26', '8:00 AM', '2019-10-26', '5:00 PM', 12, 236, NULL, 'Rithyma', '', 1, NULL, NULL, 27, '2019-10-26 12:10:37');
INSERT INTO `project_timesheet` VALUES (53, '2019-10-28', '3:00 PM', '2019-10-28', '3:30 PM', 19, 220, NULL, 'Hotel link solution Review ', '', 1, NULL, NULL, 31, '2019-10-28 15:28:38');
INSERT INTO `project_timesheet` VALUES (54, '2019-10-28', '3:30 PM', '2019-10-28', '4:00 PM', 19, 220, NULL, 'Opening system', '', 1, NULL, NULL, 31, '2019-10-28 15:33:14');
INSERT INTO `project_timesheet` VALUES (55, '2019-10-28', '8:00 AM', '2019-10-28', '5:00 PM', 12, 236, NULL, 'Happy Hamster hotel', '', 1, NULL, NULL, 27, '2019-10-28 17:01:12');
INSERT INTO `project_timesheet` VALUES (56, '2019-10-28', '8:00 AM', '2019-10-28', '5:00 PM', 4, 20, NULL, 'Do responsive page and Install new Xampp', '-Do responsive page and try to share xampp on mobile (cannot share ip)\r\nNote: Contact us\r\n-Install new Xampp and ask the team (Rith & Pholly )to help fix the database in PHPMyAdmin', 1, NULL, NULL, 15, '2019-10-28 17:03:12');
INSERT INTO `project_timesheet` VALUES (57, '2019-10-30', '9:00 AM', '2019-10-30', '10:30 AM', 19, 220, NULL, 'Booking Website', '', 1, NULL, NULL, 31, '2019-10-30 09:34:08');
INSERT INTO `project_timesheet` VALUES (58, '2019-11-01', '8:10 AM', '2019-11-01', '9:10 AM', 19, 220, NULL, 'view system ', '', 1, 31, '2019-11-01 08:11:41', 31, '2019-11-01 08:11:18');
INSERT INTO `project_timesheet` VALUES (59, '2019-11-02', '9:10 AM', '2019-11-02', '10:10 AM', 19, 220, NULL, 'review system', '', 1, NULL, NULL, 31, '2019-11-02 09:06:41');
INSERT INTO `project_timesheet` VALUES (60, '2019-11-04', '2:30 PM', '2019-11-04', '3:30 PM', 19, 220, NULL, 'review system', '', 1, NULL, NULL, 31, '2019-11-04 14:34:17');
INSERT INTO `project_timesheet` VALUES (61, '2019-11-05', '9:00 AM', '2019-11-05', '10:30 AM', 19, 220, NULL, 'review system', '', 1, NULL, NULL, 31, '2019-11-05 10:29:03');
INSERT INTO `project_timesheet` VALUES (62, '2019-11-08', '3:00 PM', '2019-11-08', '5:00 PM', 19, 220, NULL, 'Review system', '', 1, NULL, NULL, 31, '2019-11-08 14:53:00');
INSERT INTO `project_timesheet` VALUES (63, '2019-11-08', '8:00 AM', '2019-11-08', '5:00 PM', 12, 301, NULL, 'Nang', '', 1, NULL, NULL, 27, '2019-11-08 17:03:55');
INSERT INTO `project_timesheet` VALUES (64, '2019-11-13', '1:00 PM', '2019-11-13', '5:00 PM', 12, 317, NULL, 'Health Check', '', 1, 27, '2019-11-13 17:00:14', 27, '2019-11-13 16:57:42');
INSERT INTO `project_timesheet` VALUES (65, '2019-11-14', '9:10 AM', '2019-11-14', '10:00 AM', 19, 220, NULL, 'Review System', '', 1, NULL, NULL, 31, '2019-11-14 09:10:28');
INSERT INTO `project_timesheet` VALUES (66, '2019-11-14', '2:10 PM', '2019-11-14', '4:00 PM', 19, 220, NULL, 'Review system', '', 1, NULL, NULL, 31, '2019-11-14 14:10:14');
INSERT INTO `project_timesheet` VALUES (67, '2019-11-14', '8:00 AM', '2019-11-14', '5:00 PM', 12, 317, NULL, 'Time sheet', '', 1, 27, '2019-11-15 17:08:48', 27, '2019-11-14 14:35:44');
INSERT INTO `project_timesheet` VALUES (68, '2019-11-15', '8:11 AM', '2019-11-15', '10:00 AM', 19, 220, NULL, 'Review and read system', '', 1, NULL, NULL, 31, '2019-11-15 08:11:55');
INSERT INTO `project_timesheet` VALUES (69, '2019-11-13', '8:00 AM', '2019-11-13', '12:00 PM', 28, 287, NULL, 'Assist team to do health check and meeting ', '-Done health check 5\r\n-Meeting health check', 1, NULL, NULL, 15, '2019-11-15 09:38:36');
INSERT INTO `project_timesheet` VALUES (70, '2019-11-13', '1:00 PM', '2019-11-13', '5:00 PM', 27, 329, NULL, 'Done exercise from B. Pov', '-Done model box\r\n-Padding tap, check all boxes, and status bar', 1, NULL, NULL, 15, '2019-11-15 09:40:50');
INSERT INTO `project_timesheet` VALUES (71, '2019-11-14', '8:00 AM', '2019-11-14', '12:00 PM', 27, 330, NULL, 'Complete weekly report and meeting with team', '', 1, NULL, NULL, 15, '2019-11-15 09:50:02');
INSERT INTO `project_timesheet` VALUES (72, '2019-11-14', '1:00 PM', '2019-11-14', '5:00 PM', 27, 329, NULL, 'Done checkbox (Ask B. Pov to assist)', '-Done checkbox (Ask B. Pov to assist)\r\nNote: Animation of the checkbox\r\n         Skip Tab and status bar', 1, NULL, NULL, 15, '2019-11-15 09:54:57');
INSERT INTO `project_timesheet` VALUES (73, '2019-11-15', '8:00 AM', '2019-11-15', '5:00 PM', 27, 338, NULL, 'PHP', '', 1, 15, '2019-11-15 17:02:28', 15, '2019-11-15 17:01:25');
INSERT INTO `project_timesheet` VALUES (74, '2019-11-15', '8:00 AM', '2019-11-15', '5:00 PM', 12, 317, NULL, 'Time sheet', '', 1, 27, '2019-11-15 17:09:56', 27, '2019-11-15 17:08:02');
INSERT INTO `project_timesheet` VALUES (75, '2019-11-16', '8:00 AM', '2019-11-16', '5:00 PM', 12, 317, NULL, 'Time sheet ', '', 1, NULL, NULL, 27, '2019-11-16 11:16:19');
INSERT INTO `project_timesheet` VALUES (76, '2019-11-16', '8:00 AM', '2019-11-16', '12:00 PM', 27, 284, NULL, 'Learning PHP ', '-Learning PHP \r\nNote: Variable scope \r\n          Superglobals variables (pending $_REQUEST)', 1, 15, '2019-11-16 12:09:46', 15, '2019-11-16 12:08:07');
INSERT INTO `project_timesheet` VALUES (77, '2019-11-18', '8:00 AM', '2019-11-18', '9:00 AM', 19, 220, NULL, 'meeting and review produce ', '', 1, NULL, NULL, 31, '2019-11-18 09:09:02');
INSERT INTO `project_timesheet` VALUES (78, '2019-11-18', '9:00 AM', '2019-11-18', '10:00 AM', 19, 220, NULL, 'review produce ', '', 1, NULL, NULL, 31, '2019-11-18 09:10:48');
INSERT INTO `project_timesheet` VALUES (79, '2019-11-18', '3:00 PM', '2019-11-18', '5:00 PM', 19, 220, NULL, 'review system', '', 1, NULL, NULL, 31, '2019-11-18 15:00:12');
INSERT INTO `project_timesheet` VALUES (80, '2019-11-18', '8:00 AM', '2019-11-18', '5:00 PM', 12, 317, NULL, 'Time Sheet ', '', 1, NULL, NULL, 27, '2019-11-18 16:40:54');
INSERT INTO `project_timesheet` VALUES (81, '2019-11-18', '8:00 AM', '2019-11-18', '9:00 AM', 32, 349, NULL, 'Meeting With Web Developer Theme', '', 1, NULL, NULL, 28, '2019-11-18 16:44:37');
INSERT INTO `project_timesheet` VALUES (82, '2019-11-18', '9:00 AM', '2019-11-18', '10:00 AM', 32, 349, NULL, 'Errors in updating data to Expedia | Bayon Shadow Villa', '', 1, NULL, NULL, 28, '2019-11-18 16:46:59');
INSERT INTO `project_timesheet` VALUES (83, '2019-11-18', '10:00 AM', '2019-11-18', '11:00 AM', 32, 349, NULL, 'Errors in updating data to Expedia | Kolab Sor Phnom Penh Hotel', '', 1, NULL, NULL, 28, '2019-11-18 16:48:20');
INSERT INTO `project_timesheet` VALUES (84, '2019-11-18', '11:00 AM', '2019-11-18', '12:00 PM', 32, 349, NULL, 'Errors in updating data to Expedia | Bokre Angkor Hostel', '', 1, NULL, NULL, 28, '2019-11-18 16:49:43');
INSERT INTO `project_timesheet` VALUES (85, '2019-11-18', '1:00 PM', '2019-11-18', '4:00 PM', 32, 349, NULL, 'Review HLS', '', 1, NULL, NULL, 28, '2019-11-18 16:51:06');
INSERT INTO `project_timesheet` VALUES (86, '2019-11-18', '4:00 PM', '2019-11-18', '5:00 PM', 32, 350, NULL, 'Update Mapping for Booking.com | Le Cocon Boutique Hotel', '', 1, 28, '2019-11-18 16:57:15', 28, '2019-11-18 16:56:54');
INSERT INTO `project_timesheet` VALUES (87, '2019-11-18', '8:00 AM', '2019-11-18', '12:00 PM', 27, 353, NULL, 'Learning PHP ', '-Learning PHP \r\nNote: Session and Cookies ', 1, 15, '2019-11-19 08:29:31', 15, '2019-11-18 17:04:47');
INSERT INTO `project_timesheet` VALUES (88, '2019-11-18', '1:00 PM', '2019-11-18', '5:00 PM', 27, 285, NULL, 'Learning Yii2 ', '-Learning Yii2 \r\nNote: MVC ', 1, NULL, NULL, 15, '2019-11-18 17:05:34');
INSERT INTO `project_timesheet` VALUES (89, '2019-11-19', '8:30 AM', '2019-11-19', '10:00 AM', 19, 220, NULL, 'Reading produce', '', 1, NULL, NULL, 31, '2019-11-19 08:40:20');
INSERT INTO `project_timesheet` VALUES (90, '2019-11-19', '4:00 PM', '2019-11-19', '5:00 PM', 19, 220, NULL, 'Reading produce', '', 1, NULL, NULL, 31, '2019-11-19 15:56:03');
INSERT INTO `project_timesheet` VALUES (91, '2019-11-19', '4:00 PM', '2019-11-19', '5:00 PM', 19, 220, NULL, 'Reading produce', '', 1, NULL, NULL, 31, '2019-11-19 15:56:03');
INSERT INTO `project_timesheet` VALUES (92, '2019-11-19', '8:00 AM', '2019-11-19', '5:00 PM', 27, 285, NULL, 'Learning Yii2 ', '-Learning Yii2\r\nNote: Model \r\n          Install Yii and connect database ', 1, NULL, NULL, 15, '2019-11-19 16:52:03');
INSERT INTO `project_timesheet` VALUES (93, '2019-11-19', '8:00 AM', '2019-11-19', '5:00 PM', 36, 364, NULL, 'Time sheet', '', 1, NULL, NULL, 27, '2019-11-19 17:10:12');
INSERT INTO `project_timesheet` VALUES (94, '2019-11-20', '8:00 AM', '2019-11-20', '10:00 AM', 19, 220, NULL, 'Review system', '', 1, NULL, NULL, 31, '2019-11-20 08:38:14');
INSERT INTO `project_timesheet` VALUES (95, '2019-11-20', '10:00 AM', '2019-11-20', '11:00 AM', 19, 220, NULL, 'Time to break', '', 1, NULL, NULL, 31, '2019-11-20 11:02:48');

-- ----------------------------
-- Table structure for project_timesheet_description
-- ----------------------------
DROP TABLE IF EXISTS `project_timesheet_description`;
CREATE TABLE `project_timesheet_description`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_project_timesheet` int(11) NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 298 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project_timesheet_description
-- ----------------------------
INSERT INTO `project_timesheet_description` VALUES (2, 2, 'Complete Home page');
INSERT INTO `project_timesheet_description` VALUES (12, 4, '');
INSERT INTO `project_timesheet_description` VALUES (18, 3, 'BOOKING ENGINE');
INSERT INTO `project_timesheet_description` VALUES (19, 3, 'SETUP');
INSERT INTO `project_timesheet_description` VALUES (20, 3, 'DASHBOARD');
INSERT INTO `project_timesheet_description` VALUES (21, 3, 'FRONT DESK');
INSERT INTO `project_timesheet_description` VALUES (22, 3, 'BOOKING WIDGET');
INSERT INTO `project_timesheet_description` VALUES (23, 5, 'CHANNEL MANAGER');
INSERT INTO `project_timesheet_description` VALUES (24, 5, 'SOCIAL MEDIA');
INSERT INTO `project_timesheet_description` VALUES (26, 6, '');
INSERT INTO `project_timesheet_description` VALUES (27, 7, 'review booking engine');
INSERT INTO `project_timesheet_description` VALUES (28, 8, 'review ');
INSERT INTO `project_timesheet_description` VALUES (29, 9, '');
INSERT INTO `project_timesheet_description` VALUES (41, 13, 'Read eO-BMS Document > Setup');
INSERT INTO `project_timesheet_description` VALUES (42, 13, 'Learning eO-BMS > Setup Processing flow');
INSERT INTO `project_timesheet_description` VALUES (43, 12, 'Coding contact us page happyHamsterHotel website');
INSERT INTO `project_timesheet_description` VALUES (44, 14, '');
INSERT INTO `project_timesheet_description` VALUES (45, 15, '');
INSERT INTO `project_timesheet_description` VALUES (46, 16, '');
INSERT INTO `project_timesheet_description` VALUES (60, 1, 'add box shadow footer');
INSERT INTO `project_timesheet_description` VALUES (61, 1, 'Change background in section Mobile app');
INSERT INTO `project_timesheet_description` VALUES (62, 1, 'Change background in section Foods');
INSERT INTO `project_timesheet_description` VALUES (63, 1, 'Add booking engine in single page rooms');
INSERT INTO `project_timesheet_description` VALUES (64, 1, 'Remove detail rooms replace booking engine back');
INSERT INTO `project_timesheet_description` VALUES (65, 1, 'Remove section Booking Form in front page');
INSERT INTO `project_timesheet_description` VALUES (66, 1, 'Add link Booking to page reservation');
INSERT INTO `project_timesheet_description` VALUES (67, 17, 'Can\'t Upload image in wordpress Note Done');
INSERT INTO `project_timesheet_description` VALUES (74, 18, '   ');
INSERT INTO `project_timesheet_description` VALUES (78, 19, 'Set up');
INSERT INTO `project_timesheet_description` VALUES (79, 19, 'Room');
INSERT INTO `project_timesheet_description` VALUES (80, 19, 'Rates and Availability');
INSERT INTO `project_timesheet_description` VALUES (81, 19, 'Special Offers');
INSERT INTO `project_timesheet_description` VALUES (82, 19, 'Booking Extras');
INSERT INTO `project_timesheet_description` VALUES (85, 11, 'Coding about us page');
INSERT INTO `project_timesheet_description` VALUES (86, 11, 'Coding Massage service page');
INSERT INTO `project_timesheet_description` VALUES (87, 11, 'Coding massage  single page');
INSERT INTO `project_timesheet_description` VALUES (88, 21, 'Add new header when scroll have logo and menu ');
INSERT INTO `project_timesheet_description` VALUES (89, 21, 'responsive header');
INSERT INTO `project_timesheet_description` VALUES (90, 21, 'live demo Yani Hotel');
INSERT INTO `project_timesheet_description` VALUES (91, 21, 'Fix HTTP acc can\'t upload image big size');
INSERT INTO `project_timesheet_description` VALUES (92, 10, 'Remover map on footer');
INSERT INTO `project_timesheet_description` VALUES (93, 10, 'add Recent Gallery in footer');
INSERT INTO `project_timesheet_description` VALUES (94, 10, 'add detail when hover on room list ');
INSERT INTO `project_timesheet_description` VALUES (95, 10, 'fix page contact us');
INSERT INTO `project_timesheet_description` VALUES (96, 10, 'check recommend again ');
INSERT INTO `project_timesheet_description` VALUES (99, 22, 'Calendar');
INSERT INTO `project_timesheet_description` VALUES (100, 22, 'Housekeeping ');
INSERT INTO `project_timesheet_description` VALUES (101, 22, 'In-house Extra');
INSERT INTO `project_timesheet_description` VALUES (102, 22, 'Guest Email');
INSERT INTO `project_timesheet_description` VALUES (103, 22, 'Booking Management');
INSERT INTO `project_timesheet_description` VALUES (104, 22, 'Create Booking');
INSERT INTO `project_timesheet_description` VALUES (108, 23, '');
INSERT INTO `project_timesheet_description` VALUES (113, 24, 'Remove award from page about us');
INSERT INTO `project_timesheet_description` VALUES (114, 24, 'remove slider image from page single page');
INSERT INTO `project_timesheet_description` VALUES (115, 24, 'change background color on front page');
INSERT INTO `project_timesheet_description` VALUES (116, 25, 'Coding Term and condition page');
INSERT INTO `project_timesheet_description` VALUES (117, 25, 'Coding location page');
INSERT INTO `project_timesheet_description` VALUES (118, 25, 'Coding Giveback project page');
INSERT INTO `project_timesheet_description` VALUES (119, 25, 'Coding promotion page');
INSERT INTO `project_timesheet_description` VALUES (120, 20, 'Coding page feed back us (not approve )');
INSERT INTO `project_timesheet_description` VALUES (121, 20, 'meet Rithyma client');
INSERT INTO `project_timesheet_description` VALUES (122, 20, 'Coding gallery page');
INSERT INTO `project_timesheet_description` VALUES (123, 26, '');
INSERT INTO `project_timesheet_description` VALUES (124, 27, 'Review Website ');
INSERT INTO `project_timesheet_description` VALUES (125, 27, 'Review Mobile Website');
INSERT INTO `project_timesheet_description` VALUES (126, 28, 'Review Webside');
INSERT INTO `project_timesheet_description` VALUES (127, 29, 'Review website and mobile web');
INSERT INTO `project_timesheet_description` VALUES (129, 31, 'Dashboard');
INSERT INTO `project_timesheet_description` VALUES (130, 31, 'Set up');
INSERT INTO `project_timesheet_description` VALUES (131, 30, '');
INSERT INTO `project_timesheet_description` VALUES (133, 33, 'Review more');
INSERT INTO `project_timesheet_description` VALUES (134, 32, 'Review more');
INSERT INTO `project_timesheet_description` VALUES (141, 35, 'Coding promotion page');
INSERT INTO `project_timesheet_description` VALUES (147, 34, 'Meeting teams');
INSERT INTO `project_timesheet_description` VALUES (148, 34, 'Live demo happy hamster hostel');
INSERT INTO `project_timesheet_description` VALUES (149, 34, 'met happyhamster client');
INSERT INTO `project_timesheet_description` VALUES (150, 34, 'Coding single promotion page');
INSERT INTO `project_timesheet_description` VALUES (151, 34, 'Change style menu to fixed background');
INSERT INTO `project_timesheet_description` VALUES (152, 34, '');
INSERT INTO `project_timesheet_description` VALUES (161, 37, 'Finished static home page');
INSERT INTO `project_timesheet_description` VALUES (162, 37, 'Start dynamic home page ');
INSERT INTO `project_timesheet_description` VALUES (163, 38, 'reading Channel and review website mobile website');
INSERT INTO `project_timesheet_description` VALUES (164, 39, 'reading and review channel management  and front desk ');
INSERT INTO `project_timesheet_description` VALUES (165, 40, 'Reading and review social media ');
INSERT INTO `project_timesheet_description` VALUES (171, 41, 'Responsive menu');
INSERT INTO `project_timesheet_description` VALUES (172, 41, 'Responsive front page');
INSERT INTO `project_timesheet_description` VALUES (173, 41, 'Fixed or Edit page');
INSERT INTO `project_timesheet_description` VALUES (174, 36, 'Daily Meeting with Theme Web developer talk about weekly reports');
INSERT INTO `project_timesheet_description` VALUES (175, 36, 'Arrival List Report');
INSERT INTO `project_timesheet_description` VALUES (176, 36, 'Departure List Report');
INSERT INTO `project_timesheet_description` VALUES (177, 36, 'Inhouse-Guest List Report');
INSERT INTO `project_timesheet_description` VALUES (178, 36, 'Guest Details Report');
INSERT INTO `project_timesheet_description` VALUES (179, 36, 'Daily Payment Report');
INSERT INTO `project_timesheet_description` VALUES (180, 36, 'Details Revenue Report');
INSERT INTO `project_timesheet_description` VALUES (181, 36, 'Revenue Report by bookings');
INSERT INTO `project_timesheet_description` VALUES (182, 42, 'Revenue Report by Room Type');
INSERT INTO `project_timesheet_description` VALUES (183, 42, 'Revenue Report by Booking Seurces');
INSERT INTO `project_timesheet_description` VALUES (184, 42, 'Booking Report');
INSERT INTO `project_timesheet_description` VALUES (185, 42, 'Operation Report');
INSERT INTO `project_timesheet_description` VALUES (186, 42, 'Room Occupaycy Report');
INSERT INTO `project_timesheet_description` VALUES (187, 42, 'Performance Report');
INSERT INTO `project_timesheet_description` VALUES (188, 43, 'Review all of system ');
INSERT INTO `project_timesheet_description` VALUES (189, 44, '');
INSERT INTO `project_timesheet_description` VALUES (190, 45, 'Learning Set up ');
INSERT INTO `project_timesheet_description` VALUES (191, 45, 'Create room type');
INSERT INTO `project_timesheet_description` VALUES (192, 45, 'Rates and Availability');
INSERT INTO `project_timesheet_description` VALUES (193, 45, 'Create Rates Plan');
INSERT INTO `project_timesheet_description` VALUES (194, 45, 'Monthly Rates Plan Updates');
INSERT INTO `project_timesheet_description` VALUES (195, 45, 'Stop Sell');
INSERT INTO `project_timesheet_description` VALUES (196, 46, '');
INSERT INTO `project_timesheet_description` VALUES (198, 48, 'Booking Engine ');
INSERT INTO `project_timesheet_description` VALUES (199, 48, 'Set Up');
INSERT INTO `project_timesheet_description` VALUES (200, 48, 'Set up room');
INSERT INTO `project_timesheet_description` VALUES (201, 48, 'Set up rates');
INSERT INTO `project_timesheet_description` VALUES (209, 47, 'Create menu scroll happy hamster hostel');
INSERT INTO `project_timesheet_description` VALUES (210, 47, 'Fix/update Rithyma');
INSERT INTO `project_timesheet_description` VALUES (211, 47, 'Fix/Edit happy hamster hostel');
INSERT INTO `project_timesheet_description` VALUES (212, 49, '');
INSERT INTO `project_timesheet_description` VALUES (213, 50, '');
INSERT INTO `project_timesheet_description` VALUES (214, 51, 'Front Desk');
INSERT INTO `project_timesheet_description` VALUES (215, 51, 'Channel Manager');
INSERT INTO `project_timesheet_description` VALUES (216, 51, 'Social Media');
INSERT INTO `project_timesheet_description` VALUES (217, 52, 'Make Document for training client');
INSERT INTO `project_timesheet_description` VALUES (218, 52, 'Fix Rithyma (Slide & Logo)');
INSERT INTO `project_timesheet_description` VALUES (219, 53, 'review all of system ');
INSERT INTO `project_timesheet_description` VALUES (220, 54, 'hotel link solution system');
INSERT INTO `project_timesheet_description` VALUES (221, 55, 'add search widget happy hamster hotel ');
INSERT INTO `project_timesheet_description` VALUES (222, 55, 'inform about training website to Rithyma');
INSERT INTO `project_timesheet_description` VALUES (223, 55, 'Fix/Edit style happy hamster hostel & Rithyma ');
INSERT INTO `project_timesheet_description` VALUES (224, 55, '');
INSERT INTO `project_timesheet_description` VALUES (225, 56, '');
INSERT INTO `project_timesheet_description` VALUES (226, 57, 'review  website system');
INSERT INTO `project_timesheet_description` VALUES (228, 58, 'view system');
INSERT INTO `project_timesheet_description` VALUES (229, 59, 'review system ');
INSERT INTO `project_timesheet_description` VALUES (230, 60, '');
INSERT INTO `project_timesheet_description` VALUES (231, 61, 'review system');
INSERT INTO `project_timesheet_description` VALUES (232, 62, 'Review system');
INSERT INTO `project_timesheet_description` VALUES (233, 63, 'Learn create jivo chat');
INSERT INTO `project_timesheet_description` VALUES (234, 63, 'Check and fix happy hamster ');
INSERT INTO `project_timesheet_description` VALUES (235, 63, 'Learn to do health check');
INSERT INTO `project_timesheet_description` VALUES (236, 63, 'Find theme in pinteres');
INSERT INTO `project_timesheet_description` VALUES (238, 64, 'Complete 2 health check');
INSERT INTO `project_timesheet_description` VALUES (239, 65, 'Review system');
INSERT INTO `project_timesheet_description` VALUES (240, 66, 'Review and read system');
INSERT INTO `project_timesheet_description` VALUES (242, 68, 'Review and read system');
INSERT INTO `project_timesheet_description` VALUES (243, 69, '');
INSERT INTO `project_timesheet_description` VALUES (244, 70, '');
INSERT INTO `project_timesheet_description` VALUES (245, 71, '');
INSERT INTO `project_timesheet_description` VALUES (246, 72, '');
INSERT INTO `project_timesheet_description` VALUES (250, 73, 'Variable ');
INSERT INTO `project_timesheet_description` VALUES (251, 73, 'Data type');
INSERT INTO `project_timesheet_description` VALUES (252, 73, 'Constant');
INSERT INTO `project_timesheet_description` VALUES (253, 73, 'Operator');
INSERT INTO `project_timesheet_description` VALUES (254, 73, 'If statement ');
INSERT INTO `project_timesheet_description` VALUES (255, 73, 'Switch statement ');
INSERT INTO `project_timesheet_description` VALUES (256, 73, 'Array');
INSERT INTO `project_timesheet_description` VALUES (257, 73, 'Loop');
INSERT INTO `project_timesheet_description` VALUES (260, 67, 'Complete 9 health check');
INSERT INTO `project_timesheet_description` VALUES (264, 74, 'add SEO, Google search console on Rithma website assisting from Mr. Phally');
INSERT INTO `project_timesheet_description` VALUES (265, 74, 'Design hotel template ');
INSERT INTO `project_timesheet_description` VALUES (266, 74, 'Research template in google & pinterest');
INSERT INTO `project_timesheet_description` VALUES (267, 75, 'Design template ');
INSERT INTO `project_timesheet_description` VALUES (269, 76, '');
INSERT INTO `project_timesheet_description` VALUES (270, 77, 'review produce with team and meeting ');
INSERT INTO `project_timesheet_description` VALUES (271, 78, 'Review produce more ');
INSERT INTO `project_timesheet_description` VALUES (272, 79, 'Review more time');
INSERT INTO `project_timesheet_description` VALUES (273, 80, 'Add background image part 1 & 3');
INSERT INTO `project_timesheet_description` VALUES (274, 80, 'Meeting team');
INSERT INTO `project_timesheet_description` VALUES (275, 80, '');
INSERT INTO `project_timesheet_description` VALUES (276, 81, 'Taking about Report weekly');
INSERT INTO `project_timesheet_description` VALUES (277, 81, 'Taking about support theme');
INSERT INTO `project_timesheet_description` VALUES (278, 82, 'Save email to BMS system');
INSERT INTO `project_timesheet_description` VALUES (279, 82, 'Send Email');
INSERT INTO `project_timesheet_description` VALUES (280, 83, 'Save Email to BMS system');
INSERT INTO `project_timesheet_description` VALUES (281, 83, 'Send Email');
INSERT INTO `project_timesheet_description` VALUES (282, 84, 'Save Email to BMS system');
INSERT INTO `project_timesheet_description` VALUES (283, 84, 'Send Email');
INSERT INTO `project_timesheet_description` VALUES (284, 85, 'Review HLS');
INSERT INTO `project_timesheet_description` VALUES (286, 86, 'Save Email to BMS system');
INSERT INTO `project_timesheet_description` VALUES (287, 86, 'Send Email');
INSERT INTO `project_timesheet_description` VALUES (289, 88, '');
INSERT INTO `project_timesheet_description` VALUES (290, 87, '');
INSERT INTO `project_timesheet_description` VALUES (291, 89, 'Reading and Review system');
INSERT INTO `project_timesheet_description` VALUES (292, 90, 'Reading and Review system ');
INSERT INTO `project_timesheet_description` VALUES (293, 91, 'Reading and Review system ');
INSERT INTO `project_timesheet_description` VALUES (294, 92, '');
INSERT INTO `project_timesheet_description` VALUES (295, 93, 'Setup wordpress tekheangsin');
INSERT INTO `project_timesheet_description` VALUES (296, 94, 'Reading system');
INSERT INTO `project_timesheet_description` VALUES (297, 95, 'Study more language');

-- ----------------------------
-- Table structure for project_timesheet_member
-- ----------------------------
DROP TABLE IF EXISTS `project_timesheet_member`;
CREATE TABLE `project_timesheet_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_project_timesheet` int(11) NULL DEFAULT NULL,
  `id_employee` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project_timesheet_member
-- ----------------------------
INSERT INTO `project_timesheet_member` VALUES (1, 2, 16);
INSERT INTO `project_timesheet_member` VALUES (5, 4, 4);
INSERT INTO `project_timesheet_member` VALUES (7, 3, 17);
INSERT INTO `project_timesheet_member` VALUES (9, 6, 4);
INSERT INTO `project_timesheet_member` VALUES (10, 7, 20);
INSERT INTO `project_timesheet_member` VALUES (11, 8, 20);
INSERT INTO `project_timesheet_member` VALUES (12, 9, 4);
INSERT INTO `project_timesheet_member` VALUES (16, 13, 10);
INSERT INTO `project_timesheet_member` VALUES (17, 12, 16);
INSERT INTO `project_timesheet_member` VALUES (18, 14, 6);
INSERT INTO `project_timesheet_member` VALUES (19, 15, 6);
INSERT INTO `project_timesheet_member` VALUES (20, 16, 6);
INSERT INTO `project_timesheet_member` VALUES (24, 1, 12);
INSERT INTO `project_timesheet_member` VALUES (25, 17, 12);
INSERT INTO `project_timesheet_member` VALUES (26, 18, 4);
INSERT INTO `project_timesheet_member` VALUES (27, 21, 12);
INSERT INTO `project_timesheet_member` VALUES (28, 10, 12);
INSERT INTO `project_timesheet_member` VALUES (29, 23, 4);
INSERT INTO `project_timesheet_member` VALUES (32, 24, 12);
INSERT INTO `project_timesheet_member` VALUES (33, 25, 16);
INSERT INTO `project_timesheet_member` VALUES (34, 26, 4);
INSERT INTO `project_timesheet_member` VALUES (35, 28, 20);
INSERT INTO `project_timesheet_member` VALUES (36, 29, 20);
INSERT INTO `project_timesheet_member` VALUES (38, 30, 4);
INSERT INTO `project_timesheet_member` VALUES (40, 33, 20);
INSERT INTO `project_timesheet_member` VALUES (41, 32, 20);
INSERT INTO `project_timesheet_member` VALUES (44, 35, 16);
INSERT INTO `project_timesheet_member` VALUES (46, 34, 16);
INSERT INTO `project_timesheet_member` VALUES (47, 37, 4);
INSERT INTO `project_timesheet_member` VALUES (48, 38, 20);
INSERT INTO `project_timesheet_member` VALUES (49, 39, 20);
INSERT INTO `project_timesheet_member` VALUES (50, 40, 20);
INSERT INTO `project_timesheet_member` VALUES (53, 41, 16);
INSERT INTO `project_timesheet_member` VALUES (54, 43, 20);
INSERT INTO `project_timesheet_member` VALUES (55, 44, 4);
INSERT INTO `project_timesheet_member` VALUES (56, 46, 4);
INSERT INTO `project_timesheet_member` VALUES (59, 47, 16);
INSERT INTO `project_timesheet_member` VALUES (60, 49, 4);
INSERT INTO `project_timesheet_member` VALUES (61, 50, 4);
INSERT INTO `project_timesheet_member` VALUES (62, 53, 20);
INSERT INTO `project_timesheet_member` VALUES (63, 54, 20);
INSERT INTO `project_timesheet_member` VALUES (64, 55, 16);
INSERT INTO `project_timesheet_member` VALUES (65, 56, 4);
INSERT INTO `project_timesheet_member` VALUES (66, 57, 20);
INSERT INTO `project_timesheet_member` VALUES (68, 58, 20);
INSERT INTO `project_timesheet_member` VALUES (69, 59, 20);
INSERT INTO `project_timesheet_member` VALUES (70, 60, 20);
INSERT INTO `project_timesheet_member` VALUES (71, 61, 20);
INSERT INTO `project_timesheet_member` VALUES (72, 62, 20);
INSERT INTO `project_timesheet_member` VALUES (73, 63, 16);
INSERT INTO `project_timesheet_member` VALUES (75, 64, 16);
INSERT INTO `project_timesheet_member` VALUES (76, 65, 20);
INSERT INTO `project_timesheet_member` VALUES (77, 66, 20);
INSERT INTO `project_timesheet_member` VALUES (79, 68, 20);
INSERT INTO `project_timesheet_member` VALUES (80, 69, 4);
INSERT INTO `project_timesheet_member` VALUES (81, 70, 4);
INSERT INTO `project_timesheet_member` VALUES (82, 71, 4);
INSERT INTO `project_timesheet_member` VALUES (83, 72, 4);
INSERT INTO `project_timesheet_member` VALUES (85, 73, 4);
INSERT INTO `project_timesheet_member` VALUES (87, 67, 16);
INSERT INTO `project_timesheet_member` VALUES (89, 74, 16);
INSERT INTO `project_timesheet_member` VALUES (90, 75, 16);
INSERT INTO `project_timesheet_member` VALUES (92, 76, 4);
INSERT INTO `project_timesheet_member` VALUES (93, 77, 20);
INSERT INTO `project_timesheet_member` VALUES (94, 78, 20);
INSERT INTO `project_timesheet_member` VALUES (95, 79, 20);
INSERT INTO `project_timesheet_member` VALUES (96, 80, 16);
INSERT INTO `project_timesheet_member` VALUES (97, 81, 5);
INSERT INTO `project_timesheet_member` VALUES (98, 81, 17);
INSERT INTO `project_timesheet_member` VALUES (99, 82, 5);
INSERT INTO `project_timesheet_member` VALUES (100, 82, 17);
INSERT INTO `project_timesheet_member` VALUES (101, 83, 5);
INSERT INTO `project_timesheet_member` VALUES (102, 83, 17);
INSERT INTO `project_timesheet_member` VALUES (103, 84, 5);
INSERT INTO `project_timesheet_member` VALUES (104, 84, 17);
INSERT INTO `project_timesheet_member` VALUES (105, 85, 5);
INSERT INTO `project_timesheet_member` VALUES (106, 85, 17);
INSERT INTO `project_timesheet_member` VALUES (109, 86, 5);
INSERT INTO `project_timesheet_member` VALUES (110, 86, 17);
INSERT INTO `project_timesheet_member` VALUES (112, 88, 4);
INSERT INTO `project_timesheet_member` VALUES (113, 87, 4);
INSERT INTO `project_timesheet_member` VALUES (114, 89, 20);
INSERT INTO `project_timesheet_member` VALUES (115, 90, 20);
INSERT INTO `project_timesheet_member` VALUES (116, 91, 20);
INSERT INTO `project_timesheet_member` VALUES (117, 92, 4);
INSERT INTO `project_timesheet_member` VALUES (118, 93, 16);
INSERT INTO `project_timesheet_member` VALUES (119, 94, 20);
INSERT INTO `project_timesheet_member` VALUES (120, 95, 20);

-- ----------------------------
-- Table structure for project_timesheet_tag
-- ----------------------------
DROP TABLE IF EXISTS `project_timesheet_tag`;
CREATE TABLE `project_timesheet_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_project_timesheet` int(11) NULL DEFAULT NULL,
  `id_tag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project_timesheet_tag
-- ----------------------------
INSERT INTO `project_timesheet_tag` VALUES (1, 2, 'website');
INSERT INTO `project_timesheet_tag` VALUES (6, 4, 'dynamic');
INSERT INTO `project_timesheet_tag` VALUES (7, 4, 'contact');
INSERT INTO `project_timesheet_tag` VALUES (8, 4, 'gallery');
INSERT INTO `project_timesheet_tag` VALUES (9, 4, 'website');
INSERT INTO `project_timesheet_tag` VALUES (11, 6, 'healthcheck');
INSERT INTO `project_timesheet_tag` VALUES (16, 1, 'website');
INSERT INTO `project_timesheet_tag` VALUES (17, 17, 'website');
INSERT INTO `project_timesheet_tag` VALUES (18, 21, 'website');
INSERT INTO `project_timesheet_tag` VALUES (19, 10, 'website');
INSERT INTO `project_timesheet_tag` VALUES (22, 24, 'website');
INSERT INTO `project_timesheet_tag` VALUES (23, 25, 'Website');
INSERT INTO `project_timesheet_tag` VALUES (24, 63, 'website');

-- ----------------------------
-- Table structure for proposal
-- ----------------------------
DROP TABLE IF EXISTS `proposal`;
CREATE TABLE `proposal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `related_id` int(11) NULL DEFAULT NULL COMMENT '1= lead 2 = customer',
  `date` date NULL DEFAULT NULL,
  `open_till` date NULL DEFAULT NULL,
  `currency` int(11) NULL DEFAULT NULL,
  `discount_type` int(11) NULL DEFAULT NULL,
  `allow_comment` tinyint(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `assigned` int(11) NULL DEFAULT NULL,
  `to` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `zip_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `total` decimal(10, 2) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `id_lead_customer` int(11) NULL DEFAULT NULL,
  `id_discount` int(11) NULL DEFAULT NULL,
  `discount_value` decimal(10, 2) NULL DEFAULT NULL,
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL,
  `id_tax` int(11) NULL DEFAULT NULL,
  `is_tax` tinyint(1) NULL DEFAULT NULL,
  `tax_amount` decimal(10, 2) NULL DEFAULT NULL,
  `sub_total` decimal(10, 2) NULL DEFAULT NULL,
  `grand_total` decimal(10, 2) NULL DEFAULT NULL,
  `id_project` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for proposal_data
-- ----------------------------
DROP TABLE IF EXISTS `proposal_data`;
CREATE TABLE `proposal_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_proposal` int(11) NULL DEFAULT NULL,
  `id_item` int(11) NULL DEFAULT NULL,
  `item_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `qty` int(11) NULL DEFAULT NULL,
  `rate` decimal(10, 2) NULL DEFAULT NULL,
  `discount_type` int(11) NULL DEFAULT NULL,
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of proposal_data
-- ----------------------------
INSERT INTO `proposal_data` VALUES (6, 3, 6, 'Premium Website (Professional)', '', 1, 2000.00, 1, 0.00, 2000.00);
INSERT INTO `proposal_data` VALUES (15, 1, 1, 'Premium Website (Standard)', '', 1, 1000.00, 1, 0.00, 1000.00);
INSERT INTO `proposal_data` VALUES (16, 1, 15, 'eO-BMS (Standard Package) ', 'A Business Management System is a set of tools for planning and implementing policies, practices, guidelines, processes and procedures that are used in the development, deployment and execution of business plans and strategies and all associated managemen', 1, 159.00, 1, 0.00, 159.00);
INSERT INTO `proposal_data` VALUES (17, 1, 16, 'eO-BMS (Premium Package)', 'A Business Management System is a set of tools for planning and implementing policies, practices, guidelines, processes and procedures that are used in the development, deployment and execution of business plans and strategies and all associated managemen', 1, 299.00, 1, 0.00, 299.00);
INSERT INTO `proposal_data` VALUES (18, 2, 1, 'Premium Website (Standard)', '', 1, 1000.00, 1, 0.00, 1000.00);
INSERT INTO `proposal_data` VALUES (19, 2, 1, 'Premium Website (Silver)', '-Maintenance  3 months-Website Speed 60 - 70', 1, 1000.00, 1, 0.00, 1000.00);
INSERT INTO `proposal_data` VALUES (20, 2, 17, 'Premium Website (Gold)', '-Maintenance 6 months-Website Speed 70 - 80', 1, 1500.00, 1, 0.00, 1500.00);
INSERT INTO `proposal_data` VALUES (21, 2, 6, 'Premium Website (Platinum)', '-Maintenance 9 months-Website Speed 80-90', 1, 2000.00, 1, 0.00, 2000.00);

-- ----------------------------
-- Table structure for proposal_note
-- ----------------------------
DROP TABLE IF EXISTS `proposal_note`;
CREATE TABLE `proposal_note`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_proposal` int(11) NULL DEFAULT NULL,
  `id_user` int(11) NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for proposal_related_to
-- ----------------------------
DROP TABLE IF EXISTS `proposal_related_to`;
CREATE TABLE `proposal_related_to`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` tinyint(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of proposal_related_to
-- ----------------------------
INSERT INTO `proposal_related_to` VALUES (1, 'Customer', 1);
INSERT INTO `proposal_related_to` VALUES (2, 'Lead', 1);

-- ----------------------------
-- Table structure for proposal_status
-- ----------------------------
DROP TABLE IF EXISTS `proposal_status`;
CREATE TABLE `proposal_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `css_class` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of proposal_status
-- ----------------------------
INSERT INTO `proposal_status` VALUES (1, 'Draft', 'label-default');
INSERT INTO `proposal_status` VALUES (2, 'Sent', 'label-success');
INSERT INTO `proposal_status` VALUES (3, 'Open', 'label-warning');
INSERT INTO `proposal_status` VALUES (4, 'Revised', 'label-info');
INSERT INTO `proposal_status` VALUES (5, 'Declined', 'label-danger');
INSERT INTO `proposal_status` VALUES (6, 'Accepted', 'label-purple');

-- ----------------------------
-- Table structure for quotation
-- ----------------------------
DROP TABLE IF EXISTS `quotation`;
CREATE TABLE `quotation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `id_customer` int(11) NULL DEFAULT NULL COMMENT '1= lead 2 = customer',
  `date` date NULL DEFAULT NULL,
  `open_till` date NULL DEFAULT NULL,
  `currency` int(11) NULL DEFAULT NULL,
  `discount_type` int(11) NULL DEFAULT NULL,
  `allow_comment` tinyint(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `assigned` int(11) NULL DEFAULT NULL,
  `to` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `zip_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `total` decimal(10, 2) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `id_discount` int(11) NULL DEFAULT NULL,
  `discount_value` decimal(10, 2) NULL DEFAULT NULL,
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL,
  `id_tax` int(11) NULL DEFAULT NULL,
  `is_tax` tinyint(1) NULL DEFAULT NULL,
  `tax_amount` decimal(10, 2) NULL DEFAULT NULL,
  `sub_total` decimal(10, 2) NULL DEFAULT NULL,
  `is_converted_from_proposal` tinyint(1) NULL DEFAULT NULL,
  `grand_total` decimal(10, 2) NULL DEFAULT NULL,
  `id_project` int(11) NULL DEFAULT NULL,
  `close_sale_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of quotation
-- ----------------------------
INSERT INTO `quotation` VALUES (1, NULL, 1, '2019-11-20', '2019-11-25', 1, NULL, 0, 2, 8, 'N/A', 'Svay Chek -Siem Reap', 'Siem Reap', 'Cambodia', '', 'sachikokojima@gmail.com', '', 'QUT19110001', 0.00, '2019-11-22 08:39:03', 21, NULL, NULL, 0, NULL, 0.00, 1, 0, 0.00, 0.00, NULL, 0.00, 1, NULL);

-- ----------------------------
-- Table structure for quotation_data
-- ----------------------------
DROP TABLE IF EXISTS `quotation_data`;
CREATE TABLE `quotation_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_quotation` int(11) NULL DEFAULT NULL,
  `id_item` int(11) NULL DEFAULT NULL,
  `item_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `qty` int(11) NULL DEFAULT NULL,
  `rate` decimal(10, 2) NULL DEFAULT NULL,
  `discount_type` int(11) NULL DEFAULT NULL,
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of quotation_data
-- ----------------------------
INSERT INTO `quotation_data` VALUES (4, 2, 15, 'eO-BMS (Standard Package) ', 'A Business Management System is a set of tools for planning and implementing policies, practices, guidelines, processes and procedures that are used in the development, deployment and execution of business plans and strategies and all associated managemen', 1, 159.00, 1, 0.00, 159.00);
INSERT INTO `quotation_data` VALUES (5, 3, 1, 'Premium Website (Silver)', '-Maintenance  3 months-Website Speed 60 - 70', 1, 1000.00, 1, 0.00, 1000.00);
INSERT INTO `quotation_data` VALUES (6, 3, 17, 'Premium Website (Gold)', '-Maintenance 6 months-Website Speed 70 - 80', 1, 1500.00, 1, 0.00, 1500.00);
INSERT INTO `quotation_data` VALUES (7, 3, 6, 'Premium Website (Platinum)', '-Maintenance 9 months-Website Speed 80-90', 1, 2000.00, 1, 0.00, 2000.00);
INSERT INTO `quotation_data` VALUES (10, 4, 15, 'eO-BMS (Standard Package) ', 'A Business Management System is a set of tools for planning and implementing policies, practices, guidelines, processes and procedures that are used in the development, deployment and execution of business plans and strategies and all associated managemen', 1, 159.00, 1, 0.00, 159.00);
INSERT INTO `quotation_data` VALUES (11, 1, NULL, '', '', 1, 0.00, 1, 0.00, 0.00);

-- ----------------------------
-- Table structure for quotation_status
-- ----------------------------
DROP TABLE IF EXISTS `quotation_status`;
CREATE TABLE `quotation_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `css_class` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of quotation_status
-- ----------------------------
INSERT INTO `quotation_status` VALUES (1, 'Draft', 'label-default');
INSERT INTO `quotation_status` VALUES (2, 'Sent', 'label-success');
INSERT INTO `quotation_status` VALUES (4, 'Expired', 'label-info');
INSERT INTO `quotation_status` VALUES (5, 'Declined', 'label-danger');
INSERT INTO `quotation_status` VALUES (6, 'Accepted', 'label-purple');

-- ----------------------------
-- Table structure for repeater_type
-- ----------------------------
DROP TABLE IF EXISTS `repeater_type`;
CREATE TABLE `repeater_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of repeater_type
-- ----------------------------
INSERT INTO `repeater_type` VALUES (1, 'None');
INSERT INTO `repeater_type` VALUES (2, 'Day');
INSERT INTO `repeater_type` VALUES (3, 'Week');
INSERT INTO `repeater_type` VALUES (4, '2 Weeks');
INSERT INTO `repeater_type` VALUES (5, '1 Month');
INSERT INTO `repeater_type` VALUES (6, '2 Months');
INSERT INTO `repeater_type` VALUES (7, '3 Months');
INSERT INTO `repeater_type` VALUES (8, '6 Months');
INSERT INTO `repeater_type` VALUES (9, '1 Year');

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES (1, 'Item other price lable', 'Extra Charge', '', 1, '', NULL, NULL, 21, '2019-10-11 11:55:55');

-- ----------------------------
-- Table structure for sop_goal_setup
-- ----------------------------
DROP TABLE IF EXISTS `sop_goal_setup`;
CREATE TABLE `sop_goal_setup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_position` int(11) NULL DEFAULT NULL,
  `id_employee` int(11) NULL DEFAULT NULL,
  `id_sop_step` int(11) NULL DEFAULT NULL,
  `id_sop_step_list` int(11) NULL DEFAULT NULL,
  `id_year` int(11) NULL DEFAULT NULL,
  `quarter_1` int(11) NULL DEFAULT NULL,
  `quarter_2` int(11) NULL DEFAULT NULL,
  `quarter_3` int(11) NULL DEFAULT NULL,
  `quarter_4` int(11) NULL DEFAULT NULL,
  `yearly` int(11) NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sop_goal_setup_data
-- ----------------------------
DROP TABLE IF EXISTS `sop_goal_setup_data`;
CREATE TABLE `sop_goal_setup_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sop_set_up` int(11) NULL DEFAULT NULL,
  `id_month` int(11) NULL DEFAULT NULL,
  `daily` int(11) NULL DEFAULT NULL,
  `weekly` int(11) NULL DEFAULT NULL,
  `monthly` int(11) NULL DEFAULT NULL,
  `actual_id_month` int(11) NULL DEFAULT NULL,
  `actual_monthly` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sop_set_up_assign_position
-- ----------------------------
DROP TABLE IF EXISTS `sop_set_up_assign_position`;
CREATE TABLE `sop_set_up_assign_position`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sop_set_up_id` int(11) NULL DEFAULT NULL,
  `id_position` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for source
-- ----------------------------
DROP TABLE IF EXISTS `source`;
CREATE TABLE `source`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of source
-- ----------------------------
INSERT INTO `source` VALUES (1, 'Facebook', NULL, NULL, NULL, NULL, 1);
INSERT INTO `source` VALUES (2, 'Google', NULL, NULL, NULL, NULL, 1);
INSERT INTO `source` VALUES (3, 'Market Research', NULL, NULL, NULL, NULL, 1);
INSERT INTO `source` VALUES (4, 'Other', NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for standard_operation
-- ----------------------------
DROP TABLE IF EXISTS `standard_operation`;
CREATE TABLE `standard_operation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assign_to` int(11) NULL DEFAULT NULL,
  `id_employee_possition` int(11) NULL DEFAULT NULL,
  `id_standard_operation_step` int(11) NULL DEFAULT NULL,
  `id_task` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` datetime(0) NULL DEFAULT NULL,
  `task_status` int(1) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `due_date` date NULL DEFAULT NULL,
  `deadline` date NULL DEFAULT NULL,
  `id_priority` int(11) NULL DEFAULT NULL,
  `id_related_to` int(11) NULL DEFAULT NULL,
  `id_related_profile` int(11) NULL DEFAULT NULL,
  `id_employee_position` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for standard_operation_check_list
-- ----------------------------
DROP TABLE IF EXISTS `standard_operation_check_list`;
CREATE TABLE `standard_operation_check_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assign_to` int(11) NULL DEFAULT NULL,
  `id_standard_operation` int(11) NULL DEFAULT NULL,
  `id_standard_operation_step` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` datetime(0) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `is_done` int(1) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `id_standard_operation_step_list` int(11) NULL DEFAULT NULL,
  `done_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of standard_operation_check_list
-- ----------------------------
INSERT INTO `standard_operation_check_list` VALUES (1, NULL, NULL, 3, NULL, '2019-11-23 09:53:03', 21, NULL, NULL, 1, 0, 'excavation', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (2, NULL, NULL, 3, NULL, '2019-11-23 09:53:03', 21, NULL, NULL, 1, 0, 'soil excavation', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (3, NULL, NULL, 3, NULL, '2019-11-23 10:23:46', 21, NULL, NULL, 1, 0, 'excavation', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (4, NULL, NULL, 3, NULL, '2019-11-23 10:23:46', 21, NULL, NULL, 1, 0, 'soil excavation', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (5, NULL, NULL, 2, NULL, '2019-11-23 10:24:28', 21, NULL, NULL, 1, 0, 'Site Preparation', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (6, NULL, NULL, 2, NULL, '2019-11-23 10:24:28', 21, NULL, NULL, 1, 0, 'Cleaning', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (7, NULL, NULL, 2, NULL, '2019-11-23 10:24:28', 21, NULL, NULL, 1, 0, 'Electricty', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (8, NULL, NULL, 2, NULL, '2019-11-23 10:28:32', 21, NULL, NULL, 1, 0, 'Earth Works', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (9, NULL, NULL, 2, NULL, '2019-11-23 10:28:32', 21, NULL, NULL, 1, 0, 'Excavator ', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (10, NULL, NULL, 2, NULL, '2019-11-23 10:28:32', 21, NULL, NULL, 1, 0, 'Soil Excavator', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (11, NULL, NULL, 2, NULL, '2019-11-23 10:28:32', 21, NULL, NULL, 1, 0, 'Concrete in substructure', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (12, NULL, NULL, 2, NULL, '2019-11-23 10:28:32', 21, NULL, NULL, 1, 0, 'Concrete work for footing', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (13, NULL, NULL, 2, NULL, '2019-11-23 10:28:32', 21, NULL, NULL, 1, 0, 'Compact stone under footing', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (14, NULL, NULL, 3, NULL, '2019-11-23 10:32:36', 21, NULL, NULL, 1, 0, 'Concrete column', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (15, NULL, NULL, 3, NULL, '2019-11-23 10:32:36', 21, NULL, NULL, 1, 0, 'Concrete in superstructure ', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (16, NULL, NULL, 3, NULL, '2019-11-23 10:32:36', 21, NULL, NULL, 1, 0, 'Concrete work ground beam', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (17, NULL, NULL, 3, NULL, '2019-11-23 10:32:36', 21, NULL, NULL, 1, 0, 'Concrete ground beam', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (18, NULL, NULL, 3, NULL, '2019-11-23 10:32:36', 21, NULL, NULL, 1, 0, 'Hollow Brick Thickness 200 mm', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (19, NULL, NULL, 3, NULL, '2019-11-23 10:32:36', 21, NULL, NULL, 1, 0, 'Under ground beam', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (20, NULL, NULL, 3, NULL, '2019-11-23 10:32:36', 21, NULL, NULL, 1, 0, 'Concrete Column in ground floor', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (21, NULL, NULL, 3, NULL, '2019-11-23 10:32:36', 21, NULL, NULL, 1, 0, 'Concrete Column', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (22, NULL, NULL, 3, NULL, '2019-11-23 10:32:36', 21, NULL, NULL, 1, 0, 'Concrete for roof beam', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (23, NULL, NULL, 3, NULL, '2019-11-23 10:32:36', 21, NULL, NULL, 1, 0, 'Concrete beam', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (24, NULL, NULL, 3, NULL, '2019-11-23 10:32:36', 21, NULL, NULL, 1, 0, 'Concrete Lintel', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (25, NULL, NULL, 3, NULL, '2019-11-23 10:32:36', 21, NULL, NULL, 1, 0, 'Concrete', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (26, NULL, NULL, 2, NULL, '2019-11-23 10:38:27', 21, NULL, NULL, 1, 0, 'Site Preparation (Cleaning, electricity)', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (27, NULL, NULL, 4, NULL, '2019-11-23 10:39:08', 21, NULL, NULL, 1, 0, 'Exavation', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (28, NULL, NULL, 4, NULL, '2019-11-23 10:39:08', 21, NULL, NULL, 1, 0, 'Soil Vexation ', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (29, NULL, NULL, 6, NULL, '2019-11-23 11:12:46', 21, NULL, NULL, 1, 0, 'Tiling , skirting works', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (30, NULL, NULL, 6, NULL, '2019-11-23 11:12:46', 21, NULL, NULL, 1, 0, 'Ground floor Tiling', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (31, NULL, NULL, 6, NULL, '2019-11-23 11:12:46', 21, NULL, NULL, 1, 0, 'Floor tile for ground floor', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (32, NULL, NULL, 6, NULL, '2019-11-23 11:12:46', 21, NULL, NULL, 1, 0, 'Bathroom Floor Tile for Ground Floor', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (33, NULL, NULL, 6, NULL, '2019-11-23 11:12:46', 21, NULL, NULL, 1, 0, 'Bathroom Wall tile for Ground Floor(H=1.20m)', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (34, NULL, NULL, 6, NULL, '2019-11-23 11:12:46', 21, NULL, NULL, 1, 0, 'Bathroom Wall Tile for Ground Floor(H=2.2m)', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (35, NULL, NULL, 11, NULL, '2019-11-23 11:42:38', 21, NULL, NULL, 1, 0, '60x120cm/W60(Frame W60xH120cm)', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (36, NULL, NULL, 11, NULL, '2019-11-23 11:42:38', 21, NULL, NULL, 1, 0, 'Glass Block', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (37, NULL, NULL, 11, NULL, '2019-11-23 11:42:38', 21, NULL, NULL, 1, 0, 'Ventilation Block', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (38, NULL, NULL, 3, NULL, '2019-11-25 12:31:42', 21, NULL, NULL, 1, 0, 'Concrete column', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (39, NULL, NULL, 3, NULL, '2019-11-25 12:31:42', 21, NULL, NULL, 1, 0, 'Concrete in superstructure ', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (40, NULL, NULL, 3, NULL, '2019-11-25 12:31:42', 21, NULL, NULL, 1, 0, 'Concrete work ground beam', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (41, NULL, NULL, 3, NULL, '2019-11-25 12:31:42', 21, NULL, NULL, 1, 0, 'Concrete ground beam', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (42, NULL, NULL, 3, NULL, '2019-11-25 12:31:42', 21, NULL, NULL, 1, 0, 'Hollow Brick Thickness 200 mm', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (43, NULL, NULL, 3, NULL, '2019-11-25 12:31:42', 21, NULL, NULL, 1, 0, 'Under ground beam', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (44, NULL, NULL, 3, NULL, '2019-11-25 12:31:42', 21, NULL, NULL, 1, 0, 'Concrete Column in ground floor', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (45, NULL, NULL, 3, NULL, '2019-11-25 12:31:42', 21, NULL, NULL, 1, 0, 'Concrete Column', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (46, NULL, NULL, 3, NULL, '2019-11-25 12:31:42', 21, NULL, NULL, 1, 0, 'Concrete for roof beam', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (47, NULL, NULL, 3, NULL, '2019-11-25 12:31:42', 21, NULL, NULL, 1, 0, 'Concrete beam', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (48, NULL, NULL, 3, NULL, '2019-11-25 12:31:42', 21, NULL, NULL, 1, 0, 'Concrete Lintel', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (49, NULL, NULL, 3, NULL, '2019-11-25 12:31:42', 21, NULL, NULL, 1, 0, 'Concrete', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (50, NULL, NULL, 4, NULL, '2019-11-25 12:31:49', 21, NULL, NULL, 1, 0, 'Exavation', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (51, NULL, NULL, 4, NULL, '2019-11-25 12:31:49', 21, NULL, NULL, 1, 0, 'Soil Vexation ', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (52, NULL, NULL, 6, NULL, '2019-11-25 12:31:57', 21, NULL, NULL, 1, 0, 'Tiling , skirting works', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (53, NULL, NULL, 6, NULL, '2019-11-25 12:31:57', 21, NULL, NULL, 1, 0, 'Ground floor Tiling', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (54, NULL, NULL, 6, NULL, '2019-11-25 12:31:57', 21, NULL, NULL, 1, 0, 'Floor tile for ground floor', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (55, NULL, NULL, 6, NULL, '2019-11-25 12:31:57', 21, NULL, NULL, 1, 0, 'Bathroom Floor Tile for Ground Floor', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (56, NULL, NULL, 6, NULL, '2019-11-25 12:31:57', 21, NULL, NULL, 1, 0, 'Bathroom Wall tile for Ground Floor(H=1.20m)', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (57, NULL, NULL, 6, NULL, '2019-11-25 12:31:57', 21, NULL, NULL, 1, 0, 'Bathroom Wall Tile for Ground Floor(H=2.2m)', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (58, NULL, NULL, 2, NULL, '2019-11-25 12:32:07', 21, NULL, NULL, 1, 0, 'Site Preparation (Cleaning, electricity)', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (59, NULL, NULL, 5, NULL, '2019-11-25 12:32:15', 21, NULL, NULL, 1, 0, 'Brick Wall ground floor', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (60, NULL, NULL, 5, NULL, '2019-11-25 12:32:15', 21, NULL, NULL, 1, 0, 'Hollow Brick Thickness200mm under Ground Beam', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (61, NULL, NULL, 5, NULL, '2019-11-25 12:32:15', 21, NULL, NULL, 1, 0, 'Hollow clay brick wall 200mm thick', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (62, NULL, NULL, 5, NULL, '2019-11-25 12:32:15', 21, NULL, NULL, 1, 0, 'Hollow clay brick wall 100mm thick', NULL, NULL);
INSERT INTO `standard_operation_check_list` VALUES (63, NULL, NULL, 5, NULL, '2019-11-25 12:32:15', 21, NULL, NULL, 1, 0, 'Plastering brick wall', NULL, NULL);

-- ----------------------------
-- Table structure for standard_operation_member
-- ----------------------------
DROP TABLE IF EXISTS `standard_operation_member`;
CREATE TABLE `standard_operation_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_standard_operation` int(11) NULL DEFAULT NULL,
  `id_position` int(11) NULL DEFAULT NULL,
  `id_employee` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of standard_operation_member
-- ----------------------------
INSERT INTO `standard_operation_member` VALUES (1, 1, NULL, 2);
INSERT INTO `standard_operation_member` VALUES (2, 19, NULL, 2);
INSERT INTO `standard_operation_member` VALUES (10, 7, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (11, 306, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (16, 8, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (21, 10, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (22, 311, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (28, 317, NULL, 16);
INSERT INTO `standard_operation_member` VALUES (29, 327, NULL, 16);
INSERT INTO `standard_operation_member` VALUES (31, 13, NULL, 16);
INSERT INTO `standard_operation_member` VALUES (32, 326, NULL, 16);
INSERT INTO `standard_operation_member` VALUES (37, 340, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (38, 339, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (40, 337, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (41, 336, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (42, 334, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (43, 325, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (44, 310, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (45, 324, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (46, 312, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (47, 313, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (48, 314, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (49, 316, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (50, 319, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (51, 320, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (52, 322, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (53, 323, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (54, 272, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (55, 276, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (56, 279, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (57, 289, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (59, 298, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (60, 299, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (61, 307, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (62, 228, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (64, 68, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (67, 333, NULL, 1);
INSERT INTO `standard_operation_member` VALUES (72, 342, NULL, 7);
INSERT INTO `standard_operation_member` VALUES (74, 9, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (75, 341, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (76, 343, NULL, 17);
INSERT INTO `standard_operation_member` VALUES (77, 344, NULL, 17);
INSERT INTO `standard_operation_member` VALUES (78, 284, NULL, 4);
INSERT INTO `standard_operation_member` VALUES (79, 309, NULL, 5);
INSERT INTO `standard_operation_member` VALUES (80, 347, NULL, 7);
INSERT INTO `standard_operation_member` VALUES (81, 332, NULL, 10);
INSERT INTO `standard_operation_member` VALUES (83, 285, NULL, 4);
INSERT INTO `standard_operation_member` VALUES (85, 348, NULL, 22);
INSERT INTO `standard_operation_member` VALUES (86, 356, NULL, 22);
INSERT INTO `standard_operation_member` VALUES (87, 358, NULL, 10);
INSERT INTO `standard_operation_member` VALUES (88, 357, NULL, 22);
INSERT INTO `standard_operation_member` VALUES (90, 219, NULL, 17);
INSERT INTO `standard_operation_member` VALUES (91, 363, NULL, 22);
INSERT INTO `standard_operation_member` VALUES (92, 355, NULL, 22);
INSERT INTO `standard_operation_member` VALUES (93, 143, NULL, 1);

-- ----------------------------
-- Table structure for standard_operation_procedure_article
-- ----------------------------
DROP TABLE IF EXISTS `standard_operation_procedure_article`;
CREATE TABLE `standard_operation_procedure_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_standard_operation_procedure_set_up` int(11) NULL DEFAULT NULL,
  `id_position` int(11) NULL DEFAULT NULL,
  `short_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` int(1) NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` date NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for standard_operation_procedure_set_up
-- ----------------------------
DROP TABLE IF EXISTS `standard_operation_procedure_set_up`;
CREATE TABLE `standard_operation_procedure_set_up`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` date NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for standard_operation_step
-- ----------------------------
DROP TABLE IF EXISTS `standard_operation_step`;
CREATE TABLE `standard_operation_step`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_employee_possition` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` datetime(0) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `css` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `id_employee_position` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for standard_operation_step_list
-- ----------------------------
DROP TABLE IF EXISTS `standard_operation_step_list`;
CREATE TABLE `standard_operation_step_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_standard_operation_step` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` datetime(0) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `is_track` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for supplier_department
-- ----------------------------
DROP TABLE IF EXISTS `supplier_department`;
CREATE TABLE `supplier_department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of supplier_department
-- ----------------------------
INSERT INTO `supplier_department` VALUES (1, 'Opeartion', 1, '2019-10-22 08:49:13', 1, NULL, NULL);

-- ----------------------------
-- Table structure for supplier_position
-- ----------------------------
DROP TABLE IF EXISTS `supplier_position`;
CREATE TABLE `supplier_position`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of supplier_position
-- ----------------------------
INSERT INTO `supplier_position` VALUES (1, 1, 'Driver', 1, '2019-10-22 08:53:16', 1, NULL, NULL);

-- ----------------------------
-- Table structure for supplier_profile
-- ----------------------------
DROP TABLE IF EXISTS `supplier_profile`;
CREATE TABLE `supplier_profile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_supplier_profile_type` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `supplier_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_city` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for supplier_profile_contact
-- ----------------------------
DROP TABLE IF EXISTS `supplier_profile_contact`;
CREATE TABLE `supplier_profile_contact`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NULL DEFAULT NULL,
  `prefix` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_of_birth` date NULL DEFAULT NULL,
  `gender_id` tinyint(1) NULL DEFAULT NULL,
  `position_id` int(11) NULL DEFAULT NULL,
  `department_id` int(11) NULL DEFAULT NULL,
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `credit_note` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_transport`(`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of supplier_profile_contact
-- ----------------------------
INSERT INTO `supplier_profile_contact` VALUES (1, 1, 'Mr.', 'Komsot Sne', NULL, 1, 1, 1, '', '0', '', '', 1, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for supplier_profile_tag
-- ----------------------------
DROP TABLE IF EXISTS `supplier_profile_tag`;
CREATE TABLE `supplier_profile_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_supplier` int(11) NULL DEFAULT NULL,
  `id_tag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for supplier_profile_type
-- ----------------------------
DROP TABLE IF EXISTS `supplier_profile_type`;
CREATE TABLE `supplier_profile_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for system_setting
-- ----------------------------
DROP TABLE IF EXISTS `system_setting`;
CREATE TABLE `system_setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of system_setting
-- ----------------------------
INSERT INTO `system_setting` VALUES (1, 1, '1 => EOT, 2 => EOH, 3 => Other');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_billing_type` int(11) NULL DEFAULT NULL,
  `rate` decimal(10, 2) NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `due_date` date NULL DEFAULT NULL,
  `deadline` date NULL DEFAULT NULL,
  `id_priority` int(11) NULL DEFAULT NULL,
  `id_repeater` int(11) NULL DEFAULT NULL,
  `id_related_to` int(11) NULL DEFAULT NULL,
  `id_related_profile` int(11) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `id_assign_type` tinyint(1) NULL DEFAULT NULL,
  `is_related_kpi` tinyint(4) NULL DEFAULT NULL,
  `kpi_status` tinyint(4) NULL DEFAULT NULL,
  `id_employee_position` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (2, 'General works', NULL, NULL, '2019-10-18', NULL, '2019-11-21', 2, NULL, 3, 1, '', 3, 21, '2019-11-25 12:32:07', 21, '2019-11-23 09:49:15', 1, NULL, NULL, 19);
INSERT INTO `task` VALUES (3, 'Concrete works for stub column', NULL, NULL, '2019-10-18', NULL, NULL, 1, NULL, 3, 1, '', 3, 21, '2019-11-25 12:31:42', 21, '2019-11-23 09:52:36', 1, NULL, NULL, 19);
INSERT INTO `task` VALUES (4, 'Earth Work', NULL, NULL, '2019-10-18', NULL, NULL, 2, NULL, 3, 1, '', 3, 21, '2019-11-25 12:31:49', 21, '2019-11-23 10:23:23', 1, NULL, NULL, 19);
INSERT INTO `task` VALUES (5, 'Masony works and Plastering', NULL, NULL, '2019-10-18', NULL, NULL, 2, NULL, 3, 1, '', 3, 21, '2019-11-25 12:32:15', 21, '2019-11-23 11:01:34', 1, NULL, NULL, 1);
INSERT INTO `task` VALUES (6, 'Fishing works Tilling, Skirting works', NULL, NULL, '2019-10-18', NULL, NULL, 2, NULL, 3, 1, '', 3, 21, '2019-11-25 12:31:57', 21, '2019-11-23 11:07:59', 1, NULL, NULL, 1);
INSERT INTO `task` VALUES (7, 'Sanitary Material', NULL, NULL, '2019-10-18', NULL, NULL, 2, NULL, 3, 1, '', 3, NULL, NULL, 21, '2019-11-23 11:16:58', 1, NULL, NULL, 1);
INSERT INTO `task` VALUES (8, 'Painting work', NULL, NULL, '2019-10-18', NULL, NULL, 1, NULL, 3, 1, '', 3, NULL, NULL, 21, '2019-11-23 11:31:35', 1, NULL, NULL, 1);
INSERT INTO `task` VALUES (9, 'Ceiling work', NULL, NULL, '2019-10-18', NULL, NULL, 1, NULL, 3, 1, '', 3, NULL, NULL, 21, '2019-11-23 11:33:45', 1, NULL, NULL, 1);
INSERT INTO `task` VALUES (10, 'Wood Floor with wooden frame', NULL, NULL, '2019-10-18', NULL, NULL, 2, NULL, 3, 1, '', 3, NULL, NULL, 21, '2019-11-23 11:34:57', 1, NULL, NULL, 1);
INSERT INTO `task` VALUES (11, 'Glass Window Glass Block and Ventilation Block', NULL, NULL, '2019-10-18', NULL, NULL, 1, NULL, 3, 1, '', 3, 21, '2019-11-23 11:42:38', 21, '2019-11-23 11:41:38', 1, NULL, NULL, 1);
INSERT INTO `task` VALUES (12, 'Handrail', NULL, NULL, '2019-10-18', NULL, NULL, 2, NULL, 3, 1, '', 3, NULL, NULL, 21, '2019-11-23 11:44:14', 1, NULL, NULL, 1);
INSERT INTO `task` VALUES (13, 'Roof Tile', NULL, NULL, '2019-10-18', NULL, NULL, 2, NULL, 3, 1, '', 3, NULL, NULL, 21, '2019-11-23 11:47:36', 1, NULL, NULL, 1);

-- ----------------------------
-- Table structure for task_check_list
-- ----------------------------
DROP TABLE IF EXISTS `task_check_list`;
CREATE TABLE `task_check_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_task` int(11) NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of task_check_list
-- ----------------------------
INSERT INTO `task_check_list` VALUES (52, 7, 'Cotto/Cotto water closet', '8:00 AM', '5:00 PM', 0);
INSERT INTO `task_check_list` VALUES (53, 7, 'Cotto/Cotto Basin', '8:00 AM', '5:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (54, 7, 'Shower', '8:00 AM', '5:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (55, 7, 'Dish Wash basin', '8:00 AM', '5:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (56, 8, 'Ground Floor Painting Work', '8:00 AM', '5:00 PM', 0);
INSERT INTO `task_check_list` VALUES (57, 8, 'Wall Painting inside ', '8:00 AM', '5:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (58, 8, 'Wall Painting outside', '7:00 AM', '5:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (59, 9, 'Ground Floor Ceilling ', '8:00 AM', '5:00 PM', 0);
INSERT INTO `task_check_list` VALUES (60, 9, 'Ceilling area inside only', '8:00 AM', '5:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (61, 9, 'Door and windows works', '8:00 AM', '5:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (62, 10, 'D90(Frame 90x220cm) Room Door', '8:00 AM', '5:00 PM', 0);
INSERT INTO `task_check_list` VALUES (63, 10, 'D80(Frame80x220cm) WC Door', '8:00 AM', '5:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (66, 11, '60x120cm/W60(Frame W60xH120cm)', '8:00 AM', '5:00 PM', 0);
INSERT INTO `task_check_list` VALUES (67, 11, 'Glass Block', '8:00 AM', '5:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (68, 11, 'Ventilation Block', '8:00 AM', '5:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (69, 12, 'Handrail for Staircase', '8:00 AM', '5:00 PM', 0);
INSERT INTO `task_check_list` VALUES (70, 13, 'Mechanical Electrical and Plumping Material', '8:00 AM', '5:00 PM', 0);
INSERT INTO `task_check_list` VALUES (71, 3, 'Concrete column', '8:00 AM', '11:00 AM', 0);
INSERT INTO `task_check_list` VALUES (72, 3, 'Concrete in superstructure ', '11:00 AM', '3:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (73, 3, 'Concrete work ground beam', '11:00 AM', '3:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (74, 3, 'Concrete ground beam', '11:00 AM', '3:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (75, 3, 'Hollow Brick Thickness 200 mm', '11:00 AM', '3:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (76, 3, 'Under ground beam', '11:00 AM', '3:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (77, 3, 'Concrete Column in ground floor', '11:00 AM', '3:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (78, 3, 'Concrete Column', '11:00 AM', '3:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (79, 3, 'Concrete for roof beam', '11:00 AM', '3:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (80, 3, 'Concrete beam', '11:00 AM', '3:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (81, 3, 'Concrete Lintel', '11:00 AM', '3:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (82, 3, 'Concrete', '11:00 AM', '3:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (83, 4, 'Exavation', '8:00 AM', '5:00 PM', 0);
INSERT INTO `task_check_list` VALUES (84, 4, 'Soil Vexation ', '8:00 AM', '5:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (85, 6, 'Tiling , skirting works', '8:00 AM', '5:00 PM', 0);
INSERT INTO `task_check_list` VALUES (86, 6, 'Ground floor Tiling', '8:00 AM', '5:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (87, 6, 'Floor tile for ground floor', '8:00 AM', '5:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (88, 6, 'Bathroom Floor Tile for Ground Floor', '8:00 AM', '5:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (89, 6, 'Bathroom Wall tile for Ground Floor(H=1.20m)', '8:00 AM', '5:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (90, 6, 'Bathroom Wall Tile for Ground Floor(H=2.2m)', '8:00 AM', '5:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (91, 2, 'Site Preparation (Cleaning, electricity)', '8:00 AM', '5:00 PM', 0);
INSERT INTO `task_check_list` VALUES (92, 5, 'Brick Wall ground floor', '8:00 AM', '5:00 PM', 0);
INSERT INTO `task_check_list` VALUES (93, 5, 'Hollow Brick Thickness200mm under Ground Beam', '8:00 AM', '5:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (94, 5, 'Hollow clay brick wall 200mm thick', '8:00 AM', '5:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (95, 5, 'Hollow clay brick wall 100mm thick', '8:00 AM', '5:00 PM', NULL);
INSERT INTO `task_check_list` VALUES (96, 5, 'Plastering brick wall', '8:00 AM', '5:00 PM', NULL);

-- ----------------------------
-- Table structure for task_member
-- ----------------------------
DROP TABLE IF EXISTS `task_member`;
CREATE TABLE `task_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_task` int(11) NULL DEFAULT NULL,
  `id_employee` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of task_member
-- ----------------------------
INSERT INTO `task_member` VALUES (2, 8, 12);

-- ----------------------------
-- Table structure for task_related_to
-- ----------------------------
DROP TABLE IF EXISTS `task_related_to`;
CREATE TABLE `task_related_to`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of task_related_to
-- ----------------------------
INSERT INTO `task_related_to` VALUES (1, 'Project');
INSERT INTO `task_related_to` VALUES (2, 'Invoice');
INSERT INTO `task_related_to` VALUES (3, 'Customer');
INSERT INTO `task_related_to` VALUES (4, 'Expense');
INSERT INTO `task_related_to` VALUES (5, 'Contract');
INSERT INTO `task_related_to` VALUES (6, 'Lead');
INSERT INTO `task_related_to` VALUES (7, 'Proposal');
INSERT INTO `task_related_to` VALUES (8, 'Other activity');

-- ----------------------------
-- Table structure for task_status
-- ----------------------------
DROP TABLE IF EXISTS `task_status`;
CREATE TABLE `task_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `css_class` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of task_status
-- ----------------------------
INSERT INTO `task_status` VALUES (1, 'Not Started', 'label-mint');
INSERT INTO `task_status` VALUES (2, 'In Progress', 'label-success');
INSERT INTO `task_status` VALUES (3, 'Testing', 'label-warning');
INSERT INTO `task_status` VALUES (4, 'Awaiting Feedback', 'label-danger');
INSERT INTO `task_status` VALUES (5, 'Complete', 'label-info');

-- ----------------------------
-- Table structure for task_tag
-- ----------------------------
DROP TABLE IF EXISTS `task_tag`;
CREATE TABLE `task_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_task` int(11) NULL DEFAULT NULL,
  `id_tag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tax
-- ----------------------------
DROP TABLE IF EXISTS `tax`;
CREATE TABLE `tax`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tax
-- ----------------------------
INSERT INTO `tax` VALUES (1, 'VAT', 5.00);

-- ----------------------------
-- Table structure for testing
-- ----------------------------
DROP TABLE IF EXISTS `testing`;
CREATE TABLE `testing`  (
  `id` int(11) NOT NULL,
  `Testing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of testing
-- ----------------------------
INSERT INTO `testing` VALUES (1, '23234', b'0');

-- ----------------------------
-- Table structure for uploaded_file
-- ----------------------------
DROP TABLE IF EXISTS `uploaded_file`;
CREATE TABLE `uploaded_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `filename` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `size` int(11) NULL DEFAULT NULL,
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `thumbnail` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 175 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uploaded_file
-- ----------------------------
INSERT INTO `uploaded_file` VALUES (1, 'NoPicAvailable.jpg', '/backend/uploads/NoPicAvailable.jpg', 65927, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (2, '60972540_846849689006961_3545995067674066944_n.jpg', 'backend/uploads/users/05/555b4ba7fd1258aa34320e3686ab20_60972540_846849689006961_3545995067674066944_n.jpg', 76838, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (3, 'unnamed.jpg', '/Applications/XAMPP/xamppfiles/htdocs/cataMMS/backend/web/backend/uploads/membership-profile/8b/f617810497fffa1b9e26a9dd8797e6_unnamed.jpg', 13553, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (4, 'photo_2019-07-03_16-12-55.jpg', 'backend/uploads/event-list/97/8f546546017eb68282e1b102b547f1_photo_2019-07-03_16-12-55.jpg', 225798, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (5, '60750510_846852822339981_7589377846787702784_n.jpg', 'backend/uploads/users/5d/6766a33e3a850d58d8b3502121a5bf_60750510_846852822339981_7589377846787702784_n.jpg', 30998, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (6, 'B_Profile.jpg', 'backend/uploads/users/c7/9c52f602886ba5c36aea0c4e5517e6_B_Profile.jpg', 130576, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (7, 'have-no-profile-picture-facebook-11.jpg', 'backend/uploads/users/37/eb0bcba3517ddfdd6487849d284166_have-no-profile-picture-facebook-11.jpg', 30666, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (8, 'file.jpg', '/Applications/XAMPP/xamppfiles/htdocs/cataMMS/backend/web/backend/uploads/membership-profile/ad/84d16c39b063c55bf65e8fd83cb1be_file.jpg', 133712, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (10, '65372280_425946121583765_6722478276213735424_n.jpg', '/Applications/XAMPP/xamppfiles/htdocs/cataMMS/backend/web/backend/uploads/membership-profile/5c/f2ed742a017d12c187fa4854489d5d_65372280_425946121583765_6722478276213735424_n.jpg', 74886, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (13, '64928238_1098443577031984_1099220682396401664_o.jpg', '/Applications/XAMPP/xamppfiles/htdocs/cataMMS/backend/web/backend/uploads/membership-profile/68/608b678dbb21dba4ac1477f1d191c9_64928238_1098443577031984_1099220682396401664_o.jpg', 89372, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (14, '65314999_2334304963451496_5645665237064482816_n.jpg', '/Applications/XAMPP/xamppfiles/htdocs/cataMMS/backend/web/backend/uploads/membership-profile/d4/aaf91d6807c4d39d003f1bb4f99e57_65314999_2334304963451496_5645665237064482816_n.jpg', 49284, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (15, '65372280_425946121583765_6722478276213735424_n.jpg', '/Applications/XAMPP/xamppfiles/htdocs/cataMMS/backend/web/backend/uploads/membership-profile/c1/5d34255dfb83a318e897094929e7bf_65372280_425946121583765_6722478276213735424_n.jpg', 74886, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (16, '64928238_1098443577031984_1099220682396401664_o.jpg', '/Applications/XAMPP/xamppfiles/htdocs/cataMMS/backend/web/backend/uploads/membership-profile/fa/4af65178a48dc3ac6809deca53964a_64928238_1098443577031984_1099220682396401664_o.jpg', 89372, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (17, '65372280_425946121583765_6722478276213735424_n.jpg', 'backend/uploads/users/6c/6d26d691e6a1b9aee2f6b89bbdce0a_65372280_425946121583765_6722478276213735424_n.jpg', 74886, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (18, '65314999_2334304963451496_5645665237064482816_n.jpg', 'backend/uploads/users/0c/a4899277b2303f14b4d8887c2c1eaa_65314999_2334304963451496_5645665237064482816_n.jpg', 49284, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (19, '65372280_425946121583765_6722478276213735424_n.jpg', '/Applications/XAMPP/xamppfiles/htdocs/cataMMS/backend/web/backend/uploads/users/5d/c0443cbfc55398c593302e30d08563_65372280_425946121583765_6722478276213735424_n.jpg', 74886, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (20, 'comple.png', 'backend/uploads/users/fc/a4d1c2a20d1983172a336362972c81_comple.png', 355615, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (21, 'evan.png', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/employee-profile/46/0df142f1c8925ae900e0fab2b09f93_evan.png', 213820, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (22, 'logo transparent.png', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/company-profile/09/19e6e56406ac6dc57bd9f8b21c4c9b_logo transparent.png', 45796, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (23, 'Screen Shot 2019-07-25 at 10.22.02 AM.png', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/supplier-profile/f4/da5c0e81f7c91f4a6ebd407b0e753e_Screen Shot 2019-07-25 at 10.22.02 AM.png', 798665, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (24, 'logo_makro.png', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/supplier-profile/3d/80ca2d3ed023d74aa2b9ca019f92f2_logo_makro.png', 10132, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (25, 'DWfoXv3UMAEo7Kj.jpg', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/expense-attachment/39/7403dc6c9473eadd42325037fbcd32_DWfoXv3UMAEo7Kj.jpg', 113405, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (26, '2019-07-22 14.51.33.jpg', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/employee-profile/a0/1401866964196853ecc3bc5cc4a5e7_2019-07-22 14.51.33.jpg', 206079, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (27, '3feea1b3-2149-4103-a10e-95e7da8ac7eb.jpg', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/employee-profile/89/b55e3eb71ccc4e07994e8d3d1c7e8c_3feea1b3-2149-4103-a10e-95e7da8ac7eb.jpg', 31008, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (28, '2019-07-22 14.51.33.jpg', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/employee-profile/2c/78f5722b135940cf7dc593aeb8280d_2019-07-22 14.51.33.jpg', 206079, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (29, 'earth.png', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/employee-profile/f6/9a3e3e5cead7c46bf848651e203080_earth.png', 1304, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (30, 'd.jpg', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/employee-profile/c2/8369ed0b24ffca97ba4c069eeefc1e_d.jpg', 162827, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (31, 'mockup4.png', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/supplier-profile/95/eeaf5d9b370b0e8c2765a4d0718449_mockup4.png', 689976, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (32, 'tick.png', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/supplier-profile/90/d47810f55f37c4f936236a36fc7684_tick.png', 34089, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (33, '681275_button_512x512-15670463985d673afec64a6017665030.png', '/var/app/current/backend/web/backend/uploads/supplier-profile/d7/b019f784c917efd90d957fc9c096ff_681275_button_512x512-15670463985d673afec64a6017665030.png', 9728, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (34, 'custom-business-cards-380g-skin-black-visit-card-and-can-custom-', '/var/app/current/backend/web/backend/uploads/employee-profile/48/227a4ff956eef6e164f90c2e0521d9_custom-business-cards-380g-skin-black-visit-card-and-can-custom-post-card.jpg', 284610, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (35, 'gie5GeReT.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/05/f47aa00d1bc60d48b9c0b8824116ab_gie5GeReT.jpg', 5731, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (36, 'd.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/a1/9f60d92e1c4fba982d7dfb7fd0c3aa_d.jpg', 162827, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (37, 'd.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/bb/895f5c68e65a87b120715f6abbc77c_d.jpg', 162827, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (38, 'gie5GeReT.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/68/989a9bbb3acc42381f747d51b48b8b_gie5GeReT.jpg', 5731, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (39, '64928238_1098443577031984_1099220682396401664_o.jpg', '/var/app/current/backend/web/backend/uploads/supplier-profile/07/d6fdbf147bc0bc42e8d45ef73ac350_64928238_1098443577031984_1099220682396401664_o.jpg', 89372, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (40, 'custom-business-cards-380g-skin-black-visit-card-and-can-custom-', '/var/app/current/backend/web/backend/uploads/employee-profile/ba/4b6d8c418d4d09485cfe2d4e12b1db_custom-business-cards-380g-skin-black-visit-card-and-can-custom-post-card.jpg', 284610, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (41, 'custom-business-cards-380g-skin-black-visit-card-and-can-custom-', '/var/app/current/backend/web/backend/uploads/employee-profile/b0/a0771d1dae36ef39bb8c477a52914f_custom-business-cards-380g-skin-black-visit-card-and-can-custom-post-card.jpg', 284610, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (42, 'eo-frame.png', '/var/app/current/backend/web/backend/uploads/employee-profile/17/1e29f2c6428e37a74e24f65a8c45bc_eo-frame.png', 97862, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (43, 'maco.png', '/var/app/current/backend/web/backend/uploads/employee-profile/85/261fa728c56139bf72453befb2b00f_maco.png', 148933, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (44, '_MG_5356.png', '/var/app/current/backend/web/backend/uploads/employee-profile/87/6f6f61c04ed8b5d79c6dd6052623ec__MG_5356.png', 332738, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (45, 'mara.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/9f/5a46e62b60238ffd7a45b5ae1406e7_mara.jpg', 101423, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (46, '68976973_2101127553521652_8899380087959322624_n.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/fe/3a7c8ea1d21fbc18a6da48e4aec705_68976973_2101127553521652_8899380087959322624_n.jpg', 98616, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (47, 'Web Developer.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/2a/196fb28bc4577c7cecaaa1707d6155_Web Developer.jpg', 105242, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (48, 'BMS Profile.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/dd/498e5af8dbeedb7f90ccf1415bd13c_BMS Profile.jpg', 88773, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (49, 'pholly.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/6d/98e3d6c4ff512edf31b365fa121285_pholly.jpg', 82531, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (50, 'PremuimWebsite.png', '/var/app/current/backend/web/backend/uploads/quotation_template/e4/1d2ceb5ffacf82936d385a37917307_PremuimWebsite.png', 3578, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (51, 'PremuimWebsite.png', '/var/app/current/backend/web/backend/uploads/quotation_template/f2/7892b8f90bcaa7b8090e3213de3bff_PremuimWebsite.png', 3578, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (52, 'PremuimWebsite.png', '/var/app/current/backend/web/backend/uploads/quotation_template/73/ac79584205ef7ca25f5b5c1c4832cf_PremuimWebsite.png', 3578, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (53, 'PremuimWebsite.png', '/var/app/current/backend/web/backend/uploads/quotation_template/c0/c8c921b9c35b90bdb7ae4302ebfcb7_PremuimWebsite.png', 3578, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (54, 'ChannelManager.png', '/var/app/current/backend/web/backend/uploads/quotation_template/d5/52695ed539a8a385be3cd907215bb9_ChannelManager.png', 2109, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (55, 'd.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/2a/e20bd22dae641ceab3cac77f42053f_d.jpg', 162827, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (56, 'ChannelManager.png', '/var/app/current/backend/web/backend/uploads/quotation_template/00/37598a15acf6745c7639d5f58e41b8_ChannelManager.png', 2228, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (57, 'PremuimWebsite.png', '/var/app/current/backend/web/backend/uploads/quotation_template/d7/e6815f8ddc17084e7d2d0901692111_PremuimWebsite.png', 3578, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (58, 'ManagementSystem.png', '/var/app/current/backend/web/backend/uploads/quotation_template/55/ea9cb066880bf02c00398b274301a2_ManagementSystem.png', 1408, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (59, 'DMC.png', '/var/app/current/backend/web/backend/uploads/quotation_template/20/29188413c83852489a303cb154b68a_DMC.png', 2499, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (60, 'MobileApplication.png', '/var/app/current/backend/web/backend/uploads/quotation_template/e6/8a43532d9111b092f27493d6b23dac_MobileApplication.png', 1967, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (61, 'photo_2019-03-20_09-15-01.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/32/77b9816a109b06657950d0bee3401d_photo_2019-03-20_09-15-01.jpg', 148146, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (62, 'mara.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/e3/704ecee37816078bc5ef061a6ee1c4_mara.jpg', 101423, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (63, 'mara.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/7c/5d3897f51d45bf10751c48bd99fc84_mara.jpg', 101423, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (64, 'pholly.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/e5/02426ed57f689811d3e0d41a493759_pholly.jpg', 82531, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (65, 'pholly.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/b5/8d20bab547de368b47b45f51d2191d_pholly.jpg', 82531, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (66, 'pholly.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/fa/12fd5366229264f23760a23860db6c_pholly.jpg', 82531, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (67, 'pholly.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/6d/08e05b2df190bcadbefd0373985c23_pholly.jpg', 82531, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (68, '69799381_2112438929057181_1964262744039358464_n.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/3b/73784bc41b9b8ade89b0cac315bdf7_69799381_2112438929057181_1964262744039358464_n.jpg', 209227, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (69, '69799381_2112438929057181_1964262744039358464_n.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/bb/456b6afaf086c1e62010ae4f63624f_69799381_2112438929057181_1964262744039358464_n.jpg', 209227, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (70, '69799381_2112438929057181_1964262744039358464_n.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/a8/2e4d44306546a63c41f3e355a1376f_69799381_2112438929057181_1964262744039358464_n.jpg', 209227, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (71, 'a.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/06/060cafa579449cd3c68797388b2dd8_a.jpg', 209227, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (72, 'standard-intro-01.jpg', '/var/app/current/backend/web/backend/uploads/supplier-profile/d0/853714cd3da252f32a4ef9ab7815b9_standard-intro-01.jpg', 77299, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (73, 'standard-intro-01.jpg', '/var/app/current/backend/web/backend/uploads/supplier-profile/a1/d299dced0e63f028f7de44aea382b9_standard-intro-01.jpg', 77299, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (74, 'standard-intro-01.jpg', '/var/app/current/backend/web/backend/uploads/supplier-profile/26/ce3e06dd4fed3bdd3570789265ca61_standard-intro-01.jpg', 77299, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (76, 'a.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/f0/7e62c0de0369c136ff48d54ff80c9f_a.jpg', 209227, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (77, '_MG_5356.png', '/var/app/current/backend/web/backend/uploads/employee-profile/e7/4a6bbf08d9cfe3d6479325a918ffc8__MG_5356.png', 332738, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (78, '_MG_5356.png', '/var/app/current/backend/web/backend/uploads/employee-profile/37/e3c39cfd412fbb4ddfd3bd35dea5fd__MG_5356.png', 332738, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (79, 'pholly.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/98/afab6eeac9ea40a7566dfb435c056c_pholly.jpg', 82531, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (80, 'pholly.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/d5/13f35d4dc6e812f309952096369403_pholly.jpg', 82531, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (81, '70646767_2410317952557764_1809188087914299392_n.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/64/0d33fd4de9f2d00c2ad424909b1f65_70646767_2410317952557764_1809188087914299392_n.jpg', 159776, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (82, '70646767_2410317952557764_1809188087914299392_n.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/af/89e8c37e4046ff8d83de6aac6f39ed_70646767_2410317952557764_1809188087914299392_n.jpg', 159776, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (83, '70646767_2410317952557764_1809188087914299392_n.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/4a/f1bdb6d83573962b621705394eb13d_70646767_2410317952557764_1809188087914299392_n.jpg', 159776, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (84, '43220534_1899431276791885_4716490049447788544_n.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/63/b4129ab21765621c83af776f880d97_43220534_1899431276791885_4716490049447788544_n.jpg', 30833, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (85, '43220534_1899431276791885_4716490049447788544_n.jpg', '/var/app/current/backend/web/backend/uploads/employee-profile/6c/7ff926b74b9009605581b61345a8e9_43220534_1899431276791885_4716490049447788544_n.jpg', 30833, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (86, 'original-logo.png', '/var/app/current/backend/web/backend/uploads/company-profile/5f/ce9e138fdb26694cbab1623c1a654a_original-logo.png', 45866, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (87, 'original-logo.png', 'backend/uploads/company-profile/92/e62ce2675e3e6fcd639a0a3304aebd_original-logo.png', 45866, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (88, 'bms_logo.png', '/var/app/current/backend/web/backend/uploads/quotation_template/31/8222a766c3454fd88b4ba5acedc37e_bms_logo.png', 1876, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (89, 'PremuimWebsite.png', 'http://extranet.eocambotechnology.com/backend/uploads/quotation_template/0a/4d843cf2b1beabded44434542d0e4d_PremuimWebsite.png', 3768, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (90, 'ChannelManager.png', 'http://extranet.eocambotechnology.com/backend/uploads/quotation_template/04/f8c7a133ea5ae3d919df012b170470_ChannelManager.png', 4984, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (91, 'Domain.png', 'http://extranet.eocambotechnology.com/backend/uploads/quotation_template/0b/3a228162bdad03dde45a88ab1fac44_Domain.png', 3884, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (92, 'ManagementSystem.png', 'http://extranet.eocambotechnology.com/backend/uploads/quotation_template/a2/eb3660539d0b5e5ff1147d7703fc12_ManagementSystem.png', 4141, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (93, 'BookingEngine.png', 'http://extranet.eocambotechnology.com/backend/uploads/quotation_template/9e/029e8ee3d9dc1fb1a43a4bc2e6e63d_BookingEngine.png', 4197, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (94, 'MobileApplication.png', 'http://extranet.eocambotechnology.com/backend/uploads/quotation_template/43/3bb3d7b4081512368ef78a0981373d_MobileApplication.png', 4454, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (95, 'content-writer.png', 'http://extranet.eocambotechnology.com/backend/uploads/quotation_template/e8/e2e463751fb10e52089f3f08403e25_content-writer.png', 7710, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (96, 'video-camera.png', 'http://extranet.eocambotechnology.com/backend/uploads/quotation_template/05/8e375b160d7ba8d0cd0920d1281d54_video-camera.png', 10770, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (97, 'content-writer.png', '/var/app/current/backend/runtime/web/backend/uploads/quotation_template/10/722078919a13ccfdfec3e1a6b59c3c_content-writer.png', 7710, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (98, 'BookingEngine.png', '/var/app/current/backend/runtime/web/backend/uploads/quotation_template/ac/7665d8f682bebca5eeade41f6ca581_BookingEngine.png', 4197, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (99, 'BookingEngine.png', '/var/app/current/backend/runtime/web/backend/uploads/quotation_template/f4/f0b00e0f1f288ee8170d6bcc13c236_BookingEngine.png', 4197, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (100, 'signature.png', 'backend/uploads/employee-profile/45/4bb1ef8397886e3c5bba0824b0c425_signature.png', 4726, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (101, 'PremuimWebsite.png', '/var/app/current/backend/runtime/web/backend/uploads/quotation_template/d2/45981f31af33cc125714c99bf34913_PremuimWebsite.png', 3768, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (102, 'ChannelManager.png', 'backend/uploads/employee-profile/9b/014ac3625df2c2fbb0bc45f768093e_ChannelManager.png', 4984, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (103, 'PremuimWebsite.png', 'backend/uploads/quotation_template/05/249ed7af71218900f718bd24f05162_PremuimWebsite.png', 3768, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (104, 'ChannelManager.png', 'backend/uploads/quotation_template/c4/36857cce0422f75b3b5528f0af9f86_ChannelManager.png', 4984, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (105, 'FrontDesk.png', 'backend/uploads/quotation_template/4d/3e25f6dd08337c37004810d0e8c6a4_FrontDesk.png', 3527, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (106, 'ManagementSystem.png', 'backend/uploads/quotation_template/37/54c36b3eb28fd657f56dd08dc4cca1_ManagementSystem.png', 4141, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (107, 'BookingEngine.png', 'backend/uploads/quotation_template/3d/b637f951442dde177567253cd972d2_BookingEngine.png', 4197, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (108, 'PremuimWebsite.png', 'backend/uploads/quotation_template/a7/b169328014e9d73626e448c5a94b0c_PremuimWebsite.png', 3768, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (109, 'DMC.png', 'backend/uploads/quotation_template/ed/de707200d2cf4c0b0d1583c066851c_DMC.png', 5165, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (110, 'video-camera.png', 'backend/uploads/quotation_template/fa/76978c1b89ba71e32bc53f99b9c0e5_video-camera.png', 10770, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (111, 'content-writer.png', 'backend/uploads/quotation_template/d4/a7f41c125e25e0227766fdc4345884_content-writer.png', 7710, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (112, 'SocialMedia.png', 'backend/uploads/quotation_template/b6/3afe5f402fb8495c47a2f2f2d55d17_SocialMedia.png', 4256, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (113, 'Domain.png', 'backend/uploads/quotation_template/10/6b9e8a867ed14a5ee6105dfa8e117d_Domain.png', 3884, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (114, 'MobileApplication.png', 'backend/uploads/quotation_template/22/8b9c41e35f431cfa9691a1d1005202_MobileApplication.png', 4454, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (115, 'original-logo.png', 'backend/uploads/company-profile/d5/7c8dedafc52071e6ffdb4d48148697_original-logo.png', 45866, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (116, 'a.jpg', 'backend/uploads/employee-profile/62/d6483314adc417e2ced15937c88707_a.jpg', 209227, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (117, '71528133_2714589451886210_2329485773386022912_n.jpg', 'backend/uploads/employee-profile/44/59713d6b129325f3e4803f23e808fd_71528133_2714589451886210_2329485773386022912_n.jpg', 69032, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (118, 'empty-avatar.png', 'backend/uploads/employee-profile/bf/f24f38b3f9f00efe2c7880f99b22a9_empty-avatar.png', 2758, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (119, 'a.jpg', 'backend/uploads/employee-profile/8a/18ac8926ebdd5b962953853315efd8_a.jpg', 209227, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (120, 'empty-avatar.png', 'backend/uploads/employee-profile/28/236e15d610b5522e9c9142a9e14a4a_empty-avatar.png', 2758, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (121, '71528133_2714589451886210_2329485773386022912_n.jpg', 'backend/uploads/employee-profile/a2/727e01946974129ec0094576108510_71528133_2714589451886210_2329485773386022912_n.jpg', 69032, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (122, 'empty-avatar.png', 'backend/uploads/employee-profile/43/d1ddcb2484c6af8ef7ab6b5f9749b5_empty-avatar.png', 2758, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (123, 'empty-avatar.png', 'backend/uploads/employee-profile/9b/3038597df89ee9b86dc09a801ce96f_empty-avatar.png', 2758, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (124, 'empty-avatar.png', 'backend/uploads/employee-profile/2a/110a115e5561a8a4ce0476532a2f53_empty-avatar.png', 2758, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (125, 'empty-avatar.png', 'backend/uploads/employee-profile/aa/b814e72875b2e22b92ff526a4bf4ec_empty-avatar.png', 2758, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (126, 'empty-avatar.png', 'backend/uploads/employee-profile/9b/b7d5ba09085dcec378905989a322f6_empty-avatar.png', 2758, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (127, 'empty-avatar.png', 'backend/uploads/employee-profile/ff/504ea54797683f13d90ce239af62e1_empty-avatar.png', 2758, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (128, 'empty-avatar.png', 'backend/uploads/employee-profile/eb/243a2b7233f31e0f932326f0fdae01_empty-avatar.png', 2758, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (129, 'empty-avatar.png', 'backend/uploads/employee-profile/89/b1122008696faae31ff012b66f3666_empty-avatar.png', 2758, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (130, 'empty-avatar.png', 'backend/uploads/employee-profile/c7/3f62c3fd6c8103d8fc9e3ad44200ca_empty-avatar.png', 2758, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (131, 'empty-avatar.png', 'backend/uploads/employee-profile/b3/c101626c73d3999ee8e31a3b9034b9_empty-avatar.png', 2758, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (132, 'empty-avatar.png', 'backend/uploads/employee-profile/6e/ef0fd2ceee368516029b37e4194e6a_empty-avatar.png', 2758, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (133, 'empty-avatar.png', 'backend/uploads/employee-profile/35/53609450e989a8d2b720624d715a5a_empty-avatar.png', 2758, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (134, 'empty-avatar.png', 'backend/uploads/employee-profile/87/8de860a84295842f253a0b788fc916_empty-avatar.png', 2758, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (135, 'empty-avatar.png', 'backend/uploads/employee-profile/91/d041ef6261fed3c6fe8237e54e241a_empty-avatar.png', 2758, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (136, '70646767_2410317952557764_1809188087914299392_n.jpg', 'backend/uploads/employee-profile/64/64f4f2e4c8add4f714af607d793a25_70646767_2410317952557764_1809188087914299392_n.jpg', 159776, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (137, 'sign.png', 'backend/uploads/employee-profile/77/684a2ee97efae07d104cf0ec4b35d3_sign.png', 19617, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (138, '0cdad763-978d-4182-88f5-d5a49c9612fa.jpg', 'backend/uploads/employee-profile/41/c6c594ca871d7846a3b063915fe599_0cdad763-978d-4182-88f5-d5a49c9612fa.jpg', 157096, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (139, 'mara.jpg', 'backend/uploads/employee-profile/f2/65ceff2061908618e2a5673f10fdc4_mara.jpg', 101423, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (140, 'skype.jpg', 'backend/uploads/employee-profile/5b/b8a388763e005ea77203d38750dadf_skype.jpg', 195165, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (141, 'pholly.jpg', 'backend/uploads/employee-profile/5d/ab57136b188c6c4d3690d873ab572b_pholly.jpg', 82531, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (142, 'photo_2019-03-19_21-45-00.jpg', 'backend/uploads/employee-profile/d8/434e78957509b183a3719eb31653ae_photo_2019-03-19_21-45-00.jpg', 36460, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (143, 'BMS-cover.jpg', 'backend/uploads/employee-profile/cd/a1fb75f948b7f90cfbb157a08c7249_BMS-cover.jpg', 214717, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (144, 'photo_2019-10-05_10-50-23.jpg', 'backend/uploads/employee-profile/43/7c16098f3fd25ebf570b743da5d3a7_photo_2019-10-05_10-50-23.jpg', 33894, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (145, 'signature.png', 'backend/uploads/employee-profile/c6/ccb629e02e815a8492efef62a23add_signature.png', 4726, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (146, 'signature.png', 'backend/uploads/employee-profile/c6/ded8713f946dff52fdb61bbbec6726_signature.png', 26445, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (147, 'saody.jpg', 'backend/uploads/employee-profile/f4/29cbf8956c4369c07baa11da2aa065_saody.jpg', 54763, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (148, 'maco-signature.png', 'backend/uploads/employee-profile/dd/a88947669abff9cfd1a43be6d15fb7_maco-signature.png', 31922, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (149, 'a.jpg', 'backend/uploads/employee-profile/4f/1eb0c5194f3ebb7517e562363ce59d_a.jpg', 209227, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (150, 'namecheaplogo.png', 'backend/uploads/supplier-profile/e9/8fa8347018f4f61adfcc3bf5d48fef_namecheaplogo.png', 32796, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (151, 'Screen Shot 2019-10-19 at 8.36.54 AM.png', 'backend/uploads/expense-attachment/9e/e6a9780043baacb0ec114566b38f8c_Screen Shot 2019-10-19 at 8.36.54 AM.png', 148730, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (152, '72533070_111023243649560_3278084765915283456_n.jpg', 'backend/uploads/employee-profile/81/c94324b908fba0c658f3408112ccee_72533070_111023243649560_3278084765915283456_n.jpg', 113821, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (153, '2019-10-21 16.07.31.jpg', 'backend/uploads/employee-profile/5e/f98064ce817e6c560547e03ddc3200_2019-10-21 16.07.31.jpg', 25205, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (154, '2019-10-21 16.07.31.jpg', 'backend/uploads/employee-profile/60/fbda393e1e85a2d9914be9e12503a3_2019-10-21 16.07.31.jpg', 25205, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (155, '2019-10-21 16.07.31.jpg', 'backend/uploads/employee-profile/e2/b7bd8cec73c6bdc0339a8a1a699b24_2019-10-21 16.07.31.jpg', 25205, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (156, '012568c003ab32a987eaa2c57b5d8db6.jpg', 'backend/uploads/employee-profile/73/072e7e6cd3e69471ef0a4f5e6eae4a_012568c003ab32a987eaa2c57b5d8db6.jpg', 65994, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (157, '012568c003ab32a987eaa2c57b5d8db6.jpg', 'backend/uploads/employee-profile/aa/ea11b1928e21e1e46a09f59fd18de9_012568c003ab32a987eaa2c57b5d8db6.jpg', 65994, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (158, 'dalot.jpg', 'backend/uploads/employee-profile/6c/5dfc403a5fbe78cfe283d33f6fecaf_dalot.jpg', 31340, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (159, 'dalot.jpg', 'backend/uploads/employee-profile/bd/58822d2456c6434a1f380c5afc4efd_dalot.jpg', 31340, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (160, 'rachhiv.jpg', 'backend/uploads/employee-profile/b5/c1b66c64fd89437966ee8f79848724_rachhiv.jpg', 23385, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (161, 'rachhiv.jpg', 'backend/uploads/employee-profile/38/3d36592c051e72465ce45c11acf4f6_rachhiv.jpg', 23385, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (162, '69267088_117533652951802_5483756158395088896_n.jpg', 'backend/uploads/employee-profile/eb/f7790f1daad72d06d3415090223ec4_69267088_117533652951802_5483756158395088896_n.jpg', 58658, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (163, '20046355_2324075154484236_7636522323287692108_n.jpg', 'backend/uploads/employee-profile/f0/3a9ea2b8e1bb36209b1cf98be53e1d_20046355_2324075154484236_7636522323287692108_n.jpg', 65095, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (164, 'IMG_4223.JPG', 'backend/uploads/employee-profile/82/740ae3c82aa99892103f0676ee6802_IMG_4223.JPG', 302200, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (165, '19396652_225985924575217_2078063200282217288_n.jpg', 'backend/uploads/employee-profile/26/863d764664629d662b6a22e8bb479e_19396652_225985924575217_2078063200282217288_n.jpg', 63179, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (166, '19396652_225985924575217_2078063200282217288_n.jpg', 'backend/uploads/employee-profile/aa/50f3be5621c80dbfafa8f92d68ad12_19396652_225985924575217_2078063200282217288_n.jpg', 63179, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (167, '2019-10-21 16.07.31.jpg', 'backend/uploads/employee-profile/a2/7dd87c29f2031937acd42266bd14c6_2019-10-21 16.07.31.jpg', 25205, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (168, 'signature5dad7de4a6ede.png', 'backend/uploads/employee-profile/ce/a9258a1990c643e1323d140ea07071_signature5dad7de4a6ede.png', 7742, 'image/png', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (169, 'a.jpg', 'backend/uploads/employee-profile/fd/0e59efcfef47cf4212c143ec20cb82_a.jpg', 209227, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (170, 'Wooden Iron Storage Holders Home Shelf Wall Hanging Box Flower P', 'backend/uploads/employee-profile/81/045a8fc81234069530056ce6b680c5_Wooden Iron Storage Holders Home Shelf Wall Hanging Box Flower Pots Book Storage Racks Decoration_.jpg', 57785, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (171, 'skypeprofile.jpg', 'backend/uploads/employee-profile/8e/cabe50222110d3d1fd47a1db9131a8_skypeprofile.jpg', 195165, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (172, 'photo_2018-07-13_11-37-31.jpg', 'backend/uploads/employee-profile/7b/22f3d069d3493eb476e8009ae294be_photo_2018-07-13_11-37-31.jpg', 101475, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (173, '1.jpg', 'backend/uploads/employee-profile/5d/3b5e0bff93f801e60bf48b521bab74_1.jpg', 408378, 'image/jpeg', NULL, b'1');
INSERT INTO `uploaded_file` VALUES (174, 'image_2019-11-22_08-47-09.png', 'backend/uploads/company-profile\\b7\\3641d490a48ef08ecc59640f23340b_image_2019-11-22_08-47-09.png', 61632, 'image/png', NULL, b'1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) NULL DEFAULT NULL,
  `email` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password_hash` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password_reset_token` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auth_key` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `is_deleted` int(11) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `membership_id` int(11) NULL DEFAULT NULL,
  `id_employee` int(11) NULL DEFAULT NULL,
  `id_position` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (21, 1, 'info@2bc.com', '$2y$13$bbb4wMn7DRbDnN3j4J8PbO9Uq.UnBzx0pIhL6zU1YILgXOxdelmg2', NULL, 'pYBSh24N3Np8WNo73kwENMtE1QyM-ThB', 1, 15, '2019-08-05 14:22:11', '2019-11-19 17:00:24', 1, NULL, NULL, NULL, '2bc', 'business', '0', '092 30 50 85', '', 'superadmin', NULL, 10, 2);

-- ----------------------------
-- Table structure for user_type
-- ----------------------------
DROP TABLE IF EXISTS `user_type`;
CREATE TABLE `user_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` bit(1) NULL DEFAULT NULL,
  `user_type_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `default_view_id` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_type
-- ----------------------------
INSERT INTO `user_type` VALUES (1, b'1', 'Super Admin', 1, NULL, NULL, '2019-11-08 14:40:59', 1);
INSERT INTO `user_type` VALUES (2, b'1', 'Sales', 1, NULL, NULL, '2019-09-06 13:59:58', 1);
INSERT INTO `user_type` VALUES (3, b'1', 'Web Developer', 1, NULL, NULL, '2019-09-05 13:04:13', 14);
INSERT INTO `user_type` VALUES (4, b'1', 'Senior Web Developer', NULL, '2019-09-04 10:01:05', 1, '2019-11-18 11:46:14', 1);
INSERT INTO `user_type` VALUES (5, b'1', 'Support', NULL, '2019-09-05 15:17:07', 1, '2019-09-11 14:38:08', 1);
INSERT INTO `user_type` VALUES (6, b'1', 'Senior - Accountant', NULL, '2019-09-14 09:30:30', 1, '2019-10-19 10:05:28', 1);
INSERT INTO `user_type` VALUES (7, b'1', 'Senior Web Application', NULL, '2019-10-08 08:19:58', 1, '2019-10-08 14:00:50', 1);
INSERT INTO `user_type` VALUES (8, b'1', 'Finance & Accountant', NULL, '2019-11-18 10:33:51', 1, '2019-11-18 10:35:50', 1);
INSERT INTO `user_type` VALUES (9, b'1', 'Web Application', NULL, '2019-11-18 11:21:31', 1, '2019-11-18 11:29:06', 1);

-- ----------------------------
-- Table structure for working_group
-- ----------------------------
DROP TABLE IF EXISTS `working_group`;
CREATE TABLE `working_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for working_group_data
-- ----------------------------
DROP TABLE IF EXISTS `working_group_data`;
CREATE TABLE `working_group_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_working_group` int(11) NULL DEFAULT NULL,
  `id_user` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for working_group_department
-- ----------------------------
DROP TABLE IF EXISTS `working_group_department`;
CREATE TABLE `working_group_department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_working_group` int(11) NULL DEFAULT NULL,
  `id_department` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for year_list
-- ----------------------------
DROP TABLE IF EXISTS `year_list`;
CREATE TABLE `year_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of year_list
-- ----------------------------
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

SET FOREIGN_KEY_CHECKS = 1;
