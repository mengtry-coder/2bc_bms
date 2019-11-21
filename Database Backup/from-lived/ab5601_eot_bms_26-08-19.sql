-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 26, 2019 at 04:49 AM
-- Server version: 5.6.41-84.1
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ab5601_eot_bms`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_type`
--

CREATE TABLE `account_type` (
  `id` int(11) NOT NULL,
  `is_parent` int(11) DEFAULT NULL,
  `names` varchar(250) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `detail_type` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `account_type`
--

INSERT INTO `account_type` (`id`, `is_parent`, `names`, `updated_by`, `updated_date`, `status`, `detail_type`, `created_by`, `created_date`) VALUES
(1, 0, 'Income', 1, '2017-12-13 12:01:22', 1, '', 1, '2017-12-13 12:01:22'),
(2, 0, 'Expense', 1, '2017-12-13 12:06:49', 1, '', 1, '2017-12-13 12:01:22'),
(3, 0, 'Bank', 1, '2017-12-13 12:07:12', 1, '', 1, '2017-12-13 12:01:22'),
(4, 0, 'Cost of Sales', 1, '2017-12-13 12:07:46', 1, '', 1, '2017-12-13 12:01:22'),
(5, 0, 'Other Expense', 1, '2017-12-13 12:08:14', 1, '', 1, '2017-12-13 12:01:22'),
(6, 0, 'Other Income', 1, '2017-12-13 12:01:22', 1, '', 1, '2017-12-13 12:01:22'),
(7, 0, 'Equity', 1, '2017-12-13 12:01:22', 1, '', 1, '2017-12-13 12:01:22'),
(8, 0, 'Current Liabilities', 1, '2017-12-13 12:01:22', 1, '', 1, '2017-12-13 12:01:22'),
(9, 0, 'Current Assets', 1, '2017-12-13 12:01:22', 1, '', 1, '2017-12-13 12:01:22'),
(10, 0, 'Non-Current Assets', 1, '2017-12-13 12:01:22', 1, '', 1, '2017-12-13 12:01:22'),
(11, 2, 'Administrative Expenses ', 1, '2017-12-13 12:07:02', 1, '', 1, '2017-12-13 12:02:56'),
(12, 2, 'Bad Debts', 1, '2017-12-13 12:07:32', 1, '', 1, '2017-12-13 12:03:19'),
(13, 2, 'Bank Charge ', 1, '2017-12-13 12:08:00', 1, '', 1, '2017-12-13 12:03:56'),
(14, 2, 'Payroll Expenses', 1, '2017-12-13 12:08:34', 1, '', 1, '2017-12-13 12:04:22'),
(15, 2, 'Entertainment ', 1, '2017-12-13 12:09:21', 1, '', 1, '2017-12-13 12:09:24'),
(16, 2, 'Marketing Expense', 1, '2017-12-13 13:38:35', 1, '', 1, '2017-12-13 13:37:44'),
(17, 2, 'Repaire & Maintenance ', 1, '2017-12-13 13:38:43', 1, '', 1, '2017-12-13 13:37:51'),
(18, 2, 'Travel Expenses', 1, '2017-12-13 13:38:51', 1, '', 1, '2017-12-13 13:37:56'),
(19, 2, 'Insurrance', 1, '2017-12-13 13:38:55', 1, '', 1, '2017-12-13 13:38:02'),
(20, 3, 'Cash in Bank', 1, '2017-12-13 13:42:29', 1, '', 1, '0000-00-00 00:00:00'),
(21, 3, 'Cash on Hand', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(22, 5, 'Depreciation', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(23, 5, 'Other Expense', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(24, 6, 'Other Investment Revenue', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(25, 6, 'Interest Earned', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(26, 7, 'Opening Balance Equity', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(27, 7, 'Owner\'s Equity', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(28, 7, 'Partner\'s Equity', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(29, 8, 'Interest Payable ', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(30, 8, 'Insurance Payable', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(31, 8, 'Loan Payable', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(32, 8, 'Payroll Liabilities', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(33, 8, 'Prepaid Expense Liabilities', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(34, 9, 'Employee Cash Advances', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(35, 9, 'Inventory', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(36, 9, 'Loans to Shareholders', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(37, 9, 'Other Current Assets', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(38, 9, 'Prepaid Expense', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(39, 9, 'Loans to Officers', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(40, 10, 'Goodwill', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(41, 10, 'Licenses', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(42, 10, 'Member Fee', 1, '2017-12-13 00:00:00', 1, '', 1, '2017-12-13 00:00:00'),
(43, 2, 'Commission Expense', 1, '2017-12-14 00:00:00', 1, '', 1, '2017-12-14 00:00:00'),
(44, 0, 'Account Payable', 1, '2017-12-14 00:00:00', 1, '', 1, '2017-12-14 00:00:00'),
(45, 0, 'Account Receivable', 1, '2017-12-14 00:00:00', 1, '', 1, '2017-12-14 00:00:00'),
(46, 0, 'Fixed Asset', 1, '2017-12-14 00:00:00', 1, '', 1, '2017-12-14 00:00:00'),
(47, 8, 'Tax Payable Liabilities', 1, '2018-08-17 08:47:01', 1, 'For all kind of Tax Payable Liabilities', 1, '2018-08-17 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `id` int(11) NOT NULL,
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
  `swift_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`id`, `bank_name`, `account_type`, `bank_address`, `account_name`, `account_number`, `remark`, `default`, `updated_by`, `updated_date`, `status`, `created_by`, `created_date`, `swift_code`) VALUES
(13, 'Sacom Bank', 1, 'No.0665 Sangkat Sla Kram, Siem Reap City, Siem Reap Province', 'eOcambo Technology', '00032882', '', 0, 20, '2019-06-26 13:48:39', 1, 20, '2019-06-26 13:45:06', 'SGTTVNVX');

-- --------------------------------------------------------

--
-- Table structure for table `bank_account_type`
--

CREATE TABLE `bank_account_type` (
  `id` int(11) NOT NULL,
  `names` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `bank_account_type`
--

INSERT INTO `bank_account_type` (`id`, `names`) VALUES
(1, 'Saving Account'),
(2, 'Current Account');

-- --------------------------------------------------------

--
-- Table structure for table `billing_type`
--

CREATE TABLE `billing_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `billing_type`
--

INSERT INTO `billing_type` (`id`, `name`) VALUES
(1, 'Fixed Rate');

-- --------------------------------------------------------

--
-- Table structure for table `budget_setup_value`
--

CREATE TABLE `budget_setup_value` (
  `id` int(11) NOT NULL,
  `id_budget_set_up` int(11) DEFAULT NULL,
  `for_month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `daily_budget` decimal(10,2) DEFAULT NULL,
  `weekly_budget` decimal(10,2) DEFAULT NULL,
  `monthly_budget` decimal(10,2) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `budget_set_up`
--

CREATE TABLE `budget_set_up` (
  `id` int(11) NOT NULL,
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
  `quarter_4` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `budget_set_up_data`
--

CREATE TABLE `budget_set_up_data` (
  `id` int(11) NOT NULL,
  `id_budget_set_up` int(11) DEFAULT NULL,
  `id_month` int(11) DEFAULT NULL,
  `daily` decimal(10,2) DEFAULT NULL,
  `weekly` decimal(10,2) DEFAULT NULL,
  `monthly` decimal(10,2) DEFAULT NULL,
  `quarterly` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cash_advance_request`
--

CREATE TABLE `cash_advance_request` (
  `id` int(11) NOT NULL,
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
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chart_account`
--

CREATE TABLE `chart_account` (
  `id` int(11) NOT NULL,
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
  `number_code` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `chart_account`
--

INSERT INTO `chart_account` (`id`, `names`, `updated_by`, `updated_date`, `status`, `id_account_type`, `id_is_parent`, `is_parent`, `created_by`, `created_date`, `id_bank`, `number_code`) VALUES
(1, 'Sales Income', 1, '2018-08-17 14:06:23', 1, 1, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 40000),
(2, 'Franchise Sales Revenue', 1, '2018-08-26 15:56:39', 1, 6, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 41000),
(3, 'Interest Income', 1, '2018-08-26 15:57:00', 1, 6, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 42000),
(4, 'Cost of Sales', 1, '2018-08-17 14:07:44', 1, 4, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 50000),
(5, 'Cost of Accommodation', 1, '2018-08-26 16:09:53', 1, 4, NULL, 4, 1, '2018-07-02 16:23:21', NULL, 50100),
(6, 'Cost of Guide', 1, '2018-08-26 16:10:08', 1, 4, NULL, 4, 1, '2018-07-02 16:23:21', NULL, 50200),
(7, 'Cost of Ticket', 1, '2018-08-26 16:10:23', 1, 4, NULL, 4, 1, '2018-07-02 16:23:21', NULL, 50300),
(8, 'Cost of Transport', 1, '2018-08-26 16:10:42', 1, 4, NULL, 4, 1, '2018-07-02 16:23:21', NULL, 50400),
(10, 'Cost of Misc', 1, '2018-08-26 16:11:14', 1, 4, NULL, 4, 1, '2018-07-02 16:23:21', NULL, 50600),
(11, 'Cost of Tour & Activities', 1, '2018-08-26 16:11:28', 1, 4, NULL, 4, 1, '2018-07-02 16:23:21', NULL, 50700),
(12, 'Cost of Restaurant', 1, '2018-08-26 16:11:44', 1, 4, NULL, 4, 1, '2018-07-02 16:23:21', NULL, 50800),
(13, 'Cost of Cruise', 1, '2018-08-26 16:11:58', 1, 4, NULL, 4, 1, '2018-07-02 16:23:21', NULL, 50900),
(15, 'Utilities Expanse', 1, '2018-08-24 22:50:41', 1, 2, NULL, 92, 1, '2018-07-02 16:23:21', NULL, 61100),
(16, 'Staff\'s Food Expense', 1, '2018-08-26 14:35:32', 1, 2, NULL, 97, 1, '2018-07-02 16:23:21', NULL, 61510),
(17, 'Gastroline Expense', 1, '2018-08-26 15:40:05', 1, 2, NULL, 15, 1, '2018-07-02 16:23:21', NULL, 61105),
(18, 'Cellcard Expense', 1, '2018-08-26 14:19:49', 1, 2, NULL, 96, 1, '2018-07-02 16:23:21', NULL, 61410),
(19, 'Internet Expense', 1, '2018-08-26 14:20:29', 1, 2, NULL, 96, 1, '2018-07-02 16:23:21', NULL, 61420),
(20, 'Bad Debts', 1, '2018-08-26 15:16:56', 1, 2, NULL, 101, 1, '2018-07-02 16:23:21', NULL, 64010),
(21, 'Bank Charge', 1, '2018-08-26 15:17:13', 1, 2, NULL, 101, 1, '2018-07-02 16:23:21', NULL, 64020),
(22, 'Payroll Expense', 1, '2018-08-24 22:57:37', 1, 2, NULL, 92, 1, '2018-07-02 16:23:21', NULL, 61200),
(23, 'Bonus Expense', 1, '2018-08-26 15:28:07', 1, 2, NULL, 22, 1, '2018-07-02 16:23:21', NULL, 61201),
(24, 'Commission for Supplier Expense', 1, '2018-08-26 14:50:59', 1, 2, NULL, 98, 1, '2018-07-02 16:23:21', NULL, 62010),
(25, 'Anual Staff Party', 1, '2018-08-26 14:36:11', 1, 2, NULL, 97, 1, '2018-07-02 16:23:21', NULL, 61521),
(26, 'Business Adverting Expense', 1, '2018-08-26 14:57:51', 1, 2, NULL, 98, 1, '2018-07-02 16:23:21', NULL, 62020),
(27, 'Sponsor Expense', 1, '2018-08-26 14:58:17', 1, 2, NULL, 98, 1, '2018-07-02 16:23:21', NULL, 62030),
(28, 'Car Maintenance Expense', 1, '2018-08-26 14:25:41', 1, 2, NULL, 99, 1, '2018-07-02 16:23:21', NULL, 61901),
(29, 'Computer Maintenance Expense', 1, '2018-08-26 14:26:02', 1, 2, NULL, 99, 1, '2018-07-02 16:23:21', NULL, 61902),
(30, 'Accommodation Expense', 1, '2018-08-26 15:05:39', 1, 2, NULL, 182, 1, '2018-07-02 16:23:21', NULL, 62191),
(31, 'Meal\'s Expense', 1, '2018-08-26 15:05:23', 1, 2, NULL, 182, 1, '2018-07-02 16:23:21', NULL, 62192),
(32, 'Air ticket Expense', 1, '2018-08-26 15:05:58', 1, 2, NULL, 182, 1, '2018-07-02 16:23:21', NULL, 62193),
(33, 'Staff Insurrance', 1, '2018-08-26 15:28:26', 1, 2, NULL, 22, 1, '2018-07-02 16:23:21', NULL, 61202),
(36, 'Other Expense', 1, '2018-08-26 16:18:00', 1, 5, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 70000),
(37, 'Cash on Hand in Cambodia', 1, '2018-08-25 23:22:33', 1, 3, NULL, 102, 1, '2018-07-02 16:23:21', NULL, 10100),
(38, 'Cash on Hand in Siem Reap office', 1, '2018-08-25 23:25:31', 1, 3, NULL, 37, 1, '2018-07-02 16:23:21', NULL, 10101),
(39, 'Cash on Hand in Phnom Penh office', 1, '2018-08-25 23:26:04', 1, 3, NULL, 37, 1, '2018-07-02 16:23:21', NULL, 10102),
(40, 'Cash on Hand in Philippine', 1, '2018-08-25 23:22:57', 1, 3, NULL, 102, 1, '2018-07-02 16:23:21', NULL, 10200),
(42, 'Shareholders\' Equity', 1, '2018-08-26 16:21:27', 1, 7, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 30000),
(43, 'Owner\'s Withdrawal', 1, '2018-08-26 16:24:33', 1, 7, NULL, 42, 1, '2018-07-02 16:23:21', NULL, 33000),
(44, 'Retained Earnings', 1, '2018-08-26 16:23:14', 1, 7, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 39000),
(46, 'Interest Payable ', 1, '2018-08-26 17:17:38', 1, 8, NULL, 48, 1, '2018-07-02 16:23:21', NULL, 26010),
(47, 'Insurrance Payable', 1, '2018-08-26 17:24:50', 1, 8, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 22000),
(48, 'Loan Payable ', 1, '2018-08-26 17:14:00', 1, 8, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 26000),
(49, 'Payroll Liabilities', 1, '2018-08-26 17:13:23', 1, 8, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 21000),
(51, 'Employee Cash Advances', 1, '2018-08-26 17:56:50', 1, 9, NULL, 218, 1, '2018-07-02 16:23:21', NULL, 14030),
(52, 'Inventory', 1, '2018-08-26 18:00:01', 1, 9, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 13000),
(53, 'Loans to Shareholders', 1, '2018-08-26 17:55:40', 1, 9, NULL, 218, 1, '2018-07-02 16:23:21', NULL, 14010),
(54, 'Other Current Assets', 1, '2018-08-26 18:14:03', 1, 9, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 17000),
(55, 'Prepaid Expense', 1, '2018-08-24 23:15:50', 1, 9, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 15000),
(56, 'Loans to Officers', 1, '2018-08-26 17:57:46', 1, 9, NULL, 218, 1, '2018-07-02 16:23:21', NULL, 14040),
(62, 'Account Payable', 1, '2018-08-24 23:12:20', 1, 44, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 20000),
(63, 'Account Receivable', 1, '2018-08-24 23:11:17', 1, 45, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 12000),
(64, 'Cash in Bank Cambodia', 1, '2018-08-25 23:29:34', 1, 3, NULL, 104, 1, '2018-07-02 16:23:21', NULL, 11100),
(65, 'Cash in Bank Phillippine', 1, '2018-08-26 15:21:22', 1, 3, NULL, 104, 1, '2018-07-02 16:23:21', NULL, 11200),
(67, 'Vehicle', 1, '2018-08-27 22:46:53', 1, 46, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 18100),
(68, 'Building', 1, '2018-08-27 22:47:17', 1, 46, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 18200),
(69, 'Bank Deposit (Business Bank Guaranteed)', 1, '2018-08-26 18:35:16', 1, 9, NULL, 221, 1, '2018-07-02 16:23:21', NULL, 16500),
(70, 'Trade Discount & Promotion(-)', 1, '2018-08-26 16:05:19', 1, 1, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 43000),
(71, 'Unearned Revenue', 1, '2018-08-26 17:09:13', 1, 8, NULL, 0, 1, '2018-07-02 16:23:21', NULL, 25000),
(72, 'Guide Advances', 1, '2018-08-26 17:56:25', 1, 9, NULL, 218, 1, '2018-07-02 16:54:32', NULL, 14020),
(73, 'Staff Allowance Expense', 1, '2018-08-26 15:28:46', 1, 2, NULL, 22, 1, '2018-07-10 16:07:46', NULL, 61203),
(75, 'Guide Advance Liabilities', 1, '2018-08-26 17:08:43', 1, 8, NULL, 0, 1, '2018-08-15 15:54:13', NULL, 24000),
(79, 'Cash on Hand in Myanmar', 1, '2018-08-25 23:23:24', 1, 3, NULL, 102, 1, '2018-08-16 23:45:17', NULL, 10300),
(80, 'Cash in Bank Vietnam', 1, '2018-08-25 23:34:50', 1, 3, NULL, 104, 1, '2018-08-16 23:46:25', NULL, 11300),
(82, 'Cash in Bank Thailand', 1, '2018-08-26 15:22:27', 1, 3, NULL, 104, 1, '2018-08-16 23:51:18', NULL, 11400),
(85, 'Cash on Hand in Indonesia', 1, '2018-08-25 23:23:48', 1, 3, NULL, 102, 1, '2018-08-16 23:55:32', NULL, 10400),
(87, 'Salary Tax Payable', 1, '2018-08-26 16:56:12', 1, 8, NULL, 206, 1, '2018-08-17 01:50:59', NULL, 23010),
(88, 'Value Added Tax Payable', 1, '2018-08-26 16:57:37', 1, 8, NULL, 206, 1, '2018-08-17 01:52:33', NULL, 23030),
(89, 'Profit Tax Payable', 1, '2018-08-26 16:57:08', 1, 8, NULL, 206, 1, '2018-08-17 01:53:35', NULL, 23020),
(90, 'Withholding Tax Payable', 1, '2018-08-26 16:58:06', 1, 8, NULL, 206, 1, '2018-08-17 01:56:06', NULL, 23040),
(91, 'Operation & Admin Expense', 1, '2018-08-20 12:47:55', 1, 2, NULL, 0, 1, '2018-08-20 12:47:55', NULL, 60000),
(92, 'General Expense', 1, '2018-08-20 12:49:34', 1, 2, NULL, 91, 1, '2018-08-20 12:49:34', NULL, 61000),
(95, 'Rental Expense', 1, '2018-08-24 22:58:11', 1, 2, NULL, 92, 1, '2018-08-24 22:53:11', NULL, 61300),
(96, 'Communication Expense', 1, '2018-08-24 22:59:21', 1, 2, NULL, 92, 1, '2018-08-24 22:59:21', NULL, 61400),
(97, 'Admin Expense', 1, '2018-08-24 23:00:22', 1, 2, NULL, 92, 1, '2018-08-24 23:00:22', NULL, 61500),
(98, 'Marketing Expense', 1, '2018-08-26 14:11:55', 1, 2, NULL, 91, 1, '2018-08-24 23:02:05', NULL, 62000),
(99, 'Maintenance & Repair Expense', 1, '2018-08-26 14:25:00', 1, 2, NULL, 92, 1, '2018-08-24 23:03:27', NULL, 61900),
(100, 'Taxes Expense', 1, '2018-08-26 14:12:32', 1, 2, NULL, 91, 1, '2018-08-24 23:07:14', NULL, 63000),
(101, 'Finance Expense', 1, '2018-08-26 14:13:08', 1, 2, NULL, 91, 1, '2018-08-24 23:08:59', NULL, 64000),
(102, 'Cash on Hand', 1, '2018-08-26 09:48:33', 1, 3, NULL, 0, 1, '2018-08-24 23:18:16', NULL, 10000),
(104, 'Cash in Bank', 1, '2018-08-25 23:27:49', 1, 3, NULL, 0, 1, '2018-08-25 23:27:49', NULL, 11000),
(105, 'Telephone Expense', 1, '2018-08-26 14:20:47', 1, 2, NULL, 96, 1, '2018-08-26 10:02:45', NULL, 61430),
(107, 'Post Office Fee', 1, '2018-08-26 14:21:08', 1, 2, NULL, 96, 1, '2018-08-26 10:09:47', NULL, 61440),
(108, 'Security Expense', 1, '2018-08-26 14:36:55', 1, 2, NULL, 97, 1, '2018-08-26 10:18:29', NULL, 61522),
(109, 'Donations and Charity Expense', 1, '2018-08-26 14:58:40', 1, 2, NULL, 98, 1, '2018-08-26 10:20:06', NULL, 62040),
(110, 'Printing Expense', 1, '2018-08-26 14:37:19', 1, 2, NULL, 97, 1, '2018-08-26 10:20:37', NULL, 61523),
(111, 'Insurrance Expense', 1, '2018-08-26 14:37:38', 1, 2, NULL, 97, 1, '2018-08-26 10:21:38', NULL, 61524),
(112, 'Newspaper & Margazine Expense', 1, '2018-08-26 14:37:54', 1, 2, NULL, 97, 1, '2018-08-26 10:22:48', NULL, 61525),
(113, 'Office Supplies Expense', 1, '2018-08-26 14:38:14', 1, 2, NULL, 97, 1, '2018-08-26 10:23:25', NULL, 61526),
(114, 'Small Tools & Equipment', 1, '2018-08-26 14:39:18', 1, 2, NULL, 97, 1, '2018-08-26 10:24:31', NULL, 61527),
(115, 'Domain Hosting Expense', 1, '2018-08-26 14:39:49', 1, 2, NULL, 97, 1, '2018-08-26 10:25:15', NULL, 61528),
(116, 'Professional Fee Expense', 1, '2018-08-26 14:40:17', 1, 2, NULL, 97, 1, '2018-08-26 10:26:11', NULL, 61529),
(117, 'Staff Retreatment Trip Expense', 1, '2018-08-26 14:40:35', 1, 2, NULL, 97, 1, '2018-08-26 10:27:24', NULL, 61530),
(118, 'Staff Training Expense', 1, '2018-08-26 14:40:55', 1, 2, NULL, 97, 1, '2018-08-26 10:33:23', NULL, 61531),
(119, 'Staff Entertainment Expense', 1, '2018-08-26 14:41:15', 1, 2, NULL, 97, 1, '2018-08-26 10:33:58', NULL, 61532),
(120, 'Staff Uniform Expense', 1, '2018-08-26 14:41:34', 1, 2, NULL, 97, 1, '2018-08-26 10:34:36', NULL, 61533),
(121, 'Office Stationaries Expense', 1, '2018-08-26 14:41:52', 1, 2, NULL, 97, 1, '2018-08-26 10:36:31', NULL, 61534),
(122, 'Tips Expense', 1, '2018-08-26 14:42:08', 1, 2, NULL, 97, 1, '2018-08-26 10:38:02', NULL, 61535),
(123, 'Delivery & Shipping Expense', 1, '2018-08-26 14:42:28', 1, 2, NULL, 97, 1, '2018-08-26 10:38:49', NULL, 61536),
(124, 'Staff Recruitment Expense', 1, '2018-08-26 14:42:45', 1, 2, NULL, 97, 1, '2018-08-26 10:39:38', NULL, 61537),
(125, 'Religious Ceremony Expense', 1, '2018-08-26 14:44:04', 1, 2, NULL, 97, 1, '2018-08-26 10:40:23', NULL, 61538),
(126, 'Commission for Customer Expense', 1, '2018-08-26 14:59:11', 1, 2, NULL, 98, 1, '2018-08-26 11:05:31', NULL, 62050),
(127, 'Commission for Staff Expense', 1, '2018-08-26 14:59:47', 1, 2, NULL, 98, 1, '2018-08-26 11:06:42', NULL, 62060),
(128, 'Agent Fam Trip Expense', 1, '2018-08-26 15:00:08', 1, 2, NULL, 98, 1, '2018-08-26 11:07:56', NULL, 62070),
(129, 'Trade & Expo attending Expense', 1, '2018-08-26 15:00:31', 1, 2, NULL, 98, 1, '2018-08-26 11:10:33', NULL, 62080),
(130, 'Membership & Affiliate Expense', 1, '2018-08-26 15:00:52', 1, 2, NULL, 98, 1, '2018-08-26 11:12:19', NULL, 62090),
(131, 'Rep. Marketing Fee', 1, '2018-08-26 15:01:23', 1, 2, NULL, 98, 1, '2018-08-26 11:14:06', NULL, 62100),
(132, 'Entertainment Supplier', 1, '2018-08-26 15:01:46', 1, 2, NULL, 98, 1, '2018-08-26 11:15:40', NULL, 62110),
(133, 'Entertainment Customer', 1, '2018-08-26 15:02:04', 1, 2, NULL, 98, 1, '2018-08-26 11:17:24', NULL, 62120),
(134, 'Business Gift Expense', 1, '2018-08-26 15:02:26', 1, 2, NULL, 98, 1, '2018-08-26 11:22:04', NULL, 62130),
(135, 'Compensation Expense', 1, '2018-08-26 15:02:57', 1, 2, NULL, 98, 1, '2018-08-26 11:25:25', NULL, 62140),
(136, 'Business Promotion', 1, '2018-08-26 15:03:18', 1, 2, NULL, 98, 1, '2018-08-26 11:27:10', NULL, 62150),
(137, 'Art & Graphic Expense', 1, '2018-08-26 15:03:38', 1, 2, NULL, 98, 1, '2018-08-26 11:36:49', NULL, 62160),
(138, 'Broucher & Marketing Meterial', 1, '2018-08-26 15:04:01', 1, 2, NULL, 98, 1, '2018-08-26 11:38:17', NULL, 62170),
(139, 'Sales Promotion Expense', 1, '2018-08-26 15:04:23', 1, 2, NULL, 98, 1, '2018-08-26 11:40:28', NULL, 62180),
(140, 'Web Design Expense', 1, '2018-08-26 14:44:22', 1, 2, NULL, 97, 1, '2018-08-26 11:45:47', NULL, 61539),
(141, 'Refriedgerator Maintenance', 1, '2018-08-26 14:26:24', 1, 2, NULL, 99, 1, '2018-08-26 11:55:46', NULL, 61903),
(142, 'Air-conditioner Maintenance', 1, '2018-08-26 14:26:47', 1, 2, NULL, 99, 1, '2018-08-26 11:56:30', NULL, 61904),
(143, 'Printer & Scanner Maintenance', 1, '2018-08-26 14:27:10', 1, 2, NULL, 99, 1, '2018-08-26 11:57:52', NULL, 61905),
(144, 'Building Maintenance', 1, '2018-08-26 14:27:32', 1, 2, NULL, 99, 1, '2018-08-26 11:58:55', NULL, 61906),
(145, 'Electricity Maintenance', 1, '2018-08-26 14:27:58', 1, 2, NULL, 99, 1, '2018-08-26 11:59:51', NULL, 61907),
(146, 'Kitchen Equipment Maintenance', 1, '2018-08-26 14:29:31', 1, 2, NULL, 99, 1, '2018-08-26 12:00:41', NULL, 61908),
(147, 'Server Maintenance', 1, '2018-08-26 14:29:52', 1, 2, NULL, 99, 1, '2018-08-26 12:01:55', NULL, 61909),
(148, 'Office Space Maintenance', 1, '2018-08-26 14:30:12', 1, 2, NULL, 99, 1, '2018-08-26 12:02:39', NULL, 61910),
(149, 'Bathroom Maintenance', 1, '2018-08-26 14:30:43', 1, 2, NULL, 99, 1, '2018-08-26 12:03:33', NULL, 61911),
(150, 'Solar System Maintenance', 1, '2018-08-26 14:31:06', 1, 2, NULL, 99, 1, '2018-08-26 12:04:11', NULL, 61912),
(151, 'Sound System Maintenance', 1, '2018-08-26 14:31:25', 1, 2, NULL, 99, 1, '2018-08-26 12:04:46', NULL, 61913),
(152, 'Telephone Maintenance', 1, '2018-08-26 14:31:46', 1, 2, NULL, 99, 1, '2018-08-26 12:06:00', NULL, 61914),
(153, 'TV Maintenance', 1, '2018-08-26 14:32:07', 1, 2, NULL, 99, 1, '2018-08-26 12:06:35', NULL, 61915),
(154, 'Water System Maintenance', 1, '2018-08-26 14:32:30', 1, 2, NULL, 99, 1, '2018-08-26 12:07:26', NULL, 61916),
(155, 'Fire Extinguishing System', 1, '2018-08-26 14:33:02', 1, 2, NULL, 99, 1, '2018-08-26 12:08:07', NULL, 61917),
(156, 'Wooden Equipment', 1, '2018-08-26 14:33:21', 1, 2, NULL, 99, 1, '2018-08-26 12:08:56', NULL, 61918),
(157, 'Lighting Repair', 1, '2018-08-26 14:34:03', 1, 2, NULL, 99, 1, '2018-08-26 12:10:18', NULL, 61919),
(158, 'Painting Maintenance', 1, '2018-08-26 14:34:24', 1, 2, NULL, 99, 1, '2018-08-26 12:11:27', NULL, 61920),
(159, 'Garden & Landscap Maintenance', 1, '2018-08-26 14:34:43', 1, 2, NULL, 99, 1, '2018-08-26 12:42:28', NULL, 61921),
(160, 'Logo and Banner Tax', 1, '2018-08-26 15:08:46', 1, 2, NULL, 100, 1, '2018-08-26 12:45:15', NULL, 63010),
(161, 'Withholding Tax', 1, '2018-08-26 15:09:07', 1, 2, NULL, 100, 1, '2018-08-26 12:46:56', NULL, 63020),
(162, 'Authority Tax', 1, '2018-08-26 15:09:32', 1, 2, NULL, 100, 1, '2018-08-26 12:47:29', NULL, 63030),
(163, 'Patent Tax Expense', 1, '2018-08-26 15:10:34', 1, 2, NULL, 100, 1, '2018-08-26 12:48:15', NULL, 63040),
(164, 'Salary Tax Expense', 1, '2018-08-26 16:59:26', 1, 2, NULL, 100, 1, '2018-08-26 12:49:01', NULL, 63050),
(165, 'Profit Tax', 1, '2018-08-26 15:11:10', 1, 2, NULL, 100, 1, '2018-08-26 12:49:50', NULL, 63060),
(166, 'Value Added Tax Payable', 1, '2018-08-26 17:05:50', 1, 2, NULL, 100, 1, '2018-08-26 12:50:37', NULL, 63070),
(167, 'Office Rental Tax', 1, '2018-08-26 15:11:57', 1, 2, NULL, 100, 1, '2018-08-26 12:52:08', NULL, 63080),
(168, 'Penalty Tax', 1, '2018-08-26 15:12:21', 1, 2, NULL, 100, 1, '2018-08-26 12:52:51', NULL, 63090),
(169, 'Tax Registration/ Update Tax', 1, '2018-08-26 15:13:36', 1, 2, NULL, 100, 1, '2018-08-26 12:53:40', NULL, 63100),
(170, 'Prepayment Profit Tax', 1, '2018-08-26 15:14:01', 1, 2, NULL, 100, 1, '2018-08-26 12:54:40', NULL, 63110),
(171, 'Tax Services', 1, '2018-08-26 15:14:35', 1, 2, NULL, 100, 1, '2018-08-26 12:55:09', NULL, 63120),
(172, 'Credit Card Fee Expense', 1, '2018-08-26 15:17:41', 1, 2, NULL, 101, 1, '2018-08-26 13:26:02', NULL, 64030),
(173, 'Interest Expense', 1, '2018-08-26 15:18:02', 1, 2, NULL, 101, 1, '2018-08-26 13:27:10', NULL, 63040),
(174, 'Gian & Loss Exchange Rate', 1, '2018-08-26 15:18:33', 1, 2, NULL, 101, 1, '2018-08-26 13:27:55', NULL, 63050),
(175, 'Cheque Book Expense', 1, '2018-08-26 15:18:50', 1, 2, NULL, 101, 1, '2018-08-26 13:28:45', NULL, 63060),
(176, 'Depreciation Expense', 1, '2018-08-26 15:19:09', 1, 2, NULL, 101, 1, '2018-08-26 13:29:16', NULL, 63070),
(177, 'Office - Siem Reap Rental', 1, '2018-08-26 14:18:12', 1, 2, NULL, 95, 1, '2018-08-26 13:36:19', NULL, 61310),
(178, 'Office - Phnom Penh Rental', 1, '2018-08-26 14:18:33', 1, 2, NULL, 95, 1, '2018-08-26 13:37:01', NULL, 61320),
(179, 'Office - Manila Rental', 1, '2018-08-26 14:18:52', 1, 2, NULL, 95, 1, '2018-08-26 13:37:51', NULL, 61330),
(180, 'Office - Jakarta Rental', 1, '2018-08-26 14:19:08', 1, 2, NULL, 95, 1, '2018-08-26 13:38:52', NULL, 61340),
(181, 'Office - Yangon Rental', 1, '2018-08-26 14:19:24', 1, 2, NULL, 95, 1, '2018-08-26 13:41:43', NULL, 61350),
(182, 'Business Trip Expense', 1, '2018-08-26 15:04:43', 1, 2, NULL, 98, 1, '2018-08-26 13:45:48', NULL, 62190),
(183, 'Taxi & Transport\'s Expense', 1, '2018-08-26 15:06:13', 1, 2, NULL, 182, 1, '2018-08-26 13:50:26', NULL, 62194),
(184, 'Visa & Permission fee', 1, '2018-08-26 15:06:34', 1, 2, NULL, 182, 1, '2018-08-26 13:52:02', NULL, 62195),
(185, 'Staff Meal', 1, '2018-08-26 14:45:50', 1, 2, NULL, 16, 1, '2018-08-26 13:57:55', NULL, 61511),
(186, 'Staff Mineral Water', 1, '2018-08-26 14:46:06', 1, 2, NULL, 16, 1, '2018-08-26 13:58:33', NULL, 61512),
(187, 'Staff Rice Supply', 1, '2018-08-26 14:46:26', 1, 2, NULL, 16, 1, '2018-08-26 13:59:08', NULL, 61513),
(188, 'Kitchen Supplies', 1, '2018-08-26 14:46:47', 1, 2, NULL, 16, 1, '2018-08-26 14:03:34', NULL, 61514),
(189, 'Staff Cake & Birthday', 1, '2018-08-26 14:44:51', 1, 2, NULL, 97, 1, '2018-08-26 14:07:01', NULL, 61540),
(190, 'Snack & Coffee Expense', 1, '2018-08-26 14:48:39', 1, 2, NULL, 16, 1, '2018-08-26 14:48:14', NULL, 61515),
(191, 'Salary Expense', 1, '2018-08-26 15:29:16', 1, 2, NULL, 22, 1, '2018-08-26 15:29:16', NULL, 61204),
(192, 'Medical Expense', 1, '2018-08-26 15:30:55', 1, 2, NULL, 22, 1, '2018-08-26 15:30:55', NULL, 61205),
(193, 'Business License', 1, '2018-08-26 15:33:11', 1, 2, NULL, 97, 1, '2018-08-26 15:33:11', NULL, 61541),
(194, 'Tourism License', 1, '2018-08-26 15:33:44', 1, 2, NULL, 97, 1, '2018-08-26 15:33:44', NULL, 61542),
(195, 'Electricity Expense', 1, '2018-08-26 15:35:52', 1, 2, NULL, 15, 1, '2018-08-26 15:35:52', NULL, 61101),
(196, 'Water usage Expense', 1, '2018-08-26 15:36:52', 1, 2, NULL, 15, 1, '2018-08-26 15:36:52', NULL, 61102),
(197, 'City Cleaning fee', 1, '2018-08-26 15:37:21', 1, 2, NULL, 15, 1, '2018-08-26 15:37:21', NULL, 61103),
(198, 'Cable TV', 1, '2018-08-26 15:38:01', 1, 2, NULL, 15, 1, '2018-08-26 15:38:01', NULL, 61104),
(200, 'Commission', 1, '2018-08-26 16:14:05', 1, 4, NULL, 4, 1, '2018-08-26 16:14:05', NULL, 51000),
(202, 'Owner\'s Equity', 1, '2018-08-26 16:28:55', 1, 7, NULL, 42, 1, '2018-08-26 16:28:55', NULL, 31000),
(204, 'Owner\'s Investment', 1, '2018-08-26 16:31:24', 1, 7, NULL, 42, 1, '2018-08-26 16:31:24', NULL, 32000),
(206, 'Taxation Liability', 1, '2018-08-26 16:55:15', 1, 8, NULL, 0, 1, '2018-08-26 16:55:15', NULL, 23000),
(208, 'Loan from Bank', 1, '2018-08-26 17:18:41', 1, 8, NULL, 48, 1, '2018-08-26 17:18:41', NULL, 26020),
(209, 'Loan from outside', 1, '2018-08-26 17:19:37', 1, 8, NULL, 48, 1, '2018-08-26 17:19:37', NULL, 26030),
(210, 'Business License', 1, '2018-08-26 17:45:04', 1, 9, NULL, 55, 1, '2018-08-26 17:45:04', NULL, 15010),
(211, 'Prepaid Office Rental', 1, '2018-08-26 17:46:24', 1, 9, NULL, 55, 1, '2018-08-26 17:46:24', NULL, 15020),
(212, 'Prepaid Insurrance', 1, '2018-08-26 17:47:08', 1, 9, NULL, 55, 1, '2018-08-26 17:47:08', NULL, 15030),
(213, 'Prepaid Advertising', 1, '2018-08-26 17:48:33', 1, 9, NULL, 55, 1, '2018-08-26 17:48:33', NULL, 15040),
(214, 'Prepaid Cable TV', 1, '2018-08-26 17:49:53', 1, 9, NULL, 55, 1, '2018-08-26 17:49:37', NULL, 15050),
(215, 'Prepaid of Profit Tax', 1, '2018-08-26 17:50:40', 1, 9, NULL, 55, 1, '2018-08-26 17:50:40', NULL, 15060),
(216, 'Prepaid Internet', 1, '2018-08-26 17:51:17', 1, 9, NULL, 55, 1, '2018-08-26 17:51:17', NULL, 15070),
(217, 'Prepaid Telephone', 1, '2018-08-26 17:51:55', 1, 9, NULL, 55, 1, '2018-08-26 17:51:55', NULL, 15080),
(218, 'Cash Advance', 1, '2018-08-26 17:55:01', 1, 9, NULL, 0, 1, '2018-08-26 17:55:01', NULL, 14000),
(219, 'Undeposited fund', 1, '2018-08-26 18:03:49', 1, 9, NULL, 0, 1, '2018-08-26 18:03:49', NULL, 12100),
(220, 'Barter Account Clearance', 1, '2018-08-26 18:04:46', 1, 9, NULL, 0, 1, '2018-08-26 18:04:46', NULL, 12200),
(221, 'Deposit fund', 1, '2018-08-26 18:15:01', 1, 9, NULL, 0, 1, '2018-08-26 18:15:01', NULL, 16000),
(222, 'Deposit for Office Rental', 1, '2018-08-26 18:16:59', 1, 9, NULL, 221, 1, '2018-08-26 18:16:59', NULL, 16100),
(223, 'Deposit for Phone Connection', 1, '2018-08-26 18:17:36', 1, 9, NULL, 221, 1, '2018-08-26 18:17:36', NULL, 16200),
(224, 'Deposit for Internet', 1, '2018-08-26 18:18:04', 1, 9, NULL, 221, 1, '2018-08-26 18:18:04', NULL, 16300),
(225, 'Deposit To Supplier', 1, '2018-08-26 18:18:49', 1, 9, NULL, 221, 1, '2018-08-26 18:18:49', NULL, 16400),
(226, 'Deposit Holding', 1, '2018-08-26 18:23:44', 1, 8, NULL, 0, 1, '2018-08-26 18:23:44', NULL, 27000),
(227, 'Deposit from Customer', 1, '2018-08-26 18:24:32', 1, 8, NULL, 226, 1, '2018-08-26 18:24:32', NULL, 27100),
(228, 'Deposit from Franchise', 1, '2018-08-26 18:28:45', 1, 8, NULL, 226, 1, '2018-08-26 18:28:14', NULL, 27200),
(229, 'Accumulated Depreciation', 1, '2018-08-26 18:45:14', 1, 46, NULL, 0, 1, '2018-08-26 18:45:14', NULL, 17000),
(230, 'Fixed Asset Class I (5%)', 1, '2018-08-26 18:47:26', 1, 46, NULL, 0, 1, '2018-08-26 18:46:47', NULL, 17100),
(231, 'Fixed Asset Class II (50%)', 1, '2018-08-26 18:48:23', 1, 46, NULL, 0, 1, '2018-08-26 18:48:23', NULL, 17200),
(232, 'Fixed Asset Class III (25%)', 1, '2018-08-26 18:48:59', 1, 46, NULL, 0, 1, '2018-08-26 18:48:59', NULL, 17300),
(233, 'Fixed Asset Class IV (20%)', 1, '2018-08-26 18:49:48', 1, 46, NULL, 0, 1, '2018-08-26 18:49:48', NULL, 17400),
(234, 'Cost of Renovate Building', 1, '2018-08-26 18:51:14', 1, 46, NULL, 230, 1, '2018-08-26 18:51:14', NULL, 17101),
(235, 'Cost of Plant & Landscape', 1, '2018-08-26 18:52:02', 1, 46, NULL, 230, 1, '2018-08-26 18:52:02', NULL, 17102),
(236, 'Cost of Pool Side', 1, '2018-08-26 18:52:36', 1, 46, NULL, 230, 1, '2018-08-26 18:52:36', NULL, 17103),
(237, 'Acc. Depre. of Fixed Asset I', 1, '2018-08-26 18:53:20', 1, 46, NULL, 230, 1, '2018-08-26 18:53:20', NULL, 17107),
(238, 'Cost of Housekeeping Equipment', 1, '2018-08-26 18:55:05', 1, 46, NULL, 231, 1, '2018-08-26 18:55:05', NULL, 17201),
(239, 'Cost of Office Supplies', 1, '2018-08-26 18:55:55', 1, 46, NULL, 231, 1, '2018-08-26 18:55:55', NULL, 17203),
(240, 'Cost of Housekeeping Linen', 1, '2018-08-26 18:56:49', 1, 46, NULL, 231, 1, '2018-08-26 18:56:49', NULL, 17204),
(241, 'Cost of Finger Print', 1, '2018-08-26 18:57:23', 1, 46, NULL, 231, 1, '2018-08-26 18:57:23', NULL, 17205),
(242, 'Cost of Restaurant Linen', 1, '2018-08-26 18:58:51', 1, 46, NULL, 231, 1, '2018-08-26 18:58:51', NULL, 17206),
(243, 'Cost of Fire Extinguisher', 1, '2018-08-26 18:59:20', 1, 46, NULL, 231, 1, '2018-08-26 18:59:20', NULL, 17207),
(244, 'Cost of Computer & Printer', 1, '2018-08-26 19:00:02', 1, 46, NULL, 231, 1, '2018-08-26 19:00:02', NULL, 17209),
(245, 'Cost of Restaurant Funiture', 1, '2018-08-26 19:00:42', 1, 46, NULL, 231, 1, '2018-08-26 19:00:42', NULL, 17210),
(246, 'Acc. Depre. of Fixed Asset II', 1, '2018-08-26 19:01:40', 1, 46, NULL, 231, 1, '2018-08-26 19:01:40', NULL, 17220),
(247, 'Cost of Machine', 1, '2018-08-26 19:02:30', 1, 46, NULL, 232, 1, '2018-08-26 19:02:30', NULL, 17301),
(248, 'Cost of Camera', 1, '2018-08-26 19:03:07', 1, 46, NULL, 232, 1, '2018-08-26 19:03:07', NULL, 17302),
(250, 'Cost of Coffee Machine', 1, '2018-08-26 19:04:19', 1, 46, NULL, 232, 1, '2018-08-26 19:04:19', NULL, 17304),
(251, 'Cost of Office Equipment', 1, '2018-08-26 19:05:06', 1, 46, NULL, 232, 1, '2018-08-26 19:05:06', NULL, 17305),
(252, 'Cost of Housekeeping Tool', 1, '2018-08-26 19:05:56', 1, 46, NULL, 232, 1, '2018-08-26 19:05:56', NULL, 17306),
(253, 'Cost of Sound System', 1, '2018-08-26 19:06:29', 1, 46, NULL, 232, 1, '2018-08-26 19:06:29', NULL, 17307),
(254, 'Cost of Funiture & Fixture', 1, '2018-08-26 19:07:35', 1, 46, NULL, 232, 1, '2018-08-26 19:07:35', NULL, 17308),
(255, 'Cost of Statues', 1, '2018-08-26 19:08:09', 1, 46, NULL, 232, 1, '2018-08-26 19:08:09', NULL, 17309),
(256, 'Kitchen Equipment', 1, '2018-08-26 19:08:57', 1, 46, NULL, 232, 1, '2018-08-26 19:08:57', NULL, 17310),
(257, 'Cost of Kitchen Equipment', 1, '2018-08-26 19:09:30', 1, 46, NULL, 232, 1, '2018-08-26 19:09:30', NULL, 17311),
(258, 'Cost of Painting', 1, '2018-08-26 19:18:23', 1, 46, NULL, 232, 1, '2018-08-26 19:18:23', NULL, 17312),
(259, 'Cost of Telephone System', 1, '2018-08-26 19:20:33', 1, 46, NULL, 232, 1, '2018-08-26 19:20:33', NULL, 17313),
(260, 'Cost of Kitchen Utensil', 1, '2018-08-26 19:22:26', 1, 46, NULL, 232, 1, '2018-08-26 19:22:26', NULL, 17314),
(261, 'Cost of Restaurant Utensils', 1, '2018-08-26 19:23:01', 1, 46, NULL, 232, 1, '2018-08-26 19:23:01', NULL, 17315),
(262, 'Cost of Restaurant Equipment', 1, '2018-08-26 19:23:38', 1, 46, NULL, 232, 1, '2018-08-26 19:23:38', NULL, 17316),
(263, 'Cost of Water System', 1, '2018-08-26 19:24:08', 1, 46, NULL, 232, 1, '2018-08-26 19:24:08', NULL, 17317),
(264, 'Cost of Main Server System', 1, '2018-08-26 19:24:40', 1, 46, NULL, 232, 1, '2018-08-26 19:24:40', NULL, 17319),
(265, 'Cost of Internet & Wifi Setup', 1, '2018-08-26 19:25:20', 1, 46, NULL, 232, 1, '2018-08-26 19:25:20', NULL, 17321),
(266, 'Acc. Depre. of Fixed Asset III', 1, '2018-08-26 19:26:02', 1, 46, NULL, 232, 1, '2018-08-26 19:26:02', NULL, 17330),
(267, 'Cost of Air-conditioner', 1, '2018-08-26 19:27:47', 1, 46, NULL, 233, 1, '2018-08-26 19:27:47', NULL, 17402),
(268, 'Cost of Electricity System', 1, '2018-08-26 19:28:27', 1, 46, NULL, 233, 1, '2018-08-26 19:28:27', NULL, 17408),
(269, 'Acc. Depre. of Fixed Asset IV', 1, '2018-08-26 19:29:08', 1, 46, NULL, 233, 1, '2018-08-26 19:29:08', NULL, 17410),
(270, 'Long Term Liabilities', 1, '2018-08-27 22:42:07', 1, 8, NULL, 0, 1, '2018-08-27 22:35:19', NULL, 28000),
(271, 'Lease – Vehicles', 1, '2018-08-27 22:42:54', 1, 8, NULL, 270, 1, '2018-08-27 22:37:14', NULL, 28100),
(272, 'Lease – Building', 1, '2018-08-27 22:43:09', 1, 8, NULL, 270, 1, '2018-08-27 22:37:51', NULL, 28200),
(273, 'Opening Balance Equity', 1, '2019-01-13 16:53:06', 1, 7, 26, 42, 1, '2019-01-13 16:52:24', NULL, 34000),
(274, 'Sacom Bank : eOcambo Technology | 00032882', 1, '2019-06-26 13:45:42', 1, 3, NULL, 64, 1, '2018-07-02 16:23:21', 13, 11101),
(275, 'ABA Bank: PHICH SOKDA (No. 000120354)', 1, '2019-06-24 08:16:55', 1, 3, NULL, 64, 1, '2018-08-11 19:18:30', 1, 11102);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
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
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `id_country`, `code`, `names`, `description`, `img`, `video_link`, `latitude`, `longitude`, `updated_by`, `updated_date`, `status`, `created_by`, `created_date`) VALUES
(1, 56, 'PNH', 'Phnom Penh', '', NULL, '', 0, 0, 1000016, '2018-08-12 19:46:33', 1, 1000016, '2018-08-12 19:45:12'),
(2, 56, 'BMC', 'Banteay Meanchey', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:43:53', 1, 1000016, '2018-08-12 20:43:53'),
(3, 56, 'BBM', 'Battambang', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:44:12', 1, 1000016, '2018-08-12 20:44:12'),
(4, 56, 'KPC', 'Kampong Cham', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:44:57', 1, 1000016, '2018-08-12 20:44:57'),
(5, 56, 'KZC', 'Kampong Chhnang', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:45:45', 1, 1000016, '2018-08-12 20:45:45'),
(6, 56, 'KPS', 'Kampong Speu', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:46:13', 1, 1000016, '2018-08-12 20:46:13'),
(7, 56, 'KZK', 'Kampong Thom', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:46:32', 1, 1000016, '2018-08-12 20:46:32'),
(8, 56, 'KMT', 'Kampot', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:46:59', 1, 1000016, '2018-08-12 20:46:59'),
(9, 56, 'KDL', 'Kandal', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:47:18', 1, 1000016, '2018-08-12 20:47:18'),
(10, 56, 'KKZ', 'Koh Kong', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:47:44', 1, 1000016, '2018-08-12 20:47:44'),
(11, 56, 'KEP', 'Kep', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:38:22', 1, 1000016, '2018-08-12 20:38:22'),
(12, 56, 'KTI', 'Kratie', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:38:51', 1, 1000016, '2018-08-12 20:38:51'),
(13, 56, 'MWV', 'Mondulkiri', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:39:19', 1, 1000016, '2018-08-12 20:39:19'),
(14, 56, 'OMC', 'Oddar Meanchey', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:39:41', 1, 1000016, '2018-08-12 20:39:41'),
(15, 56, 'PAI', 'Pailin', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:40:35', 1, 1000016, '2018-08-12 20:40:35'),
(16, 56, 'KOS', 'Sihanoukville', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:41:11', 1, 1000016, '2018-08-12 20:41:11'),
(17, 56, 'OMY', 'Preah Vihear', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:42:09', 1, 1000016, '2018-08-12 20:42:09'),
(18, 56, 'KZD', 'Pursat', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:42:41', 1, 1000016, '2018-08-12 20:42:41'),
(19, 56, 'PVG', 'Prey Veng', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:43:07', 1, 1000016, '2018-08-12 20:43:07'),
(20, 56, 'RBE', 'Rattankiri', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:43:27', 1, 1000016, '2018-08-12 20:43:27'),
(21, 56, 'REP', 'Siem Reap', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:33:40', 1, 1000016, '2018-08-12 20:33:40'),
(22, 56, 'TNX', 'Stung Treng', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:34:20', 1, 1000016, '2018-08-12 20:34:20'),
(23, 56, 'SVR', 'Svay Rieng', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:36:23', 1, 1000016, '2018-08-12 20:36:23'),
(24, 56, 'TKO', 'Takeo', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:36:59', 1, 1000016, '2018-08-12 20:36:59'),
(25, 56, 'TBK', 'Tbong Khmum', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:37:25', 1, 1000016, '2018-08-12 20:37:25'),
(26, 237, 'BKK', 'Bangkok', '', NULL, '', 0, 0, 1000016, '2018-08-12 20:37:58', 1, 1000016, '2018-08-12 20:37:58'),
(44, 194, 'ABR', 'Abra', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:27:04', 1, 1000016, '2018-08-12 21:27:04'),
(45, 194, 'AGN', 'Agusan del Norte', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:29:25', 1, 1000016, '2018-08-12 21:29:25'),
(46, 194, 'AGS', 'Agusan del Sur', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:30:12', 1, 1000016, '2018-08-12 21:30:12'),
(47, 194, 'AKL', 'Aklan', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:30:59', 1, 1000016, '2018-08-12 21:30:59'),
(48, 194, 'ALB', 'Albay', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:31:53', 1, 1000016, '2018-08-12 21:31:53'),
(49, 194, 'ANT', 'Antique', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:32:51', 1, 1000016, '2018-08-12 21:32:51'),
(50, 194, 'APA', 'Apayao', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:33:45', 1, 1000016, '2018-08-12 21:33:45'),
(51, 194, 'AUR', 'Aurora', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:34:22', 1, 1000016, '2018-08-12 21:34:22'),
(52, 194, 'BAS', 'Basilan', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:35:13', 1, 1000016, '2018-08-12 21:35:13'),
(53, 194, 'BAN', 'Bataan', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:35:49', 1, 1000016, '2018-08-12 21:35:49'),
(54, 194, 'BTN', 'Batanes', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:36:57', 1, 1000016, '2018-08-12 21:36:57'),
(55, 194, 'BTG', 'Batangas', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:37:44', 1, 1000016, '2018-08-12 21:37:44'),
(56, 194, 'BEN', 'Benguet', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:38:27', 1, 1000016, '2018-08-12 21:38:27'),
(57, 194, 'BIL', 'Biliran', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:40:16', 1, 1000016, '2018-08-12 21:40:16'),
(58, 194, 'BOH', 'Bohol', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:41:00', 1, 1000016, '2018-08-12 21:41:00'),
(59, 194, 'BUK', 'Bukidnon', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:41:42', 1, 1000016, '2018-08-12 21:41:42'),
(60, 194, 'BUL', 'Bulacan', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:42:18', 1, 1000016, '2018-08-12 21:42:18'),
(61, 194, 'CAG', 'Cagayan', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:42:55', 1, 1000016, '2018-08-12 21:42:55'),
(62, 194, 'CAN', 'Camarines Norte', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:43:41', 1, 1000016, '2018-08-12 21:43:41'),
(63, 194, 'CAS', 'Camarines Sur', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:45:13', 1, 1000016, '2018-08-12 21:45:13'),
(64, 194, 'CAM', 'Camiguin', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:47:36', 1, 1000016, '2018-08-12 21:47:36'),
(65, 194, 'CAP', 'Capiz', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:48:18', 1, 1000016, '2018-08-12 21:48:18'),
(66, 194, 'CAT', 'Catanduanes', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:49:12', 1, 1000016, '2018-08-12 21:49:12'),
(67, 194, 'CAV', 'Cavite', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:49:54', 1, 1000016, '2018-08-12 21:49:54'),
(68, 194, 'CEB', 'Cebu', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:50:32', 1, 1000016, '2018-08-12 21:50:32'),
(69, 194, 'COM', 'Compostela Valley', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:51:28', 1, 1000016, '2018-08-12 21:51:28'),
(70, 194, 'NCO', 'Cotabato', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:51:58', 1, 1000016, '2018-08-12 21:51:58'),
(71, 194, 'DAV', 'Davao del Norte', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:52:54', 1, 1000016, '2018-08-12 21:52:54'),
(72, 194, 'DAS', 'Davao del Sur', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:53:45', 1, 1000016, '2018-08-12 21:53:45'),
(73, 194, 'DVO', 'Davao Occidental', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:54:16', 1, 1000016, '2018-08-12 21:54:16'),
(74, 194, 'DAO', 'Davao Oriental', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:54:58', 1, 1000016, '2018-08-12 21:54:58'),
(75, 194, 'DIN', 'Dinagat Islands', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:55:46', 1, 1000016, '2018-08-12 21:55:46'),
(76, 194, 'EAS', 'Eastern Samar', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:56:28', 1, 1000016, '2018-08-12 21:56:28'),
(77, 194, 'GUI', 'Guimaras', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:59:20', 1, 1000016, '2018-08-12 21:59:20'),
(78, 194, 'IFU', 'Ifugao', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 21:59:54', 1, 1000016, '2018-08-12 21:59:54'),
(79, 194, 'ILN', 'Ilocos Norte', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:00:44', 1, 1000016, '2018-08-12 22:00:44'),
(80, 194, 'ILS', 'Ilocos Sur', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:01:33', 1, 1000016, '2018-08-12 22:01:33'),
(81, 194, 'ILI', 'Iloilo', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:02:23', 1, 1000016, '2018-08-12 22:02:23'),
(82, 194, 'ISA', 'Isabela', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:03:06', 1, 1000016, '2018-08-12 22:03:06'),
(83, 194, 'KAL', 'Kalinga', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:03:39', 1, 1000016, '2018-08-12 22:03:39'),
(84, 194, 'LUN', 'La Union', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:04:15', 1, 1000016, '2018-08-12 22:04:15'),
(85, 194, 'LAG', 'Laguna', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:05:08', 1, 1000016, '2018-08-12 22:05:08'),
(86, 194, 'LAN', 'Lanao del Norte', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:05:53', 1, 1000016, '2018-08-12 22:05:53'),
(87, 194, 'LAS', 'Lanao del Sur', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:06:27', 1, 1000016, '2018-08-12 22:06:27'),
(88, 194, 'LEY', 'Leyte', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:07:04', 1, 1000016, '2018-08-12 22:07:04'),
(89, 194, 'MAG', 'Maguindanao', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:07:58', 1, 1000016, '2018-08-12 22:07:58'),
(90, 194, 'MAD', 'Marinduque', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:08:32', 1, 1000016, '2018-08-12 22:08:32'),
(91, 194, 'MAS', 'Masbate', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:09:00', 1, 1000016, '2018-08-12 22:09:00'),
(92, 194, 'MSC', 'Misamis Occidental', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:09:42', 1, 1000016, '2018-08-12 22:09:42'),
(93, 194, 'MSR', 'Misamis Oriental', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:14:50', 1, 1000016, '2018-08-12 22:14:50'),
(94, 194, 'MOU', 'Mountain', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:16:01', 1, 1000016, '2018-08-12 22:16:01'),
(95, 194, 'NEC', 'Negros Occidental', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:17:39', 1, 1000016, '2018-08-12 22:17:39'),
(96, 194, 'NER', 'Negros Oriental', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:18:13', 1, 1000016, '2018-08-12 22:18:13'),
(97, 194, 'NSA', 'Northern Samar', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:19:23', 1, 1000016, '2018-08-12 22:19:23'),
(98, 194, 'NUE', 'Nueva Ecija', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:20:23', 1, 1000016, '2018-08-12 22:20:23'),
(99, 194, 'NUV', 'Nueva Vizcaya', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:21:16', 1, 1000016, '2018-08-12 22:21:16'),
(100, 194, 'MDC', 'Occidental Mindoro', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:22:01', 1, 1000016, '2018-08-12 22:22:01'),
(101, 194, 'MDR', 'Oriental Mindoro', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:23:39', 1, 1000016, '2018-08-12 22:23:39'),
(102, 194, 'PLW', 'Palawan', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:25:32', 1, 1000016, '2018-08-12 22:25:32'),
(103, 194, 'PAM', 'Pampanga', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:26:25', 1, 1000016, '2018-08-12 22:26:25'),
(104, 194, 'PAN', 'Pangasinan', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:27:01', 1, 1000016, '2018-08-12 22:27:01'),
(105, 194, 'QUE', 'Quezon', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:27:42', 1, 1000016, '2018-08-12 22:27:42'),
(106, 194, 'QUI', 'Quirino', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:28:46', 1, 1000016, '2018-08-12 22:28:46'),
(107, 194, 'RIZ', 'Rizal', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:29:37', 1, 1000016, '2018-08-12 22:29:37'),
(108, 194, 'ROM', 'Romblon', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:30:47', 1, 1000016, '2018-08-12 22:30:47'),
(109, 194, 'WSA', 'Samar', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:31:45', 1, 1000016, '2018-08-12 22:31:45'),
(110, 194, 'SAR', 'Sarangani', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:32:27', 1, 1000016, '2018-08-12 22:32:27'),
(111, 194, 'SIG', 'Siquijor', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:33:18', 1, 1000016, '2018-08-12 22:33:18'),
(112, 194, 'SOR', 'Sorsogon', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:42:49', 1, 1000016, '2018-08-12 22:42:49'),
(113, 194, 'SCO', 'South Cotabato', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:43:31', 1, 1000016, '2018-08-12 22:43:31'),
(114, 194, 'SLE', 'Southern Leyte', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:44:18', 1, 1000016, '2018-08-12 22:44:18'),
(115, 194, 'SUK', 'Sultan Kudarat', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:44:48', 1, 1000016, '2018-08-12 22:44:48'),
(116, 194, 'SLU', 'Sulu', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:45:25', 1, 1000016, '2018-08-12 22:45:25'),
(117, 194, 'SUN', 'Surigao del Norte', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:46:00', 1, 1000016, '2018-08-12 22:46:00'),
(118, 194, 'SUR', 'Surigao del Sur', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:46:33', 1, 1000016, '2018-08-12 22:46:33'),
(119, 194, 'TAR', 'Tarlac', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:47:05', 1, 1000016, '2018-08-12 22:47:05'),
(120, 194, 'TAW', 'Tawi-Tawi', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:47:44', 1, 1000016, '2018-08-12 22:47:44'),
(121, 194, 'ZMB', 'Zambales', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:48:37', 1, 1000016, '2018-08-12 22:48:37'),
(122, 194, 'ZAN', 'Zamboanga del Norte', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:49:23', 1, 1000016, '2018-08-12 22:49:23'),
(123, 194, 'ZAS', 'Zamboanga del Sur', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:50:14', 1, 1000016, '2018-08-12 22:50:14'),
(124, 194, 'ZSI', 'Zamboanga Sibugay', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:50:54', 1, 1000016, '2018-08-12 22:50:54'),
(125, 194, 'MNL', 'Manila', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 22:53:44', 1, 1000016, '2018-08-12 22:53:44'),
(126, 153, 'KUL', 'Kuala Lumpur', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:02:04', 1, 1000016, '2018-08-12 23:02:04'),
(127, 153, 'PEN', 'Penang', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:03:11', 1, 1000016, '2018-08-12 23:03:11'),
(128, 153, 'MKZ', 'Melaka', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:05:51', 1, 1000016, '2018-08-12 23:05:51'),
(129, 153, 'JHB', 'Johor Bahru', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:15:02', 1, 1000016, '2018-08-12 23:15:02'),
(130, 153, 'LGK', 'Langkawi', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:16:17', 1, 1000016, '2018-08-12 23:16:17'),
(131, 153, 'IPH', 'Ipoh', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:19:38', 1, 1000016, '2018-08-12 23:19:38'),
(132, 153, 'KBR', 'Kota Bharu', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:21:09', 1, 1000016, '2018-08-12 23:21:09'),
(133, 153, 'TGG', 'Kuala Terengganu', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:21:56', 1, 1000016, '2018-08-12 23:21:56'),
(134, 153, 'KUA', 'Kuantan', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:22:58', 1, 1000016, '2018-08-12 23:22:58'),
(135, 153, 'KCH', 'Kuching', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:25:12', 1, 1000016, '2018-08-12 23:25:12'),
(136, 153, 'BKI', 'Kota Kinabalu', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:28:59', 1, 1000016, '2018-08-12 23:28:59'),
(137, 153, 'SZB', 'Subang', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:35:40', 1, 1000016, '2018-08-12 23:35:40'),
(138, 153, 'TWU', 'Tawau', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:38:44', 1, 1000016, '2018-08-12 23:38:44'),
(139, 153, 'SDK', 'Sandakan', '', NULL, '', NULL, NULL, 1000016, '2018-08-12 23:39:39', 1, 1000016, '2018-08-12 23:39:39'),
(140, 121, 'BXW', 'Bawean', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:01:57', 1, 1000016, '2018-08-13 00:01:57'),
(141, 121, 'BDO', 'Bandung', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:02:36', 1, 1000016, '2018-08-13 00:02:36'),
(142, 121, 'BWX', 'Banyuwangi ', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:03:22', 1, 1000016, '2018-08-13 00:03:22'),
(143, 121, 'TSY', 'Tasikmalaya', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:03:55', 1, 1000016, '2018-08-13 00:03:55'),
(144, 121, 'CBN', 'Cirebon', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:04:39', 1, 1000016, '2018-08-13 00:04:39'),
(145, 121, 'CXP', 'Cilacap', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:05:06', 1, 1000016, '2018-08-13 00:05:06'),
(146, 121, 'CGK', 'Jakarta', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:05:52', 1, 1000016, '2018-08-13 00:05:52'),
(147, 121, 'BTO', 'Tangerang', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:09:22', 1, 1000016, '2018-08-13 00:09:22'),
(148, 121, 'KJT', 'Majalengka', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:09:55', 1, 1000016, '2018-08-13 00:09:55'),
(149, 121, 'SRG', 'Semarang', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:10:32', 1, 1000016, '2018-08-13 00:10:32'),
(150, 121, 'SUB', 'Surabaya', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:11:04', 1, 1000016, '2018-08-13 00:11:04'),
(151, 121, 'SOC', 'Surakarta', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:11:48', 1, 1000016, '2018-08-13 00:11:48'),
(152, 121, 'JOG', 'Yogyakarta', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:12:49', 1, 1000016, '2018-08-13 00:12:49'),
(154, 121, 'TKG', 'Bandar Lampung', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:15:20', 1, 1000016, '2018-08-13 00:15:20'),
(155, 121, 'BTH', 'Batam', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:15:53', 1, 1000016, '2018-08-13 00:15:53'),
(156, 121, 'LSE', 'Batu Islands', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:16:47', 1, 1000016, '2018-08-13 00:16:47'),
(157, 121, 'BKS', 'Bengkulu', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:18:00', 1, 1000016, '2018-08-13 00:18:00'),
(158, 121, 'DUM', 'Dumai', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:18:45', 1, 1000016, '2018-08-13 00:18:45'),
(159, 121, 'GNS', 'Gunung Sitoli', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:19:23', 1, 1000016, '2018-08-13 00:19:23'),
(160, 121, 'DJB', 'Jambi City', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:20:04', 1, 1000016, '2018-08-13 00:20:04'),
(161, 121, 'LLG', 'Lubuklinggau', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:20:57', 1, 1000016, '2018-08-13 00:20:57'),
(162, 121, 'KNO ', 'Medan', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:21:42', 1, 1000016, '2018-08-13 00:21:42'),
(163, 121, 'PDG', 'Padang', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:22:27', 1, 1000016, '2018-08-13 00:22:27'),
(164, 121, 'PLM', 'Palembang', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:23:15', 1, 1000016, '2018-08-13 00:23:15'),
(165, 121, 'PGK', 'Pangkal Pinang', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:23:52', 1, 1000016, '2018-08-13 00:23:52'),
(166, 121, 'PKU', 'Pekanbaru', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:24:36', 1, 1000016, '2018-08-13 00:24:36'),
(167, 121, 'NTX', 'Ranai', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:25:16', 1, 1000016, '2018-08-13 00:25:16'),
(168, 121, 'FLZ', 'Sibolga', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:25:43', 1, 1000016, '2018-08-13 00:25:43'),
(169, 121, 'DTB', 'Siborong-Borong', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:28:09', 1, 1000016, '2018-08-13 00:28:09'),
(170, 121, 'SNX', 'Sinabang', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:29:15', 1, 1000016, '2018-08-13 00:29:15'),
(171, 121, 'RKI', 'Sipora', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:29:55', 1, 1000016, '2018-08-13 00:29:55'),
(172, 121, 'MEQ', 'Suka Makmue', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:30:35', 1, 1000016, '2018-08-13 00:30:35'),
(173, 121, 'TXE', 'Takengon', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:31:09', 1, 1000016, '2018-08-13 00:31:09'),
(174, 121, 'TJQ', 'Tanjung Pandan', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:31:39', 1, 1000016, '2018-08-13 00:31:39'),
(175, 121, 'TNJ', 'Tanjung Pinang', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:32:06', 1, 1000016, '2018-08-13 00:32:06'),
(176, 121, 'BPN', 'Balikpapan', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:32:37', 1, 1000016, '2018-08-13 00:32:37'),
(177, 121, 'BDJ', 'Banjarmasin', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:33:09', 1, 1000016, '2018-08-13 00:33:09'),
(178, 121, 'BEJ', 'Tanjung Redep', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:34:20', 1, 1000016, '2018-08-13 00:34:20'),
(179, 121, 'BXT', 'Bontang', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:34:59', 1, 1000016, '2018-08-13 00:34:59'),
(180, 121, 'DTD', 'Mahakam Ulu', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:35:29', 1, 1000016, '2018-08-13 00:35:29'),
(181, 121, 'KTG', 'Ketapang', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:35:55', 1, 1000016, '2018-08-13 00:35:55'),
(182, 121, 'LPU', 'Long Apung', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:36:23', 1, 1000016, '2018-08-13 00:36:23'),
(183, 121, 'LBW', 'Long Bawan', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:36:52', 1, 1000016, '2018-08-13 00:36:52'),
(184, 121, 'NNX', 'Nunukan', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:37:21', 1, 1000016, '2018-08-13 00:37:21'),
(185, 121, 'PKY', 'Palangkaraya', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:37:53', 1, 1000016, '2018-08-13 00:37:53'),
(186, 121, 'PKN', 'Pangkalanbun', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:38:18', 1, 1000016, '2018-08-13 00:38:18'),
(187, 121, 'PNK', 'Pontianak', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:38:43', 1, 1000016, '2018-08-13 00:38:43'),
(188, 121, 'PSU', 'Putussibau', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:39:06', 1, 1000016, '2018-08-13 00:39:06'),
(189, 121, 'SRI', 'Samarinda', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:39:45', 1, 1000016, '2018-08-13 00:39:44'),
(190, 121, 'TRK', 'Tarakan', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:45:46', 1, 1000016, '2018-08-13 00:45:46'),
(191, 121, 'BUW', 'Bau-Bau', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:47:02', 1, 1000016, '2018-08-13 00:47:02'),
(192, 121, 'GTO', 'Gorontalo', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:47:30', 1, 1000016, '2018-08-13 00:47:30'),
(193, 121, 'KDI', 'Kendari', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:48:02', 1, 1000016, '2018-08-13 00:48:02'),
(194, 121, 'UPG', 'Makassar', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:48:31', 1, 1000016, '2018-08-13 00:48:31'),
(195, 121, 'MJU', 'Mamuju', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:49:06', 1, 1000016, '2018-08-13 00:49:06'),
(196, 121, 'MDC', 'Manado', '', NULL, '', NULL, NULL, 1000016, '2018-08-13 00:49:45', 1, 1000016, '2018-08-13 00:49:45'),
(197, 58, 'YYJ', 'British Columbia', '', NULL, 'fRwR9oqvNsM', 38, 77, 1000017, '2018-08-13 13:22:58', 1, 1000017, '2018-08-13 12:46:10'),
(198, 258, 'VCA', 'Can Tho', '', NULL, '', 0, 0, 1000028, '2018-08-13 17:59:36', 1, 35, '2018-08-12 20:42:41'),
(199, 258, 'VCL', 'Chu Lai', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(200, 258, 'DLI', 'Da Lat', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(201, 258, 'DAD', 'Da Nang', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(202, 258, 'HPH', 'Hai Phong', '', NULL, '', 20.8648, 106.683, 1000028, '2018-08-13 18:11:12', 1, 35, '2018-08-12 20:42:41'),
(203, 258, 'HAN', 'Hanoi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(204, 258, 'SGN', 'Ho Chi Minh City', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(205, 258, 'HUI', 'Hue', '', NULL, '', 0, 0, 1000028, '2018-08-13 17:59:54', 1, 35, '2018-08-12 20:42:41'),
(206, 258, 'CXR', 'Nha Trang', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(207, 258, 'PQC', 'Phu Quoc', '', NULL, '', 0, 0, 1000028, '2018-08-13 18:00:12', 1, 35, '2018-08-12 20:42:41'),
(208, 258, 'VII', 'Vinh', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(209, 258, 'BMV', 'Buon Ma Thuot', '', NULL, '', 0, 0, 1000028, '2018-08-13 18:00:29', 1, 35, '2018-08-12 20:42:41'),
(210, 258, 'CAH', 'Ca Mau', '', NULL, '', 0, 0, 1000028, '2018-08-13 18:01:17', 1, 35, '2018-08-12 20:42:41'),
(211, 258, 'VCS', 'Con Dao', '', NULL, '', 0, 0, 1000028, '2018-08-13 18:04:55', 1, 35, '2018-08-12 20:42:41'),
(212, 258, 'DIN', 'Dien Bien Phu', '', NULL, '', 0, 0, 1000028, '2018-08-13 18:04:33', 1, 35, '2018-08-12 20:42:41'),
(213, 258, 'VDH', 'Dong Hoi', '', NULL, '', 0, 0, 1000028, '2018-08-13 18:02:00', 1, 35, '2018-08-12 20:42:41'),
(214, 258, 'PXU', 'Pleiku', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(215, 258, 'UIH', 'Qui Nh?n', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(216, 258, 'VKG', 'Rach Gia', '', NULL, '', 0, 0, 1000028, '2018-08-13 18:04:17', 1, 35, '2018-08-12 20:42:41'),
(217, 258, 'SQH', 'S?n La', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(218, 258, 'TBB', 'Tuy Hoa', '', NULL, '', 0, 0, 1000028, '2018-08-13 18:02:19', 1, 35, '2018-08-12 20:42:41'),
(219, 258, 'VTG', 'Vung Tau', '', NULL, '', 0, 0, 1000028, '2018-08-13 18:05:56', 1, 35, '2018-08-12 20:42:41'),
(220, 258, 'THD', 'Thanh Hoa', '', NULL, '', 0, 0, 1000028, '2018-08-13 18:06:16', 1, 35, '2018-08-12 20:42:41'),
(224, 237, 'ACR', 'Amnat Charoen', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(225, 237, 'ATG', 'Ang Thong', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(226, 237, 'BKN', 'Bueng Kan', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(227, 237, 'BRM', 'Buriram', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(228, 237, 'CCO', 'Chachoengsao', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(229, 237, 'CNT', 'Chai Nat', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(230, 237, 'CPM', 'Chaiyaphum', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(231, 237, 'CTI', 'Chanthaburi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(232, 237, 'CMI', 'Chiang Mai', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(233, 237, 'CRI', 'Chiang Rai', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(234, 237, 'CBI', 'Chonburi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(235, 237, 'CPN', 'Chumphon', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(236, 237, 'KSN', 'Kalasin', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(237, 237, 'KPT', 'Kamphaeng Phet', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(238, 237, 'KRI', 'Kanchanaburi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(239, 237, 'KKN', 'Khon Kaen', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(240, 237, 'KBI', 'Krabi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(241, 237, 'LPG', 'Lampang', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(242, 237, 'LPN', 'Lamphun', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(243, 237, 'LEI', 'Loei', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(244, 237, 'LRI', 'Lopburi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(245, 237, 'MSN', 'Mae Hong Son', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(246, 237, 'MKM', 'Maha Sarakham', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(247, 237, 'MDH', 'Mukdahan', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(248, 237, 'NYK', 'Nakhon Nayok', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(249, 237, 'NPT', 'Nakhon Pathom', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(250, 237, 'NPM', 'Nakhon Phanom', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(251, 237, 'NMA', 'Nakhon Ratchasima', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(252, 237, 'NSN', 'Nakhon Sawan', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(253, 237, 'NRT', 'Nakhon Si Thammarat', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(254, 237, 'NAN', 'Nan', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(255, 237, 'NWT', 'Narathiwat', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(256, 237, 'NBP', 'Nong Bua Lam Phu', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(257, 237, 'NKI', 'Nong Khai', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(258, 237, 'NBI', 'Nonthaburi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(259, 237, 'PTE', 'Pathum Thani', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(260, 237, 'PTN', 'Pattani', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(261, 237, 'PNA', 'Phang Nga', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(262, 237, 'PLG', 'Phatthalung', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(263, 237, 'PYO', 'Phayao', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(264, 237, 'PNB', 'Phetchabun', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(265, 237, 'PBI', 'Phetchaburi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(266, 237, 'PCT', 'Phichit', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(267, 237, 'PLK', 'Phitsanulok', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(268, 237, 'AYA', 'Phra Nakhon Si Ayutthaya', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(269, 237, 'PRE', 'Phrae', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(270, 237, 'PKT', 'Phuket', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(271, 237, 'PRI', 'Prachinburi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(272, 237, 'PKN', 'Prachuap Khiri Khan', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(273, 237, 'RNG', 'Ranong', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(274, 237, 'RBR', 'Ratchaburi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(275, 237, 'RYG', 'Rayong', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(276, 237, 'RET', 'Roi Et', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(277, 237, 'SKW', 'Sa Kaeo', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(278, 237, 'SNK', 'Sakon Nakhon', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(279, 237, 'SPK', 'Samut Prakan', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(280, 237, 'SKN', 'Samut Sakhon', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(281, 237, 'SKM', 'Samut Songkhram', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(282, 237, 'SRI', 'Saraburi', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(283, 237, 'STN', 'Satun', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(284, 237, 'SBR', 'Sing Buri', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(285, 237, 'SSK', 'Sisaket', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(286, 237, 'SKA', 'Songkhla', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(287, 237, 'STI', 'Sukhothai', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(288, 237, 'SPB', 'Suphan Buri', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(289, 237, 'SNI', 'Surat Thani', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(290, 237, 'SRN', 'Surin', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(291, 237, 'TAK', 'Tak', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(292, 237, 'TRG', 'Trang', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(293, 237, 'TRT', 'Trat', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(294, 237, 'UBN', 'Ubon Ratchathani', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(295, 237, 'UDN', 'Udon Thani', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(296, 237, 'UTI', 'Uthai Thani', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(297, 237, 'UTD', 'Uttaradit', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(298, 237, 'YLA', 'Yala', NULL, NULL, NULL, NULL, NULL, 35, '2018-08-12 20:42:41', 1, 35, '2018-08-12 20:42:41'),
(299, 237, 'YST', 'Yasothon', '', NULL, '', 0, 0, 35, '2018-08-13 16:09:26', 1, 35, '2018-08-13 16:09:26'),
(300, 140, 'AOU', 'Attopeu', '', NULL, '', 14.8209, 106.815, 1000028, '2018-08-13 17:46:47', 1, 1000028, '2018-08-13 17:22:19'),
(301, 140, 'HOE', 'Ban Hat Tai', '', NULL, '', 20.2578, 100.437, 1000028, '2018-08-13 17:45:55', 1, 1000028, '2018-08-13 17:24:14'),
(302, 140, 'KOG', 'Khong Island', '', NULL, '', 14.047, 105.833, 1000028, '2018-08-13 17:44:55', 1, 1000028, '2018-08-13 17:24:46'),
(303, 140, 'LXG', 'Luang Namtha', '', NULL, '', 20.95, 101.4, 1000028, '2018-08-13 17:43:27', 1, 1000028, '2018-08-13 17:26:28'),
(304, 140, 'LPQ', 'Luang Prabang', '', NULL, '', 19.8833, 102.133, 1000028, '2018-08-13 17:42:52', 1, 1000028, '2018-08-13 17:27:24'),
(305, 140, 'ODY', 'Muang Xay', '', NULL, '', 20.7, 101.817, 1000028, '2018-08-13 17:42:11', 1, 1000028, '2018-08-13 17:28:07'),
(306, 140, 'PKZ', 'Pakse', '', NULL, '', 15.1167, 105.783, 1000028, '2018-08-13 17:41:29', 1, 1000028, '2018-08-13 17:28:53'),
(307, 140, 'XKH', 'Phonsavan', '', NULL, '', 19.46, 103.18, 1000028, '2018-08-13 17:40:09', 1, 1000028, '2018-08-13 17:29:20'),
(308, 140, 'VNA', 'Saravane', '', NULL, '', 15.7167, 106.417, 1000028, '2018-08-13 17:31:17', 1, 1000028, '2018-08-13 17:30:05'),
(309, 140, 'NEU', 'Sam Neua', '', NULL, '', 20.4133, 104.048, 1000028, '2018-08-13 17:32:37', 1, 1000028, '2018-08-13 17:32:37'),
(310, 140, 'ZVK', 'Savannakhet', '', NULL, '', 16.55, 104.75, 1000028, '2018-08-13 17:33:47', 1, 1000028, '2018-08-13 17:33:47'),
(311, 140, 'ZBY', 'Sayaboury', '', NULL, '', 19.25, 101.75, 1000028, '2018-08-13 17:35:27', 1, 1000028, '2018-08-13 17:35:27'),
(312, 140, 'THK', 'Thakhek', '', NULL, '', 17.4032, 104.835, 1000028, '2018-08-13 17:37:05', 1, 1000028, '2018-08-13 17:37:05'),
(313, 140, 'VTE', 'Vientiane', '', NULL, '', 17.9667, 102.6, 1000028, '2018-08-13 17:39:00', 1, 1000028, '2018-08-13 17:39:00'),
(314, 140, 'PKB', 'Pak Beng', '', NULL, '', 19.8955, 101.132, 1000028, '2018-08-13 17:58:43', 1, 1000028, '2018-08-13 17:58:43'),
(315, 258, 'CDO', 'Cho Dok', '', NULL, '', 10.7, 105.117, 1000028, '2018-08-13 18:09:43', 1, 1000028, '2018-08-13 18:09:43'),
(316, 258, 'SAP', 'SA PA', '', NULL, '', 22.3402, 103.844, 1000028, '2018-08-13 18:13:05', 1, 1000028, '2018-08-13 18:13:05'),
(317, 171, 'MDL', 'Mandalay', '', NULL, '', 21.9574, 96.0891, 1000028, '2018-08-13 18:27:24', 1, 1000028, '2018-08-13 18:27:23'),
(318, 171, 'RGN', 'Yangon', '', NULL, '', 16.9072, 96.1331, 1000028, '2018-08-13 18:28:26', 1, 1000028, '2018-08-13 18:28:26'),
(319, 171, 'NYT', 'Naypyidaw', '', NULL, '', 19.6233, 96.2008, 1000028, '2018-08-13 18:30:13', 1, 1000028, '2018-08-13 18:30:13'),
(320, 171, 'BGO', 'Bago', '', NULL, '', 17.3011, 96.4281, 1000028, '2018-08-13 18:31:30', 1, 1000028, '2018-08-13 18:31:30'),
(321, 171, 'NYU', 'Bagan', '', NULL, '', 21.1786, 94.93, 1000028, '2018-08-13 18:32:33', 1, 1000028, '2018-08-13 18:32:33'),
(322, 171, 'HEH', 'Heho', '', NULL, '', 20.7469, 96.7919, 1000028, '2018-08-13 18:41:16', 1, 1000028, '2018-08-13 18:41:16'),
(323, 119, 'MAA', 'Chennai', '', NULL, '', 13.0833, 80.2667, 35, '2018-08-16 00:06:24', 1, 35, '2018-08-16 00:06:24'),
(324, 119, 'DEL', 'New Delhi', '', NULL, '', 28.61, 77.23, 35, '2018-08-16 00:08:06', 1, 35, '2018-08-16 00:08:06'),
(325, 119, 'BOM', 'Mumbai', '', NULL, '', 18.975, 72.8258, 35, '2018-08-16 00:09:27', 1, 35, '2018-08-16 00:09:27'),
(326, 119, 'CCU', 'Kolkata', '', NULL, '', 22.5667, 88.3667, 35, '2018-08-16 00:11:15', 1, 35, '2018-08-16 00:11:15'),
(327, 119, 'BLR', 'Bangalore', '', NULL, '', 12.9833, 77.5833, 35, '2018-08-16 00:17:43', 1, 35, '2018-08-16 00:17:43'),
(328, 119, 'HYD', 'Hyderabad', '', NULL, '', 17.37, 78.48, 35, '2018-08-16 00:19:02', 1, 35, '2018-08-16 00:19:02'),
(329, 119, 'AMD', 'Ahmedabad', '', NULL, '', 23.03, 72.58, 35, '2018-08-16 00:20:21', 1, 35, '2018-08-16 00:20:21'),
(330, 119, 'STV', 'Surat', '', NULL, '', 21.1702, 72.8311, 35, '2018-08-16 00:22:01', 1, 35, '2018-08-16 00:22:01'),
(331, 119, 'PNQ', 'Pune', '', NULL, '', 18.5203, 73.8567, 35, '2018-08-16 00:22:59', 1, 35, '2018-08-16 00:22:59'),
(332, 119, 'JAI', 'Jaipur', '', NULL, '', 26.9, 75.8, 35, '2018-08-16 00:24:14', 1, 35, '2018-08-16 00:24:13'),
(333, 119, 'LKO', 'Lucknow', '', NULL, '', 26.85, 80.95, 35, '2018-08-16 00:25:03', 1, 35, '2018-08-16 00:25:03'),
(334, 119, 'KNU', 'Kanpur', '', NULL, '', 26.4499, 80.3319, 35, '2018-08-16 00:26:55', 1, 35, '2018-08-16 00:26:55'),
(335, 119, 'NAG', 'Nagpur', '', NULL, '', 21.15, 79.09, 35, '2018-08-16 00:27:59', 1, 35, '2018-08-16 00:27:59'),
(336, 119, 'VTZ', 'Visakhapatnam', '', NULL, '', 17.7042, 83.2978, 35, '2018-08-16 00:29:06', 1, 35, '2018-08-16 00:29:06'),
(337, 119, 'IDR', 'Indore', '', NULL, '', 22.7167, 75.8472, 35, '2018-08-16 00:30:13', 1, 35, '2018-08-16 00:30:13'),
(338, 119, 'BHO', 'Bhopal', '', NULL, '', 23.25, 77.4167, 35, '2018-08-16 00:33:17', 1, 35, '2018-08-16 00:33:17'),
(339, 119, 'PAT', 'Patna', '', NULL, '', 25.6, 85.1, 35, '2018-08-16 00:34:12', 1, 35, '2018-08-16 00:34:12'),
(340, 119, 'BDQ', 'Vadodara', '', NULL, '', 22.3, 73.2, 35, '2018-08-16 00:35:21', 1, 35, '2018-08-16 00:35:21'),
(341, 119, 'LUH', 'Ludhiana', '', NULL, '', 30.91, 75.85, 35, '2018-08-16 00:37:16', 1, 35, '2018-08-16 00:37:16'),
(342, 119, 'CJB', 'Coimbatore', '', NULL, '', 11.0183, 76.9725, 35, '2018-08-16 00:38:18', 1, 35, '2018-08-16 00:38:18'),
(343, 119, 'AGR', 'Agra', '', NULL, '', 27.18, 78.02, 35, '2018-08-16 00:39:21', 1, 35, '2018-08-16 00:39:21'),
(344, 119, 'IXM', 'Madurai', '', NULL, '', 9.9, 78.1, 35, '2018-08-16 00:40:32', 1, 35, '2018-08-16 00:40:32'),
(345, 119, 'GOI', 'Goa', '', NULL, '', 15.5, 73.83, 35, '2018-08-16 00:47:39', 1, 35, '2018-08-16 00:47:39'),
(346, 119, 'IXC', 'Chandigarh', '', NULL, '', 30.75, 76.78, 35, '2018-08-16 00:48:50', 1, 35, '2018-08-16 00:48:50'),
(347, 119, 'GAY', 'Gaya', '', NULL, '', 24.75, 85.01, 35, '2018-08-16 00:49:53', 1, 35, '2018-08-16 00:49:53'),
(348, 119, 'GAU', 'Guwahati', '', NULL, '', 26.1833, 91.7333, 35, '2018-08-16 00:51:16', 1, 35, '2018-08-16 00:51:16'),
(349, 119, 'TIR', 'Tirupati', '', NULL, '', 13.65, 79.42, 35, '2018-08-16 00:52:31', 1, 35, '2018-08-16 00:52:31'),
(350, 119, 'VGA', 'Vijayawada', '', NULL, '', 16.5193, 80.6305, 35, '2018-08-16 00:53:58', 1, 35, '2018-08-16 00:53:58'),
(351, 119, 'KLH', 'Kolhapur', '', NULL, '', 16.6917, 74.2333, 1000029, '2018-08-17 21:05:49', 1, 1000029, '2018-08-17 21:05:49'),
(352, 33, '+61 2', 'Sydney ', '', NULL, '', NULL, NULL, 15, '2019-01-05 14:33:52', 1, 15, '2019-01-05 14:33:52'),
(353, 100, '+49', 'Munich (München)', '', NULL, '', NULL, NULL, 15, '2019-01-08 14:52:05', 1, 15, '2019-01-08 14:52:05'),
(354, 215, 'SIN', 'Singapore', '', NULL, '', 0, 0, 8, '2019-01-17 16:23:58', 1, 15, '2019-01-15 16:53:51'),
(355, 126, 'RO', 'Rovigo', '', NULL, '', 47.5172, 20.3906, 1, '2019-01-17 16:27:49', 1, 8, '2019-01-17 16:23:37'),
(356, 126, 'VRN', 'Verona', '', NULL, '', 45.3957, 10.8885, 8, '2019-01-17 16:28:51', 1, 8, '2019-01-17 16:28:51'),
(357, 126, 'BLQ', 'Bologna', '', NULL, '', 44.5354, 11.2887, 8, '2019-01-17 16:29:49', 1, 8, '2019-01-17 16:29:49'),
(358, 126, 'TSF', 'Treviso', '', NULL, '', 45.6484, 12.1944, 8, '2019-01-17 16:30:52', 1, 8, '2019-01-17 16:30:52'),
(359, 126, 'VCE', 'Venice', '', NULL, '', 45.5053, 12.3519, 8, '2019-01-17 16:32:00', 1, 8, '2019-01-17 16:32:00'),
(360, 126, 'ROM', 'Rome', '', NULL, '', 41.9, 12.5, 8, '2019-01-17 16:34:49', 1, 8, '2019-01-17 16:34:49'),
(361, 237, 'CNX', 'Chiang Mai', '', NULL, '', 18.7961, 98.9793, 1, '2019-01-28 15:37:39', 1, 1, '2019-01-28 15:36:49');

-- --------------------------------------------------------

--
-- Table structure for table `company_profile`
--

CREATE TABLE `company_profile` (
  `id` int(11) NOT NULL,
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
  `what_we_do` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `company_profile`
--

INSERT INTO `company_profile` (`id`, `logo`, `names`, `email`, `tel`, `website`, `address`, `description`, `created_date`, `created_by`, `updated_date`, `quotation_term_and_condition`, `updated_by`, `status`, `vattin`, `bill_and_payment`, `what_we_do`) VALUES
(1, '22', 'eOcambo Technology', 'info@eocambo.com', '(+855) 69 955 179', 'www.eocambo.com', 'Street 13, Treang Village, Slor Kram Commune, Krong Siem Reap, Cambodia.', 'eOcambo Technology started in 2014  with a small team partnering with accommodation providers to help  them take control of their online digital marketing and booking management using cutting edge technologies through our Hotel Link Solutions products.\r\n\r\nWe have been expanding and developing rapidly especially over the past 2 years with more solutions available to accommodation providers including offering high quality custom designed websites that become a major driver for any businesses online presence.\r\n\r\nThere is now a very large number of Online Travel Agents (OTA) and other online accommodation third parties where hotels and guesthouses can gain bookings, along with the massive use of Social Media by potential guests eOcambo Technology provides our clients with advice and the tools to navigate through often confusing technologies and increase their bookings and revenue.\r\n\r\neOcambo Technology is based in Siem Reap and is now the leading provider of online digital solutions for all Cambodian accommodation providers and most importantly we have a local Khmer Support Team who are always available to offer advice and back up for our clients.\r\n\r\nOur Mission: Always create innovative solutions that meet our clients expectations.\r\n\r\nOur Vision: Be recognised as the technology company that fulfills the clients needs.', '2019-07-23 09:18:01', 1, '2019-07-29 11:19:56', NULL, 1, 1, 'CAM-200341', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'We have our own application development team who during this year have created a unique online management system for Travel agents and Tour companies to improve their operations and profitability.\r\n\r\nThis exciting new technology solution will be launched in the second half of 2018 increasing the growth and reputation of eOcambo Technology as the leader in creating innovative solutions for the Cambodian Hospitality Industry.');

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE `contract` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
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
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contract_note`
--

CREATE TABLE `contract_note` (
  `id` int(11) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(11) DEFAULT NULL,
  `id_contract` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contract_type`
--

CREATE TABLE `contract_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `contract_description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
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
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `id_area`, `names`, `code`, `description`, `img`, `video_link`, `latitude`, `longitude`, `updated_by`, `updated_date`, `status`, `created_by`, `created_date`) VALUES
(21, 1, 'Afghanistan', 'AF', '', NULL, 'JDrScVo7aBs', 0, 0, 38, '2018-08-12 17:24:29', 1, 35, '2018-08-12 16:19:01'),
(22, 2, 'Albania', 'AL', '', NULL, '', 0, 0, 38, '2018-08-12 17:25:50', 1, 35, '2018-08-12 16:19:01'),
(23, 3, 'Algeria', 'DZ', '', NULL, '', 0, 0, 38, '2018-08-12 17:50:07', 1, 35, '2018-08-12 16:19:01'),
(24, 6, 'American Samoa', 'DS', '', NULL, '', 0, 0, 38, '2018-08-12 18:31:58', 1, 35, '2018-08-12 16:19:01'),
(25, 2, 'Andorra', 'AD', '', NULL, '', 0, 0, 38, '2018-08-12 17:26:21', 1, 35, '2018-08-12 16:19:01'),
(26, 3, 'Angola', 'AO', '', NULL, '', 0, 0, 38, '2018-08-12 17:50:29', 1, 35, '2018-08-12 16:19:01'),
(27, 1, 'Anguilla', 'AI', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(28, 1, 'Antarctica', 'AQ', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(29, 4, 'Antigua and Barbuda', 'AG', '', NULL, '', 0, 0, 38, '2018-08-12 18:15:11', 1, 35, '2018-08-12 16:19:01'),
(30, 5, 'Argentina', 'AR', '', NULL, '', 0, 0, 38, '2018-08-12 18:24:31', 1, 35, '2018-08-12 16:19:01'),
(31, 2, 'Armenia', 'AM', '', NULL, '', 0, 0, 38, '2018-08-12 17:26:40', 1, 35, '2018-08-12 16:19:01'),
(32, 1, 'Aruba', 'AW', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(33, 6, 'Australia', 'AU', '', NULL, '', 0, 0, 38, '2018-08-12 18:28:59', 1, 35, '2018-08-12 16:19:01'),
(34, 2, 'Austria', 'AT', '', NULL, '', 0, 0, 38, '2018-08-12 17:27:02', 1, 35, '2018-08-12 16:19:01'),
(35, 2, 'Azerbaijan', 'AZ', '', NULL, '', 0, 0, 38, '2018-08-12 17:27:31', 1, 35, '2018-08-12 16:19:01'),
(36, 4, 'Bahamas', 'BS', '', NULL, '', 0, 0, 38, '2018-08-12 18:15:50', 1, 35, '2018-08-12 16:19:01'),
(37, 1, 'Bahrain', 'BH', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(38, 1, 'Bangladesh', 'BD', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(39, 4, 'Barbados', 'BB', '', NULL, '', 0, 0, 38, '2018-08-12 18:16:08', 1, 35, '2018-08-12 16:19:01'),
(40, 2, 'Belarus', 'BY', '', NULL, '', 0, 0, 38, '2018-08-12 17:27:57', 1, 35, '2018-08-12 16:19:01'),
(41, 2, 'Belgium', 'BE', '', NULL, '', 0, 0, 38, '2018-08-12 17:28:16', 1, 35, '2018-08-12 16:19:01'),
(42, 4, 'Belize', 'BZ', '', NULL, '', 0, 0, 38, '2018-08-12 18:16:28', 1, 35, '2018-08-12 16:19:01'),
(43, 3, 'Benin', 'BJ', '', NULL, '', 0, 0, 38, '2018-08-12 17:51:11', 1, 35, '2018-08-12 16:19:01'),
(44, 1, 'Bermuda', 'BM', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(45, 1, 'Bhutan', 'BT', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(46, 5, 'Bolivia', 'BO', '', NULL, '', 0, 0, 38, '2018-08-12 18:24:54', 1, 35, '2018-08-12 16:19:01'),
(47, 2, 'Bosnia and Herzegovina', 'BA', '', NULL, '', 0, 0, 38, '2018-08-12 17:28:36', 1, 35, '2018-08-12 16:19:01'),
(48, 3, 'Botswana', 'BW', '', NULL, '', 0, 0, 38, '2018-08-12 17:51:30', 1, 35, '2018-08-12 16:19:01'),
(49, 1, 'Bouvet Island', 'BV', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(50, 5, 'Brazil', 'BR', '', NULL, '', 0, 0, 38, '2018-08-12 18:25:16', 1, 35, '2018-08-12 16:19:01'),
(51, 1, 'British Indian Ocean Territory', 'IO', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(52, 1, 'Brunei Darussalam', 'BN', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(53, 2, 'Bulgaria', 'BG', '', NULL, '', 0, 0, 38, '2018-08-12 17:29:23', 1, 35, '2018-08-12 16:19:01'),
(54, 3, 'Burkina Faso', 'BF', '', NULL, '', 0, 0, 38, '2018-08-12 17:52:12', 1, 35, '2018-08-12 16:19:01'),
(55, 3, 'Burundi', 'BI', '', NULL, '', 0, 0, 38, '2018-08-12 17:52:41', 1, 35, '2018-08-12 16:19:01'),
(56, 1, 'Cambodia', 'KH', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(57, 3, 'Cameroon', 'CM', '', NULL, '', 0, 0, 38, '2018-08-12 17:53:29', 1, 35, '2018-08-12 16:19:01'),
(58, 4, 'Canada', 'CA', '', NULL, '', 0, 0, 38, '2018-08-12 18:16:47', 1, 35, '2018-08-12 16:19:01'),
(59, 1, 'Cape Verde', 'CV', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(60, 1, 'Cayman Islands', 'KY', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(61, 3, 'Central African Republic', 'CF', '', NULL, '', 0, 0, 38, '2018-08-12 17:53:58', 1, 35, '2018-08-12 16:19:01'),
(62, 3, 'Chad', 'TD', '', NULL, '', 0, 0, 38, '2018-08-12 17:54:18', 1, 35, '2018-08-12 16:19:01'),
(63, 5, 'Chile', 'CL', '', NULL, '', 0, 0, 38, '2018-08-12 18:25:32', 1, 35, '2018-08-12 16:19:01'),
(64, 1, 'China', 'CN', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(65, 1, 'Christmas Island', 'CX', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(66, 1, 'Cocos (Keeling) Islands', 'CC', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(67, 5, 'Colombia', 'CO', '', NULL, '', 0, 0, 38, '2018-08-12 18:26:01', 1, 35, '2018-08-12 16:19:01'),
(68, 3, 'Comoros', 'KM', '', NULL, '', 0, 0, 38, '2018-08-12 17:54:40', 1, 35, '2018-08-12 16:19:01'),
(69, 3, 'Congo', 'CG', '', NULL, '', 0, 0, 38, '2018-08-12 17:55:49', 1, 35, '2018-08-12 16:19:01'),
(70, 1, 'Cook Islands', 'CK', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(71, 4, 'Costa Rica', 'CR', '', NULL, '', 0, 0, 38, '2018-08-12 18:17:05', 1, 35, '2018-08-12 16:19:01'),
(72, 2, 'Croatia (Hrvatska)', 'HR', '', NULL, '', 0, 0, 38, '2018-08-12 17:29:47', 1, 35, '2018-08-12 16:19:01'),
(73, 4, 'Cuba', 'CU', '', NULL, '', 0, 0, 38, '2018-08-12 18:17:23', 1, 35, '2018-08-12 16:19:01'),
(74, 2, 'Cyprus', 'CY', '', NULL, '', 0, 0, 38, '2018-08-12 17:30:07', 1, 35, '2018-08-12 16:19:01'),
(75, 2, 'Czech Republic', 'CZ', '', NULL, '', 0, 0, 38, '2018-08-12 17:30:29', 1, 35, '2018-08-12 16:19:01'),
(76, 2, 'Denmark', 'DK', '', NULL, '', 0, 0, 38, '2018-08-12 17:30:49', 1, 35, '2018-08-12 16:19:01'),
(77, 3, 'Djibouti', 'DJ', '', NULL, '', 0, 0, 38, '2018-08-12 17:56:46', 1, 35, '2018-08-12 16:19:01'),
(78, 4, 'Dominica', 'DM', '', NULL, '', 0, 0, 38, '2018-08-12 18:17:44', 1, 35, '2018-08-12 16:19:01'),
(79, 4, 'Dominican Republic', 'DO', '', NULL, '', 0, 0, 38, '2018-08-12 18:17:55', 1, 35, '2018-08-12 16:19:01'),
(80, 1, 'East Timor', 'TP', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(81, 5, 'Ecuador', 'EC', '', NULL, '', 0, 0, 38, '2018-08-12 18:26:22', 1, 35, '2018-08-12 16:19:01'),
(82, 3, 'Egypt', 'EG', '', NULL, '', 0, 0, 38, '2018-08-12 17:57:20', 1, 35, '2018-08-12 16:19:01'),
(83, 4, 'El Salvador', 'SV', '', NULL, '', 0, 0, 38, '2018-08-12 18:18:19', 1, 35, '2018-08-12 16:19:01'),
(84, 3, 'Equatorial Guinea', 'GQ', '', NULL, '', 0, 0, 38, '2018-08-12 17:57:47', 1, 35, '2018-08-12 16:19:01'),
(85, 3, 'Eritrea', 'ER', '', NULL, '', 0, 0, 38, '2018-08-12 17:58:09', 1, 35, '2018-08-12 16:19:01'),
(86, 2, 'Estonia', 'EE', '', NULL, '', 0, 0, 38, '2018-08-12 17:31:22', 1, 35, '2018-08-12 16:19:01'),
(87, 3, 'Ethiopia', 'ET', '', NULL, '', 0, 0, 38, '2018-08-12 17:58:53', 1, 35, '2018-08-12 16:19:01'),
(88, 1, 'Falkland Islands (Malvinas)', 'FK', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(89, 1, 'Faroe Islands', 'FO', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(90, 6, 'Fiji', 'FJ', '', NULL, '', 0, 0, 38, '2018-08-12 18:29:19', 1, 35, '2018-08-12 16:19:01'),
(91, 2, 'Finland', 'FI', '', NULL, '', 0, 0, 38, '2018-08-12 17:31:43', 1, 35, '2018-08-12 16:19:01'),
(92, 2, 'France', 'FR', '', NULL, '', 0, 0, 38, '2018-08-12 17:32:09', 1, 35, '2018-08-12 16:19:01'),
(93, 2, 'France, Metropolitan', 'FX', '', NULL, '', 0, 0, 38, '2018-08-12 17:32:21', 1, 35, '2018-08-12 16:19:01'),
(94, 1, 'French Guiana', 'GF', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(95, 1, 'French Polynesia', 'PF', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(96, 1, 'French Southern Territories', 'TF', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(97, 3, 'Gabon', 'GA', '', NULL, '', 0, 0, 38, '2018-08-12 17:59:35', 1, 35, '2018-08-12 16:19:01'),
(98, 3, 'Gambia', 'GM', '', NULL, '', 0, 0, 38, '2018-08-12 17:59:52', 1, 35, '2018-08-12 16:19:01'),
(99, 2, 'Georgia', 'GE', '', NULL, '', 0, 0, 38, '2018-08-12 17:32:51', 1, 35, '2018-08-12 16:19:01'),
(100, 2, 'Germany', 'DE', '', NULL, '', 0, 0, 38, '2018-08-12 17:33:33', 1, 35, '2018-08-12 16:19:01'),
(101, 3, 'Ghana', 'GH', '', NULL, '', 0, 0, 38, '2018-08-12 18:00:11', 1, 35, '2018-08-12 16:19:01'),
(102, 1, 'Gibraltar', 'GI', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(103, 1, 'Guernsey', 'GK', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(104, 2, 'Greece', 'GR', '', NULL, '', 0, 0, 38, '2018-08-12 17:34:02', 1, 35, '2018-08-12 16:19:01'),
(105, 1, 'Greenland', 'GL', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(106, 4, 'Grenada', 'GD', '', NULL, '', 0, 0, 38, '2018-08-12 18:18:42', 1, 35, '2018-08-12 16:19:01'),
(107, 1, 'Guadeloupe', 'GP', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(108, 1, 'Guam', 'GU', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(109, 4, 'Guatemala', 'GT', '', NULL, '', 0, 0, 38, '2018-08-12 18:19:05', 1, 35, '2018-08-12 16:19:01'),
(110, 3, 'Guinea', 'GN', '', NULL, '', 0, 0, 38, '2018-08-12 18:00:42', 1, 35, '2018-08-12 16:19:01'),
(111, 3, 'Guinea-Bissau', 'GW', '', NULL, '', 0, 0, 38, '2018-08-12 18:00:55', 1, 35, '2018-08-12 16:19:01'),
(112, 5, 'Guyana', 'GY', '', NULL, '', 0, 0, 38, '2018-08-12 18:26:41', 1, 35, '2018-08-12 16:19:01'),
(113, 4, 'Haiti', 'HT', '', NULL, '', 0, 0, 38, '2018-08-12 18:19:22', 1, 35, '2018-08-12 16:19:01'),
(114, 1, 'Heard and Mc Donald Islands', 'HM', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(115, 4, 'Honduras', 'HN', '', NULL, '', 0, 0, 38, '2018-08-12 18:19:39', 1, 35, '2018-08-12 16:19:01'),
(116, 1, 'Hong Kong', 'HK', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(117, 2, 'Hungary', 'HU', '', NULL, '', 0, 0, 38, '2018-08-12 17:34:27', 1, 35, '2018-08-12 16:19:01'),
(118, 2, 'Iceland', 'IS', '', NULL, '', 0, 0, 38, '2018-08-12 17:34:46', 1, 35, '2018-08-12 16:19:01'),
(119, 1, 'India', 'IN', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(120, 1, 'Isle of Man', 'IM', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(121, 1, 'Indonesia', 'ID', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(122, 1, 'Iran (Islamic Republic of)', 'IR', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(123, 1, 'Iraq', 'IQ', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(124, 2, 'Ireland', 'IE', '', NULL, '', 0, 0, 38, '2018-08-12 17:35:09', 1, 35, '2018-08-12 16:19:01'),
(125, 1, 'Israel', 'IL', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(126, 2, 'Italy', 'IT', '', NULL, '', 0, 0, 38, '2018-08-12 17:35:37', 1, 35, '2018-08-12 16:19:01'),
(127, 1, 'Ivory Coast', 'CI', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(128, 1, 'Jersey', 'JE', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(129, 4, 'Jamaica', 'JM', '', NULL, '', 0, 0, 38, '2018-08-12 18:20:09', 1, 35, '2018-08-12 16:19:01'),
(130, 1, 'Japan', 'JP', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(131, 1, 'Jordan', 'JO', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(132, 2, 'Kazakhstan', 'KZ', '', NULL, '', 0, 0, 38, '2018-08-12 17:36:08', 1, 35, '2018-08-12 16:19:01'),
(133, 3, 'Kenya', 'KE', '', NULL, '', 0, 0, 38, '2018-08-12 18:01:30', 1, 35, '2018-08-12 16:19:01'),
(134, 6, 'Kiribati', 'KI', '', NULL, '', 0, 0, 38, '2018-08-12 18:29:36', 1, 35, '2018-08-12 16:19:01'),
(135, 1, 'Korea, Democratic People\'s Republic of', 'KP', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(136, 1, 'Korea, Republic of', 'KR', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(137, 2, 'Kosovo', 'XK', '', NULL, '', 0, 0, 38, '2018-08-12 17:36:29', 1, 35, '2018-08-12 16:19:01'),
(138, 1, 'Kuwait', 'KW', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(139, 1, 'Kyrgyzstan', 'KG', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(140, 1, 'Laos', 'LA', '', NULL, '', 0, 0, 1000028, '2018-08-13 17:23:16', 1, 35, '2018-08-12 16:19:01'),
(141, 2, 'Latvia', 'LV', '', NULL, '', 0, 0, 38, '2018-08-12 17:36:53', 1, 35, '2018-08-12 16:19:01'),
(142, 1, 'Lebanon', 'LB', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(143, 3, 'Lesotho', 'LS', '', NULL, '', 0, 0, 38, '2018-08-12 18:01:49', 1, 35, '2018-08-12 16:19:01'),
(144, 3, 'Liberia', 'LR', '', NULL, '', 0, 0, 38, '2018-08-12 18:02:07', 1, 35, '2018-08-12 16:19:01'),
(145, 3, 'Libyan Arab Jamahiriya', 'LY', '', NULL, '', 0, 0, 38, '2018-08-12 18:02:25', 1, 35, '2018-08-12 16:19:01'),
(146, 2, 'Liechtenstein', 'LI', '', NULL, '', 0, 0, 38, '2018-08-12 17:37:12', 1, 35, '2018-08-12 16:19:01'),
(147, 2, 'Lithuania', 'LT', '', NULL, '', 0, 0, 38, '2018-08-12 17:38:01', 1, 35, '2018-08-12 16:19:01'),
(148, 2, 'Luxembourg', 'LU', '', NULL, '', 0, 0, 38, '2018-08-12 17:38:42', 1, 35, '2018-08-12 16:19:01'),
(149, 1, 'Macau', 'MO', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(150, 2, 'Macedonia', 'MK', '', NULL, '', 0, 0, 38, '2018-08-12 17:39:10', 1, 35, '2018-08-12 16:19:01'),
(151, 3, 'Madagascar', 'MG', '', NULL, '', 0, 0, 38, '2018-08-12 18:02:42', 1, 35, '2018-08-12 16:19:01'),
(152, 3, 'Malawi', 'MW', '', NULL, '', 0, 0, 38, '2018-08-12 18:03:01', 1, 35, '2018-08-12 16:19:01'),
(153, 1, 'Malaysia', 'MY', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(154, 1, 'Maldives', 'MV', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(155, 3, 'Mali', 'ML', '', NULL, '', 0, 0, 38, '2018-08-12 18:03:19', 1, 35, '2018-08-12 16:19:01'),
(156, 2, 'Malta', 'MT', '', NULL, '', 0, 0, 38, '2018-08-12 17:39:34', 1, 35, '2018-08-12 16:19:01'),
(157, 6, 'Marshall Islands', 'MH', '', NULL, '', 0, 0, 38, '2018-08-12 18:29:55', 1, 35, '2018-08-12 16:19:01'),
(158, 1, 'Martinique', 'MQ', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(159, 3, 'Mauritania', 'MR', '', NULL, '', 0, 0, 38, '2018-08-12 18:03:55', 1, 35, '2018-08-12 16:19:01'),
(160, 3, 'Mauritius', 'MU', '', NULL, '', 0, 0, 38, '2018-08-12 18:04:17', 1, 35, '2018-08-12 16:19:01'),
(161, 1, 'Mayotte', 'TY', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(162, 4, 'Mexico', 'MX', '', NULL, '', 0, 0, 38, '2018-08-12 18:20:31', 1, 35, '2018-08-12 16:19:01'),
(163, 6, 'Micronesia, Federated States of', 'FM', '', NULL, '', 0, 0, 38, '2018-08-12 18:30:13', 1, 35, '2018-08-12 16:19:01'),
(164, 2, 'Moldova, Republic of', 'MD', '', NULL, '', 0, 0, 38, '2018-08-12 17:39:57', 1, 35, '2018-08-12 16:19:01'),
(165, 2, 'Monaco', 'MC', '', NULL, '', 0, 0, 38, '2018-08-12 17:40:15', 1, 35, '2018-08-12 16:19:01'),
(166, 1, 'Mongolia', 'MN', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(167, 2, 'Montenegro', 'ME', '', NULL, '', 0, 0, 38, '2018-08-12 17:40:35', 1, 35, '2018-08-12 16:19:01'),
(168, 1, 'Montserrat', 'MS', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(169, 3, 'Morocco', 'MA', '', NULL, '', 0, 0, 38, '2018-08-12 18:04:37', 1, 35, '2018-08-12 16:19:01'),
(170, 3, 'Mozambique', 'MZ', '', NULL, '', 0, 0, 38, '2018-08-12 18:04:55', 1, 35, '2018-08-12 16:19:01'),
(171, 1, 'Myanmar', 'MM', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(172, 3, 'Namibia', 'NA', '', NULL, '', 0, 0, 38, '2018-08-12 18:05:12', 1, 35, '2018-08-12 16:19:01'),
(173, 6, 'Nauru', 'NR', '', NULL, '', 0, 0, 38, '2018-08-12 18:30:32', 1, 35, '2018-08-12 16:19:01'),
(174, 1, 'Nepal', 'NP', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(175, 2, 'Netherlands', 'NL', '', NULL, '', 0, 0, 38, '2018-08-12 17:41:05', 1, 35, '2018-08-12 16:19:01'),
(176, 2, 'Netherlands Antilles', 'AN', '', NULL, '', 0, 0, 38, '2018-08-12 17:41:17', 1, 35, '2018-08-12 16:19:01'),
(177, 1, 'New Caledonia', 'NC', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(178, 6, 'New Zealand', 'NZ', '', NULL, '', 0, 0, 38, '2018-08-12 18:30:52', 1, 35, '2018-08-12 16:19:01'),
(179, 4, 'Nicaragua', 'NI', '', NULL, '', 0, 0, 38, '2018-08-12 18:20:50', 1, 35, '2018-08-12 16:19:01'),
(180, 3, 'Niger', 'NE', '', NULL, '', 0, 0, 38, '2018-08-12 18:05:30', 1, 35, '2018-08-12 16:19:01'),
(181, 3, 'Nigeria', 'NG', '', NULL, '', 0, 0, 38, '2018-08-12 18:05:42', 1, 35, '2018-08-12 16:19:01'),
(182, 1, 'Niue', 'NU', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(183, 1, 'Norfolk Island', 'NF', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(184, 1, 'Northern Mariana Islands', 'MP', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(185, 2, 'Norway', 'NO', '', NULL, '', 0, 0, 38, '2018-08-12 17:41:50', 1, 35, '2018-08-12 16:19:01'),
(186, 1, 'Oman', 'OM', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(187, 1, 'Pakistan', 'PK', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(188, 6, 'Palau', 'PW', '', NULL, '', 0, 0, 38, '2018-08-12 18:31:14', 1, 35, '2018-08-12 16:19:01'),
(189, 1, 'Palestine', 'PS', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(190, 4, 'Panama', 'PA', '', NULL, '', 0, 0, 38, '2018-08-12 18:21:18', 1, 35, '2018-08-12 16:19:01'),
(191, 6, 'Papua New Guinea', 'PG', '', NULL, '', 0, 0, 38, '2018-08-12 18:31:39', 1, 35, '2018-08-12 16:19:01'),
(192, 5, 'Paraguay', 'PY', '', NULL, '', 0, 0, 38, '2018-08-12 18:27:08', 1, 35, '2018-08-12 16:19:01'),
(193, 5, 'Peru', 'PE', '', NULL, '', 0, 0, 38, '2018-08-12 18:27:27', 1, 35, '2018-08-12 16:19:01'),
(194, 1, 'Philippines', 'PH', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(195, 1, 'Pitcairn', 'PN', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(196, 2, 'Poland', 'PL', '', NULL, '', 0, 0, 38, '2018-08-12 17:42:25', 1, 35, '2018-08-12 16:19:01'),
(197, 2, 'Portugal', 'PT', '', NULL, '', 0, 0, 38, '2018-08-12 17:42:43', 1, 35, '2018-08-12 16:19:01'),
(198, 1, 'Puerto Rico', 'PR', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(199, 1, 'Qatar', 'QA', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(200, 1, 'Reunion', 'RE', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(201, 2, 'Romania', 'RO', '', NULL, '', 0, 0, 38, '2018-08-12 17:43:03', 1, 35, '2018-08-12 16:19:01'),
(202, 2, 'Russian Federation', 'RU', '', NULL, '', 0, 0, 38, '2018-08-12 17:43:22', 1, 35, '2018-08-12 16:19:01'),
(203, 3, 'Rwanda', 'RW', '', NULL, '', 0, 0, 38, '2018-08-12 18:06:21', 1, 35, '2018-08-12 16:19:01'),
(204, 4, 'Saint Kitts and Nevis', 'KN', '', NULL, '', 0, 0, 38, '2018-08-12 18:21:42', 1, 35, '2018-08-12 16:19:01'),
(205, 4, 'Saint Lucia', 'LC', '', NULL, '', 0, 0, 38, '2018-08-12 18:21:59', 1, 35, '2018-08-12 16:19:01'),
(206, 4, 'Saint Vincent and the Grenadines', 'VC', '', NULL, '', 0, 0, 38, '2018-08-12 18:22:23', 1, 35, '2018-08-12 16:19:01'),
(207, 6, 'Samoa', 'WS', '', NULL, '', 0, 0, 38, '2018-08-12 18:32:16', 1, 35, '2018-08-12 16:19:01'),
(208, 2, 'San Marino', 'SM', '', NULL, '', 0, 0, 38, '2018-08-12 17:43:50', 1, 35, '2018-08-12 16:19:01'),
(209, 3, 'Sao Tome and Principe', 'ST', '', NULL, '', 0, 0, 38, '2018-08-12 18:06:40', 1, 35, '2018-08-12 16:19:01'),
(210, 1, 'Saudi Arabia', 'SA', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(211, 3, 'Senegal', 'SN', '', NULL, '', 0, 0, 38, '2018-08-12 18:07:01', 1, 35, '2018-08-12 16:19:01'),
(212, 2, 'Serbia', 'RS', '', NULL, '', 0, 0, 38, '2018-08-12 17:44:37', 1, 35, '2018-08-12 16:19:01'),
(213, 3, 'Seychelles', 'SC', '', NULL, '', 0, 0, 38, '2018-08-12 18:07:29', 1, 35, '2018-08-12 16:19:01'),
(214, 3, 'Sierra Leone', 'SL', '', NULL, '', 0, 0, 38, '2018-08-12 18:07:48', 1, 35, '2018-08-12 16:19:01'),
(215, 1, 'Singapore', 'SG', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(216, 2, 'Slovakia', 'SK', '', NULL, '', 0, 0, 38, '2018-08-12 17:45:20', 1, 35, '2018-08-12 16:19:01'),
(217, 2, 'Slovenia', 'SI', '', NULL, '', 0, 0, 38, '2018-08-12 17:46:01', 1, 35, '2018-08-12 16:19:01'),
(218, 6, 'Solomon Islands', 'SB', '', NULL, '', 0, 0, 38, '2018-08-12 18:32:37', 1, 35, '2018-08-12 16:19:01'),
(219, 3, 'Somalia', 'SO', '', NULL, '', 0, 0, 38, '2018-08-12 18:03:40', 1, 35, '2018-08-12 16:19:01'),
(220, 3, 'South Africa', 'ZA', '', NULL, '', 0, 0, 38, '2018-08-12 18:08:30', 1, 35, '2018-08-12 16:19:01'),
(221, 2, 'South Georgia South Sandwich Islands', 'GS', '', NULL, '', 0, 0, 38, '2018-08-12 17:33:10', 1, 35, '2018-08-12 16:19:01'),
(222, 3, 'South Sudan', 'SS', '', NULL, '', 0, 0, 38, '2018-08-12 18:11:16', 1, 35, '2018-08-12 16:19:01'),
(223, 2, 'Spain', 'ES', '', NULL, '', 0, 0, 38, '2018-08-12 17:46:15', 1, 35, '2018-08-12 16:19:01'),
(224, 1, 'Sri Lanka', 'LK', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(225, 1, 'St. Helena', 'SH', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(226, 1, 'St. Pierre and Miquelon', 'PM', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(227, 3, 'Sudan', 'SD', '', NULL, '', 0, 0, 38, '2018-08-12 18:11:35', 1, 35, '2018-08-12 16:19:01'),
(228, 5, 'Suriname', 'SR', '', NULL, '', 0, 0, 38, '2018-08-12 18:27:46', 1, 35, '2018-08-12 16:19:01'),
(229, 1, 'Svalbard and Jan Mayen Islands', 'SJ', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(230, 1, 'Swaziland', 'SZ', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(231, 2, 'Sweden', 'SE', '', NULL, '', 0, 0, 38, '2018-08-12 17:46:34', 1, 35, '2018-08-12 16:19:01'),
(232, 2, 'Switzerland', 'CH', '', NULL, '', 0, 0, 38, '2018-08-12 17:46:58', 1, 35, '2018-08-12 16:19:01'),
(233, 1, 'Syrian Arab Republic', 'SY', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(234, 1, 'Taiwan', 'TW', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(235, 1, 'Tajikistan', 'TJ', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(236, 3, 'Tanzania, United Republic of', 'TZ', '', NULL, '', 0, 0, 38, '2018-08-12 18:12:48', 1, 35, '2018-08-12 16:19:01'),
(237, 1, 'Thailand', 'TH', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(238, 3, 'Togo', 'TG', '', NULL, '', 0, 0, 38, '2018-08-12 18:13:10', 1, 35, '2018-08-12 16:19:01'),
(239, 1, 'Tokelau', 'TK', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(240, 6, 'Tonga', 'TO', '', NULL, '', 0, 0, 38, '2018-08-12 18:33:08', 1, 35, '2018-08-12 16:19:01'),
(241, 4, 'Trinidad and Tobago', 'TT', '', NULL, '', 0, 0, 38, '2018-08-12 18:22:43', 1, 35, '2018-08-12 16:19:01'),
(242, 3, 'Tunisia', 'TN', '', NULL, '', 0, 0, 38, '2018-08-12 18:13:30', 1, 35, '2018-08-12 16:19:01'),
(243, 2, 'Turkey', 'TR', '', NULL, '', 0, 0, 38, '2018-08-12 17:47:55', 1, 35, '2018-08-12 16:19:01'),
(244, 1, 'Turkmenistan', 'TM', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(245, 1, 'Turks and Caicos Islands', 'TC', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(246, 6, 'Tuvalu', 'TV', '', NULL, '', 0, 0, 38, '2018-08-12 18:33:29', 1, 35, '2018-08-12 16:19:01'),
(247, 3, 'Uganda', 'UG', '', NULL, '', 0, 0, 38, '2018-08-12 18:13:49', 1, 35, '2018-08-12 16:19:01'),
(248, 2, 'Ukraine', 'UA', '', NULL, '', 0, 0, 38, '2018-08-12 17:48:22', 1, 35, '2018-08-12 16:19:01'),
(249, 1, 'United Arab Emirates', 'AE', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(250, 2, 'United Kingdom', 'GB', '', NULL, '', 0, 0, 38, '2018-08-12 17:49:03', 1, 35, '2018-08-12 16:19:01'),
(251, 4, 'United States', 'US', '', NULL, '', 0, 0, 38, '2018-08-12 18:23:19', 1, 35, '2018-08-12 16:19:01'),
(252, 4, 'United States minor outlying islands', 'UM', '', NULL, '', 0, 0, 38, '2018-08-12 18:23:31', 1, 35, '2018-08-12 16:19:01'),
(253, 5, 'Uruguay', 'UY', '', NULL, '', 0, 0, 38, '2018-08-12 18:28:08', 1, 35, '2018-08-12 16:19:01'),
(254, 1, 'Uzbekistan', 'UZ', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(255, 6, 'Vanuatu', 'VU', '', NULL, '', 0, 0, 38, '2018-08-12 18:33:47', 1, 35, '2018-08-12 16:19:01'),
(256, 2, 'Vatican City State', 'VA', '', NULL, '', 0, 0, 38, '2018-08-12 17:49:24', 1, 35, '2018-08-12 16:19:01'),
(257, 5, 'Venezuela', 'VE', '', NULL, '', 0, 0, 38, '2018-08-12 18:28:26', 1, 35, '2018-08-12 16:19:01'),
(258, 1, 'Vietnam', 'VN', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(259, 1, 'Virgin Islands (British)', 'VG', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(260, 1, 'Virgin Islands (U.S.)', 'VI', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(261, 1, 'Wallis and Futuna Islands', 'WF', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(262, 1, 'Western Sahara', 'EH', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(263, 1, 'Yemen', 'YE', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(264, 1, 'Zaire', 'ZR', NULL, NULL, NULL, 0, 0, 35, '2018-08-12 16:19:01', 1, 35, '2018-08-12 16:19:01'),
(265, 3, 'Zambia', 'ZM', '', NULL, '', 0, 0, 38, '2018-08-12 18:14:10', 1, 35, '2018-08-12 16:19:01'),
(266, 3, 'Zimbabwe', 'ZW', '', NULL, '', 0, 0, 38, '2018-08-12 18:14:28', 1, 35, '2018-08-12 16:19:01');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `name`, `status`) VALUES
(1, 'USD $', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_group`
--

CREATE TABLE `customer_group` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `customer_group`
--

INSERT INTO `customer_group` (`id`, `name`, `note`, `created_by`, `created_date`, `updated_date`, `updated_by`, `status`) VALUES
(1, 'VIP', NULL, NULL, NULL, NULL, NULL, 1),
(2, 'Wholesaler', NULL, NULL, NULL, NULL, NULL, 1),
(3, 'High Budget', NULL, NULL, NULL, NULL, NULL, 1),
(4, 'Low Budget', NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_invoice`
--

CREATE TABLE `customer_invoice` (
  `id` int(11) NOT NULL,
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
  `is_converted_from_proposal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_invoice_data`
--

CREATE TABLE `customer_invoice_data` (
  `id` int(11) NOT NULL,
  `id_customer_invoice` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `qty` int(11) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `discount_type` int(11) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_invoice_data`
--

INSERT INTO `customer_invoice_data` (`id`, `id_customer_invoice`, `id_item`, `item_name`, `description`, `qty`, `rate`, `discount_type`, `discount_amount`, `amount`) VALUES
(2, 1, 1, 'Premium Website (Standard)', '', 1, '1000.00', 1, '0.00', '1000.00');

-- --------------------------------------------------------

--
-- Table structure for table `customer_invoice_tag`
--

CREATE TABLE `customer_invoice_tag` (
  `id` int(11) NOT NULL,
  `id_customer_invoice` int(11) DEFAULT NULL,
  `id_tag` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `customer_payment`
--

CREATE TABLE `customer_payment` (
  `id` int(11) NOT NULL,
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
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_profile`
--

CREATE TABLE `customer_profile` (
  `id` int(11) NOT NULL,
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
  `deactivated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `customer_profile`
--

INSERT INTO `customer_profile` (`id`, `customer_name`, `company_name`, `phone_number`, `email_address`, `latitute`, `longitute`, `address`, `id_country`, `id_city`, `group_names`, `billing_address`, `id_billing_city`, `id_billing_country`, `shipping_address`, `id_shipping_city`, `id_shipping_country`, `status`, `created_by`, `created_date`, `img_url`, `updated_date`, `updated_by`, `zip_code`, `customer_status`, `website_url`, `accommodation_type`, `star_rating`, `number_of_rooms`, `sale_date`, `accomodation_status`, `lived_date`, `passed_by`, `handle_by`, `deactivated_at`, `deactivated_reason`, `deactivated_requested_by`, `deactivated_requested_contact_detail`, `deactivated_by`) VALUES
(1, 'Mr. Senghak KOL', '1920 Hotel ', '+855 99 915 918', 'info@1920hotel.com', NULL, NULL, 'Street #9, Old Market, Siem Reap, Cambodia', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1', NULL, 'http://the1920.com', 1, '4.00', 10, '2016-05-23', 2, NULL, 2, 5, '', '', '', '', 4),
(2, 'Mr. Korn Kosal', 'Advaya Residence', '+855 17 465 120', 'gm@advayaresidence.com', NULL, NULL, 'Vihear Chin Village, Svay Dangkum, Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://advayaresidence.com', 1, '5.00', 17, '2018-08-21', 2, NULL, 2, 4, '', '', '', '', 4),
(3, 'Mr. Chhun Sochetra', 'Adventure Hostel Siem Reap', '+855 12 380 484', 'chhunsochetra@gmail.com', NULL, NULL, 'Siem Reap, Cambodia', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://adventurehostelsiemreap.com', 2, '3.00', 20, '2018-08-21', 2, NULL, 2, 4, '', '', '', '', 4),
(4, 'Mr. Christian Husel', 'Alibi Guesthouse ', '+855 88 890 1590', 'info@alibiguesthouse.com', NULL, NULL, 'Royal Palace, Sothearos Blvd', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://alibiguesthouse.com', 4, '4.00', 10, '2018-08-21', 2, NULL, 2, 4, '', '', '', '', 4),
(5, 'Mr. Sok Chanthou', 'Alison Angkor Boutique Villa & Resort', '+855 63 968 808', 'info@alisonangkor.com, booking@alisonangkor.com', NULL, NULL, '#826, Street 22, Wat Bo Village', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://alisonangkor.com', 7, '4.00', 12, '2015-03-25', 3, NULL, 2, 5, '2016-10-26', '', '', '', 4),
(6, 'Mrs. Naomi Basler', 'Amatao Tropical Residence', '+855 12 590 645', 'gm@amatao.com, rsvn@amatao.com, welcome@amatao.com', NULL, NULL, 'Svay Prey Village', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://amatao.com', 8, '4.00', 4, '2017-10-02', 2, NULL, 2, 4, '', '', '', '', 4),
(7, 'Mr. Vutha Hour ', 'Anachak Boutique Hotel', '+855 63 769 898', 'info@anachakboutiquehotel.com', NULL, NULL, 'Steung Thmey village, Svay Dungkom commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://anachakboutiquehotel.com', 1, '4.00', 19, '2015-02-07', 3, NULL, 2, 5, '', '', '', '', 4),
(8, 'Pen Sokema', 'Angkor Boutique Villa', '+855 12 914 909', 'booking@angkorboutiquevilla.com', NULL, NULL, 'No.335, Wat Damnak, Sala Kamreuok', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://angkorboutiquevilla.com', 7, '3.00', 8, '2014-10-25', 3, NULL, 2, 5, '2016-10-26', '', '', '', 4),
(9, 'Mr. Eng Borey ', 'Angkor Century Resort and Spa', '+855 63 963 777', 'info@angkorcentury.com', NULL, NULL, 'Komay Road, Khum Svay Dangkom', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://angkorcentury.com', 1, '5.00', 190, '2014-10-01', 2, NULL, 2, 4, '', '', '', '', 4),
(10, 'Mr. Meas Sopheap', 'Angkor Heart Bungalow', '+855 92 508 863', 'info@angkorheartbungalow.com', NULL, NULL, 'Ring Road Krovat - krong Street,Sangkat svay dangkum,', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://angkorheartbungalow.com', 1, '3.00', 7, '2018-02-02', 2, '1970-01-01', 2, 4, '', '', '', '', 4),
(11, 'Cheung Sokha', 'Angkor Holiday Hotel', '+855 63 966 777', 'gm@angkorholidayhotel.com, reservation@angkorholid', NULL, NULL, 'National Road No.6,', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1710', NULL, 'http://angkorholidayhotel.com', 1, '4.00', 162, '2014-10-25', 3, '1970-01-01', 2, 5, '', 'They want to test other company system,', 'Mr. Kakada (e-commerce)', '+855 63 966 777', 4),
(12, 'Ms. Sorphia Nguon', 'Angkor Howard Hotel and Convention Center', '+855 63 965 000', 'info@angkorhoward.com', NULL, NULL, 'National Road No 6 | Phum Kaksekam, Khum Sror Nge, Siem Reap Province', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://angkorhoward.com', 1, '5.00', 343, '2016-04-29', 2, NULL, 2, 4, '', '', '', '', 4),
(13, 'Mr. Noun Leng', 'Angkor International Hotel', '+855 23 217 609', 'angkorhotel11@gmail.com', NULL, NULL, '#50, Street 148', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '122022', NULL, 'http://angkorinternationalhotel.com', 1, '3.00', 78, '2015-11-17', 3, NULL, 2, 5, '2018-11-05', 'Auto Deactivate', 'Mr. Noun Leng', '+855 17 518 827\r\n+855 23 217 609', 4),
(14, 'Mr. Daravichhay SENG ', 'Angkor Miracle Resort & Spa', '+855 63 969 900', 'em@angkormiracle.com, ee@angkormiracle.com, reserv', NULL, NULL, 'National Road No. 6A. Khum Sra Nge (opposite of Cambodian cultural Village) Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://angkormiracle.com/resort', 6, '5.00', 247, '2015-11-30', 3, NULL, 2, 5, '', '', '', '', 4),
(15, 'Mr. Piseth', 'Angkor Mithona Guesthouse', '+855 23 990 323', 'info@angkormithonaguesthouse.com', NULL, NULL, '# 19, Street 172 L13, Sangkat Chey Chumneah, Phsar Kandal, Khan Daun Penh', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://angkormithonaguesthouse.com', 9, '2.00', 34, '2015-08-15', 3, NULL, 2, 5, '', '', '', '', 4),
(16, 'Mr. Peter Phoeng', 'Angkor Pearl Hotel', '+855 92 571 520', 'pphoeng@angkorpearl.com', NULL, NULL, '', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1710', NULL, 'http://angkorpearl.com', 1, '3.00', 45, '2014-12-25', 3, NULL, 2, 5, '', '', '', '', 4),
(17, 'Mr. Meng Dy', 'Angkor Rendezvous Villa', '+855 77 588 788', 'millmengdy@gmail.com', NULL, NULL, 'Neelka Way', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://angkorrendezvousvillas.com', 3, '5.00', 10, '2017-02-01', 3, NULL, 2, 5, '', '', '', '', 4),
(18, 'Ms. Chenda Lam', 'Angkor Siesta Villa', '+855 70 808 182', 'info@angkorsiestavilla.com', NULL, NULL, '#12, Phum Beung Don Pa, Sangkat Slor Kram', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17251', NULL, 'http://angkorsiestavilla.com', 7, '4.00', 7, '2018-01-19', 3, '1970-01-01', 2, 4, '2018-11-30', 'Dear Maranet,\r\n\r\nGreetings from Angkor Siesta Villa\r\n\r\nI am writing to you to inform you that we have disconnected your Channel Manager & IBE (hotellinksolutions) from our hotel recently as we do not have any budget to continue on this.', 'Mr. Sophath ', '012 981 089 ', 5),
(19, 'Angkor Twinkle Boutique Villa', 'Angkor Twinkle Boutique Villa', '+855 63 963 368', 'booking@angkortwinklevilla.com', NULL, NULL, 'Lok Taneuy (St.), Phum Wat Bo, Sangkat Sala Kamreuk', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://angkortwinkleboutiquevilla.com', 7, '3.50', 22, '2016-01-12', 3, NULL, 2, 5, '', '', '', '', 4),
(20, 'Mr. Duy Sophal', 'Anise Hotel', '+855 23 222 522', 'reservation@anisehotel.com.kh', NULL, NULL, 'Nº 2C, St 278 off 57, Beoung Keng Kang I, Chamkamorn', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://anisehotel.com.kh', 1, '3.00', 18, '2015-05-11', 2, NULL, 2, 4, '', '', '', '', 4),
(21, 'Mr. Sophal', 'Anise Villa Boutique Hotel', '+855 23 225 400', ' reservation@anisevilla.com', NULL, NULL, '18 Street 400, Beoung Keng Kang 1', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://anisevilla.com', 1, '3.00', 21, '2015-03-13', 2, NULL, 2, 4, '', '', '', '', 4),
(22, 'Mr. Vann Enghong', 'Apsara Centrepole Hotel', '+855 63 968 098', 'book@apsaracentrepole.com', NULL, NULL, '522 Svay Dungkum, Old Sok San Street', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://apsaracentrepole.com', 1, '3.50', 19, '2016-10-01', 2, NULL, 2, 5, '', '', '', '', 4),
(23, 'Mr. Suy Sophanith', 'Apsara Residence', '+855 63 968 668', 'book@apsara-residence.com', NULL, NULL, 'St. 27, Wat Bo Village, Sala Kamreuk Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://apsara-residence.com', 1, '4.00', 22, '2016-10-01', 2, NULL, 2, 5, '', '', '', '', 4),
(24, 'Ms. Tep Sothyda', 'Aqua Boutique Guesthouse', '+855 77 528 530', 'info@aqua-boutique-guesthouse.com', NULL, NULL, 'No.126, Street 63', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://aqua-boutique-guesthouse.com', 9, '0.00', 20, '2015-03-31', 3, NULL, 2, 5, '', '', '', '', 4),
(25, 'Ms. Nora', 'Asarita Angkor Resort & Spa', '+855 63 768 444', 'sales@asaritaangkor.com, asaritaangkor@gmail.com', NULL, NULL, 'National Road No 6A, Khum Sra Nge', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17260', NULL, 'http://asaritaangkor.com', 6, '4.00', 33, '2017-01-16', 3, NULL, 2, 5, '', '', '', '', 4),
(26, 'Mr. Komsorth', 'Ashia Hotel & Lounge', '+855 63 968 960', 'info@ashiahotel.com', NULL, NULL, 'P Charles De Gaulle, Krong Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://ashiahotel.com', 1, '3.00', 20, '2017-07-11', 2, NULL, 2, 4, '', '', '', '', 4),
(27, 'Simen Julner', 'Babel Guesthouse', '+855 78 858 469', 'babelsiemreap@gmail.com', NULL, NULL, 'No.738 Wat Bo Road, Salakamroeuk', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1710', NULL, 'http://babel-siemreap.com', 9, '2.00', 24, '2014-12-25', 2, NULL, 2, 4, '', '', '', '', 4),
(28, 'Mr. Chon Savun ', 'Bamboo Angkor Boutique', '+855 10 394 646', 'reservation@bambooangkorboutique.com', NULL, NULL, ' Phum Salar Kanseng, Khum Svay Dangkum, Central Area', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1710', NULL, 'http://bamboo-angkorboutique.com', 7, '4.00', 12, '2015-06-09', 3, NULL, 2, 5, '', '', '', '', 4),
(29, 'Mr. Lao Sokun', 'Tanei Boutique Villa', '+855 12 757 867', 'lao_sukun007@yahoo.com', NULL, NULL, '#017, Steung Thmey Village, Svay Dangkom', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://taneiboutiquevilla.com', 4, '3.00', 28, '2015-05-25', 3, NULL, 2, 4, '', '', '', '', 4),
(30, 'Ms. Saradin Ly', 'La Da Kiri Boutique Hotel', '+855 12 781 675', 'info@ladakiriboutique.com', NULL, NULL, 'Soksan Street, Khum Svay Dangkom', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17251', NULL, 'http://ladakiriboutique.com', 7, '4.00', 26, '2015-02-06', 3, '1970-01-01', 2, 4, '2019-04-24', 'They want to change solutions ', 'B. Sema', '070 811 558', 5),
(31, 'Mr. Soeum Makara', 'Cheathata Angkor Hotel', '+855 63 968 777', 'gm@ctaangkorhotel.com, res@ctaangkorhotel.com', NULL, NULL, 'City Center, Angkor Night Market Road, Old Market Area', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://angkor.ctaangkorhotel.com', 1, '3.50', 28, '8900-08-03', 2, NULL, 2, 4, '', '', '', '', 4),
(32, 'Mr. Sokpheak', 'Base Villa Phnom Penh', '+855 10 292 229', 'reservation@basevillaphnompenh.com', NULL, NULL, 'No #29 Street 222', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://basevillaphnompenh.com', 1, '3.00', 12, '2015-11-30', 3, NULL, 2, 5, '', '', '', '', 4),
(33, 'Mr. Kenvin Harris', 'Bavyra  Boutique', '+855 63 963 987', 'Kevinrharris62@gmail.com ', NULL, NULL, 'Slor Kram Village, Slor kram Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1710', NULL, 'http://bavyraboutique.com', 7, '3.00', 9, '2015-01-25', 3, NULL, 2, 5, '', '', '', '', 4),
(34, 'Mr. Tola Hak (Seyha)', 'Bayon Boutique', '+855 63 969 456', 'gm@bayonboutique.com', NULL, NULL, 'Stueng Thmey, Svay Dangkum', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://bayonboutique.com/index.php', 7, '3.50', 18, '2016-10-10', 2, NULL, 2, 4, '', '', '', '', 4),
(35, 'Mr. Tola Hak (Seyha)', 'Bayon Shadow Villa', '+855 63 765 443', 'gm@bayonboutique.com', NULL, NULL, 'Stueng Thmey, Svay Dangkum', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://bayonshadow.com', 3, '2.50', 18, '2016-10-10', 2, NULL, 2, 4, '', '', '', '', 4),
(36, 'jonathon Vallieres', 'Bella Mia Villa', '+855 63 962 111', 'gm.bellamiavilla@gmail.com, gm@bellamiaangkor.com,', NULL, NULL, 'Soksan Road, Svay Damkom Village, Svay Damkom commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17259', NULL, 'http://bellamiaangkor.com', 3, '3.50', 9, '2015-10-01', 3, NULL, 2, 4, '', '', '', '', 4),
(37, 'Sam Tina', 'Big Lyna Villa', '+855 63 964 807', 'biglyna@yahoo.com', NULL, NULL, 'Wat Bo Village, Sangkat Salakamroeuk', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1710', NULL, 'http://biglynavilla.com', 9, '1.00', 10, '2015-02-11', 3, NULL, 2, 4, '', '', '', '', 4),
(38, 'Sieng Saline', 'Bliss Villa ', '+855 63 630 0978', 'blissvilla@asia.com', NULL, NULL, '# 051, Sok San Street, Svay Dangkum Village', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://theblissvilla.com', 1, '4.00', 21, '2014-12-27', 3, '1970-01-01', 2, 5, '2019-01-03', 'Change Company Solutions', 'Vathana', '+(855) 81 832 181(LINE / WeChat / WhatsApp / Viber / Telegram)', 4),
(39, 'Ms. Ung Annie', 'Bokre Angkor Hostel ', '+855 85 511 118', 'Info@bokreangkorhostel.com', NULL, NULL, '363 Taphul Village, Svay Dangkum Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://eocambovilla.com', 2, '3.00', 30, '2017-10-09', 2, NULL, 2, 4, '', '', '', '', 4),
(40, 'Vann pohin', 'Garden Village Guesthouse', '+855 17 297 777', 'gardenvillage@asia.com', NULL, NULL, '#434, Sok San Street, Steng Thmey Village, Svaydangkum Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://guesthouse.gardenvillageguesthouse.com', 9, '1.00', 29, '2014-12-25', 2, NULL, 2, 4, '', '', '', '', 4),
(41, 'Mr. Sokdana Choung ', 'Botoum Hostel', '+855 16 913 999', 'info@botoumhostel.com', NULL, NULL, 'Sangkat Svay Dangkum,', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://botoumhostel.com', 1, '3.00', 15, '2018-06-23', 2, NULL, 2, 4, '', '', '', '', 4),
(42, 'Mr.Vann pohin', 'Garden Village Hostel', '+855 17 297 777', 'gardenvillage@asia.com', NULL, NULL, 'Steung Thmey Village, Svay Dungkom commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://gardenvillagehostel.com', 2, '1.00', 12, '2015-07-08', 3, NULL, 2, 4, '', '', '', '', 4),
(43, 'Vann pohin', 'Garden Village Villa', '+855 17 297 777', 'gardenvillage@asia.com', NULL, NULL, 'Garden Village Villa is located close to the Old Market in walking distance to bars, restaurants', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://villa.gardenvillagevilla.com', 3, '2.00', 8, '2015-07-08', 3, '1970-01-01', 19, 4, '2019-08-01', 'Low season ', 'Mr. Pohin', '070 630 000', 5),
(44, 'Mr. Rath', 'Mane Boutique Hotel & Spa', '+855 63 768 899', 'ecom@maneboutiquehotel.com', NULL, NULL, 'Village Salakomroeuk, Sangkat Salakomroeuk', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://maneboutiquehotel.com', 1, '5.00', 18, '2015-08-26', 3, NULL, 2, 4, '', '', '', '', 4),
(45, 'Mr.Kan Chansathya', 'Lynnaya Urban River Resort & Spa', '+855 63 967 755', 'gm@lynnaya.com', NULL, NULL, 'Street 20 Krong Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://lynnaya-hotel-angkor.com', 1, '4.00', 46, '2015-08-27', 3, NULL, 2, 4, '', '', '', '', 4),
(46, 'Horn Bovorn', 'Bou Savy Guesthouse (Bed & Breakfast)', '+855 12 369 600', 'bousavy7777@gmail.com', NULL, NULL, '#261, Group 07, Salakanseng Village, Svaydangkum Commune. ', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://bousavyguesthouse.com', 9, '2.00', 30, '2015-09-11', 2, NULL, 2, 4, '', '', '', '', 4),
(47, 'La Villa du Bonheur', 'La Villa du Bonheur', '+855 77 567 605', 'reservation@lavilladubonheur.com ', NULL, NULL, '#056, Viheachen, Svaydangkum', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://lavilladubonheur.com', 3, '1.00', 18, '2015-02-16', 3, NULL, 2, 4, '', '', '', '', 4),
(48, 'Mr. Oeun Seakheng', 'Sarai Resort & Spa', '+855 93 962 204', 'info@sarairesort.com, ecommerce@sarairesort.com, b', NULL, NULL, 'P.O Box 93193, Wat Damnak Village, Sangkat Sala Komreuk ', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17251', NULL, 'http://sarairesort.com', 6, '5.00', 48, '2015-01-12', 3, NULL, 2, 4, '', '', '', '', 4),
(49, 'MR.LING', 'Seven Happiness Holiday HOTEL', '+855 63 968 899', 'sevenhappinessholidayhotel@gmail.com', NULL, NULL, 'Road Lorkta neuy Slor Kram Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17251', NULL, 'http://siemreapevergreenhotel.com', 1, '3.00', 50, '2014-12-25', 3, NULL, 2, 4, '', '', '', '', 4),
(50, 'Mr. Pok Dilux', 'Pacific Hotel', '+855 63 761 818', ' reservations@pacifichotel.com.kh', NULL, NULL, ' Road No. 6, Kaksekam Village, Sror Nge Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://pacifichotel.com.kh', 1, '4.00', 200, '2015-01-22', 3, NULL, 2, 4, '', '', '', '', 4),
(51, 'Mr. Long Sopha', 'Heng Kim Ny Boutique', '+855 93 557 717 ', 'info@hengkimnyboutique.com', NULL, NULL, '#333, Bakheng (St), Sangkat Svay Dangkum, Siem Reap Province. ', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://hengkimnyboutique.com', 1, '4.00', 21, '2015-08-01', 3, NULL, 2, 4, '', '', '', '', 4),
(52, 'Mr. Soeum Makara', 'Cheathata Suite Hotel', '+855 63 968 777', 'res@ctaangkorhotel.com', NULL, NULL, 'City Cente, Angkor Night Market Road, Old Market Area', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'https://suite.cheathatasuitehotel.com', 1, '4.00', 38, '2014-12-14', 2, NULL, 2, 4, '', '', '', '', 4),
(53, 'Martin Disman', 'Hotel Be Angkor', '+855 12 755 311', 'md@theonehotelcollection.com', NULL, NULL, 'On The Passage, Old Market Area', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://hotelbeangkor.com', 1, '3.00', 3, '2015-03-25', 3, NULL, 2, 4, '', '', '', '', 4),
(54, 'Khoun Sokhemra', 'Diamond D\'Angkor Boutique', '+855 63 966 987', 'booking@diamondangkor.com', NULL, NULL, 'Road# 50 (Sok San Street) , Group 8, Stoeung Thmey, Sangkat Svay Dang Kom', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://diamondangkor.com', 1, '2.00', 15, '2015-12-25', 2, NULL, 2, 4, '', '', '', '', 4),
(55, 'Mr. Vichhay', 'Bunseda Angkor Villa', '+855 12 933 080', 'vi_chhay@yahoo.com', NULL, NULL, 'House 169, Group 4, Sivatha Road, Svay Dangkum Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://bunsedaangkorvilla.com', 3, '1.00', 27, '2014-12-25', 3, NULL, 2, 4, '', '', '', '', 4),
(56, 'Mr. Sopheak', 'Relax Inn Boutique Hotel', '+855 96 556 5999', 'sopheakkhoeuth@gmail.com, om@relaxinn.asia', NULL, NULL, 'Bakheng Road, Phum Krous, Sangkat Svay Dangkom', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://relaxinn.asia', 1, '3.00', 5, '2015-01-25', 3, NULL, 2, 4, '', '', '', '', 4),
(57, 'Mr. Luon Thea', 'Golden Temple Residence', '+855 63 212 222', 'info@goldentempleresidence.com', NULL, NULL, '# 558, Steung Thmey Village, Sangkat Svaydangkum ', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://goldentempleresidence.com', 1, '4.50', 28, '2014-12-25', 3, NULL, 2, 4, NULL, NULL, NULL, NULL, 0),
(58, 'Sovann Touch', 'Gloria Angkor Hotel', '+855 63 763 163', 'info@gloriaangkorhotel.com', NULL, NULL, 'National Road Nº 6, Choung Kaosou Village', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17251', NULL, 'http://gloriaangkorhotel.com', 1, '3.00', 3, '2014-12-25', 3, NULL, 2, 4, NULL, NULL, NULL, NULL, 0),
(59, 'Mr. Sophat', 'Khemara Angkor Hotel', '+855 63 760 555', 'sales@khemaraangkor.com ', NULL, NULL, 'National Road No.6 Sala kanseng, Khum Svaydangkum', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://khemaraangkor.com', 1, '4.00', 160, '2015-02-25', 3, NULL, 2, 4, '', '', '', '', 4),
(60, 'Mr. Vanna', 'The Moon Boutique Hotel', '+855 17 359 908', 'reservation@themoonboutiquehotel.com', NULL, NULL, 'Phum Wat Bo, Sala Kamreuk Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://themoonboutiquehotel.com', 1, '3.00', 17, '2015-03-17', 3, '1970-01-01', 2, 4, '2019-01-03', 'Change Company Solutions', 'Sokvanna BOU ', '017 359 908', 4),
(61, 'Phem Chhorpoan', 'Happy Guesthouse', '+855 12 960 879', 'info@happyangkorguesthouse.com', NULL, NULL, 'No. 0134 Wat Bo Village, Salakamroeuk Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17251', NULL, 'http://happyangkorguesthouse.com', 9, '2.00', 9, '2014-12-25', 2, NULL, 2, 4, '', '', '', '', 4),
(62, 'Mr. Tommy Baert', 'Rambutan Hotel - Siem Reap', '+855 12 654 638', 'bookings@rambutansr.com', NULL, NULL, 'Wat Damnak Village, Salakamreuk commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://rambutanhotelsr.com', 1, '3.00', 12, '2015-03-25', 3, NULL, 2, 4, '', '', '', '', 4),
(63, 'Mr. Tommy Baert', 'Rambutan Resort - Siem Reap ', '+855 12 654 638', 'bookings@rambutansr.com', NULL, NULL, 'Wat Damnak Village, Salakamreuk commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://rambutanresortsr.com', 6, '3.00', 19, '2015-03-19', 3, NULL, 2, 4, '', '', '', '', 4),
(64, 'Mr. Peter Phoeng', 'Angkor Pearl Hotel', '+855 92 571 520', 'pphoeng@angkorpearl.com', NULL, NULL, 'Taphul Village Svay Dangkum  ', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://angkorpearl.com', 1, '3.00', 45, '2014-03-25', 3, NULL, 2, 4, '', '', '', '', 4),
(65, 'Cheng Bunsan', 'The Moon Residence', '+855 69 585 566', 'reservation@themoonresidence.com', NULL, NULL, '#100, St.267, Vihear Chen Village, Svay Dangkum Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://themoonresidence.com', 1, '4.00', 22, '2015-08-29', 2, NULL, 2, 4, '', '', '', '', 4),
(66, 'Mr.Has Sophal', 'The Moon Villa ', '+855 12 629 969', 'reservation@themoonvilla.com', NULL, NULL, 'National Road 06,Phum Banteay Chas, Samaki Market zone', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://themoonvilla.com', 3, '3.00', 19, '2015-08-29', 3, NULL, 2, 4, '', '', '', '', 4),
(67, 'Mr. Mom Phirith', 'Royal Crown Hotel', '+855 92 373 114', 'gm@royalcrownhotel.com.kh', NULL, NULL, '#7 Makara Street, Wat Bo Village, Salakamreuk Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://royalcrownhotel.com.kh', 7, '4.00', 139, '2015-11-27', 2, NULL, 2, 4, '', '', '', '', 4),
(68, 'Kyry Sok', 'Chronicle Residence And Spa', '+855 12 677 939', 'gm@chronicleresidenceandspa.com, operation@chronic', NULL, NULL, '# Road 30, 200m way from Borei Phreumprey.', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://chronicleresidenceandspa.com', 1, '3.00', 22, '2015-11-27', 3, NULL, 2, 4, '', '', '', '', 4),
(69, 'Mr. Chhorng Chhaiya', 'Three Room D\'Angkor', '+855 16 907 567', 'info@threeroomdangkor.com', NULL, NULL, 'Wat Leu Road, Village 3, Slor Kram', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://threeroomdangkor.com ', 7, '4.00', 3, '2014-08-24', 3, NULL, 2, 4, '', '', '', '', 4),
(70, 'Mr. Daravichhay SENG ', 'Angkor Miracle Resort & Spa', '+855 87 882 244', 'em@angkormiracle.com, ee@angkormiracle.com, reserv', NULL, NULL, 'National Road No. 6A. Khum Sra Nge (opposite of Cambodian cultural Village) Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://angkormiracle.com/resort', 1, '5.00', 247, '2015-11-30', 3, NULL, 2, 4, '', '', '', '', 4),
(71, 'Mr. Sophat', 'Nagara Angkor Boutique Hotel ', '+855 70 559 536', 'booking@nagaraangkor-boutique.com', NULL, NULL, 'Sok San Road, Stueng Thmei Village, Svay Dangkum Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://nagaraangkor-boutique.com', 7, '3.50', 36, '2015-11-21', 3, NULL, 2, 4, '', '', '', '', 4),
(72, 'Nareth', 'Shadow of Angkor Guesthouse', '+855 12 968 881', 'shadowofangkor@gmail.com', NULL, NULL, 'No 353, Pokambor AV, on the river side, near Old Market', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://shadowofangkor.com', 9, '1.00', 16, '2014-12-25', 3, NULL, 2, 4, '', '', '', '', 4),
(73, 'Mr. Seng Sakada', 'Vilada Angkor Boutique', '+855 12 565 856', 'gm@viladaangkorboutique.com', NULL, NULL, 'Kor Kranch Village, Sangkat Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://viladaangkorboutique.com', 7, '4.00', 7, '2015-11-03', 3, NULL, 2, 4, '', '', '', '', 4),
(74, 'Laot Tre', 'La Residence Blanc D\'Angkor', '+855 70 261 397', 'sm@residenceblancangkor.com', NULL, NULL, ' #194 Krous Village, Svay Dangkum and 6th Street', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://residenceblancangkor.com', 1, '4.00', 26, '2014-11-30', 3, NULL, 2, 4, '', '', '', '', 4),
(75, 'Mr. Loy Salith', 'The Unique Angkor Villa', '+855 93 305 297', 'info@theuniqueangkorvilla.com', NULL, NULL, ' # 558, Steung Thmey Village, Sangkat Svaydangkum', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://theuniqueangkorvilla.com', 3, '3.00', 18, '2015-02-07', 3, NULL, 2, 4, '', '', '', '', 4),
(76, 'Mr. Martin Dishman', 'The One Villa Angkor', '+855 12 755 311', 'md@theonehotelcollection.com', NULL, NULL, 'Just off Street 52, Sambour Village.  5km from Old Market area and Hotel Be.', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://theonehotelangkor.com', 1, '5.00', 20, '2014-12-25', 3, NULL, 2, 4, '', '', '', '', 4),
(77, 'Ms. Vann Narin ', 'CHEZ MOI SUITE', '+855 12 584 897', 'reservation@chezmoi.asia', NULL, NULL, '#0378, Sombai road, Wat Damnak commune, Sangkat Salakamroeuk ', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://suite.chezmoi.asia', 7, '4.00', 10, '2016-01-11', 3, '1970-01-01', 2, 4, '2019-06-13', 'They want to save budget for low season ', 'Ms. Narin', '098 958 387', 4),
(78, 'Chuon Chantola', 'Siem Reap Vacation Hotel', '+855 95 800 881', 'sales@siemreapvacationhotel.com', NULL, NULL, 'Taneuy Street, Wat Bo Village, Salakamreuk Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://siemreapvacationhotel.com', 1, '3.00', 48, '2014-12-25', 3, NULL, 2, 4, '', '', '', '', 4),
(79, 'Mr. Seang Sovann', 'Tropicana Residence & Resort', '+855 12 842 349', 'rm@tropicanaresidence.com', NULL, NULL, 'Angkor High School Road, Phum Wat Bo, Salakamreuk', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://tropicanaresidence.com', 6, '4.00', 9, '2016-01-11', 3, NULL, 2, 4, '', '', '', '', 4),
(80, 'Oul Van', 'Asia Tune Hotel', '+855 23 977 789', 'gm@asiatunehotel.com', NULL, NULL, 'No. 85, St. 19 Corner 148, Sangkat Phsar Kandal 2, Khan Daun Penh', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://asiatunehotel.com', 1, '4.00', 83, '2014-12-01', 3, '1970-01-01', 2, 5, '2019-05-02', 'They want to prepare their property and they will back. ', 'Ms. LONG Kimly   ', 'Request by email ', 5),
(81, 'Mr. Horn Bovuth', 'Bou Savy Villa', '+855 12 898 627', 'info@bousavyvilla.com, bousavyvilla7777@hotmail.co', NULL, NULL, 'Sok San Road, Phum Svay Dangkum, Sangkat Svay Dangkum', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '063', NULL, 'http://bousavyvilla.com', 3, '3.50', 20, '2017-08-02', 2, NULL, 2, 5, '', '', '', '', 4),
(82, 'Mr. Nath kananda', 'Boutique Kampot Hotel', '+855 61 888 626', 'kananda.nath@gmail.com', NULL, NULL, '#10 of 68 Specialty Lodging in Kampot 1 Ousaphea Village, Kampong Kandal', 56, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://boutiquekampot.com', 7, '4.00', 18, '2018-01-29', 2, NULL, 2, 5, '', '', '', '', 4),
(83, 'Mr. Chivid', 'Bunwin Boutique Hotel', '+855 63 969 158', 'reservation@bunwinboutique.com', NULL, NULL, 'National Road 06, Phum Banteay Chas, Opposite Samaki Market', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://bunwinboutique.com', 1, '4.00', 11, '2015-08-29', 2, NULL, 2, 5, '', '', '', '', 4),
(84, 'Mr. Has Sophal', 'Bunwin Plantation', '+855 17 310 229', 'gm@bunwinboutique.com', NULL, NULL, 'Kakranh Village', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://plantation.bunwinplantation.com', 1, '3.00', 14, '2015-09-14', 3, NULL, 2, 5, '', '', '', '', 4),
(85, 'Mr. Phasy Sun', 'Bunwin Residence', '+855 63 763 677', 'reservation@bunwinresidence.com', NULL, NULL, 'Kor Kranh Village ', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://bunwinresidence.com', 3, '4.00', 10, '2015-09-14', 3, '1970-01-01', 2, 5, '2019-02-04', 'Stop selling online', 'Chivid Yem', '(855) 12346644/86 24 06 89', 4),
(86, 'Ms. Shierlyn', 'Casa Villa Independence Boutique Hotel', '+855 23 211 729', 'reservation@casa-villa.com', NULL, NULL, '#4, Street 294, Boeung Keng Kong 1', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://casa-villa.com', 1, '4.00', 12, '2015-01-01', 2, NULL, 2, 5, '', '', '', '', 4),
(87, 'Mr. Thorn Ve', 'Central Boutique Angkor Hotel', '+855 63 764 030', 'info@centralboutiqueangkorhotel.com', NULL, NULL, 'In front of Sala Bai Hospitality School, Tapoul villa, Svay Dangkum commune.', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://centralboutiqueangkorhotel.com', 1, '3.00', 54, '2016-06-23', 2, NULL, 2, 5, '', '', '', '', 4),
(88, 'Ms. Kimly Cheak', 'Central Suite Residence', '+855 63 969 691', 'relations@centralsuiteresidence.com', NULL, NULL, 'City Center, Sok San Road, Old Market Area', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://centralsuiteresidence.com', 1, '4.00', 32, '2016-03-03', 3, NULL, 2, 5, '', '', '', '', 4),
(89, 'Mrs.  ABDOUNE', 'Chateau The Meliya Hotel & Apartment', '+855 23 987 212', 'jessica.a@chateauthemeliya.com', NULL, NULL, '10B, St. 264, Sangkat Chaktomuk,  Khan Doun Penh', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://chateauthemeliya.com', 1, '4.00', 54, '2017-03-20', 3, '1970-01-01', 2, 5, '2019-07-01', 'They have a new property and their management team wants to change to another system.', 'Samkot LY ', 'Sent email ', 5),
(90, 'Mr. Prosa', 'Colina Boutique Hotel', '+855 23 221 088', 'om@colinaboutiquehotel.com', NULL, NULL, 'No. 26,  At corner of street 123 and 440, Tuoltompoung I, Chamkarmorn', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://colinaboutiquehotel.com', 7, '4.00', 44, '2015-04-03', 3, NULL, 2, 5, '', '', '', '', 4),
(91, 'Kamala Thomas', 'Cubby House Resort', '+855016388573', 'info@cubbyhouse.asia', NULL, NULL, 'Otres River Village', 56, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://cubbyhouse.asia', 8, '2.50', 2, '2015-10-27', 2, NULL, 2, 5, '', '', '', '', 4),
(92, 'Mr. Sophal Phoeun ', 'Damnak Villa Retreat ', '+855 77 979 711', 'info@damnakvillaretreat.com', NULL, NULL, ' | #92,Group#6,Trapeang Ses, Kork Chak, Siem Reap, Cambodia', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://damnakvillaretreat.com', 3, '3.00', 6, '2018-07-21', 2, NULL, 2, 5, '', '', '', '', 4),
(93, 'Mr. Sombo', 'Damrei Angkor Hotel', '+855 63 968 717', 'info@damreiangkorhotel.com', NULL, NULL, 'Street 20, Wat Bo Village, Salakomroek Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://damreiangkorhotel.com', 1, '4.00', 50, '2017-06-12', 2, NULL, 2, 5, '', '', '', '', 4),
(94, 'Mr. Peter', 'De I\'homme ', '+855 96 829 3544', 'reservation@hoteldelhomme.com', NULL, NULL, 'Phnom Penh', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://deihomme.com', 1, '4.00', 15, '2018-03-29', 3, '1970-01-01', 2, 4, '', '', '', '', 4),
(95, 'Mr. Mike Hob', 'De Sarann Suites', '+855 63 900 050', 'info@desarannvilla.com, info@desarannsuites.com', NULL, NULL, '#092, Group 6, Trapeang Ses Village | Sangkat Kork Chork, Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://desarannsuites.com', 1, '4.00', 8, '2016-08-19', 3, NULL, 2, 5, '', '', '', '', 4),
(96, 'Mr. Andrew Pan', 'De Sarann Villa', '+855 88 299 9923', 'info@desarannvilla.com', NULL, NULL, '#37 Trang Village, Sangkat Slorkram', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://desarannvilla.com', 3, '4.00', 4, '2016-03-27', 3, NULL, 2, 5, '', '', '', '', 4),
(97, 'Mr. Kim May', 'Dechasey Residence', '+855 63 965 945', 'operation@dechaseyresidence.com', NULL, NULL, 'Off Route Six, About 300 meters down Korean-Cambodian Friendship Rd', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://communityresidencesiemreap.com', 1, '4.00', 10, '2017-04-28', 3, NULL, 2, 5, '', '', '', '', 4),
(98, 'Mr. Maco', 'Demo', '+855 69 955 179', 'info@eocambo.com', NULL, NULL, 'slarkram', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://eocambo.com', 6, '5.00', 20, '2018-07-02', 1, '2019-01-24', 2, 5, '', '', '', '', 4),
(99, 'Mr. Heng Sothea', 'Dinata Angkor Boutique', '+855 63 968 836', 'gm@dinataangkor.com', NULL, NULL, 'Taphul Road, Svay Dangkum Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://dinataangkor.com', 7, '3.00', 28, '2017-09-22', 3, '1970-01-01', 2, 5, '', '', '', '', 4),
(100, 'Mr. Paolo', 'Dom Boutique Hotel', '+855 96 330 6403', 'domsiemreap@gmail.com', NULL, NULL, 'Wat Damnak village, Sangkat Sala Kamreuk Siem Reap Cambodia', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://domsiemreap.com/en-us', 7, '3.00', 26, '2018-04-06', 3, NULL, 2, 5, '', '', '', '', 4),
(101, 'Mr. Phanith Lmoth', 'Double Leaf Boutique Hotel', '+855 23 226 299', 'gm@doubleleafhotel.com', NULL, NULL, '#32, Street 123, Toul Tom Pong I, Khan Chamkamon', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://doubleleafhotel.com', 7, '4.00', 48, '2014-12-01', 3, NULL, 2, 5, '', '', '', '', 4),
(102, 'Mr. Vorn Savoeun', 'Dyna Boutique Hotel', '+855 63 968 881', 'gm@dynaboutiquehotel.com', NULL, NULL, 'Phum Salar Kanseng, Khum Svay DangKum', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://dynaboutiquehotel.com', 7, '3.00', 12, '2015-03-30', 3, NULL, 2, 5, '', '', '', '', 4),
(103, 'Mr. Den', 'Eco Villa', '+855 92 307 314', 'den@ehotelbiz.com', NULL, NULL, '# Road 30, Behind Krous High School, Infront of Tropical Restaurant, Kruos, Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://ecovillasiemreap.com', 3, '4.00', 10, '2017-02-09', 3, NULL, 2, 5, '', '', '', '', 4),
(104, 'Mr. Peter Phich', 'eOcambo Residence', '+855 70 379 905', 'reservation@eocamboresidence.com', NULL, NULL, '#Street 22 (Tea Csales@eocamboresidence.comhamrat), Wat Bo Village, Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://eocamboresidence.com', 1, '4.00', 22, '2017-08-09', 2, NULL, 2, 4, '', '', '', '', 4),
(105, 'Mr. Peter Phich', 'eOcambo Resort', '+855 70 379 905', 'peter@eocambo.com', NULL, NULL, 'BBU Road, Vihear Chen Village, Sangkat Svay Dangkum, Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://eocamboresort.com', 6, '5.00', 28, '2018-08-02', 2, NULL, 2, 4, '', '', '', '', 4),
(106, 'Mr. Peter', 'eOCambo Villa', '+855 70 379 905', 'info@eocambovilla.com', NULL, NULL, 'BBU road, Vihear Chen Village, Svaydangkum Cummune, Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://villa.eocambovilla.com', 3, '2.00', 8, '2017-05-30', 2, NULL, 2, 4, '', '', '', '', 4),
(107, 'Mr. Peter Phich', 'eOcambo Village', '+855 70 379 905', 'reservation@eocambovillage.com', NULL, NULL, 'Street 22 (Tea Chamrat), Wat Bo Village', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://eocambovillage.com', 1, '4.00', 28, '2017-08-19', 2, NULL, 2, 4, '', '', '', '', 4),
(108, 'Mr. Vannak', 'F&B Hostel', '+855 89 672 722', 'phoanvannak@gmail.com', NULL, NULL, 'Sok San Road, Phum Svay Dangkum, Sangkat Svay Dangkum', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://fbsiemreaphostel.com', 1, '3.00', 12, '2017-08-09', 3, NULL, 2, 5, '', '', '', '', 4),
(109, 'Mr.Krishna ', 'Fancy Boutique Villa', '+855 63 965 377', 'gm@fancyboutiquevilla.com', NULL, NULL, 'Samdach Tep Vong Street, Group 2, Steung Thmey Village, Sangkat Svaydangkom', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://fancyboutiquevilla.com', 7, '4.00', 13, '2016-01-15', 3, NULL, 2, 4, '', '', '', '', 4),
(110, 'Mr. Phannak ', 'Fancy Guest House', '+855 23 211 829', 'fancyguesthouse@yahoo.com', NULL, NULL, 'No. 169B, Street 15, Phsar Kandal 2, Khan Daun Penh', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://fancyguesthouse.com', 9, '0.00', 21, '2014-10-20', 3, NULL, 2, 4, '', '', '', '', 4),
(111, 'Mr. Arun Raing', 'Feliz Hostel Cafe & Bar', '+855 23 216 596', ' bookings@felizhostel.com', NULL, NULL, 'Z6-132, St 51, Buoeng Keng Kong 1 Commune, Chamkarmon District', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '12302', NULL, 'http://felizhostel.com', 2, '3.00', 18, '2016-07-12', 2, NULL, 2, 4, '', '', '', '', 4),
(112, 'Mr. Arun Raing', 'Feliz Urban Hotel', '+855 23 212 555', 'generalmanager.feliz@gmail.com', NULL, NULL, ' #3 Bis, Street 288, Boeung Keng Kang Commune, Chamkarmon District, PhnomPenh', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '12302', NULL, 'http://', 1, '4.00', 36, '2017-03-09', 2, NULL, 2, 4, '', '', '', '', 4),
(113, 'Mr. CHHAI', 'Flourishing Boutique Hotel', '+855 61 222 637', 'info@flourishingboutique.com', NULL, NULL, 'Country Road Wat Chowk, Svay Dangkum, Siem Reap, Cambodja', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://flourishingboutique.com', 1, '4.00', 6, '2016-10-31', 3, NULL, 2, 5, '', '', '', '', 4),
(114, 'Mr. Sarat Yoeung', 'G & Z Angkor Hotel', '+855 10 339 235', 'Sarath.y@wegoalconsulting.com', NULL, NULL, 'Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://gzangkorhotel.com', 1, '3.00', 21, '2018-04-30', 3, NULL, 2, 4, '', '', '', '', 4),
(115, 'Mr. David Chhun', 'G & Z Angkor Boutique', '+855 87 757 555', 'gm@gzinvestmentgroups.com', NULL, NULL, 'Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://gzangkorboutique.com', 7, '4.00', 18, '2018-04-30', 3, NULL, 2, 4, '', '', '', '', 4),
(116, 'Mr. Oem Sopha', 'Garden Flower Resort ', '+855 96 868 6296', 'info@gardenflowerresort.com', NULL, NULL, ' Phum Khnar, Khum Chreav, Siem Reap district,Siem Reap province', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17256', NULL, 'http://gardenflowerresort.com', 6, '4.00', 30, '2019-02-08', 3, '2019-02-12', 14, 5, '2019-03-22', 'They don\'t have any OTAs that make a reservation and they want to prepare their property.', 'General Manager (B Nisa)', '+855 78 299 995', 5),
(117, 'Mr. Hom Sokleng', 'GBT 3 Guesthouse', '+855 16 777 818', 'gbt_beach@yahoo.com', NULL, NULL, 'Serendipity Street', 56, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1800', NULL, 'http://gbt3guesthouse.com', 9, '2.00', 46, '2015-05-07', 3, NULL, 2, 5, '', '', '', '', 4),
(118, 'Mr. Bill Longo', 'Genevieve\'s Khmer Villa', '+855 63 966 566', 'billlongotemp@gmail.com', NULL, NULL, '#0141, Wat Damnak Street, Old Market', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://genevieveskhmervilla.com', 1, '3.00', 29, '2017-09-14', 3, NULL, 2, 5, '', '', '', '', 4),
(119, 'Chhem Samnang', 'Glory Angkor Hotel', '+855 12 366 657', 'info@gloryangkorhotel.com', NULL, NULL, 'Wat Bo Road, Wat Bo Village,  Salakormrouk Commune, ', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://gloryangkorhotel.com', 1, '4.00', 16, '2018-02-02', 2, NULL, 2, 5, '', '', '', '', 4),
(120, 'Mr. Laot Tre', 'Golden Banana Residence ', '+855 70 261 397', 'gm@golden-banana.com', NULL, NULL, 'Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://golden-banana.com', 1, '3.00', 30, '2017-12-04', 3, NULL, 2, 5, '', '', '', '', 4),
(121, 'Mr. Chen ', 'Golden Butterfly Villa', '+855 96 801 0338', 'info@goldenbutterflyvilla.com', NULL, NULL, 'Stung Thmey, Svay Dangkum near Pub Street, Pub Street Alley', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1710', NULL, 'http://goldenbutterflyvilla.com', 3, '3.00', 25, '2016-08-29', 2, NULL, 2, 5, '', '', '', '', 4),
(122, 'Mrs. Lim Siv Mey', 'Golden House International Hotel', '+855 23 222 167', 'mail@goldenhouse.asia', NULL, NULL, '#23-25 St.136, Phsar Kandal 1  Daun Penh', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '12204', NULL, 'http://goldenhouse.asia', 1, '3.00', 21, '2014-08-19', 2, NULL, 2, 5, '', '', '', '', 4),
(123, 'Mr. Cheab Sokvann', 'Golden Mango Inn', '+855 63 761 857', 'info@goldenmangoinn.com ', NULL, NULL, 'Road 6, Chongkaosou Village, Slorkram Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://goldenmangoinn.com', 1, '3.00', 24, '2017-06-16', 3, NULL, 2, 5, '', '', '', '', 4),
(124, 'Mr. Sok Sopheng', 'Golden Sand Hotel ', '+855 34 933 607', 'info@goldensandhotel.com.kh', NULL, NULL, 'Ochheuteal beach, St. 23 Tola, Sangkat 4', 56, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://goldensandhotel.com.kh', 1, '4.00', 120, '2015-03-18', 3, NULL, 2, 5, '', '', '', '', 4),
(125, 'Mr. Chang Suk Oh', 'Golden Sea Beach Hotel & Casino', '+855 12 603 600', 'hotel@goldenseabeach.com', NULL, NULL, 'Victory Beach, Vithey Krong, Sangkat 3', 56, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://goldenseabeach.com', 1, '4.00', 40, '2015-01-26', 3, NULL, 2, 5, '', '', '', '', 4),
(126, 'Mr. Charkrong Chhong', 'Golden Sea Hotel & Casino', '+855 92 230 888', 'gm@goldenseahotels.com', NULL, NULL, 'Ekareach St,Sangkat3, Sihanouk vill Preach Sihanouk Province,Kingdom of Cambodia', 56, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://goldenseahotels.com', 1, '4.00', 105, '2016-06-27', 3, NULL, 2, 5, '', '', '', '', 4),
(127, 'Mr. Chot Barang', 'Golden Temple Boutique', '+855 63 212 222', 'reservations@goldentempleboutique.com', NULL, NULL, 'Steung Thmey Village, Savay Dangkum Commune, Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'https://www.goldentempleboutique.com/home', 7, '4.00', 19, '2017-07-21', 3, NULL, 2, 5, '', '', '', '', 4),
(128, 'Mr. Luon Thea', 'Golden Temple Hotel', '+855 63 967 996', 'info@goldentemplehotel.com, fom@goldentemplehotel.', NULL, NULL, '7 Makara road, or Angkor High School road', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://goldentemplehotel.com', 7, '4.00', 29, '2015-09-28', 3, NULL, 2, 5, '', '', '', '', 4),
(129, 'Mr. Loun Thea', 'Golden Temple Retreat', '+855 63 217 777', 'gm@goldentempleretreat.com, it@goldentempleresiden', NULL, NULL, 'Wat Damnak, Sala Kamreuk, Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://retreat.goldentempleretreat.com', 1, '4.00', 32, '2016-12-22', 3, NULL, 2, 5, '', '', '', '', 4),
(130, 'Mr. Luon Thea', 'Golden Temple Villa', '+855 12 794 938', 'reservations@goldentemplevilla.com, info@goldentem', NULL, NULL, 'Sok San Road, Svay Dangkum', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://villa.goldentemplevilla.com', 3, '4.00', 23, '2015-10-16', 3, NULL, 2, 5, '', '', '', '', 4),
(131, 'Ms. Nimol Tha', 'Grand Elevation Hotel ', '+855 77 556 528', 'elevation.hotel@yahoo.com', NULL, NULL, 'House G6 G7 G8, St. Sothearos, Tonle Basac Charmkarmon, Chamkar Morn, Phnom Penh, Cambodia', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'https://grandelevationhotel.com', 1, '3.00', 54, '2018-08-16', 2, NULL, 2, 5, '', '', '', '', 4),
(132, 'Mr. Phu Vireak', 'Green Amazon Residence', '+855 63 767 7000', 'book@greenamazonresidence.com', NULL, NULL, 'Phneachey Village, Svay Dangkom Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://greenamazonresidence.com', 1, '4.00', 52, '2017-12-04', 3, NULL, 2, 5, '', '', '', '', 4),
(133, 'Ms. Sothy Samrith', 'La Parranda Residence & Hotel', '+855 23 424 106', 'info@laparrandahotels.com', NULL, NULL, 'No.207, St. Mao Tsetoung, Sangkat Toul Svay Prey 2, Khan Chomkamorn', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://laparrandahotels.com', 1, '3.00', 56, '2015-03-05', 3, NULL, 2, 5, '', '', '', '', 4),
(134, 'Mr. Piseth', 'KT Apartment Siem Reap', '+855 12 415 774', 'info@kt-apartments.com', NULL, NULL, 'Street 26, Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://kt-apartments.com', 5, '0.00', 12, '2017-05-12', 2, NULL, 2, 5, '', '', '', '', 4),
(135, 'Mr. Srey Meng Ly', 'Kralanh Petite Villa', '+855 17 597 513', 'gm@kralanhpetitevilla.com', NULL, NULL, 'Veal Village | Sangkat Kouk Chork', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://kralanhpetitevilla.com', 3, '3.50', 6, '2016-04-21', 3, NULL, 2, 5, '', '', '', '', 4),
(136, 'Mr. Korm Sopheng', 'KOUPREY HOTEL', '+855 63 765 674', 'info@hotelkoupreyangkor.org', NULL, NULL, 'Top Town Road, Krous Village, Svay Dangkum', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://hotelkoupreyangkor.org', 1, '3.50', 57, '2015-10-01', 3, NULL, 2, 5, '', '', '', '', 4),
(137, 'Ms. KEO SONY', 'Kolab Sor Phnom Penh Hotel', '+855 12 802 707', 'info@kolabsorhotel.com ', NULL, NULL, '#436, Street 310, Sangkat Boeung Keng Kang III, Khan Chamkarmon', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://kolabsorhotel.com', 1, '4.00', 52, '2015-02-04', 2, NULL, 2, 5, '', '', '', '', 4);
INSERT INTO `customer_profile` (`id`, `customer_name`, `company_name`, `phone_number`, `email_address`, `latitute`, `longitute`, `address`, `id_country`, `id_city`, `group_names`, `billing_address`, `id_billing_city`, `id_billing_country`, `shipping_address`, `id_shipping_city`, `id_shipping_country`, `status`, `created_by`, `created_date`, `img_url`, `updated_date`, `updated_by`, `zip_code`, `customer_status`, `website_url`, `accommodation_type`, `star_rating`, `number_of_rooms`, `sale_date`, `accomodation_status`, `lived_date`, `passed_by`, `handle_by`, `deactivated_at`, `deactivated_reason`, `deactivated_requested_by`, `deactivated_requested_contact_detail`, `deactivated_by`) VALUES
(138, 'Mr. Sitha Nhem ', 'Koh Rong Love Resort', '+855 16 963 198', 'gm@kohrongloveresort.com', NULL, NULL, 'Koh Rong Island , Sok San Village, Sangkat Koh Rong, Sihanouk Ville, Sihanouk province', 56, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://kohrongloveresort.com', 6, '0.00', 48, '2017-10-09', 2, NULL, 2, 5, '', '', '', '', 4),
(139, 'Mr. Long Vansak', 'Klampuu Villa Hostel', '+855 10 556 191', 'long.vansak@gmail.com', NULL, NULL, 'st 53, Stueng Thmei Village, Svay Dangkum Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://klampuuvillahostel.com', 2, '3.00', 11, '2018-01-03', 3, NULL, 2, 5, '', '', '', '', 4),
(140, 'Mr. Long Vansak', 'Klampuu Villa', '+855 12 926 020', 'long.vansak@gmail.com', NULL, NULL, 'Street 53, Stueng Thmei Village, Svay Dangkum Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://klampuuvilla.com', 3, '3.00', 11, '2017-10-31', 2, NULL, 2, 5, '', '', '', '', 4),
(141, 'Mr. Hem Sophoun', 'King Rock Boutique Hotel', '+855 63 766 141', 'om@kingrockboutique.com', NULL, NULL, 'Group #7, Wat Damnak, Sala Kamreouk', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17254', NULL, 'http://kingrockboutique.com', 7, '4.00', 18, '2016-06-25', 3, NULL, 2, 5, '', '', '', '', 4),
(142, 'Mr. Sam', 'King Boutique Hotel', '+855 63 760 655', 'kingboutiquehotel@gmail.com', NULL, NULL, '251 Samdach Tep Vong, Siem Reap 17252', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://kingboutiquehotel.com', 1, '3.00', 24, '2016-10-19', 3, NULL, 2, 5, '', '', '', '', 4),
(143, 'Jacky LONG ', 'Khmere Maison D\'Angkor', '+855 63 766 062', 'jacky@khmeremaisondangkor.com', NULL, NULL, '#482, BO POX 93090, City Center, National Road No.6, Wat Kesaram Street, Sangkat Svay Dangkum,', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://khmeremaisondangkor.com', 7, '3.00', 6, '2015-11-02', 3, NULL, 2, 5, '', '', '', '', 4),
(144, 'Ms. Vichna Run', 'Khmer Wooden Hostel', '+855 63 965 444', 'info@khmerwoodenhostel.com', NULL, NULL, '#144, Taphul Village, Svaydangkum', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://khmerwoodenhostel.com', 2, '0.00', 4, '2016-02-23', 3, NULL, 2, 5, '', '', '', '', 4),
(145, 'Ms. Chea Komrong', 'Khmer Mansion Residence', '+855 63 762 333', 'reservation@khmermansionresidence.com, gm@khmerman', NULL, NULL, 'Sok San Street, Stung Thmey Village, Svay Dangkum Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://khmermansionresidence.com/residence.html', 1, '3.00', 47, '2017-08-29', 2, NULL, 2, 5, '', '', '', '', 4),
(146, 'Ms. Chea Komrong', 'Khmer Mansion Boutique Hotel', '+855 63 762 333', 'gm@khmermansion.com', NULL, NULL, 'Sok San Street, Stung Thmer Village, Svay Dangkum Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://khmermansion.com', 1, '4.00', 22, '2017-06-01', 2, NULL, 2, 5, '', '', '', '', 4),
(147, 'Mr. Khavi Sang', 'Khavi Villa', '+855 12 766 624', 'khavicambodia@yahoo.com', NULL, NULL, '#12 st 258', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://khavivilla.com', 3, '4.00', 23, '2015-02-24', 3, NULL, 2, 5, '', '', '', '', 4),
(148, 'Mr. Khavi Sang', 'Khavi Guesthouse', '+855 23 632 4466', 'khavicambodia@yahoo.com', NULL, NULL, '#7DD, Street 258 , S/K Chaktomuk, Khan Daun Penh', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://khavi-guesthouse.com', 9, '3.00', 23, '2015-02-23', 3, NULL, 2, 5, '', '', '', '', 4),
(149, 'Ms. Vann Narin', 'Kafu Resort and Spa', '+855 63 964 242', 'info@kafu-resort.com', NULL, NULL, 'River Road, Slarkram Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://kafu-resort.com', 1, '3.00', 28, '2017-11-10', 3, '1970-01-01', 2, 5, '2019-06-14', 'They want to save budget for low season', 'Mr. Pisith Roeum', 'By Email ', 5),
(150, 'Mr. Sok Chan', 'Jasmin Monument Hotel', '+855 23 221 322', 'gm@j-monumenthotel.com', NULL, NULL, ' #22s, Street 29, BKK1, Tonlebassac, Chamkarmon', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://j-monumenthotel.com', 1, '4.00', 23, '2017-04-20', 3, '1970-01-01', 2, 5, '', '', '', '', 4),
(151, 'Mr. Sothea Seng', 'Isann Villa', '+855 12 926 562', 'sothea@mahobkhmer.com', NULL, NULL, 'Svay Dongkom,', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://isannvilla.com', 3, '3.00', 15, '2018-02-01', 3, NULL, 2, 5, '', '', '', '', 4),
(152, 'Mr. Sothea Seng ', 'Isann Lodge', '+855 63 966 986', 'info@isannlodge.com', NULL, NULL, 'Chong Kao Su Village, Sangkat Slor Kram', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://isannlodge.com', 6, '3.50', 12, '2017-06-21', 3, NULL, 2, 5, '', '', '', '', 4),
(153, 'Mr. Chhuney', 'Indradevi Boutique Hotel', '+855 63 766 398', 'info@indradeviboutiquehotel.com, Keochhunyu@gmail.', NULL, NULL, 'Krous Village, Svay Dankum, Sieam Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://indradeviboutiquehotel.com', 7, '3.50', 20, '2016-12-12', 3, NULL, 2, 5, '', '', '', '', 4),
(154, 'Mr. Lim Rithy', 'Indra Porak Residence', '+855 93 859 007', 'sales@indraporak.com', NULL, NULL, 'Betong Street, Village Vihear Chen, Sangkat Svay Dangkom,near by Pub Street', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://indraporak.com', 7, '4.00', 16, '2015-09-15', 3, NULL, 2, 5, '', '', '', '', 4),
(155, 'Ms. Sivly Lim', 'Indochine 2 Hotel', '+855 23 211 525', 'lim.sivly@indochine2hotel.com', NULL, NULL, 'No. 28-30, Street 130, Phsar Kandal I, Daun Penh, Phnom Penh, Cambodia.', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '12000', NULL, 'http://indochine2hotel.com', 1, '2.00', 30, '2014-12-01', 3, NULL, 2, 5, '', '', '', '', 4),
(156, 'Mr. Pheakdey', 'In Miles Boutique Hotel', '+855 17 995 567', 'info@inmilesboutique.com', NULL, NULL, 'No. 042, Charle De Gaulle Blvd (Main Road to Angkor Wat), Mondul 3 village, Sangkat Slor Kram', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://inmilesboutique.com', 1, '2.00', 10, '2017-02-10', 3, NULL, 2, 5, '', '', '', '', 4),
(157, 'Mr. Kaizo', 'Hotel Tokyo Service Apartment and Spa', '+855 23 901 358', 'contact@kihoteltokyo.com', NULL, NULL, 'Phnom Penh', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://hoteltokyoserviceapartmentandspa.com', 1, '2.00', 100, '2018-02-26', 3, '1970-01-01', 2, 4, '', '', '', '', 4),
(158, 'Mr. Ea Tola', 'Hotel Records', '+855 23 981 818', 'records@journeyside.com', NULL, NULL, 'Phnom Penh', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://hotelrecords.com', 1, '3.00', 15, '2018-06-29', 3, '1970-01-01', 2, 5, '', '', '', '', 4),
(159, 'Mr. Jimmy', 'Hotel Five.S ', '+855 81 375 375', 'info@hotelfives.com', NULL, NULL, 'Krang Vilage, KrangAmpil Commune,', 56, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '07452', NULL, 'http://hotelfives.com', 1, '3.00', 15, '2016-09-20', 2, NULL, 2, 4, '', '', '', '', 4),
(160, 'Mr. Ear Tola', 'Hotel Corduroy', '+855 12 850 488', 'tola@journeyside.com', NULL, NULL, 'Phnom Penh', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://hotelcorduroy.com', 1, '4.00', 23, '2018-07-10', 3, '1970-01-01', 2, 5, '', '', '', '', 4),
(161, 'Mr. Chris', 'Hostel 543', '+855 68 386 903', 'thehostel543@gmail.com', NULL, NULL, 'Wat Bo road', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://hostel543.com', 2, '0.00', 4, '2015-12-03', 3, NULL, 2, 5, '', '', '', '', 4),
(162, 'Mr. Chanthou Choun', 'Horizons Cambodia', '+855 92 730 031', 'info@horizonscambodia.com', NULL, NULL, 'Street #23, Wat Bo Village, Siem Reap Cambodia', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://horizonscambodia.com', 7, '3.00', 12, '2018-02-28', 3, NULL, 2, 5, '', '', '', '', 4),
(163, 'Ms. Tha Nimol', 'Home Chic Hotel', '+855 11 846 484', 'homechichotel@yahoo.com', NULL, NULL, 'NO. 17, ST. 282, Boeung Keng Kang I | Sangkat BKKI, Khan Chamkarmon', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://homechichotel.com/index.php', 1, '3.00', 50, '2018-04-11', 2, NULL, 2, 4, '', '', '', '', 4),
(164, 'Narin Hem', 'Hillocks Hotel & Spa', '+855 63 966 699', 'info@hillockshotel.com', NULL, NULL, 'Sala Kamreuk Villiage, Sala Kamreuk Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1710', NULL, 'http://hillockshotel.com', 1, '5.00', 38, '2016-09-26', 3, NULL, 2, 5, '', '', '', '', 4),
(165, 'Mr. Sum Chhey', 'Hilary\'s Boutique Hotel', '+855 12 884 467', 'info@hilarysboutiquehotel.com ', NULL, NULL, '#16 Bis, Street 302, Sangkat Boeng Keng Kang I,  Khan Chamkamorn', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://hilarysboutiquehotel.com', 7, '3.00', 13, '2014-12-01', 3, NULL, 2, 5, '', '', '', '', 4),
(166, 'Mr. Rossi', 'Hideaway Boutique Resort', '+855 12 264 700', 'reservation@hideawayboutiqueresort.com', NULL, NULL, 'Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://hideawayboutiqueresort.com', 6, '0.00', 30, '2017-01-19', 3, NULL, 2, 5, '', '', '', '', 4),
(167, 'Ms. Oma Ho', 'Heritage Suites Hotel', '+855 63 969 100', 'oma@heritagesuiteshotel.com', NULL, NULL, 'Near Wat Polanka, Slokram Village, Khum Slok Kram, Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '93101', NULL, 'https://www.heritagesuiteshotel.com', 7, '5.00', 26, '2016-11-19', 3, NULL, 2, 5, '', '', '', '', 4),
(168, 'Mr. Sin Senghong', 'Hello Cambodia Boutique', '+855 77 519 967', 'gm@hellocambodiaboutique.com', NULL, NULL, 'Bakheng Road, Siem Reap Central Area,', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://hellocambodiaboutique.com', 7, '4.00', 23, '2018-03-17', 3, '1970-01-01', 2, 4, '', '', '', '', 4),
(169, 'Mr. Majid Wazir', 'Skor Boutique', '+855 63 966 737', 'info@heavenangkorresidence.com', NULL, NULL, '#0517, Street 7 Makara, Wat Bo Village, Sangkat Salakamroeuk, Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://heavenangkorresidence.com', 7, '4.00', 15, '2017-02-20', 2, '1970-01-01', 2, 4, '', '', '', '', 4),
(170, 'Mr. Vong Senvichet', 'Harmony River Hotel', '+855 89 232 678', 'harmonyriverhotel@yahoo.com', NULL, NULL, '#337, Preah Sisowath Blvd, Sangkat Chey', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://harmonyriverhotel.com', 1, '2.00', 17, '2015-12-08', 3, NULL, 2, 5, '', '', '', '', 4),
(171, 'Mr. Boren Chhay', 'HanumanAlaya Colonial House', '+855 63 760 581', 'boren@hanumanalaya.com', NULL, NULL, 'Treang Village, Slar Kram Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17254', NULL, 'http://colonialhouse.hanumanalaya.com', 6, '4.00', 11, '2016-12-30', 3, NULL, 2, 5, '', '', '', '', 4),
(172, 'Mr. Kosal Sou', 'Green Palace Hotel Phnom Penh', '+855 16 570 057', 'kosal.sou@greenpalacehotel.com', NULL, NULL, '7 No 61, St. 111 Corner 232 Boeung Pralit | Makara District', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://greenpalacehotel.com', 1, '4.00', 144, '2018-02-20', 3, '1970-01-01', 2, 5, '2019-07-01', 'Use solutions from another company ', 'Mr. Kosa', '016 570 057', 5),
(173, 'Mr. Seng Saymeng ', 'Champey Sor Angkor Boutique', '+855 96 444 1411', 'info@champeysorangkorboutique.com', NULL, NULL, 'Phum Svay Dangkum, Svay Dangkum ', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://champeysorangkorboutique.com', 7, '3.50', 20, '2018-09-04', 2, NULL, 2, 4, '', '', '', '', 4),
(174, 'Mr. Ruzaini Rulloda Bin Abdullah ', 'Pearl Resort Cambodia', '+855 12 201 285', 'rrarico@gmail.com', NULL, NULL, 'Koh Rong ', 56, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://pearlresortcambodia.com', 1, '5.00', 30, '2018-09-03', 2, NULL, 2, 4, '', '', '', '', 4),
(175, 'Mr. Sophy', 'Mango Rain Boutique Hotel', '+855 69 755 554', 'gm@mangorainboutique.com', NULL, NULL, 'No. 108 Wat Svay Village, Near Phsar Krom Market, Siem Reap River Side ', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://mangorainboutique.com', 7, '3.00', 17, '2015-09-11', 3, NULL, 2, 4, '', '', '', '', 4),
(176, 'Mr. Lim Rithy', 'Indra Porak Residence', '+855 93 859 007', 'sales@indraporak.com', NULL, NULL, 'Betong Street, Village Vihear Chen, Sangkat Svay Dangkom,near by Pub Street', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://indraporak.com', 7, '3.00', 16, '2015-09-15', 3, NULL, 2, 4, '', '', '', '', 4),
(177, 'Mr. Bonn', 'Popular Residence Hotel ', '+855 81 566 377', 'gm@popularresidence.com', NULL, NULL, 'Sala Kamroeuk Village, Sala Kamroeuk Commune ', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, '+855 16 783 425', 1, '4.00', 26, '2015-09-19', 2, NULL, 2, 4, '', '', '', '', 4),
(178, 'Ran Sophea', 'Ladear Angkor Boutique Hotel', '+855 12 849 190', 'gm@ladearangkorhotel.com', NULL, NULL, 'Street 27, Wat Bo Road, Phum Wat Bo, Khum Salakamroeuk', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://ladearangkorhotel.com', 7, '3.00', 12, '2015-09-21', 2, NULL, 2, 4, '', '', '', '', 4),
(179, 'Mr. Mom Chomroeun', 'Var Sunny Angkor Suite Hotel', '+855 17 673 609', 'gm@varsunnyangkorsuite.com', NULL, NULL, 'National Road 6, Chong Kaosur Village', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://varsunnyangkorsuite.com', 1, '3.00', 28, '2015-09-25', 3, NULL, 2, 4, '', '', '', '', 4),
(180, 'Ms.Hok Rachana', 'Villa Medamrei Boutique Hotel', '+855 12 782 316', 'info@villamedamrei.com', NULL, NULL, 'Vihear Chin Village, Svay Dangkum Commnuce', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://villamedamrei.com', 1, '3.00', 19, '2015-10-28', 3, NULL, 2, 4, '', '', '', '', 4),
(181, 'Seng Parob', 'Panary Angkor Boutique ', '+855 12 920 737', 'info@panaryangkorboutique.com ', NULL, NULL, 'Behind New Apsara Supermarket 200 meters on the right hand side, # 20 Road, Wat Bo Street', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://panaryangkorboutique.com', 7, '3.50', 14, '2015-11-02', 3, NULL, 2, 4, '', '', '', '', 4),
(182, 'Mr. Chris', 'Hostel 543', '+855 93 215 253', 'thehostel543@gmail.com', NULL, NULL, 'Wat Bo road', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://hostel543.com', 2, '2.00', 4, '2015-12-03', 3, NULL, 2, 4, '', '', '', '', 4),
(183, 'Ms. Vann Narin', 'Chez Moi Residence and Spa', '+855 12 584 897', 'residence@chezmoi.asia', NULL, NULL, '#Street 22, Wat Bo, Sangkat Salar Komreuk', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://residence.chezmoi.asia', 1, '4.00', 16, '2016-01-08', 3, NULL, 2, 4, '', '', '', '', 4),
(184, 'Mr. Seang Sovann', 'Tropicana Residence & Resort', '+855 12 842 349', 'rm@tropicanaresidence.com', NULL, NULL, 'Angkor High School Road, Phum Wat Bo, Salakamreuk', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://tropicanaresidence.com ', 1, '4.00', 16, '2016-01-11', 3, NULL, 2, 4, '', '', '', '', 4),
(185, 'Mr. Daravichhay SENG ', 'Angkor Miracle Resort & Spa', '+855 87 882 244', 'em@angkormiracle.com, ee@angkormiracle.com, reserv', NULL, NULL, 'National Road No. 6A. Khum Sra Nge (opposite of Cambodian cultural Village) Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://angkormiracle.com/resort', 1, '5.00', 247, '2015-11-30', 3, NULL, 2, 4, '', '', '', '', 4),
(186, 'Kyry Sok', 'Chronicle Residence And Spa', '+855 12 677 939', 'gm@chronicleresidenceandspa.com, operation@chronic', NULL, NULL, '# Road 30, 200m way from Borei Phreumprey.', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://chronicleresidenceandspa.com', 1, '3.00', 22, '2015-11-27', 3, NULL, 2, 4, '', '', '', '', 4),
(187, 'Mr. Seng Sakada', 'Vilada Angkor Boutique', '+855 12 565 856', 'gm@viladaangkorboutique.com', NULL, NULL, 'Kor Kranch Village, Sangkat Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://viladaangkorboutique.com', 1, '4.00', 7, '2015-11-03', 3, NULL, 2, 4, '', '', '', '', 4),
(188, 'Jacky LONG ', 'Khmere Maison d\'Angkor', '+855 12 660 160', 'jacky@khmeremaisondangkor.com', NULL, NULL, '#482, BO POX 93090, City Center, National Road No.6, Wat Kesaram Street, Sangkat Svay Dangkum,', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://khmeremaisondangkor.com', 7, '3.00', 6, '2016-11-02', 3, NULL, 2, 4, '', '', '', '', 4),
(189, 'Mr.Pahrida Mary', 'Bopha Pollen Hotel', '+855 10 965 899', 'reservation@bophapollenhotel.com, md@bophapollenho', NULL, NULL, ' #202, Taphul village , Svay Dangkum Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://bophapollenhotel.com', 1, '4.00', 29, '2019-01-17', 2, '2019-01-17', 13, 5, '', '', '', '', 4),
(190, 'Mr. Sophat', 'Nagara Angkor Boutique Hotel', '+855 70 559 536', 'booking@nagaraangkor-boutique.com', NULL, NULL, 'Sok San Road, Stueng Thmei Village, Svay Dangkum Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://nagaraangkor-boutique.com', 7, '3.50', 36, '2015-11-21', 3, NULL, 2, 4, '', '', '', '', 4),
(191, 'Mr. Has Sophal', 'Bunwin Plantation', '+855 17 310 229', 'gm@bunwinboutique.com', NULL, NULL, 'Kakranh Village', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://plantation.bunwinplantation.com', 1, '3.00', 14, '2015-09-14', 3, NULL, 2, 4, '', '', '', '', 4),
(192, 'Mrs. CHUM Thida', 'Popular Boutique Hotel', '+855 63 963 578', 'gm@popularboutiquehotel.com', NULL, NULL, 'Address: #033, Vihear Chin Village, Sangkat Svay Daungkum, Siem Reap City', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://popularboutiquehotel.com', 1, '3.00', 36, '2015-09-26', 3, NULL, 2, 4, '', '', '', '', 4),
(193, 'Mr.Has Sophal', 'The Moon Villa ', '+855 12 629 969', 'reservation@themoonvilla.com', NULL, NULL, 'National Road 06,Phum Banteay Chas, Samaki Market zone', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://themoonvilla.com', 3, '3.00', 19, '2015-08-29', 3, NULL, 2, 4, '', '', '', '', 4),
(194, 'Mr.Xing', 'New Riverside Hotel', '+855 12 550 055', 'reservation@newriversidehotel.com, booking@newrive', NULL, NULL, 'Chunlung Village, Sala Komrak Commune ', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://newriversidehotel.com', 1, '3.00', 40, '2015-08-10', 3, NULL, 2, 4, '', '', '', '', 4),
(195, 'Mr.Kan Chansathya', 'Lynnaya Urban River Resort & Spa', '+855 63 967 755', 'gm@lynnaya.com', NULL, NULL, 'Street 20 Krong', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://lynnaya-hotel-angkor.com', 1, '4.00', 46, '2018-08-27', 3, NULL, 2, 4, '', '', '', '', 4),
(196, 'Mr. Rath', 'Mane Boutique Hotel & Spa', '+855 97 552 2222', 'ecom@maneboutiquehotel.com', NULL, NULL, 'Village Salakomroeuk, Sangkat Salakomroeuk', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://maneboutiquehotel.com', 7, '5.00', 18, '2015-08-16', 3, NULL, 2, 4, '', '', '', '', 4),
(197, 'Mr.Kham Serey Chantha', 'The Clay D\' Angkor', '+855 12 388 797', 'info@theclaydangkor.com', NULL, NULL, 'Sala Kanseng Village, Svay Dangkum Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://theclaydangkor.com', 7, '4.00', 6, '2015-09-14', 3, NULL, 2, 4, '', '', '', '', 4),
(198, 'Mr. Bo Channa', 'The Palm Boutique Hotel & Residence', '+855 11 855 901', 'gm@thepalmboutique.com', NULL, NULL, 'No. 270,Street 63, Sangkat Tonle Bassac (Boung Keng Kong II), Khan Chamkarmorn', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '13000', NULL, 'http://thepalmboutique.com', 1, '4.00', 35, '2015-08-25', 3, NULL, 2, 4, '', '', '', '', 4),
(199, 'Mr. Hong', 'Le Grand Mekong Hotel ', '+855 78 591 768', 'gm@legrandmekong.com', NULL, NULL, '253-255, Sisowath Quay, Psar Kandal I District, DaunPenh Commune', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://legrandmekong.com', 1, '3.50', 44, '2015-07-09', 2, NULL, 2, 4, '', '', '', '', 4),
(200, 'Mr. Vong Senvichet', 'Harmony River Hotel', '+855 89 232 678', 'harmonyriverhotel@yahoo.com', NULL, NULL, '#337, Preah Sisowath Blvd, Sangkat Chey', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '13000', NULL, 'http://harmonyriverhotel.com', 1, '2.00', 17, '2015-12-02', 3, NULL, 2, 4, '', '', '', '', 4),
(201, 'Mr. Chea Saichhour', 'Waterview Guesthouse', '+855 12 717 378', 'waterview.gh@gmail.com', NULL, NULL, 'No. 151 Eo, River front Street', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '13000', NULL, 'http://waterviewguesthouse.com', 9, '2.00', 16, '2015-06-02', 3, NULL, 2, 4, '', '', '', '', 4),
(202, 'Sambath Morodok', 'The 1959 Boutique Villa', '+855 16 511 522', 'gm@the1959.com', NULL, NULL, '#24-25, Soramrit Blvd', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '13000', NULL, 'http://the1959.com', 7, '3.50', 6, '2016-03-24', 3, NULL, 2, 4, '2018-11-05', 'Auto Deactivate', 'Sambath Morodok', '+855 11 887 789\r\n+855 16 511 522', 4),
(203, 'Mr. Khemanora', 'Sokea Suites Extends Stay', '+855 12 517 590', 'enquiry@sokeainternational.com.kh', NULL, NULL, 'No. 168, Monireth Boulevard, Sangkat Tomnob Tek, Khan Chamkar Mon', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '13000', NULL, 'http://sokeasuites.com', 1, '3.00', 30, '2015-07-20', 3, NULL, 2, 4, '', '', '', '', 4),
(204, 'Ms.Sak Sothavy ', 'The Blue Corner Boutique Hotel', '+855 12 927 092', 'reservation@thebluecorner.asia', NULL, NULL, 'No.37,Corner St. 63 and St.180, Sangkat Beung Rang,Khan Daun Penh, Phnom Penh', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '13000', NULL, 'http://thebluecorner.asia', 7, '4.00', 23, '2016-03-28', 2, NULL, 2, 4, '', '', '', '', 4),
(205, 'Mrs. Sokha Pech', 'Royal Mekong Boutique Hotel', '+855 92 835 003', 'info@royalmekongboutiquehotel.com', NULL, NULL, '#17, Street 208, Sankat Beoung Reang, Khan Daun Penh', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '13000', NULL, 'http://royalmekongboutiquehotel.com', 1, '3.00', 24, '2014-07-24', 3, NULL, 2, 4, '', '', '', '', 4),
(206, 'Ms. Kim', 'Teav Boutique Hotel', '+855 77 679 999', 'sm@teavgroup.com', NULL, NULL, '# 14, Street 310, Boeung Keng Kang I, Khan Chamkar Mon', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '13000', NULL, 'http://bkk1.teavboutiquehotel.com', 7, '4.00', 12, '2014-11-01', 3, NULL, 2, 4, '', '', '', '', 4),
(207, 'Mr. Kimly Hong', 'You Eng Hotel', '+855 78 525 268', 'youenghotel@yahoo.com', NULL, NULL, 'Russian Federation Blvd, S/K Chorm Chao, Khan Po  Senchey', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '13000', NULL, 'https://youenghotel.com', 1, '4.00', 168, '2014-11-20', 2, NULL, 2, 4, '', '', '', '', 4),
(208, 'Mr. TOEM PUNLORK', 'Omana Boutique Hotel', '+855 70 904 482', 'hello@hotel-omana.com', NULL, NULL, 'Street 9, Phnom Penh 4139', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '13000', NULL, 'http://hotel-omana.com', 1, '4.00', 13, '2018-06-15', 3, '1970-01-01', 2, 4, '2019-02-04', 'They have to renovate the whole building as our electricity and water supply issue', 'Omana Hotel Owner', 'Phone:   +855 12 430 833/ 23 676 3001\r\nEmail:      hello@hotel-omana.com', 4),
(209, 'Mr. Peou Sari', 'The Little Garden Villa', '+855 23 217 871', 'info@littlegarden.asia ', NULL, NULL, '#8A, Street 398, Boeung Keng Kong I', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '13000', NULL, 'http://thelittlegarden.asia', 3, '3.00', 10, '2014-12-01', 3, NULL, 2, 4, '', '', '', '', 4),
(210, 'Mr. Vothyrith Om', 'La Rose Boutique Hotel and Spa', '+855 23 211 130', 'relax@larose.com.kh', NULL, NULL, '#164B, Norodom Blvd', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '13000', NULL, 'http://larose.com.kh/home.php', 7, '4.00', 10, '2014-11-03', 2, NULL, 2, 4, '', '', '', '', 4),
(211, 'Ms. Chea Dimong', 'Samnang Laor Hotel', '+855 87 838 326', 'gm@samnanglaorhotel.com', NULL, NULL, 'No 130, Street 304 & Conner 163, Sangkat Olympic, Khan Chamkamon, Phnom Penh Cambodia. ', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '13000', NULL, 'http://samnanglaorhotel.com', 1, '3.50', 81, '2018-05-08', 3, '1970-01-01', 2, 4, '', '', '', '', 4),
(212, 'Ms. Sivly Lim', 'Indochine 2 Hotel', '+855 23 211 787', 'lim.sivly@indochine2hotel.com', NULL, NULL, 'No. 28-30, Street 130, Phsar Kandal I, Daun Penh, Phnom Penh, Cambodia.', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '13000', NULL, 'http://indochine2hotel.com', 1, '2.00', 30, '2014-12-01', 3, NULL, 2, 4, '', '', '', '', 4),
(213, 'Ms. Seng Sinn', 'Starry Angkor Hotel', '+855 63 968 123', 'asst.sales@starryangkorhotel.com', NULL, NULL, 'No. G4, National Road 6, Banteay Chas Village, Sangkat Slorkram', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://starryangkorhotel.com', 1, '4.00', 127, '2016-02-16', 3, NULL, 2, 4, '', '', '', '', 4),
(214, 'Mr. Veasoth', 'Steung Siemreap Thmey Hotel', '+855 12 249 249', 'sales@steungsiemreapthmeyhotel.com', NULL, NULL, 'Street 9, Khum Svaydangkum, Old Market Area', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://steungsiemreapthmeyhotel.com', 1, '4.00', 76, '2015-10-20', 3, NULL, 2, 4, '', '', '', '', 4),
(215, 'Mr. KEO PHAL', 'Suon Angkor Boutique', '+855 10 277 389', 'Phalkeo783@gmail.com', NULL, NULL, '#211 Phum Watbo ,Sala Kamreuork, Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://suonangkorboutique.com', 4, '4.00', 27, '2019-03-18', 2, '2019-03-20', 13, 5, '', '', '', '', 4),
(216, 'Mr. Piseth Dath', 'Ta Tai Hotel Resort & Marina', '+855 92 885 115', 'piseth.dath@tatairesort.com, info@tatairesort.com', NULL, NULL, 'Dong village, Ta tai commune, Unlongback District', 56, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '13000', NULL, 'http://tatai-hotel.com', 1, '4.00', 53, '2017-04-19', 3, NULL, 2, 4, '', '', '', '', 4),
(217, 'Mr Thim Sin', 'Taingleap Angkor Villa', '+855 78 731 861', 'info@taingleapangkorvilla.com', NULL, NULL, 'Centrally located area. Taphul Street,Siem Reap City', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://taingleapangkorvilla.com', 1, '3.00', 24, '2014-03-14', 3, NULL, 2, 4, '', '', '', '', 4),
(218, 'Mr. Lao Sokun', 'Tanei Boutique Villa', '+855 12 757 867', 'lao_sukun007@yahoo.com', NULL, NULL, '#017, Steung Thmey Village, Svay Dangkom', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://taneiboutiquevilla.com', 1, '3.00', 28, '2015-03-25', 3, NULL, 2, 4, '', '', '', '', 4),
(219, 'Sony Lam', 'Tareach Angkor Villa', '+855 12 771 726', 'sony@tareachangkorvilla.com', NULL, NULL, 'Group 14, #781, Vihear Chin Village,  Svaydongkum Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://tareachangkorvilla.com', 3, '1.00', 14, '2015-02-05', 3, '1970-01-01', 2, 4, '', '', '', '', 4),
(220, 'Ms. Kim Lang', 'Teav Bassac Boutique Hotel', '+855 23 982 828', 'sm@teavgroup.com', NULL, NULL, '#30, Street 09, Tonel Bassac, Khan Chamkamon', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '13000', NULL, 'http://teavbassachotel.com', 7, '4.00', 25, '2016-10-26', 3, NULL, 2, 4, '', '', '', '', 4),
(221, 'Ly  Kim Hua', 'Tep Sodachan Villa Boutique', '+855 77 466 082', 'angkorkimhua@yahoo.com', NULL, NULL, '# 456, Group 7, Khnar Village  Chreave Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17000', NULL, 'http://tepsodachan.com', 1, '3.00', 28, '2015-02-19', 3, NULL, 2, 4, '', '', '', '', 4),
(222, 'Mr. Van narin', 'TravellerHome Angkor', '+855 11 684 262', 'gm@travellerhomeangkor.com', NULL, NULL, 'Steng Thmei, Svaydongkum', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://travellerhomeangkor.com', 1, '4.00', 34, '2016-09-23', 3, '1970-01-01', 2, 5, '2019-05-31', 'They want to save budget for low season', 'Mr. Sopheann', '098 93 2 662 ', 5),
(223, 'Ms. Jennifer', 'Le Mont Hotel', '+855 16 834 207', 'gm@lemonthotel.com', NULL, NULL, 'No. 196 St. 143 corner 304, Sangkat Boeng Keng Kang 2, Chamkarmon', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://lemonthotel.com', 1, '4.00', 98, '2017-12-21', 2, NULL, 2, 5, '', '', '', '', 4),
(224, 'Front Office', 'Our Joint Hotel & Guesthouse', '+855 96 557 4054', 'booking@ourjointhotel.com', NULL, NULL, ' #142, Psar Krom Street', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://ourjointhotel.com', 1, '3.00', 26, '2017-11-14', 2, NULL, 2, 5, '', '', '', '', 4),
(225, 'Mr. Oem Komsorth', 'Reaksmey Chanreas Hotel ', '+855 12 849 967', 'info@reaksmeychanreashotel.com', NULL, NULL, '#330 Sivutha Blvd', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://reaksmeychanreashotel.com', 1, '3.00', 44, '2015-10-23', 2, NULL, 2, 4, '', '', '', '', 4),
(226, 'Mr.  Sous Phearith', 'Le Chanthou Boutique', '+855 63 766 417', 'info@lechanthou.com', NULL, NULL, 'Bakheng Road, Svay Dangkum, Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17254', NULL, 'http://lechanthouboutique.com', 7, '4.00', 15, '2016-11-28', 2, NULL, 2, 5, '', '', '', '', 4),
(227, 'Mr. Sem Sen Visit Veasna', 'Oops Hostel', '+855 63 640 3809', 'info@oopshostel.com, reservation@oopshostel.com, f', NULL, NULL, 'No. B01 Sivutha Blvd, Modul I Village, Siem Reap, Cambodia.', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://oopshostel.com', 2, '2.00', 70, '2017-09-05', 2, NULL, 2, 5, '', '', '', '', 4),
(228, 'Mr. Rady Chum', 'The Villa by Metta', '+855 92 508 545', 'info@mettavilla.com', NULL, NULL, 'Salakamreuk, Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17253', NULL, 'http://mettavilla.com/html', 3, '5.00', 4, '2017-10-26', 2, '1970-01-01', 19, 4, '', '', '', '', 4),
(229, 'So Visal', 'Shadow Angkor Villa', '+855 63 760 363', 'info@shadowangkorvilla.com', NULL, NULL, 'Wat Bo Street , Opposite Wat Preah Prom Rath Pagoda', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1710', NULL, 'https://shadowangkorvilla.com', 3, '3.00', 20, '2017-01-10', 2, '1970-01-01', 2, 5, '', '', '', '', 4),
(230, 'Mr. Kong Sophea', 'Orussey One Hotel & Apartment', '+855 70 200 519', 'booking@orussey1.com, gm@orussey1.com', NULL, NULL, 'No 14, St 111, Corner 198, Sangkat Boeung Prolit, Khan 7Makara', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://orussey1.com', 1, '4.00', 63, '2018-01-17', 2, NULL, 2, 4, '', '', '', '', 4),
(231, 'Mr. Song Vichay', 'The Third Fold Hotel ', '+855 12 278 273', 'vichaysong@gmail.com', NULL, NULL, 'Krom 6, Phoum Sala Kanseng, Sangkat Svay Dangkum, Siem Reap, Cambodia', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://thethirdfold.com', 1, '3.50', 24, '2018-10-22', 2, NULL, 14, 5, '', '', '', '', 4),
(232, 'Suprabha', 'SNOOZE Capsule', '+855 78 937 329', 'info@snoozepodhostel.com ', NULL, NULL, 'No. 025, Sivutha Blvd, Mondul I Village, Svaydangkum Cummune (In front of Vattanac Bank)', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://oasiscapsules.com', 2, '2.00', 14, '2016-06-15', 2, NULL, 2, 4, '', '', '', '', 4),
(233, 'Mr. Sok Piseth', 'Damnak Villa Boutique', '+855 92 686 961', 'info@moonflowersiemreap.com', NULL, NULL, 'Old Market Area, Wat Damnak Village, Salakomreuk Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'https://damnakvillaboutique.com', 1, '3.00', 8, '2018-07-09', 2, NULL, 2, 4, '', '', '', '', 4),
(234, 'Mr. Son kompheak', 'Udaya Residence', '+855 78 764 111', 'ecom@udayaresidence.com', NULL, NULL, '#125, Sala Komroeuk Village, Sala Komroeuk Commune,', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://udayaresidence.com', 7, '4.00', 22, '2016-09-13', 2, NULL, 2, 5, '', '', '', '', 4),
(235, 'Mrs. Sreynet Muong ', 'Boreirum Terkchou', '+855 15 360 540', 'boreirumthmordaresortkampot168@gmail.com', NULL, NULL, 'Teuk Chhou Road, Krong Kampot, Kampot Province, Cambodia', 56, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://boreirum.com', 1, '3.50', 23, '2018-10-15', 2, '1970-01-01', 19, 4, '', '', '', '', 4),
(236, 'Mr. Boyd', 'Sovan Mealea Hotel', '+855 15 596 468', 'sales@sovanmealeahotel.com', NULL, NULL, 'Loktaneuy St, Watbo Village, Salakamreuk', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://sovanmealeahotel.com', 1, '4.00', 42, '2015-12-12', 2, NULL, 2, 4, '', '', '', '', 4),
(237, 'Mr. Jimmy', 'Makk Hotel', '+855 86 375 375', 'info@makkhotel.com', NULL, NULL, 'Sovansakor District, Kampot City, Kampot', 56, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://makkhotel.com', 1, '3.00', 6, '2016-03-16', 2, NULL, 2, 4, '', '', '', '', 4),
(238, 'Try Palace Resort & Spa', 'Try Palace Resort', '+855 36 210 317', 'it@trypalaceresort.com', NULL, NULL, 'Phum Thmey, Sangkat Prey Thom', 56, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://trypalaceresort.com', 6, '5.00', 12, '2016-05-16', 2, NULL, 2, 4, '', '', '', '', 4),
(239, 'Mr. Rin Sophearith', 'Long Beach Resort Koh Rong', '+855 78 810 009', 'info@longbeachresortkohrong.com', NULL, NULL, 'Sok San Village, Koh Rong (Island), Krong Phres SihanoukVille', 56, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://longbeachresortkohrong.com', 6, '5.00', 6, '2018-08-07', 2, NULL, 2, 4, '', '', '', '', 4),
(240, 'Mr.Sivantha', 'The Pipes Resort', '+855 12 896 111', 'md@thepipesresort.com', NULL, NULL, 'Koh Rong Sanleom', 56, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://thepipesresort.com', 6, '4.00', 12, '2016-12-16', 2, NULL, 2, 4, '', '', '', '', 4),
(241, 'CHEN Samphea (Mr.)', 'vKirirom Pine Resort', '+855 78 777 284', 'info@vkirirom.com', NULL, NULL, 'Preah Soramarith-Kosamak National Park', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Kam Pong Speu', NULL, 'http://vkirirom.com', 1, '4.00', 29, '2015-01-23', 2, NULL, 2, 4, '', '', '', '', 4),
(242, 'Ms. Nhek Srey Mom', 'Lux Riverside Hotel & Apartment', '+855 88 888 0968', ' sales@luxriversidehotels.com', NULL, NULL, 'No.2,4,6, Street 136, Sangkat Phsar kandal Khan Daun Penh', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://luxriversidehotels.com', 1, '4.00', 102, '2015-03-20', 2, NULL, 2, 4, '', '', '', '', 4),
(243, 'Mr. Kara', 'Manor House Boutique Hotel', '+855 17 802 922', 'info@manorhousecambodia.com', NULL, NULL, '#21, St. 262, Daun Penh ', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://manorhousecambodia.com', 1, '3.50', 13, '2018-03-28', 2, '1970-01-01', 2, 4, '', '', '', '', 4),
(244, 'Mr. Lak sokchan', 'Le Cocon Boutique Hotel', ' +855 17 565 959', 'sales@lecoconboutiquehotel.com', NULL, NULL, '#29, Street. 334, BKK I, Chamkamon, Phnom Penh', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://lecoconboutiquehotel.com', 1, '4.00', 21, '2017-08-03', 2, NULL, 2, 4, '', '', '', '', 4),
(245, 'Mr. Sok Chesda', 'Sokkhak Boutique Resort', '+855 77 765 697', 'contact@sokkhak-boutiqueresort.com, om@sokkhak-bou', NULL, NULL, 'Kok Chork Village, Trorpeang Ses Commune, Wat Thmey', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://sokkhak-boutiqueresort.com', 1, '5.00', 12, '2014-12-25', 2, NULL, 2, 4, '', '', '', '', 4),
(246, 'Mr. Nareth', 'Shadow Angkor Residence', '+855 92 334 384', 'info@shadowangkorresidence.com', NULL, NULL, 'No 353, Pokambor AVE, on the river side, near Old Market', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://shadowangkorresidence.com', 1, '4.00', 9, '2016-04-07', 3, NULL, 2, 4, '2018-11-02', 'Owner wants Stop using our solutions', 'Nareth', '063 964 774 \r\n066 456 355', 4),
(247, 'Keith Berry', 'The Golden Gecko Villa', '+855 69 641 082', 'info@thegoldengeckovilla.com', NULL, NULL, '20th Street off Wat Bo Road', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'https://thegoldengeckovilla.com', 3, '3.00', 13, '2016-06-06', 2, NULL, 2, 4, '', '', '', '', 4),
(248, 'Mr. Ran Samrah', 'La Rose Blanche Boutique', '+855 93 800 499', 'reservation@laroseblancheboutique.com', NULL, NULL, 'Wat Bo Road, Banteay Chas, Slorkram Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://laroseblancheboutique.com', 1, '4.00', 12, '2016-06-24', 2, NULL, 2, 4, '', '', '', '', 4),
(249, 'Mr. Lay Sok Meng', 'Metta Residence & Spa', '+855 63 766 388', 'info@mettaresidence.com', NULL, NULL, 'Phum Salakamreuk, Sangkat Salakamreuk', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://mettaresidence.com', 1, '5.00', 34, '2016-12-13', 2, NULL, 2, 4, '', '', '', '', 4),
(250, 'Mr. Bunpheng', 'Monthara Angkor Residence', '+855 15 877 766', 'info@montharaangkor.com', NULL, NULL, '# 208, Taphoul Road, Taphoul Village', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://montharaangkor.com', 1, '4.00', 11, '2017-01-17', 3, '1970-01-01', 2, 4, '', '', '', '', 4),
(251, 'Mr. Sam Sopheap', 'The Seda Villa', '+855 89 816 888', 'info@sedavilla.com', NULL, NULL, 'Vat Damnak Village, Sala Kamroeuk Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://sedavilla.com', 3, '3.00', 11, '2017-05-09', 3, NULL, 2, 4, '2018-11-27', 'They Sell Property', 'Mr. Sam Sopheap', '+855 89 816 888', 4),
(252, 'Mr. Seab Sonan', 'Rithy Rine Angkor Residence', '+855 12 302 655', 'info@rithyrineangkorresidence.com', NULL, NULL, 'City Center, Sok San Road, Old French Quarter, Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://rithyrineangkorresidence.com', 1, '3.00', 28, '2017-09-05', 2, NULL, 2, 4, '', '', '', '', 4),
(253, 'Mr. Samoeun', 'Vihara Residence', '+855 98 777 771', 'gm@vihararesidence.com', NULL, NULL, 'Aleah Road, Phum Wat Bo, Khum Salakamroeuk', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://vihararesidence.com', 1, '4.00', 15, '2017-10-19', 2, NULL, 2, 4, '', '', '', '', 4),
(254, 'Mr. Long Vansak', 'The Night Hotel', '+855 63 762 762', 'thenightboutique@gmail.com', NULL, NULL, 'Sok San Road, Stueng Thmei Village, Svay Dangkum Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://thenight-hotel.com', 1, '4.00', 25, '2017-11-10', 2, NULL, 2, 4, '', '', '', '', 4),
(255, 'Ms. Vann Narin', 'SiZen Retreat & Spa', '', 'info@sizen-retreat.com', NULL, NULL, 'Wat Bo road, Slorkarm Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, '', 1, '3.50', 20, '2017-11-10', 3, '1970-01-01', 2, 4, '2019-06-13', 'They want to save budget for low season ', 'Ms. Narin', '098 958 387', 4),
(256, 'Mr. Sous Phearith', 'The Villa Sok San Square', '+855 77 777 356', 'info@thevillasoksansquare.com', NULL, NULL, '456, Sok San Road, Khum Svay Dangkum', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://thevillasoksansquare.com', 1, '3.00', 27, '2018-02-01', 3, '1970-01-01', 2, 4, '', '', '', '', 4),
(257, 'Mr. Sin Senghong', 'Okay1 Villa', '+855 77 519 967', 'senghongsinn@gmail.com', NULL, NULL, 'No. 0325 Tapul, Sangkat Svay Dangkum', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://okay1villa.com/home.aspx', 3, '3.50', 50, '2018-03-02', 3, '1970-01-01', 2, 4, '', '', '', '', 4),
(258, 'Mrs.Kong Sophea ', 'Maison Model D\'Angkor', '+855 70 715 712', ' res@maisonmodeldangkor.com', NULL, NULL, 'No. 482, City center, National Road No.6, Wat Kesararam Street, Group 17, Phum Taphul, Sangkat Svay Dangkum, Siem Reap City, Cambodia.', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://maisonmodeldangkor.com', 1, '2.00', 4, '2018-08-22', 3, '1970-01-01', 2, 4, '', '', '', '', 4),
(259, 'Mr. Sengtry NOL', 'Smiling Deluxe Hotel', '+855 17 295 283', 'info@smilingdeluxehotel.com', NULL, NULL, 'No. 6, Chong Kaosou Village, Sangkat Slor Kram', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://smiling-hotel.com', 1, '4.00', 36, '2018-09-07', 3, '1970-01-01', 14, 4, '2019-02-04', 'Smiling Deluxe Hotel is going to close expense budget soon', 'SENGTRY', '0964817070', 4),
(260, 'Ms. Nataliia Shuba', 'Sea Breeze Resort', '+855 15 899 796', 'reservation@seabreeze-sihanoukville.com', NULL, NULL, 'St. Otres Beach, Village 6, Commune 4', 56, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'https://seabreeze-sihanoukville.com', 1, '3.00', 18, '2015-02-07', 2, NULL, 2, 4, '', '', '', '', 4),
(261, 'Mr. chamnan En', 'Sabara Angkor Resort & Spa', '+855 11 588 830', 'gm@sabaraangkorresort.com, fo@sabaraangkorresort.c', NULL, NULL, 'Sfpda Rd, Krong Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://sabaraangkorresortandspa.com', 1, '5.00', 35, '2018-10-30', 2, NULL, 15, 4, '', '', '', '', 4),
(262, 'Mr. Nit Nimol', ' Image d\' Angkor Boutique Villa', '+855 12 466 881', 'info@imagedangkor.com', NULL, NULL, 'Airport Road, Kruos Village, Svay Dangkum Siem Reap Cambodia', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://imagedangkor.com', 3, '3.00', 3, '2018-11-10', 2, NULL, 15, 5, '', '', '', '', 4),
(263, 'Ms. Yin Sokhunthea', 'Angkor Retreat Villa Boutique & Spa', '+855 76 789 6565', 'info@angkorretreat.com', NULL, NULL, '0126, Wat Bo Rd., Slorkrame Village | Siem Reap, Siem Reap 063, Cambodia', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://angkorretreat.com', 1, '3.00', 13, '2018-11-16', 3, '1970-01-01', 14, 4, '2019-04-01', 'Prepare their property ', 'Ms. Len ', '096 431 8059', 5),
(264, 'Mr. Narong Piseth', 'David Boutique & Spa ', '+855 70 358 788', 'mr.piseth121887@gmail.com', NULL, NULL, 'Krous Village Road, Siem Reap, Cambodia', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://davidboutiqueandspa.com', 4, '3.00', 10, '2018-11-15', 3, '1970-01-01', 14, 4, '', '', '', '', 4),
(265, 'Mr. Orm Piseth', 'Norak Soeng Angkor Hotel', '+855 12 229 947', 'md@noraksoengangkorhotel.com', NULL, NULL, '7 Makara Road, | Phum Wat Bo, Sangkat Salakamroeuk, Siem Reap 17254, Cambodia', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://www.noraksoengangkorhotel.com/', 1, '3.00', 25, '2018-11-14', 2, '1970-01-01', 14, 4, '', '', '', '', 4),
(266, 'Mr. Chin Vichea ', 'Grand Champei Residence ', '+855 78 777 246', 'Chin.vichea@grandchampei.com', NULL, NULL, 'Busters Way, Svay Dangkum, Siem Reap, Kingdom of Cambodia.', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://grandchampei.com', 1, '3.50', 35, '2018-12-08', 3, '1970-01-01', 13, 5, '', '', '', '', 4),
(267, 'Mrs. Sebla Kaplan Ure ', 'Champey Villa', '+855 15 765 138', 'kalplansebla@gmail.com', NULL, NULL, '#166, Street#22 Wat Bo, Sala Kamreouk | (Near Wat Bo primary school), Siem Reap kh, Cambodia', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17252', NULL, 'http://champeyvilla.com', 3, '3.50', 10, '2018-12-07', 3, '1970-01-01', 14, 4, '', '', '', '', 4),
(268, 'Mr. RaBy RY', 'Crystal Blue Boutique Hotel', '+855 96 510 1168', 'rithraby168@gmail.com', NULL, NULL, 'No. 169 Sisowath  Daun Penh, Phnom Penh  Cambodia', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'https://www.crystalblueboutiquehotel.com/', 7, '3.50', 12, '2018-12-24', 2, NULL, 13, 5, '', '', '', '', 4),
(269, 'Ith Sakpitou', 'Damnak Villa Retreat 1 ', '', 'sakpitouith168@gmail.com', NULL, NULL, ' | #92,Group#6,Trapeang Ses, Kork Chak, Siem Reap, Cambodia', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://damnakvillaretreat.com', 3, '3.00', 15, '2019-01-05', 2, '2019-01-15', 14, 4, '2019-01-15', '', '', '', 4),
(270, 'Mr. Meng Morn ', 'Natura Resort', '+855 17 707 526', 'operations@naturahotelresort.com', NULL, NULL, 'Wat Enkosey, Phum Traing, Siem Reap, Cambodia ', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://naturahotelresort.com', 1, '4.00', 23, '2019-01-19', 3, '2019-02-12', 13, 4, '2019-07-01', 'Save budget for low season ', 'Mr. Meng Morn ', '017 707 526', 5),
(271, 'Mr. Zhang Liang', 'The One Gardening Boutique Hotel', '+855 81 216 836', 'gm@theonegardeningboutiquehotel.com', NULL, NULL, 'Banteay, Chas village, Slor Kram commune Siem Reap, CAMBODIA', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'https://theonegardeningboutiquehotel.com', 1, '5.00', 29, '2019-01-30', 2, '2019-02-04', 19, 4, '2019-07-12', 'Due to their budget because they have to work on their new property first.', 'Ms. Keo ', '017 881 224', 5),
(272, 'Mrs. Douk Angkea Socheata', 'Neth Socheata Hotel ', '+855 63 963 294', 'booking@nethsocheatahotel.com', NULL, NULL, '(Pub street area)# 284, 2Thnou Street, directly opposite the Old Market, Siem Reap City, Siem Reap Province, Cambodia', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://nethsocheatahotel.com', 1, '2.00', 22, '2019-02-08', 2, '2019-02-20', 13, 5, '2019-02-11', '', '', '', 4),
(273, 'Mr. Mam Soksann', 'Pool Party Hostel', '+855 10 303 313', 'poolpartyhostel@gmail.com', NULL, NULL, 'Phsar Krom Road , Vihear Chin Village , Svay Dangkum Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://poolpartyhostel.com', 1, '2.00', 20, '2019-02-11', 2, '2019-02-21', 14, 4, '2019-02-21', '', '', '', 4);
INSERT INTO `customer_profile` (`id`, `customer_name`, `company_name`, `phone_number`, `email_address`, `latitute`, `longitute`, `address`, `id_country`, `id_city`, `group_names`, `billing_address`, `id_billing_city`, `id_billing_country`, `shipping_address`, `id_shipping_city`, `id_shipping_country`, `status`, `created_by`, `created_date`, `img_url`, `updated_date`, `updated_by`, `zip_code`, `customer_status`, `website_url`, `accommodation_type`, `star_rating`, `number_of_rooms`, `sale_date`, `accomodation_status`, `lived_date`, `passed_by`, `handle_by`, `deactivated_at`, `deactivated_reason`, `deactivated_requested_by`, `deactivated_requested_contact_detail`, `deactivated_by`) VALUES
(274, 'Mrs. Tha Nimol', 'Best Central Point Hotel ', '+855 77 556 528', 'hometown.hotel@gmail.com', NULL, NULL, 'Phnom Penh ', 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://bestcentralpointhotel.com', 1, '3.00', 42, '2019-06-25', 2, '2019-07-01', 19, 5, '2019-06-28', '', '', '', 4),
(275, 'Mrs. Danh Sokhern', 'Nita Dream Villa', '+855 17 410 768', 'reservation@nitadreamvilla.com', NULL, NULL, 'Near Siem Reap Court, Chreav Village, Chreav Commune, Siem Reap City', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17254', NULL, 'http://nitadreamvilla.com', 1, '3.00', 4, '2019-03-04', 3, '2019-07-01', 2, 4, '2019-07-01', 'Save budget for low season ', 'Ms. Danh Dane ', '015 737 927', 5),
(276, 'Mr. So', 'Wheel Garden Residence ', '+855 12 458 184', 'sales@wheelgarden.com', NULL, NULL, 'Psa Krolanh Street Trapeang Ses Village, Sangkat Kouk Chak, Siem Reap ', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '17259', NULL, 'http://wheelgarden.com', 1, '4.00', 30, '2019-06-28', 2, '2019-07-08', 19, 4, '2019-07-08', '', '', '', 2),
(277, 'Mr. Komsort', 'Romantic Angkor Residence ', '+855 70 770 002', 'romanticangkors@gmail.com', NULL, NULL, 'Wat Bo Village, Sala Kamreuk Commune, Siem Reap Cambodia', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://romanticangkor.com', 7, '4.00', 15, '2019-07-08', 1, '2019-07-08', 19, 5, '2019-07-08', '', '', '', 2),
(278, 'Mr.Sok Piseth', 'Moon Flower Residence', '+855 69 700 304', 'info@moonflowersiemreap.com', NULL, NULL, 'Old Market Area, Wat Damnak Village, Salakomreuk Commune', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'https://damnakvillaboutique.com', 1, '3.00', 8, '2018-07-09', 2, '2019-08-07', 19, 4, '2019-08-07', '', '', '', 2),
(279, 'Mr. Borei', 'Siem Reap Palace Residence', '+855 98 675 556', 'book@siemreappalace-residence.com', NULL, NULL, 'Siem Reap', 56, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, 'http://siemreappalace-residence.com', 7, '4.00', 26, '2019-08-06', 1, '2019-08-07', 19, 4, '2019-08-07', '', '', '', 2),
(280, 'Mr.Rady', 'Dragon Royal Angkor Hotel', '087543288', 'director@dragon.com', NULL, NULL, '6St', 56, 21, NULL, '', NULL, 56, '', NULL, 56, 1, 23, '2019-08-22 14:52:53', NULL, '2019-08-22 14:54:13', 23, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL),
(281, 'ex: 1 (data)', 'ex: 1 (data)', '0987654321', 'testing1@eo.com', NULL, NULL, 'ex: 1 (data)', NULL, NULL, NULL, 'ex: 1 (data)', NULL, NULL, 'ex: 1 (data)', NULL, NULL, NULL, 20, '2019-08-23 16:05:03', NULL, NULL, NULL, 'ex: 1 (data)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(282, 'ex: 2 (data)', 'ex: 2 (data)', '0123456789', 'testing2@eo.com', NULL, NULL, 'ex: 2 (data)', NULL, NULL, NULL, 'ex: 2 (data)', NULL, NULL, 'ex: 2 (data)', NULL, NULL, NULL, 20, '2019-08-23 16:05:03', NULL, NULL, NULL, 'ex: 2 (data)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(283, 'ex: 3 (data)', 'ex: 3 (data)', '0681234567', 'testing3@eo.com', NULL, NULL, 'ex: 3 (data)', NULL, NULL, NULL, 'ex: 3 (data)', NULL, NULL, 'ex: 3 (data)', NULL, NULL, NULL, 20, '2019-08-23 16:05:03', NULL, NULL, NULL, 'ex: 3 (data)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(284, 'ex: 4 (data)', 'ex: 4 (data)', 'ex: 4 (data)', 'testing4@eo.com', NULL, NULL, 'ex: 4 (data)', NULL, NULL, NULL, 'ex: 4 (data)', NULL, NULL, 'ex: 4 (data)', NULL, NULL, NULL, 20, '2019-08-23 16:38:30', NULL, NULL, NULL, 'ex: 4 (data)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(285, 'ex: 5 (data)', 'ex: 5 (data)', 'ex: 5 (data)', 'testing5@eo.com', NULL, NULL, 'ex: 5 (data)', NULL, NULL, NULL, 'ex: 5 (data)', NULL, NULL, 'ex: 5 (data)', NULL, NULL, NULL, 20, '2019-08-23 16:38:30', NULL, NULL, NULL, 'ex: 5 (data)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(286, 'ex: 6 (data)', 'ex: 6 (data)', 'ex: 6 (data)', 'testing6@eo.com', NULL, NULL, 'ex: 6 (data)', NULL, NULL, NULL, 'ex: 6 (data)', NULL, NULL, 'ex: 6 (data)', NULL, NULL, NULL, 20, '2019-08-23 16:38:30', NULL, NULL, NULL, 'ex: 6 (data)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(287, 'Test-Rithyraeck', 'eOcambo', '010 80 85 90', 'rithyraeck@eocambo.com', NULL, NULL, 'Siem Reap', NULL, NULL, NULL, 'SR', NULL, NULL, 'Takong', NULL, NULL, NULL, 20, '2019-08-23 16:57:22', NULL, NULL, NULL, '17252', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(288, 'Test-Rithyraeck1', 'eOcambo1', 'x010 80 85 90x', 'rithyraeck1@eo.com', NULL, NULL, 'Siem Reap1', NULL, NULL, NULL, 'SRs', NULL, NULL, 'Takong1', NULL, NULL, NULL, 20, '2019-08-23 17:00:20', NULL, NULL, NULL, '17252x', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_profile_contact`
--

CREATE TABLE `customer_profile_contact` (
  `id` int(11) NOT NULL,
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
  `note` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `customer_profile_group`
--

CREATE TABLE `customer_profile_group` (
  `id` int(11) NOT NULL,
  `id_customer_profile` int(11) DEFAULT NULL,
  `id_customer_group` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `customer_profile_group`
--

INSERT INTO `customer_profile_group` (`id`, `id_customer_profile`, `id_customer_group`) VALUES
(1, NULL, 1),
(2, NULL, 2),
(3, NULL, 3),
(4, NULL, 4),
(5, 7, 1),
(6, 7, 2),
(7, 7, 3),
(8, 7, 4),
(9, 1, 1),
(10, 280, 3);

-- --------------------------------------------------------

--
-- Table structure for table `customer_profile_note`
--

CREATE TABLE `customer_profile_note` (
  `id` int(11) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(11) DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_profile_solution`
--

CREATE TABLE `customer_profile_solution` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `id_solution` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_profile_solution`
--

INSERT INTO `customer_profile_solution` (`id`, `id_customer`, `id_solution`) VALUES
(5, 4, 1),
(6, 4, 3),
(7, 4, 6),
(8, 4, 7),
(9, 5, 1),
(10, 5, 2),
(11, 5, 6),
(12, 5, 7),
(13, 6, 1),
(14, 6, 4),
(15, 6, 6),
(16, 7, 1),
(17, 7, 4),
(18, 7, 5),
(19, 7, 6),
(20, 8, 1),
(21, 8, 3),
(22, 8, 4),
(23, 8, 6),
(24, 8, 7),
(25, 9, 1),
(26, 9, 4),
(27, 9, 6),
(28, 9, 7),
(29, 11, 3),
(30, 11, 6),
(31, 13, 1),
(32, 13, 3),
(33, 13, 6),
(34, 13, 7),
(35, 14, 1),
(36, 14, 4),
(37, 14, 6),
(38, 15, 1),
(39, 15, 4),
(40, 15, 6),
(41, 16, 1),
(42, 16, 4),
(43, 16, 6),
(44, 16, 7),
(45, 17, 1),
(46, 17, 4),
(47, 17, 6),
(48, 18, 1),
(49, 18, 4),
(50, 18, 6),
(51, 18, 7),
(52, 19, 1),
(53, 19, 4),
(54, 19, 6),
(55, 20, 1),
(56, 20, 4),
(57, 20, 6),
(58, 20, 7),
(59, 22, 1),
(60, 22, 6),
(61, 22, 7),
(62, 23, 1),
(63, 23, 4),
(64, 23, 6),
(65, 23, 7),
(66, 25, 1),
(67, 25, 3),
(68, 25, 6),
(69, 25, 7),
(70, 26, 1),
(71, 26, 4),
(72, 26, 5),
(73, 26, 6),
(74, 26, 7),
(75, 27, 1),
(76, 27, 3),
(77, 27, 6),
(78, 28, 1),
(79, 28, 3),
(80, 28, 6),
(81, 29, 1),
(82, 29, 4),
(83, 29, 6),
(84, 30, 1),
(85, 30, 2),
(86, 30, 4),
(87, 30, 6),
(88, 30, 7),
(89, 31, 1),
(90, 31, 3),
(91, 31, 6),
(92, 31, 7),
(93, 32, 1),
(94, 32, 4),
(95, 32, 5),
(96, 32, 6),
(97, 32, 7),
(98, 33, 1),
(99, 33, 6),
(100, 33, 7),
(101, 34, 1),
(102, 34, 4),
(103, 34, 5),
(104, 34, 6),
(105, 34, 7),
(106, 36, 1),
(107, 36, 4),
(108, 36, 6),
(109, 36, 7),
(110, 37, 1),
(111, 37, 3),
(112, 37, 6),
(113, 37, 7),
(114, 38, 1),
(115, 38, 3),
(116, 38, 6),
(117, 39, 1),
(118, 39, 3),
(119, 39, 6),
(120, 40, 1),
(121, 40, 4),
(122, 40, 6),
(123, 40, 7),
(124, 41, 1),
(125, 41, 3),
(126, 41, 6),
(127, 41, 7),
(128, 42, 1),
(129, 42, 3),
(130, 42, 6),
(131, 43, 1),
(132, 43, 3),
(133, 43, 6),
(134, 43, 7),
(135, 44, 1),
(136, 44, 3),
(137, 44, 6),
(138, 45, 1),
(139, 45, 2),
(140, 45, 4),
(141, 45, 6),
(142, 45, 7),
(143, 46, 1),
(144, 46, 3),
(145, 46, 6),
(146, 47, 1),
(147, 47, 3),
(148, 47, 6),
(149, 48, 1),
(150, 48, 4),
(151, 48, 6),
(152, 48, 7),
(153, 49, 1),
(154, 49, 4),
(155, 49, 6),
(156, 50, 1),
(157, 50, 4),
(158, 50, 6),
(159, 51, 1),
(160, 51, 4),
(161, 51, 6),
(162, 51, 7),
(163, 54, 1),
(164, 54, 4),
(165, 54, 6),
(166, 54, 7),
(167, 55, 1),
(168, 55, 3),
(169, 55, 6),
(170, 56, 1),
(171, 56, 4),
(172, 56, 6),
(173, 57, 1),
(174, 57, 3),
(175, 57, 6),
(176, 57, 7),
(177, 58, 1),
(178, 58, 3),
(179, 58, 6),
(180, 59, 1),
(181, 59, 5),
(182, 59, 6),
(183, 60, 1),
(184, 60, 4),
(185, 60, 6),
(186, 60, 7),
(187, 61, 1),
(188, 61, 3),
(189, 61, 6),
(190, 61, 7),
(191, 62, 1),
(192, 62, 4),
(193, 62, 5),
(194, 62, 6),
(195, 63, 1),
(196, 63, 4),
(197, 63, 6),
(198, 63, 7),
(199, 64, 1),
(200, 64, 3),
(201, 64, 6),
(202, 66, 1),
(203, 66, 3),
(204, 66, 6),
(205, 66, 7),
(206, 72, 1),
(207, 72, 4),
(208, 72, 5),
(209, 72, 6),
(210, 74, 1),
(211, 74, 3),
(212, 74, 6),
(213, 74, 7),
(214, 81, 1),
(215, 81, 4),
(216, 81, 6),
(217, 83, 1),
(218, 83, 3),
(219, 83, 6),
(220, 96, 1),
(221, 96, 4),
(222, 96, 6),
(223, 96, 7),
(224, 100, 1),
(225, 100, 6),
(226, 100, 7),
(227, 101, 1),
(228, 101, 4),
(229, 101, 6),
(230, 102, 1),
(231, 102, 2),
(232, 102, 3),
(233, 102, 6),
(234, 102, 7),
(235, 103, 1),
(236, 103, 4),
(237, 103, 5),
(238, 103, 6),
(239, 105, 1),
(240, 105, 4),
(241, 105, 6),
(242, 106, 1),
(243, 106, 4),
(244, 106, 6),
(245, 106, 7),
(246, 107, 1),
(247, 107, 4),
(248, 107, 6),
(249, 107, 7),
(250, 109, 1),
(251, 109, 4),
(252, 109, 6),
(253, 109, 7),
(254, 111, 1),
(255, 111, 2),
(256, 111, 4),
(257, 111, 6),
(258, 111, 7),
(259, 112, 1),
(260, 112, 2),
(261, 112, 4),
(262, 112, 6),
(263, 112, 7),
(264, 113, 1),
(265, 113, 4),
(266, 113, 6),
(267, 113, 7),
(268, 114, 1),
(269, 114, 4),
(270, 114, 6),
(271, 114, 7),
(272, 124, 1),
(273, 124, 4),
(274, 124, 6),
(275, 124, 7),
(276, 125, 1),
(277, 125, 4),
(278, 125, 6),
(279, 125, 7),
(280, 126, 1),
(281, 126, 2),
(282, 126, 4),
(283, 126, 6),
(284, 126, 7),
(285, 127, 1),
(286, 127, 4),
(287, 127, 6),
(288, 127, 7),
(289, 131, 1),
(290, 131, 2),
(291, 131, 3),
(292, 131, 6),
(293, 131, 7),
(294, 132, 1),
(295, 132, 2),
(296, 132, 4),
(297, 132, 6),
(298, 132, 7),
(299, 136, 1),
(300, 136, 2),
(301, 136, 4),
(302, 136, 6),
(303, 136, 7),
(304, 139, 1),
(305, 139, 6),
(306, 139, 7),
(307, 141, 1),
(308, 141, 4),
(309, 141, 6),
(310, 141, 7),
(311, 142, 1),
(312, 142, 3),
(313, 142, 6),
(314, 142, 7),
(315, 151, 1),
(316, 151, 3),
(317, 151, 6),
(318, 151, 7),
(319, 154, 1),
(320, 154, 2),
(321, 154, 4),
(322, 154, 6),
(323, 154, 7),
(324, 157, 1),
(325, 157, 3),
(326, 157, 6),
(327, 157, 7),
(328, 158, 1),
(329, 158, 4),
(330, 158, 6),
(331, 158, 7),
(332, 160, 1),
(333, 160, 2),
(334, 160, 6),
(335, 160, 7),
(336, 165, 1),
(337, 165, 4),
(338, 165, 6),
(339, 166, 1),
(340, 166, 4),
(341, 166, 6),
(342, 169, 1),
(343, 169, 6),
(344, 169, 7),
(345, 170, 1),
(346, 170, 2),
(347, 170, 4),
(348, 170, 6),
(349, 170, 7),
(350, 177, 1),
(351, 177, 4),
(352, 177, 6),
(353, 177, 7),
(354, 178, 1),
(355, 178, 2),
(356, 178, 6),
(357, 179, 1),
(358, 179, 2),
(359, 179, 3),
(360, 179, 6),
(361, 179, 7),
(362, 180, 1),
(363, 180, 2),
(364, 180, 6),
(365, 183, 1),
(366, 183, 4),
(367, 183, 6),
(368, 183, 7),
(369, 188, 1),
(370, 188, 4),
(371, 188, 6),
(372, 188, 7),
(373, 189, 1),
(374, 189, 4),
(375, 189, 6),
(376, 189, 7),
(377, 192, 1),
(378, 192, 4),
(379, 192, 6),
(380, 193, 1),
(381, 193, 4),
(382, 193, 6),
(383, 193, 7),
(384, 194, 1),
(385, 194, 2),
(386, 194, 4),
(387, 194, 6),
(388, 194, 7),
(389, 197, 1),
(390, 197, 4),
(391, 197, 6),
(392, 198, 1),
(393, 198, 3),
(394, 198, 6),
(395, 198, 7),
(396, 199, 1),
(397, 199, 4),
(398, 199, 6),
(399, 206, 1),
(400, 206, 4),
(401, 206, 6),
(402, 206, 7),
(403, 212, 1),
(404, 212, 2),
(405, 212, 3),
(406, 212, 6),
(407, 214, 1),
(408, 214, 3),
(409, 214, 6),
(410, 217, 1),
(411, 217, 4),
(412, 217, 6),
(413, 217, 7),
(414, 218, 1),
(415, 218, 3),
(416, 218, 6),
(417, 218, 7),
(418, 219, 1),
(419, 219, 4),
(420, 219, 6),
(421, 223, 1),
(422, 223, 4),
(423, 223, 5),
(424, 223, 6),
(425, 226, 1),
(426, 226, 3),
(427, 226, 6),
(428, 226, 7),
(429, 227, 1),
(430, 227, 4),
(431, 227, 6),
(432, 229, 1),
(433, 229, 3),
(434, 229, 6),
(435, 229, 7),
(436, 230, 1),
(437, 230, 4),
(438, 230, 6),
(439, 230, 7),
(440, 231, 1),
(441, 231, 3),
(442, 231, 6),
(443, 231, 7),
(444, 234, 1),
(445, 234, 6),
(446, 234, 7),
(447, 236, 1),
(448, 236, 3),
(449, 236, 6),
(450, 236, 7),
(451, 237, 1),
(452, 237, 6),
(453, 237, 7),
(454, 241, 1),
(455, 241, 3),
(456, 241, 6),
(457, 241, 7),
(458, 242, 1),
(459, 242, 2),
(460, 242, 4),
(461, 242, 6),
(462, 242, 7),
(463, 245, 1),
(464, 245, 4),
(465, 245, 6),
(466, 246, 1),
(467, 246, 6),
(468, 246, 7),
(469, 248, 1),
(470, 248, 3),
(471, 248, 6),
(472, 248, 7),
(473, 250, 1),
(474, 250, 4),
(475, 250, 6),
(476, 250, 7),
(477, 251, 7),
(478, 252, 1),
(479, 252, 2),
(480, 252, 4),
(481, 252, 6),
(482, 252, 7),
(483, 255, 1),
(484, 255, 4),
(485, 255, 6),
(486, 256, 1),
(487, 256, 4),
(488, 256, 6),
(489, 256, 7),
(490, 257, 1),
(491, 257, 4),
(492, 257, 6),
(493, 259, 1),
(494, 259, 4),
(495, 259, 6),
(496, 259, 7),
(497, 260, 1),
(498, 260, 4),
(499, 260, 6),
(500, 260, 7),
(501, 261, 1),
(502, 261, 2),
(503, 261, 6),
(504, 261, 7),
(505, 262, 1),
(506, 262, 3),
(507, 262, 6),
(508, 262, 7),
(509, 263, 1),
(510, 263, 2),
(511, 263, 4),
(512, 263, 6),
(513, 263, 7),
(514, 264, 1),
(515, 264, 2),
(516, 264, 3),
(517, 264, 6),
(518, 264, 7),
(519, 265, 1),
(520, 265, 4),
(521, 265, 6),
(522, 265, 7),
(523, 266, 1),
(524, 266, 2),
(525, 266, 3),
(526, 266, 6),
(527, 266, 7),
(528, 267, 1),
(529, 267, 6),
(530, 267, 7),
(531, 268, 1),
(532, 268, 4),
(533, 268, 6),
(534, 269, 1),
(535, 269, 2),
(536, 269, 4),
(537, 269, 6),
(538, 269, 7),
(539, 270, 1),
(540, 270, 2),
(541, 270, 3),
(542, 270, 6),
(543, 270, 7),
(544, 271, 1),
(545, 271, 4),
(546, 271, 6),
(547, 271, 7),
(548, 274, 1),
(549, 274, 2),
(550, 274, 4),
(551, 274, 7),
(552, 275, 1),
(553, 275, 3),
(554, 275, 6),
(555, 275, 7),
(556, 277, 1),
(557, 277, 2),
(558, 277, 4),
(559, 277, 6),
(560, 277, 7),
(561, 278, 1),
(562, 278, 4),
(563, 278, 6),
(564, 278, 7),
(565, 279, 1),
(566, 279, 2),
(567, 279, 4),
(568, 279, 6),
(569, 279, 7),
(574, 281, 1),
(575, 281, 4),
(576, 281, 6),
(577, 281, 7),
(578, 282, 1),
(579, 282, 3),
(580, 282, 6),
(581, 282, 7),
(582, 283, 1),
(583, 283, 2),
(584, 283, 3),
(585, 283, 6),
(586, 283, 7),
(587, 284, 1),
(588, 284, 4),
(589, 284, 6),
(590, 284, 7),
(591, 285, 1),
(592, 285, 4),
(593, 285, 6),
(594, 286, 1),
(595, 286, 4),
(596, 286, 6),
(597, 287, 1),
(598, 287, 2),
(599, 287, 3),
(600, 287, 6),
(601, 287, 7),
(602, 288, 1),
(603, 288, 4),
(604, 288, 6),
(605, 288, 7),
(606, 289, 1),
(607, 289, 4),
(608, 289, 6),
(609, 289, 7),
(610, 290, 1),
(611, 290, 4),
(612, 290, 6),
(613, 291, 1),
(614, 291, 4),
(615, 291, 6),
(616, 292, 1),
(617, 292, 4),
(618, 292, 6),
(619, 293, 1),
(620, 293, 4),
(621, 293, 6),
(622, 294, 1),
(623, 294, 6),
(624, 294, 7),
(625, 295, 1),
(626, 295, 6),
(627, 295, 7),
(628, 296, 1),
(629, 296, 6),
(630, 296, 7),
(631, 297, 1),
(632, 297, 6),
(633, 297, 7),
(634, 298, 1),
(635, 298, 4),
(636, 298, 6),
(637, 299, 1),
(638, 299, 4),
(639, 299, 6),
(640, 299, 7),
(641, 300, 1),
(642, 300, 3),
(643, 300, 6),
(644, 301, 1),
(645, 301, 4),
(646, 301, 6),
(647, 302, 1),
(648, 302, 3),
(649, 302, 6),
(650, 303, 1),
(651, 303, 3),
(652, 303, 6),
(653, 303, 7),
(654, 304, 1),
(655, 304, 2),
(656, 304, 3),
(657, 304, 4),
(658, 304, 5),
(659, 304, 6),
(660, 306, 2),
(661, 307, 1),
(662, 307, 6),
(663, 307, 7),
(664, 308, 2),
(665, 308, 7),
(666, 311, 3),
(667, 311, 6),
(668, 312, 1),
(669, 312, 4),
(670, 312, 6),
(671, 312, 7),
(672, 314, 1),
(673, 314, 3),
(674, 314, 6),
(675, 314, 7),
(676, 315, 1),
(677, 315, 4),
(678, 315, 6),
(679, 316, 1),
(680, 316, 4),
(681, 316, 6),
(682, 316, 7),
(683, 317, 1),
(684, 317, 4),
(685, 317, 6),
(686, 317, 7),
(687, 318, 1),
(688, 318, 2),
(689, 318, 3),
(690, 318, 6),
(691, 318, 7),
(692, 319, 1),
(693, 319, 4),
(694, 319, 6),
(733, 1, 1),
(734, 1, 2),
(735, 1, 3),
(736, 1, 4),
(737, 1, 6),
(738, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `customer_profile_status`
--

CREATE TABLE `customer_profile_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_profile_status`
--

INSERT INTO `customer_profile_status` (`id`, `name`, `created_date`, `updated_by`, `created_by`, `updated_date`, `status`) VALUES
(1, 'New', NULL, NULL, NULL, NULL, 1),
(2, 'Contacted', NULL, NULL, NULL, NULL, 1),
(3, 'Qualified', NULL, NULL, NULL, NULL, 1),
(4, 'Working', NULL, NULL, NULL, NULL, 1),
(5, 'Proposal Sent', NULL, NULL, NULL, NULL, 1),
(6, 'Customer', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_solution_status`
--

CREATE TABLE `customer_solution_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `order_by` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_solution_status`
--

INSERT INTO `customer_solution_status` (`id`, `name`, `order_by`) VALUES
(1, 'Inprocessing', 2),
(2, 'Lived', 3),
(3, 'Terminated', 4),
(4, 'New Sale', 1);

-- --------------------------------------------------------

--
-- Table structure for table `data_option_phone_number_country_code`
--

CREATE TABLE `data_option_phone_number_country_code` (
  `id` int(11) NOT NULL,
  `short_name` varchar(10) DEFAULT NULL,
  `names` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `data_option_phone_number_country_code`
--

INSERT INTO `data_option_phone_number_country_code` (`id`, `short_name`, `names`, `code`, `status`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 'AD', 'ANDORRA', '376', 1, 1, '2019-01-09 09:58:14', 1, '2019-04-24 16:52:44'),
(2, 'AE', 'UNITED ARAB EMIRATES', '971', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(3, 'AF', 'AFGHANISTAN', '93', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(4, 'AG', 'ANTIGUA AND BARBUDA', '1268', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(5, 'AI', 'ANGUILLA', '1264', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(6, 'AL', 'ALBANIA', '355', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(7, 'AM', 'ARMENIA', '374', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(8, 'AN', 'NETHERLANDS ANTILLES', '599', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(9, 'AO', 'ANGOLA', '244', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(10, 'AQ', 'ANTARCTICA', '672', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(11, 'AR', 'ARGENTINA', '54', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(12, 'AS', 'AMERICAN SAMOA', '1684', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(13, 'AT', 'AUSTRIA', '43', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(14, 'AU', 'AUSTRALIA', '61', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(15, 'AW', 'ARUBA', '297', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(16, 'AZ', 'AZERBAIJAN', '994', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(17, 'BA', 'BOSNIA AND HERZEGOVINA', '387', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(18, 'BB', 'BARBADOS', '1246', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(19, 'BD', 'BANGLADESH', '880', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(20, 'BE', 'BELGIUM', '32', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(21, 'BF', 'BURKINA FASO', '226', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(22, 'BG', 'BULGARIA', '359', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(23, 'BH', 'BAHRAIN', '973', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(24, 'BI', 'BURUNDI', '257', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(25, 'BJ', 'BENIN', '229', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(26, 'BL', 'SAINT BARTHELEMY', '590', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(27, 'BM', 'BERMUDA', '1441', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(28, 'BN', 'BRUNEI DARUSSALAM', '673', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(29, 'BO', 'BOLIVIA', '591', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(30, 'BR', 'BRAZIL', '55', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(31, 'BS', 'BAHAMAS', '1242', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(32, 'BT', 'BHUTAN', '975', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(33, 'BW', 'BOTSWANA', '267', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(34, 'BY', 'BELARUS', '375', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(35, 'BZ', 'BELIZE', '501', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(36, 'CA', 'CANADA', '1', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(37, 'CC', 'COCOS (KEELING) ISLANDS', '61', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(38, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', '243', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(39, 'CF', 'CENTRAL AFRICAN REPUBLIC', '236', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(40, 'CG', 'CONGO', '242', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(41, 'CH', 'SWITZERLAND', '41', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(42, 'CI', 'COTE D IVOIRE', '225', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(43, 'CK', 'COOK ISLANDS', '682', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(44, 'CL', 'CHILE', '56', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(45, 'CM', 'CAMEROON', '237', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(46, 'CN', 'CHINA', '86', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(47, 'CO', 'COLOMBIA', '57', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(48, 'CR', 'COSTA RICA', '506', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(49, 'CU', 'CUBA', '53', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(50, 'CV', 'CAPE VERDE', '238', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(51, 'CX', 'CHRISTMAS ISLAND', '61', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(52, 'CY', 'CYPRUS', '357', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(53, 'CZ', 'CZECH REPUBLIC', '420', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(54, 'DE', 'GERMANY', '49', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(55, 'DJ', 'DJIBOUTI', '253', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(56, 'DK', 'DENMARK', '45', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(57, 'DM', 'DOMINICA', '1767', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(58, 'DO', 'DOMINICAN REPUBLIC', '1809', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(59, 'DZ', 'ALGERIA', '213', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(60, 'EC', 'ECUADOR', '593', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(61, 'EE', 'ESTONIA', '372', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(62, 'EG', 'EGYPT', '20', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(63, 'ER', 'ERITREA', '291', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(64, 'ES', 'SPAIN', '34', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(65, 'ET', 'ETHIOPIA', '251', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(66, 'FI', 'FINLAND', '358', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(67, 'FJ', 'FIJI', '679', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(68, 'FK', 'FALKLAND ISLANDS (MALVINAS)', '500', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(69, 'FM', 'MICRONESIA, FEDERATED STATES OF', '691', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(70, 'FO', 'FAROE ISLANDS', '298', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(71, 'FR', 'FRANCE', '33', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(72, 'GA', 'GABON', '241', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(73, 'GB', 'UNITED KINGDOM', '44', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(74, 'GD', 'GRENADA', '1473', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(75, 'GE', 'GEORGIA', '995', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(76, 'GH', 'GHANA', '233', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(77, 'GI', 'GIBRALTAR', '350', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(78, 'GL', 'GREENLAND', '299', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(79, 'GM', 'GAMBIA', '220', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(80, 'GN', 'GUINEA', '224', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(81, 'GQ', 'EQUATORIAL GUINEA', '240', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(82, 'GR', 'GREECE', '30', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(83, 'GT', 'GUATEMALA', '502', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(84, 'GU', 'GUAM', '1671', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(85, 'GW', 'GUINEA-BISSAU', '245', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(86, 'GY', 'GUYANA', '592', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(87, 'HK', 'HONG KONG', '852', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(88, 'HN', 'HONDURAS', '504', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(89, 'HR', 'CROATIA', '385', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(90, 'HT', 'HAITI', '509', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(91, 'HU', 'HUNGARY', '36', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(92, 'ID', 'INDONESIA', '62', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(93, 'IE', 'IRELAND', '353', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(94, 'IL', 'ISRAEL', '972', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(95, 'IM', 'ISLE OF MAN', '44', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(96, 'IN', 'INDIA', '91', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(97, 'IQ', 'IRAQ', '964', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(98, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', '98', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(99, 'IS', 'ICELAND', '354', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(100, 'IT', 'ITALY', '39', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(101, 'JM', 'JAMAICA', '1876', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(102, 'JO', 'JORDAN', '962', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(103, 'JP', 'JAPAN', '81', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(104, 'KE', 'KENYA', '254', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(105, 'KG', 'KYRGYZSTAN', '996', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(106, 'KH', 'CAMBODIA', '855', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(107, 'KI', 'KIRIBATI', '686', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(108, 'KM', 'COMOROS', '269', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(109, 'KN', 'SAINT KITTS AND NEVIS', '1869', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(110, 'KP', 'KOREA DEMOCRATIC PEOPLES REPUBLIC OF', '850', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(111, 'KR', 'KOREA REPUBLIC OF', '82', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(112, 'KW', 'KUWAIT', '965', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(113, 'KY', 'CAYMAN ISLANDS', '1345', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(114, 'KZ', 'KAZAKSTAN', '7', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(115, 'LA', 'LAO PEOPLES DEMOCRATIC REPUBLIC', '856', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(116, 'LB', 'LEBANON', '961', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(117, 'LC', 'SAINT LUCIA', '1758', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(118, 'LI', 'LIECHTENSTEIN', '423', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(119, 'LK', 'SRI LANKA', '94', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(120, 'LR', 'LIBERIA', '231', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(121, 'LS', 'LESOTHO', '266', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(122, 'LT', 'LITHUANIA', '370', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(123, 'LU', 'LUXEMBOURG', '352', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(124, 'LV', 'LATVIA', '371', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(125, 'LY', 'LIBYAN ARAB JAMAHIRIYA', '218', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(126, 'MA', 'MOROCCO', '212', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(127, 'MC', 'MONACO', '377', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(128, 'MD', 'MOLDOVA, REPUBLIC OF', '373', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(129, 'ME', 'MONTENEGRO', '382', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(130, 'MF', 'SAINT MARTIN', '1599', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(131, 'MG', 'MADAGASCAR', '261', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(132, 'MH', 'MARSHALL ISLANDS', '692', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(133, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', '389', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(134, 'ML', 'MALI', '223', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(135, 'MM', 'MYANMAR', '95', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(136, 'MN', 'MONGOLIA', '976', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(137, 'MO', 'MACAU', '853', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(138, 'MP', 'NORTHERN MARIANA ISLANDS', '1670', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(139, 'MR', 'MAURITANIA', '222', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(140, 'MS', 'MONTSERRAT', '1664', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(141, 'MT', 'MALTA', '356', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(142, 'MU', 'MAURITIUS', '230', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(143, 'MV', 'MALDIVES', '960', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(144, 'MW', 'MALAWI', '265', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(145, 'MX', 'MEXICO', '52', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(146, 'MY', 'MALAYSIA', '60', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(147, 'MZ', 'MOZAMBIQUE', '258', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(148, 'NA', 'NAMIBIA', '264', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(149, 'NC', 'NEW CALEDONIA', '687', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(150, 'NE', 'NIGER', '227', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(151, 'NG', 'NIGERIA', '234', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(152, 'NI', 'NICARAGUA', '505', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(153, 'NL', 'NETHERLANDS', '31', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(154, 'NO', 'NORWAY', '47', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(155, 'NP', 'NEPAL', '977', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(156, 'NR', 'NAURU', '674', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(157, 'NU', 'NIUE', '683', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(158, 'NZ', 'NEW ZEALAND', '64', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(159, 'OM', 'OMAN', '968', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(160, 'PA', 'PANAMA', '507', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(161, 'PE', 'PERU', '51', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(162, 'PF', 'FRENCH POLYNESIA', '689', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(163, 'PG', 'PAPUA NEW GUINEA', '675', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(164, 'PH', 'PHILIPPINES', '63', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(165, 'PK', 'PAKISTAN', '92', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(166, 'PL', 'POLAND', '48', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(167, 'PM', 'SAINT PIERRE AND MIQUELON', '508', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(168, 'PN', 'PITCAIRN', '870', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(169, 'PR', 'PUERTO RICO', '1', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(170, 'PT', 'PORTUGAL', '351', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(171, 'PW', 'PALAU', '680', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(172, 'PY', 'PARAGUAY', '595', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(173, 'QA', 'QATAR', '974', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(174, 'RO', 'ROMANIA', '40', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(175, 'RS', 'SERBIA', '381', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(176, 'RU', 'RUSSIAN FEDERATION', '7', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(177, 'RW', 'RWANDA', '250', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(178, 'SA', 'SAUDI ARABIA', '966', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(179, 'SB', 'SOLOMON ISLANDS', '677', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(180, 'SC', 'SEYCHELLES', '248', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(181, 'SD', 'SUDAN', '249', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(182, 'SE', 'SWEDEN', '46', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(183, 'SG', 'SINGAPORE', '65', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(184, 'SH', 'SAINT HELENA', '290', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(185, 'SI', 'SLOVENIA', '386', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(186, 'SK', 'SLOVAKIA', '421', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(187, 'SL', 'SIERRA LEONE', '232', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(188, 'SM', 'SAN MARINO', '378', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(189, 'SN', 'SENEGAL', '221', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(190, 'SO', 'SOMALIA', '252', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(191, 'SR', 'SURINAME', '597', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(192, 'ST', 'SAO TOME AND PRINCIPE', '239', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(193, 'SV', 'EL SALVADOR', '503', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(194, 'SY', 'SYRIAN ARAB REPUBLIC', '963', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(195, 'SZ', 'SWAZILAND', '268', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(196, 'TC', 'TURKS AND CAICOS ISLANDS', '1649', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(197, 'TD', 'CHAD', '235', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(198, 'TG', 'TOGO', '228', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(199, 'TH', 'THAILAND', '66', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(200, 'TJ', 'TAJIKISTAN', '992', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(201, 'TK', 'TOKELAU', '690', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(202, 'TL', 'TIMOR-LESTE', '670', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(203, 'TM', 'TURKMENISTAN', '993', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(204, 'TN', 'TUNISIA', '216', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(205, 'TO', 'TONGA', '676', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(206, 'TR', 'TURKEY', '90', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(207, 'TT', 'TRINIDAD AND TOBAGO', '1868', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(208, 'TV', 'TUVALU', '688', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(209, 'TW', 'TAIWAN, PROVINCE OF CHINA', '886', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', '255', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(211, 'UA', 'UKRAINE', '380', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(212, 'UG', 'UGANDA', '256', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(213, 'US', 'UNITED STATES', '1', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(214, 'UY', 'URUGUAY', '598', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(215, 'UZ', 'UZBEKISTAN', '998', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(216, 'VA', 'HOLY SEE (VATICAN CITY STATE)', '39', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(217, 'VC', 'SAINT VINCENT AND THE GRENADINES', '1784', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(218, 'VE', 'VENEZUELA', '58', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(219, 'VG', 'VIRGIN ISLANDS, BRITISH', '1284', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(220, 'VI', 'VIRGIN ISLANDS, U.S.', '1340', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(221, 'VN', 'VIET NAM', '84', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(222, 'VU', 'VANUATU', '678', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(223, 'WF', 'WALLIS AND FUTUNA', '681', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(224, 'WS', 'SAMOA', '685', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(225, 'XK', 'KOSOVO', '381', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(226, 'YE', 'YEMEN', '967', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(227, 'YT', 'MAYOTTE', '262', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(228, 'ZA', 'SOUTH AFRICA', '27', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(229, 'ZM', 'ZAMBIA', '260', 1, 1, '2019-01-09 09:58:14', NULL, NULL),
(230, 'ZW', 'ZIMBABWE', '263', 1, 1, '2019-01-09 09:58:14', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `data_option_prefix`
--

CREATE TABLE `data_option_prefix` (
  `id` int(11) NOT NULL,
  `names` varchar(250) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `data_option_prefix`
--

INSERT INTO `data_option_prefix` (`id`, `names`, `updated_by`, `updated_date`, `status`, `created_by`, `created_date`) VALUES
(1, 'Mr.', 1, '2017-12-11 15:34:00', 1, 1, '2017-12-13 17:15:11'),
(2, 'Ms.', 1, '2017-12-11 15:34:08', 1, 1, '2017-12-13 17:15:11'),
(3, 'Mrs.', 1, '2017-12-11 15:34:05', 1, 1, '2017-12-13 17:15:11'),
(4, 'Dr.', 1, '2017-12-11 15:34:03', 1, 1, '2017-12-13 17:15:11'),
(5, 'Prof.', 1, '2017-12-13 17:14:59', 1, 1, '2017-12-13 17:15:11');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `description`, `created_date`, `created_by`, `updated_date`, `updated_by`, `status`) VALUES
(1, 'Sales Consultant', '', '2019-07-31 08:45:59', 1, '2019-07-31 08:53:17', 1, 1),
(2, 'HLS Support', '', '2019-07-31 08:52:28', 1, '2019-07-31 08:53:23', 1, 1),
(3, 'Web Development', '', '2019-07-31 08:53:35', 1, '2019-07-31 08:54:39', 1, 1),
(4, 'Web Application Development', '', '2019-07-31 08:54:29', 1, '2019-07-31 08:55:16', 1, 1),
(5, 'Human Resource', NULL, '2019-08-21 08:42:53', 1, '2019-08-21 08:42:56', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `id` int(11) NOT NULL,
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
  `id_lead_profile` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`id`, `file_name`, `file_size`, `id_folder`, `id_membership_profile`, `file_path`, `thumbnail`, `description`, `created_by`, `created_date`, `updated_date`, `updated_by`, `status`, `document_permission`, `id_event_list`, `id_employee_profile`, `id_customer_profile`, `id_project`, `id_contract`, `id_lead_profile`) VALUES
(4, '57104146_1377043512450167_9075191554859073536_n.jpg', 81940, 1, 1, 'uploads/membership-document/1/57104146_1377043512450167_9075191554859073536_n-15623112285d1efa3c894d4869213136.jpg', 'uploads/thumb/membership-document/1/57104146_1377043512450167_9075191554859073536_n-15623112285d1efa3c894d4869213136.jpg', NULL, 1, '2019-07-05 14:20:28', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '52596283_2220527318168528_2530170177580957696_n.jpg', 47326, 1, 1, 'uploads/membership-document/1/52596283_2220527318168528_2530170177580957696_n-15623112285d1efa3c9194c121627248.jpg', 'uploads/thumb/membership-document/1/52596283_2220527318168528_2530170177580957696_n-15623112285d1efa3c9194c121627248.jpg', NULL, 1, '2019-07-05 14:20:28', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '56985548_2353252254739876_8250224265392029696_o56985548_2353252254739876_8250224265392029696_o.jpg', 159030, 1, 1, 'uploads/membership-document/1/56985548_2353252254739876_8250224265392029696_o56985548_2353252254739876_8250224265392029696_o-15623112285d1efa3cc82d9168525055.jpg', 'uploads/thumb/membership-document/1/56985548_2353252254739876_8250224265392029696_o56985548_2353252254739876_8250224265392029696_o-15623112285d1efa3cc82d9168525055.jpg', NULL, 1, '2019-07-05 14:20:28', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '54518064_2315729361825499_4920409878276603904_o.jpg', 270669, 1, 1, 'uploads/membership-document/1/54518064_2315729361825499_4920409878276603904_o-15623112285d1efa3cc7271651392740.jpg', 'uploads/thumb/membership-document/1/54518064_2315729361825499_4920409878276603904_o-15623112285d1efa3cc7271651392740.jpg', NULL, 1, '2019-07-05 14:20:29', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '64928238_1098443577031984_1099220682396401664_o.jpg', 89372, 10, NULL, 'uploads/event-list/10/64928238_1098443577031984_1099220682396401664_o-15626829075d24a61b7e9e4082376956.jpg', 'uploads/thumb/event-list/10/64928238_1098443577031984_1099220682396401664_o-15626829075d24a61b7e9e4082376956.jpg', NULL, 1, '2019-07-09 21:35:07', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(17, '65372280_425946121583765_6722478276213735424_n.jpg', 74886, 10, NULL, 'uploads/event-list/10/65372280_425946121583765_6722478276213735424_n-15626829075d24a61bb0275554885744.jpg', 'uploads/thumb/event-list/10/65372280_425946121583765_6722478276213735424_n-15626829075d24a61bb0275554885744.jpg', NULL, 1, '2019-07-09 21:35:07', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(18, 'back & restore up your email in outlook.pdf', 484367, 10, NULL, 'uploads/event-list/10/back & restore up your email in outlook-15626829075d24a61bbe5d7258535004.pdf', 'thumbs/icon-pdf.png', NULL, 1, '2019-07-09 21:35:07', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(19, 'index.pdf', 74249, 10, NULL, 'uploads/event-list/10/index-15626829075d24a61bd3b65560427912.pdf', 'thumbs/icon-pdf.png', NULL, 1, '2019-07-09 21:35:07', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(20, 'workbook39.pdf', 1161160, 12, 3, 'uploads/membership-document/12/workbook39-15628498975d273269e9c05434389592.pdf', 'thumbs/icon-pdf.png', NULL, 1, '2019-07-11 19:58:17', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'dwfoxv3umaeo7kj.jpg', 113405, 14, NULL, 'uploads/project/14/dwfoxv3umaeo7kj-15640430285d3967143bf40546473936.jpg', 'uploads/thumb/project/14/dwfoxv3umaeo7kj-15640430285d3967143bf40546473936.jpg', NULL, 1, '2019-07-25 15:23:48', NULL, NULL, 1, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(25, '22447121_1867166823323308_855614140_n.jpg', 91978, 16, NULL, 'uploads/employee-profile/16/22447121_1867166823323308_855614140_n-15664587005d5e434c1145c948259508.jpg', 'uploads/thumb/employee-profile/16/22447121_1867166823323308_855614140_n-15664587005d5e434c1145c948259508.jpg', NULL, 13, '2019-08-22 14:25:00', NULL, NULL, 1, NULL, NULL, 12, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `document_format`
--

CREATE TABLE `document_format` (
  `id` int(11) NOT NULL,
  `id_type` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `document_format`
--

INSERT INTO `document_format` (`id`, `id_type`, `name`) VALUES
(1, 1, 'INV'),
(2, 2, 'REC'),
(3, 3, 'EXP'),
(4, 4, 'PRO'),
(5, 5, 'QUT'),
(6, 6, 'ADV'),
(7, 7, 'PRE'),
(8, 8, 'ERO');

-- --------------------------------------------------------

--
-- Table structure for table `employee_position`
--

CREATE TABLE `employee_position` (
  `id` int(11) NOT NULL,
  `position_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `id_department` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_position`
--

INSERT INTO `employee_position` (`id`, `position_type`, `description`, `created_date`, `created_by`, `updated_date`, `updated_by`, `status`, `id_department`) VALUES
(1, 'Office Manager', '<p style=\"padding: 0px 10px 0px 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 16px; line-height: 24px; font-family: Roboto, sans-serif; color: rgba(0, 0, 0, 0.87);\"><em>This&nbsp;office manager&nbsp;sample job description can assist in your creating a job application that will attract job candidates who are qualified for the job. Feel free to revise this job description to meet your specific job duties and job requirements.</em></p><h2 style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: 400; font-stretch: normal; font-size: 18px; line-height: 25px; font-family: Roboto, sans-serif; color: rgba(0, 0, 0, 0.87); margin-top: 30px; margin-right: 0px; margin-left: 0px; padding: 0px;\">Office Manager Job Responsibilities:</h2><p style=\"padding: 0px 10px 0px 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 16px; line-height: 24px; font-family: Roboto, sans-serif; color: rgba(0, 0, 0, 0.87);\">Supports company operations by maintaining office systems and supervising staff.</p><h2 style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: 400; font-stretch: normal; font-size: 18px; line-height: 25px; font-family: Roboto, sans-serif; color: rgba(0, 0, 0, 0.87); margin-top: 30px; margin-right: 0px; margin-left: 0px; padding: 0px;\">Office Manager Job Duties:</h2><ul style=\"color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; font-size: 16px;\"><li>Maintains office services by organizing office operations and procedures; preparing payroll; controlling correspondence; designing filing systems; reviewing and approving supply requisitions; assigning and monitoring clerical functions.</li><li>Provides historical reference by defining procedures for retention, protection, retrieval, transfer, and disposal of records.</li><li>Maintains office efficiency by planning and implementing office systems, layouts, and equipment procurement.</li><li>Designs and implements office policies by establishing standards and procedures; measuring results against standards; making necessary adjustments.</li><li>Completes operational requirements by scheduling and assigning employees; following up on work results.</li><li>Keeps management informed by reviewing and analyzing special reports; summarizing information; identifying trends.</li><li>Maintains office staff by recruiting, selecting, orienting, and training employees.</li><li>Maintains office staff job results by coaching, counseling, and disciplining employees; planning, monitoring, and appraising job results.</li><li>Maintains professional and technical knowledge by attending educational workshops; reviewing professional publications; establishing personal networks; participating in professional societies.</li><li>Achieves financial objectives by preparing an annual budget; scheduling expenditures; analyzing variances; initiating corrective actions.</li><li>Contributes to team effort by accomplishing related results as needed.</li></ul><h2 style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: 400; font-stretch: normal; font-size: 18px; line-height: 25px; font-family: Roboto, sans-serif; color: rgba(0, 0, 0, 0.87); margin-top: 30px; margin-right: 0px; margin-left: 0px; padding: 0px;\">Office Manager Skills and Qualifications:</h2><p style=\"padding: 0px 10px 0px 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 16px; line-height: 24px; font-family: Roboto, sans-serif; color: rgba(0, 0, 0, 0.87);\">Supply Management, Informing Others, Tracking Budget Expenses, Delegation, Staffing, Managing Processes, Supervision, Developing Standards, Promoting Process Improvement, Inventory Control, Reporting Skills</p>', '2019-04-18 15:55:50', 1, '2019-07-31 10:46:26', 1, 1, 2),
(2, 'Web Application Developer', '', '2019-07-19 10:51:14', 1, '2019-08-05 14:13:06', 15, 1, 4),
(3, 'Senior - Web Application Developer', '', '2019-07-19 10:51:24', 1, '2019-08-05 14:13:26', 15, 1, 4),
(4, 'Senior - Sale Consultant', '', '2019-07-19 10:51:32', 1, '2019-08-01 09:29:54', 1, 1, 1),
(5, 'HLS Support', '', '2019-08-03 09:01:54', 13, NULL, NULL, 1, 2),
(6, 'Web Developer', '', '2019-08-05 14:14:08', 15, NULL, NULL, 1, 3),
(7, 'Sale Consultant', '', '2019-08-05 14:28:08', 15, NULL, NULL, 1, 1),
(8, 'Human Resource', NULL, '2019-08-21 08:45:54', 1, '2019-08-21 08:45:57', 1, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `employee_profile`
--

CREATE TABLE `employee_profile` (
  `id` int(11) NOT NULL,
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
  `basic_salary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_profile`
--

INSERT INTO `employee_profile` (`id`, `id_prefix`, `first_name`, `last_name`, `join_date`, `date_of_birth`, `place_of_birth`, `sex`, `nationality`, `address`, `id_country`, `id_city`, `marital_status`, `phone_number`, `id_department`, `email`, `id_position`, `username`, `password`, `confirm_password`, `description`, `created_date`, `created_by`, `updated_date`, `updated_by`, `status`, `img_url`, `id_user_type`, `job_description`, `employee_code`, `employee_joint_date`, `basic_salary`) VALUES
(1, 'Mr.', 'Men', 'Robaer', '2017-12-01', NULL, '', NULL, 56, 'Kok Chork, Siem Reap', 56, 21, 'Single', '069 544 447', 3, 'pov@eocambo.com', 2, 'pov', '', '', '', '2019-08-03 08:46:40', 1, '2019-08-21 09:46:58', 1, 1, '30', 1, '', 'EOT00001', NULL, '200.00'),
(2, 'Mr.', 'THEOM', 'Buntheoun (Maco)', '2015-05-25', '1992-12-02', 'Siem Reap', NULL, 56, 'Siem reap', 56, 21, '', '010 448 054', 2, 'theombuntheoun@gmail.com', 1, 'maco', '', '', '', '2019-08-03 08:49:44', 1, '2019-08-22 14:13:34', 13, 1, '31', 1, '<p style=\"padding: 0px 10px 0px 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 16px; line-height: 24px; font-family: Roboto, sans-serif; color: rgba(0, 0, 0, 0.87);\"><em>This&nbsp;office manager&nbsp;sample job description can assist in your creating a job application that will attract job candidates who are qualified for the job. Feel free to revise this job description to meet your specific job duties and job requirements.</em></p><h2 style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: 400; font-stretch: normal; font-size: 18px; line-height: 25px; font-family: Roboto, sans-serif; color: rgba(0, 0, 0, 0.87); margin-top: 30px; margin-right: 0px; margin-left: 0px; padding: 0px;\">Office Manager Job Responsibilities:</h2><p style=\"padding: 0px 10px 0px 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 16px; line-height: 24px; font-family: Roboto, sans-serif; color: rgba(0, 0, 0, 0.87);\">Supports company operations by maintaining office systems and supervising staff.</p><h2 style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: 400; font-stretch: normal; font-size: 18px; line-height: 25px; font-family: Roboto, sans-serif; color: rgba(0, 0, 0, 0.87); margin-top: 30px; margin-right: 0px; margin-left: 0px; padding: 0px;\">Office Manager Job Duties:</h2><ul style=\"color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; font-size: 16px;\"><li>Maintains office services by organizing office operations and procedures; preparing payroll; controlling correspondence; designing filing systems; reviewing and approving supply requisitions; assigning and monitoring clerical functions.</li><li>Provides historical reference by defining procedures for retention, protection, retrieval, transfer, and disposal of records.</li><li>Maintains office efficiency by planning and implementing office systems, layouts, and equipment procurement.</li><li>Designs and implements office policies by establishing standards and procedures; measuring results against standards; making necessary adjustments.</li><li>Completes operational requirements by scheduling and assigning employees; following up on work results.</li><li>Keeps management informed by reviewing and analyzing special reports; summarizing information; identifying trends.</li><li>Maintains office staff by recruiting, selecting, orienting, and training employees.</li><li>Maintains office staff job results by coaching, counseling, and disciplining employees; planning, monitoring, and appraising job results.</li><li>Maintains professional and technical knowledge by attending educational workshops; reviewing professional publications; establishing personal networks; participating in professional societies.</li><li>Achieves financial objectives by preparing an annual budget; scheduling expenditures; analyzing variances; initiating corrective actions.</li><li>Contributes to team effort by accomplishing related results as needed.</li></ul><h2 style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: 400; font-stretch: normal; font-size: 18px; line-height: 25px; font-family: Roboto, sans-serif; color: rgba(0, 0, 0, 0.87); margin-top: 30px; margin-right: 0px; margin-left: 0px; padding: 0px;\">Office Manager Skills and Qualifications:</h2><p style=\"padding: 0px 10px 0px 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 16px; line-height: 24px; font-family: Roboto, sans-serif; color: rgba(0, 0, 0, 0.87);\">Supply Management, Informing Others, Tracking Budget Expenses, Delegation, Staffing, Managing Processes, Supervision, Developing Standards, Promoting Process Improvement, Inventory Control, Reporting Skills</p>', 'EOT00002', NULL, '100.00'),
(3, 'Mr.', 'Saody', 'Phal', '2017-12-01', '1995-01-12', 'KPS', NULL, 56, 'Kok Chork, Siem Reap', 56, 21, 'Single', '087 691 777', 3, 'saody@eocambo.com', 2, 'saody', '123456', '123456', '', '2019-08-03 08:52:43', 12, '2019-08-22 14:25:54', 14, 1, '32', 1, '', 'EOT00003', NULL, '150.00'),
(4, 'Ms.', 'Maranet', 'Mey', '2018-02-07', '1996-06-24', 'Phnom Penh', NULL, 56, 'Siem reap', 56, 21, 'Single', '086 907 907', 3, 'maranet@eocambo.com', 6, 'maranet', '123', '123', '', '2019-08-03 08:58:51', 13, '2019-08-15 14:53:43', 12, 1, '27', 1, '', 'EOT00004', NULL, '300.00'),
(5, 'Mr.', 'Bunchhay', 'Yoeurn ', '2017-12-11', NULL, 'Siem Reap', NULL, 56, 'Siem Reap', 56, 21, 'Single', '096 596 33 22', 2, 'bunchhay@eocambo.com', 5, 'chhay', '123', '123', '', '2019-08-05 13:40:28', NULL, '2019-08-05 14:41:34', 15, 1, '7', 1, '', NULL, NULL, NULL),
(6, 'Mr.', 'Dararith', 'Kreom ', '2018-01-16', NULL, '', NULL, 56, 'Siem reap', 56, 21, 'Single', '096 858 57 89', 3, 'dararith365@gmail.com', 2, 'rith', '123', '123', '', '2019-08-05 13:53:44', NULL, '2019-08-05 14:42:04', 15, 1, '8', 1, '', NULL, NULL, NULL),
(7, 'Mr.', 'Rachhen', 'Chhun ', '2018-01-03', NULL, '', NULL, 56, 'Siem reap', 56, 21, 'Single', '096 967 4239', 3, 'chhunrachhen961@gmail.com', 2, 'chhen', '123', '123', '', '2019-08-05 14:05:36', NULL, '2019-08-05 14:42:28', 15, 1, '9', 1, '', NULL, NULL, NULL),
(8, 'Mr.', 'Peng Ai', 'Ear ', '2018-06-12', NULL, '', NULL, 56, 'Siem reap', 56, NULL, 'Single', '070 914 156', 3, 'pengai.ear@gmail.com', 2, 'ai', '123', '123', '', '2019-08-05 14:08:38', NULL, '2019-08-05 14:42:57', 15, 1, '10', 1, '', NULL, NULL, NULL),
(9, 'Mr.', 'Rithyraeck', 'SOEUNG', '2018-05-02', '1988-09-02', 'Pouk District, Siem Reap Province', NULL, 56, 'Takong, Sankat Sambour, Siem reap City', 56, 21, 'Married', '095/010 80 85 90', 1, 'rithyraeck@eocambo.com', 7, 'raeck', '', '', 'Web application Developer from 02 May 2018\r\nSenior Sale Consultant from  01 August 2019 - Present', '2019-08-05 14:18:58', 15, '2019-08-23 11:25:01', 20, 1, '34', 1, '', '68', NULL, '150.00'),
(10, 'Mr.', 'Mengtry', 'Meas ', '2018-09-13', NULL, '', NULL, 56, 'Siem reap', 56, 21, 'Single', '092 30 50 85', 4, 'measmengtry@eocambo.com', 2, 'try', '123', '123', '', '2019-08-05 14:22:11', 15, '2019-08-05 14:43:49', 15, 1, '12', 1, '', NULL, NULL, NULL),
(11, 'Mrs.', 'Theany', 'Uan ', '2019-05-16', NULL, '', NULL, 56, 'Siem Reap', 56, 21, 'Married', '070 307 888', 1, 'uan.theany@gmail.com', 4, 'theany', '123', '123', '', '2019-08-05 14:24:41', 15, NULL, NULL, 1, NULL, 1, '', NULL, NULL, NULL),
(12, 'Mr.', 'Pholly', 'Chinh ', '2019-06-01', NULL, '', NULL, 56, 'Siem Reap', 56, 21, 'Single', '010 328 929', 3, 'pholly@eocambo.com', 6, 'pholly', '', '', '', '2019-08-05 14:26:48', 15, '2019-08-22 14:34:54', 23, 1, NULL, 1, '', '', NULL, '1.00'),
(13, 'Ms.', 'Mollika ', 'Ou ', '2019-07-01', NULL, '', NULL, 56, 'Siem reap', 56, 21, 'Single', '070 609 640', 1, 'mollikaou070@gmail.com', 7, 'mollika', '123', '123', '', '2019-08-05 14:30:07', 15, NULL, NULL, 1, NULL, 1, '', NULL, NULL, NULL),
(14, 'Ms.', 'Soranick', 'Sen ', '2019-07-10', NULL, '', NULL, 56, 'Siem Reap', 56, 21, 'Single', '095 623 523', 1, 'ranick252001@gmail.com', 7, 'ranick', '123', '123', '', '2019-08-05 14:31:59', 15, NULL, NULL, 1, NULL, 1, '', NULL, NULL, NULL),
(15, 'Ms.', 'Hong', 'Ho ', '2019-07-15', NULL, '', NULL, 56, 'Siem reap', 56, 21, 'Single', '098 440 005', 1, 'hohong0005@gmail.com', 7, 'hong', '123', '123', '', '2019-08-05 14:33:38', 15, NULL, NULL, 1, NULL, 1, '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eot_customer`
--

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

--
-- Dumping data for table `eot_customer`
--

INSERT INTO `eot_customer` (`id`, `name`, `address`, `country`, `city`, `postal_code`, `contact_person`, `general_email`, `reservation_email`, `invoice_email`, `mobile_number_invoice`, `main_phone_1`, `main_phone_2`, `website_url`, `accommodation_type`, `star_rating`, `number_of_rooms`, `sale_date`, `service_agreement`, `fee`, `status`, `accomodation_stats`, `created_by`, `created_at`, `updated_at`, `updated_by`, `passed_by`, `handle_by`, `deactivated_at`, `deactivated_reason`, `deactivated_requested_by`, `deactivated_requested_contact_detail`, `deactivated_by`, `lived_date`) VALUES
(1, '1920 Hotel ', 'Street #9, Old Market, Siem Reap, Cambodia', 1, 1, '1', 'Mr. Senghak KOL', 'info@1920hotel.com', 'info@1920hotel.com', 'info@1920hotel.com', '+855 63 969 920', '+855 99 915 918', '+855 99 915 918', 'http://the1920.com', 1, '4.0', 10, '2016-05-23', '13', '', NULL, 2, 12, '2018-09-02 12:59:03', '2018-09-02 12:59:03', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(4, 'Advaya Residence', 'Vihear Chin Village, Svay Dangkum, Siem Reap', 1, 1, '17252', 'Mr. Korn Kosal', 'gm@advayaresidence.com', 'reservations@advayaresidence.com, gm@advayaresidence.com', 'gm@advayaresidence.com', '+855 17 465 120', '+855 17 465 120', '+855 63 766 365', 'http://advayaresidence.com', 1, '5.0', 17, '2018-08-21', NULL, '1', NULL, 2, 12, '2018-11-01 14:01:09', '2018-11-01 14:01:09', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(5, 'Adventure Hostel Siem Reap', 'Siem Reap, Cambodia', 1, 1, '17252', 'Mr. Chhun Sochetra', 'chhunsochetra@gmail.com', 'thekingteam999@gmail.com', 'thekingteam999@gmail.com', '+855 77 460 077', '+855 12 380 484', '+855 77 460 077', 'http://adventurehostelsiemreap.com', 2, '3.0', 20, '2018-08-21', NULL, '', NULL, 2, 12, '2018-11-01 14:02:34', '2018-11-01 14:02:34', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(6, 'Alibi Guesthouse ', 'Royal Palace, Sothearos Blvd', 1, 2, '17252', 'Mr. Christian Husel', 'info@alibiguesthouse.com', 'info@alibiguesthouse.com', 'info@alibiguesthouse.com', '+855 16 901 590', '+855 88 890 1590', '+855 16 901 590', 'http://alibiguesthouse.com', 4, '4.0', 10, '2018-08-21', NULL, '', NULL, 2, 12, '2018-11-01 14:03:57', '2018-11-01 14:03:57', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(7, 'Alison Angkor Boutique Villa & Resort', '#826, Street 22, Wat Bo Village', 1, 1, '', 'Mr. Sok Chanthou', 'info@alisonangkor.com, booking@alisonangkor.com', 'info@alisonangkor.com, booking@alisonangkor.com', 'info@alisonangkor.com, booking@alisonangkor.com', '', '+855 63 968 808', '+855 86 691 589', 'http://alisonangkor.com', 7, '4.0', 12, '2015-03-25', NULL, '50', NULL, 3, 2, '2018-10-31 16:14:43', '2018-10-31 16:14:43', 2, 2, 5, '2016-10-26', '', '', '', 4, NULL),
(8, 'Amatao Tropical Residence', 'Svay Prey Village', 1, 1, '', 'Mrs. Naomi Basler', 'gm@amatao.com, rsvn@amatao.com, welcome@amatao.com', 'rsvn@amatao.com', 'rsvn@amatao.com', '', '+855 12 590 645', '+855 12 590 645', 'http://amatao.com', 8, '4.0', 4, '2017-10-02', NULL, '100', NULL, 2, 2, '2018-08-27 23:03:49', '2018-08-27 23:03:49', 2, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(9, 'Anachak Boutique Hotel', 'Steung Thmey village, Svay Dungkom commune', 1, 1, '', 'Mr. Vutha Hour ', 'info@anachakboutiquehotel.com', 'reservation@anachakboutiquehotel.com', 'ac@anachakboutiquehotel.com', '', '+855 63 769 898', '+855 70 966 637', 'http://anachakboutiquehotel.com', 1, '4.0', 19, '2015-02-07', NULL, '100', NULL, 3, 12, '2018-10-31 10:28:32', '2018-10-31 10:28:32', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(11, 'Angkor Boutique Villa', 'No.335, Wat Damnak, Sala Kamreuok', 1, 1, '', 'Pen Sokema', 'booking@angkorboutiquevilla.com', 'booking@angkorboutiquevilla.com', 'booking@angkorboutiquevilla.com', '', '+855 12 914 909', '+855 63 765 558', 'http://angkorboutiquevilla.com', 7, '3.0', 8, '2014-10-25', NULL, '35', NULL, 3, 2, '2018-10-31 16:16:13', '2018-10-31 16:16:13', 2, 2, 5, '2016-10-26', '', '', '', 4, NULL),
(13, 'Angkor Century Resort and Spa', 'Komay Road, Khum Svay Dangkom', 1, 1, '17252', 'Mr. Eng Borey ', 'info@angkorcentury.com', 'resa@angkorcentury.com, e-commerce@angkorcentury.com', 'ap@angkorcentury.com, e-commerce@angkorcentury.com', '', '+855 63 963 777', '+855 63 963 789', 'http://angkorcentury.com', 1, '5.0', 190, '2014-10-01', NULL, '185', NULL, 2, 12, '2018-11-01 14:11:50', '2018-11-01 14:11:50', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(14, 'Angkor Heart Bungalow', 'Ring Road Krovat - krong Street,Sangkat svay dangkum,', 1, 1, '', 'Mr. Meas Sopheap', 'info@angkorheartbungalow.com', 'info@angkorheartbungalow.com', 'info@angkorheartbungalow.com', '', '+855 92 508 863', '+855 95 732 009', 'http://angkorheartbungalow.com', 1, '3.0', 7, '2018-02-02', NULL, '50', NULL, 2, 12, '2019-05-31 16:00:14', '2019-05-31 16:00:14', 12, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(15, 'Angkor Holiday Hotel', 'National Road No.6,', 1, 1, '1710', 'Cheung Sokha', 'gm@angkorholidayhotel.com, reservation@angkorholidayhotel.com, sales@angkorholidayhotel.com', 'reservation@angkorholidayhotel.com, gm@angkorholidayhotel.com, e-commerce@angkorholidayhotel.com', 'gm@angkorholidayhotel.com', '', '+855 63 966 777', '', 'http://angkorholidayhotel.com', 1, '4.0', 162, '2014-10-25', NULL, '80', NULL, 3, 13, '2019-02-21 10:15:34', '2019-02-21 10:15:34', 13, 2, 5, '1970-01-01', 'They want to test other company system,', 'Mr. Kakada (e-commerce)', '+855 63 966 777', 4, '1970-01-01 00:00:00'),
(16, 'Angkor Howard Hotel and Convention Center', 'National Road No 6 | Phum Kaksekam, Khum Sror Nge, Siem Reap Province', 1, 1, '', 'Ms. Sorphia Nguon', 'info@angkorhoward.com', 'reservation@angkorhoward.com', 'gcashier@angkorhoward.com', '', '+855 63 965 000', '+855077510429', 'http://angkorhoward.com', 1, '5.0', 343, '2016-04-29', NULL, '215', NULL, 2, 12, '2018-11-01 14:19:22', '2018-11-01 14:19:22', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(17, 'Angkor International Hotel', '#50, Street 148', 1, 2, '122022', 'Mr. Noun Leng', 'angkorhotel11@gmail.com', 'angkorhotel11@gmail.com', 'angkorhotel11@gmail.com', '', '+855 23 217 609', '+855 17 518 827', 'http://angkorinternationalhotel.com', 1, '3.0', 78, '2015-11-17', NULL, '75', NULL, 3, 13, '2018-11-08 08:24:58', '2018-11-08 08:24:58', 13, 2, 5, '2018-11-05', 'Auto Deactivate', 'Mr. Noun Leng', '+855 17 518 827\r\n+855 23 217 609', 4, NULL),
(18, 'Angkor Miracle Resort & Spa', 'National Road No. 6A. Khum Sra Nge (opposite of Cambodian cultural Village) Siem Reap', 1, 1, '', 'Mr. Daravichhay SENG ', 'em@angkormiracle.com, ee@angkormiracle.com, reservations@angkormiracle.com', 'reservations@angkormiracle.com, ee@angkormiracle.com, em@angkormiracle.com', 'acc@angkormiracle.com', '', '+855 63 969 900', '+855 87 882 244', 'http://angkormiracle.com/resort', 6, '5.0', 247, '2015-11-30', NULL, '150', NULL, 3, 12, '2018-10-31 10:31:23', '2018-10-31 10:31:23', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(19, 'Angkor Mithona Guesthouse', '# 19, Street 172 L13, Sangkat Chey Chumneah, Phsar Kandal, Khan Daun Penh', 1, 2, '', 'Mr. Piseth', 'info@angkormithonaguesthouse.com', 'reservation@angkormithonaguesthouse.com', 'info@angkormithonaguesthouse.com', '', '+855 23 990 323', '+855 12 760 673', 'http://angkormithonaguesthouse.com', 9, '2.0', 34, '2015-08-15', NULL, '50', NULL, 3, 12, '2018-10-31 10:32:04', '2018-10-31 10:32:04', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(20, 'Angkor Pearl Hotel', '', 1, 1, '1710', 'Mr. Peter Phoeng', 'pphoeng@angkorpearl.com', 'pphoeng@angkorpearl.com, info@angkorpearl.com', 'pphoeng@angkorpearl.com', '', '+855 92 571 520', '+855 63 966 202', 'http://angkorpearl.com', 1, '3.0', 45, '2014-12-25', NULL, '100', NULL, 3, 12, '2018-10-31 10:33:47', '2018-10-31 10:33:47', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(22, 'Angkor Rendezvous Villa', 'Neelka Way', 1, 1, '', 'Mr. Meng Dy', 'millmengdy@gmail.com', 'arvhotelink@gmail.com, millmengdy@gmail.com', 'millmengdy@gmail.com', '', '+855 77 588 788', '', 'http://angkorrendezvousvillas.com', 3, '5.0', 10, '2017-02-01', NULL, '60', NULL, 3, 12, '2018-10-31 10:51:17', '2018-10-31 10:51:17', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(23, 'Angkor Siesta Villa', '#12, Phum Beung Don Pa, Sangkat Slor Kram', 1, 1, '17251', 'Ms. Chenda Lam', 'info@angkorsiestavilla.com', 'info@angkorsiestavilla.com', 'info@angkorsiestavilla.com', '', '+855 70 808 182', '+855 70 808 182', 'http://angkorsiestavilla.com', 7, '4.0', 7, '2018-01-19', NULL, '60', NULL, 3, 12, '2019-01-11 10:59:34', '2019-01-11 10:59:34', 12, 2, 4, '2018-11-30', 'Dear Maranet,\r\n\r\nGreetings from Angkor Siesta Villa\r\n\r\nI am writing to you to inform you that we have disconnected your Channel Manager & IBE (hotellinksolutions) from our hotel recently as we do not have any budget to continue on this.', 'Mr. Sophath ', '012 981 089 ', 5, '1970-01-01 00:00:00'),
(24, 'Angkor Twinkle Boutique Villa', 'Lok Taneuy (St.), Phum Wat Bo, Sangkat Sala Kamreuk', 1, 1, '', 'Angkor Twinkle Boutique Villa', 'booking@angkortwinklevilla.com', 'booking@angkortwinklevilla.com', 'booking@angkortwinklevilla.com ', '', '+855 63 963 368', '+855 17 666 609', 'http://angkortwinkleboutiquevilla.com', 7, '3.5', 22, '2016-01-12', NULL, '130', NULL, 3, 13, '2018-10-31 14:00:01', '2018-10-31 14:00:01', 13, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(25, 'Anise Hotel', 'Nº 2C, St 278 off 57, Beoung Keng Kang I, Chamkamorn', 1, 2, '', 'Mr. Duy Sophal', 'reservation@anisehotel.com.kh', 'reservation@anisehotel.com.kh', 'manager@anisehotel.com.kh', '', '+855 23 222 522', '+855 12 730 099', 'http://anisehotel.com.kh', 1, '3.0', 18, '2015-05-11', NULL, '155', NULL, 2, 12, '2018-11-01 14:35:20', '2018-11-01 14:35:20', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(26, 'Anise Villa Boutique Hotel', '18 Street 400, Beoung Keng Kang 1', 1, 2, '', 'Mr. Sophal', ' reservation@anisevilla.com', ' reservation@anisevilla.com', ' reservation@anisevilla.com', '', '+855 23 225 400', '+855 12 985 400', 'http://anisevilla.com', 1, '3.0', 21, '2015-03-13', NULL, '155', NULL, 2, 12, '2018-11-01 14:41:27', '2018-11-01 14:41:27', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(27, 'Apsara Centrepole Hotel', '522 Svay Dungkum, Old Sok San Street', 1, 1, '', 'Mr. Vann Enghong', 'book@apsaracentrepole.com', 'book@apsaracentrepole.com', 'book@apsaracentrepole.com, account@apsaracentrepole.com', '', '+855 63 968 098', '+855 95 214 209', 'http://apsaracentrepole.com', 1, '3.5', 19, '2016-10-01', NULL, '80', NULL, 2, 12, '2018-11-01 14:43:04', '2018-11-01 14:43:04', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(28, 'Apsara Residence', 'St. 27, Wat Bo Village, Sala Kamreuk Commune', 1, 1, '', 'Mr. Suy Sophanith', 'book@apsara-residence.com', 'book@apsara-residence.com', 'book@apsara-residence.com, account@apsara-residence.com', '', '+855 63 968 668', '+855 17 353 980', 'http://apsara-residence.com', 1, '4.0', 22, '2016-10-01', NULL, '80', NULL, 2, 12, '2018-11-01 14:46:17', '2018-11-01 14:46:17', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(29, 'Aqua Boutique Guesthouse', 'No.126, Street 63', 1, 2, '', 'Ms. Tep Sothyda', 'info@aqua-boutique-guesthouse.com', 'reservation@aqua-boutique-guesthouse.com', 'info@aqua-boutique-guesthouse.com', '', '+855 77 528 530', '', 'http://aqua-boutique-guesthouse.com', 9, '0.0', 20, '2015-03-31', NULL, '28', NULL, 3, 12, '2018-10-31 10:56:26', '2018-10-31 10:56:26', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(30, 'Asarita Angkor Resort & Spa', 'National Road No 6A, Khum Sra Nge', 1, 1, '17260', 'Ms. Nora', 'sales@asaritaangkor.com, asaritaangkor@gmail.com', 'reservations@asaritaangkor.com, asaritaangkor@gmail.com', 'info@asaritaangkor.com', '', '+855 63 768 444', '+855 93 965 189', 'http://asaritaangkor.com', 6, '4.0', 33, '2017-01-16', NULL, '150', NULL, 3, 12, '2018-10-31 10:57:23', '2018-10-31 10:57:23', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(31, 'Ashia Hotel & Lounge', 'P Charles De Gaulle, Krong Siem Reap', 1, 1, '', 'Mr. Komsorth', 'info@ashiahotel.com', 'reservation@ashiahotel.com', 'info@ashiahotel.com', '', '+855 63 968 960', '+855 70 770 002', 'http://ashiahotel.com', 1, '3.0', 20, '2017-07-11', NULL, '100', NULL, 2, 12, '2018-11-01 14:48:58', '2018-11-01 14:48:58', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(32, 'Babel Guesthouse', 'No.738 Wat Bo Road, Salakamroeuk', 1, 1, '1710', 'Simen Julner', 'babelsiemreap@gmail.com', 'babelsiemreap@gmail.com', 'babelsiemreap@gmail.com', '', '+855 78 858 469', '+855 78 332 301', 'http://babel-siemreap.com', 9, '2.0', 24, '2014-12-25', NULL, '70', NULL, 2, 12, '2018-11-02 11:11:33', '2018-11-02 11:11:33', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(33, 'Bamboo Angkor Boutique', ' Phum Salar Kanseng, Khum Svay Dangkum, Central Area', 1, 1, '1710', 'Mr. Chon Savun ', 'reservation@bambooangkorboutique.com', 'info@bambooangkorboutique.com', 'reservation@bambooangkorboutique.com', '', '+855 10 394 646', '+855 10 394 646', 'http://bamboo-angkorboutique.com', 7, '4.0', 12, '2015-06-09', NULL, '50', NULL, 3, 12, '2018-10-31 10:59:09', '2018-10-31 10:59:09', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(34, 'Tanei Boutique Villa', '#017, Steung Thmey Village, Svay Dangkom', 1, 1, '17252', 'Mr. Lao Sokun', 'lao_sukun007@yahoo.com', 'lao_sukun007@yahoo.com, info@taneiboutiquevilla.com', 'lao_sukun007@yahoo.com', '+855 12 757 867', '+855 12 757 867', '+855 97 746 8787', 'http://taneiboutiquevilla.com', 4, '3.0', 28, '2015-05-25', NULL, '65', NULL, 3, 12, '2018-10-31 11:00:15', '2018-10-31 11:00:15', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(36, 'La Da Kiri Boutique Hotel', 'Soksan Street, Khum Svay Dangkom', 1, 1, '17251', 'Ms. Saradin Ly', 'info@ladakiriboutique.com', 'reservation@ladakiriboutique.com', 'reservation@ladakiriboutique.com', '+855 12 781 675', '+855 12 781 675', '+855 12 781 675', 'http://ladakiriboutique.com', 7, '4.0', 26, '2015-02-06', NULL, '50', NULL, 3, 12, '2019-04-24 09:27:02', '2019-04-24 09:27:02', 12, 2, 4, '2019-04-24', 'They want to change solutions ', 'B. Sema', '070 811 558', 5, '1970-01-01 00:00:00'),
(37, 'Cheathata Angkor Hotel', 'City Center, Angkor Night Market Road, Old Market Area', 1, 1, '17252', 'Mr. Soeum Makara', 'gm@ctaangkorhotel.com, res@ctaangkorhotel.com', 'cheathatahotel@gmail.com, res@ctaangkorhotel.com', 'chiv.kouy@ctaangkorhotel.com, res@ctaangkorhotel.com', '+855 63 968 777', '+855 63 968 777', '+855 63 968 777', 'http://angkor.ctaangkorhotel.com', 1, '3.5', 28, '8900-08-03', NULL, '70', NULL, 2, 12, '2018-11-01 14:56:48', '2018-11-01 14:56:48', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(38, 'Base Villa Phnom Penh', 'No #29 Street 222', 1, 2, '', 'Mr. Sokpheak', 'reservation@basevillaphnompenh.com', 'reservation@basevillaphnompenh.com', 'reservation@basevillaphnompenh.com', '', '+855 10 292 229', '+855 96 888 9197', 'http://basevillaphnompenh.com', 1, '3.0', 12, '2015-11-30', NULL, '100', NULL, 3, 12, '2018-10-31 11:03:19', '2018-10-31 11:03:19', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(39, 'Bavyra  Boutique', 'Slor Kram Village, Slor kram Commune', 1, 1, '1710', 'Mr. Kenvin Harris', 'Kevinrharris62@gmail.com ', 'Kevinrharris62@gmail.com', 'Kevinrharris62@gmail.com ', '', '+855 63 963 987', '+855 15 820 227', 'http://bavyraboutique.com', 7, '3.0', 9, '2015-01-25', NULL, '50', NULL, 3, 12, '2018-10-31 11:14:58', '2018-10-31 11:14:58', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(40, 'Bayon Boutique', 'Stueng Thmey, Svay Dangkum', 1, 1, '', 'Mr. Tola Hak (Seyha)', 'gm@bayonboutique.com', 'rsvn@bayonboutique.com, gm@bayonboutique.com, fm@bayonboutique.com', 'fm@bayonboutique.com', '', '+855 63 969 456', '+855 96 678 7208', 'http://bayonboutique.com/index.php', 7, '3.5', 18, '2016-10-10', NULL, '100', NULL, 2, 12, '2018-11-01 15:07:36', '2018-11-01 15:07:36', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(41, 'Bayon Shadow Villa', 'Stueng Thmey, Svay Dangkum', 1, 1, '', 'Mr. Tola Hak (Seyha)', 'gm@bayonboutique.com', 'rsvn@bayonshadow.com, gm@bayonboutique.com, fm@bayonboutique.com', 'rsvn@bayonshadow.com, fm@bayonboutique.com', '', '+855 63 765 443', '+855 96 678 7208', 'http://bayonshadow.com', 3, '2.5', 18, '2016-10-10', NULL, '100', NULL, 2, 12, '2018-11-01 15:08:40', '2018-11-01 15:08:40', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(42, 'Bella Mia Villa', 'Soksan Road, Svay Damkom Village, Svay Damkom commune', 1, 1, '17259', 'jonathon Vallieres', 'gm.bellamiavilla@gmail.com, gm@bellamiaangkor.com, gm@bellamiaangkor.com', 'reservation@bellamiaangkor.com, gm.bellamiavilla@gmail.com', 'gm.bellamiavilla@gmail.com, gm@bellamiaangkor.com', '', '+855 63 962 111', '+855 17 940 344', 'http://bellamiaangkor.com', 3, '3.5', 9, '2015-10-01', NULL, '75', NULL, 3, 12, '2018-10-31 11:15:31', '2018-10-31 11:15:31', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(43, 'Big Lyna Villa', 'Wat Bo Village, Sangkat Salakamroeuk', 1, 1, '1710', 'Sam Tina', 'biglyna@yahoo.com', 'biglyna@yahoo.com', 'biglyna@yahoo.com', '', '+855 63 964 807', '+855 92 630 597', 'http://biglynavilla.com', 9, '1.0', 10, '2015-02-11', NULL, '50', NULL, 3, 12, '2018-10-31 11:16:45', '2018-10-31 11:16:45', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(44, 'Bliss Villa ', '# 051, Sok San Street, Svay Dangkum Village', 1, 1, '17252', 'Sieng Saline', 'blissvilla@asia.com', 'blissvilla@asia.com', 'blissvilla@asia.com', '', '+855 63 630 0978', '', 'http://theblissvilla.com', 1, '4.0', 21, '2014-12-27', NULL, '80', NULL, 3, 13, '2019-01-03 08:34:09', '2019-01-03 08:34:09', 13, 2, 5, '2019-01-03', 'Change Company Solutions', 'Vathana', '+(855) 81 832 181(LINE / WeChat / WhatsApp / Viber / Telegram)', 4, '1970-01-01 00:00:00'),
(45, 'Bokre Angkor Hostel ', '363 Taphul Village, Svay Dangkum Commune', 1, 1, '', 'Ms. Ung Annie', 'Info@bokreangkorhostel.com', 'reservation@bokreangkorhostel.com', 'Info@bokreangkorhostel.com', '', '+855 85 511 118', '+855 10 698 777', 'http://eocambovilla.com', 2, '3.0', 30, '2017-10-09', NULL, '100', NULL, 2, 12, '2018-11-01 15:12:19', '2018-11-01 15:12:19', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(46, 'Garden Village Guesthouse', '#434, Sok San Street, Steng Thmey Village, Svaydangkum Commune', 1, 1, '17252', 'Vann pohin', 'gardenvillage@asia.com', 'gardenvillage@asia.com', 'gardenvillage@asia.com', '+855 17 297 777', '+855 17 297 777', '+855 17 297 777', 'http://guesthouse.gardenvillageguesthouse.com', 9, '1.0', 29, '2014-12-25', NULL, '40', NULL, 2, 12, '2018-11-01 15:12:55', '2018-11-01 15:12:55', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(48, 'Botoum Hostel', 'Sangkat Svay Dangkum,', 1, 1, '', 'Mr. Sokdana Choung ', 'info@botoumhostel.com', 'info@botoumhostel.com', 'info@botoumhostel.com', '', '+855 16 913 999', '+855 16 913 999', 'http://botoumhostel.com', 1, '3.0', 15, '2018-06-23', NULL, '40', NULL, 2, 12, '2018-11-01 15:13:29', '2018-11-01 15:13:29', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(49, 'Garden Village Hostel', 'Steung Thmey Village, Svay Dungkom commune', 1, 1, '17252', 'Mr.Vann pohin', 'gardenvillage@asia.com', 'gardenvillage@asia.com', 'gardenvillage@asia.com', '+855 17 297 777', '+855 17 297 777', '+855 17 297 777http://gardenvillagehostel.com', 'http://gardenvillagehostel.com', 2, '1.0', 12, '2015-07-08', NULL, '30', NULL, 3, 12, '2018-10-31 11:24:38', '2018-10-31 11:24:38', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(50, 'Garden Village Villa', 'Garden Village Villa is located close to the Old Market in walking distance to bars, restaurants', 1, 1, '17252', 'Vann pohin', 'gardenvillage@asia.com', 'gardenvillage@asia.com', 'gardenvillage@asia.com', '+855 17 297 777', '+855 17 297 777', '+855 17 297 777', 'http://villa.gardenvillagevilla.com', 3, '2.0', 8, '2015-07-08', NULL, '30', NULL, 3, 12, '2019-08-01 10:30:39', '2019-08-01 10:30:39', 12, 19, 4, '2019-08-01', 'Low season ', 'Mr. Pohin', '070 630 000', 5, '1970-01-01 00:00:00'),
(51, 'Mane Boutique Hotel & Spa', 'Village Salakomroeuk, Sangkat Salakomroeuk', 1, 1, '17252', 'Mr. Rath', 'ecom@maneboutiquehotel.com', 'reservations@maneboutiquehotel.com, ecom@maneboutiquehotel.com', 'gm@maneboutiquehotel.com, md@maneboutiquehotel.com, phann.vanrath@gmail.com', '+855 97 552 2222', '+855 63 768 899', '+855 97 552 2222', 'http://maneboutiquehotel.com', 1, '5.0', 18, '2015-08-26', NULL, '120', NULL, 3, 12, '2018-10-31 11:29:08', '2018-10-31 11:29:08', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(52, 'Lynnaya Urban River Resort & Spa', 'Street 20 Krong Siem Reap', 1, 1, '17000', 'Mr.Kan Chansathya', 'gm@lynnaya.com', 'reservation@lynnaya.com', 'reservation@lynnaya.com ', '+855 63 967 755', '+855 63 967 755', '+855 63 967 755', 'http://lynnaya-hotel-angkor.com', 1, '4.0', 46, '2015-08-27', NULL, '130', NULL, 3, 13, '2018-10-31 13:50:25', '2018-10-31 13:50:25', 13, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(54, 'Bou Savy Guesthouse (Bed & Breakfast)', '#261, Group 07, Salakanseng Village, Svaydangkum Commune. ', 1, 1, '17252', 'Horn Bovorn', 'bousavy7777@gmail.com', 'bousavy7777@gmail.com, savy7777@hotmail.com', 'savy7777@hotmail.com', '+855 12 369 600', '+855 12 369 600', '+855 77 752 075', 'http://bousavyguesthouse.com', 9, '2.0', 30, '2015-09-11', NULL, '100', NULL, 2, 12, '2018-11-01 15:15:02', '2018-11-01 15:15:02', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(55, 'La Villa du Bonheur', '#056, Viheachen, Svaydangkum', 1, 1, '17252', 'La Villa du Bonheur', 'reservation@lavilladubonheur.com ', 'reservation@lavilladubonheur.com ', 'reservation@lavilladubonheur.com ', '+855 77 567 605', '+855 77 567 605', '+855 63 765 761', 'http://lavilladubonheur.com', 3, '1.0', 18, '2015-02-16', NULL, '40', NULL, 3, 12, '2018-10-31 11:46:55', '2018-10-31 11:46:55', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(56, 'Sarai Resort & Spa', 'P.O Box 93193, Wat Damnak Village, Sangkat Sala Komreuk ', 1, 1, '17251', 'Mr. Oeun Seakheng', 'info@sarairesort.com, ecommerce@sarairesort.com, book@sarairesort.com', 'book@sarairesort.com, ecommerce@sarairesort.com', 'account@sarairesort.com', '+855 93 962 204', '+855 93 962 204', '+855 63 962 200', 'http://sarairesort.com', 6, '5.0', 48, '2015-01-12', NULL, '65', NULL, 3, 12, '2018-10-31 11:48:34', '2018-10-31 11:48:34', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(57, 'Seven Happiness Holiday HOTEL', 'Road Lorkta neuy Slor Kram Commune', 1, 1, '17251', 'MR.LING', 'sevenhappinessholidayhotel@gmail.com', 'reservations7happinesshotel@gmail.com', 'accsevenhappinessholidayhotel@gmail.com', '+855 63 968 899', '+855 63 968 899', '+855 63 968 899', 'http://siemreapevergreenhotel.com', 1, '3.0', 50, '2014-12-25', NULL, '120', NULL, 3, 12, '2018-10-31 11:49:25', '2018-10-31 11:49:25', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(59, 'Pacific Hotel', ' Road No. 6, Kaksekam Village, Sror Nge Commune', 1, 1, '17000', 'Mr. Pok Dilux', ' reservations@pacifichotel.com.kh', ' reservations@pacifichotel.com.kh', ' reservations@pacifichotel.com.kh', '+855 63 761 818', '+855 63 761 818', '+855 63 761 020', 'http://pacifichotel.com.kh', 1, '4.0', 200, '2015-01-22', NULL, '15', NULL, 3, 12, '2018-10-31 11:52:05', '2018-10-31 11:52:05', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(60, 'Heng Kim Ny Boutique', '#333, Bakheng (St), Sangkat Svay Dangkum, Siem Reap Province. ', 1, 1, '17252', 'Mr. Long Sopha', 'info@hengkimnyboutique.com', 'reservation@hengkimnyboutique.com', 'info@hengkimnyboutique.com', '+855 93 557 717', '+855 93 557 717 ', '+855 63 965 959', 'http://hengkimnyboutique.com', 1, '4.0', 21, '2015-08-01', NULL, '70', NULL, 3, 12, '2018-10-31 11:52:45', '2018-10-31 11:52:45', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(61, 'Cheathata Suite Hotel', 'City Cente, Angkor Night Market Road, Old Market Area', 1, 1, '17252', 'Mr. Soeum Makara', 'res@ctaangkorhotel.com', 'cheathatahotel@gmail.com, res@ctaangkorhotel.com', 'chiv.kouy@ctaangkorhotel.com', '+855 69 966 777', '+855 63 968 777', '+855 69 966 777', 'https://suite.cheathatasuitehotel.com', 1, '4.0', 38, '2014-12-14', NULL, '70', NULL, 2, 12, '2018-11-01 15:15:33', '2018-11-01 15:15:33', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(62, 'Hotel Be Angkor', 'On The Passage, Old Market Area', 1, 1, '17252', 'Martin Disman', 'md@theonehotelcollection.com', 'md@theonehotelcollection.com', 'md@theonehotelcollection.com', '+855 12 755 311', '+855 12 755 311', '+855 63 965 321', 'http://hotelbeangkor.com', 1, '3.0', 3, '2015-03-25', NULL, '50', NULL, 3, 12, '2018-10-31 11:54:09', '2018-10-31 11:54:09', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(63, 'Diamond D\'Angkor Boutique', 'Road# 50 (Sok San Street) , Group 8, Stoeung Thmey, Sangkat Svay Dang Kom', 1, 1, '17252', 'Khoun Sokhemra', 'booking@diamondangkor.com', 'booking@diamondangkor.com', 'booking@diamondangkor.com', '+855 63 966 987', '+855 63 966 987', '+855 63 966 987', 'http://diamondangkor.com', 1, '2.0', 15, '2015-12-25', NULL, '40', NULL, 2, 12, '2018-11-01 15:16:06', '2018-11-01 15:16:06', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(64, 'Bunseda Angkor Villa', 'House 169, Group 4, Sivatha Road, Svay Dangkum Commune', 1, 1, '17252', 'Mr. Vichhay', 'vi_chhay@yahoo.com', 'vi_chhay@yahoo.com', 'vi_chhay@yahoo.com', '+855 12 933 080', '+855 12 933 080', '+855 12 933 080', 'http://bunsedaangkorvilla.com', 3, '1.0', 27, '2014-12-25', NULL, '70', NULL, 3, 12, '2018-10-31 11:55:18', '2018-10-31 11:55:18', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(66, 'Relax Inn Boutique Hotel', 'Bakheng Road, Phum Krous, Sangkat Svay Dangkom', 1, 1, '17252', 'Mr. Sopheak', 'sopheakkhoeuth@gmail.com, om@relaxinn.asia', 'reservation@relaxinn.asia ', 'reservation@relaxinn.asia ', '+855 96 556 5999', '+855 96 556 5999', '  +855 63 502 3999', 'http://relaxinn.asia', 1, '3.0', 5, '2015-01-25', NULL, '100', NULL, 3, 12, '2018-10-31 11:57:13', '2018-10-31 11:57:13', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(68, 'Golden Temple Residence', '# 558, Steung Thmey Village, Sangkat Svaydangkum ', 1, 1, '17252', 'Mr. Luon Thea', 'info@goldentempleresidence.com', 'reservations@goldentempleresidence.com', 'fc@goldentempleresidence.com, reservations@goldentempleresidence.com', '+855 63 210 522', '+855 63 212 222', '+855 63 210 522', 'http://goldentempleresidence.com', 1, '4.5', 28, '2014-12-25', NULL, '85', NULL, 3, 13, '2018-08-27 10:26:35', '2018-08-27 10:26:35', 13, 2, 4, NULL, NULL, NULL, NULL, 0, NULL),
(69, 'Gloria Angkor Hotel', 'National Road Nº 6, Choung Kaosou Village', 1, 1, '17251', 'Sovann Touch', 'info@gloriaangkorhotel.com', 'reservation@gloriaangkorhotel.com', 'acc@gloriaangkorhotel.com', '+855 63 763 163', '+855 63 763 163', '+855 63 763 163', 'http://gloriaangkorhotel.com', 1, '3.0', 3, '2014-12-25', NULL, '70', NULL, 3, 13, '2018-08-27 10:31:53', '2018-08-27 10:31:53', 13, 2, 4, NULL, NULL, NULL, NULL, 0, NULL),
(71, 'Khemara Angkor Hotel', 'National Road No.6 Sala kanseng, Khum Svaydangkum', 1, 1, '17252', 'Mr. Sophat', 'sales@khemaraangkor.com ', ' info@khemaraangkor.com', 'info@khemaraangkor.com, account@khemaraangkor.com', '+855 63 760 555', '+855 63 760 555', '+855 63 760 777', 'http://khemaraangkor.com', 1, '4.0', 160, '2015-02-25', '14', '50', NULL, 3, 13, '2018-08-27 14:34:28', '2018-08-27 14:34:28', 13, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(72, 'The Moon Boutique Hotel', 'Phum Wat Bo, Sala Kamreuk Commune', 1, 1, '17000', 'Mr. Vanna', 'reservation@themoonboutiquehotel.com', 'reservation@themoonboutiquehotel.com', 'fc@themoonboutiquehotel.com', '+855 17 359 908', '+855 17 359 908', '+855 63 964 577', 'http://themoonboutiquehotel.com', 1, '3.0', 17, '2015-03-17', NULL, '55', NULL, 3, 13, '2019-01-03 08:36:05', '2019-01-03 08:36:05', 13, 2, 4, '2019-01-03', 'Change Company Solutions', 'Sokvanna BOU ', '017 359 908', 4, '1970-01-01 00:00:00'),
(74, 'Happy Guesthouse', 'No. 0134 Wat Bo Village, Salakamroeuk Commune', 1, 1, '17251', 'Phem Chhorpoan', 'info@happyangkorguesthouse.com', 'info@happyangkorguesthouse.com, happy_ghouse@yahoo.com', 'info@happyangkorguesthouse.com', '+855 12 960 879', '+855 12 960 879', '+855 63 963 815', 'http://happyangkorguesthouse.com', 9, '2.0', 9, '2014-12-25', NULL, '60', NULL, 2, 12, '2018-11-01 15:18:32', '2018-11-01 15:18:32', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(77, 'Rambutan Hotel - Siem Reap', 'Wat Damnak Village, Salakamreuk commune', 1, 1, '17000', 'Mr. Tommy Baert', 'bookings@rambutansr.com', 'bookings@rambutansr.com', 'bookings@rambutansr.com', '+855 12 654 638', '+855 12 654 638', '+855 63 766 655', 'http://rambutanhotelsr.com', 1, '3.0', 12, '2015-03-25', NULL, '45', NULL, 3, 13, '2018-08-29 20:59:04', '2018-08-29 20:59:04', 13, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(78, 'Rambutan Resort - Siem Reap ', 'Wat Damnak Village, Salakamreuk commune', 1, 1, '17252', 'Mr. Tommy Baert', 'bookings@rambutansr.com', 'bookings@rambutansr.com', 'bookings@rambutansr.com', '+855 12 654 638', '+855 12 654 638', '+855 63 766 655', 'http://rambutanresortsr.com', 6, '3.0', 19, '2015-03-19', NULL, '45', NULL, 3, 13, '2018-08-29 20:58:42', '2018-08-29 20:58:42', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(80, 'Angkor Pearl Hotel', 'Taphul Village Svay Dangkum  ', 1, 1, '17252', 'Mr. Peter Phoeng', 'pphoeng@angkorpearl.com', 'pphoeng@angkorpearl.com', 'pphoeng@angkorpearl.com', '+855 92 571 520', '+855 92 571 520', '+855 63 966 202', 'http://angkorpearl.com', 1, '3.0', 45, '2014-03-25', NULL, '100', NULL, 3, 13, '2018-08-29 21:04:10', '2018-08-29 21:04:10', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(81, 'The Moon Residence', '#100, St.267, Vihear Chen Village, Svay Dangkum Commune', 1, 1, '17252', 'Cheng Bunsan', 'reservation@themoonresidence.com', 'reservation@themoonresidence.com', 'reservation@themoonresidence.com', '+855 69 585 566', '+855 69 585 566', '+855 63 900 085', 'http://themoonresidence.com', 1, '4.0', 22, '2015-08-29', NULL, '55', NULL, 2, 12, '2018-11-02 11:43:22', '2018-11-02 11:43:22', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(82, 'The Moon Villa ', 'National Road 06,Phum Banteay Chas, Samaki Market zone', 1, 1, '17000', 'Mr.Has Sophal', 'reservation@themoonvilla.com', 'reservation@themoonvilla.com', 'reservation@themoonvilla.com', '+855 12 629 969', '+855 12 629 969', '+855 12 629 969', 'http://themoonvilla.com', 3, '3.0', 19, '2015-08-29', NULL, '55', NULL, 3, 13, '2018-08-29 21:18:54', '2018-08-29 21:18:54', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(83, 'Royal Crown Hotel', '#7 Makara Street, Wat Bo Village, Salakamreuk Commune', 1, 1, '17000', 'Mr. Mom Phirith', 'gm@royalcrownhotel.com.kh', 'reservations@royalcrownhotel.com.kh', 'gm@royalcrownhotel.com.kh', '+855 92 373 114', '+855 92 373 114', '+855 63 760 212', 'http://royalcrownhotel.com.kh', 7, '4.0', 139, '2015-11-27', NULL, '110', NULL, 2, 12, '2018-11-01 15:19:10', '2018-11-01 15:19:10', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(84, 'Chronicle Residence And Spa', '# Road 30, 200m way from Borei Phreumprey.', 1, 1, '17000', 'Kyry Sok', 'gm@chronicleresidenceandspa.com, operation@chronicleresidenceandspa.com, info@chronicleresidenceandspa.com', 'reservation@chronicleresidenceandspa.com, operation@chronicleresidenceandspa.com, info@chronicleresidenceandspa.com', 'account@chronicleresidenceandspa.com', '+855 12 677 939', '+855 12 677 939', '+855 63 963 693', 'http://chronicleresidenceandspa.com', 1, '3.0', 22, '2015-11-27', NULL, '100', NULL, 3, 13, '2018-08-29 21:27:24', '2018-08-29 21:27:24', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(85, 'Three Room D\'Angkor', 'Wat Leu Road, Village 3, Slor Kram', 1, 1, '17000', 'Mr. Chhorng Chhaiya', 'info@threeroomdangkor.com', 'info@threeroomdangkor.com', 'info@threeroomdangkor.com', '+855 16 907 567', '+855 16 907 567', '+855 87 727 273', 'http://threeroomdangkor.com ', 7, '4.0', 3, '2014-08-24', NULL, '60', NULL, 3, 13, '2018-08-29 21:30:07', '2018-08-29 21:30:07', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(86, 'Angkor Miracle Resort & Spa', 'National Road No. 6A. Khum Sra Nge (opposite of Cambodian cultural Village) Siem Reap', 1, 1, '17000', 'Mr. Daravichhay SENG ', 'em@angkormiracle.com, ee@angkormiracle.com, reservations@angkormiracle.com', 'reservations@angkormiracle.com, ee@angkormiracle.com, em@angkormiracle.com', 'acc@angkormiracle.com', '+855 87 882 244', '+855 87 882 244', '+855 63 969 900', 'http://angkormiracle.com/resort', 1, '5.0', 247, '2015-11-30', NULL, '150', NULL, 3, 13, '2018-08-29 21:32:57', '2018-08-29 21:32:57', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(87, 'Nagara Angkor Boutique Hotel ', 'Sok San Road, Stueng Thmei Village, Svay Dangkum Commune', 1, 1, '17252', 'Mr. Sophat', 'booking@nagaraangkor-boutique.com', 'booking@nagaraangkor-boutique.com', 'account@nagaraangkor-boutique.com', '+855 70 559 536', '+855 70 559 536', '+855 63 766 082', 'http://nagaraangkor-boutique.com', 7, '3.5', 36, '2015-11-21', NULL, '150', NULL, 3, 13, '2018-08-29 21:35:10', '2018-08-29 21:35:10', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(88, 'Shadow of Angkor Guesthouse', 'No 353, Pokambor AV, on the river side, near Old Market', 1, 1, '17000', 'Nareth', 'shadowofangkor@gmail.com', 'bookings@shadowofangkor.com', 'shadowofangkor@gmail.com', '+855 12 968 881', '+855 12 968 881', '+855 63 964 774', 'http://shadowofangkor.com', 9, '1.0', 16, '2014-12-25', NULL, '70', NULL, 3, 13, '2018-08-29 21:37:22', '2018-08-29 21:37:22', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(89, 'Vilada Angkor Boutique', 'Kor Kranch Village, Sangkat Siem Reap', 1, 1, '17000', 'Mr. Seng Sakada', 'gm@viladaangkorboutique.com', 'gm@viladaangkorboutique.com', 'gm@viladaangkorboutique.com', '+855 12 565 856', '+855 12 565 856', '+855 17 688 568', 'http://viladaangkorboutique.com', 7, '4.0', 7, '2015-11-03', NULL, '70', NULL, 3, 13, '2018-08-29 21:40:23', '2018-08-29 21:40:23', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(92, 'La Residence Blanc D\'Angkor', ' #194 Krous Village, Svay Dangkum and 6th Street', 1, 1, '17000', 'Laot Tre', 'sm@residenceblancangkor.com', 'reservation@residenceblancangkor.com', 'accountant@residenceblancangkor.com, sm@residenceblancangkor.com', '+855 70 261 397', '+855 70 261 397', '+855 63 963 332', 'http://residenceblancangkor.com', 1, '4.0', 26, '2014-11-30', NULL, '90', NULL, 3, 12, '2018-11-01 15:22:30', '2018-11-01 15:22:30', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(93, 'The Unique Angkor Villa', ' # 558, Steung Thmey Village, Sangkat Svaydangkum', 1, 1, '17252', 'Mr. Loy Salith', 'info@theuniqueangkorvilla.com', 'info@theuniqueangkorvilla.com, reservation@theuniqueangkorvilla.com', 'info@theuniqueangkorvilla.com', '+855 93 305 297', '+855 93 305 297', '+855 12 927 731', 'http://theuniqueangkorvilla.com', 3, '3.0', 18, '2015-02-07', NULL, '70', NULL, 3, 13, '2018-08-29 22:01:41', '2018-08-29 22:01:41', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(94, 'The One Villa Angkor', 'Just off Street 52, Sambour Village.  5km from Old Market area and Hotel Be.', 1, 1, '17000', 'Mr. Martin Dishman', 'md@theonehotelcollection.com', 'md@theonehotelcollection.com', 'md@theonehotelcollection.com', '+855 12 755 311', '+855 12 755 311', '+855 63 965 321', 'http://theonehotelangkor.com', 1, '5.0', 20, '2014-12-25', NULL, '45', NULL, 3, 13, '2018-08-29 22:04:16', '2018-08-29 22:04:16', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(96, 'CHEZ MOI SUITE', '#0378, Sombai road, Wat Damnak commune, Sangkat Salakamroeuk ', 1, 1, '17000', 'Ms. Vann Narin ', 'reservation@chezmoi.asia', 'reservation@chezmoi.asia', 'reservation@chezmoi.asia', '+855 12 584 897', '+855 12 584 897', '+855 63 765 995', 'http://suite.chezmoi.asia', 7, '4.0', 10, '2016-01-11', NULL, '60', NULL, 3, 12, '2019-06-14 09:08:29', '2019-06-14 09:08:29', 12, 2, 4, '2019-06-13', 'They want to save budget for low season ', 'Ms. Narin', '098 958 387', 4, '1970-01-01 00:00:00'),
(97, 'Siem Reap Vacation Hotel', 'Taneuy Street, Wat Bo Village, Salakamreuk Commune', 1, 1, '17000', 'Chuon Chantola', 'sales@siemreapvacationhotel.com', 'sales@siemreapvacationhotel.com', 'sales@siemreapvacationhotel.com', '+855 95 800 881', '+855 95 800 881', '+855 95 800 881', 'http://siemreapvacationhotel.com', 1, '3.0', 48, '2014-12-25', NULL, '50', NULL, 3, 13, '2018-08-29 22:12:47', '2018-08-29 22:12:47', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(98, 'Tropicana Residence & Resort', 'Angkor High School Road, Phum Wat Bo, Salakamreuk', 1, 1, '17000', 'Mr. Seang Sovann', 'rm@tropicanaresidence.com', 'reservation@tropicanaresidence.com', 'rm@tropicanaresidence.com, acc@tropicanaresidence.com', '+855 12 842 349', '+855 12 842 349', '+855 63 210 600', 'http://tropicanaresidence.com', 6, '4.0', 9, '2016-01-11', NULL, '75', NULL, 3, 13, '2018-08-29 22:16:28', '2018-08-29 22:16:28', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(100, 'Asia Tune Hotel', 'No. 85, St. 19 Corner 148, Sangkat Phsar Kandal 2, Khan Daun Penh', 1, 2, '', 'Oul Van', 'gm@asiatunehotel.com', 'asia-tune-hotel@googlegroups.com, hls.booking.system.pp@gmail.com', 'reservation@asiatunehotel.com, ap@asiatunehotel.com, om@asiatunehotel.com', '', '+855 23 977 789', '+855 85 266 668', 'http://asiatunehotel.com', 1, '4.0', 83, '2014-12-01', NULL, '125', NULL, 3, 12, '2019-05-02 10:46:47', '2019-05-02 10:46:47', 12, 2, 5, '2019-05-02', 'They want to prepare their property and they will back. ', 'Ms. LONG Kimly   ', 'Request by email ', 5, '1970-01-01 00:00:00'),
(101, 'Bou Savy Villa', 'Sok San Road, Phum Svay Dangkum, Sangkat Svay Dangkum', 1, 1, '063', 'Mr. Horn Bovuth', 'info@bousavyvilla.com, bousavyvilla7777@hotmail.com', 'info@bousavyvilla.com, bousavyvilla7777@hotmail.com', 'info@bousavyvilla.com', '', '+855 12 898 627', '+855 12 898 627', 'http://bousavyvilla.com', 3, '3.5', 20, '2017-08-02', NULL, '40', NULL, 2, 12, '2018-11-01 15:26:24', '2018-11-01 15:26:24', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(102, 'Boutique Kampot Hotel', '#10 of 68 Specialty Lodging in Kampot 1 Ousaphea Village, Kampong Kandal', 1, 7, '', 'Mr. Nath kananda', 'kananda.nath@gmail.com', 'kananda.nath@gmail.com, duyen@whl.travel', 'kananda.nath@gmail.com', '', '+855 61 888 626', '+855 61 888 626', 'http://boutiquekampot.com', 7, '4.0', 18, '2018-01-29', NULL, '150', NULL, 2, 12, '2018-11-01 15:27:14', '2018-11-01 15:27:14', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(103, 'Bunwin Boutique Hotel', 'National Road 06, Phum Banteay Chas, Opposite Samaki Market', 1, 1, '', 'Mr. Chivid', 'reservation@bunwinboutique.com', 'reservation@bunwinboutique.com', 'account@bunwinboutique.com, reservation@bunwinboutique.com', '', '+855 63 969 158', '+855 12 346 644', 'http://bunwinboutique.com', 1, '4.0', 11, '2015-08-29', NULL, '80', NULL, 2, 12, '2018-11-01 15:27:49', '2018-11-01 15:27:49', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(104, 'Bunwin Plantation', 'Kakranh Village', 1, 1, '', 'Mr. Has Sophal', 'gm@bunwinboutique.com', 'reservation@bunwinplantation.com', 'reservation@bunwinplantation.com', '', '+855 17 310 229', '+855 17 310 229', 'http://plantation.bunwinplantation.com', 1, '3.0', 14, '2015-09-14', NULL, '55', NULL, 3, 12, '2018-09-02 14:02:00', '2018-09-02 14:02:00', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(105, 'Bunwin Residence', 'Kor Kranh Village ', 1, 1, '', 'Mr. Phasy Sun', 'reservation@bunwinresidence.com', 'reservation@bunwinresidence.com', 'reservation@bunwinresidence.com', '', '+855 63 763 677', '+855 71 368 2967', 'http://bunwinresidence.com', 3, '4.0', 10, '2015-09-14', NULL, '80', NULL, 3, 13, '2019-02-05 08:54:10', '2019-02-05 08:54:10', 13, 2, 5, '2019-02-04', 'Stop selling online', 'Chivid Yem', '(855) 12346644/86 24 06 89', 4, '1970-01-01 00:00:00'),
(106, 'Casa Villa Independence Boutique Hotel', '#4, Street 294, Boeung Keng Kong 1', 1, 2, '', 'Ms. Shierlyn', 'reservation@casa-villa.com', 'reservation@casa-villa.com, casavillareservation@gmail.com', 'reservation@casa-villa.com', '', '+855 23 211 729', '+855 96 856 2622', 'http://casa-villa.com', 1, '4.0', 12, '2015-01-01', NULL, '130', NULL, 2, 12, '2018-11-01 15:29:23', '2018-11-01 15:29:23', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(107, 'Central Boutique Angkor Hotel', 'In front of Sala Bai Hospitality School, Tapoul villa, Svay Dangkum commune.', 1, 1, '', 'Mr. Thorn Ve', 'info@centralboutiqueangkorhotel.com', 'info@centralboutiqueangkorhotel.com, dm@centralboutiqueangkor.com', 'info@centralboutiqueangkorhotel.com', '', '+855 63 764 030', '', 'http://centralboutiqueangkorhotel.com', 1, '3.0', 54, '2016-06-23', NULL, '150', NULL, 2, 12, '2018-11-01 15:30:17', '2018-11-01 15:30:17', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(108, 'Central Suite Residence', 'City Center, Sok San Road, Old Market Area', 1, 1, '17000', 'Ms. Kimly Cheak', 'relations@centralsuiteresidence.com', 'relations@centralsuiteresidence.com, om@centralsuiteresidence.com, gm@centralsuiteresidence.com', 'chief-ac@centralsuiteresidence.com, gm@centralsuiteresidence.com', '', '+855 63 969 691', '+855 95 907 676', 'http://centralsuiteresidence.com', 1, '4.0', 32, '2016-03-03', NULL, '60', NULL, 3, 12, '2018-09-02 14:14:07', '2018-09-02 14:14:07', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(109, 'Chateau The Meliya Hotel & Apartment', '10B, St. 264, Sangkat Chaktomuk,  Khan Doun Penh', 1, 2, '', 'Mrs.  ABDOUNE', 'jessica.a@chateauthemeliya.com', 'jessica.a@chateauthemeliya.com, reservation@chateauthemeliya.com', 'jessica.a@chateauthemeliya.com, sreypich.1992@gmail.com', '', '+855 23 987 212', '+855 16 747 524', 'http://chateauthemeliya.com', 1, '4.0', 54, '2017-03-20', NULL, '120', NULL, 3, 12, '2019-07-01 11:24:50', '2019-07-01 11:24:50', 12, 2, 5, '2019-07-01', 'They have a new property and their management team wants to change to another system.', 'Samkot LY ', 'Sent email ', 5, '1970-01-01 00:00:00'),
(110, 'Colina Boutique Hotel', 'No. 26,  At corner of street 123 and 440, Tuoltompoung I, Chamkarmorn', 1, 2, '', 'Mr. Prosa', 'om@colinaboutiquehotel.com', 'fo@colinaboutiquehotel.com', 'account@colinaboutiquehotel.com', '', '+855 23 221 088', '', 'http://colinaboutiquehotel.com', 7, '4.0', 44, '2015-04-03', NULL, '60', NULL, 3, 12, '2018-09-02 14:40:53', '2018-09-02 14:40:53', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(111, 'Cubby House Resort', 'Otres River Village', 1, 6, '', 'Kamala Thomas', 'info@cubbyhouse.asia', 'info@cubbyhouse.asia', 'info@cubbyhouse.asia', '', '+855016388573', '+855016388573', 'http://cubbyhouse.asia', 8, '2.5', 2, '2015-10-27', NULL, '100', NULL, 2, 12, '2018-11-01 15:32:27', '2018-11-01 15:32:27', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(112, 'Damnak Villa Retreat ', ' | #92,Group#6,Trapeang Ses, Kork Chak, Siem Reap, Cambodia', 1, 1, '17252', 'Mr. Sophal Phoeun ', 'info@damnakvillaretreat.com', 'info@damnakvillaretreat.com', 'info@damnakvillaretreat.com', '+855 77 979 711', '+855 77 979 711', '+855 77 979 711', 'http://damnakvillaretreat.com', 3, '3.0', 6, '2018-07-21', NULL, '85', NULL, 2, 12, '2018-11-01 15:37:08', '2018-11-01 15:37:08', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(113, 'Damrei Angkor Hotel', 'Street 20, Wat Bo Village, Salakomroek Commune', 1, 1, '', 'Mr. Sombo', 'info@damreiangkorhotel.com', 'reservations@damreiangkorhotel.com ', 'info@damreiangkorhotel.com', '', '+855 63 968 717', '+855 16 885 378', 'http://damreiangkorhotel.com', 1, '4.0', 50, '2017-06-12', NULL, '100', NULL, 2, 12, '2018-11-01 15:39:22', '2018-11-01 15:39:22', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(114, 'De I\'homme ', 'Phnom Penh', 1, 2, '', 'Mr. Peter', 'reservation@hoteldelhomme.com', 'reservation@hoteldelhomme.com', 'reservation@hoteldelhomme.com', '', '+855 96 829 3544', '+855 23 211 498', 'http://deihomme.com', 1, '4.0', 15, '2018-03-29', NULL, '100', NULL, 3, 13, '2019-05-29 09:38:58', '2019-05-29 09:38:58', 13, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(115, 'De Sarann Suites', '#092, Group 6, Trapeang Ses Village | Sangkat Kork Chork, Siem Reap', 1, 1, '', 'Mr. Mike Hob', 'info@desarannvilla.com, info@desarannsuites.com', 'info@desarannvilla.com, info@desarannsuites.com, duyen@whl.travel', 'info@desarannvilla.com, info@desarannsuites.com', '', '+855 63 900 050', '+855 88 299 9923', 'http://desarannsuites.com', 1, '4.0', 8, '2016-08-19', NULL, '80', NULL, 3, 12, '2018-09-02 14:58:51', '2018-09-02 14:58:51', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(116, 'De Sarann Villa', '#37 Trang Village, Sangkat Slorkram', 1, 1, '', 'Mr. Andrew Pan', 'info@desarannvilla.com', 'info@desarannvilla.com', 'info@desarannvilla.com', '', '+855 88 299 9923', '+855 97 750 8545', 'http://desarannvilla.com', 3, '4.0', 4, '2016-03-27', NULL, '80', NULL, 3, 12, '2018-09-02 15:01:36', '2018-09-02 15:01:36', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(117, 'Dechasey Residence', 'Off Route Six, About 300 meters down Korean-Cambodian Friendship Rd', 1, 1, '', 'Mr. Kim May', 'operation@dechaseyresidence.com', 'operation@dechaseyresidence.com', 'operation@dechaseyresidence.com', '', '+855 63 965 945', '+855 15 374 477', 'http://communityresidencesiemreap.com', 1, '4.0', 10, '2017-04-28', NULL, '40', NULL, 3, 13, '2018-10-31 13:56:45', '2018-10-31 13:56:45', 13, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(118, 'Demo', 'slarkram', 1, 1, '17000', 'Mr. Maco', 'info@eocambo.com', 'info@eocambo.com', 'info@eocambo.com', '+855 69 955 179', '+855 69 955 179', '+855 77 466 082', 'http://eocambo.com', 6, '5.0', 20, '2018-07-02', NULL, '1', NULL, 1, 2, '2019-01-02 16:05:01', '2019-01-02 16:05:01', 2, 2, 5, '1970-01-01', '', '', '', 4, '2019-01-24 00:00:00'),
(119, 'Dinata Angkor Boutique', 'Taphul Road, Svay Dangkum Commune', 1, 1, '', 'Mr. Heng Sothea', 'gm@dinataangkor.com', 'gm@dinataangkor.com', 'gm@dinataangkor.com', '', '+855 63 968 836', '+855 77 447 900', 'http://dinataangkor.com', 7, '3.0', 28, '2017-09-22', NULL, '100', NULL, 3, 13, '2019-02-05 08:51:10', '2019-02-05 08:51:10', 13, 2, 5, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(120, 'Dom Boutique Hotel', 'Wat Damnak village, Sangkat Sala Kamreuk Siem Reap Cambodia', 1, 1, '', 'Mr. Paolo', 'domsiemreap@gmail.com', 'domsiemreap@gmail.com', 'domsiemreap@gmail.com', '', '+855 96 330 6403', '+855 68 639 123', 'http://domsiemreap.com/en-us', 7, '3.0', 26, '2018-04-06', NULL, '30', NULL, 3, 12, '2018-09-02 15:28:07', '2018-09-02 15:28:07', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(121, 'Double Leaf Boutique Hotel', '#32, Street 123, Toul Tom Pong I, Khan Chamkamon', 1, 2, '', 'Mr. Phanith Lmoth', 'gm@doubleleafhotel.com', 'info@doubleleafhotel.com, hls.booking.system.pp@gmail.com', 'gm@doubleleafhotel.com', '', '+855 23 226 299', '+855 23 226 299', 'http://doubleleafhotel.com', 7, '4.0', 48, '2014-12-01', NULL, '166.5', NULL, 3, 12, '2018-09-02 15:32:15', '2018-09-02 15:32:15', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(122, 'Dyna Boutique Hotel', 'Phum Salar Kanseng, Khum Svay DangKum', 1, 1, '', 'Mr. Vorn Savoeun', 'gm@dynaboutiquehotel.com', 'gm@dynaboutiquehotel.com', 'gm@dynaboutiquehotel.com', '', '+855 63 968 881', '+855 77 529 856', 'http://dynaboutiquehotel.com', 7, '3.0', 12, '2015-03-30', NULL, '75', NULL, 3, 12, '2018-09-02 15:45:54', '2018-09-02 15:45:54', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(123, 'Eco Villa', '# Road 30, Behind Krous High School, Infront of Tropical Restaurant, Kruos, Siem Reap', 1, 1, '', 'Mr. Den', 'den@ehotelbiz.com', 'den@ehotelbiz.com, royal@ehotelbiz.net', 'den@ehotelbiz.com', '', '+855 92 307 314', '', 'http://ecovillasiemreap.com', 3, '4.0', 10, '2017-02-09', NULL, '60', NULL, 3, 12, '2018-09-02 15:48:26', '2018-09-02 15:48:26', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(124, 'eOcambo Residence', '#Street 22 (Tea Csales@eocamboresidence.comhamrat), Wat Bo Village, Siem Reap', 1, 1, '', 'Mr. Peter Phich', 'reservation@eocamboresidence.com', 'gm@eocambo.com, sales@eocamboresidence.com, reservation@eocamboresidence.com, peter@eocambo.com, kimkhorn@eocambo.com', 'sales@eocamboresidence.com', '', '+855 70 379 905', '+855 92 991 005', 'http://eocamboresidence.com', 1, '4.0', 22, '2017-08-09', NULL, '100', NULL, 2, 12, '2018-11-01 15:41:56', '2018-11-01 15:41:56', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(125, 'eOcambo Resort', 'BBU Road, Vihear Chen Village, Sangkat Svay Dangkum, Siem Reap', 1, 1, '17252', 'Mr. Peter Phich', 'peter@eocambo.com', 'info@eocamboresort.com, sales@eocamboresidence.com, peter@eocambo.com, kimkhorn@eocambo.com, gm@eocambo.com', 'peter@eocambo.com', '', '+855 70 379 905', '+855 70 379 905', 'http://eocamboresort.com', 6, '5.0', 28, '2018-08-02', NULL, '1', NULL, 2, 12, '2018-11-01 15:42:47', '2018-11-01 15:42:47', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(126, 'eOCambo Villa', 'BBU road, Vihear Chen Village, Svaydangkum Cummune, Siem Reap', 1, 1, '', 'Mr. Peter', 'info@eocambovilla.com', 'info@eocambovilla.com, gm@eocambo.com, peter@eocambo.com', 'info@eocambovilla.com', '', '+855 70 379 905', '+855 70 379 905', 'http://villa.eocambovilla.com', 3, '2.0', 8, '2017-05-30', NULL, '40', NULL, 2, 12, '2018-11-01 15:43:39', '2018-11-01 15:43:39', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(127, 'eOcambo Village', 'Street 22 (Tea Chamrat), Wat Bo Village', 1, 1, '', 'Mr. Peter Phich', 'reservation@eocambovillage.com', 'kimkhorn@eocambo.com, gm@eocambo.com, reservation@eocambovillage.com, peter@eocambo.com, sales@eocamboresidence.com', 'sales@eocamboresidence.com', '', '+855 70 379 905', '+855 92 991 005', 'http://eocambovillage.com', 1, '4.0', 28, '2017-08-19', NULL, '40', NULL, 2, 12, '2018-11-01 15:44:50', '2018-11-01 15:44:50', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(128, 'F&B Hostel', 'Sok San Road, Phum Svay Dangkum, Sangkat Svay Dangkum', 1, 1, '', 'Mr. Vannak', 'phoanvannak@gmail.com', 'phoanvannak@gmail.com', 'phoanvannak@gmail.com', '', '+855 89 672 722', '+855 98 640 885', 'http://fbsiemreaphostel.com', 1, '3.0', 12, '2017-08-09', NULL, '100', NULL, 3, 12, '2018-09-02 16:04:51', '2018-09-02 16:04:51', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` (`id`, `name`, `address`, `country`, `city`, `postal_code`, `contact_person`, `general_email`, `reservation_email`, `invoice_email`, `mobile_number_invoice`, `main_phone_1`, `main_phone_2`, `website_url`, `accommodation_type`, `star_rating`, `number_of_rooms`, `sale_date`, `service_agreement`, `fee`, `status`, `accomodation_stats`, `created_by`, `created_at`, `updated_at`, `updated_by`, `passed_by`, `handle_by`, `deactivated_at`, `deactivated_reason`, `deactivated_requested_by`, `deactivated_requested_contact_detail`, `deactivated_by`, `lived_date`) VALUES
(129, 'Fancy Boutique Villa', 'Samdach Tep Vong Street, Group 2, Steung Thmey Village, Sangkat Svaydangkom', 1, 1, '', 'Mr.Krishna ', 'gm@fancyboutiquevilla.com', 'book@fancyboutiquevilla.com, gm@fancyboutiquevilla.com', 'book@fancyboutiquevilla.com, gm@fancyboutiquevilla.com', '', '+855 63 965 377', '+855 70 892 850', 'http://fancyboutiquevilla.com', 7, '4.0', 13, '2016-01-15', NULL, '90', NULL, 3, 12, '2018-09-02 16:07:20', '2018-09-02 16:07:20', 12, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(130, 'Fancy Guest House', 'No. 169B, Street 15, Phsar Kandal 2, Khan Daun Penh', 1, 2, '', 'Mr. Phannak ', 'fancyguesthouse@yahoo.com', 'fanscyguesthouse@yahoo.com', 'fancyguesthouse@yahoo.com', '', '+855 23 211 829', '+855 11 943 219', 'http://fancyguesthouse.com', 9, '0.0', 21, '2014-10-20', NULL, '85', NULL, 3, 12, '2018-09-02 16:10:12', '2018-09-02 16:10:12', 12, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(131, 'Feliz Hostel Cafe & Bar', 'Z6-132, St 51, Buoeng Keng Kong 1 Commune, Chamkarmon District', 1, 2, '12302', 'Mr. Arun Raing', ' bookings@felizhostel.com', 'bookings@felizhostel.com', 'felizhostel@gmail.com', '', '+855 23 216 596', '+855 17 664 495', 'http://felizhostel.com', 2, '3.0', 18, '2016-07-12', NULL, '100', NULL, 2, 12, '2018-11-01 15:45:31', '2018-11-01 15:45:31', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(132, 'Feliz Urban Hotel', ' #3 Bis, Street 288, Boeung Keng Kang Commune, Chamkarmon District, PhnomPenh', 1, 2, '12302', 'Mr. Arun Raing', 'generalmanager.feliz@gmail.com', 'felizurbanhotel@gmail.com', 'panharith.sitthy@gmail.com', '', '+855 23 212 555', '+855 17 664 495', 'http://', 1, '4.0', 36, '2017-03-09', NULL, '150', NULL, 2, 12, '2018-11-01 15:46:49', '2018-11-01 15:46:49', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(133, 'Flourishing Boutique Hotel', 'Country Road Wat Chowk, Svay Dangkum, Siem Reap, Cambodja', 1, 1, '', 'Mr. CHHAI', 'info@flourishingboutique.com', 'info@flourishingboutique.com, reservation@flourishingboutique.com', 'info@flourishingboutique.com', '', '+855 61 222 637', '+855 70 643 747', 'http://flourishingboutique.com', 1, '4.0', 6, '2016-10-31', NULL, '70', NULL, 3, 12, '2018-09-02 16:20:40', '2018-09-02 16:20:40', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(134, 'G & Z Angkor Hotel', 'Siem Reap', 1, 1, '', 'Mr. Sarat Yoeung', 'Sarath.y@wegoalconsulting.com', 'Sarath.y@wegoalconsulting.com', 'Sarath.y@wegoalconsulting.com', '+855 10 339 235', '+855 10 339 235', '+855 10 339 235', 'http://gzangkorhotel.com', 1, '3.0', 21, '2018-04-30', NULL, '40', NULL, 3, 13, '2018-09-07 09:08:14', '2018-09-07 09:08:14', 13, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(135, 'G & Z Angkor Boutique', 'Siem Reap', 1, 1, '', 'Mr. David Chhun', 'gm@gzinvestmentgroups.com', 'reservations@gzinvestmentgroups.com', 'account@gzinvestmentgroups.com', '', '+855 87 757 555', '+855 87 757 555', 'http://gzangkorboutique.com', 7, '4.0', 18, '2018-04-30', NULL, '60', NULL, 3, 12, '2018-09-02 16:26:17', '2018-09-02 16:26:17', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(136, 'Garden Flower Resort ', ' Phum Khnar, Khum Chreav, Siem Reap district,Siem Reap province', 1, 1, '17256', 'Mr. Oem Sopha', 'info@gardenflowerresort.com', 'info@gardenflowerresort.com', 'info@gardenflowerresort.com', '', '+855 96 868 6296', '', 'http://gardenflowerresort.com', 6, '4.0', 30, '2019-02-08', NULL, '157', NULL, 3, 12, '2019-03-23 08:45:12', '2019-03-23 08:45:12', 12, 14, 5, '2019-03-22', 'They don\'t have any OTAs that make a reservation and they want to prepare their property.', 'General Manager (B Nisa)', '+855 78 299 995', 5, '2019-02-12 00:00:00'),
(137, 'GBT 3 Guesthouse', 'Serendipity Street', 1, 6, '1800', 'Mr. Hom Sokleng', 'gbt_beach@yahoo.com', 'gbt_beach@yahoo.com', 'gbt_beach@yahoo.com', '', '+855 16 777 818', '+855 16 999 818', 'http://gbt3guesthouse.com', 9, '2.0', 46, '2015-05-07', NULL, '150', NULL, 3, 12, '2018-09-02 16:35:57', '2018-09-02 16:35:57', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(138, 'Genevieve\'s Khmer Villa', '#0141, Wat Damnak Street, Old Market', 1, 1, '', 'Mr. Bill Longo', 'billlongotemp@gmail.com', 'booking@damnakriverside.com', 'booking@damnakriverside.com', '', '+855 63 966 566', '+855 70 245 189', 'http://genevieveskhmervilla.com', 1, '3.0', 29, '2017-09-14', NULL, '125', NULL, 3, 12, '2018-09-02 16:37:57', '2018-09-02 16:37:57', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(139, 'Glory Angkor Hotel', 'Wat Bo Road, Wat Bo Village,  Salakormrouk Commune, ', 1, 1, '', 'Chhem Samnang', 'info@gloryangkorhotel.com', 'info@gloryangkorhotel.com', 'info@gloryangkorhotel.com', '', '+855 12 366 657', '+855 63 966 687', 'http://gloryangkorhotel.com', 1, '4.0', 16, '2018-02-02', NULL, '60', NULL, 2, 12, '2018-11-01 15:48:23', '2018-11-01 15:48:23', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(140, 'Golden Banana Residence ', 'Siem Reap', 1, 1, '', 'Mr. Laot Tre', 'gm@golden-banana.com', 'booking@golden-banana.com, sales@golden-banana.com, sales@villawatdamnak.com, sales@residencewatdamnak.com', 'gm@golden-banana.com, accountant@residencewatdamnak.com', '', '+855 70 261 397', '+855 70 261 397', 'http://golden-banana.com', 1, '3.0', 30, '2017-12-04', NULL, '30', NULL, 3, 13, '2018-10-31 13:50:52', '2018-10-31 13:50:52', 13, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(141, 'Golden Butterfly Villa', 'Stung Thmey, Svay Dangkum near Pub Street, Pub Street Alley', 1, 1, '1710', 'Mr. Chen ', 'info@goldenbutterflyvilla.com', 'reservations@goldenbutterflyvilla.com', 'info@goldenbutterflyvilla.com', '', '+855 96 801 0338', '+855 92 646 439', 'http://goldenbutterflyvilla.com', 3, '3.0', 25, '2016-08-29', NULL, '100', NULL, 2, 12, '2018-11-01 15:49:04', '2018-11-01 15:49:04', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(142, 'Golden House International Hotel', '#23-25 St.136, Phsar Kandal 1  Daun Penh', 1, 2, '12204', 'Mrs. Lim Siv Mey', 'mail@goldenhouse.asia', 'stay@goldenhouse.asia, mail@goldenhouse.asia, hls.booking.system.pp@gmail.com', 'mail@goldenhouse.asia, stay@goldenhouse.asia', '', '+855 23 222 167', '+855 95 566 766', 'http://goldenhouse.asia', 1, '3.0', 21, '2014-08-19', NULL, '155', NULL, 2, 12, '2018-11-01 15:50:57', '2018-11-01 15:50:57', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(143, 'Golden Mango Inn', 'Road 6, Chongkaosou Village, Slorkram Commune', 1, 1, '', 'Mr. Cheab Sokvann', 'info@goldenmangoinn.com ', 'info@goldenmangoinn.com', 'info@goldenmangoinn.com ', '', '+855 63 761 857', '+855 12 952 741', 'http://goldenmangoinn.com', 1, '3.0', 24, '2017-06-16', NULL, '50', NULL, 3, 12, '2018-11-01 12:04:33', '2018-11-01 12:04:33', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(144, 'Golden Sand Hotel ', 'Ochheuteal beach, St. 23 Tola, Sangkat 4', 1, 6, '', 'Mr. Sok Sopheng', 'info@goldensandhotel.com.kh', 'sales@goldensandhotel.com.kh ', 'acc@goldensandhotel.com.kh', '', '+855 34 933 607', '+855 93 776 666', 'http://goldensandhotel.com.kh', 1, '4.0', 120, '2015-03-18', NULL, '120', NULL, 3, 12, '2018-09-02 16:53:57', '2018-09-02 16:53:57', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(145, 'Golden Sea Beach Hotel & Casino', 'Victory Beach, Vithey Krong, Sangkat 3', 1, 6, '', 'Mr. Chang Suk Oh', 'hotel@goldenseabeach.com', 'goldenseabeach567@gmail.com', 'goldenseabeach567@gmail.com', '', '+855 12 603 600', '+855 16 896 600', 'http://goldenseabeach.com', 1, '4.0', 40, '2015-01-26', NULL, '185', NULL, 3, 12, '2018-09-02 16:56:08', '2018-09-02 16:56:08', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(146, 'Golden Sea Hotel & Casino', 'Ekareach St,Sangkat3, Sihanouk vill Preach Sihanouk Province,Kingdom of Cambodia', 1, 6, '', 'Mr. Charkrong Chhong', 'gm@goldenseahotels.com', 'sales@goldenseahotels.com  ', 'fn@goldenseahotels.com', '', '+855 92 230 888', '+855 97 276 8780', 'http://goldenseahotels.com', 1, '4.0', 105, '2016-06-27', NULL, '35', NULL, 3, 12, '2018-09-02 16:58:39', '2018-09-02 16:58:39', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(147, 'Golden Temple Boutique', 'Steung Thmey Village, Savay Dangkum Commune, Siem Reap', 1, 1, '17252', 'Mr. Chot Barang', 'reservations@goldentempleboutique.com', 'reservations@goldentempleboutique.com', 'reservations@goldentempleboutique.com', '', '+855 63 212 222', '+855 98 374 079', 'https://www.goldentempleboutique.com/home', 7, '4.0', 19, '2017-07-21', NULL, '115', NULL, 3, 12, '2018-09-02 17:01:27', '2018-09-02 17:01:27', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(148, 'Golden Temple Hotel', '7 Makara road, or Angkor High School road', 1, 1, '', 'Mr. Luon Thea', 'info@goldentemplehotel.com, fom@goldentemplehotel.com, gm@goldentempleresidence.com', 'reservation@goldentemplehotel.com, fom@goldentemplehotel.com', 'reservation@goldentemplehotel.com, gm@goldentemplehotel.com, ac@goldentemplehotel.com, fom@goldentemple.com, info@goldentemplehotel.com', '', '+855 63 967 996', '+855 12 756 655', 'http://goldentemplehotel.com', 7, '4.0', 29, '2015-09-28', NULL, '115', NULL, 3, 12, '2018-09-02 17:03:33', '2018-09-02 17:03:33', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(149, 'Golden Temple Retreat', 'Wat Damnak, Sala Kamreuk, Siem Reap', 1, 1, '17252', 'Mr. Loun Thea', 'gm@goldentempleretreat.com, it@goldentempleresidence.com', 'reservation@goldentempleretreat.com', 'ac@goldentempleretreat.com', '', '+855 63 217 777', '', 'http://retreat.goldentempleretreat.com', 1, '4.0', 32, '2016-12-22', NULL, '115', NULL, 3, 12, '2018-09-02 17:10:27', '2018-09-02 17:10:27', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(150, 'Golden Temple Villa', 'Sok San Road, Svay Dangkum', 1, 1, '17252', 'Mr. Luon Thea', 'reservations@goldentemplevilla.com, info@goldentempleresidence.com', 'reservations@goldentemplevilla.com', 'gm@goldentemplevilla.com, acm@goldentemplevilla.com', '', '+855 12 794 938', '+855 12 794 938', 'http://villa.goldentemplevilla.com', 3, '4.0', 23, '2015-10-16', NULL, '115', NULL, 3, 12, '2018-09-02 17:13:13', '2018-09-02 17:13:13', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(151, 'Grand Elevation Hotel ', 'House G6 G7 G8, St. Sothearos, Tonle Basac Charmkarmon, Chamkar Morn, Phnom Penh, Cambodia', 1, 2, '', 'Ms. Nimol Tha', 'elevation.hotel@yahoo.com', 'elevation.hotel@yahoo.com', 'elevation.hotel@yahoo.com', '', '+855 77 556 528', '+855 77 556 528', 'https://grandelevationhotel.com', 1, '3.0', 54, '2018-08-16', NULL, '90', NULL, 2, 12, '2018-11-01 15:52:01', '2018-11-01 15:52:01', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(152, 'Green Amazon Residence', 'Phneachey Village, Svay Dangkom Commune', 1, 1, '', 'Mr. Phu Vireak', 'book@greenamazonresidence.com', 'book@greenamazonresidence.com', 'book@greenamazonresidence.com, fc@greenamazonresidence.com', '', '+855 63 767 7000', '+855 63 767 7000', 'http://greenamazonresidence.com', 1, '4.0', 52, '2017-12-04', NULL, '60', NULL, 3, 12, '2018-09-02 17:32:34', '2018-09-02 17:32:34', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(153, 'La Parranda Residence & Hotel', 'No.207, St. Mao Tsetoung, Sangkat Toul Svay Prey 2, Khan Chomkamorn', 1, 2, '', 'Ms. Sothy Samrith', 'info@laparrandahotels.com', 'ecommerce@laparrandahotels.com', 'sale@laparrandahotels.com', '', '+855 23 424 106', '+855 12 212 100', 'http://laparrandahotels.com', 1, '3.0', 56, '2015-03-05', NULL, '60', NULL, 3, 12, '2018-09-02 17:34:54', '2018-09-02 17:34:54', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(154, 'KT Apartment Siem Reap', 'Street 26, Siem Reap', 1, 1, '', 'Mr. Piseth', 'info@kt-apartments.com', 'info@kt-apartments.com', 'info@kt-apartments.com', '', '+855 12 415 774', '+855 87 396 999', 'http://kt-apartments.com', 5, '0.0', 12, '2017-05-12', NULL, '80', NULL, 2, 12, '2018-11-01 15:53:05', '2018-11-01 15:53:05', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(155, 'Kralanh Petite Villa', 'Veal Village | Sangkat Kouk Chork', 1, 1, '', 'Mr. Srey Meng Ly', 'gm@kralanhpetitevilla.com', 'reservation@kralanhpetitevilla.com', 'gm@kralanhpetitevilla.com', '', '+855 17 597 513', '+855 60 486 666', 'http://kralanhpetitevilla.com', 3, '3.5', 6, '2016-04-21', NULL, '40', NULL, 3, 12, '2018-09-02 17:42:32', '2018-09-02 17:42:32', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(156, 'KOUPREY HOTEL', 'Top Town Road, Krous Village, Svay Dangkum', 1, 1, '', 'Mr. Korm Sopheng', 'info@hotelkoupreyangkor.org', 'info@hotelkoupreyangkor.org', 'info@hotelkoupreyangkor.org', '', '+855 63 765 674', '+855 95 595 943', 'http://hotelkoupreyangkor.org', 1, '3.5', 57, '2015-10-01', NULL, '50', NULL, 3, 12, '2018-09-02 17:44:53', '2018-09-02 17:44:53', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(157, 'Kolab Sor Phnom Penh Hotel', '#436, Street 310, Sangkat Boeung Keng Kang III, Khan Chamkarmon', 1, 2, '', 'Ms. KEO SONY', 'info@kolabsorhotel.com ', 'onewoman168@gmail.com, info@kolabsorhotel.com', 'koesony@kolabsorhotel.com, info@kolabsorhotel.com', '', '+855 12 802 707', '+855 23 979 798', 'http://kolabsorhotel.com', 1, '4.0', 52, '2015-02-04', NULL, '126', NULL, 2, 12, '2018-11-01 15:53:47', '2018-11-01 15:53:47', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(158, 'Koh Rong Love Resort', 'Koh Rong Island , Sok San Village, Sangkat Koh Rong, Sihanouk Ville, Sihanouk province', 1, 6, '', 'Mr. Sitha Nhem ', 'gm@kohrongloveresort.com', 'gm@kohrongloveresort.com', 'gm@kohrongloveresort.com', '', '+855 16 963 198', '+855 85 311 161', 'http://kohrongloveresort.com', 6, '0.0', 48, '2017-10-09', NULL, '150', NULL, 2, 12, '2018-11-01 15:55:16', '2018-11-01 15:55:16', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(159, 'Klampuu Villa Hostel', 'st 53, Stueng Thmei Village, Svay Dangkum Commune', 1, 1, '', 'Mr. Long Vansak', 'long.vansak@gmail.com', 'long.vansak@gmail.com', 'long.vansak@gmail.com', '', '+855 10 556 191', '+855 10 556 191', 'http://klampuuvillahostel.com', 2, '3.0', 11, '2018-01-03', NULL, '80', NULL, 3, 13, '2018-10-31 13:09:26', '2018-10-31 13:09:26', 13, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(160, 'Klampuu Villa', 'Street 53, Stueng Thmei Village, Svay Dangkum Commune', 1, 1, '17252', 'Mr. Long Vansak', 'long.vansak@gmail.com', 'long.vansak@gmail.com', 'long.vansak@gmail.com', '', '+855 12 926 020', '+855 10 556 191', 'http://klampuuvilla.com', 3, '3.0', 11, '2017-10-31', NULL, '90', NULL, 2, 12, '2018-11-01 15:55:53', '2018-11-01 15:55:53', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(161, 'King Rock Boutique Hotel', 'Group #7, Wat Damnak, Sala Kamreouk', 1, 1, '17254', 'Mr. Hem Sophoun', 'om@kingrockboutique.com', 'om@kingrockboutique.com, room@kingrockboutique.com, info@kingrockboutique.com', 'account@kingrockboutique.com', '', '+855 63 766 141', '+855 10 712 425', 'http://kingrockboutique.com', 7, '4.0', 18, '2016-06-25', NULL, '50', NULL, 3, 12, '2018-09-02 17:57:32', '2018-09-02 17:57:32', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(162, 'King Boutique Hotel', '251 Samdach Tep Vong, Siem Reap 17252', 1, 1, '', 'Mr. Sam', 'kingboutiquehotel@gmail.com', 'kingboutiquehotel@gmail.com', 'kingboutiquehotel@gmail.com', '', '+855 63 760 655', '+855 12 930 011', 'http://kingboutiquehotel.com', 1, '3.0', 24, '2016-10-19', NULL, '45', NULL, 3, 12, '2018-09-02 17:59:30', '2018-09-02 17:59:30', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(163, 'Khmere Maison D\'Angkor', '#482, BO POX 93090, City Center, National Road No.6, Wat Kesaram Street, Sangkat Svay Dangkum,', 1, 1, '17000', 'Jacky LONG ', 'jacky@khmeremaisondangkor.com', 'relations@khmeremaisondangkor.com', 'jacky@khmeremaisondangkor.com', '', '+855 63 766 062', '+855 12 660 160', 'http://khmeremaisondangkor.com', 7, '3.0', 6, '2015-11-02', NULL, '30', NULL, 3, 12, '2018-09-02 18:03:37', '2018-09-02 18:03:37', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(164, 'Khmer Wooden Hostel', '#144, Taphul Village, Svaydangkum', 1, 1, '', 'Ms. Vichna Run', 'info@khmerwoodenhostel.com', 'info@khmerwoodenhostel.com', 'info@khmerwoodenhostel.com', '', '+855 63 965 444', '+855 12 458 338', 'http://khmerwoodenhostel.com', 2, '0.0', 4, '2016-02-23', NULL, '100', NULL, 3, 12, '2018-09-02 18:05:41', '2018-09-02 18:05:41', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(165, 'Khmer Mansion Residence', 'Sok San Street, Stung Thmey Village, Svay Dangkum Commune', 1, 1, '', 'Ms. Chea Komrong', 'reservation@khmermansionresidence.com, gm@khmermansionresidence.com', 'reservation@khmermansionresidence.com, gm@khmermansionresidence.com, chhnakchhai99@gmail.com', 'accountant@khmermansionresidence.com', '', '+855 63 762 333', '+855 77 708 558', 'http://khmermansionresidence.com/residence.html', 1, '3.0', 47, '2017-08-29', NULL, '50', NULL, 2, 12, '2018-11-01 15:57:48', '2018-11-01 15:57:48', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(166, 'Khmer Mansion Boutique Hotel', 'Sok San Street, Stung Thmer Village, Svay Dangkum Commune', 1, 1, '', 'Ms. Chea Komrong', 'gm@khmermansion.com', 'gm@khmermansion.com', 'accountant@khmermansion.com', '', '+855 63 762 333', '+855 77 708 558', 'http://khmermansion.com', 1, '4.0', 22, '2017-06-01', NULL, '50', NULL, 2, 12, '2018-11-01 15:58:17', '2018-11-01 15:58:17', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(167, 'Khavi Villa', '#12 st 258', 1, 2, '', 'Mr. Khavi Sang', 'khavicambodia@yahoo.com', 'khavicambodia@yahoo.com', 'khavicambodia@yahoo.com', '', '+855 12 766 624', '', 'http://khavivilla.com', 3, '4.0', 23, '2015-02-24', NULL, '150', NULL, 3, 12, '2018-09-02 18:15:26', '2018-09-02 18:15:26', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(168, 'Khavi Guesthouse', '#7DD, Street 258 , S/K Chaktomuk, Khan Daun Penh', 1, 2, '', 'Mr. Khavi Sang', 'khavicambodia@yahoo.com', 'khavicambodia@yahoo.com', 'khavicambodia@yahoo.com', '', '+855 23 632 4466', '+855 12 766 624', 'http://khavi-guesthouse.com', 9, '3.0', 23, '2015-02-23', NULL, '100', NULL, 3, 12, '2018-09-02 18:18:02', '2018-09-02 18:18:02', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(169, 'Kafu Resort and Spa', 'River Road, Slarkram Commune', 1, 1, '', 'Ms. Vann Narin', 'info@kafu-resort.com', 'info@kafu-resort.com', 'info@kafu-resort.com', '', '+855 63 964 242', '+855 15 364 686', 'http://kafu-resort.com', 1, '3.0', 28, '2017-11-10', NULL, '60', NULL, 3, 12, '2019-06-14 08:58:55', '2019-06-14 08:58:55', 12, 2, 5, '2019-06-14', 'They want to save budget for low season', 'Mr. Pisith Roeum', 'By Email ', 5, '1970-01-01 00:00:00'),
(170, 'Jasmin Monument Hotel', ' #22s, Street 29, BKK1, Tonlebassac, Chamkarmon', 1, 2, '', 'Mr. Sok Chan', 'gm@j-monumenthotel.com', 'manager@j-monumenthotel.com, gm@j-monumenthotel.com, stay@j-monumenthotel.com', 'manager@j-monumenthotel.com, gm@j-monumenthotel.com', '', '+855 23 221 322', '+855 86 565 959', 'http://j-monumenthotel.com', 1, '4.0', 23, '2017-04-20', NULL, '100', NULL, 3, 13, '2019-01-15 09:21:01', '2019-01-15 09:21:01', 13, 2, 5, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(171, 'Isann Villa', 'Svay Dongkom,', 1, 1, '', 'Mr. Sothea Seng', 'sothea@mahobkhmer.com', 'sothea@mahobkhmer.com', 'sothea@mahobkhmer.com', '', '+855 12 926 562', '+855 12 926 562', 'http://isannvilla.com', 3, '3.0', 15, '2018-02-01', NULL, '100', NULL, 3, 13, '2018-09-07 09:08:26', '2018-09-07 09:08:26', 13, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(172, 'Isann Lodge', 'Chong Kao Su Village, Sangkat Slor Kram', 1, 1, '', 'Mr. Sothea Seng ', 'info@isannlodge.com', 'info@isannlodge.com', 'info@isannlodge.com', '', '+855 63 966 986', '+855 12 926 562', 'http://isannlodge.com', 6, '3.5', 12, '2017-06-21', NULL, '100', NULL, 3, 12, '2018-09-02 18:33:33', '2018-09-02 18:33:33', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(173, 'Indradevi Boutique Hotel', 'Krous Village, Svay Dankum, Sieam Reap', 1, 1, '', 'Mr. Chhuney', 'info@indradeviboutiquehotel.com, Keochhunyu@gmail.com', 'info@indradeviboutiquehotel.com, Keochhunyu@gmail.com', 'info@indradeviboutiquehotel.com, Keochhunyu@gmail.com', '', '+855 63 766 398', '+855 95 566 262', 'http://indradeviboutiquehotel.com', 7, '3.5', 20, '2016-12-12', NULL, '100', NULL, 3, 12, '2018-09-02 18:35:52', '2018-09-02 18:35:52', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(174, 'Indra Porak Residence', 'Betong Street, Village Vihear Chen, Sangkat Svay Dangkom,near by Pub Street', 1, 1, '17252', 'Mr. Lim Rithy', 'sales@indraporak.com', 'reservation@indraporak.com, sales@indraporak.com', 'limrithy27@yahoo.com', '', '+855 93 859 007', '+855 63 963 373', 'http://indraporak.com', 7, '4.0', 16, '2015-09-15', NULL, '50', NULL, 3, 12, '2018-09-02 18:39:11', '2018-09-02 18:39:11', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(175, 'Indochine 2 Hotel', 'No. 28-30, Street 130, Phsar Kandal I, Daun Penh, Phnom Penh, Cambodia.', 1, 2, '12000', 'Ms. Sivly Lim', 'lim.sivly@indochine2hotel.com', 'reservation@indochine2hotel.com, hls.booking.system.pp@gmail.com', 'lim.sivly@indochine2hotel.com', '', '+855 23 211 525', '+855 23 211 787', 'http://indochine2hotel.com', 1, '2.0', 30, '2014-12-01', NULL, '85', NULL, 3, 12, '2018-09-02 18:41:32', '2018-09-02 18:41:32', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(176, 'In Miles Boutique Hotel', 'No. 042, Charle De Gaulle Blvd (Main Road to Angkor Wat), Mondul 3 village, Sangkat Slor Kram', 1, 1, '', 'Mr. Pheakdey', 'info@inmilesboutique.com', 'info@inmilesboutique.com, inmilesboutique@gmail.com', 'info@inmilesboutique.com', '', '+855 17 995 567', '', 'http://inmilesboutique.com', 1, '2.0', 10, '2017-02-10', NULL, '50', NULL, 3, 12, '2018-09-02 18:46:53', '2018-09-02 18:46:53', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(177, 'Hotel Tokyo Service Apartment and Spa', 'Phnom Penh', 1, 2, '', 'Mr. Kaizo', 'contact@kihoteltokyo.com', 'contact@kihoteltokyo.com', 'contact@kihoteltokyo.com', '', '+855 23 901 358', '', 'http://hoteltokyoserviceapartmentandspa.com', 1, '2.0', 100, '2018-02-26', NULL, '70', NULL, 3, 13, '2019-05-29 09:34:55', '2019-05-29 09:34:55', 13, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(178, 'Hotel Records', 'Phnom Penh', 1, 2, '', 'Mr. Ea Tola', 'records@journeyside.com', 'records@journeyside.com', 'records@journeyside.com', '', '+855 23 981 818', '+855 12 850 488', 'http://hotelrecords.com', 1, '3.0', 15, '2018-06-29', NULL, '30', NULL, 3, 13, '2019-01-15 09:05:04', '2019-01-15 09:05:04', 13, 2, 5, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(179, 'Hotel Five.S ', 'Krang Vilage, KrangAmpil Commune,', 1, 7, '07452', 'Mr. Jimmy', 'info@hotelfives.com', 'info@hotelfives.com', 'gentillesun@gmail.com', '', '+855 81 375 375', '+855 69 370 000', 'http://hotelfives.com', 1, '3.0', 15, '2016-09-20', NULL, '100', NULL, 2, 12, '2018-11-01 16:02:59', '2018-11-01 16:02:59', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(180, 'Hotel Corduroy', 'Phnom Penh', 1, 2, '', 'Mr. Ear Tola', 'tola@journeyside.com', 'tola@journeyside.com', 'tola@journeyside.com', '+855 12 850 488', '+855 12 850 488', '+855 12 850 488', 'http://hotelcorduroy.com', 1, '4.0', 23, '2018-07-10', NULL, '30', NULL, 3, 13, '2019-01-15 09:04:40', '2019-01-15 09:04:40', 13, 2, 5, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(181, 'Hostel 543', 'Wat Bo road', 1, 1, '', 'Mr. Chris', 'thehostel543@gmail.com', 'thehostel543@gmail.com', 'thehostel543@gmail.com', '', '+855 68 386 903', '+855 93 215 253', 'http://hostel543.com', 2, '0.0', 4, '2015-12-03', NULL, '135', NULL, 3, 12, '2018-09-02 19:04:46', '2018-09-02 19:04:46', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(182, 'Horizons Cambodia', 'Street #23, Wat Bo Village, Siem Reap Cambodia', 1, 1, '', 'Mr. Chanthou Choun', 'info@horizonscambodia.com', 'info@horizonscambodia.com', 'info@horizonscambodia.com', '', '+855 92 730 031', '+855 86 730 031', 'http://horizonscambodia.com', 7, '3.0', 12, '2018-02-28', NULL, '70', NULL, 3, 12, '2018-09-02 19:07:04', '2018-09-02 19:07:04', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(183, 'Home Chic Hotel', 'NO. 17, ST. 282, Boeung Keng Kang I | Sangkat BKKI, Khan Chamkarmon', 1, 2, '', 'Ms. Tha Nimol', 'homechichotel@yahoo.com', 'homechichotel@yahoo.com', 'homechichotel@yahoo.com', '+855 11 846 484', '+855 11 846 484', '+855 11 846 484', 'http://homechichotel.com/index.php', 1, '3.0', 50, '2018-04-11', NULL, '100', NULL, 2, 12, '2018-10-31 11:34:49', '2018-10-31 11:34:49', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(184, 'Hillocks Hotel & Spa', 'Sala Kamreuk Villiage, Sala Kamreuk Commune', 1, 1, '1710', 'Narin Hem', 'info@hillockshotel.com', 'book@hillockshotel.com, info@hillockshotel.com, sm@hillockshotel.com', 'account@hillockshotel.com', '', '+855 63 966 699', '+855 95 345 676', 'http://hillockshotel.com', 1, '5.0', 38, '2016-09-26', NULL, '60', NULL, 3, 12, '2018-09-02 19:14:20', '2018-09-02 19:14:20', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(185, 'Hilary\'s Boutique Hotel', '#16 Bis, Street 302, Sangkat Boeng Keng Kang I,  Khan Chamkamorn', 1, 2, '', 'Mr. Sum Chhey', 'info@hilarysboutiquehotel.com ', 'info@hilarysboutiquehotel.com, hls.booking.system.pp@gmail.com', 'info@hilarysboutiquehotel.com ', '', '+855 12 884 467', '+855 23 555 2360', 'http://hilarysboutiquehotel.com', 7, '3.0', 13, '2014-12-01', NULL, '90', NULL, 3, 12, '2018-09-02 19:18:00', '2018-09-02 19:18:00', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(186, 'Hideaway Boutique Resort', 'Siem Reap', 1, 1, '', 'Mr. Rossi', 'reservation@hideawayboutiqueresort.com', 'reservation@hideawayboutiqueresort.com, rossi.is@gmail.com, jd@jaromirdvoracek.com', 'gm@hideawayboutiqueresort.com', '', '+855 12 264 700', '+855 96 369 2665', 'http://hideawayboutiqueresort.com', 6, '0.0', 30, '2017-01-19', NULL, '60', NULL, 3, 12, '2018-09-02 19:20:39', '2018-09-02 19:20:39', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(187, 'Heritage Suites Hotel', 'Near Wat Polanka, Slokram Village, Khum Slok Kram, Siem Reap', 1, 1, '93101', 'Ms. Oma Ho', 'oma@heritagesuiteshotel.com', 'info@heritagesuiteshotel.com, reservation@heritagesuiteshotel.com', 'oma@heritagesuiteshotel.com', '', '+855 63 969 100', '+855 11 969 100', 'https://www.heritagesuiteshotel.com', 7, '5.0', 26, '2016-11-19', NULL, '120', NULL, 3, 12, '2018-09-02 19:23:44', '2018-09-02 19:23:44', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(188, 'Hello Cambodia Boutique', 'Bakheng Road, Siem Reap Central Area,', 1, 1, '', 'Mr. Sin Senghong', 'gm@hellocambodiaboutique.com', 'reservation@hellocambodiaboutique.com', 'booking@hellocambodiaboutique.com', '', '+855 77 519 967', '+855 63 969 699', 'http://hellocambodiaboutique.com', 7, '4.0', 23, '2018-03-17', NULL, '80', NULL, 3, 13, '2019-05-29 09:33:29', '2019-05-29 09:33:29', 13, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(189, 'Skor Boutique', '#0517, Street 7 Makara, Wat Bo Village, Sangkat Salakamroeuk, Siem Reap', 1, 1, '', 'Mr. Majid Wazir', 'info@heavenangkorresidence.com', 'info@heavenangkorresidence.com, reservation@heavenangkorresidence.com', 'info@heavenangkorresidence.com', '', '+855 63 966 737', '+855 92 627 046', 'http://heavenangkorresidence.com', 7, '4.0', 15, '2017-02-20', NULL, '100', NULL, 2, 12, '2019-04-19 15:35:27', '2019-04-19 15:35:27', 12, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(190, 'Harmony River Hotel', '#337, Preah Sisowath Blvd, Sangkat Chey', 1, 2, '', 'Mr. Vong Senvichet', 'harmonyriverhotel@yahoo.com', 'harmonyriverhotel@yahoo.com', 'harmonyriverhotel@yahoo.com', '', '+855 89 232 678', '', 'http://harmonyriverhotel.com', 1, '2.0', 17, '2015-12-08', NULL, '100', NULL, 3, 12, '2018-09-02 19:36:54', '2018-09-02 19:36:54', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(191, 'HanumanAlaya Colonial House', 'Treang Village, Slar Kram Commune', 1, 1, '17254', 'Mr. Boren Chhay', 'boren@hanumanalaya.com', 'reservations@hanumanalaya.com', 'reservations@hanumanalaya.com', '', '+855 63 760 581', '+855 12 789 857', 'http://colonialhouse.hanumanalaya.com', 6, '4.0', 11, '2016-12-30', NULL, '70', NULL, 3, 12, '2018-09-02 19:41:02', '2018-09-02 19:41:02', 12, 2, 5, '0000-00-00', '', '', '', 4, NULL),
(192, 'Green Palace Hotel Phnom Penh', '7 No 61, St. 111 Corner 232 Boeung Pralit | Makara District', 1, 2, '', 'Mr. Kosal Sou', 'kosal.sou@greenpalacehotel.com', 'kosal.sou@greenpalacehotel.com, E-commerce@greenpalacehotel.com, Reservation@greenpalacehotel.com', 'kosal.sou@greenpalacehotel.com', '', '+855 16 570 057', '+855 16 570 057', 'http://greenpalacehotel.com', 1, '4.0', 144, '2018-02-20', NULL, '75', NULL, 3, 12, '2019-07-01 11:08:45', '2019-07-01 11:08:45', 12, 2, 5, '2019-07-01', 'Use solutions from another company ', 'Mr. Kosa', '016 570 057', 5, '1970-01-01 00:00:00'),
(193, 'Champey Sor Angkor Boutique', 'Phum Svay Dangkum, Svay Dangkum ', 1, 1, '17252', 'Mr. Seng Saymeng ', 'info@champeysorangkorboutique.com', 'info@champeysorangkorboutique.com', 'info@champeysorangkorboutique.com', '+855 96 444 1411', '+855 96 444 1411', '070770002', 'http://champeysorangkorboutique.com', 7, '3.5', 20, '2018-09-04', NULL, '110', NULL, 2, 12, '2018-10-31 11:22:20', '2018-10-31 11:22:20', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(194, 'Pearl Resort Cambodia', 'Koh Rong ', 1, 6, '', 'Mr. Ruzaini Rulloda Bin Abdullah ', 'rrarico@gmail.com', 'rrarico@gmail.com, it@pearlresortcambodia.com', 'rrarico@gmail.com', '+855 78 284 949', '+855 12 201 285', '+855 12 201 285', 'http://pearlresortcambodia.com', 1, '5.0', 30, '2018-09-03', '15', '100', NULL, 2, 12, '2018-11-02 11:36:11', '2018-11-02 11:36:11', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(195, 'Mango Rain Boutique Hotel', 'No. 108 Wat Svay Village, Near Phsar Krom Market, Siem Reap River Side ', 1, 1, '17000', 'Mr. Sophy', 'gm@mangorainboutique.com', 'info@mangorainboutique.com, reservation@mangorainboutique.com', 'info@mangorainboutique.com, reservation@mangorainboutique.com', '+855 69 755 554', '+855 69 755 554', '+855 69 755 554', 'http://mangorainboutique.com', 7, '3.0', 17, '2015-09-11', NULL, '80', NULL, 3, 13, '2018-09-09 18:26:20', '2018-09-09 18:26:20', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(196, 'Indra Porak Residence', 'Betong Street, Village Vihear Chen, Sangkat Svay Dangkom,near by Pub Street', 1, 1, '17000', 'Mr. Lim Rithy', 'sales@indraporak.com', 'reservation@indraporak.com, sales@indraporak.com', 'limrithy27@yahoo.com', '+855 93 859 007', '+855 93 859 007', '+855 63 963 373', 'http://indraporak.com', 7, '3.0', 16, '2015-09-15', NULL, '50', NULL, 3, 13, '2018-09-09 18:28:28', '2018-09-09 18:28:28', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(198, 'Popular Residence Hotel ', 'Sala Kamroeuk Village, Sala Kamroeuk Commune ', 1, 1, '17000', 'Mr. Bonn', 'gm@popularresidence.com', 'gm@popularresidence.com, rdm@popularresidence.com', 'fc@popularresidence.com', '+855 81 566 377', '+855 81 566 377', '+855 16 783 425', '+855 16 783 425', 1, '4.0', 26, '2015-09-19', NULL, '100', NULL, 2, 12, '2018-10-31 09:33:07', '2018-10-31 09:33:07', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(199, 'Ladear Angkor Boutique Hotel', 'Street 27, Wat Bo Road, Phum Wat Bo, Khum Salakamroeuk', 1, 1, '17000', 'Ran Sophea', 'gm@ladearangkorhotel.com', 'reservation@ladearangkorhotel.com', 'fc@ladearangkorhotel.com, ac@ladearangkorhotel.com', '+855 12 849 190', '+855 12 849 190', '+855 63 963 070', 'http://ladearangkorhotel.com', 7, '3.0', 12, '2015-09-21', NULL, '50', NULL, 2, 12, '2018-10-31 09:24:40', '2018-10-31 09:24:40', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(200, 'Var Sunny Angkor Suite Hotel', 'National Road 6, Chong Kaosur Village', 1, 1, '17000', 'Mr. Mom Chomroeun', 'gm@varsunnyangkorsuite.com', 'gm@varsunnyangkorsuite.com', 'gm@varsunnyangkorsuite.com', '+855 17 673 609', '+855 17 673 609', '+855 69 577 599', 'http://varsunnyangkorsuite.com', 1, '3.0', 28, '2015-09-25', NULL, '155', NULL, 3, 13, '2018-09-09 18:35:04', '2018-09-09 18:35:04', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(201, 'Villa Medamrei Boutique Hotel', 'Vihear Chin Village, Svay Dangkum Commnuce', 1, 1, '17000', 'Ms.Hok Rachana', 'info@villamedamrei.com', 'info@villamedamrei.com', 'info@villamedamrei.com', '+855 12 782 316', '+855 12 782 316', '+855 63 763 636 ', 'http://villamedamrei.com', 1, '3.0', 19, '2015-10-28', NULL, '80', NULL, 3, 13, '2018-09-09 18:36:39', '2018-09-09 18:36:39', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(202, 'Panary Angkor Boutique ', 'Behind New Apsara Supermarket 200 meters on the right hand side, # 20 Road, Wat Bo Street', 1, 1, '17000', 'Seng Parob', 'info@panaryangkorboutique.com ', 'info@panaryangkorboutique.com, sokros@hotellinksolutions.com.kh', 'info@panaryangkorboutique.com ', '+855 12 920 737', '+855 12 920 737', '+855 12 920 737', 'http://panaryangkorboutique.com', 7, '3.5', 14, '2015-11-02', NULL, '50', NULL, 3, 13, '2018-09-09 18:38:19', '2018-09-09 18:38:19', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(204, 'Hostel 543', 'Wat Bo road', 1, 1, '17000', 'Mr. Chris', 'thehostel543@gmail.com', 'thehostel543@gmail.com', 'thehostel543@gmail.com', '+855 93 215 253', '+855 93 215 253', '+855 68 386 903', 'http://hostel543.com', 2, '2.0', 4, '2015-12-03', NULL, '135', NULL, 3, 13, '2018-09-09 18:41:36', '2018-09-09 18:41:36', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(205, 'Chez Moi Residence and Spa', '#Street 22, Wat Bo, Sangkat Salar Komreuk', 1, 1, '17000', 'Ms. Vann Narin', 'residence@chezmoi.asia', 'residence@chezmoi.asia', 'residence@chezmoi.asia', '+855 12 584 897', '+855 12 584 897', '+855 12 584 897', 'http://residence.chezmoi.asia', 1, '4.0', 16, '2016-01-08', NULL, '60', NULL, 3, 13, '2018-09-09 18:43:15', '2018-09-09 18:43:15', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(207, 'Tropicana Residence & Resort', 'Angkor High School Road, Phum Wat Bo, Salakamreuk', 1, 1, '17000', 'Mr. Seang Sovann', 'rm@tropicanaresidence.com', 'reservation@tropicanaresidence.com', 'rm@tropicanaresidence.com, acc@tropicanaresidence.com', '+855 12 842 349', '+855 12 842 349', '+855 63 210 600', 'http://tropicanaresidence.com ', 1, '4.0', 16, '2016-01-11', NULL, '75', NULL, 3, 13, '2018-09-09 18:46:27', '2018-09-09 18:46:27', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(208, 'Angkor Miracle Resort & Spa', 'National Road No. 6A. Khum Sra Nge (opposite of Cambodian cultural Village) Siem Reap', 1, 1, '17000', 'Mr. Daravichhay SENG ', 'em@angkormiracle.com, ee@angkormiracle.com, reservations@angkormiracle.com', 'reservations@angkormiracle.com, ee@angkormiracle.com, em@angkormiracle.com', 'acc@angkormiracle.com', '+855 87 882 244', '+855 87 882 244', '+855 63 969 900', 'http://angkormiracle.com/resort', 1, '5.0', 247, '2015-11-30', NULL, '150', NULL, 3, 13, '2018-09-09 18:48:21', '2018-09-09 18:48:21', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(209, 'Chronicle Residence And Spa', '# Road 30, 200m way from Borei Phreumprey.', 1, 1, '17000', 'Kyry Sok', 'gm@chronicleresidenceandspa.com, operation@chronicleresidenceandspa.com, info@chronicleresidenceandspa.com', 'reservation@chronicleresidenceandspa.com, operation@chronicleresidenceandspa.com, info@chronicleresidenceandspa.com', 'account@chronicleresidenceandspa.com', '+855 12 677 939', '+855 12 677 939', '+855 63 963 693', 'http://chronicleresidenceandspa.com', 1, '3.0', 22, '2015-11-27', NULL, '100', NULL, 3, 13, '2018-09-09 18:50:14', '2018-09-09 18:50:14', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(210, 'Vilada Angkor Boutique', 'Kor Kranch Village, Sangkat Siem Reap', 1, 1, '17000', 'Mr. Seng Sakada', 'gm@viladaangkorboutique.com', 'gm@viladaangkorboutique.com', 'gm@viladaangkorboutique.com', '+855 12 565 856', '+855 12 565 856', '+855 17 688 568', 'http://viladaangkorboutique.com', 1, '4.0', 7, '2015-11-03', NULL, '70', NULL, 3, 13, '2018-09-09 18:51:37', '2018-09-09 18:51:37', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(211, 'Khmere Maison d\'Angkor', '#482, BO POX 93090, City Center, National Road No.6, Wat Kesaram Street, Sangkat Svay Dangkum,', 1, 1, '17000', 'Jacky LONG ', 'jacky@khmeremaisondangkor.com', 'relations@khmeremaisondangkor.com', 'jacky@khmeremaisondangkor.com', '+855 12 660 160', '+855 12 660 160', '+855 63 766 062', 'http://khmeremaisondangkor.com', 7, '3.0', 6, '2016-11-02', NULL, '30', NULL, 3, 13, '2018-09-09 18:53:23', '2018-09-09 18:53:23', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(212, 'Bopha Pollen Hotel', ' #202, Taphul village , Svay Dangkum Commune', 1, 1, '17000', 'Mr.Pahrida Mary', 'reservation@bophapollenhotel.com, md@bophapollenhotel.com', 'md@bophapollenhotel.com, reservation@bophapollenhotel.com', 'md@bophapollenhotel.com, reservation@bophapollenhotel.com', '+855 10 965 899', '+855 10 965 899', '+855 63 965 899', 'http://bophapollenhotel.com', 1, '4.0', 29, '2019-01-17', '24', '85', NULL, 2, 12, '2019-01-22 09:13:02', '2019-01-22 09:13:02', 12, 13, 5, '1970-01-01', '', '', '', 4, '2019-01-17 00:00:00'),
(213, 'Nagara Angkor Boutique Hotel', 'Sok San Road, Stueng Thmei Village, Svay Dangkum Commune', 1, 1, '17000', 'Mr. Sophat', 'booking@nagaraangkor-boutique.com', 'booking@nagaraangkor-boutique.com', 'account@nagaraangkor-boutique.com', '+855 70 559 536', '+855 70 559 536', '+855 63 766 082', 'http://nagaraangkor-boutique.com', 7, '3.5', 36, '2015-11-21', NULL, '150', NULL, 3, 13, '2018-09-09 18:56:45', '2018-09-09 18:56:45', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(215, 'Bunwin Plantation', 'Kakranh Village', 1, 1, '17000', 'Mr. Has Sophal', 'gm@bunwinboutique.com', 'reservation@bunwinplantation.com', 'reservation@bunwinplantation.com', '+855 17 310 229', '+855 17 310 229', '+855 17 310 229', 'http://plantation.bunwinplantation.com', 1, '3.0', 14, '2015-09-14', NULL, '55', NULL, 3, 13, '2018-09-09 19:00:09', '2018-09-09 19:00:09', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(216, 'Popular Boutique Hotel', 'Address: #033, Vihear Chin Village, Sangkat Svay Daungkum, Siem Reap City', 1, 1, '17000', 'Mrs. CHUM Thida', 'gm@popularboutiquehotel.com', 'reservation@popularboutiquehotel.com', 'reservation@popularboutiquehotel.com', '+855 17 820 187', '+855 63 963 578', '+855 17 820 187', 'http://popularboutiquehotel.com', 1, '3.0', 36, '2015-09-26', NULL, '80', NULL, 3, 13, '2018-09-09 19:17:32', '2018-09-09 19:17:32', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(220, 'The Moon Villa ', 'National Road 06,Phum Banteay Chas, Samaki Market zone', 1, 1, '17000', 'Mr.Has Sophal', 'reservation@themoonvilla.com', 'reservation@themoonvilla.com', 'reservation@themoonvilla.com', '+855 12 629 969', '+855 12 629 969', '+855 12 629 969', 'http://themoonvilla.com', 3, '3.0', 19, '2015-08-29', NULL, '55', NULL, 3, 13, '2018-09-09 19:24:16', '2018-09-09 19:24:16', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(221, 'New Riverside Hotel', 'Chunlung Village, Sala Komrak Commune ', 1, 1, '17000', 'Mr.Xing', 'reservation@newriversidehotel.com, booking@newriversidehotel.com', 'reservation@newriversidehotel.com, booking@newriversidehotel.com', 'reservation@newriversidehotel.com, booking@newriversidehotel.com', '+855 12 550 055', '+855 12 550 055', '+855 63 765 533', 'http://newriversidehotel.com', 1, '3.0', 40, '2015-08-10', NULL, '100', NULL, 3, 13, '2018-09-09 19:26:02', '2018-09-09 19:26:02', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(222, 'Lynnaya Urban River Resort & Spa', 'Street 20 Krong', 1, 1, '17000', 'Mr.Kan Chansathya', 'gm@lynnaya.com', 'reservation@lynnaya.com', 'reservation@lynnaya.com ', '+855 63 967 755', '+855 63 967 755', '+855 63 967 755', 'http://lynnaya-hotel-angkor.com', 1, '4.0', 46, '2018-08-27', NULL, '130', NULL, 3, 13, '2018-09-09 19:27:39', '2018-09-09 19:27:39', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(224, 'Mane Boutique Hotel & Spa', 'Village Salakomroeuk, Sangkat Salakomroeuk', 1, 1, '17000', 'Mr. Rath', 'ecom@maneboutiquehotel.com', 'reservations@maneboutiquehotel.com, ecom@maneboutiquehotel.com', 'gm@maneboutiquehotel.com, md@maneboutiquehotel.com, phann.vanrath@gmail.com', '+855 97 552 2222', '+855 97 552 2222', '+855 63 768 899', 'http://maneboutiquehotel.com', 7, '5.0', 18, '2015-08-16', NULL, '120', NULL, 3, 13, '2018-09-09 19:31:05', '2018-09-09 19:31:05', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(225, 'The Clay D\' Angkor', 'Sala Kanseng Village, Svay Dangkum Commune', 1, 1, '17000', 'Mr.Kham Serey Chantha', 'info@theclaydangkor.com', 'info@theclaydangkor.com', 'info@theclaydangkor.com', '+855 12 388 797', '+855 12 388 797', '+855 63 965 596', 'http://theclaydangkor.com', 7, '4.0', 6, '2015-09-14', NULL, '50', NULL, 3, 13, '2018-09-09 19:32:43', '2018-09-09 19:32:43', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(228, 'The Palm Boutique Hotel & Residence', 'No. 270,Street 63, Sangkat Tonle Bassac (Boung Keng Kong II), Khan Chamkarmorn', 1, 2, '13000', 'Mr. Bo Channa', 'gm@thepalmboutique.com', 'info@thepalmboutique.com', 'info@thepalmboutique.com', '+855 11 855 901', '+855 11 855 901', '+855 23 226 999', 'http://thepalmboutique.com', 1, '4.0', 35, '2015-08-25', NULL, '90', NULL, 3, 13, '2018-09-09 19:38:27', '2018-09-09 19:38:27', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(229, 'Le Grand Mekong Hotel ', '253-255, Sisowath Quay, Psar Kandal I District, DaunPenh Commune', 1, 2, '17000', 'Mr. Hong', 'gm@legrandmekong.com', 'gm@legrandmekong.com, info@legrandmekong.com', 'accounts@legrandmekong.com, gm@legrandmekong.com', '+855 78 591 768', '+855 78 591 768', '+855 23 220 336', 'http://legrandmekong.com', 1, '3.5', 44, '2015-07-09', NULL, '140', NULL, 2, 12, '2018-10-31 09:46:31', '2018-10-31 09:46:31', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(232, 'Harmony River Hotel', '#337, Preah Sisowath Blvd, Sangkat Chey', 1, 2, '13000', 'Mr. Vong Senvichet', 'harmonyriverhotel@yahoo.com', 'harmonyriverhotel@yahoo.com', 'harmonyriverhotel@yahoo.com', '+855 89 232 678', '+855 89 232 678', '+855 89 232 678', 'http://harmonyriverhotel.com', 1, '2.0', 17, '2015-12-02', NULL, '100', NULL, 3, 13, '2018-09-09 19:45:14', '2018-09-09 19:45:14', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(233, 'Waterview Guesthouse', 'No. 151 Eo, River front Street', 1, 2, '13000', 'Mr. Chea Saichhour', 'waterview.gh@gmail.com', 'waterview.gh@gmail.com', 'waterview.gh@gmail.com', '+855 12 717 378', '+855 12 717 378', '+855 23 215 375', 'http://waterviewguesthouse.com', 9, '2.0', 16, '2015-06-02', NULL, '100', NULL, 3, 13, '2018-09-09 19:47:37', '2018-09-09 19:47:37', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(234, 'The 1959 Boutique Villa', '#24-25, Soramrit Blvd', 1, 2, '13000', 'Sambath Morodok', 'gm@the1959.com', 'gm@the1959.com, info@the1959.com', 'gm@the1959.com', '+855 16 511 522', '+855 16 511 522', '+855 11 887 789', 'http://the1959.com', 7, '3.5', 6, '2016-03-24', NULL, '40', NULL, 3, 13, '2018-11-08 08:24:27', '2018-11-08 08:24:27', 13, 2, 4, '2018-11-05', 'Auto Deactivate', 'Sambath Morodok', '+855 11 887 789\r\n+855 16 511 522', 4, NULL),
(235, 'Sokea Suites Extends Stay', 'No. 168, Monireth Boulevard, Sangkat Tomnob Tek, Khan Chamkar Mon', 1, 2, '13000', 'Mr. Khemanora', 'enquiry@sokeainternational.com.kh', 'enquiry@sokeainternational.com.kh', 'kh.keiman@yahoo.fr', '+855 12 517 590', '+855 12 517 590', '+855 23 886 778', 'http://sokeasuites.com', 1, '3.0', 30, '2015-07-20', NULL, '50', NULL, 3, 13, '2018-09-09 19:52:19', '2018-09-09 19:52:19', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(237, 'The Blue Corner Boutique Hotel', 'No.37,Corner St. 63 and St.180, Sangkat Beung Rang,Khan Daun Penh, Phnom Penh', 1, 2, '13000', 'Ms.Sak Sothavy ', 'reservation@thebluecorner.asia', 'reservation@thebluecorner.asia, thavy@thebluecorner.asia', 'narong@thebluecorner.asia', '+855 12 927 092', '+855 12 927 092', '+855 23 979 888', 'http://thebluecorner.asia', 7, '4.0', 23, '2016-03-28', NULL, '70', NULL, 2, 12, '2018-10-31 09:55:06', '2018-10-31 09:55:06', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(239, 'Royal Mekong Boutique Hotel', '#17, Street 208, Sankat Beoung Reang, Khan Daun Penh', 1, 2, '13000', 'Mrs. Sokha Pech', 'info@royalmekongboutiquehotel.com', 'info@royalmekongboutiquehotel.com, royalmekong1@gmail.com, hls.booking.system.pp@gmail.com', 'info@royalmekongboutiquehotel.com, royalmekong1@gmail.com', '+855 92 835 003', '+855 92 835 003', '+855 23 988 599', 'http://royalmekongboutiquehotel.com', 1, '3.0', 24, '2014-07-24', NULL, '150', NULL, 3, 13, '2018-09-09 20:15:59', '2018-09-09 20:15:59', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(240, 'Teav Boutique Hotel', '# 14, Street 310, Boeung Keng Kang I, Khan Chamkar Mon', 1, 2, '13000', 'Ms. Kim', 'sm@teavgroup.com', 'sm@teavgroup.com, stay@teavgroup.com', 'manage@teavgroup.com, finance@teavgroup.com', '+855 77 679 999', '+855 77 679 999', '+855 23 981 818', 'http://bkk1.teavboutiquehotel.com', 7, '4.0', 12, '2014-11-01', NULL, '85', NULL, 3, 13, '2018-09-22 10:52:27', '2018-09-22 10:52:27', 13, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(241, 'You Eng Hotel', 'Russian Federation Blvd, S/K Chorm Chao, Khan Po  Senchey', 1, 2, '13000', 'Mr. Kimly Hong', 'youenghotel@yahoo.com', 'youenghotel@yahoo.com', 'youenghotel@yahoo.com, hongkimly09@gmail.com', '+855 68 888 815', '+855 78 525 268', '+855 78 525 268', 'https://youenghotel.com', 1, '4.0', 168, '2014-11-20', NULL, '176', NULL, 2, 12, '2018-10-31 09:55:57', '2018-10-31 09:55:57', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(242, 'Omana Boutique Hotel', 'Street 9, Phnom Penh 4139', 1, 2, '13000', 'Mr. TOEM PUNLORK', 'hello@hotel-omana.com', 'hello@hotel-omana.com', 'hello@hotel-omana.com', '+855 70 904 482', '+855 70 904 482', '+855 12 430 833', 'http://hotel-omana.com', 1, '4.0', 13, '2018-06-15', NULL, '130', NULL, 3, 13, '2019-02-05 08:56:35', '2019-02-05 08:56:35', 13, 2, 4, '2019-02-04', 'They have to renovate the whole building as our electricity and water supply issue', 'Omana Hotel Owner', 'Phone:   +855 12 430 833/ 23 676 3001\r\nEmail:      hello@hotel-omana.com', 4, '1970-01-01 00:00:00'),
(244, 'The Little Garden Villa', '#8A, Street 398, Boeung Keng Kong I', 1, 2, '13000', 'Mr. Peou Sari', 'info@littlegarden.asia ', 'info@littlegarden.asia, hls.booking.system.pp@gmail.com', 'info@littlegarden.asia ', '+855 23 217 871', '+855 23 217 871', '+855 23 217 871', 'http://thelittlegarden.asia', 3, '3.0', 10, '2014-12-01', NULL, '121.5', NULL, 3, 13, '2018-09-09 20:27:24', '2018-09-09 20:27:24', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(245, 'La Rose Boutique Hotel and Spa', '#164B, Norodom Blvd', 1, 2, '13000', 'Mr. Vothyrith Om', 'relax@larose.com.kh', 'relax@larose.com.kh, hls.booking.system.pp@gmail.com', 'accountant@larose.com.kh', '+855 23 211 130', '+855 23 211 130', '+855 23 211 130', 'http://larose.com.kh/home.php', 7, '4.0', 10, '2014-11-03', NULL, '40', NULL, 2, 12, '2018-10-31 09:58:06', '2018-10-31 09:58:06', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(246, 'Samnang Laor Hotel', 'No 130, Street 304 & Conner 163, Sangkat Olympic, Khan Chamkamon, Phnom Penh Cambodia. ', 1, 2, '13000', 'Ms. Chea Dimong', 'gm@samnanglaorhotel.com', 'reservation@samnanglaorhotel.com, gm@samnanglaorhotel.com', 'account@samnanglaorhotel.com', '+855 87 838 326', '+855 87 838 326', '+855 61 838 326', 'http://samnanglaorhotel.com', 1, '3.5', 81, '2018-05-08', NULL, '80', NULL, 3, 13, '2019-05-29 09:36:27', '2019-05-29 09:36:27', 13, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(247, 'Indochine 2 Hotel', 'No. 28-30, Street 130, Phsar Kandal I, Daun Penh, Phnom Penh, Cambodia.', 1, 1, '13000', 'Ms. Sivly Lim', 'lim.sivly@indochine2hotel.com', 'reservation@indochine2hotel.com, hls.booking.system.pp@gmail.com', 'lim.sivly@indochine2hotel.com', '+855 23 211 787', '+855 23 211 787', '+855 23 211 525', 'http://indochine2hotel.com', 1, '2.0', 30, '2014-12-01', NULL, '85', NULL, 3, 13, '2018-09-09 20:44:26', '2018-09-09 20:44:26', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(249, 'Starry Angkor Hotel', 'No. G4, National Road 6, Banteay Chas Village, Sangkat Slorkram', 1, 1, '17000', 'Ms. Seng Sinn', 'asst.sales@starryangkorhotel.com', 'asst.sales@starryangkorhotel.com', 'asst.sales@starryangkorhotel.com', '+855 63 968 123', '+855 63 968 123', '+855 63 968 124', 'http://starryangkorhotel.com', 1, '4.0', 127, '2016-02-16', NULL, '35', NULL, 3, 13, '2018-09-22 09:16:56', '2018-09-22 09:16:56', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(250, 'Steung Siemreap Thmey Hotel', 'Street 9, Khum Svaydangkum, Old Market Area', 1, 1, '17000', 'Mr. Veasoth', 'sales@steungsiemreapthmeyhotel.com', 'resv@steungsiemreapthmeyhotel.com', 'account@steungsiemreapthmeyhotel.com', '+855 63 965 167', '+855 12 249 249', '+855 63 965 167', 'http://steungsiemreapthmeyhotel.com', 1, '4.0', 76, '2015-10-20', NULL, '185', NULL, 3, 12, '2018-10-31 10:03:46', '2018-10-31 10:03:46', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(251, 'Suon Angkor Boutique', '#211 Phum Watbo ,Sala Kamreuork, Siem Reap', 1, 1, '', 'Mr. KEO PHAL', 'Phalkeo783@gmail.com', 'Phalkeo783@gmail.com', 'Phalkeo783@gmail.com', '+855 10 277 389', '+855 10 277 389', '', 'http://suonangkorboutique.com', 4, '4.0', 27, '2019-03-18', NULL, '60', NULL, 2, 12, '2019-03-21 08:33:08', '2019-03-21 08:33:08', 12, 13, 5, '1970-01-01', '', '', '', 4, '2019-03-20 00:00:00'),
(252, 'Ta Tai Hotel Resort & Marina', 'Dong village, Ta tai commune, Unlongback District', 1, 7, '13000', 'Mr. Piseth Dath', 'piseth.dath@tatairesort.com, info@tatairesort.com', 'piseth.dath@tatairesort.com, info@tatairesort.com', 'piseth.dath@tatairesort.com, info@tatairesort.com', '+855 92 885 115', '+855 92 885 115', '+855 15 885 115', 'http://tatai-hotel.com', 1, '4.0', 53, '2017-04-19', NULL, '180', NULL, 3, 13, '2018-10-31 13:53:13', '2018-10-31 13:53:13', 13, 2, 4, '1970-01-01', '', '', '', 4, NULL);
INSERT INTO `eot_customer` (`id`, `name`, `address`, `country`, `city`, `postal_code`, `contact_person`, `general_email`, `reservation_email`, `invoice_email`, `mobile_number_invoice`, `main_phone_1`, `main_phone_2`, `website_url`, `accommodation_type`, `star_rating`, `number_of_rooms`, `sale_date`, `service_agreement`, `fee`, `status`, `accomodation_stats`, `created_by`, `created_at`, `updated_at`, `updated_by`, `passed_by`, `handle_by`, `deactivated_at`, `deactivated_reason`, `deactivated_requested_by`, `deactivated_requested_contact_detail`, `deactivated_by`, `lived_date`) VALUES
(253, 'Taingleap Angkor Villa', 'Centrally located area. Taphul Street,Siem Reap City', 1, 1, '17000', 'Mr Thim Sin', 'info@taingleapangkorvilla.com', 'reservation@taingleapangkorvilla.com, info@taingleapangkorvilla.com', 'info@taingleapangkorvilla.com', '+855 78 731 861', '+855 78 731 861', '+855 63 965 589', 'http://taingleapangkorvilla.com', 1, '3.0', 24, '2014-03-14', NULL, '100', NULL, 3, 13, '2018-09-22 09:40:24', '2018-09-22 09:40:24', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(254, 'Tanei Boutique Villa', '#017, Steung Thmey Village, Svay Dangkom', 1, 1, '17000', 'Mr. Lao Sokun', 'lao_sukun007@yahoo.com', 'lao_sukun007@yahoo.com, info@taneiboutiquevilla.com', 'lao_sukun007@yahoo.com', '+855 12 757 867', '+855 12 757 867', '+855 97 746 8787', 'http://taneiboutiquevilla.com', 1, '3.0', 28, '2015-03-25', NULL, '65', NULL, 3, 13, '2018-09-22 09:52:42', '2018-09-22 09:52:42', 13, 2, 4, '0000-00-00', '', '', '', 4, NULL),
(255, 'Tareach Angkor Villa', 'Group 14, #781, Vihear Chin Village,  Svaydongkum Commune', 1, 1, '17000', 'Sony Lam', 'sony@tareachangkorvilla.com', 'sony@tareachangkorvilla.com', 'sony@tareachangkorvilla.com', '+855 12 771 726', '+855 12 771 726', '+855 12 771 726', 'http://tareachangkorvilla.com', 3, '1.0', 14, '2015-02-05', NULL, '45', NULL, 3, 13, '2019-05-29 09:35:21', '2019-05-29 09:35:21', 13, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(256, 'Teav Bassac Boutique Hotel', '#30, Street 09, Tonel Bassac, Khan Chamkamon', 1, 2, '13000', 'Ms. Kim Lang', 'sm@teavgroup.com', 'sm@teavgroup.com, sales@teavgroup.com, staybassac@teavgroup.com, manager@teavgroup.com', 'manager@teavgroup.com, finance@teavgroup.com', '+855 23 982 828', '+855 23 982 828', '+855 23 982 828', 'http://teavbassachotel.com', 7, '4.0', 25, '2016-10-26', NULL, '100', NULL, 3, 12, '2018-10-31 10:25:15', '2018-10-31 10:25:15', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(257, 'Tep Sodachan Villa Boutique', '# 456, Group 7, Khnar Village  Chreave Commune', 1, 1, '17000', 'Ly  Kim Hua', 'angkorkimhua@yahoo.com', 'angkorkimhua@yahoo.com', 'angkorkimhua@yahoo.com', '+855 77 466 082', '+855 77 466 082', '', 'http://tepsodachan.com', 1, '3.0', 28, '2015-02-19', NULL, '70', NULL, 3, 12, '2018-10-31 10:26:14', '2018-10-31 10:26:14', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(259, 'TravellerHome Angkor', 'Steng Thmei, Svaydongkum', 1, 1, '17252', 'Mr. Van narin', 'gm@travellerhomeangkor.com', 'info@travellerhomeangkor.com', 'gm@travellerhomeangkor.com', '', '+855 11 684 262', '+855 11 684 262', 'http://travellerhomeangkor.com', 1, '4.0', 34, '2016-09-23', NULL, '', NULL, 3, 12, '2019-05-31 08:48:30', '2019-05-31 08:48:30', 12, 2, 5, '2019-05-31', 'They want to save budget for low season', 'Mr. Sopheann', '098 93 2 662 ', 5, '1970-01-01 00:00:00'),
(260, 'Le Mont Hotel', 'No. 196 St. 143 corner 304, Sangkat Boeng Keng Kang 2, Chamkarmon', 1, 2, '', 'Ms. Jennifer', 'gm@lemonthotel.com', 'reservation@lemonthotel.com, gm@lemonthotel.com, duyen@whl.travel', 'gm@lemonthotel.com', '', '+855 16 834 207', '+855 16 834 207', 'http://lemonthotel.com', 1, '4.0', 98, '2017-12-21', NULL, '', NULL, 2, 12, '2018-11-01 14:01:45', '2018-11-01 14:01:45', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(261, 'Our Joint Hotel & Guesthouse', ' #142, Psar Krom Street', 1, 1, '', 'Front Office', 'booking@ourjointhotel.com', 'booking@ourjointhotel.com', 'booking@ourjointhotel.com', '', '+855 96 557 4054', '+855 63 964 868', 'http://ourjointhotel.com', 1, '3.0', 26, '2017-11-14', NULL, '', NULL, 2, 12, '2018-11-01 14:03:19', '2018-11-01 14:03:19', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(262, 'Reaksmey Chanreas Hotel ', '#330 Sivutha Blvd', 1, 1, '', 'Mr. Oem Komsorth', 'info@reaksmeychanreashotel.com', 'reservation@reaksmeychanreashotel.com', 'info@reaksmeychanreashotel.com', '', '+855 12 849 967', '+855 63 963 557', 'http://reaksmeychanreashotel.com', 1, '3.0', 44, '2015-10-23', NULL, '', NULL, 2, 12, '2018-11-01 14:05:26', '2018-11-01 14:05:26', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(263, 'Le Chanthou Boutique', 'Bakheng Road, Svay Dangkum, Siem Reap', 1, 1, '17254', 'Mr.  Sous Phearith', 'info@lechanthou.com', 'info@lechanthou.com', 'info@lechanthou.com', '', '+855 63 766 417', '+855 69 518 088', 'http://lechanthouboutique.com', 7, '4.0', 15, '2016-11-28', NULL, '', NULL, 2, 12, '2018-11-01 14:06:20', '2018-11-01 14:06:20', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(264, 'Oops Hostel', 'No. B01 Sivutha Blvd, Modul I Village, Siem Reap, Cambodia.', 1, 1, '17252', 'Mr. Sem Sen Visit Veasna', 'info@oopshostel.com, reservation@oopshostel.com, fb@oopshostel.com', 'info@oopshostel.com, reservation@oopshostel.com, fb@oopshostel.com', 'info@oopshostel.com, reservation@oopshostel.com, fb@oopshostel.com', '', '+855 63 640 3809', '+855 99 926 999', 'http://oopshostel.com', 2, '2.0', 70, '2017-09-05', NULL, '', NULL, 2, 12, '2018-11-01 14:08:03', '2018-11-01 14:08:03', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(265, 'The Villa by Metta', 'Salakamreuk, Siem Reap', 1, 1, '17253', 'Mr. Rady Chum', 'info@mettavilla.com', 'info@mettavilla.com', 'info@mettavilla.com', '', '+855 92 508 545', '+855 81 333 328', 'http://mettavilla.com/html', 3, '5.0', 4, '2017-10-26', NULL, '', NULL, 2, 12, '2019-07-11 08:39:11', '2019-07-11 08:39:11', 12, 19, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(266, 'Shadow Angkor Villa', 'Wat Bo Street , Opposite Wat Preah Prom Rath Pagoda', 1, 1, '1710', 'So Visal', 'info@shadowangkorvilla.com', 'reservation@shadowangkorvilla.com', 'info@shadowangkorvilla.com', '', '+855 63 760 363', '+855 17 243 2280', 'https://shadowangkorvilla.com', 3, '3.0', 20, '2017-01-10', '27', '', NULL, 2, 12, '2019-04-18 11:41:39', '2019-04-18 11:41:39', 12, 2, 5, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(267, 'Orussey One Hotel & Apartment', 'No 14, St 111, Corner 198, Sangkat Boeung Prolit, Khan 7Makara', 1, 2, '', 'Mr. Kong Sophea', 'booking@orussey1.com, gm@orussey1.com', 'booking@orussey1.com, gm@orussey1.com, bunchea@orussey1.com', 'gm@orussey1.com, bunchea@orussey1.com, booking@orussey1.com', '', '+855 70 200 519', '+855 89 616 908', 'http://orussey1.com', 1, '4.0', 63, '2018-01-17', NULL, '', NULL, 2, 12, '2018-11-01 14:10:54', '2018-11-01 14:10:54', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(268, 'The Third Fold Hotel ', 'Krom 6, Phoum Sala Kanseng, Sangkat Svay Dangkum, Siem Reap, Cambodia', 1, 1, '', 'Mr. Song Vichay', 'vichaysong@gmail.com', 'vichaysong@gmail.com', 'vichaysong@gmail.com', '+855 12 278 273', '+855 12 278 273', '+855 12 278 273', 'http://thethirdfold.com', 1, '3.5', 24, '2018-10-22', NULL, '', NULL, 2, 12, '2018-10-31 09:09:57', '2018-10-31 09:09:57', 12, 14, 5, '1970-01-01', '', '', '', 4, NULL),
(269, 'SNOOZE Capsule', 'No. 025, Sivutha Blvd, Mondul I Village, Svaydangkum Cummune (In front of Vattanac Bank)', 1, 1, '', 'Suprabha', 'info@snoozepodhostel.com ', 'info@snoozepodhostel.com, dgranger@independentpropertyservices.com, nara@ips-cambodia.com', 'info@snoozepodhostel.com ', '', '+855 78 937 329', '+855 63 969 929', 'http://oasiscapsules.com', 2, '2.0', 14, '2016-06-15', NULL, '', NULL, 2, 12, '2018-11-20 11:10:14', '2018-11-20 11:10:14', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(270, 'Damnak Villa Boutique', 'Old Market Area, Wat Damnak Village, Salakomreuk Commune', 1, 1, '', 'Mr. Sok Piseth', 'info@moonflowersiemreap.com', 'info@moonflowersiemreap.com', 'info@moonflowersiemreap.com', '', '+855 92 686 961', '+855 77 979 711', 'https://damnakvillaboutique.com', 1, '3.0', 8, '2018-07-09', NULL, '', NULL, 2, 12, '2018-11-01 14:16:23', '2018-11-01 14:16:23', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(271, 'Udaya Residence', '#125, Sala Komroeuk Village, Sala Komroeuk Commune,', 1, 1, '', 'Mr. Son kompheak', 'ecom@udayaresidence.com', 'ecom@udayaresidence.com, info@udayaresidence.com', 'reservation@udayaresidence.com, fn@udayaresidence.com', '', '+855 78 764 111', '+855 63 764 111', 'http://udayaresidence.com', 7, '4.0', 22, '2016-09-13', NULL, '', NULL, 2, 12, '2018-11-01 14:18:32', '2018-11-01 14:18:32', 12, 2, 5, '1970-01-01', '', '', '', 4, NULL),
(274, 'Boreirum Terkchou', 'Teuk Chhou Road, Krong Kampot, Kampot Province, Cambodia', 1, 7, '', 'Mrs. Sreynet Muong ', 'boreirumthmordaresortkampot168@gmail.com', 'boreirumthmordaresortkampot168@gmail.com', 'boreirumthmordaresortkampot168@gmail.com', '+855 15 360 540', '+855 15 360 540', '086750280', 'http://boreirum.com', 1, '3.5', 23, '2018-10-15', '19', '120', NULL, 2, 12, '2019-07-11 08:39:35', '2019-07-11 08:39:35', 12, 19, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(275, 'Sovan Mealea Hotel', 'Loktaneuy St, Watbo Village, Salakamreuk', 1, 1, '17252', 'Mr. Boyd', 'sales@sovanmealeahotel.com', 'sales@sovanmealeahotel.com', 'sales@sovanmealeahotel.com', '+855 15 596 468', '+855 15 596 468', '+855 63 967 768', 'http://sovanmealeahotel.com', 1, '4.0', 42, '2015-12-12', NULL, '135', NULL, 2, 12, '2018-11-01 14:20:45', '2018-11-01 14:20:45', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(277, 'Makk Hotel', 'Sovansakor District, Kampot City, Kampot', 1, 7, '', 'Mr. Jimmy', 'info@makkhotel.com', 'info@makkhotel.com', 'info@makkhotel.com', '+855 69 370 000', '+855 86 375 375', '', 'http://makkhotel.com', 1, '3.0', 6, '2016-03-16', NULL, '100', NULL, 2, 12, '2018-11-01 14:28:15', '2018-11-01 14:28:15', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(278, 'Try Palace Resort', 'Phum Thmey, Sangkat Prey Thom', 1, 8, '', 'Try Palace Resort & Spa', 'it@trypalaceresort.com', 'info@trypalaceresort.com', 'it@trypalaceresort.com', '+855 17 325 352', '+855 36 210 317', '', 'http://trypalaceresort.com', 6, '5.0', 12, '2016-05-16', NULL, '100', NULL, 2, 12, '2018-11-01 14:30:20', '2018-11-01 14:30:20', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(279, 'Long Beach Resort Koh Rong', 'Sok San Village, Koh Rong (Island), Krong Phres SihanoukVille', 1, 6, '', 'Mr. Rin Sophearith', 'info@longbeachresortkohrong.com', 'reservations@longbeachresortkohrong.com  ', 'info@longbeachresortkohrong.com', '+855 78 810 009', '+855 78 810 009', '', 'http://longbeachresortkohrong.com', 6, '5.0', 6, '2018-08-07', NULL, '80', NULL, 2, 12, '2018-11-01 14:33:38', '2018-11-01 14:33:38', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(280, 'The Pipes Resort', 'Koh Rong Sanleom', 1, 6, '', 'Mr.Sivantha', 'md@thepipesresort.com', 'md@thepipesresort.com, booking@thepipesresort.com, gm@thepipesresort.com', 'booking@thepipesresort.com', '+855 12 896 111', '+855 12 896 111', '', 'http://thepipesresort.com', 6, '4.0', 12, '2016-12-16', NULL, '90', NULL, 2, 12, '2018-11-01 14:34:33', '2018-11-01 14:34:33', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(281, 'vKirirom Pine Resort', 'Preah Soramarith-Kosamak National Park', 1, 2, 'Kam Pong Speu', 'CHEN Samphea (Mr.)', 'info@vkirirom.com', 'reservation@asiato.asia, info@vkirirom.com', 'sreymom@asiato.asia, vanny@asiato.asia', '+855 78 777 284', '+855 78 777 284', '', 'http://vkirirom.com', 1, '4.0', 29, '2015-01-23', NULL, '70', NULL, 2, 12, '2018-11-01 14:36:03', '2018-11-01 14:36:03', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(282, 'Lux Riverside Hotel & Apartment', 'No.2,4,6, Street 136, Sangkat Phsar kandal Khan Daun Penh', 1, 2, '', 'Ms. Nhek Srey Mom', ' sales@luxriversidehotels.com', 'reservations@luxriversidehotels.com', 'doungrathananhek@yahoo.com, reservations@luxriversidehotels.com', '+855 88 888 0968', '+855 88 888 0968', '+855 23 722 828', 'http://luxriversidehotels.com', 1, '4.0', 102, '2015-03-20', NULL, '84', NULL, 2, 12, '2018-11-01 14:42:17', '2018-11-01 14:42:17', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(283, 'Manor House Boutique Hotel', '#21, St. 262, Daun Penh ', 1, 2, '', 'Mr. Kara', 'info@manorhousecambodia.com', 'info@manorhousecambodia.com', 'info@manorhousecambodia.com', '+855 17 802 922', '+855 17 802 922', '+855 92 230 130', 'http://manorhousecambodia.com', 1, '3.5', 13, '2018-03-28', NULL, '124', NULL, 2, 12, '2019-01-28 10:49:09', '2019-01-28 10:49:09', 12, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(284, 'Le Cocon Boutique Hotel', '#29, Street. 334, BKK I, Chamkamon, Phnom Penh', 1, 2, '', 'Mr. Lak sokchan', 'sales@lecoconboutiquehotel.com', 'info@lecoconboutiquehotel.com', 'sales@lecoconboutiquehotel.com', ' +855 17 565 959', ' +855 17 565 959', '+855 23 986 668', 'http://lecoconboutiquehotel.com', 1, '4.0', 21, '2017-08-03', NULL, '100', NULL, 2, 12, '2018-11-01 14:46:55', '2018-11-01 14:46:55', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(285, 'Sokkhak Boutique Resort', 'Kok Chork Village, Trorpeang Ses Commune, Wat Thmey', 1, 1, '', 'Mr. Sok Chesda', 'contact@sokkhak-boutiqueresort.com, om@sokkhak-boutiqueresort.com', 'contact@sokkhak-boutiqueresort.com, fm@chanreytreecoltd.com, om@sokkhak-boutiqueresort.com', 'contact@sokkhak-boutiqueresort.com', '+855 12 315 178', '+855 77 765 697', '', 'http://sokkhak-boutiqueresort.com', 1, '5.0', 12, '2014-12-25', NULL, '50', NULL, 2, 12, '2018-11-01 14:47:42', '2018-11-01 14:47:42', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(286, 'Shadow Angkor Residence', 'No 353, Pokambor AVE, on the river side, near Old Market', 1, 1, '', 'Mr. Nareth', 'info@shadowangkorresidence.com', 'info@shadowangkorresidence.com', 'info@shadowangkorresidence.com', '+855 92 334 384', '+855 92 334 384', '', 'http://shadowangkorresidence.com', 1, '4.0', 9, '2016-04-07', NULL, '50', NULL, 3, 13, '2018-11-07 08:36:51', '2018-11-07 08:36:51', 13, 2, 4, '2018-11-02', 'Owner wants Stop using our solutions', 'Nareth', '063 964 774 \r\n066 456 355', 4, NULL),
(287, 'The Golden Gecko Villa', '20th Street off Wat Bo Road', 1, 1, '', 'Keith Berry', 'info@thegoldengeckovilla.com', 'info@thegoldengeckovilla.com', 'info@thegoldengeckovilla.com', '+855 69 641 082', '+855 69 641 082', '', 'https://thegoldengeckovilla.com', 3, '3.0', 13, '2016-06-06', NULL, '195', NULL, 2, 12, '2018-11-01 14:32:36', '2018-11-01 14:32:36', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(288, 'La Rose Blanche Boutique', 'Wat Bo Road, Banteay Chas, Slorkram Commune', 1, 1, '', 'Mr. Ran Samrah', 'reservation@laroseblancheboutique.com', 'reservation@laroseblancheboutique.com', 'reservation@laroseblancheboutique.com', '+855 12 819 449', '+855 93 800 499', '', 'http://laroseblancheboutique.com', 1, '4.0', 12, '2016-06-24', NULL, '70', NULL, 2, 12, '2018-11-01 14:50:29', '2018-11-01 14:50:29', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(289, 'Metta Residence & Spa', 'Phum Salakamreuk, Sangkat Salakamreuk', 1, 1, '', 'Mr. Lay Sok Meng', 'info@mettaresidence.com', 'info@mettaresidence.com', 'fc@mettaresidence.com', '+855 69 228 228', '+855 63 766 388', '+855 69 228 228', 'http://mettaresidence.com', 1, '5.0', 34, '2016-12-13', NULL, '80', NULL, 2, 12, '2018-11-01 14:50:59', '2018-11-01 14:50:59', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(290, 'Monthara Angkor Residence', '# 208, Taphoul Road, Taphoul Village', 1, 1, '', 'Mr. Bunpheng', 'info@montharaangkor.com', 'info@montharaangkor.com', 'info@montharaangkor.com', '+855 15 877 766', '+855 15 877 766', '', 'http://montharaangkor.com', 1, '4.0', 11, '2017-01-17', NULL, '50', NULL, 3, 13, '2019-01-15 09:22:26', '2019-01-15 09:22:26', 13, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(291, 'The Seda Villa', 'Vat Damnak Village, Sala Kamroeuk Commune', 1, 1, '', 'Mr. Sam Sopheap', 'info@sedavilla.com', 'info@sedavilla.com, reservation@sedavilla.com', 'info@sedavilla.com', '+855 89 816 888', '+855 89 816 888', '', 'http://sedavilla.com', 3, '3.0', 11, '2017-05-09', NULL, '45', NULL, 3, 13, '2018-11-27 11:09:03', '2018-11-27 11:09:03', 13, 2, 4, '2018-11-27', 'They Sell Property', 'Mr. Sam Sopheap', '+855 89 816 888', 4, NULL),
(292, 'Rithy Rine Angkor Residence', 'City Center, Sok San Road, Old French Quarter, Siem Reap', 1, 1, '', 'Mr. Seab Sonan', 'info@rithyrineangkorresidence.com', 'res@rithyrineangkorresidence.com', 'acc@rithyrineangkorresidence.com', '+855 12 302 655', '+855 12 302 655', '+855 93 577 756', 'http://rithyrineangkorresidence.com', 1, '3.0', 28, '2017-09-05', NULL, '45', NULL, 2, 12, '2018-11-01 14:55:56', '2018-11-01 14:55:56', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(293, 'Vihara Residence', 'Aleah Road, Phum Wat Bo, Khum Salakamroeuk', 1, 1, '', 'Mr. Samoeun', 'gm@vihararesidence.com', 'reservation@vihararesidence.com', 'gm@vihararesidence.com', '+855 98 777 771', '+855 98 777 771', '', 'http://vihararesidence.com', 1, '4.0', 15, '2017-10-19', NULL, '50', NULL, 2, 12, '2018-11-01 14:57:17', '2018-11-01 14:57:17', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(294, 'The Night Hotel', 'Sok San Road, Stueng Thmei Village, Svay Dangkum Commune', 1, 1, '', 'Mr. Long Vansak', 'thenightboutique@gmail.com', 'thenightboutique@gmail.com', 'thenightboutique@gmail.com', '+855 10 556 191', '+855 63 762 762', '+855 10 556 191', 'http://thenight-hotel.com', 1, '4.0', 25, '2017-11-10', NULL, '70', NULL, 2, 12, '2018-11-01 14:57:51', '2018-11-01 14:57:51', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(295, 'SiZen Retreat & Spa', 'Wat Bo road, Slorkarm Commune', 1, 1, '', 'Ms. Vann Narin', 'info@sizen-retreat.com', '', '', '', '', '', '', 1, '3.5', 20, '2017-11-10', NULL, '60', NULL, 3, 12, '2019-06-14 09:09:51', '2019-06-14 09:09:51', 12, 2, 4, '2019-06-13', 'They want to save budget for low season ', 'Ms. Narin', '098 958 387', 4, '1970-01-01 00:00:00'),
(296, 'The Villa Sok San Square', '456, Sok San Road, Khum Svay Dangkum', 1, 1, '', 'Mr. Sous Phearith', 'info@thevillasoksansquare.com', 'info@thevillasoksansquare.com', 'info@thevillasoksansquare.com, hy.rady@thevillasoksansquare.com', '+855 77 777 356', '+855 77 777 356', '+855 63 768 877', 'http://thevillasoksansquare.com', 1, '3.0', 27, '2018-02-01', NULL, '60', NULL, 3, 13, '2019-05-29 09:40:20', '2019-05-29 09:40:20', 13, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(297, 'Okay1 Villa', 'No. 0325 Tapul, Sangkat Svay Dangkum', 1, 1, '', 'Mr. Sin Senghong', 'senghongsinn@gmail.com', 'senghongsinn@gmail.com', 'senghongsinn@gmail.com', '+855 77 519 967', '+855 77 519 967', '+855 63 966 444', 'http://okay1villa.com/home.aspx', 3, '3.5', 50, '2018-03-02', NULL, '80', NULL, 3, 13, '2019-05-29 09:34:23', '2019-05-29 09:34:23', 13, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(298, 'Maison Model D\'Angkor', 'No. 482, City center, National Road No.6, Wat Kesararam Street, Group 17, Phum Taphul, Sangkat Svay Dangkum, Siem Reap City, Cambodia.', 1, 1, '', 'Mrs.Kong Sophea ', ' res@maisonmodeldangkor.com', ' res@maisonmodeldangkor.com', ' res@maisonmodeldangkor.com', '+855 70 715 712', '+855 70 715 712', '', 'http://maisonmodeldangkor.com', 1, '2.0', 4, '2018-08-22', NULL, '40', NULL, 3, 13, '2019-01-15 09:29:34', '2019-01-15 09:29:34', 13, 2, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(299, 'Smiling Deluxe Hotel', 'No. 6, Chong Kaosou Village, Sangkat Slor Kram', 1, 1, '', 'Mr. Sengtry NOL', 'info@smilingdeluxehotel.com', 'info@smilingdeluxehotel.com', 'info@smilingdeluxehotel.com', '+855 17 295 283', '+855 17 295 283', '+855 63 763 838', 'http://smiling-hotel.com', 1, '4.0', 36, '2018-09-07', NULL, '130', NULL, 3, 13, '2019-02-05 08:50:35', '2019-02-05 08:50:35', 13, 14, 4, '2019-02-04', 'Smiling Deluxe Hotel is going to close expense budget soon', 'SENGTRY', '0964817070', 4, '1970-01-01 00:00:00'),
(300, 'Sea Breeze Resort', 'St. Otres Beach, Village 6, Commune 4', 1, 6, '', 'Ms. Nataliia Shuba', 'reservation@seabreeze-sihanoukville.com', 'reservation@seabreeze-sihanoukville.com', 'gm@seabreeze-sihanoukville.com', '+855 15 899 796', '+855 15 899 796', '', 'https://seabreeze-sihanoukville.com', 1, '3.0', 18, '2015-02-07', NULL, '50', NULL, 2, 12, '2018-11-01 15:11:35', '2018-11-01 15:11:35', 12, 2, 4, '1970-01-01', '', '', '', 4, NULL),
(301, 'Sabara Angkor Resort & Spa', 'Sfpda Rd, Krong Siem Reap', 1, 1, '', 'Mr. chamnan En', 'gm@sabaraangkorresort.com, fo@sabaraangkorresort.com', 'reservation@sabaraangkorresort.com', 'account@sabaraangkorresort.com', '+855 11 588 830', '+855 11 588 830', '', 'http://sabaraangkorresortandspa.com', 1, '5.0', 35, '2018-10-30', NULL, '50', NULL, 2, 13, '2018-11-08 08:19:55', '2018-11-08 08:19:55', 13, 15, 4, '1970-01-01', '', '', '', 4, NULL),
(302, ' Image d\' Angkor Boutique Villa', 'Airport Road, Kruos Village, Svay Dangkum Siem Reap Cambodia', 1, 1, '', 'Mr. Nit Nimol', 'info@imagedangkor.com', 'info@imagedangkor.com', 'info@imagedangkor.com', '+855 12 466 881', '+855 12 466 881', '', 'http://imagedangkor.com', 3, '3.0', 3, '2018-11-10', NULL, '60', NULL, 2, 12, '2018-11-27 11:00:01', '2018-11-27 11:00:01', 12, 15, 5, '1970-01-01', '', '', '', 4, NULL),
(303, 'Angkor Retreat Villa Boutique & Spa', '0126, Wat Bo Rd., Slorkrame Village | Siem Reap, Siem Reap 063, Cambodia', 1, 1, '', 'Ms. Yin Sokhunthea', 'info@angkorretreat.com', 'info@angkorretreat.com', 'info@angkorretreat.com', '+855 76 789 6565', '+855 76 789 6565', '', 'http://angkorretreat.com', 1, '3.0', 13, '2018-11-16', NULL, '127', NULL, 3, 12, '2019-04-01 14:08:42', '2019-04-01 14:08:42', 12, 14, 4, '2019-04-01', 'Prepare their property ', 'Ms. Len ', '096 431 8059', 5, '1970-01-01 00:00:00'),
(304, 'David Boutique & Spa ', 'Krous Village Road, Siem Reap, Cambodia', 1, 1, '', 'Mr. Narong Piseth', 'mr.piseth121887@gmail.com', 'mr.piseth121887@gmail.com', 'mr.piseth121887@gmail.com', '+855 70 358 788', '+855 70 358 788', '', 'http://davidboutiqueandspa.com', 4, '3.0', 10, '2018-11-15', NULL, '94', NULL, 3, 13, '2019-05-29 09:32:41', '2019-05-29 09:32:41', 13, 14, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(305, 'Norak Soeng Angkor Hotel', '7 Makara Road, | Phum Wat Bo, Sangkat Salakamroeuk, Siem Reap 17254, Cambodia', 1, 1, '', 'Mr. Orm Piseth', 'md@noraksoengangkorhotel.com', 'md@noraksoengangkorhotel.com', 'md@noraksoengangkorhotel.com', '+855 12 229 947', '+855 12 229 947', '', 'http://www.noraksoengangkorhotel.com/', 1, '3.0', 25, '2018-11-14', NULL, '145', NULL, 2, 13, '2019-01-15 09:05:15', '2019-01-15 09:05:15', 13, 14, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(306, 'Grand Champei Residence ', 'Busters Way, Svay Dangkum, Siem Reap, Kingdom of Cambodia.', 1, 1, '', 'Mr. Chin Vichea ', 'Chin.vichea@grandchampei.com', 'Chin.vichea@grandchampei.com', 'Chin.vichea@grandchampei.com', '+855 78 777 246', '+855 78 777 246', '+855 78 777 246', 'http://grandchampei.com', 1, '3.5', 35, '2018-12-08', NULL, '', NULL, 3, 13, '2019-05-29 09:49:05', '2019-05-29 09:49:05', 13, 13, 5, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(307, 'Champey Villa', '#166, Street#22 Wat Bo, Sala Kamreouk | (Near Wat Bo primary school), Siem Reap kh, Cambodia', 1, 1, '17252', 'Mrs. Sebla Kaplan Ure ', 'kalplansebla@gmail.com', 'kalplansebla@gmail.com', 'kalplansebla@gmail.com', '+855 15 765 138', '+855 15 765 138', '', 'http://champeyvilla.com', 3, '3.5', 10, '2018-12-07', NULL, '60', NULL, 3, 13, '2019-05-29 09:41:42', '2019-05-29 09:41:42', 13, 14, 4, '1970-01-01', '', '', '', 4, '1970-01-01 00:00:00'),
(308, 'Crystal Blue Boutique Hotel', 'No. 169 Sisowath  Daun Penh, Phnom Penh  Cambodia', 1, 2, '', 'Mr. RaBy RY', 'rithraby168@gmail.com', 'rithraby168@gmail.com', 'rithraby168@gmail.com', '+855 96 510 1168', '+855 96 510 1168', '+855 96 510 1168', 'https://www.crystalblueboutiquehotel.com/', 7, '3.5', 12, '2018-12-24', '20', '', NULL, 2, 12, '2018-12-28 13:26:35', '2018-12-28 13:26:35', 12, 13, 5, '1970-01-01', '', '', '', 4, NULL),
(309, 'Damnak Villa Retreat 1 ', ' | #92,Group#6,Trapeang Ses, Kork Chak, Siem Reap, Cambodia', 1, 1, '', 'Ith Sakpitou', 'sakpitouith168@gmail.com', 'info@damnakvillaretreat.com, sakpitouith168@gmail.com', 'sakpitouith168@gmail.com', '+855 77 979 711', '', '', 'http://damnakvillaretreat.com', 3, '3.0', 15, '2019-01-05', NULL, '55', NULL, 2, 13, '2019-01-15 09:28:12', '2019-01-15 09:28:12', 13, 14, 4, '2019-01-15', '', '', '', 4, '2019-01-15 00:00:00'),
(310, 'Natura Resort', 'Wat Enkosey, Phum Traing, Siem Reap, Cambodia ', 1, 1, '', 'Mr. Meng Morn ', 'operations@naturahotelresort.com', 'operations@naturahotelresort.com', 'operations@naturahotelresort.com', '+855 17 707 526', '+855 17 707 526', '', 'http://naturahotelresort.com', 1, '4.0', 23, '2019-01-19', '21', '100', NULL, 3, 12, '2019-07-01 11:17:40', '2019-07-01 11:17:40', 12, 13, 4, '2019-07-01', 'Save budget for low season ', 'Mr. Meng Morn ', '017 707 526', 5, '2019-02-12 00:00:00'),
(311, 'The One Gardening Boutique Hotel', 'Banteay, Chas village, Slor Kram commune Siem Reap, CAMBODIA', 1, 1, '', 'Mr. Zhang Liang', 'gm@theonegardeningboutiquehotel.com', 'reservation@theonegardeningboutiquehotel.com, info@laysungboutique.com', 'gm@theonegardeningboutiquehotel.com', '', '+855 81 216 836', '+855 81 216 836', 'https://theonegardeningboutiquehotel.com', 1, '5.0', 29, '2019-01-30', '30', '130', NULL, 2, 12, '2019-07-19 10:01:07', '2019-07-19 10:01:07', 12, 19, 4, '2019-07-12', 'Due to their budget because they have to work on their new property first.', 'Ms. Keo ', '017 881 224', 5, '2019-02-04 00:00:00'),
(312, 'Neth Socheata Hotel ', '(Pub street area)# 284, 2Thnou Street, directly opposite the Old Market, Siem Reap City, Siem Reap Province, Cambodia', 1, 1, '', 'Mrs. Douk Angkea Socheata', 'booking@nethsocheatahotel.com', 'booking@nethsocheatahotel.com', 'booking@nethsocheatahotel.com', '', '+855 63 963 294', '+855 81 832 181', 'http://nethsocheatahotel.com', 1, '2.0', 22, '2019-02-08', NULL, '102', NULL, 2, 12, '2019-02-20 15:59:16', '2019-02-20 15:59:16', 12, 13, 5, '2019-02-11', '', '', '', 4, '2019-02-20 00:00:00'),
(313, 'Pool Party Hostel', 'Phsar Krom Road , Vihear Chin Village , Svay Dangkum Commune', 1, 1, '', 'Mr. Mam Soksann', 'poolpartyhostel@gmail.com', 'booking@poolpartyhostel.com, poolpartyhostel@gmail.com', 'poolpartyhostel@gmail.com', '+855 10 303 313', '+855 10 303 313', '', 'http://poolpartyhostel.com', 1, '2.0', 20, '2019-02-11', '26', '130', NULL, 2, 13, '2019-05-29 09:31:31', '2019-05-29 09:31:31', 13, 14, 4, '2019-02-21', '', '', '', 4, '2019-02-21 00:00:00'),
(314, 'Best Central Point Hotel ', 'Phnom Penh ', 1, 2, '', 'Mrs. Tha Nimol', 'hometown.hotel@gmail.com', 'hometown.hotel@gmail.com', 'hometown.hotel@gmail.com', '+855 77 556 528', '+855 77 556 528', '+855 77 556 528', 'http://bestcentralpointhotel.com', 1, '3.0', 42, '2019-06-25', '34', '90', NULL, 2, 2, '2019-07-03 14:42:16', '2019-07-03 14:42:16', 2, 19, 5, '2019-06-28', '', '', '', 4, '2019-07-01 00:00:00'),
(315, 'Nita Dream Villa', 'Near Siem Reap Court, Chreav Village, Chreav Commune, Siem Reap City', 1, 1, '17254', 'Mrs. Danh Sokhern', 'reservation@nitadreamvilla.com', 'reservation@nitadreamvilla.com', 'reservation@nitadreamvilla.com', '+855 17 410 768', '+855 17 410 768', '', 'http://nitadreamvilla.com', 1, '3.0', 4, '2019-03-04', NULL, '40', NULL, 3, 12, '2019-07-01 15:25:27', '2019-07-01 15:25:27', 12, 2, 4, '2019-07-01', 'Save budget for low season ', 'Ms. Danh Dane ', '015 737 927', 5, '2019-07-01 00:00:00'),
(316, 'Wheel Garden Residence ', 'Psa Krolanh Street Trapeang Ses Village, Sangkat Kouk Chak, Siem Reap ', 1, 1, '17259', 'Mr. So', 'sales@wheelgarden.com', 'sales@wheelgarden.com, info@wheelgarden.com', 'acc@wheelgarden.com, gm@wheelgarden.com', '', '+855 12 458 184', '+855 70 487 618', 'http://wheelgarden.com', 1, '4.0', 30, '2019-06-28', NULL, '110', NULL, 2, 12, '2019-07-08 08:22:00', '2019-07-08 08:22:00', 12, 19, 4, '2019-07-08', '', '', '', 2, '2019-07-08 00:00:00'),
(317, 'Romantic Angkor Residence ', 'Wat Bo Village, Sala Kamreuk Commune, Siem Reap Cambodia', 1, 1, '', 'Mr. Komsort', 'romanticangkors@gmail.com', 'romanticangkors@gmail.com', 'romanticangkors@gmail.com', '+855 70 770 002', '+855 70 770 002', '+855 70 770 002', 'http://romanticangkor.com', 7, '4.0', 15, '2019-07-08', '35', '110', NULL, 1, 12, '2019-07-08 14:52:54', '2019-07-08 14:52:54', 12, 19, 5, '2019-07-08', '', '', '', 2, '2019-07-08 00:00:00'),
(318, 'Moon Flower Residence', 'Old Market Area, Wat Damnak Village, Salakomreuk Commune', 1, 1, '', 'Mr.Sok Piseth', 'info@moonflowersiemreap.com', 'info@moonflowersiemreap.com', 'info@moonflowersiemreap.com', '', '+855 69 700 304', '+855 77 979 711', 'https://damnakvillaboutique.com', 1, '3.0', 8, '2018-07-09', NULL, '85', NULL, 2, 12, '2019-08-07 09:37:43', '2019-08-07 09:37:43', 12, 19, 4, '2019-08-07', '', '', '', 2, '2019-08-07 00:00:00'),
(319, 'Siem Reap Palace Residence', 'Siem Reap', 1, 1, '', 'Mr. Borei', 'book@siemreappalace-residence.com', 'book@siemreappalace-residence.com', 'book@siemreappalace-residence.com', '+855 98 675 556', '+855 98 675 556', '+855 98 675 556', 'http://siemreappalace-residence.com', 7, '4.0', 26, '2019-08-06', NULL, '50', NULL, 1, 12, '2019-08-07 10:24:13', '2019-08-07 10:24:13', 12, 19, 4, '2019-08-07', '', '', '', 2, '2019-08-07 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `event_list`
--

CREATE TABLE `event_list` (
  `id` int(11) NOT NULL,
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
  `authorized` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event_list`
--

INSERT INTO `event_list` (`id`, `img_url`, `event_name`, `number_of_audient`, `address`, `address_line_2`, `id_country`, `id_city`, `id_province`, `postal_code`, `prefix_phone_code`, `phone_number`, `prefix_phone_code_line_2`, `phone_number_line_2`, `email`, `description`, `created_date`, `created_by`, `updated_date`, `updated_by`, `status`, `from_date`, `to_date`, `fee_for_membership`, `fee_for_subscriber`, `authorized`) VALUES
(1, '4', 'Village Excursions by Vespa Famtrip', NULL, 'River side', '', 56, 21, 'Palate Restaurant', '', NULL, '', NULL, '', '', 'Time Activity Remarks \r\n\r\n08:00 Pick up from the Hotel Departure exactly on time \r\n08:10  09:00 Ride to countryside fresh palm juice gathering and tasting  \r\n09:00  09:30 Ride and explanation about house temples and stroll over local market \r\n09:30  10:30 Ride to  Wat Svay Romeat Pagoda,  sightseeing,   blessing ceremony and fortune teller  \r\n10:30  11:45 West  Mebon temple island During rainy season transported by   boat and dui during dry season by Vespa \r\n11:45  13:00 Lunch and drinks at private farm picnic  \r\n13:00  13:10 Visit to basket weaving and farming family  13:10  13:35 Visit to sticky rice making and Local medicine   along the road back  \r\n13:30  14:00 Return to hotel and end tour \r\n  \r\nImportant: \r\no The safety of the guests is paramount and all guests must wear helmets. \r\no The price is 40 US$ per person \r\no Each guest is driven by their personal drivers (only holders of local or international drivers license are eligible to drive in Siem Reap and road conditions demand full concentration). \r\no Every tour is accompanied by a guide. o All snacks, drinks and foods are included in the price of the tour. Individual purchases during the tour are for the account of guests. \r\no The tour program may vary, for instance due to spontaneous extra activities or if an activity should not be available due to circumstances beyond our control. \r\no Guests are advised to use sunscreen and to wear comfortable clothes and footwear that can be cleaned easily.\r\n The tour rides rain or shine. In the monsoon season first- rate raincoats are provided by VA SR ', '2019-07-03 16:39:16', 1, '2019-07-16 14:37:25', 1, 1, '2019-07-12', '2019-07-12', '40.00', '50.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` int(11) NOT NULL,
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
  `img_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `expense_data`
--

CREATE TABLE `expense_data` (
  `id` int(11) NOT NULL,
  `id_expense` int(11) DEFAULT NULL,
  `chart_of_account` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `expense_related_to`
--

CREATE TABLE `expense_related_to` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `expense_related_to`
--

INSERT INTO `expense_related_to` (`id`, `name`) VALUES
(1, 'Supplier'),
(2, 'Customer'),
(3, 'Project');

-- --------------------------------------------------------

--
-- Table structure for table `finance_chart_of_account`
--

CREATE TABLE `finance_chart_of_account` (
  `id` int(11) NOT NULL,
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
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `finance_chart_of_account`
--

INSERT INTO `finance_chart_of_account` (`id`, `date`, `transaction_type`, `doc_id`, `name`, `name_type`, `description`, `debit`, `credit`, `balance`, `account_type`, `chart_of_account`, `created_date`, `created_by`, `status`, `updated_date`, `updated_by`) VALUES
(3, '2019-08-19', 'Payment', 'REC19080001', '1', 'customer', 'REC19080001', '0.00', '350.00', '350.00', 45, 63, '2019-08-19 15:47:23', 12, 1, NULL, NULL),
(4, '2019-08-19', 'Payment', 'REC19080001', '1', 'customer', 'REC19080001', '350.00', '0.00', '350.00', 3, 38, '2019-08-19 15:47:23', 12, 1, NULL, NULL),
(5, '2019-08-19', 'Payment', 'REC19080002', '1', 'customer', 'REC19080002', '0.00', '200.00', '550.00', 45, 63, '2019-08-19 15:47:50', 12, 1, NULL, NULL),
(6, '2019-08-19', 'Payment', 'REC19080002', '1', 'customer', 'REC19080002', '200.00', '0.00', '550.00', 3, 38, '2019-08-19 15:47:50', 12, 1, NULL, NULL),
(7, '2019-08-19', 'Payment', 'REC19080003', '1', 'customer', 'REC19080003', '0.00', '400.00', '950.00', 45, 63, '2019-08-19 15:48:09', 12, 1, NULL, NULL),
(8, '2019-08-19', 'Payment', 'REC19080003', '1', 'customer', 'REC19080003', '400.00', '0.00', '950.00', 3, 38, '2019-08-19 15:48:09', 12, 1, NULL, NULL),
(9, '2019-08-19', 'Invoice', 'INV19080001', '94', 'customer', 'INV19080001', '0.00', '1050.00', '1050.00', 1, 1, '2019-08-22 14:24:29', 14, 1, NULL, NULL),
(10, '2019-08-19', 'Invoice', 'INV19080001', '94', 'customer', 'INV19080001', '1050.00', '0.00', '-100.00', 45, 63, '2019-08-22 14:24:29', 14, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `finance_chart_of_account_amount`
--

CREATE TABLE `finance_chart_of_account_amount` (
  `id` int(11) NOT NULL,
  `account_type` int(11) DEFAULT NULL,
  `chart_of_account` int(11) DEFAULT NULL,
  `ending_balance` decimal(10,2) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `name_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `folder`
--

CREATE TABLE `folder` (
  `id` int(11) NOT NULL,
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
  `id_lead_profile` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `folder`
--

INSERT INTO `folder` (`id`, `folder_name`, `id_membership_profile`, `status`, `created_by`, `created_date`, `updated_by`, `updated_date`, `id_document_permission`, `id_event_list`, `id_employee_profile`, `id_customer_profile`, `id_project`, `id_contract`, `id_lead_profile`) VALUES
(1, 'Test folder', '1', 1, 1, '2019-07-03 16:53:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Testing', '', 1, 1, '2019-07-09 20:38:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'ds', '', 1, 1, '2019-07-09 20:50:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'sdf', '', 1, 1, '2019-07-09 20:53:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '??????????????? ??????????? ????', '', 1, 1, '2019-07-09 20:55:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '??????????????? ??????????? ???? ??? ???? ???? eOcambo Technologoy', '', 1, 1, '2019-07-09 20:59:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'testing 3', '', 1, 1, '2019-07-09 21:02:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Testing folder 4', '', 1, 1, '2019-07-09 21:03:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Testing Event Document', NULL, 1, 1, '2019-07-09 21:34:35', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(11, 'Testing folder 4', '2', 1, 1, '2019-07-11 19:54:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'Testing folder 4', '3', 1, 1, '2019-07-11 19:57:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'test', '', 1, 1, '2019-07-16 15:13:31', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Bill', NULL, 1, 1, '2019-07-25 14:59:46', NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(15, 'Bill', NULL, 1, 1, '2019-07-25 15:05:17', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(16, 'Web Developer', NULL, 1, 13, '2019-08-22 14:24:41', NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hls_solutions`
--

CREATE TABLE `hls_solutions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `description` text,
  `status` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hls_solutions`
--

INSERT INTO `hls_solutions` (`id`, `name`, `icon`, `description`, `status`) VALUES
(1, 'Booking Engine', 'fa fa-cog', NULL, b'1'),
(2, 'Front Desk', 'fa fa-desktop', NULL, b'1'),
(3, 'Website', 'fa fa-id-card', NULL, b'1'),
(4, 'Boooking Widget', 'fa fa-file-code-o', NULL, b'1'),
(5, 'Mobile Website', 'fa fa-mobile', NULL, b'1'),
(6, 'Social Media', 'fa fa-users', NULL, b'1'),
(7, 'Channel Manager', 'fa fa-snowflake-o', NULL, b'1'),
(8, 'Reputation Manager', 'fa fa-comment', NULL, b'1'),
(9, 'eO-DMC', 'fa fa-wpexplorer', NULL, b'1'),
(10, 'eO-CSMA', 'fa fa-mobile', NULL, b'1'),
(11, 'eO-BMS', 'fa fa-line-chart', NULL, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_status`
--

CREATE TABLE `invoice_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `css_class` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice_status`
--

INSERT INTO `invoice_status` (`id`, `name`, `css_class`, `status`) VALUES
(1, 'PAID', 'label-info', 1),
(2, 'OVERDUE', 'label-warning', 1),
(3, 'PARTIALLY PAID', 'label-success', 1),
(4, 'UNPAID', 'label-mint', 1),
(5, 'VOIDED', 'label-danger', 1);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `long_description` text,
  `short_description` varchar(255) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `id_tax` int(11) DEFAULT NULL,
  `id_group` int(11) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `description`, `long_description`, `short_description`, `rate`, `id_tax`, `id_group`, `unit`, `status`, `updated_by`, `updated_date`, `created_by`, `created_date`) VALUES
(1, 'Premium Website (Standard)', '', '', '1000.00', NULL, 1, 1, 1, NULL, NULL, 12, '2019-08-15 11:26:14'),
(2, 'Booking Engine 1-10 Rooms', '', '', '40.00', NULL, 2, 1, 1, NULL, NULL, 12, '2019-08-15 11:27:53'),
(3, 'Booking Engine 11-29 Rooms', NULL, NULL, '50.00', NULL, 2, 1, 1, NULL, NULL, 12, '2019-08-15 11:28:36'),
(4, 'Booking Engine 30-59 Rooms', NULL, NULL, '60.00', NULL, 2, 1, 1, NULL, NULL, 12, '2019-08-15 11:28:38'),
(5, 'Booking Engine 60-Unlimited', NULL, NULL, '75.00', NULL, 2, 1, 1, NULL, NULL, 12, '2019-08-15 11:28:43'),
(6, 'Premium Website (Professional)', '', '', '2000.00', NULL, 1, 1, 1, NULL, NULL, 12, '2019-08-15 11:26:14'),
(7, 'Channel Manger 1-10 Rooms', '', '', '60.00', NULL, 2, NULL, 1, NULL, NULL, 12, '2019-08-15 11:38:05'),
(10, 'Channel Manager 11-29 rooms ', '', '', '70.00', NULL, 2, 29, 1, NULL, '2019-08-15 11:49:36', NULL, '2019-08-15 11:47:14'),
(11, 'Channel Manager 30-59 rooms  ', '', '', '90.00', NULL, 2, 59, 1, NULL, '2019-08-15 11:49:52', NULL, '2019-08-15 11:48:18'),
(12, 'Channel Manager 60 unlimited ', '', '', '130.00', NULL, 2, 60, 1, NULL, '2019-08-15 11:50:07', NULL, '2019-08-15 11:48:39'),
(13, 'Template Website Unlimited rooms', '', '', '35.00', NULL, 2, NULL, 1, NULL, '2019-08-15 11:52:14', NULL, '2019-08-15 11:51:17'),
(14, 'Front Desk Unlimited Rooms ', '', '', '40.00', NULL, 2, NULL, 1, NULL, NULL, NULL, '2019-08-15 11:52:45');

-- --------------------------------------------------------

--
-- Table structure for table `item_group`
--

CREATE TABLE `item_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_group`
--

INSERT INTO `item_group` (`id`, `name`, `created_date`, `updated_by`, `created_by`, `updated_date`, `status`) VALUES
(1, 'Website', '2019-07-17 21:15:36', NULL, 1, NULL, 1),
(2, 'HLS Solutions', '2019-07-17 21:42:13', NULL, 1, NULL, 1),
(3, 'eOcambo Product', '2019-07-25 14:50:43', NULL, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_base`
--

CREATE TABLE `knowledge_base` (
  `id` int(11) NOT NULL,
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
  `short_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_base_position`
--

CREATE TABLE `knowledge_base_position` (
  `id` int(11) NOT NULL,
  `id_knowledge_base` int(11) DEFAULT NULL,
  `id_position` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `lead_profile`
--

CREATE TABLE `lead_profile` (
  `id` int(11) NOT NULL,
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
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `lead_profile_note`
--

CREATE TABLE `lead_profile_note` (
  `id` int(11) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(11) DEFAULT NULL,
  `id_lead_profile` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leave_application`
--

CREATE TABLE `leave_application` (
  `id` int(11) NOT NULL,
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
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `leave_application`
--

INSERT INTO `leave_application` (`id`, `id_approver`, `start_date`, `end_date`, `img_url`, `id_employee`, `is_half_day`, `id_leave_type_name`, `leave_reason`, `reject_reason`, `id_leave_status`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 2, '2019-08-01', '2019-08-30', NULL, 1, 0, 1, 'It\'s just a reason', '', '1', 12, '2019-08-19 15:43:18', NULL, NULL),
(2, 2, '2019-08-01', '2019-08-30', NULL, 3, 0, 3, '7 Jan 2018', '12', '1', 12, '2019-08-19 16:06:57', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leave_in_the_year`
--

CREATE TABLE `leave_in_the_year` (
  `id` int(11) NOT NULL,
  `name` varbinary(255) DEFAULT NULL,
  `id_year_list` int(11) DEFAULT NULL,
  `id_month_list` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leave_in_the_year`
--

INSERT INTO `leave_in_the_year` (`id`, `name`, `id_year_list`, `id_month_list`, `status`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(5, 0x5075626c696320486f6c69646179, 1, 1, 1, 12, '2019-08-19 14:09:01', 12, '2019-08-19 14:09:19');

-- --------------------------------------------------------

--
-- Table structure for table `leave_in_the_year_data`
--

CREATE TABLE `leave_in_the_year_data` (
  `id` int(11) NOT NULL,
  `id_leave_in_the_year` int(11) DEFAULT NULL,
  `leave_type_value` int(11) DEFAULT NULL,
  `id_leave_type` int(11) DEFAULT NULL,
  `id_month_list` int(11) DEFAULT NULL,
  `id_year_list` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leave_in_the_year_data`
--

INSERT INTO `leave_in_the_year_data` (`id`, `id_leave_in_the_year`, `leave_type_value`, `id_leave_type`, `id_month_list`, `id_year_list`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(51, 5, 24, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 5, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 5, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 5, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 5, 2, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 5, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 5, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 5, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 5, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leave_role`
--

CREATE TABLE `leave_role` (
  `id` int(11) NOT NULL,
  `names` varchar(250) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `leave_role`
--

INSERT INTO `leave_role` (`id`, `names`, `updated_by`, `updated_date`, `status`, `created_by`, `created_date`) VALUES
(1, 'Maximum of leaving Day. ', 11, '2017-12-13 17:33:19', 1, 11, '2017-12-13 17:33:19');

-- --------------------------------------------------------

--
-- Table structure for table `leave_status`
--

CREATE TABLE `leave_status` (
  `id` int(11) NOT NULL,
  `css` varchar(255) DEFAULT NULL,
  `approve_status_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `leave_status`
--

INSERT INTO `leave_status` (`id`, `css`, `approve_status_name`) VALUES
(1, 'label-warning', 'Pending'),
(2, 'label-success', 'Approved'),
(3, 'label-danger', 'Rejected');

-- --------------------------------------------------------

--
-- Table structure for table `leave_type_condition`
--

CREATE TABLE `leave_type_condition` (
  `id` int(11) NOT NULL,
  `names` varchar(250) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `leave_type_condition`
--

INSERT INTO `leave_type_condition` (`id`, `names`, `updated_by`, `updated_date`, `status`, `created_by`, `created_date`) VALUES
(1, 'Paid', 11, '2017-12-13 17:32:50', 1, 11, '2017-12-13 17:32:50'),
(2, 'Unpaid', 11, '2017-12-13 17:32:56', 1, 11, '2017-12-13 17:32:56'),
(3, 'Compensatory Off', 11, '2017-12-13 17:33:01', 1, 11, '2017-12-13 17:33:01'),
(4, 'On Duty', 11, '2017-12-13 17:33:06', 1, 11, '2017-12-13 17:33:06');

-- --------------------------------------------------------

--
-- Table structure for table `leave_type_name`
--

CREATE TABLE `leave_type_name` (
  `id` int(11) NOT NULL,
  `names` varchar(250) NOT NULL,
  `shortcut` varchar(255) DEFAULT NULL,
  `css_style` varchar(255) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `leave_type_name`
--

INSERT INTO `leave_type_name` (`id`, `names`, `shortcut`, `css_style`, `updated_by`, `updated_date`, `status`, `created_by`, `created_date`) VALUES
(1, 'WORKING DAY', 'WD', '#1eb1ed', 1, '2018-12-03 13:05:31', 1, 11, '2017-12-13 17:32:17'),
(2, 'DAY OFF', 'OFF', '#1072bd', 11, '2017-12-13 17:32:36', 1, 11, '2017-12-13 17:32:36'),
(3, 'HALF PUBLIC HOLIDAY', 'HPH', '#e06b21', 1, '2018-12-03 13:05:56', 1, 11, '2017-12-13 17:32:41'),
(4, 'PUBLIC HOLIDAY', 'PH', '#964714', 1, '2018-12-03 13:06:01', 1, 1, '2018-12-03 13:06:01'),
(5, 'HALF ANNUAL LEAVE', 'HAL', '#8eb5e0', 1, '2018-12-03 13:06:16', 1, 1, '2018-12-03 13:06:16'),
(6, 'ANNUAL LEAVE', 'AL', '#568ed3', 1, '2018-12-03 13:06:23', 1, 1, '2018-12-03 13:06:23'),
(7, 'HALF DAY SICK LEAVE', 'HSL', '#fdbf2d', NULL, NULL, 1, NULL, NULL),
(8, 'SICK LEAVE', 'SL', '#fffd38', NULL, NULL, 1, NULL, NULL),
(9, 'ABSENCE', 'ABS', '#6f359e', NULL, NULL, 1, NULL, NULL),
(10, 'LATE', 'L', '#fc0d1b', NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `marital_status`
--

CREATE TABLE `marital_status` (
  `id` int(11) NOT NULL,
  `names` varchar(250) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `marital_status`
--

INSERT INTO `marital_status` (`id`, `names`, `updated_by`, `updated_date`, `status`, `created_by`, `created_date`) VALUES
(1, 'Single', NULL, NULL, 1, 1, '2019-04-22 08:44:08'),
(2, 'Married', NULL, NULL, 1, 1, '2019-04-22 08:46:07'),
(3, 'Widowed', NULL, NULL, 1, 1, '2019-04-22 08:46:30'),
(4, 'Divorced', NULL, NULL, 1, 1, '2019-04-22 08:47:16');

-- --------------------------------------------------------

--
-- Table structure for table `membership_document`
--

CREATE TABLE `membership_document` (
  `id` int(11) NOT NULL,
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
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `membership_event`
--

CREATE TABLE `membership_event` (
  `id` int(11) NOT NULL,
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
  `approval_status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `membership_event`
--

INSERT INTO `membership_event` (`id`, `id_membership_profile`, `id_event_list`, `number_of_audient`, `address`, `address_line_2`, `id_country`, `id_city`, `id_province`, `postal_code`, `prefix_phone_code`, `phone_number`, `prefix_phone_code_line_2`, `phone_number_line_2`, `email`, `description`, `created_date`, `created_by`, `updated_date`, `updated_by`, `status`, `from_date`, `to_date`, `register_date`, `amount`, `balance`, `id_payment_type`, `id_payment_method`, `member_description`, `paid`, `event_fee`, `approval_status`) VALUES
(1, 1, 1, 2, 'River side', '', 56, 21, 'Palate Restaurant', '', NULL, '', NULL, '', '', 'Time Activity Remarks \r\n\r\n08:00 Pick up from the Hotel Departure exactly on time \r\n08:10  09:00 Ride to countryside fresh palm juice gathering and tasting  \r\n09:00  09:30 Ride and explanation about house temples and stroll over local market \r\n09:30  10:30 Ride to  Wat Svay Romeat Pagoda,  sightseeing,   blessing ceremony and fortune teller  \r\n10:30  11:45 West  Mebon temple island During rainy season transported by   boat and dui during dry season by Vespa \r\n11:45  13:00 Lunch and drinks at private farm picnic  \r\n13:00  13:10 Visit to basket weaving and farming family  13:10  13:35 Visit to sticky rice making and Local medicine   along the road back  \r\n13:30  14:00 Return to hotel and end tour \r\n  \r\nImportant: \r\no The safety of the guests is paramount and all guests must wear helmets. \r\no The price is 40 US$ per person \r\no Each guest is driven by their personal drivers (only holders of local or international drivers license are eligible to drive in Siem Reap and road conditions demand full concentration). \r\no Every tour is accompanied by a guide. o All snacks, drinks and foods are included in the price of the tour. Individual purchases during the tour are for the account of guests. \r\no The tour program may vary, for instance due to spontaneous extra activities or if an activity should not be available due to circumstances beyond our control. \r\no Guests are advised to use sunscreen and to wear comfortable clothes and footwear that can be cleaned easily.\r\n The tour rides rain or shine. In the monsoon season first- rate raincoats are provided by VA SR ', '2019-07-03 16:47:53', 1, NULL, NULL, 1, '2019-07-12', '2019-07-12', '2019-07-03', '80.00', '80.00', 2, 1, '', '0.00', '40.00', 1),
(2, 2, 1, 1, 'River side', '', 56, 21, 'Palate Restaurant', '', NULL, '', NULL, '', '', 'Time Activity Remarks \r\n\r\n08:00 Pick up from the Hotel Departure exactly on time \r\n08:10  09:00 Ride to countryside fresh palm juice gathering and tasting  \r\n09:00  09:30 Ride and explanation about house temples and stroll over local market \r\n09:30  10:30 Ride to  Wat Svay Romeat Pagoda,  sightseeing,   blessing ceremony and fortune teller  \r\n10:30  11:45 West  Mebon temple island During rainy season transported by   boat and dui during dry season by Vespa \r\n11:45  13:00 Lunch and drinks at private farm picnic  \r\n13:00  13:10 Visit to basket weaving and farming family  13:10  13:35 Visit to sticky rice making and Local medicine   along the road back  \r\n13:30  14:00 Return to hotel and end tour \r\n  \r\nImportant: \r\no The safety of the guests is paramount and all guests must wear helmets. \r\no The price is 40 US$ per person \r\no Each guest is driven by their personal drivers (only holders of local or international drivers license are eligible to drive in Siem Reap and road conditions demand full concentration). \r\no Every tour is accompanied by a guide. o All snacks, drinks and foods are included in the price of the tour. Individual purchases during the tour are for the account of guests. \r\no The tour program may vary, for instance due to spontaneous extra activities or if an activity should not be available due to circumstances beyond our control. \r\no Guests are advised to use sunscreen and to wear comfortable clothes and footwear that can be cleaned easily.\r\n The tour rides rain or shine. In the monsoon season first- rate raincoats are provided by VA SR ', '2019-07-03 17:03:30', 1, NULL, NULL, 1, '2019-07-12', '2019-07-12', '2019-07-03', '50.00', '50.00', 2, 1, '', NULL, '50.00', 1),
(3, 2, 1, 2, 'River side', '', NULL, NULL, 'Palate Restaurant', '', NULL, '', NULL, '', '', 'Time Activity Remarks \r\n\r\n08:00 Pick up from the Hotel Departure exactly on time \r\n08:10  09:00 Ride to countryside fresh palm juice gathering and tasting  \r\n09:00  09:30 Ride and explanation about house temples and stroll over local market \r\n09:30  10:30 Ride to  Wat Svay Romeat Pagoda,  sightseeing,   blessing ceremony and fortune teller  \r\n10:30  11:45 West  Mebon temple island During rainy season transported by   boat and dui during dry season by Vespa \r\n11:45  13:00 Lunch and drinks at private farm picnic  \r\n13:00  13:10 Visit to basket weaving and farming family  13:10  13:35 Visit to sticky rice making and Local medicine   along the road back  \r\n13:30  14:00 Return to hotel and end tour \r\n  \r\nImportant: \r\no The safety of the guests is paramount and all guests must wear helmets. \r\no The price is 40 US$ per person \r\no Each guest is driven by their personal drivers (only holders of local or international drivers license are eligible to drive in Siem Reap and road conditions demand full concentration). \r\no Every tour is accompanied by a guide. o All snacks, drinks and foods are included in the price of the tour. Individual purchases during the tour are for the account of guests. \r\no The tour program may vary, for instance due to spontaneous extra activities or if an activity should not be available due to circumstances beyond our control. \r\no Guests are advised to use sunscreen and to wear comfortable clothes and footwear that can be cleaned easily.\r\n The tour rides rain or shine. In the monsoon season first- rate raincoats are provided by VA SR ', '2019-07-03 17:22:51', 1, NULL, NULL, 1, '2019-07-12', '2019-07-12', '2019-07-03', '80.00', NULL, NULL, NULL, NULL, NULL, '40.00', 1),
(4, 2, 1, 3, 'River side', '', NULL, NULL, 'Palate Restaurant', '', NULL, '', NULL, '', '', 'Time Activity Remarks \r\n\r\n08:00 Pick up from the Hotel Departure exactly on time \r\n08:10  09:00 Ride to countryside fresh palm juice gathering and tasting  \r\n09:00  09:30 Ride and explanation about house temples and stroll over local market \r\n09:30  10:30 Ride to  Wat Svay Romeat Pagoda,  sightseeing,   blessing ceremony and fortune teller  \r\n10:30  11:45 West  Mebon temple island During rainy season transported by   boat and dui during dry season by Vespa \r\n11:45  13:00 Lunch and drinks at private farm picnic  \r\n13:00  13:10 Visit to basket weaving and farming family  13:10  13:35 Visit to sticky rice making and Local medicine   along the road back  \r\n13:30  14:00 Return to hotel and end tour \r\n  \r\nImportant: \r\no The safety of the guests is paramount and all guests must wear helmets. \r\no The price is 40 US$ per person \r\no Each guest is driven by their personal drivers (only holders of local or international drivers license are eligible to drive in Siem Reap and road conditions demand full concentration). \r\no Every tour is accompanied by a guide. o All snacks, drinks and foods are included in the price of the tour. Individual purchases during the tour are for the account of guests. \r\no The tour program may vary, for instance due to spontaneous extra activities or if an activity should not be available due to circumstances beyond our control. \r\no Guests are advised to use sunscreen and to wear comfortable clothes and footwear that can be cleaned easily.\r\n The tour rides rain or shine. In the monsoon season first- rate raincoats are provided by VA SR ', '2019-07-04 08:51:16', 1, NULL, NULL, 1, '2019-07-12', '2019-07-12', '2019-07-04', '120.00', '0.00', NULL, NULL, NULL, '120.00', '40.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `membership_payment`
--

CREATE TABLE `membership_payment` (
  `id` int(11) NOT NULL,
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
  `id_payment_for` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `membership_payment`
--

INSERT INTO `membership_payment` (`id`, `id_membership_profile`, `amount`, `paid`, `balance`, `id_payment_type`, `id_payment_method`, `id_membership_type`, `from_date`, `to_date`, `description`, `created_date`, `created_by`, `updated_date`, `updated_by`, `status`, `id_payment_for`) VALUES
(1, 1, '80.00', '0.00', '80.00', 2, 1, NULL, '2019-07-12', '2019-07-12', '', NULL, NULL, NULL, NULL, 1, 2),
(2, 2, '50.00', NULL, '50.00', 2, 1, NULL, '2019-07-12', '2019-07-12', '', NULL, NULL, NULL, NULL, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `membership_profile`
--

CREATE TABLE `membership_profile` (
  `id` int(11) NOT NULL,
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
  `membership_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `membership_profile`
--

INSERT INTO `membership_profile` (`id`, `id_prefix`, `first_name`, `last_name`, `company_name`, `passport_no`, `date_of_birth`, `place_of_birth`, `sex`, `nationality`, `address`, `address_line_2`, `id_country`, `id_city`, `id_province`, `postal_code`, `marital_status`, `prefix_phone_code`, `phone_number`, `prefix_phone_code_line_2`, `phone_number_line_2`, `email`, `website`, `contact_person`, `position`, `mot_licence_no`, `year_of_establishment`, `type_of_business`, `username`, `password`, `confirm_password`, `description`, `created_date`, `created_by`, `updated_date`, `updated_by`, `status`, `img_url`, `membership_type`) VALUES
(1, 1, 'Eng', 'Kunthea', 'Euro Khmer Voyages', '', '1980-06-01', '', '', 56, '#0677, Group 25, Slor Kram, Banteay Chas', '', 56, 21, '', '', 2, 106, '069955545', NULL, '', 'kunthea@ekvoyages.com', '', '', '', '', '', '', 'kunthea', '', '', '', '2019-07-03 16:28:05', 1, '2019-07-03 16:28:54', 1, 1, '3', 1),
(2, 1, 'chum', 'sokun', 'test subscriber ', '', '2019-07-03', '', '', 56, '#0677, Group 25, Slor Kram, Banteay Chas', '', NULL, NULL, '', '', 2, NULL, '', NULL, '', 'sokun@ekvoyages.com', '', '', '', '', '', '', 'sokun', '', '', '', '2019-07-03 16:58:02', 1, '2019-07-10 21:24:22', 8, 1, '16', 1),
(3, 4, 'Next', 'Step', 'eOcambo Village', '', NULL, '', NULL, 56, 'SR', '', NULL, NULL, '', '', NULL, NULL, '', NULL, '', 'nextstep@eocambo.com', 'eocambo.com', '', '', '', '', '', 'NextStep', '123456', '123456', '', '2019-07-10 21:24:12', 8, NULL, NULL, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `membership_type`
--

CREATE TABLE `membership_type` (
  `id` int(11) NOT NULL,
  `membership_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `membership_type`
--

INSERT INTO `membership_type` (`id`, `membership_type`, `description`, `created_date`, `created_by`, `updated_date`, `updated_by`, `status`) VALUES
(1, 'Diamond', 'sdfsd', '2019-04-18 08:57:41', 1, '2019-04-18 08:57:41', 1, 1),
(2, 'Gold', '', '2019-04-18 10:36:33', 1, '2019-04-18 10:36:33', 1, 1),
(4, 'Silver', '', '2019-04-18 14:02:07', 1, '2019-04-22 11:05:15', 1, 1),
(5, 'Brone', '', '2019-04-18 14:03:38', 1, '2019-04-18 14:12:47', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1552447078),
('m130524_201442_init', 1552447085);

-- --------------------------------------------------------

--
-- Table structure for table `milestone_data`
--

CREATE TABLE `milestone_data` (
  `id` int(11) NOT NULL,
  `id_milestone_type` int(11) DEFAULT NULL,
  `id_project` int(11) DEFAULT NULL,
  `id_task` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `month_list`
--

CREATE TABLE `month_list` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `month_list`
--

INSERT INTO `month_list` (`id`, `name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `payment_for`
--

CREATE TABLE `payment_for` (
  `id` int(11) NOT NULL,
  `names` varchar(250) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `payment_for`
--

INSERT INTO `payment_for` (`id`, `names`, `updated_by`, `updated_date`, `status`, `created_by`, `created_date`) VALUES
(1, 'Membership', NULL, NULL, 1, 1, '2019-05-17 11:19:01'),
(2, 'Event', NULL, NULL, 1, 1, '2019-05-17 11:19:11');

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `id` int(11) NOT NULL,
  `names` varchar(250) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`id`, `names`, `updated_by`, `updated_date`, `status`, `created_by`, `created_date`) VALUES
(1, 'Cash', 1, '2019-04-23 15:34:27', 1, 11, '2017-12-13 17:20:12'),
(2, 'Transfer Money', 11, '2017-12-13 17:20:18', 1, 11, '2017-12-13 17:20:18'),
(3, 'Cheque', 11, '2017-12-13 17:20:24', 1, 11, '2017-12-13 17:20:24'),
(5, 'E-payment', 11, '2017-12-13 17:20:29', 1, 11, '2017-12-13 17:20:29'),
(6, 'POS Credit Card', 35, '2018-08-11 19:23:31', 1, 35, '2018-08-11 19:23:31');

-- --------------------------------------------------------

--
-- Table structure for table `payment_status`
--

CREATE TABLE `payment_status` (
  `id` int(11) NOT NULL,
  `names` varchar(250) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `payment_status`
--

INSERT INTO `payment_status` (`id`, `names`, `updated_by`, `updated_date`, `status`, `created_by`, `created_date`) VALUES
(1, 'Paid', 1, '2019-06-03 11:34:41', 1, 1, '2019-05-17 08:50:14'),
(2, 'Pending', NULL, NULL, 1, 1, '2019-05-17 08:50:26'),
(3, 'Overdue', NULL, NULL, 1, 1, '2019-05-17 08:50:35'),
(4, 'Expired', 1, '2019-06-03 11:35:57', 1, 1, '2019-05-17 08:50:47');

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE `payment_type` (
  `id` int(11) NOT NULL,
  `names` varchar(250) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `payment_type`
--

INSERT INTO `payment_type` (`id`, `names`, `updated_by`, `updated_date`, `status`, `created_by`, `created_date`) VALUES
(1, 'Pre-payment', 1, '2019-07-03 13:30:09', 1, 11, '2017-12-13 17:20:41'),
(2, 'Cash on Arrival', 1, '2019-07-03 13:30:40', 1, 11, '2017-12-13 17:20:46'),
(3, 'Before check out', 1, '2019-07-03 13:30:45', 1, 11, '2017-12-13 17:20:52'),
(4, 'Credit', 1, '2019-07-03 13:30:48', 1, 11, '2017-12-13 17:20:59'),
(5, 'Deposit', 1, '2019-07-03 13:31:03', 1, 11, '2017-12-13 17:21:05');

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `id` int(11) NOT NULL,
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
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_data`
--

CREATE TABLE `payroll_data` (
  `id` int(11) NOT NULL,
  `id_payroll` int(11) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_request`
--

CREATE TABLE `payroll_request` (
  `id` int(11) NOT NULL,
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
  `grand_total_total_net_pay_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payroll_request`
--

INSERT INTO `payroll_request` (`id`, `date`, `id_year`, `id_month`, `total_amount`, `id_prepared_by`, `status`, `updated_by`, `updated_date`, `created_by`, `created_date`, `grand_total_basic_salary`, `grand_total_probation_pass_amount`, `grand_total_probation_working_day`, `grand_total_probation_per_day_amount`, `grand_total_probation_pass_total_amount`, `grand_total_absent`, `grand_total_absent_deduct_amount`, `grand_total_advance_deduct_amount`, `grand_total_increase_amount`, `grand_total_other_amount`, `grand_total_balance_amount`, `grand_total_service_charge_amount`, `grand_total_bonus_amount`, `grand_total_net_pay_amount`, `grand_total_tip_amount`, `grand_total_total_net_pay_amount`) VALUES
(1, '2019-08-19', 1, 8, NULL, '1', 3, NULL, NULL, 12, '2019-08-19 15:38:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_request_data`
--

CREATE TABLE `payroll_request_data` (
  `id` int(11) NOT NULL,
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
  `remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_request_status`
--

CREATE TABLE `payroll_request_status` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `css_class` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payroll_request_status`
--

INSERT INTO `payroll_request_status` (`id`, `name`, `css_class`, `status`) VALUES
(1, 'Approved', 'label label-info', 1),
(2, 'Requested', 'label label-primary', 1),
(3, 'Preparing', 'label label-danger', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_status`
--

CREATE TABLE `payroll_status` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `css_class` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payroll_status`
--

INSERT INTO `payroll_status` (`id`, `name`, `css_class`, `status`) VALUES
(1, 'Approved', 'label label-info', 1),
(2, 'Paid', 'label label-primary', 1),
(3, 'Rejected', 'label label-danger', 1),
(4, 'Waiting for Approval', 'label label-mint', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_type`
--

CREATE TABLE `payroll_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payroll_type`
--

INSERT INTO `payroll_type` (`id`, `name`, `status`, `updated_by`, `updated_date`, `created_by`, `created_date`) VALUES
(1, 'Basic Salary', 1, NULL, NULL, NULL, NULL),
(2, 'Overtime', 1, NULL, NULL, NULL, NULL),
(3, 'Allowance', 1, NULL, NULL, NULL, NULL),
(4, 'Deduct', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pay_period`
--

CREATE TABLE `pay_period` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pay_period`
--

INSERT INTO `pay_period` (`id`, `name`) VALUES
(1, '1 month'),
(2, '2 months'),
(3, '3 months'),
(4, '4 months'),
(5, '5 months'),
(6, '6 months');

-- --------------------------------------------------------

--
-- Table structure for table `permission_action`
--

CREATE TABLE `permission_action` (
  `id` int(11) NOT NULL,
  `user_type_id` int(11) DEFAULT NULL,
  `permission_menu_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_action`
--

INSERT INTO `permission_action` (`id`, `user_type_id`, `permission_menu_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 3, 6),
(21, 1, 20),
(22, 1, 21),
(23, 1, 22),
(24, 1, 23),
(25, 1, 24),
(26, 1, 25),
(27, 1, 26),
(28, 1, 27),
(29, 1, 28),
(30, 1, 29),
(31, 1, 30),
(32, 1, 31),
(33, 1, 32),
(34, 1, 33),
(35, 1, 34),
(36, 1, 35),
(37, 1, 36),
(38, 1, 37),
(39, 1, 38),
(40, 1, 39),
(41, 1, 40),
(42, 1, 41),
(43, 1, 42),
(44, 1, 43),
(45, 1, 44),
(46, 1, 45),
(47, 1, 46),
(48, 1, 47),
(49, 1, 48),
(50, 1, 49),
(51, 1, 50),
(52, 1, 51),
(53, 1, 52),
(54, 1, 53),
(55, 1, 54),
(56, 1, 55),
(57, 1, 56),
(58, 1, 57),
(59, 1, 58),
(60, 1, 59),
(61, 1, 60),
(62, 1, 62);

-- --------------------------------------------------------

--
-- Table structure for table `permission_action_data`
--

CREATE TABLE `permission_action_data` (
  `id` int(11) NOT NULL,
  `id_permission_action` int(11) DEFAULT NULL,
  `allow_action` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_action_data`
--

INSERT INTO `permission_action_data` (`id`, `id_permission_action`, `allow_action`) VALUES
(1, 1, 'index,detail,view,update'),
(2, 2, 'subscriber,subscriber-detail'),
(3, 3, 'index'),
(4, 4, 'index'),
(5, 5, 'index'),
(6, 6, 'index,subscriber'),
(7, 7, 'index'),
(8, 8, 'index'),
(9, 9, 'index'),
(10, 10, 'index'),
(11, 12, 'index'),
(12, 12, 'index'),
(13, 13, 'index'),
(14, 14, 'index'),
(15, 15, 'index'),
(16, 16, 'index'),
(17, 17, 'index'),
(18, 18, 'index'),
(19, 19, 'index'),
(20, 20, 'index,validation'),
(21, 21, 'index'),
(22, 22, 'index'),
(23, 23, 'index'),
(24, 24, 'index'),
(25, 25, 'index'),
(26, 26, 'index'),
(27, 27, 'index'),
(28, 28, 'index'),
(29, 29, 'index'),
(30, 30, 'index'),
(31, 31, 'index'),
(32, 32, 'index'),
(33, 33, 'index'),
(34, 34, 'index'),
(35, 35, 'index'),
(36, 36, 'index'),
(37, 37, 'index'),
(38, 38, 'index,update'),
(39, 39, 'index,update'),
(40, 40, 'index'),
(41, 41, 'index'),
(42, 42, 'index'),
(43, 43, 'index'),
(44, 44, 'index'),
(45, 45, 'index'),
(46, 46, 'index'),
(47, 47, 'index'),
(48, 48, 'index'),
(49, 49, 'index'),
(50, 50, 'index'),
(51, 51, 'index'),
(52, 52, 'index'),
(53, 53, 'index'),
(54, 54, 'index'),
(55, 55, 'index'),
(56, 56, 'index'),
(57, 57, 'index'),
(58, 58, 'index'),
(59, 59, 'index'),
(60, 60, 'index');

-- --------------------------------------------------------

--
-- Table structure for table `permission_menu`
--

CREATE TABLE `permission_menu` (
  `id` int(11) NOT NULL,
  `is_parent` tinyint(1) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `menu_name` varchar(100) DEFAULT NULL,
  `menu_icon` varchar(50) DEFAULT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `css_class` varchar(500) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `contoller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_menu`
--

INSERT INTO `permission_menu` (`id`, `is_parent`, `parent_id`, `menu_name`, `menu_icon`, `menu_url`, `css_class`, `status`, `contoller`, `action`, `sort`) VALUES
(1, 1, 1, 'Dashboard', 'demo-pli-home', 'site/index', 'index dashboard', 1, 'site', 'index', 1),
(2, 1, 2, 'Subscriber', 'fa fa-group', 'membership-profile/subscriber', 'membership-profile-subscriber membership-profile-subscriber membership-payment-subscriber membership-event-subscriber membership-document-subscriber', 0, 'membership-profile', 'subscriber', NULL),
(3, 1, 3, 'Event', 'fa fa-calendar', 'event-list/index', 'event-list-index', 0, 'event-list', 'index', NULL),
(4, 1, 4, 'Task', 'fa fa-tasks', 'membership-event/task', 'membership-event-task', 0, 'event-list', 'index', NULL),
(5, 1, 5, 'Payment', 'demo-pli-coin', 'membership-payment/payment', 'membership-payment-payment', 0, 'membership-payment', 'payment', NULL),
(6, 1, 6, 'Document', 'fa fa-file-text-o', 'document/index', 'document-index document-subscriber', 1, 'document', 'index', 12),
(7, 1, 7, 'User', 'demo-pli-male icon-fw', 'user/index', 'user-index', 0, 'user', 'index', 0),
(8, 1, 8, 'Setting', 'demo-pli-gear icon-lg icon-fw', '#', 'company-profile-index payment-status-index data-option-phone-country-code-index data-option-prefix-index marital-status-index country-index city-index payment-method-index', 1, NULL, NULL, 15),
(9, 0, 8, 'Payment Status', NULL, 'payment-status/index', 'payment-status-index', 0, 'payment-status', 'index', 0),
(10, 0, 8, 'Payment For', NULL, 'payment-for/index', 'payment-for-index', 0, 'payment-for', 'index', 0),
(11, 0, 50, 'Position', NULL, 'employee-position/index', 'employee-position-index', 1, 'employee-position', 'index', 0),
(12, 0, 8, 'Permission', NULL, 'permission/index', 'permission-index', 0, 'permission', 'index', 0),
(13, 0, 8, 'Prefix', NULL, 'data-option-prefix/index', 'data-option-prefix-index', 1, 'data-option-prefix', 'index', 0),
(14, 0, 8, 'Phone country code', NULL, 'data-option-phone-country-code/index', 'data-option-phone-country-code-index', 0, 'data-option-phone-country-code', 'index', 0),
(15, 0, 8, 'Marital Status', NULL, 'marital-status/index', 'marital-status-index', 0, 'marital-status', 'index', 0),
(16, 0, 8, 'Country', NULL, 'country/index', 'country-index', 0, 'country', 'index', 0),
(17, 0, 8, 'City', NULL, 'city/index', 'city-index', 1, 'city', 'index', 0),
(18, 0, 8, 'Payment Type', NULL, 'payment-type/index', 'payment-type-index', 0, 'payment-type', 'index', 0),
(19, 0, 8, 'Payment Method', NULL, 'payment-method/index', 'payment-method-index', 0, 'payment-method', 'index', 0),
(20, 1, 0, 'Projects', 'fa fa-cubes', 'project/index', 'project-index', 1, 'project', 'index', 5),
(21, 1, 0, 'Tasks', 'fa fa-tasks', 'task/index', 'task-index', 1, 'task', 'index', 7),
(22, 0, 50, 'Employee', '', 'employee-profile/index', 'employee-profile-index', 1, 'employee-profile', 'index', 0),
(23, 1, 0, 'Customer', 'fa fa-user-o', 'customer-profile/index', 'customer-profile-index', 1, 'customer', 'index', 3),
(24, 1, 0, 'Sale', 'fa fa-balance-scale', '#', 'quotation-index  item-index item-group-index proposal-index contract-index contract-type-index', 1, 'sale', 'index', 6),
(25, 0, 49, 'Expense', 'fa fa-file-text-o', 'expense/index', 'expense-index', 1, 'expense', 'index', 0),
(27, 1, 0, 'Report', 'fa fa-area-chart', 'report/index', 'finance-chart-of-account-index index', 1, 'report', 'index', 14),
(28, 0, 24, 'Items', NULL, 'item/index', 'item-index', 1, 'item', 'index', 0),
(29, 0, 49, 'Invoices', NULL, 'customer-invoice/index', 'customer-invoice-index customer-invoice-view', 1, 'customer-invoice', 'index', 0),
(30, 0, 49, 'Payments', NULL, 'customer-payment/index', 'customer-payment-index customer-payment-view', 1, 'payment', 'index', 0),
(31, 0, 24, 'Contracts', NULL, 'contract/index', 'contract-index', 1, 'contract', 'index', 0),
(32, 0, 24, 'Item Group', NULL, 'item-group/index', 'item-group-index', 1, 'invoice', 'index', 0),
(33, 0, 24, 'Proposal', NULL, 'proposal/index', 'proposal-index', 1, 'invoice', 'index', 0),
(34, 0, 8, 'Company Profile', NULL, 'company-profile/index', 'company-profile-index', 1, 'company-profile', 'index', 0),
(35, 0, 50, 'Knowledge Base', 'fa fa-file-text-o', 'knowledge-base/index', 'knowledge-base-index', 1, 'document', 'index', 0),
(38, 0, 49, 'Account Type', NULL, 'account-type/index', 'account-type-index', 1, NULL, NULL, 0),
(39, 0, 49, 'Chart of Account', NULL, 'chart-account/index', 'chart-account-index', 1, NULL, NULL, 0),
(40, 0, 49, 'Bank', NULL, 'bank/index', 'bank-index', 1, NULL, NULL, 0),
(41, 0, 27, 'Chart of Account', NULL, 'finance-chart-of-account/index', 'finance-chart-of-account-index', 1, NULL, NULL, 0),
(42, 1, 0, 'Supplier', 'demo-pli-male-female', 'supplier-profile/index', 'supplier-profile-index', 1, NULL, NULL, 2),
(43, 0, 24, 'Quotation', NULL, 'quotation/index', 'quotation-index', 1, NULL, NULL, 0),
(44, 1, 0, 'Lead', 'fa fa-tty', 'lead-profile/index', 'lead-profile-index', 1, 'lead-profile', 'index', 4),
(45, 0, 24, 'Contract Type', NULL, 'contract-type/index', 'contract-type-index', 1, 'contract-type', 'index', 0),
(46, 0, 27, 'Sale Report', NULL, 'sale-report/invoice?smMenu=1', 'sale-report-invoice', 1, 'sale-report', 'invoice', 0),
(47, 0, 50, 'Department', NULL, 'department/index', 'department-index', 1, 'department', 'index', 0),
(48, 0, 27, 'Employee Report', NULL, 'employee-report/project?smMenu=1', 'employee-report-project', 1, 'employee-report', 'project', NULL),
(49, 1, 0, 'Finance', 'fa fa-money', '#', 'account-type-index chart-account-index bank-index payroll-index customer-invoice-index customer-invoice-view  customer-payment-index customer-payment-view expense-index', 1, ' ', NULL, 8),
(50, 1, 0, 'Human Resource', 'demo-pli-address-book', '#', 'department-index employee-position-index leave-in-the-year-index leave-application-index payroll-request-index payroll-type-index cash-advance-request-index employee-profile-index knowledge-base-index', 1, 'hr', 'index', 10),
(51, 0, 49, 'Payroll', NULL, 'payroll/index', 'payroll-index', 1, 'payroll', 'index', 0),
(52, 0, 50, 'Cash Advance Request', NULL, 'cash-advance-request/index', 'cash-advance-request-index', 1, 'cash-advance-request', 'index', 0),
(53, 0, 50, 'Payroll Type', NULL, 'payroll-type/index', 'payroll-type-index', 0, 'payroll-type', 'index', 0),
(54, 1, 0, 'Budget Setup', 'demo-pli-coin', 'budget-set-up/index', 'budget-set-up-index', 1, 'budget-set-up', 'index', 11),
(55, 0, 50, 'Leave Application', NULL, 'leave-application/index', 'leave-application-index', 1, 'leave-application', 'index', 0),
(56, 0, 50, 'Payroll Request', NULL, 'payroll-request/index', 'payroll-request-index', 1, 'payroll-request', 'index', 0),
(57, 1, 0, 'S.O.P & K.P.I', 'demo-pli-tactic', 'standard-operation/index', 'standard-operation-index standard-operation-step-index sop-goal-setup-index', 1, 'standard-operation', 'index', 9),
(58, 0, 57, 'S.O.P Step', NULL, 'standard-operation-step/index', 'standard-operation-step-index', 1, 'standard-operation-step', 'index', 0),
(59, 0, 57, 'Goal Setup', '', 'sop-goal-setup/index', 'sop-goal-setup-index', 1, 'sop-goal-setup', 'index', 0),
(60, 0, 57, 'S.O.P', '', 'standard-operation/index', 'standard-operation-index', 1, 'standard-operation', 'index', 0),
(61, 0, 50, 'Leave Setup', NULL, 'leave-in-the-year/index', 'leave-in-the-year-index', 1, 'leave-in-the-year', 'index', 0),
(62, 1, 0, 'User Type & Roles', 'demo-pli-computer-secure', 'user-type/index', 'user-type-index user-type-roles user-type-update', 1, 'user-type', 'index', 13);

-- --------------------------------------------------------

--
-- Table structure for table `priority`
--

CREATE TABLE `priority` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `css_class` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `priority`
--

INSERT INTO `priority` (`id`, `name`, `css_class`) VALUES
(1, 'Low', 'label-primary'),
(2, 'Medium', 'label-info'),
(3, 'High', 'label-warning'),
(4, 'Urgent', 'label-danger');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
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
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `project_name`, `id_customer`, `is_calculate`, `project_progress`, `id_billing_type`, `rate`, `estimated_hour`, `start_date`, `due_date`, `deadline`, `id_priority`, `description`, `cut_off_day`, `note`, `is_pin`, `status`, `updated_by`, `updated_date`, `created_by`, `created_date`) VALUES
(2, 'Dragon Royal Angkor Hotel', 1, 1, NULL, 1, '2000.00', '0.00', '2019-08-14', '2019-08-31', '2019-09-03', 3, '', 3, NULL, 0, 2, NULL, NULL, 23, '2019-08-22 14:37:56');

-- --------------------------------------------------------

--
-- Table structure for table `project_member`
--

CREATE TABLE `project_member` (
  `id` int(11) NOT NULL,
  `id_project` int(11) DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_member`
--

INSERT INTO `project_member` (`id`, `id_project`, `id_employee`) VALUES
(1, 2, 12);

-- --------------------------------------------------------

--
-- Table structure for table `project_note`
--

CREATE TABLE `project_note` (
  `id` int(11) NOT NULL,
  `id_project` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_status`
--

CREATE TABLE `project_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `css_class` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `project_status`
--

INSERT INTO `project_status` (`id`, `name`, `css_class`) VALUES
(1, 'Not Started', 'label-mint'),
(2, 'In Progress', 'label-success'),
(3, 'On Hold', 'label-warning'),
(4, 'Cancelled', 'label-danger'),
(5, 'Finished', 'label-info');

-- --------------------------------------------------------

--
-- Table structure for table `project_tag`
--

CREATE TABLE `project_tag` (
  `id` int(11) NOT NULL,
  `id_project` int(11) DEFAULT NULL,
  `id_tag` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `project_tag`
--

INSERT INTO `project_tag` (`id`, `id_project`, `id_tag`) VALUES
(1, 2, 'Website');

-- --------------------------------------------------------

--
-- Table structure for table `project_timesheet`
--

CREATE TABLE `project_timesheet` (
  `id` int(11) NOT NULL,
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
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_timesheet_description`
--

CREATE TABLE `project_timesheet_description` (
  `id` int(11) NOT NULL,
  `id_project_timesheet` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_timesheet_member`
--

CREATE TABLE `project_timesheet_member` (
  `id` int(11) NOT NULL,
  `id_project_timesheet` int(11) DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `project_timesheet_tag`
--

CREATE TABLE `project_timesheet_tag` (
  `id` int(11) NOT NULL,
  `id_project_timesheet` int(11) DEFAULT NULL,
  `id_tag` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `proposal`
--

CREATE TABLE `proposal` (
  `id` int(11) NOT NULL,
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
  `id_project` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_data`
--

CREATE TABLE `proposal_data` (
  `id` int(11) NOT NULL,
  `id_proposal` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `qty` int(11) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `discount_type` int(11) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_note`
--

CREATE TABLE `proposal_note` (
  `id` int(11) NOT NULL,
  `id_proposal` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_related_to`
--

CREATE TABLE `proposal_related_to` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `proposal_related_to`
--

INSERT INTO `proposal_related_to` (`id`, `name`, `status`) VALUES
(1, 'Customer', 1),
(2, 'Lead', 1);

-- --------------------------------------------------------

--
-- Table structure for table `proposal_status`
--

CREATE TABLE `proposal_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `css_class` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `proposal_status`
--

INSERT INTO `proposal_status` (`id`, `name`, `css_class`) VALUES
(1, 'Draft', 'label-default'),
(2, 'Sent', 'label-success'),
(3, 'Open', 'label-warning'),
(4, 'Revised', 'label-info'),
(5, 'Declined', 'label-danger'),
(6, 'Accepted', 'label-purple');

-- --------------------------------------------------------

--
-- Table structure for table `quotation`
--

CREATE TABLE `quotation` (
  `id` int(11) NOT NULL,
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
  `close_sale_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_data`
--

CREATE TABLE `quotation_data` (
  `id` int(11) NOT NULL,
  `id_quotation` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `qty` int(11) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `discount_type` int(11) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_status`
--

CREATE TABLE `quotation_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `css_class` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `quotation_status`
--

INSERT INTO `quotation_status` (`id`, `name`, `css_class`) VALUES
(1, 'Draft', 'label-default'),
(2, 'Sent', 'label-success'),
(4, 'Expired', 'label-info'),
(5, 'Declined', 'label-danger'),
(6, 'Accepted', 'label-purple');

-- --------------------------------------------------------

--
-- Table structure for table `repeater_type`
--

CREATE TABLE `repeater_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `repeater_type`
--

INSERT INTO `repeater_type` (`id`, `name`) VALUES
(1, 'None'),
(2, 'Day'),
(3, 'Week'),
(4, '2 Weeks'),
(5, '1 Month'),
(6, '2 Months'),
(7, '3 Months'),
(8, '6 Months'),
(9, '1 Year');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `names` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sop_goal_setup`
--

CREATE TABLE `sop_goal_setup` (
  `id` int(11) NOT NULL,
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
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sop_goal_setup`
--

INSERT INTO `sop_goal_setup` (`id`, `id_position`, `id_employee`, `id_sop_step`, `id_sop_step_list`, `id_year`, `quarter_1`, `quarter_2`, `quarter_3`, `quarter_4`, `yearly`, `note`, `status`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 6, 12, 12, 75, 2019, 0, 0, 8, 24, 32, '', NULL, 12, '2019-08-19 09:14:42', 23, '2019-08-22 16:57:23');

-- --------------------------------------------------------

--
-- Table structure for table `sop_goal_setup_data`
--

CREATE TABLE `sop_goal_setup_data` (
  `id` int(11) NOT NULL,
  `id_sop_set_up` int(11) DEFAULT NULL,
  `id_month` int(11) DEFAULT NULL,
  `daily` int(11) DEFAULT NULL,
  `weekly` int(11) DEFAULT NULL,
  `monthly` int(11) DEFAULT NULL,
  `actual_id_month` int(11) DEFAULT NULL,
  `actual_monthly` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sop_goal_setup_data`
--

INSERT INTO `sop_goal_setup_data` (`id`, `id_sop_set_up`, `id_month`, `daily`, `weekly`, `monthly`, `actual_id_month`, `actual_monthly`) VALUES
(25, 2, 1, 0, 0, 0, NULL, NULL),
(26, 2, 2, 0, 0, 0, NULL, NULL),
(27, 2, 3, 0, 0, 0, NULL, NULL),
(28, 2, 4, 0, 0, 0, NULL, NULL),
(29, 2, 5, 0, 0, 0, NULL, NULL),
(30, 2, 6, 0, 0, 0, NULL, NULL),
(31, 2, 7, 0, 0, 0, NULL, NULL),
(32, 2, 8, 0, 0, 1, NULL, NULL),
(33, 2, 9, 0, 0, 1, NULL, NULL),
(34, 2, 10, 0, 0, 1, NULL, NULL),
(35, 2, 11, 0, 0, 1, NULL, NULL),
(36, 2, 12, 0, 0, 1, NULL, NULL),
(49, 1, 1, 0, 0, 0, NULL, NULL),
(50, 1, 2, 0, 0, 0, NULL, NULL),
(51, 1, 3, 0, 0, 0, NULL, NULL),
(52, 1, 4, 0, 0, 0, NULL, NULL),
(53, 1, 5, 0, 0, 0, NULL, NULL),
(54, 1, 6, 0, 0, 0, NULL, NULL),
(55, 1, 7, 0, 0, 0, NULL, NULL),
(56, 1, 8, 0, 1, 4, NULL, NULL),
(57, 1, 9, 0, 1, 4, NULL, NULL),
(58, 1, 10, 0, 1, 8, NULL, NULL),
(59, 1, 11, 0, 1, 8, NULL, NULL),
(60, 1, 12, 0, 1, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `source`
--

CREATE TABLE `source` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `source`
--

INSERT INTO `source` (`id`, `name`, `created_date`, `updated_by`, `created_by`, `updated_date`, `status`) VALUES
(1, 'Facebook', NULL, NULL, NULL, NULL, 1),
(2, 'Google', NULL, NULL, NULL, NULL, 1),
(3, 'Market Research', NULL, NULL, NULL, NULL, 1),
(4, 'Other', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `standard_operation`
--

CREATE TABLE `standard_operation` (
  `id` int(11) NOT NULL,
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
  `id_related_profile` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `standard_operation`
--

INSERT INTO `standard_operation` (`id`, `name`, `assign_to`, `id_employee_possition`, `id_standard_operation_step`, `created_date`, `created_by`, `updated_date`, `updated_by`, `status`, `description`, `start_date`, `due_date`, `deadline`, `id_priority`, `id_related_to`, `id_related_profile`) VALUES
(1, 'Research Client', 3, NULL, 2, '2019-08-17 08:36:55', 14, '2019-08-19 08:49:56', '0000-00-00 00:00:00', NULL, '', '2019-08-16', '2019-08-17', '2019-08-18', 2, NULL, NULL),
(2, 'eOBMS Project', 1, NULL, 4, '2019-08-19 09:29:41', 12, '2019-08-19 13:40:36', '0000-00-00 00:00:00', NULL, '', '2019-08-19', '2019-08-29', '2019-09-07', 4, NULL, NULL),
(3, 'Testing Project on SOP', 3, NULL, 4, '2019-08-19 09:38:23', 14, '2019-08-19 13:49:23', '0000-00-00 00:00:00', NULL, '', '2019-08-20', '2019-08-21', '2019-08-28', 4, NULL, NULL),
(4, 'Testing Project 2', 1, NULL, 4, '2019-08-19 09:44:59', 12, '2019-08-19 13:50:12', '0000-00-00 00:00:00', NULL, '', '2019-08-19', '2019-08-21', '2019-08-28', 3, NULL, NULL),
(5, 'Dragon Royal Angkor Hotel', 12, NULL, 12, '2019-08-22 15:24:09', 23, '2019-08-22 17:07:18', '0000-00-00 00:00:00', NULL, '', '2019-08-14', '2019-08-31', '2019-09-03', 3, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `standard_operation_check_list`
--

CREATE TABLE `standard_operation_check_list` (
  `id` int(11) NOT NULL,
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
  `done_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `standard_operation_check_list`
--

INSERT INTO `standard_operation_check_list` (`id`, `name`, `assign_to`, `id_standard_operation`, `id_standard_operation_step`, `created_date`, `created_by`, `updated_date`, `updated_by`, `status`, `is_done`, `description`, `id_standard_operation_step_list`, `done_date`) VALUES
(3, NULL, NULL, 1, 2, '2019-08-19 08:49:05', 12, NULL, NULL, 1, 1, '', 3, '2019-08-19'),
(4, NULL, NULL, 1, 2, '2019-08-19 08:49:05', 12, NULL, NULL, 1, 0, '', 4, NULL),
(5, NULL, NULL, 1, 1, '2019-08-19 08:49:26', 12, NULL, NULL, 1, 1, '', 1, '2019-08-19'),
(6, NULL, NULL, 1, 1, '2019-08-19 08:49:26', 12, NULL, NULL, 1, 0, '', 2, NULL),
(7, NULL, NULL, 1, 3, '2019-08-19 08:49:56', 12, NULL, NULL, 1, 0, 'not done', 5, NULL),
(9, NULL, NULL, 2, 5, '2019-08-19 09:30:18', 12, NULL, NULL, 1, 1, '', 7, '2019-08-19'),
(11, NULL, NULL, 3, 5, '2019-08-19 09:38:45', 14, NULL, NULL, 1, 1, '', 7, '2019-08-19'),
(12, NULL, NULL, 4, 6, '2019-08-19 09:45:19', 12, NULL, NULL, 1, 0, '', 9, NULL),
(16, NULL, NULL, 2, 4, '2019-08-19 13:40:36', 1, NULL, NULL, 1, 1, '', 8, '2019-08-02'),
(20, NULL, NULL, 3, 4, '2019-08-19 13:49:23', 1, NULL, NULL, 1, 1, 'sfdsf', 8, '2019-08-19'),
(21, NULL, NULL, 4, 4, '2019-08-19 13:50:12', 12, NULL, NULL, 1, 1, '', 8, '2019-09-01'),
(22, NULL, NULL, 5, 11, '2019-08-22 15:24:49', 23, NULL, NULL, 1, 1, '', 52, '2019-08-14'),
(41, NULL, NULL, 5, 12, '2019-08-22 17:06:58', 23, NULL, NULL, 1, 1, '', 75, '2019-08-22'),
(42, NULL, NULL, 5, 12, '2019-08-22 17:06:58', 23, NULL, NULL, 1, 0, '', 76, NULL),
(43, NULL, NULL, 5, 12, '2019-08-22 17:06:58', 23, NULL, NULL, 1, 0, '', 77, NULL),
(44, NULL, NULL, 5, 12, '2019-08-22 17:06:58', 23, NULL, NULL, 1, 0, '', 78, NULL),
(45, NULL, NULL, 5, 12, '2019-08-22 17:06:58', 23, NULL, NULL, 1, 0, '', 79, NULL),
(46, NULL, NULL, 5, 12, '2019-08-22 17:06:58', 23, NULL, NULL, 1, 0, '', 80, NULL),
(47, NULL, NULL, 5, 12, '2019-08-22 17:06:58', 23, NULL, NULL, 1, 0, '', 81, NULL),
(48, NULL, NULL, 5, 12, '2019-08-22 17:06:58', 23, NULL, NULL, 1, 0, '', 82, NULL),
(49, NULL, NULL, 5, 12, '2019-08-22 17:06:58', 23, NULL, NULL, 1, 0, '', 83, NULL),
(50, NULL, NULL, 5, 13, '2019-08-22 17:07:18', 23, NULL, NULL, 1, 1, '', 84, '2019-08-22');

-- --------------------------------------------------------

--
-- Table structure for table `standard_operation_step`
--

CREATE TABLE `standard_operation_step` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_employee_possition` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `css` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `standard_operation_step`
--

INSERT INTO `standard_operation_step` (`id`, `name`, `id_employee_possition`, `created_date`, `created_by`, `updated_date`, `updated_by`, `status`, `css`, `sort`) VALUES
(1, 'Pre Sale', 4, '2019-08-17 08:27:18', 14, '2019-08-17 08:31:54', '0000-00-00 00:00:00', 1, '', NULL),
(2, 'In Sale', 4, '2019-08-17 08:30:29', 14, '2019-08-17 08:45:02', '0000-00-00 00:00:00', 1, '#3399cc', NULL),
(3, 'After Sale', 4, '2019-08-17 08:30:58', 14, '2019-08-17 08:45:26', '0000-00-00 00:00:00', 1, '#339966', NULL),
(4, 'Collect data to analysis', 2, '2019-08-19 09:26:51', 12, '2019-08-19 09:28:02', '0000-00-00 00:00:00', 1, '#339900', NULL),
(5, 'Implementation', 2, '2019-08-19 09:27:37', 12, NULL, NULL, 1, '#3399cc', NULL),
(6, 'Coding', 2, '2019-08-19 09:31:01', 12, NULL, NULL, 1, '#ff3366', NULL),
(7, 'Training', 2, '2019-08-19 09:31:40', 12, '2019-08-19 09:31:58', '0000-00-00 00:00:00', 1, '#3366cc', NULL),
(11, 'Get Information ', 6, '2019-08-22 15:04:30', 23, '2019-08-22 15:36:52', '0000-00-00 00:00:00', 1, '#00ff40', NULL),
(12, 'Flow Processing', 6, '2019-08-22 15:04:31', 23, '2019-08-22 16:36:05', '0000-00-00 00:00:00', 1, '#808080', NULL),
(13, 'Live Website', 6, '2019-08-22 15:17:20', 23, '2019-08-22 16:36:16', '0000-00-00 00:00:00', 1, '#0000a0', NULL),
(14, 'Training Website', 6, '2019-08-22 15:18:16', 23, '2019-08-22 15:39:54', '0000-00-00 00:00:00', 1, '#400080', NULL),
(15, 'Close Project', 6, '2019-08-22 15:18:39', 23, '2019-08-22 16:36:29', '0000-00-00 00:00:00', 1, '#80ffff', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `standard_operation_step_list`
--

CREATE TABLE `standard_operation_step_list` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_standard_operation_step` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `is_track` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `standard_operation_step_list`
--

INSERT INTO `standard_operation_step_list` (`id`, `name`, `id_standard_operation_step`, `created_date`, `created_by`, `updated_date`, `updated_by`, `status`, `sort`, `is_track`) VALUES
(1, 'Proposal Research', 1, '2019-08-17 08:31:54', 14, NULL, NULL, 1, 1, '1'),
(2, 'Presentation', 1, '2019-08-17 08:31:54', 14, NULL, NULL, 1, 2, '1'),
(3, 'Sign Contract', 2, '2019-08-17 08:45:02', 14, NULL, NULL, 1, 1, '1'),
(4, 'Show Presentation', 2, '2019-08-17 08:45:02', 14, NULL, NULL, 1, 2, '1'),
(5, 'Train Client', 3, '2019-08-17 08:45:26', 14, NULL, NULL, 1, 1, '1'),
(7, 'Work with client', 5, '2019-08-19 09:27:37', 12, NULL, NULL, 1, NULL, '1'),
(8, 'Collect data to analysis', 4, '2019-08-19 09:28:02', 12, NULL, NULL, 1, 0, '1'),
(9, 'Coding and Testing', 6, '2019-08-19 09:31:01', 12, NULL, NULL, 1, NULL, '1'),
(11, 'Train Client to use system', 7, '2019-08-19 09:31:58', 12, NULL, NULL, 1, NULL, '1'),
(53, 'Get Information ', 11, '2019-08-22 15:36:52', 23, NULL, NULL, 1, NULL, '0'),
(74, 'Training Website', 14, '2019-08-22 15:39:54', 23, NULL, NULL, 1, NULL, '0'),
(75, 'Design template layout', 12, '2019-08-22 16:36:05', 23, NULL, NULL, 1, NULL, '1'),
(76, 'Client Approve', 12, '2019-08-22 16:36:05', 23, NULL, NULL, 1, NULL, '0'),
(77, 'Coding - Setup Wordpress', 12, '2019-08-22 16:36:05', 23, NULL, NULL, 1, NULL, '0'),
(78, 'Coding - Setup Backend', 12, '2019-08-22 16:36:05', 23, NULL, NULL, 1, NULL, '0'),
(79, 'Coding - Coding', 12, '2019-08-22 16:36:05', 23, NULL, NULL, 1, NULL, '0'),
(80, 'Coding -  Install Plugin', 12, '2019-08-22 16:36:05', 23, NULL, NULL, 1, NULL, '0'),
(81, 'Coding -  Review', 12, '2019-08-22 16:36:05', 23, NULL, NULL, 1, NULL, '0'),
(82, 'Coding -  Tester Review', 12, '2019-08-22 16:36:05', 23, NULL, NULL, 1, NULL, '0'),
(83, 'Coding -  Live Demo', 12, '2019-08-22 16:36:05', 23, NULL, NULL, 1, NULL, '0'),
(84, 'Live Website', 13, '2019-08-22 16:36:16', 23, NULL, NULL, 1, NULL, '1'),
(85, 'Close Project', 15, '2019-08-22 16:36:29', 23, NULL, NULL, 1, NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_profile`
--

CREATE TABLE `supplier_profile` (
  `id` int(11) NOT NULL,
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
  `img_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_profile_tag`
--

CREATE TABLE `supplier_profile_tag` (
  `id` int(11) NOT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  `id_tag` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `system_setting`
--

CREATE TABLE `system_setting` (
  `id` int(11) NOT NULL,
  `active` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system_setting`
--

INSERT INTO `system_setting` (`id`, `active`, `description`) VALUES
(1, 1, '1 => EOT, 2 => EOH, 3 => Other');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
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
  `id_assign_type` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `task_check_list`
--

CREATE TABLE `task_check_list` (
  `id` int(11) NOT NULL,
  `id_task` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `from_time` varchar(20) DEFAULT NULL,
  `to_time` varchar(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `task_member`
--

CREATE TABLE `task_member` (
  `id` int(11) NOT NULL,
  `id_task` int(11) DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `task_related_to`
--

CREATE TABLE `task_related_to` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `task_related_to`
--

INSERT INTO `task_related_to` (`id`, `name`) VALUES
(1, 'Project'),
(2, 'Invoice'),
(3, 'Customer'),
(4, 'Expense'),
(5, 'Contract'),
(6, 'Lead'),
(7, 'Proposal');

-- --------------------------------------------------------

--
-- Table structure for table `task_status`
--

CREATE TABLE `task_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `css_class` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `task_status`
--

INSERT INTO `task_status` (`id`, `name`, `css_class`) VALUES
(1, 'Not Started', 'label-mint'),
(2, 'In Progress', 'label-success'),
(3, 'Testing', 'label-warning'),
(4, 'Awaiting Feedback', 'label-danger'),
(5, 'Complete', 'label-info');

-- --------------------------------------------------------

--
-- Table structure for table `task_tag`
--

CREATE TABLE `task_tag` (
  `id` int(11) NOT NULL,
  `id_task` int(11) DEFAULT NULL,
  `id_tag` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `id` int(11) NOT NULL,
  `tax_name` varchar(255) DEFAULT NULL,
  `value` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`id`, `tax_name`, `value`) VALUES
(1, 'VAT', '5.00');

-- --------------------------------------------------------

--
-- Table structure for table `testing`
--

CREATE TABLE `testing` (
  `id` int(11) NOT NULL,
  `Testing` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `testing`
--

INSERT INTO `testing` (`id`, `Testing`, `status`) VALUES
(1, '23234', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_file`
--

CREATE TABLE `uploaded_file` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `filename` varchar(256) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uploaded_file`
--

INSERT INTO `uploaded_file` (`id`, `name`, `filename`, `size`, `type`, `thumbnail`, `status`) VALUES
(1, 'NoPicAvailable.jpg', '/dropbox/eOCRM/backend/web/backend/uploads/NoPicAvailable.jpg', 28578, 'image/jpeg', '', b'1'),
(2, '60972540_846849689006961_3545995067674066944_n.jpg', 'backend/uploads/users/05/555b4ba7fd1258aa34320e3686ab20_60972540_846849689006961_3545995067674066944_n.jpg', 76838, 'image/jpeg', NULL, b'1'),
(3, 'unnamed.jpg', '/Applications/XAMPP/xamppfiles/htdocs/cataMMS/backend/web/backend/uploads/membership-profile/8b/f617810497fffa1b9e26a9dd8797e6_unnamed.jpg', 13553, 'image/jpeg', NULL, b'1'),
(4, 'photo_2019-07-03_16-12-55.jpg', 'backend/uploads/event-list/97/8f546546017eb68282e1b102b547f1_photo_2019-07-03_16-12-55.jpg', 225798, 'image/jpeg', NULL, b'1'),
(5, '60750510_846852822339981_7589377846787702784_n.jpg', 'backend/uploads/users/5d/6766a33e3a850d58d8b3502121a5bf_60750510_846852822339981_7589377846787702784_n.jpg', 30998, 'image/jpeg', NULL, b'1'),
(6, 'B_Profile.jpg', 'backend/uploads/users/c7/9c52f602886ba5c36aea0c4e5517e6_B_Profile.jpg', 130576, 'image/jpeg', NULL, b'1'),
(7, 'have-no-profile-picture-facebook-11.jpg', 'backend/uploads/users/37/eb0bcba3517ddfdd6487849d284166_have-no-profile-picture-facebook-11.jpg', 30666, 'image/jpeg', NULL, b'1'),
(8, 'file.jpg', '/Applications/XAMPP/xamppfiles/htdocs/cataMMS/backend/web/backend/uploads/membership-profile/ad/84d16c39b063c55bf65e8fd83cb1be_file.jpg', 133712, 'image/jpeg', NULL, b'1'),
(10, '65372280_425946121583765_6722478276213735424_n.jpg', '/Applications/XAMPP/xamppfiles/htdocs/cataMMS/backend/web/backend/uploads/membership-profile/5c/f2ed742a017d12c187fa4854489d5d_65372280_425946121583765_6722478276213735424_n.jpg', 74886, 'image/jpeg', NULL, b'1'),
(13, '64928238_1098443577031984_1099220682396401664_o.jpg', '/Applications/XAMPP/xamppfiles/htdocs/cataMMS/backend/web/backend/uploads/membership-profile/68/608b678dbb21dba4ac1477f1d191c9_64928238_1098443577031984_1099220682396401664_o.jpg', 89372, 'image/jpeg', NULL, b'1'),
(14, '65314999_2334304963451496_5645665237064482816_n.jpg', '/Applications/XAMPP/xamppfiles/htdocs/cataMMS/backend/web/backend/uploads/membership-profile/d4/aaf91d6807c4d39d003f1bb4f99e57_65314999_2334304963451496_5645665237064482816_n.jpg', 49284, 'image/jpeg', NULL, b'1'),
(15, '65372280_425946121583765_6722478276213735424_n.jpg', '/Applications/XAMPP/xamppfiles/htdocs/cataMMS/backend/web/backend/uploads/membership-profile/c1/5d34255dfb83a318e897094929e7bf_65372280_425946121583765_6722478276213735424_n.jpg', 74886, 'image/jpeg', NULL, b'1'),
(16, '64928238_1098443577031984_1099220682396401664_o.jpg', '/Applications/XAMPP/xamppfiles/htdocs/cataMMS/backend/web/backend/uploads/membership-profile/fa/4af65178a48dc3ac6809deca53964a_64928238_1098443577031984_1099220682396401664_o.jpg', 89372, 'image/jpeg', NULL, b'1'),
(17, '65372280_425946121583765_6722478276213735424_n.jpg', 'backend/uploads/users/6c/6d26d691e6a1b9aee2f6b89bbdce0a_65372280_425946121583765_6722478276213735424_n.jpg', 74886, 'image/jpeg', NULL, b'1'),
(18, '65314999_2334304963451496_5645665237064482816_n.jpg', 'backend/uploads/users/0c/a4899277b2303f14b4d8887c2c1eaa_65314999_2334304963451496_5645665237064482816_n.jpg', 49284, 'image/jpeg', NULL, b'1'),
(19, '65372280_425946121583765_6722478276213735424_n.jpg', '/Applications/XAMPP/xamppfiles/htdocs/cataMMS/backend/web/backend/uploads/users/5d/c0443cbfc55398c593302e30d08563_65372280_425946121583765_6722478276213735424_n.jpg', 74886, 'image/jpeg', NULL, b'1'),
(20, 'comple.png', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/users/fc/a4d1c2a20d1983172a336362972c81_comple.png', 355615, 'image/png', NULL, b'1'),
(21, 'evan.png', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/employee-profile/46/0df142f1c8925ae900e0fab2b09f93_evan.png', 213820, 'image/png', NULL, b'1'),
(22, 'logo transparent.png', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/company-profile/09/19e6e56406ac6dc57bd9f8b21c4c9b_logo transparent.png', 45796, 'image/png', NULL, b'1'),
(23, 'Screen Shot 2019-07-25 at 10.22.02 AM.png', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/supplier-profile/f4/da5c0e81f7c91f4a6ebd407b0e753e_Screen Shot 2019-07-25 at 10.22.02 AM.png', 798665, 'image/png', NULL, b'1'),
(24, 'logo_makro.png', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/supplier-profile/3d/80ca2d3ed023d74aa2b9ca019f92f2_logo_makro.png', 10132, 'image/png', NULL, b'1'),
(25, 'DWfoXv3UMAEo7Kj.jpg', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/expense-attachment/39/7403dc6c9473eadd42325037fbcd32_DWfoXv3UMAEo7Kj.jpg', 113405, 'image/jpeg', NULL, b'1'),
(26, '2019-07-22 14.51.33.jpg', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/employee-profile/a0/1401866964196853ecc3bc5cc4a5e7_2019-07-22 14.51.33.jpg', 206079, 'image/jpeg', NULL, b'1'),
(27, '3feea1b3-2149-4103-a10e-95e7da8ac7eb.jpg', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/employee-profile/89/b55e3eb71ccc4e07994e8d3d1c7e8c_3feea1b3-2149-4103-a10e-95e7da8ac7eb.jpg', 31008, 'image/jpeg', NULL, b'1'),
(28, '2019-07-22 14.51.33.jpg', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/employee-profile/2c/78f5722b135940cf7dc593aeb8280d_2019-07-22 14.51.33.jpg', 206079, 'image/jpeg', NULL, b'1'),
(29, 'earth.png', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/employee-profile/f6/9a3e3e5cead7c46bf848651e203080_earth.png', 1304, 'image/png', NULL, b'1'),
(30, 'skype.jpg', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/employee-profile/89/e65fa122537109ce2c6763566c15a6_skype.jpg', 195165, 'image/jpeg', NULL, b'1'),
(31, 'maco.png', '/home2/ab5601/eot-bms.eocambotechnology.com/backend/web/backend/uploads/employee-profile/c0/eb1d8b6bd8130b60829e202fcc9f5d_maco.png', 1272412, 'image/png', NULL, b'1'),
(32, 'd.jpg', '/home2/ab5601/eot-bms.eocambotechnology.com/backend/web/backend/uploads/employee-profile/eb/1003bb4f3b18f3bb7008c36b2a5884_d.jpg', 162827, 'image/jpeg', NULL, b'1'),
(33, 'Profile.jpg', '/home2/ab5601/eot-bms.eocambotechnology.com/backend/web/backend/uploads/employee-profile/32/aad17734dcadde9139fd43873e5842_Profile.jpg', 386538, 'image/jpeg', NULL, b'1'),
(34, '_MG_5356.png', '/home2/ab5601/eot-bms.eocambotechnology.com/backend/web/backend/uploads/employee-profile/77/380ff7cc5e2cb904dbd29f79ee7eb2__MG_5356.png', 8684262, 'image/png', NULL, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
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
  `id_position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_type_id`, `email`, `password_hash`, `password_reset_token`, `auth_key`, `status`, `created_by`, `created_date`, `updated_date`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `first_name`, `last_name`, `gender`, `telephone`, `img_url`, `username`, `membership_id`, `id_employee`, `id_position`) VALUES
(1, 1, 'admin@eocambo.com', '$2y$13$58f7hH5s7s9X.R/V7fge2.gdJ0Wmr9bqjYHz0yuQtlEapokTIsH46', NULL, '8tdRr0KstxcAKFdZ00UWb_SjnK73M5uz', 1, 1, '2019-07-10 20:07:12', '2019-07-17 08:38:48', 1, NULL, NULL, NULL, 'Saody', 'Phal', '', '', '20', 'Superadmin', 2, NULL, NULL),
(12, 1, 'pov@eocambo.com', '$2y$13$d23ealFT5MPlMCVu9Z7sUubxy5ZXVWAm98MA1FJ/mlYSA/ca0OKcS', NULL, 'Rf-bG_nU_70CyzceIIapXAUpx4UpeILm', 1, 1, '2019-08-03 08:46:40', '2019-08-21 09:46:58', 1, NULL, NULL, NULL, 'Men', 'Robaer', 'Mr.', '069 544 447', '30', 'pov', NULL, 1, 2),
(13, 1, 'theombuntheoun@gmail.com', '$2y$13$Y58iBFL0PZzIgidLax8IZucekYHGIRVup.jgsfQU0J8rTJ/eezOAS', NULL, 'Fpy-y1dvp0kfnRc56akluz9qbZoVVUt9', 1, 1, '2019-08-03 08:49:44', '2019-08-22 14:13:34', 13, NULL, NULL, NULL, 'THEOM', 'Buntheoun (Maco)', 'Mr.', '010 448 054', '31', 'maco', NULL, 2, 1),
(14, 1, 'saody@eocambo.com', '$2y$13$W.aoVk3bGZH93ubKSMMwDuMxvf9q6HoRPnR5pMGkca2uH8X2SWhpO', NULL, 'P1DFwum5q38BSsizwXu4MSpbLo8VrnUk', 1, 12, '2019-08-03 08:52:43', '2019-08-22 14:25:54', 14, NULL, NULL, NULL, 'Saody', 'Phal', 'Mr.', '087 691 777', '32', 'saody', NULL, 3, 2),
(15, 1, 'maranet@eocambo.com', '$2y$13$lsJMeYL61MK6V4nDtDbUMOdY1ntWiE/C2ndfqd7e37vie4U.bgNBC', NULL, 'hwxS7cdTYDYZpaOT8ON53ODAJV0tQJje', 1, 12, '2019-08-03 09:25:09', '2019-08-15 14:53:43', 12, NULL, NULL, NULL, 'Maranet', 'Mey', 'Ms.', '086 907 907', '27', 'maranet', NULL, 4, 6),
(16, 1, 'bunchhay@eocambo.com', '$2y$13$7gaL7fvDgv13amFWcrArP.zZlgrNa9xm3EyLBc2zMNZAFoi3Yi7nK', NULL, 'Zpkul0nRjvHz48inFEEid8UzrlOJ9wg2', 1, 1, '2019-08-05 13:40:28', '2019-08-05 14:41:34', 15, NULL, NULL, NULL, 'Bunchhay', 'Yoeurn ', 'Mr.', '096 596 33 22', '7', 'chhay', NULL, 5, 5),
(17, 1, 'dararith365@gmail.com', '$2y$13$itvnjfF6qtHjZTRp/OPloOZAReiRrdq0N7BQ8Yxe6QLHlbsU5WX7O', NULL, '8w-ikPA_w0do-pLmoSceY1hEG4pdq74G', 1, 1, '2019-08-05 13:53:45', '2019-08-05 14:42:04', 15, NULL, NULL, NULL, 'Dararith', 'Kreom ', 'Mr.', '096 858 57 89', '8', 'rith', NULL, 6, 2),
(18, 1, 'chhunrachhen961@gmail.com', '$2y$13$X7DdWsNf03.yZ22zXEW1JuKGP4h8vqZYGj4.FMKK6gzAvWqtrz.am', NULL, 'iGU4J072wKOagdpC4fkBhNlNZl9mSOCL', 1, 1, '2019-08-05 14:05:36', '2019-08-05 14:42:28', 15, NULL, NULL, NULL, 'Rachhen', 'Chhun ', 'Mr.', '096 967 4239', '9', 'chhen', NULL, 7, 2),
(19, 1, 'pengai.ear@gmail.com', '$2y$13$acAyrlMNJHV.Y25z3GFy8eKPlPIUTJnyOzRYgODrRv/w09tmz31oi', NULL, 'JjKcqTklLy6x4LDQ4sZQOk90b43FR76y', 1, NULL, '2019-08-05 14:08:38', '2019-08-05 14:42:57', 15, NULL, NULL, NULL, 'Peng Ai', 'Ear ', 'Mr.', '070 914 156', '10', 'ai', NULL, 8, 2),
(20, 1, 'rithyraeck@eocambo.com', '$2y$13$I2YODh7bhBmEAvo8CWeUn.M/rXTnMf96KkWac9DbcALaH6rCrthLu', NULL, 'uUa9IH8AXY7SA-EY-X52GeDXKfUPqL2q', 1, 15, '2019-08-05 14:18:58', '2019-08-23 11:25:01', 20, NULL, NULL, NULL, 'Rithyraeck', 'SOEUNG', 'Mr.', '095/010 80 85 90', '34', 'raeck', NULL, 9, 7),
(21, 1, 'measmengtry@eocambo.com', '$2y$13$gCv1If5FmaqZnCmMtC9gB.vUMy.Hu/OmwCwJTMd9oK9AHB1GRzT8y', NULL, 'iaw8jkqB4DbjmXGWPBzoCq71ZuyR8qP0', 1, 15, '2019-08-05 14:22:11', '2019-08-05 14:43:49', 15, NULL, NULL, NULL, 'Mengtry', 'Meas ', 'Mr.', '092 30 50 85', '12', 'try', NULL, 10, 2),
(22, 1, 'uan.theany@gmail.com', '$2y$13$HzMe4QmJscrMu1oNBNyg/ublnvzJUzgLMt//2we2VcxdMcAsIsSSK', NULL, 'GRlVmU9jS5HKRbJK79beVDAxwaGwYIVF', 1, 15, '2019-08-05 14:24:41', NULL, NULL, NULL, NULL, NULL, 'Theany', 'Uan ', 'Mrs.', '070 307 888', NULL, 'theany', NULL, 11, 4),
(23, 1, 'pholly@eocambo.com', '$2y$13$7l3prKNYiDPMhcEtiMXH/e5MvX.YC4Hjpr4kXogL78NpzZzIzuKvO', NULL, 'pmKtq_3PvPoM_Ugcw4wbuP08LxPofAye', 1, 15, '2019-08-05 14:26:48', '2019-08-22 14:34:55', 23, NULL, NULL, NULL, 'Pholly', 'Chinh ', 'Mr.', '010 328 929', NULL, 'pholly', NULL, 12, 6),
(24, 1, 'mollikaou070@gmail.com', '$2y$13$arnf/5tTifYV88Lii/wGv.u37WOo1NxFYLulVhJN5/5vjx4vLy9J6', NULL, 'J9rsOMGsCA9j9lNs5q9oPzXtcaG0vCZv', 1, 15, '2019-08-05 14:30:07', NULL, NULL, NULL, NULL, NULL, 'Mollika ', 'Ou ', 'Ms.', '070 609 640', NULL, 'mollika', NULL, 13, 7),
(25, 1, 'ranick252001@gmail.com', '$2y$13$TKfQi1/50HbT4SR5UaTdXOQl86WPbzQifpjc86z2OZjXRWk64JYb.', NULL, '-cu_3psptTGpc-dDoTeg8WS2dY5P6iO4', 1, 15, '2019-08-05 14:31:59', NULL, NULL, NULL, NULL, NULL, 'Soranick', 'Sen ', 'Ms.', '095 623 523', NULL, 'ranick', NULL, 14, 7),
(26, 1, 'hohong0005@gmail.com', '$2y$13$h56KOfGP1H5cCgqUqPRO8OXwPHApKYB90Wd7M8vQChbraNi1p4nnS', NULL, 'tOnhnC4GxJehxZooaYg-7y4_BUpoP8K3', 1, 15, '2019-08-05 14:33:38', NULL, NULL, NULL, NULL, NULL, 'Hong', 'Ho ', 'Ms.', '098 440 005', NULL, 'hong', NULL, 15, 7);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` int(11) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `user_type_name` varchar(500) DEFAULT NULL,
  `default_view_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `status`, `user_type_name`, `default_view_id`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, b'1', 'Super Admin', 1, NULL, NULL, NULL, NULL),
(2, b'1', 'Admin', 1, NULL, NULL, NULL, NULL),
(3, b'1', 'User', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `year_list`
--

CREATE TABLE `year_list` (
  `id` int(11) NOT NULL,
  `name` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `year_list`
--

INSERT INTO `year_list` (`id`, `name`) VALUES
(1, '2019'),
(2, '2020'),
(3, '2021'),
(4, '2022'),
(5, '2023'),
(6, '2024'),
(7, '2025'),
(8, '2026'),
(9, '2027'),
(10, '2028'),
(11, '2029'),
(12, '2030');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_type`
--
ALTER TABLE `account_type`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `bank_account_type`
--
ALTER TABLE `bank_account_type`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `billing_type`
--
ALTER TABLE `billing_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_setup_value`
--
ALTER TABLE `budget_setup_value`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_set_up`
--
ALTER TABLE `budget_set_up`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_set_up_data`
--
ALTER TABLE `budget_set_up_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_advance_request`
--
ALTER TABLE `cash_advance_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chart_account`
--
ALTER TABLE `chart_account`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_country` (`id_country`) USING BTREE,
  ADD KEY `id` (`id`,`id_country`,`code`,`names`,`description`,`img`,`video_link`,`latitude`,`longitude`,`updated_by`,`updated_date`,`status`,`created_by`,`created_date`) USING BTREE,
  ADD KEY `id_2` (`id`,`id_country`,`code`,`names`,`description`,`img`,`video_link`,`latitude`,`longitude`,`updated_by`,`updated_date`,`status`,`created_by`,`created_date`) USING BTREE;

--
-- Indexes for table `company_profile`
--
ALTER TABLE `company_profile`
  ADD PRIMARY KEY (`id`,`names`);

--
-- Indexes for table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_note`
--
ALTER TABLE `contract_note`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `contract_type`
--
ALTER TABLE `contract_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `names` (`names`) USING BTREE,
  ADD KEY `id_area` (`id_area`) USING BTREE;

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_group`
--
ALTER TABLE `customer_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_invoice`
--
ALTER TABLE `customer_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_invoice_data`
--
ALTER TABLE `customer_invoice_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_invoice_tag`
--
ALTER TABLE `customer_invoice_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_payment`
--
ALTER TABLE `customer_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_profile`
--
ALTER TABLE `customer_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_profile_contact`
--
ALTER TABLE `customer_profile_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_profile_group`
--
ALTER TABLE `customer_profile_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_profile_note`
--
ALTER TABLE `customer_profile_note`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `customer_profile_solution`
--
ALTER TABLE `customer_profile_solution`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_profile_status`
--
ALTER TABLE `customer_profile_status`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `customer_solution_status`
--
ALTER TABLE `customer_solution_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_option_phone_number_country_code`
--
ALTER TABLE `data_option_phone_number_country_code`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `data_option_prefix`
--
ALTER TABLE `data_option_prefix`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_format`
--
ALTER TABLE `document_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_position`
--
ALTER TABLE `employee_position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_profile`
--
ALTER TABLE `employee_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_list`
--
ALTER TABLE `event_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_data`
--
ALTER TABLE `expense_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_related_to`
--
ALTER TABLE `expense_related_to`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_chart_of_account`
--
ALTER TABLE `finance_chart_of_account`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `finance_chart_of_account_amount`
--
ALTER TABLE `finance_chart_of_account_amount`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `folder`
--
ALTER TABLE `folder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hls_solutions`
--
ALTER TABLE `hls_solutions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_status`
--
ALTER TABLE `invoice_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_group`
--
ALTER TABLE `item_group`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `knowledge_base`
--
ALTER TABLE `knowledge_base`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `knowledge_base_position`
--
ALTER TABLE `knowledge_base_position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_profile`
--
ALTER TABLE `lead_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_profile_note`
--
ALTER TABLE `lead_profile_note`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `leave_application`
--
ALTER TABLE `leave_application`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `leave_in_the_year`
--
ALTER TABLE `leave_in_the_year`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_in_the_year_data`
--
ALTER TABLE `leave_in_the_year_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_role`
--
ALTER TABLE `leave_role`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `leave_status`
--
ALTER TABLE `leave_status`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `leave_type_condition`
--
ALTER TABLE `leave_type_condition`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `leave_type_name`
--
ALTER TABLE `leave_type_name`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `marital_status`
--
ALTER TABLE `marital_status`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `membership_document`
--
ALTER TABLE `membership_document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membership_event`
--
ALTER TABLE `membership_event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membership_payment`
--
ALTER TABLE `membership_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membership_profile`
--
ALTER TABLE `membership_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membership_type`
--
ALTER TABLE `membership_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `milestone_data`
--
ALTER TABLE `milestone_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `month_list`
--
ALTER TABLE `month_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_for`
--
ALTER TABLE `payment_for`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `payment_status`
--
ALTER TABLE `payment_status`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_data`
--
ALTER TABLE `payroll_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_request`
--
ALTER TABLE `payroll_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_request_data`
--
ALTER TABLE `payroll_request_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_request_status`
--
ALTER TABLE `payroll_request_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_status`
--
ALTER TABLE `payroll_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_type`
--
ALTER TABLE `payroll_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pay_period`
--
ALTER TABLE `pay_period`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_action`
--
ALTER TABLE `permission_action`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_action_data`
--
ALTER TABLE `permission_action_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_menu`
--
ALTER TABLE `permission_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `priority`
--
ALTER TABLE `priority`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_member`
--
ALTER TABLE `project_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_note`
--
ALTER TABLE `project_note`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_status`
--
ALTER TABLE `project_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_tag`
--
ALTER TABLE `project_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_timesheet`
--
ALTER TABLE `project_timesheet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_timesheet_description`
--
ALTER TABLE `project_timesheet_description`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_timesheet_member`
--
ALTER TABLE `project_timesheet_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_timesheet_tag`
--
ALTER TABLE `project_timesheet_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proposal`
--
ALTER TABLE `proposal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proposal_data`
--
ALTER TABLE `proposal_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proposal_note`
--
ALTER TABLE `proposal_note`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proposal_related_to`
--
ALTER TABLE `proposal_related_to`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proposal_status`
--
ALTER TABLE `proposal_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation`
--
ALTER TABLE `quotation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_data`
--
ALTER TABLE `quotation_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_status`
--
ALTER TABLE `quotation_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repeater_type`
--
ALTER TABLE `repeater_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sop_goal_setup`
--
ALTER TABLE `sop_goal_setup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sop_goal_setup_data`
--
ALTER TABLE `sop_goal_setup_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `source`
--
ALTER TABLE `source`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `standard_operation`
--
ALTER TABLE `standard_operation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standard_operation_check_list`
--
ALTER TABLE `standard_operation_check_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standard_operation_step`
--
ALTER TABLE `standard_operation_step`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standard_operation_step_list`
--
ALTER TABLE `standard_operation_step_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_profile`
--
ALTER TABLE `supplier_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_profile_tag`
--
ALTER TABLE `supplier_profile_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_setting`
--
ALTER TABLE `system_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_check_list`
--
ALTER TABLE `task_check_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_member`
--
ALTER TABLE `task_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_related_to`
--
ALTER TABLE `task_related_to`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_status`
--
ALTER TABLE `task_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_tag`
--
ALTER TABLE `task_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testing`
--
ALTER TABLE `testing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploaded_file`
--
ALTER TABLE `uploaded_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `year_list`
--
ALTER TABLE `year_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_type`
--
ALTER TABLE `account_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `bank_account_type`
--
ALTER TABLE `bank_account_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `billing_type`
--
ALTER TABLE `billing_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `budget_setup_value`
--
ALTER TABLE `budget_setup_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `budget_set_up`
--
ALTER TABLE `budget_set_up`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `budget_set_up_data`
--
ALTER TABLE `budget_set_up_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_advance_request`
--
ALTER TABLE `cash_advance_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chart_account`
--
ALTER TABLE `chart_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=276;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=362;

--
-- AUTO_INCREMENT for table `company_profile`
--
ALTER TABLE `company_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contract`
--
ALTER TABLE `contract`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_note`
--
ALTER TABLE `contract_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_type`
--
ALTER TABLE `contract_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_group`
--
ALTER TABLE `customer_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer_invoice`
--
ALTER TABLE `customer_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_invoice_data`
--
ALTER TABLE `customer_invoice_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_invoice_tag`
--
ALTER TABLE `customer_invoice_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_payment`
--
ALTER TABLE `customer_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_profile`
--
ALTER TABLE `customer_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;

--
-- AUTO_INCREMENT for table `customer_profile_contact`
--
ALTER TABLE `customer_profile_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_profile_group`
--
ALTER TABLE `customer_profile_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customer_profile_note`
--
ALTER TABLE `customer_profile_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_profile_solution`
--
ALTER TABLE `customer_profile_solution`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=739;

--
-- AUTO_INCREMENT for table `customer_profile_status`
--
ALTER TABLE `customer_profile_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer_solution_status`
--
ALTER TABLE `customer_solution_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `data_option_phone_number_country_code`
--
ALTER TABLE `data_option_phone_number_country_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT for table `data_option_prefix`
--
ALTER TABLE `data_option_prefix`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `document_format`
--
ALTER TABLE `document_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employee_position`
--
ALTER TABLE `employee_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employee_profile`
--
ALTER TABLE `employee_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `event_list`
--
ALTER TABLE `event_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_data`
--
ALTER TABLE `expense_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_related_to`
--
ALTER TABLE `expense_related_to`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `finance_chart_of_account`
--
ALTER TABLE `finance_chart_of_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `finance_chart_of_account_amount`
--
ALTER TABLE `finance_chart_of_account_amount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `folder`
--
ALTER TABLE `folder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `hls_solutions`
--
ALTER TABLE `hls_solutions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `invoice_status`
--
ALTER TABLE `invoice_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `item_group`
--
ALTER TABLE `item_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `knowledge_base`
--
ALTER TABLE `knowledge_base`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `knowledge_base_position`
--
ALTER TABLE `knowledge_base_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_profile`
--
ALTER TABLE `lead_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lead_profile_note`
--
ALTER TABLE `lead_profile_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_application`
--
ALTER TABLE `leave_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `leave_in_the_year`
--
ALTER TABLE `leave_in_the_year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `leave_in_the_year_data`
--
ALTER TABLE `leave_in_the_year_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `leave_role`
--
ALTER TABLE `leave_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leave_status`
--
ALTER TABLE `leave_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `leave_type_condition`
--
ALTER TABLE `leave_type_condition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leave_type_name`
--
ALTER TABLE `leave_type_name`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `marital_status`
--
ALTER TABLE `marital_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `membership_document`
--
ALTER TABLE `membership_document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membership_event`
--
ALTER TABLE `membership_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `membership_payment`
--
ALTER TABLE `membership_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `membership_profile`
--
ALTER TABLE `membership_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `membership_type`
--
ALTER TABLE `membership_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `milestone_data`
--
ALTER TABLE `milestone_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `month_list`
--
ALTER TABLE `month_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payment_for`
--
ALTER TABLE `payment_for`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_status`
--
ALTER TABLE `payment_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_data`
--
ALTER TABLE `payroll_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_request`
--
ALTER TABLE `payroll_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payroll_request_data`
--
ALTER TABLE `payroll_request_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_request_status`
--
ALTER TABLE `payroll_request_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payroll_status`
--
ALTER TABLE `payroll_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payroll_type`
--
ALTER TABLE `payroll_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pay_period`
--
ALTER TABLE `pay_period`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permission_action`
--
ALTER TABLE `permission_action`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `permission_action_data`
--
ALTER TABLE `permission_action_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `permission_menu`
--
ALTER TABLE `permission_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `priority`
--
ALTER TABLE `priority`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project_member`
--
ALTER TABLE `project_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `project_note`
--
ALTER TABLE `project_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_status`
--
ALTER TABLE `project_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `project_tag`
--
ALTER TABLE `project_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `project_timesheet`
--
ALTER TABLE `project_timesheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_timesheet_description`
--
ALTER TABLE `project_timesheet_description`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_timesheet_member`
--
ALTER TABLE `project_timesheet_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_timesheet_tag`
--
ALTER TABLE `project_timesheet_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal`
--
ALTER TABLE `proposal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_data`
--
ALTER TABLE `proposal_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_note`
--
ALTER TABLE `proposal_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_related_to`
--
ALTER TABLE `proposal_related_to`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `proposal_status`
--
ALTER TABLE `proposal_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `quotation`
--
ALTER TABLE `quotation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_data`
--
ALTER TABLE `quotation_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_status`
--
ALTER TABLE `quotation_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `repeater_type`
--
ALTER TABLE `repeater_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sop_goal_setup`
--
ALTER TABLE `sop_goal_setup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sop_goal_setup_data`
--
ALTER TABLE `sop_goal_setup_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `source`
--
ALTER TABLE `source`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `standard_operation`
--
ALTER TABLE `standard_operation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `standard_operation_check_list`
--
ALTER TABLE `standard_operation_check_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `standard_operation_step`
--
ALTER TABLE `standard_operation_step`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `standard_operation_step_list`
--
ALTER TABLE `standard_operation_step_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `supplier_profile`
--
ALTER TABLE `supplier_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `supplier_profile_tag`
--
ALTER TABLE `supplier_profile_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_setting`
--
ALTER TABLE `system_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_check_list`
--
ALTER TABLE `task_check_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_member`
--
ALTER TABLE `task_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_related_to`
--
ALTER TABLE `task_related_to`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `task_status`
--
ALTER TABLE `task_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `task_tag`
--
ALTER TABLE `task_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `uploaded_file`
--
ALTER TABLE `uploaded_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `year_list`
--
ALTER TABLE `year_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`);

--
-- Constraints for table `country`
--
ALTER TABLE `country`
  ADD CONSTRAINT `country_ibfk_1` FOREIGN KEY (`id_area`) REFERENCES `area` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
