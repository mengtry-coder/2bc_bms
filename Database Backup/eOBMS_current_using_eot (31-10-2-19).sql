-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 31, 2019 at 02:53 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eOBMS_current_using_eot`
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
  `default` int(11) NOT NULL DEFAULT 0,
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
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
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

--
-- Dumping data for table `cash_advance_request`
--

INSERT INTO `cash_advance_request` (`id`, `doc_id`, `date`, `id_employee`, `chart_of_account`, `amount`, `amount_in_word`, `reason`, `id_pay_type`, `approved_by`, `status`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 'ADV19090001', '2019-09-17', 1, 38, '0.50', 'POINT FIVE DOLLAR', 'xxx', 1, 1, 1, 1, '2019-09-17 11:05:01', NULL, NULL);

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
(271, 'Lease ? Vehicles', 1, '2018-08-27 22:42:54', 1, 8, NULL, 270, 1, '2018-08-27 22:37:14', NULL, 28100),
(272, 'Lease ? Building', 1, '2018-08-27 22:43:09', 1, 8, NULL, 270, 1, '2018-08-27 22:37:51', NULL, 28200),
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
  `mailing_address` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `quotation_term_and_condition` text DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `vattin` varchar(50) DEFAULT NULL,
  `bill_and_payment` text DEFAULT NULL,
  `what_we_do` text DEFAULT NULL,
  `mission` varchar(500) DEFAULT NULL,
  `vision` varchar(500) DEFAULT NULL,
  `credit_arrangment` text DEFAULT NULL,
  `cancellation_agreement` text DEFAULT NULL,
  `confidentiality` text DEFAULT NULL,
  `info_invoice` text DEFAULT NULL,
  `info_payment` text DEFAULT NULL,
  `info_expense` text DEFAULT NULL,
  `info_bill` text DEFAULT NULL,
  `info_pay_bill` text DEFAULT NULL,
  `info_opening_balance` text DEFAULT NULL,
  `info_journal_entry` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `company_profile`
--

INSERT INTO `company_profile` (`id`, `logo`, `names`, `mailing_address`, `email`, `tel`, `website`, `address`, `description`, `created_date`, `created_by`, `updated_date`, `quotation_term_and_condition`, `updated_by`, `status`, `vattin`, `bill_and_payment`, `what_we_do`, `mission`, `vision`, `credit_arrangment`, `cancellation_agreement`, `confidentiality`, `info_invoice`, `info_payment`, `info_expense`, `info_bill`, `info_pay_bill`, `info_opening_balance`, `info_journal_entry`) VALUES
(1, '8', 'eOcambo Technology', NULL, 'info@eocambo.com', '(+855) 69 955 179', 'www.eocambo.com', 'Street 13, Treang Village, Slor Kram Commune, Krong Siem Reap, Cambodia.', 'eOcambo Technology started in 2014  with a small team partnering with accommodation providers to help  them take control of their online digital marketing and booking management using cutting edge technologies through our Hotel Link Solutions products.\r\n\r\nWe have been expanding and developing rapidly especially over the past 2 years with more solutions available to accommodation providers including offering high quality custom designed websites that become a major driver for any businesses online presence.\r\n\r\nThere is now a very large number of Online Travel Agents (OTA) and other online accommodation third parties where hotels and guesthouses can gain bookings, along with the massive use of Social Media by potential guests eOcambo Technology provides our clients with advice and the tools to navigate through often confusing technologies and increase their bookings and revenue.\r\n\r\neOcambo Technology is based in Siem Reap and is now the leading provider of online digital solutions for all Cambodian accommodation providers and most importantly we have a local Khmer Support Team who are always available to offer advice and back up for our clients.\r\n\r\nOur Mission: Always create innovative solutions that meet our clients expectations.\r\n\r\nOur Vision: Be recognised as the technology company that fulfills the clients needs.', '2019-07-23 09:18:01', 1, '2019-09-18 14:26:14', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', 1, 1, 'CAM-200341', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '<p>We have our own application development team who during this year have created a unique online management system for Travel agents and Tour companies to improve their operations and profitability. This exciting new technology solution will be launched in the second half of 2018 increasing the growth and reputation of eOcambo Technology as the leader in creating innovative solutions for the Cambodian Hospitality Industry.</p>\r\n', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE `contract` (
  `id` int(11) NOT NULL,
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
  `description` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `credit_arrangment` text DEFAULT NULL,
  `cancellation_agreement` text DEFAULT NULL,
  `confidentiality` text DEFAULT NULL,
  `id_discount` int(11) DEFAULT NULL,
  `discount_value` decimal(10,2) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `id_tax` int(11) DEFAULT NULL,
  `is_tax` tinyint(1) DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contract`
--

INSERT INTO `contract` (`id`, `doc_id`, `id_customer`, `id_bank`, `id_item`, `subject`, `contract_value`, `signature`, `id_contract_type`, `start_date`, `end_date`, `description`, `status`, `updated_by`, `updated_date`, `created_by`, `created_date`, `credit_arrangment`, `cancellation_agreement`, `confidentiality`, `id_discount`, `discount_value`, `discount_amount`, `id_tax`, `is_tax`, `tax_amount`, `sub_total`, `total_amount`) VALUES
(1, 'None19090001', 1, 13, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 1, '2019-10-02 14:20:51', 1, '2019-09-18 14:33:33', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', 1, '0.00', '0.00', 1, 0, '0.00', '22.00', '22.00');

-- --------------------------------------------------------

--
-- Table structure for table `contract_customer_contact`
--

CREATE TABLE `contract_customer_contact` (
  `id` int(11) NOT NULL,
  `id_contract` int(11) DEFAULT NULL,
  `id_customer_contact` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `contract_data`
--

CREATE TABLE `contract_data` (
  `id` int(11) NOT NULL,
  `id_contract` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `other_charge` decimal(10,2) DEFAULT NULL,
  `discount_type` int(11) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `contract_data`
--

INSERT INTO `contract_data` (`id`, `id_contract`, `id_item`, `item_name`, `description`, `qty`, `rate`, `other_charge`, `discount_type`, `discount_amount`, `amount`) VALUES
(2, 1, 1, 'eO-BMS (Standard)', '2222', 1, '22.00', '0.00', 1, '0.00', '22.00');

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
  `contract_description` text DEFAULT NULL,
  `credit_arrangment` text DEFAULT NULL,
  `cancellation_agreement` text DEFAULT NULL,
  `confidentiality` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `contract_type`
--

INSERT INTO `contract_type` (`id`, `name`, `note`, `created_by`, `created_date`, `updated_date`, `updated_by`, `status`, `contract_description`, `credit_arrangment`, `cancellation_agreement`, `confidentiality`) VALUES
(2, 'Monthly paid contract', 'wwwwwww', 1, '2019-09-18 14:30:33', NULL, NULL, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `id_area` int(11) DEFAULT NULL,
  `names` varchar(250) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
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
  `term_condition` text DEFAULT NULL,
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

--
-- Dumping data for table `customer_invoice`
--

INSERT INTO `customer_invoice` (`id`, `doc_id`, `date`, `due_date`, `id_customer`, `id_project`, `id_payment_method`, `total_tax`, `id_recurring_invoice`, `recurring_value`, `recurring_type`, `admin_note`, `total_amount`, `receive_amount`, `balance_amount`, `note`, `term_condition`, `status`, `updated_by`, `updated_date`, `created_by`, `created_date`, `currency`, `id_sale_agent`, `client_note`, `id_discount`, `discount_value`, `discount_amount`, `id_tax`, `is_tax`, `tax_amount`, `sub_total`, `is_converted_from_proposal`) VALUES
(1, 'INV19090001', '2019-09-16', '2019-10-16', 1, 1, 1, NULL, 1, NULL, NULL, '', '19.80', '0.00', '19.80', NULL, '', 3, 1, '2019-09-17 09:57:26', 1, '2019-09-16 14:23:26', 1, NULL, '', 1, '10.00', '2.20', 1, 0, '0.00', '22.00', NULL),
(2, 'INV19090002', '2019-09-16', '2019-10-16', 1, 1, 1, NULL, 1, NULL, NULL, '', '19.80', '19.80', '0.00', NULL, '', 1, 1, '2019-09-16 15:34:11', 1, '2019-09-16 15:17:09', 1, NULL, '', 1, '10.00', '2.20', 1, 0, '0.00', '22.00', NULL),
(3, 'INV19090003', '2019-09-17', '2019-10-17', 1, 1, 1, NULL, 1, NULL, NULL, '', '39.60', '0.00', '39.60', NULL, '', 3, 1, '2019-09-17 10:01:19', 1, '2019-09-17 09:57:11', 1, NULL, '', 1, '10.00', '4.40', 1, 0, '0.00', '44.00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_invoice_data`
--

CREATE TABLE `customer_invoice_data` (
  `id` int(11) NOT NULL,
  `id_customer_invoice` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
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
(6, 2, 1, 'eO-BMS (Standard)', '2222', 1, '22.00', 1, '0.00', '22.00'),
(8, 1, 1, 'eO-BMS (Standard)', '2222', 1, '22.00', 1, '0.00', '22.00'),
(10, 3, 1, 'eO-BMS (Standard)', '2222', 2, '22.00', 1, '0.00', '44.00');

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

--
-- Dumping data for table `customer_payment`
--

INSERT INTO `customer_payment` (`id`, `id_customer_invoice`, `id_project`, `doc_id`, `date`, `receive_amount`, `id_payment_method`, `cheque_number`, `clearing_date`, `chart_of_account`, `note`, `status`, `updated_by`, `updated_date`, `created_by`, `created_date`) VALUES
(1, 2, 1, 'REC19090001', '2019-09-16', '19.80', 1, '', NULL, 38, 'testing payment invoice', 0, 1, '2019-09-16 15:34:11', 1, '2019-09-16 15:27:38'),
(2, 2, 1, 'REC19090002', '2019-09-16', '19.80', 1, '', NULL, 38, '', 1, NULL, NULL, 1, '2019-09-16 15:36:01'),
(3, 3, 1, 'REC19090003', '2019-09-17', '22.00', 1, '', NULL, 38, '', 0, 1, '2019-09-17 10:01:19', 1, '2019-09-17 09:57:54');

-- --------------------------------------------------------

--
-- Table structure for table `customer_profile`
--

CREATE TABLE `customer_profile` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(250) DEFAULT NULL,
  `company_name` varchar(250) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
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
  `deactivated_reason` text DEFAULT NULL,
  `deactivated_requested_by` varchar(255) DEFAULT NULL,
  `deactivated_requested_contact_detail` text DEFAULT NULL,
  `deactivated_by` int(11) DEFAULT NULL,
  `id_customer_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `customer_profile`
--

INSERT INTO `customer_profile` (`id`, `customer_name`, `company_name`, `position`, `phone_number`, `email_address`, `latitute`, `longitute`, `address`, `id_country`, `id_city`, `group_names`, `billing_address`, `id_billing_city`, `id_billing_country`, `shipping_address`, `id_shipping_city`, `id_shipping_country`, `status`, `created_by`, `created_date`, `img_url`, `updated_date`, `updated_by`, `zip_code`, `customer_status`, `website_url`, `accommodation_type`, `star_rating`, `number_of_rooms`, `sale_date`, `accomodation_status`, `lived_date`, `passed_by`, `handle_by`, `deactivated_at`, `deactivated_reason`, `deactivated_requested_by`, `deactivated_requested_contact_detail`, `deactivated_by`, `id_customer_type`) VALUES
(1, 'Peter', 'EOH', NULL, '0987654321', 'peter@eoh.com', NULL, NULL, 'SR', NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, 1, 1, '2019-09-16 10:28:03', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2019-10-08', 4, NULL, NULL, NULL, '', '', '', '', NULL, NULL),
(2, 'test', 'Testing customer', NULL, '', 'd@d.d', NULL, NULL, 'ddd', 22, 1, NULL, 'ddd', 1, 22, 'ddd', 1, 22, 1, 1, '2019-09-18 15:51:27', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Long Chandara', 'Angkor Century', 'S&M Manager', '09764534536', 'longchandara@gmail.com', NULL, NULL, 'Siem reap, Cambodia', 56, 21, NULL, '', NULL, NULL, '', NULL, NULL, 1, 1, '2019-10-14 13:36:42', NULL, '2019-10-14 13:37:45', 1, '65547', NULL, NULL, NULL, NULL, NULL, '2019-10-15', 4, '2019-10-31', 1, 2, '', '', '', '', NULL, NULL),
(4, 'dfb', 'fvd', NULL, '', 'dfg@gmail.cp', NULL, NULL, 'fdgd', NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, 1, 3, '2019-10-14 16:12:25', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
  `created_date` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL
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
-- Table structure for table `customer_type`
--

CREATE TABLE `customer_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer_type`
--

INSERT INTO `customer_type` (`id`, `name`, `note`, `status`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 'Hotel', '', 1, '2019-09-01 22:38:59', 1, '2019-09-01 22:41:32', 1),
(2, 'Hostel', '', 1, '2019-09-01 22:39:08', 1, NULL, NULL),
(3, 'Villa', NULL, 1, NULL, NULL, NULL, NULL),
(4, 'Boutique', NULL, 1, NULL, NULL, NULL, NULL),
(5, 'Apartment', NULL, 1, NULL, NULL, NULL, NULL),
(6, 'Resort', NULL, 1, NULL, NULL, NULL, NULL),
(7, 'Boutique Hotel', NULL, 1, NULL, NULL, NULL, NULL),
(8, 'Holiday House', NULL, 1, NULL, NULL, NULL, NULL),
(9, 'Guesthouse', NULL, 1, NULL, NULL, NULL, NULL);

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
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `phone_number`, `email`, `description`, `created_date`, `created_by`, `updated_date`, `updated_by`, `status`) VALUES
(2, 'Web Application Development', '', '', '', '2019-09-16 09:50:28', 1, NULL, NULL, 1),
(3, 'Sales Department', '0987654321', 'sales@eocambo.com', '', '2019-09-20 13:55:05', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` float DEFAULT 0,
  `id_folder` int(11) DEFAULT 0,
  `id_membership_profile` int(11) DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `document_permission` int(1) DEFAULT NULL,
  `id_event_list` int(11) DEFAULT NULL,
  `id_employee_profile` int(11) DEFAULT NULL,
  `id_customer_profile` int(11) DEFAULT NULL,
  `id_project` int(11) DEFAULT NULL,
  `id_contract` int(11) DEFAULT NULL,
  `id_lead_profile` int(11) DEFAULT NULL,
  `id_standard_operation_procedure_set_up` int(11) DEFAULT NULL,
  `file_extention` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`id`, `file_name`, `file_size`, `id_folder`, `id_membership_profile`, `file_path`, `thumbnail`, `description`, `created_by`, `created_date`, `updated_date`, `updated_by`, `status`, `document_permission`, `id_event_list`, `id_employee_profile`, `id_customer_profile`, `id_project`, `id_contract`, `id_lead_profile`, `id_standard_operation_procedure_set_up`, `file_extention`) VALUES
(2, 'quotation-summary-report-by-customer_from_03-sep-2019_to_03-sep-2019.xls', 2045, 1, NULL, 'uploads/lead-profile/1/quotation-summary-report-by-customer_from_03-sep-2019_to_03-sep-2019-15678225755d7312ef714b0617295875.xls', 'thumbs/icon-excel.png', NULL, 1, '2019-09-07 09:16:15', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1),
(3, 'sop-web app dev-15673999095d6c9fe5cc483174131561.docx', 56346, 1, NULL, 'uploads/lead-profile/1/sop-web app dev-15673999095d6c9fe5cc483174131561-15678225755d7312ef7cd0c903080409.docx', 'thumbs/icon-word.png', NULL, 1, '2019-09-07 09:16:15', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1),
(6, 'sale-report-by-quotation (1).xls', 1402, 2, NULL, 'uploads/customer-profile/2/sale-report-by-quotation (1)-15678228455d7313fd867b3121064415.xls', 'thumbs/icon-excel.png', NULL, 1, '2019-09-07 09:20:45', NULL, NULL, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1),
(8, 'sale-report-by-quotation (1).xls', 1402, 3, NULL, 'uploads/project/3/sale-report-by-quotation (1)-15678232515d731593cf19a945742718.xls', 'thumbs/icon-excel.png', NULL, 1, '2019-09-07 09:27:31', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1),
(10, 'sale-report-by-quotation (1).xls', 1402, 4, NULL, 'uploads/standard-operation-procedure-set-up/4/sale-report-by-quotation (1)-15678235185d73169ee4cbe404562932.xls', 'thumbs/icon-excel.png', NULL, 1, '2019-09-07 09:31:58', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1),
(11, 'sop-web app dev-15673999095d6c9fe5cc483174131561.docx', 56346, 2, NULL, 'uploads/customer-profile/2/sop-web app dev-15673999095d6c9fe5cc483174131561-15678239495d73184d46ad0866178589.docx', 'thumbs/icon-word.png', NULL, 1, '2019-09-07 09:39:09', NULL, NULL, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1),
(12, 'bms-2bc-business-center-data-gathering.docx', 163108, 2, NULL, 'uploads/project/2/bms-2bc-business-center-data-gathering-15686219555d7f458328ba3838713754.docx', 'thumbs/icon-word.png', NULL, 1, '2019-09-16 15:19:15', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1),
(14, 'eo_volunteer_profile.png', 56814, 4, NULL, 'uploads/employee-profile/4/eo_volunteer_profile-15687828125d81b9dcdf962713990325.png', 'uploads/thumb/employee-profile/4/eo_volunteer_profile-15687828125d81b9dcdf962713990325.png', NULL, 1, '2019-09-18 12:00:12', NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'workbook39.pdf', 1161160, 1, NULL, 'uploads/customer-profile/1/workbook39-15687875935d81cc89f1087188548743.pdf', 'thumbs/icon-pdf.png', NULL, 1, '2019-09-18 13:19:53', NULL, NULL, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1),
(25, '_ pdf preview.pdf', 677732, 2, NULL, 'uploads/project/2/_ pdf preview-15687878135d81cd65db2be424196361.pdf', 'thumbs/icon-pdf.png', NULL, 1, '2019-09-18 13:23:33', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1),
(28, 'financial-performance-dashboard.png', 73224, 2, NULL, 'uploads/project/2/financial-performance-dashboard-15687879115d81cdc72a6e7376897741.png', 'uploads/thumb/project/2/financial-performance-dashboard-15687879115d81cdc72a6e7376897741.png', NULL, 1, '2019-09-18 13:25:11', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0),
(32, 'gettyimages-543352018-1024x1024.jpg', 135137, 5, NULL, 'uploads/standard-operation-procedure-set-up/5/gettyimages-543352018-1024x1024-15687881675d81cec71e489389048698.jpg', 'uploads/thumb/standard-operation-procedure-set-up/5/gettyimages-543352018-1024x1024-15687881675d81cec71e489389048698.jpg', NULL, 1, '2019-09-18 13:29:27', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(33, 'gettyimages-543352018-1024x1024.jpg', 135137, 4, NULL, 'uploads/employee-profile/4/gettyimages-543352018-1024x1024-15687883655d81cf8d3b6ac325794378.jpg', 'uploads/thumb/employee-profile/4/gettyimages-543352018-1024x1024-15687883655d81cf8d3b6ac325794378.jpg', NULL, 1, '2019-09-18 13:32:45', NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'extranet.eocambotechnology.com_project_task_r=project_index&id_project=17&page_size=100.png', 479503, 3, NULL, 'uploads/document/3/extranet.eocambotechnology.com_project_task_r=project_index&id_project=17&page_size=100-15711938365da683ec7d6a2239797258.png', 'uploads/thumb/document/3/extranet.eocambotechnology.com_project_task_r=project_index&id_project=17&page_size=100-15711938365da683ec7d6a2239797258.png', NULL, 3, '2019-10-16 09:43:56', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

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
(8, 8, 'ERO'),
(9, 9, 'OPN'),
(10, 10, 'PBI');

-- --------------------------------------------------------

--
-- Table structure for table `employee_position`
--

CREATE TABLE `employee_position` (
  `id` int(11) NOT NULL,
  `position_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
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
(1, 'Sale', '', '2019-09-17 09:34:45', 1, '2019-10-04 13:09:39', 1, 1, 3),
(2, 'senior testor', '', '2019-09-20 09:22:39', 1, NULL, NULL, 1, 2),
(3, 'Web Application', '', '2019-10-14 13:43:24', 1, NULL, NULL, 1, 2);

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
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user_type` int(11) DEFAULT NULL,
  `job_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_joint_date` date DEFAULT NULL,
  `basic_salary` decimal(10,2) DEFAULT NULL,
  `id_working_group` int(11) DEFAULT NULL,
  `signature_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_profile`
--

INSERT INTO `employee_profile` (`id`, `id_prefix`, `first_name`, `last_name`, `join_date`, `date_of_birth`, `place_of_birth`, `sex`, `nationality`, `address`, `id_country`, `id_city`, `marital_status`, `phone_number`, `id_department`, `email`, `id_position`, `username`, `password`, `confirm_password`, `description`, `created_date`, `created_by`, `updated_date`, `updated_by`, `status`, `img_url`, `id_user_type`, `job_description`, `employee_code`, `employee_joint_date`, `basic_salary`, `id_working_group`, `signature_url`) VALUES
(1, 'Mr.', 'dara', 'tester', NULL, NULL, '', '1', 56, '', NULL, NULL, '', '', 2, '', 1, 'tester', '', '', '', '2019-09-17 09:35:41', 1, '2019-10-02 08:32:43', 1, 1, '7', 1, '', '', NULL, NULL, NULL, NULL),
(2, 'Ms.', 'mara', 'ko', '2019-09-24', NULL, '', '1', 56, '', NULL, NULL, '', '', 3, '', 1, 'marako', '', '', '', '2019-09-20 09:09:28', 1, '2019-10-28 14:25:21', 1, 1, '16', 1, '<p>Job Description</p>\r\n', 'tt22', NULL, NULL, 1, '19');

-- --------------------------------------------------------

--
-- Table structure for table `eot_customer`
--

CREATE TABLE `eot_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
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
  `deactivated_reason` text DEFAULT NULL,
  `deactivated_requested_by` varchar(255) DEFAULT NULL,
  `deactivated_requested_contact_detail` text DEFAULT NULL,
  `deactivated_by` int(11) NOT NULL,
  `lived_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `fee_for_membership` decimal(10,2) DEFAULT 0.00,
  `fee_for_subscriber` decimal(10,2) DEFAULT 0.00,
  `authorized` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` int(11) NOT NULL,
  `type_id` tinyint(1) DEFAULT NULL,
  `doc_id` varchar(50) DEFAULT NULL,
  `id_related_to` int(11) DEFAULT NULL,
  `id_related_profile` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `is_bill` tinyint(1) DEFAULT NULL,
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

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`id`, `type_id`, `doc_id`, `id_related_to`, `id_related_profile`, `date`, `is_bill`, `chart_of_account`, `chart_of_account_amount`, `id_payment_method`, `cheque_number`, `clearing_date`, `total_amount`, `paid_amount`, `balance_amount`, `remark`, `created_by`, `created_date`, `updated_by`, `updated_date`, `status`, `img_url`) VALUES
(1, 1, 'EXP19100001', 1, 1, '2019-10-11', 0, 275, NULL, 1, '', NULL, '275.00', '275.00', '0.00', '', 1, '2019-10-11 10:38:34', 1, '2019-10-11 15:43:42', 5, NULL),
(2, 1, 'EXP19100002', 1, 1, '2019-10-10', 1, 275, NULL, 1, '', NULL, '850.00', '0.00', '850.00', '', 1, '2019-10-11 10:40:35', 1, '2019-10-11 15:43:17', 5, NULL),
(4, 2, 'PBI19100001', 1, 1, '2019-10-15', 0, 275, NULL, 2, '', NULL, '477.00', '477.00', '0.00', '', 1, '2019-10-11 14:09:19', 1, '2019-10-11 15:06:30', 5, NULL),
(5, 1, 'EXP19100005', 1, 1, '2019-10-11', 1, 38, NULL, 1, '', NULL, '50.00', '50.00', '0.00', '', 1, '2019-10-11 15:48:06', 1, '2019-10-12 08:46:12', 1, NULL),
(6, 1, 'EXP19100006', 1, 1, '2019-10-11', 1, 39, NULL, 1, '', NULL, '250.00', '250.00', '0.00', '', 1, '2019-10-11 15:48:29', 1, '2019-10-12 08:46:12', 1, NULL),
(7, 2, 'PBI19100005', 1, 1, '2019-10-30', 0, 275, NULL, 3, '1231', '2019-10-30', '300.00', '300.00', '0.00', '', 1, '2019-10-11 15:50:02', 1, '2019-10-12 08:46:12', 1, NULL);

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

--
-- Dumping data for table `expense_data`
--

INSERT INTO `expense_data` (`id`, `id_expense`, `chart_of_account`, `description`, `amount`, `status`) VALUES
(1, 1, 267, 'Air Conditioner', '25.00', 1),
(2, 1, 133, 'buy TV', '250.00', 1),
(3, 2, 67, '', '850.00', 1),
(4, 5, 30, '', '50.00', 1),
(5, 6, 25, '', '250.00', 1);

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
(11, '2019-09-16', 'Invoice', 'INV19090002', '1', 'Customer', 'INV19090002', '0.00', '19.80', '19.80', 1, 1, '2019-09-16 15:17:09', 1, 1, NULL, NULL),
(12, '2019-09-16', 'Invoice', 'INV19090002', '1', 'Customer', 'INV19090002', '19.80', '0.00', '19.80', 45, 63, '2019-09-16 15:17:09', 1, 1, NULL, NULL),
(15, '2019-09-16', 'Payment', 'REC19090002', '1', 'customer', 'REC19090002', '0.00', '19.80', '0.00', 45, 63, '2019-09-16 15:36:01', 1, 1, NULL, NULL),
(16, '2019-09-16', 'Payment', 'REC19090002', '1', 'customer', 'REC19090002', '19.80', '0.00', '19.80', 3, 38, '2019-09-16 15:36:01', 1, 1, NULL, NULL),
(17, '2019-09-16', 'Expense', 'EXP19090001', '1', 'project', '', '10.00', '0.00', '10.00', 2, 30, '2019-09-16 15:37:19', 1, 1, NULL, NULL),
(18, '2019-09-16', 'Expense', 'EXP19090001', '1', 'project', '', '0.00', '10.00', '9.80', 3, 38, '2019-09-16 15:37:19', 1, 1, NULL, NULL),
(19, '2019-09-16', 'Expense', 'EXP19090002', '1', 'project', '', '9.00', '0.00', '9.00', 46, 237, '2019-09-16 15:38:10', 1, 1, NULL, NULL),
(20, '2019-09-16', 'Expense', 'EXP19090002', '1', 'project', '', '0.00', '9.00', '0.80', 3, 38, '2019-09-16 15:38:10', 1, 1, NULL, NULL),
(23, '2019-09-16', 'Invoice', 'INV19090001', '1', 'customer', 'INV19090001', '0.00', '19.80', '39.60', 1, 1, '2019-09-17 09:57:26', 1, 1, NULL, NULL),
(24, '2019-09-16', 'Invoice', 'INV19090001', '1', 'customer', 'INV19090001', '19.80', '0.00', '19.80', 45, 63, '2019-09-17 09:57:26', 1, 1, NULL, NULL),
(29, '2019-09-17', 'Invoice', 'INV19090003', '1', 'customer', 'INV19090003', '0.00', '39.60', '79.20', 1, 1, '2019-09-17 10:00:25', 1, 1, NULL, NULL),
(30, '2019-09-17', 'Invoice', 'INV19090003', '1', 'customer', 'INV19090003', '39.60', '0.00', '59.40', 45, 63, '2019-09-17 10:00:25', 1, 1, NULL, NULL),
(31, '2019-09-17', 'Cash Advance', 'ADV19090001', '1', 'employee', 'xxx - ADV19090001', '0.00', '0.50', '0.30', 3, 38, '2019-09-17 11:05:01', 1, 1, NULL, NULL),
(32, '2019-09-17', 'Cash Advance', 'ADV19090001', '1', 'employee', 'xxx - ADV19090001', '0.00', '0.50', '0.50', 9, 51, '2019-09-17 11:05:01', 1, 1, NULL, NULL),
(33, '2019-10-14', 'Opening Balance', 'OPN19100003', NULL, NULL, 'Opening Balance - SEVEN HUNDRED EIGHTY THREE DOLLAR', '783.00', '0.00', '783.00', 3, 274, '2019-10-14 13:43:49', 3, 1, NULL, NULL),
(34, '2019-10-14', 'Opening Balance', 'OPN19100003', NULL, NULL, 'Opening Balance - SEVEN HUNDRED EIGHTY THREE DOLLAR', '0.00', '783.00', '783.00', 7, 273, '2019-10-14 13:43:49', 3, 1, NULL, NULL);

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

--
-- Dumping data for table `finance_chart_of_account_amount`
--

INSERT INTO `finance_chart_of_account_amount` (`id`, `account_type`, `chart_of_account`, `ending_balance`, `name`, `name_type`) VALUES
(1, 9, 51, '0.50', '1', 'Employee');

-- --------------------------------------------------------

--
-- Table structure for table `finance_opening_balance`
--

CREATE TABLE `finance_opening_balance` (
  `id` int(11) NOT NULL,
  `doc_id` varchar(50) DEFAULT NULL,
  `id_chart_of_account` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `amount_in_word` varchar(500) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `finance_opening_balance`
--

INSERT INTO `finance_opening_balance` (`id`, `doc_id`, `id_chart_of_account`, `date`, `amount`, `amount_in_word`, `description`, `updated_by`, `updated_date`, `status`, `created_by`, `created_date`) VALUES
(1, 'OPN19100001', 274, '2019-10-11', '5000.00', 'FIVE THOUSAND DOLLAR', 'FIVE THOUSAND DOLLAR', 1, '2019-10-11 10:06:48', 0, 1, '2019-10-11 09:58:53'),
(2, 'OPN19100002', 275, '2019-01-01', '5555.00', 'FIVE THOUSAND FIVE HUNDRED FIFTY FIVE DOLLAR', '', 1, '2019-10-11 10:24:18', 1, 1, '2019-10-11 10:23:55'),
(3, 'OPN19100003', 274, '2019-10-14', '783.00', 'SEVEN HUNDRED EIGHTY THREE DOLLAR', '', NULL, NULL, 1, 3, '2019-10-14 13:43:49');

-- --------------------------------------------------------

--
-- Table structure for table `finance_pay_bill`
--

CREATE TABLE `finance_pay_bill` (
  `id` int(11) NOT NULL,
  `doc_id` varchar(50) DEFAULT NULL,
  `id_related_to` int(11) DEFAULT NULL,
  `id_related_profile` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `id_chart_of_account` int(11) DEFAULT NULL,
  `id_payment_method` int(11) DEFAULT NULL,
  `cheque_number` varchar(10) DEFAULT NULL,
  `clearing_date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `finance_pay_bill`
--

INSERT INTO `finance_pay_bill` (`id`, `doc_id`, `id_related_to`, `id_related_profile`, `date`, `id_chart_of_account`, `id_payment_method`, `cheque_number`, `clearing_date`, `amount`, `remark`, `created_by`, `created_date`, `updated_by`, `updated_date`, `status`) VALUES
(4, 'PBI19100001', 1, 1, '2019-10-15', 275, 2, '', NULL, '477.00', '', 1, '2019-10-11 14:09:19', 1, '2019-10-11 15:06:30', 5),
(5, 'PBI19100005', 1, 1, '2019-10-30', 275, 3, '1231', '2019-10-30', '300.00', '', 1, '2019-10-11 15:50:02', 1, '2019-10-12 08:46:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `finance_pay_bill_data`
--

CREATE TABLE `finance_pay_bill_data` (
  `id` int(11) NOT NULL,
  `pay_bill_id` int(11) DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `bill_id` int(11) DEFAULT NULL,
  `doc_id` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `paid_amount` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `finance_pay_bill_data`
--

INSERT INTO `finance_pay_bill_data` (`id`, `pay_bill_id`, `bill_date`, `bill_id`, `doc_id`, `description`, `total_amount`, `paid_amount`, `status`) VALUES
(8, 4, '2019-10-10', 2, 'EXP19100002', '123', '850.00', '477.00', 1),
(17, 5, '2019-10-11', 5, 'EXP19100005', '', '50.00', '50.00', 1),
(18, 5, '2019-10-11', 6, 'EXP19100006', '', '250.00', '250.00', 1);

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
  `id_lead_profile` int(11) DEFAULT NULL,
  `id_standard_operation_procedure_set_up` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `folder`
--

INSERT INTO `folder` (`id`, `folder_name`, `id_membership_profile`, `status`, `created_by`, `created_date`, `updated_by`, `updated_date`, `id_document_permission`, `id_event_list`, `id_employee_profile`, `id_customer_profile`, `id_project`, `id_contract`, `id_lead_profile`, `id_standard_operation_procedure_set_up`) VALUES
(1, 'test', NULL, 1, 1, '2019-09-16 14:53:41', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(2, 'Testing SOP Document', NULL, 1, 1, '2019-09-16 15:18:59', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(3, 'testing', '', 1, 1, '2019-09-18 11:59:21', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'emp', NULL, 1, 1, '2019-09-18 12:00:03', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(5, 'Testing SOP Document', NULL, 1, 1, '2019-09-18 13:27:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hls_solutions`
--

CREATE TABLE `hls_solutions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hr_approval_permission`
--

CREATE TABLE `hr_approval_permission` (
  `id` int(11) NOT NULL,
  `approver_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hr_approval_permission`
--

INSERT INTO `hr_approval_permission` (`id`, `approver_id`, `created_date`, `created_by`, `updated_date`, `updated_by`, `status`) VALUES
(4, 2, '2019-09-21', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hr_approval_permission_data`
--

CREATE TABLE `hr_approval_permission_data` (
  `id` int(11) NOT NULL,
  `hr_approval_permission_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hr_approval_permission_data`
--

INSERT INTO `hr_approval_permission_data` (`id`, `hr_approval_permission_id`, `employee_id`) VALUES
(31, 2, 1),
(32, 2, 2),
(48, 4, 1),
(49, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `hr_approval_permission_department`
--

CREATE TABLE `hr_approval_permission_department` (
  `id` int(11) NOT NULL,
  `hr_approval_permission_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hr_approval_permission_department`
--

INSERT INTO `hr_approval_permission_department` (`id`, `hr_approval_permission_id`, `department_id`) VALUES
(7, 2, 2),
(8, 2, 3),
(11, 4, 2),
(12, 4, 3);

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
  `long_description` text DEFAULT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT 0.00,
  `setup_fee` decimal(10,2) DEFAULT 0.00,
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

INSERT INTO `item` (`id`, `description`, `long_description`, `short_description`, `rate`, `setup_fee`, `id_tax`, `id_group`, `unit`, `status`, `updated_by`, `updated_date`, `created_by`, `created_date`) VALUES
(1, 'eO-BMS (Standard)', '22', '2222', '22.00', '0.00', NULL, 1, NULL, 1, 1, '2019-09-17 09:28:22', 1, '2019-09-16 09:10:24');

-- --------------------------------------------------------

--
-- Table structure for table `item_data`
--

CREATE TABLE `item_data` (
  `id` int(11) NOT NULL,
  `id_item` int(11) DEFAULT NULL,
  `id_data` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_group`
--

CREATE TABLE `item_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(11) DEFAULT NULL,
  `main_logo` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `inclusive_benefit` text DEFAULT NULL,
  `plan_detail` text DEFAULT NULL,
  `setup_label` varchar(255) DEFAULT NULL,
  `order_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_group`
--

INSERT INTO `item_group` (`id`, `name`, `full_name`, `created_date`, `updated_by`, `created_by`, `updated_date`, `status`, `main_logo`, `description`, `inclusive_benefit`, `plan_detail`, `setup_label`, `order_by`) VALUES
(1, 'www', 'eo', '2019-09-16 09:29:38', 1, 1, '2019-09-18 14:39:16', 1, '10', '', '', NULL, NULL, NULL),
(2, 'test12', 'sdf', '2019-09-18 14:52:41', NULL, 1, NULL, 1, NULL, '', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_group_data`
--

CREATE TABLE `item_group_data` (
  `id` int(11) NOT NULL,
  `id_type` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_group_department`
--

CREATE TABLE `item_group_department` (
  `id` int(11) NOT NULL,
  `id_item_group` int(11) DEFAULT NULL,
  `id_department` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_group_template_detail`
--

CREATE TABLE `item_group_template_detail` (
  `id` int(11) NOT NULL,
  `id_item_group` int(11) DEFAULT NULL,
  `id_item_group_type` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_group_template_detail`
--

INSERT INTO `item_group_template_detail` (`id`, `id_item_group`, `id_item_group_type`, `title`, `description`) VALUES
(5, 1, NULL, '', ''),
(6, 2, NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `item_group_type`
--

CREATE TABLE `item_group_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_group_type`
--

INSERT INTO `item_group_type` (`id`, `name`, `status`, `updated_by`, `updated_date`, `created_by`, `created_date`) VALUES
(1, 'Essential', 1, 1, '2019-09-18 10:01:37', NULL, NULL),
(2, 'Main Feature', 1, 1, '2019-09-18 10:01:40', NULL, NULL),
(3, 'Support', 1, 1, '2019-09-18 10:01:45', NULL, NULL),
(4, 'Hosting', 1, 1, '2019-09-18 10:01:49', NULL, NULL);

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
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `note` varchar(255) DEFAULT NULL,
  `star_rating` decimal(10,2) DEFAULT NULL,
  `id_customer_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `lead_profile`
--

INSERT INTO `lead_profile` (`id`, `lead_name`, `company_name`, `phone_number`, `email_address`, `latitute`, `longitute`, `address`, `id_country`, `id_city`, `group_names`, `billing_address`, `id_billing_city`, `id_billing_country`, `shipping_address`, `id_shipping_city`, `id_shipping_country`, `status`, `created_by`, `created_date`, `img_url`, `updated_date`, `updated_by`, `zip_code`, `customer_status`, `assigned_to`, `id_source`, `note`, `star_rating`, `id_customer_type`) VALUES
(1, 'Peter', 'EOH', '0987654321', 'peter@eoh.com', NULL, NULL, 'SR', NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, 1, 1, '2019-09-16 08:15:51', NULL, '2019-09-16 10:28:03', 1, '', 6, NULL, NULL, '', NULL, 1),
(2, 'dfb', 'fvd', '', 'dfg@gmail.cp', NULL, NULL, 'fdgd', NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, 1, 1, '2019-09-16 13:25:57', NULL, '2019-10-14 16:12:25', 3, '', 6, NULL, NULL, '', NULL, NULL),
(3, 'Kunthea', 'Advaya', '097 45 43 554', 'kunthea@gmail.com', NULL, NULL, 'Dom Nak Sdach', 56, 21, NULL, 'Dom Nak Sdach', 25, 56, 'Dom Nak Sdach', 25, 56, 1, 1, '2019-10-09 14:39:45', NULL, '2019-10-24 16:42:26', 3, '65648', 2, 1, 4, 'Hardly Customer', '3.00', 1),
(4, 'Long Chandara', 'Angkor Century', '09764534536', 'longchandara@gmail.com', NULL, NULL, 'Siem reap, Cambodia', 56, 21, NULL, '', NULL, NULL, '', NULL, NULL, 1, 1, '2019-10-14 13:35:36', NULL, '2019-10-14 13:36:42', 1, '65547', 6, 1, 4, 'New target sale', '5.00', 1);

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

--
-- Dumping data for table `lead_profile_note`
--

INSERT INTO `lead_profile_note` (`id`, `note`, `created_date`, `updated_by`, `created_by`, `updated_date`, `status`, `id_lead_profile`) VALUES
(1, 'testing note\r\n', '2019-09-16 14:06:12', NULL, 1, NULL, NULL, 2);

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
  `updated_date` datetime DEFAULT NULL,
  `number_of_day` int(11) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `address_during_leave` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `leave_application`
--

INSERT INTO `leave_application` (`id`, `id_approver`, `start_date`, `end_date`, `img_url`, `id_employee`, `is_half_day`, `id_leave_type_name`, `leave_reason`, `reject_reason`, `id_leave_status`, `created_by`, `created_date`, `updated_by`, `updated_date`, `number_of_day`, `contact`, `address_during_leave`) VALUES
(1, NULL, '2019-08-27', '2019-08-28', '13', 2, 0, 2, 'testing te', 'testing reject', '2', 1, '2019-09-18 14:50:15', 1, '2019-10-14 15:39:07', NULL, NULL, NULL),
(2, 2, '2019-09-03', '2019-09-17', NULL, 1, 0, 6, 'testing te', '', '2', 2, '2019-09-23 10:47:16', 3, '2019-09-23 13:28:32', NULL, NULL, NULL),
(3, NULL, '2019-09-03', '2019-09-05', NULL, 2, 1, 1, 'kron tah testing ter', '', '1', 3, '2019-09-23 13:03:02', 1, '2019-10-14 15:34:45', NULL, NULL, NULL),
(4, NULL, '2019-09-11', '2019-09-12', NULL, 1, 0, 3, '333', NULL, '1', 2, '2019-09-23 13:15:27', NULL, NULL, NULL, NULL, NULL);

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

-- --------------------------------------------------------

--
-- Table structure for table `leave_monthly`
--

CREATE TABLE `leave_monthly` (
  `id` int(11) NOT NULL,
  `id_employee` int(11) DEFAULT NULL,
  `id_month` int(11) DEFAULT NULL,
  `id_year` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `leave_monthly`
--

INSERT INTO `leave_monthly` (`id`, `id_employee`, `id_month`, `id_year`, `status`, `updated_by`, `updated_date`, `created_by`, `created_date`) VALUES
(4, 1, 1, 2, 1, NULL, NULL, 1, '2019-10-03 17:04:19');

-- --------------------------------------------------------

--
-- Table structure for table `leave_monthly_data`
--

CREATE TABLE `leave_monthly_data` (
  `id` int(11) NOT NULL,
  `id_leave_monthly` int(11) DEFAULT NULL,
  `id_leave_type` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `leave_monthly_data`
--

INSERT INTO `leave_monthly_data` (`id`, `id_leave_monthly`, `id_leave_type`, `amount`, `date`) VALUES
(14, 4, 1, '2.00', '2019-10-02');

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
-- Table structure for table `leave_setup`
--

CREATE TABLE `leave_setup` (
  `id` int(11) NOT NULL,
  `id_month` int(11) DEFAULT NULL,
  `id_year` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leave_setup`
--

INSERT INTO `leave_setup` (`id`, `id_month`, `id_year`, `status`, `updated_by`, `updated_date`, `created_by`, `created_date`) VALUES
(3, 2, 1, 1, NULL, NULL, 1, '2019-10-03 16:06:42'),
(4, 1, 1, 1, NULL, NULL, 1, '2019-10-03 17:01:37'),
(5, 3, 1, 1, 1, '2019-10-04 09:12:08', 1, '2019-10-03 17:02:56');

-- --------------------------------------------------------

--
-- Table structure for table `leave_setup_data`
--

CREATE TABLE `leave_setup_data` (
  `id` int(11) NOT NULL,
  `id_leave_setup` int(11) DEFAULT NULL,
  `id_leave_type` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leave_setup_data`
--

INSERT INTO `leave_setup_data` (`id`, `id_leave_setup`, `id_leave_type`, `amount`) VALUES
(13, 3, 1, '1.00'),
(14, 4, 1, '0.00'),
(16, 5, 1, '1.00'),
(17, 5, 2, '2.00'),
(18, 5, 3, '3.00'),
(19, 5, 4, '0.00'),
(20, 5, 5, '0.00'),
(21, 5, 6, '0.00'),
(22, 5, 7, '0.00'),
(23, 5, 8, '0.00'),
(24, 5, 9, '0.00'),
(25, 5, 10, '0.00');

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
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
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
(1, '2019-09-17', 1, 9, NULL, '1', 3, NULL, NULL, 1, '2019-09-17 11:11:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
  `permission_menu_id` int(11) DEFAULT NULL,
  `is_show_menu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_action`
--

INSERT INTO `permission_action` (`id`, `user_type_id`, `permission_menu_id`, `is_show_menu`) VALUES
(840, 2, 1, NULL),
(841, 2, 23, NULL),
(842, 2, 44, NULL),
(843, 2, 20, NULL),
(844, 2, 24, NULL),
(845, 2, 64, NULL),
(846, 2, 31, NULL),
(847, 2, 33, NULL),
(848, 2, 45, NULL),
(849, 2, 28, NULL),
(850, 2, 32, NULL),
(851, 2, 43, NULL),
(852, 2, 21, NULL),
(853, 2, 63, NULL),
(854, 2, 30, NULL),
(855, 2, 25, NULL),
(856, 2, 39, NULL),
(857, 2, 29, NULL),
(858, 2, 38, NULL),
(859, 2, 40, NULL),
(860, 2, 57, NULL),
(861, 2, 60, NULL),
(862, 2, 58, NULL),
(863, 2, 59, NULL),
(864, 2, 52, NULL),
(865, 2, 22, NULL),
(866, 2, 55, NULL),
(867, 2, 35, NULL),
(868, 2, 54, NULL),
(869, 2, 6, NULL),
(893, 3, 1, NULL),
(894, 3, 20, NULL),
(895, 3, 21, NULL),
(896, 3, 63, NULL),
(897, 3, 57, NULL),
(898, 3, 59, NULL),
(899, 3, 60, NULL),
(900, 3, 58, NULL),
(901, 3, 50, NULL),
(902, 3, 55, NULL),
(903, 3, 22, NULL),
(904, 3, 35, NULL),
(905, 3, 6, NULL),
(906, 4, 1, NULL),
(907, 4, 23, NULL),
(908, 4, 20, NULL),
(909, 4, 63, NULL),
(910, 4, 57, NULL),
(911, 4, 60, NULL),
(912, 4, 58, NULL),
(913, 4, 59, NULL),
(914, 4, 50, NULL),
(915, 4, 22, NULL),
(916, 4, 55, NULL),
(917, 4, 35, NULL),
(918, 4, 52, NULL),
(919, 4, 6, NULL),
(1168, 1, 1, NULL),
(1169, 1, 60, NULL),
(1170, 1, 44, NULL),
(1171, 1, 23, NULL),
(1172, 1, 20, NULL),
(1173, 1, 21, NULL),
(1174, 1, 63, NULL),
(1175, 1, 59, NULL),
(1176, 1, 54, NULL),
(1177, 1, 35, NULL),
(1178, 1, 6, NULL),
(1179, 1, 24, NULL),
(1180, 1, 33, NULL),
(1181, 1, 43, NULL),
(1182, 1, 31, NULL),
(1183, 1, 49, NULL),
(1184, 1, 74, NULL),
(1185, 1, 29, NULL),
(1186, 1, 30, NULL),
(1187, 1, 25, NULL),
(1188, 1, 51, NULL),
(1189, 1, 42, NULL),
(1190, 1, 50, NULL),
(1191, 1, 22, NULL),
(1192, 1, 55, NULL),
(1193, 1, 71, NULL),
(1194, 1, 72, NULL),
(1195, 1, 52, NULL),
(1196, 1, 56, NULL),
(1197, 1, 27, NULL),
(1198, 1, 48, NULL),
(1199, 1, 41, NULL),
(1200, 1, 46, NULL),
(1201, 1, 8, NULL),
(1202, 1, 58, NULL),
(1203, 1, 13, NULL),
(1204, 1, 70, NULL),
(1205, 1, 17, NULL),
(1206, 1, 34, NULL),
(1207, 1, 28, NULL),
(1208, 1, 32, NULL),
(1209, 1, 68, NULL),
(1210, 1, 64, NULL),
(1211, 1, 45, NULL),
(1212, 1, 38, NULL),
(1213, 1, 39, NULL),
(1214, 1, 40, NULL),
(1215, 1, 11, NULL),
(1216, 1, 47, NULL),
(1217, 1, 62, NULL),
(1218, 1, 66, NULL),
(1219, 1, 65, NULL),
(1220, 1, 67, NULL),
(1221, 1, 69, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_action_data`
--

CREATE TABLE `permission_action_data` (
  `id` int(11) NOT NULL,
  `id_permission_action` int(11) DEFAULT NULL,
  `allow_action` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permission_menu`
--

CREATE TABLE `permission_menu` (
  `id` int(11) NOT NULL,
  `is_parent` tinyint(1) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `menu_name` varchar(100) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `menu_icon` varchar(50) DEFAULT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `css_class` text DEFAULT 'NULL',
  `status` tinyint(1) DEFAULT NULL,
  `contoller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `extra_action` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_menu`
--

INSERT INTO `permission_menu` (`id`, `is_parent`, `parent_id`, `menu_name`, `sort`, `menu_icon`, `menu_url`, `css_class`, `status`, `contoller`, `action`, `extra_action`) VALUES
(1, 1, 0, 'Dashboard', 1, 'demo-pli-home', '/', 'index dashboard', 1, 'site', 'index', 'index,create,view,update,delete'),
(2, 1, 0, 'Subscriber', NULL, 'fa fa-group', 'membership-profile/subscriber', 'membership-profile-subscriber membership-profile-subscriber membership-payment-subscriber membership-event-subscriber membership-document-subscriber', 0, 'membership-profile', 'subscriber', 'index,create,view,update,delete'),
(3, 1, 0, 'Event', NULL, 'fa fa-calendar', 'event-list/index', 'event-list-index', 0, 'event-list', 'index', 'index,create,view,update,delete'),
(4, 1, 0, 'Task', NULL, 'fa fa-tasks', 'membership-event/task', 'membership-event-task', 0, 'event-list', 'index', 'index,create,view,update,delete'),
(5, 1, 0, 'Payment', NULL, 'demo-pli-coin', 'membership-payment/payment', 'membership-payment-payment', 0, 'membership-payment', 'payment', 'index,create,view,update,delete'),
(6, 1, 0, 'Document', 11, 'fa fa-file-text-o', 'document/index', 'document-index document-subscriber', 1, 'document', 'index', 'index,create,view,update,delete,,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download'),
(7, 1, 0, 'User', 0, 'demo-pli-male icon-fw', 'user/index', 'user-index', 0, 'user', 'index', 'index,create,view,update,delete'),
(8, 1, 0, 'Setup', 16, 'demo-pli-gear icon-lg icon-fw', '#', 'leave-setup-index item-group-type-index supplier-profile-type-index working-group-index company-profile-index payment-status-index data-option-phone-country-code-index data-option-prefix-index marital-status-index country-index city-index payment-method-index user-type-index department-index employee-position-index bank-index chart-account-index item-group-data-index item-index item-group-index contract-type-index account-type-index standard-operation-step-index hr-approval-permission-index  customer-type-index', 1, NULL, NULL, 'index,create,view,update,delete'),
(9, 0, 8, 'Payment Status', 0, NULL, 'payment-status/index', 'payment-status-index', 0, 'payment-status', 'index', 'index,create,view,update,delete'),
(10, 0, 8, 'Payment For', 0, NULL, 'payment-for/index', 'payment-for-index', 0, 'payment-for', 'index', 'index,create,view,update,delete'),
(11, 0, 8, 'Position', 12, NULL, 'employee-position/index', 'employee-position-index', 1, 'employee-position', 'index', 'index,create,view,update,delete'),
(12, 0, 8, 'Permission', 0, NULL, 'permission/index', 'permission-index', 0, 'permission', 'index', 'index,create,view,update,delete'),
(13, 0, 8, 'Prefix', 2, NULL, 'data-option-prefix/index', 'data-option-prefix-index', 1, 'data-option-prefix', 'index', 'index,create,view,update,delete'),
(14, 0, 8, 'Phone country code', 0, NULL, 'data-option-phone-country-code/index', 'data-option-phone-country-code-index', 0, 'data-option-phone-country-code', 'index', 'index,create,view,update,delete'),
(15, 0, 8, 'Marital Status', 0, NULL, 'marital-status/index', 'marital-status-index', 0, 'marital-status', 'index', 'index,create,view,update,delete'),
(16, 0, 8, 'Country', 0, NULL, 'country/index', 'country-index', 0, 'country', 'index', 'index,create,view,update,delete'),
(17, 0, 8, 'City', 3, NULL, 'city/index', 'city-index', 1, 'city', 'index', 'index,create,view,update,delete'),
(18, 0, 8, 'Payment Type', 0, NULL, 'payment-type/index', 'payment-type-index', 0, 'payment-type', 'index', 'index,create,view,update,delete'),
(19, 0, 8, 'Payment Method', 0, NULL, 'payment-method/index', 'payment-method-index', 0, 'payment-method', 'index', 'index,create,view,update,delete'),
(20, 1, 0, 'Projects', 5, 'fa fa-cubes', 'project/index', 'project-index', 1, 'project', 'index', 'pin,index,create,view,update,delete,overview,task,copy,timesheet,sale-invoice,sale-payment,sale-quotation,dependent-get-customer-info,sale-expense,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download,note'),
(21, 1, 0, 'Tasks', 6, 'fa fa-tasks', 'task/index', 'task-index', 1, 'task', 'index', 'index,create,view,update,delete,copy'),
(22, 0, 50, 'Employee', 1, '', 'employee-profile/index', 'employee-profile-index', 1, 'employee-profile', 'index', 'index,create,view,update,delete,profile,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download,get-department'),
(23, 1, 0, 'Customer', 4, 'fa fa-user-o', 'customer-profile/index', 'customer-profile-index', 1, 'customer-profile', 'index', 'index,create,view,update,delete,import-csv,download-sample-csv,profile,solution,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download'),
(24, 1, 0, 'Sales', 12, 'fa fa-balance-scale', '#', 'quotation-index proposal-index contract-index', 1, 'sale', 'index', 'index,create,view,update,delete'),
(25, 0, 49, 'Expense', 3, 'fa fa-file-text-o', 'expense/index', 'expense-index', 1, 'expense', 'index', 'index,create,view,update,delete,pay-bill,update-pay-bill,void-pay-bill,void-expense'),
(27, 1, 0, 'Report', 15, 'fa fa-area-chart', 'report/index', 'finance-chart-of-account-index index employee-report-report', 1, 'report', 'index', 'index,create,view,update,delete,report'),
(28, 0, 8, 'Items', 5, NULL, 'item/index', 'item-index', 1, 'item', 'index', 'index,create,view,update,delete'),
(29, 0, 49, 'Invoices', 1, NULL, 'customer-invoice/index', 'customer-invoice-index customer-invoice-view', 1, 'customer-invoice', 'index', 'index,create,view,update,delete,void,validation-payment'),
(30, 0, 49, 'Payments', 2, NULL, 'customer-payment/index', 'customer-payment-index customer-payment-view', 1, 'customer-payment', 'index', 'index,create,view,update,delete'),
(31, 0, 24, 'Contracts', 3, NULL, 'contract/index', 'contract-index', 1, 'contract', 'index', 'index,create,view,update,delete,detail,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download,overview'),
(32, 0, 8, 'Item Group', 6, NULL, 'item-group/index', 'item-group-index', 1, 'item-group', 'index', 'index,create,view,update,delete'),
(33, 0, 24, 'Proposal', 1, NULL, 'proposal/index', 'proposal-index', 1, 'proposal', 'index', 'index,create,view,update,delete,overview,note,dependent-get-customer-info'),
(34, 0, 8, 'Company Profile', 4, NULL, 'company-profile/index', 'company-profile-index', 1, 'company-profile', 'index', 'index,create,view,update,delete'),
(35, 1, 0, 'Knowledge Base', 10, 'fa fa-file-text-o', 'knowledge-base/index', 'knowledge-base-index', 1, 'knowledge-base', 'index', 'index,create,view,update,delete,article'),
(38, 0, 8, 'Account Type', 9, NULL, 'account-type/index', 'account-type-index', 1, 'account-type', NULL, 'index,create,view,update,delete'),
(39, 0, 8, 'Chart of Account', 10, NULL, 'chart-account/index', 'chart-account-index', 1, 'chart-account', NULL, 'index,create,view,update,delete'),
(40, 0, 8, 'Bank', 11, NULL, 'bank/index', 'bank-index', 1, 'bank', NULL, 'index,create,view,update,delete'),
(41, 0, 27, 'Chart of Account', 0, NULL, 'finance-chart-of-account/index', 'finance-chart-of-account-index', 1, 'finance-chart-of-account', NULL, 'index,create,view,update,delete'),
(42, 0, 76, 'Supplier', 1, '', 'supplier-profile/index', 'supplier-profile-index', 1, 'supplier-profile', NULL, 'index,create,view,update,delete,contact,update-contact,create-contact,delete-contact'),
(43, 0, 24, 'Quotation', 2, NULL, 'quotation/index', 'quotation-index', 1, 'quotation', 'index', 'index,create,view,update,delete,overview,pdf,dependent-get-customer-info,download'),
(44, 1, 0, 'Lead', 3, 'fa fa-tty', 'lead-profile/index', 'lead-profile-index', 1, 'lead-profile', 'index', 'index,create,view,update,delete,import-csv,download-sample-csv,profile,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download,convert-lead'),
(45, 0, 8, 'Contract Type', 8, NULL, 'contract-type/index', 'contract-type-index', 1, 'contract-type', 'index', 'index,create,view,update,delete'),
(46, 0, 27, 'Sale Report', 0, NULL, 'sale-report/invoice?smMenu=1', 'sale-report-invoice', 1, 'sale-report', 'invoice', 'index,create,view,update,delete,invoice,proposal,quotation'),
(47, 0, 8, 'Department', 13, NULL, 'department/index', 'department-index', 1, 'department', 'index', 'index,create,view,update,delete'),
(48, 0, 27, 'Employee Report', NULL, NULL, 'employee-report/report?smMenu=1', 'employee-report-project', 1, 'employee-report', 'project', 'index,create,view,update,delete,report,tasks,project'),
(49, 1, 0, 'Finance', 13, 'fa fa-money', '#', 'finance-opening-balance-index payroll-index customer-invoice-index customer-invoice-view  customer-payment-index customer-payment-view expense-index supplier-profile-index', 1, ' ', NULL, 'index,create,view,update,delete'),
(50, 1, 0, 'Human Resource', 14, 'demo-pli-address-book', '#', 'leave-monthly-index leave-in-the-year-index leave-application-index payroll-request-index payroll-type-index cash-advance-request-index employee-profile-index ', 1, 'hr', 'index', 'index,create,view,update,delete'),
(51, 0, 49, 'Payroll', 4, NULL, 'payroll/index', 'payroll-index', 1, 'payroll', 'index', 'index,create,view,update,delete'),
(52, 0, 50, 'Cash Advance Request', 3, NULL, 'cash-advance-request/index', 'cash-advance-request-index', 1, 'cash-advance-request', 'index', 'index,create,view,update,delete'),
(53, 0, 50, 'Payroll Type', 0, NULL, 'payroll-type/index', 'payroll-type-index', 0, 'payroll-type', 'index', 'index,create,view,update,delete'),
(54, 1, 0, 'Budget Setup', 9, 'demo-pli-coin', 'budget-set-up/index', 'budget-set-up-index', 1, 'budget-set-up', 'index', 'index,create,view,update,delete'),
(55, 0, 50, 'Leave Application', 2, NULL, 'leave-application/index', 'leave-application-index', 1, 'leave-application', 'index', 'index,create,view,update,delete'),
(56, 0, 50, 'Payroll Request', 4, NULL, 'payroll-request/index', 'payroll-request-index', 1, 'payroll-request', 'index', 'index,create,view,update,delete'),
(57, 1, 0, 'K.P.I', 8, 'demo-pli-tactic', 'standard-operation/index', 'standard-operation-index sop-goal-setup-index', 0, 'standard-operation', 'index', 'index,create,view,update,delete,form-view'),
(58, 0, 8, 'K.P.I Set Up', 1, NULL, 'standard-operation-step/index', 'standard-operation-step-index', 1, 'standard-operation-step', 'index', 'index,create,view,update,delete,form-view'),
(59, 1, 0, 'K.P.I', 8, 'demo-pli-tactic', 'sop-goal-setup/index', 'sop-goal-setup-index', 1, 'sop-goal-setup', 'index', 'index,create,view,update,delete'),
(60, 1, 0, 'Milestone', 2, 'fa fa-history', 'standard-operation/index', 'standard-operation-index', 1, 'standard-operation', 'index', 'index,create,view,update,delete,update-step-sop'),
(61, 0, 50, 'Leave Setup', 0, NULL, 'leave-in-the-year/index', 'leave-in-the-year-index', 0, 'leave-in-the-year', 'index', 'index,create,view,update,delete'),
(62, 0, 8, 'User Type & Roles', 13, 'demo-pli-computer-secure', 'user-type/index', 'user-type-index user-type-roles user-type-update', 1, 'user-type', 'index', 'index,create,view,update,delete,roles'),
(63, 1, 0, 'S.O.P', 7, 'demo-pli-receipt-4', 'standard-operation-procedure-set-up/index', 'standard-operation-procedure-set-up-index', 1, 'standard-operation-procedure-set-up', 'index', 'index,create,view,update,delete,sop-setup,,document,create-folder,dependent-folder,get-info,rename-folder,delete-folder,upload-document,upload,remove,download'),
(64, 0, 8, 'Item Group Data', 7, NULL, 'item-group-data/index', 'item-group-data-index', 1, 'item-group-data', 'index', 'index,create,view,update,delete,item'),
(65, 0, 8, 'Working Group', 20, NULL, 'working-group/index', 'working-group-index', 1, 'working-group', 'index', 'index,create,view,update,delete,item'),
(66, 0, 8, 'Supplier Type', 19, NULL, 'supplier-profile-type/index', 'supplier-profile-type-index', 1, 'supplier-profile-type', 'index', 'index,create,view,update,delete'),
(67, 0, 8, 'Customer Type', 22, NULL, 'customer-type/index', 'customer-type-index', 1, 'customer-type', 'index', 'index,create,view,update,delete'),
(68, 0, 8, 'Item Group Type', 6, NULL, 'item-group-type/index', 'item-group-type-index', 1, 'item-group-type', 'index', 'index,create,view,update,delete,item'),
(69, 0, 8, 'HR Approval Permission', 23, NULL, 'hr-approval-permission/index', 'hr-approval-permission-index', 1, 'hr-approval-permission', 'index', 'index,create,view,update,delete'),
(70, 0, 8, 'Leave Setup', 2, NULL, 'leave-setup/index', 'leave-setup-index', 1, 'leave-setup', 'index', 'index,create,view,update,delete'),
(71, 0, 50, 'Monthly Leave', 2, NULL, 'leave-monthly/index', 'leave-monthly-index', 1, 'leave-monthly', 'index', 'index,create,view,update,delete'),
(72, 0, 50, 'Leave Setup', 2, NULL, 'leave-setup/index', 'leave-setup-index', 1, 'leave-setup', 'index', 'index,create,view,update,delete'),
(73, 0, 50, 'Monthly Leave', 2, NULL, 'leave-monthly/index', 'leave-monthly-index', 0, 'leave-monthly', 'index', 'index,create,view,update,delete'),
(74, 0, 49, 'Opening Balance', 0, 'fa fa-file-text-o', 'finance-opening-balance/index', 'finance-opening-balance-index', 1, 'finance-opening-balance', 'index', 'index,create,view,update,delete,void'),
(75, 1, 0, 'Supplier Profile', 13, 'demo-pli-male-female', '#', 'supplier-position-index supplier-department-index supplier-profile-index ', 1, '', '', 'index,create,view,update,delete'),
(76, 0, 76, 'Department', 2, NULL, 'supplier-department/index', 'supplier-department-index', 1, 'supplier-department', 'index', 'index,create,view,update,delete'),
(77, 0, 76, 'Position', 3, NULL, 'supplier-position/index', 'supplier-position-index', 1, 'supplier-position', 'index', 'index,create,view,update,delete');

-- --------------------------------------------------------

--
-- Table structure for table `permission_menu_live`
--

CREATE TABLE `permission_menu_live` (
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
  `extra_action` text DEFAULT NULL,
  `sort` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `description` text DEFAULT NULL,
  `cut_off_day` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
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
(1, 'eOBMS - EOH', 1, 1, NULL, NULL, NULL, NULL, '2019-09-01', '2019-09-08', '2019-10-10', 1, '', 2, NULL, 0, 2, 1, '2019-09-18 13:57:20', 1, '2019-09-16 14:58:04'),
(2, 'Attendant System', 1, 1, NULL, NULL, NULL, '0.00', '2019-10-16', '2019-12-20', '2019-10-31', 3, 'Company project', 4, NULL, 0, 1, NULL, NULL, 1, '2019-10-09 15:50:33');

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
(1, 1, 1),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_note`
--

CREATE TABLE `project_note` (
  `id` int(11) NOT NULL,
  `id_project` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL
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
  `description` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_timesheet`
--

INSERT INTO `project_timesheet` (`id`, `start_date`, `start_time`, `end_date`, `end_time`, `id_project`, `id_task`, `id_employee`, `note`, `description`, `status`, `updated_by`, `updated_date`, `created_by`, `created_date`) VALUES
(1, '2019-09-16', '1:00 AM', '2019-09-16', '2:00 AM', 1, 5, NULL, 'test', '', 1, 1, '2019-09-16 15:12:39', 1, '2019-09-16 15:11:33'),
(2, '2019-10-14', '6:00 AM', '2019-10-14', '8:00 AM', 2, 6, NULL, 'BMS Selling part', '', 1, NULL, NULL, 1, '2019-10-14 14:06:08');

-- --------------------------------------------------------

--
-- Table structure for table `project_timesheet_description`
--

CREATE TABLE `project_timesheet_description` (
  `id` int(11) NOT NULL,
  `id_project_timesheet` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_timesheet_description`
--

INSERT INTO `project_timesheet_description` (`id`, `id_project_timesheet`, `description`) VALUES
(4, 1, ''),
(5, 2, 'BMS selling part'),
(6, 2, 'BMS Expense part');

-- --------------------------------------------------------

--
-- Table structure for table `project_timesheet_member`
--

CREATE TABLE `project_timesheet_member` (
  `id` int(11) NOT NULL,
  `id_project_timesheet` int(11) DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `project_timesheet_member`
--

INSERT INTO `project_timesheet_member` (`id`, `id_project_timesheet`, `id_employee`) VALUES
(1, 2, 1);

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

--
-- Dumping data for table `proposal`
--

INSERT INTO `proposal` (`id`, `name`, `related_id`, `date`, `open_till`, `currency`, `discount_type`, `allow_comment`, `status`, `assigned`, `to`, `address`, `city`, `country`, `zip_code`, `email`, `phone`, `code`, `total`, `created_date`, `created_by`, `updated_date`, `updated_by`, `id_lead_customer`, `id_discount`, `discount_value`, `discount_amount`, `id_tax`, `is_tax`, `tax_amount`, `sub_total`, `grand_total`, `id_project`) VALUES
(1, 'test', 1, '2019-09-11', '2019-08-27', NULL, NULL, 1, 2, NULL, '', '', '', '', '', '', '', 'PRO19090001', '19.80', '2019-09-16 13:29:10', 1, '2019-09-17 08:51:50', 1, 1, 1, '10.00', '2.20', 1, 0, '0.00', '22.00', '19.80', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `proposal_data`
--

CREATE TABLE `proposal_data` (
  `id` int(11) NOT NULL,
  `id_proposal` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `discount_type` int(11) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proposal_data`
--

INSERT INTO `proposal_data` (`id`, `id_proposal`, `id_item`, `item_name`, `description`, `qty`, `rate`, `discount_type`, `discount_amount`, `amount`) VALUES
(4, 1, 1, 'eO-BMS (Standard)', '2222', 1, '22.00', 1, '0.00', '22.00');

-- --------------------------------------------------------

--
-- Table structure for table `proposal_note`
--

CREATE TABLE `proposal_note` (
  `id` int(11) NOT NULL,
  `id_proposal` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL
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

--
-- Dumping data for table `quotation`
--

INSERT INTO `quotation` (`id`, `name`, `id_customer`, `date`, `open_till`, `currency`, `discount_type`, `allow_comment`, `status`, `assigned`, `to`, `address`, `city`, `country`, `zip_code`, `email`, `phone`, `code`, `total`, `created_date`, `created_by`, `updated_date`, `updated_by`, `id_discount`, `discount_value`, `discount_amount`, `id_tax`, `is_tax`, `tax_amount`, `sub_total`, `is_converted_from_proposal`, `grand_total`, `id_project`, `close_sale_date`) VALUES
(1, NULL, 1, '2019-09-11', '2019-09-03', NULL, NULL, 1, 2, 1, 'EOH', 'SR', '', '', '', 'peter@eoh.com', '0987654321', 'QUT19090001', '22.00', '2019-09-17 09:37:02', 1, '2019-09-17 09:37:28', 1, 0, '0.00', '0.00', 1, 0, '0.00', '22.00', NULL, '22.00', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quotation_data`
--

CREATE TABLE `quotation_data` (
  `id` int(11) NOT NULL,
  `id_quotation` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `discount_type` int(11) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quotation_data`
--

INSERT INTO `quotation_data` (`id`, `id_quotation`, `id_item`, `item_name`, `description`, `qty`, `rate`, `discount_type`, `discount_amount`, `amount`) VALUES
(2, 1, 1, 'eO-BMS (Standard)', '2222', 1, '22.00', 1, '0.00', '22.00');

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
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `note` text DEFAULT NULL,
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
(1, 1, 2, 1, 1, 2019, 4, 0, 0, 0, 4, '', NULL, 1, '2019-10-14 13:45:02', NULL, NULL);

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
(1, 1, 1, 0, 0, 1, NULL, NULL),
(2, 1, 2, 0, 0, 1, NULL, NULL),
(3, 1, 3, 0, 0, 2, NULL, NULL),
(4, 1, 4, 0, 0, 0, NULL, NULL),
(5, 1, 5, 0, 0, 0, NULL, NULL),
(6, 1, 6, 0, 0, 0, NULL, NULL),
(7, 1, 7, 0, 0, 0, NULL, NULL),
(8, 1, 8, 0, 0, 0, NULL, NULL),
(9, 1, 9, 0, 0, 0, NULL, NULL),
(10, 1, 10, 0, 0, 0, NULL, NULL),
(11, 1, 11, 0, 0, 0, NULL, NULL),
(12, 1, 12, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sop_set_up_assign_position`
--

CREATE TABLE `sop_set_up_assign_position` (
  `id` int(11) NOT NULL,
  `sop_set_up_id` int(11) DEFAULT NULL,
  `id_position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sop_set_up_assign_position`
--

INSERT INTO `sop_set_up_assign_position` (`id`, `sop_set_up_id`, `id_position`) VALUES
(4, 1, 1);

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
  `id_employee_position` int(11) DEFAULT NULL,
  `id_standard_operation_step` int(11) DEFAULT NULL,
  `id_task` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `id_priority` int(11) DEFAULT NULL,
  `id_related_to` int(11) DEFAULT NULL,
  `id_related_profile` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `task_status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `standard_operation`
--

INSERT INTO `standard_operation` (`id`, `name`, `id_employee_position`, `id_standard_operation_step`, `id_task`, `created_date`, `created_by`, `updated_date`, `status`, `description`, `start_date`, `due_date`, `deadline`, `id_priority`, `id_related_to`, `id_related_profile`, `updated_by`, `task_status`) VALUES
(1, 'Testing', 1, 2, 3, '2019-10-30 13:16:22', 3, '2019-10-30 14:26:34', 1, '', '2019-10-30', NULL, NULL, 1, 2, 1, 1, 2);

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
  `description` text DEFAULT NULL,
  `id_standard_operation_step_list` int(11) DEFAULT NULL,
  `done_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `standard_operation_check_list`
--

INSERT INTO `standard_operation_check_list` (`id`, `name`, `assign_to`, `id_standard_operation`, `id_standard_operation_step`, `created_date`, `created_by`, `updated_date`, `updated_by`, `status`, `is_done`, `description`, `id_standard_operation_step_list`, `done_date`) VALUES
(6, NULL, NULL, 1, 2, '2019-10-30 14:25:55', 3, NULL, NULL, 1, 0, 'sss', 6, NULL),
(8, NULL, NULL, 1, 1, '2019-10-30 14:26:15', 1, NULL, NULL, 1, 1, '', 6, NULL),
(10, NULL, NULL, 1, 4, '2019-10-30 14:26:34', 1, NULL, NULL, 1, 1, 'sfdsfds', 7, '2019-10-30');

-- --------------------------------------------------------

--
-- Table structure for table `standard_operation_member`
--

CREATE TABLE `standard_operation_member` (
  `id` int(11) NOT NULL,
  `id_standard_operation` int(11) DEFAULT NULL,
  `id_position` int(11) DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `standard_operation_member`
--

INSERT INTO `standard_operation_member` (`id`, `id_standard_operation`, `id_position`, `id_employee`) VALUES
(27, 1, NULL, 1),
(28, 1, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `standard_operation_procedure_article`
--

CREATE TABLE `standard_operation_procedure_article` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_standard_operation_procedure_set_up` int(11) DEFAULT NULL,
  `id_position` int(11) DEFAULT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `standard_operation_procedure_article`
--

INSERT INTO `standard_operation_procedure_article` (`id`, `name`, `id_standard_operation_procedure_set_up`, `id_position`, `short_description`, `description`, `status`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 'hello world', 1, NULL, 'hello world testing', '<p>hello world testing in long text<br></p>', 1, '2019-09-18', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `standard_operation_procedure_set_up`
--

CREATE TABLE `standard_operation_procedure_set_up` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `standard_operation_procedure_set_up`
--

INSERT INTO `standard_operation_procedure_set_up` (`id`, `name`, `status`, `created_date`, `created_by`, `updated_date`, `updated_by`, `description`) VALUES
(1, 'testing on id position 7', 1, '2019-09-18', 1, '2019-10-01', 3, '<p>Date August 2019&nbsp;<br />\r\nTelephone Etiquette in hotels<br />\r\nSOP Number:&nbsp;FO-01 (SOP serial number and department code)<br />\r\nDepartment:&nbsp;Front Office - General<br />\r\nBasic Telephone Etiquettes:<br />\r\nWhat all points should be taken care of while answering a call?<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Phone should be answered within three rings.<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Smile even though you are on the telephone.<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Sit or stand up straight.<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Use a low voice pitch.<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Match your speaking rate to the caller&#39;s.<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Avoid extremes in volume.<br />\r\nStandard Phrase:<br />\r\nHow to answer an External call?<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Wish according to the time of the day (Good Morning, Afternoon or Evening), (Your Hotel Name), How may I help you.<br />\r\n&bull;&nbsp;&nbsp; &nbsp;How to answer Internal Guest calls?<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Wish according to the time of the day (Good Morning, Afternoon or Evening) Mr. _________ (Guest last name), This is ________(Your first name), How may I help you.<br />\r\n&bull;&nbsp;&nbsp; &nbsp;How to answer interdepartmental calls?<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Wish according to the time of the day (Good Morning, Afternoon or Evening), this is _______ (Your first name), How may I help you.<br />\r\nNote:&nbsp;check out more sample standard greetings used in the hotel.<br />\r\nTransferring a guest call:<br />\r\nHow to transfer a guest call?<br />\r\n&bull;&nbsp;&nbsp; &nbsp;While transferring a guest call you should say:<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Transferring your call with pleasure.<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Putting a guest call on hold:<br />\r\n&bull;&nbsp;&nbsp; &nbsp;How to put a guest call on hold?<br />\r\n&bull;&nbsp;&nbsp; &nbsp;While putting a guest call on hold you should say:<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Allow me to put your call on hold while I check for the information required&rdquo;<br />\r\nOr<br />\r\n&bull;&nbsp;&nbsp; &nbsp;&ldquo;Could I put your call on hold, while I check for the information required?&rdquo;<br />\r\nGuest Query:<br />\r\n&bull;&nbsp;&nbsp; &nbsp;How to handle a guest query?<br />\r\n&bull;&nbsp;&nbsp; &nbsp;For any guest query you should say:<br />\r\n&bull;&nbsp;&nbsp; &nbsp;I will be glad to assist you.<br />\r\nTraining Summary questions:<br />\r\nQ1. In how many rings phone should be picked up? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\nQ2. What is standard phrase of Picking up External and Internal calls? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\nQ3. Why we need to smile over phone?<br />\r\nQ4. What is correct posture while attending guest calls?&nbsp;<br />\r\nQ5. What is standard phrase for any internal guest call?<br />\r\nQ6. What should be the pitch of the voice while speaking to guests?</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `standard_operation_step`
--

CREATE TABLE `standard_operation_step` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_employee_position` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `css` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `standard_operation_step`
--

INSERT INTO `standard_operation_step` (`id`, `name`, `id_employee_position`, `created_date`, `created_by`, `updated_date`, `status`, `css`, `sort`, `updated_by`) VALUES
(1, 'testing sop', 1, '2019-09-18 14:55:40', 1, '2019-10-30 14:24:49', 1, '', NULL, 3),
(2, 'testing jet hz', 1, '2019-09-19 16:18:37', 1, '2019-09-19 16:21:17', 1, '#3399cc', 1, NULL),
(3, 'ABC', 2, '2019-10-18 16:01:44', 3, NULL, 1, '', NULL, NULL),
(4, 'testing 3', 1, '2019-10-30 14:18:36', 3, '2019-10-30 14:25:07', 1, '#db1c22', 3, 3);

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
  `status` int(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `is_track` varchar(5) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `standard_operation_step_list`
--

INSERT INTO `standard_operation_step_list` (`id`, `name`, `id_standard_operation_step`, `created_date`, `created_by`, `updated_date`, `status`, `sort`, `is_track`, `updated_by`) VALUES
(2, '22222', 2, '2019-09-19 16:21:17', 1, NULL, 1, NULL, '0', NULL),
(3, '123', 3, '2019-10-18 16:01:44', 3, NULL, 1, 1, '1', NULL),
(6, 'testing sop step list', 1, '2019-10-30 14:24:49', 3, NULL, 1, 1, '1', NULL),
(7, '21234324', 4, '2019-10-30 14:25:07', 3, NULL, 1, 1, '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_department`
--

CREATE TABLE `supplier_department` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_position`
--

CREATE TABLE `supplier_position` (
  `id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_profile`
--

CREATE TABLE `supplier_profile` (
  `id` int(11) NOT NULL,
  `id_supplier_profile_type` text DEFAULT NULL,
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
  `id_city` int(11) DEFAULT NULL
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
-- Table structure for table `supplier_profile_type`
--

CREATE TABLE `supplier_profile_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier_profile_type`
--

INSERT INTO `supplier_profile_type` (`id`, `name`, `status`, `created_by`, `created_date`, `updated_date`, `updated_by`) VALUES
(1, 'Vital', 1, 1, '2019-09-16 09:48:40', NULL, NULL);

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
  `description` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `id_assign_type` tinyint(1) DEFAULT NULL,
  `is_related_kpi` tinyint(4) DEFAULT 0,
  `kpi_status` tinyint(4) DEFAULT NULL,
  `id_employee_position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `task_name`, `id_billing_type`, `rate`, `start_date`, `due_date`, `deadline`, `id_priority`, `id_repeater`, `id_related_to`, `id_related_profile`, `description`, `status`, `updated_by`, `updated_date`, `created_by`, `created_date`, `id_assign_type`, `is_related_kpi`, `kpi_status`, `id_employee_position`) VALUES
(1, 'Testing', NULL, NULL, '2019-10-30', NULL, NULL, 1, NULL, 2, 1, '', 2, NULL, NULL, 3, '2019-10-30 13:16:22', 1, 0, NULL, 1),
(2, 'Testing', NULL, NULL, '2019-10-30', NULL, NULL, 1, NULL, 2, 1, '', 2, NULL, NULL, 3, '2019-10-30 13:16:22', 1, 0, NULL, 1),
(3, 'Testing', NULL, NULL, '2019-10-30', NULL, NULL, 1, NULL, 2, 1, '', 2, NULL, NULL, 3, '2019-10-30 13:16:22', 1, 1, 1, 1);

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

--
-- Dumping data for table `task_check_list`
--

INSERT INTO `task_check_list` (`id`, `id_task`, `description`, `from_time`, `to_time`, `status`) VALUES
(1, 1, '', '', '', 0),
(2, 2, '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `task_member`
--

CREATE TABLE `task_member` (
  `id` int(11) NOT NULL,
  `id_task` int(11) DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `task_member`
--

INSERT INTO `task_member` (`id`, `id_task`, `id_employee`) VALUES
(1, 1, 1),
(2, 2, 2);

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
(7, 'Proposal'),
(8, 'Other activity');

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
(1, 'NoPicAvailable.jpg', '/backend/uploads/NoPicAvailable.jpg', 65927, 'image/jpeg', NULL, b'1'),
(2, 'tick.jpg', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/quotation_template/a3/f94039939d5b984e87fa6c164c11b7_tick.jpg', 39819, 'image/jpeg', NULL, b'1'),
(3, '64928238_1098443577031984_1099220682396401664_o-15626829075d24a6', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/expense-attachment/f4/6862f1b09fc8da7cf954ce44edec71_64928238_1098443577031984_1099220682396401664_o-15626829075d24a61b7e9e4082376956.jpg', 89372, 'image/jpeg', NULL, b'1'),
(4, 'eo-logo-b.png', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/company-profile/44/196fb8ea60848c1b613a8a79196d31_eo-logo-b.png', 410782, 'image/png', NULL, b'1'),
(5, 'eo-techno-doc.png', '/backend/uploads/employee-profile/ee/c9843033e399fc12fb8e0d1ae64e0c_eo-techno-doc.png', 33995, 'image/png', NULL, b'1'),
(6, 'eo-resort-800.jpg', '/Applications/XAMPP/xamppfiles/htdocs/dropbox/eOCRM/backend/web/backend/uploads/supplier-profile/65/79060a97c5ef48e15033a5c9d26ab9_eo-resort-800.jpg', 94497, 'image/jpeg', NULL, b'1'),
(7, 'file.jpg', 'backend/uploads/employee-profile/40/7024d3e2a633cda45030fbaa8efe20_file.jpg', 133712, 'image/jpeg', NULL, b'1'),
(8, 'eo-logo-b.png', 'backend/uploads/company-profile/f6/eb7c2f682f850a0e6185336c16bde2_eo-logo-b.png', 410782, 'image/png', NULL, b'1'),
(9, 'eo_foundation_profile.jpg', 'backend/uploads/quotation_template/c7/6d244e1d97b79ec7a222198fc7ced1_eo_foundation_profile.jpg', 57268, 'image/jpeg', NULL, b'1'),
(10, 'eo_foundation_profile.png', 'backend/uploads/quotation_template/8a/955dc1dc24e202e685394097b12acc_eo_foundation_profile.png', 56848, 'image/png', NULL, b'1'),
(11, 'eo_foundation_profile.png', 'backend/uploads/employee-profile/64/015969315b91483fa2d9b71eee183f_eo_foundation_profile.png', 56848, 'image/png', NULL, b'1'),
(12, 'tick.png', 'backend/uploads/employee-profile/84/c3acbb9945d8e69ce4353ba5849fc7_tick.png', 34089, 'image/png', NULL, b'1'),
(13, 'tick.png', 'backend/uploads/employee-profile/a0/ed2dd46e3a89532e6d6c844ca17086_tick.png', 34089, 'image/png', NULL, b'1'),
(14, '6b82e286572933.5d9dac6ea7e82.jpg', 'backend/uploads/employee-profile/d0/38362d48088461b6c6977a15937a9d_6b82e286572933.5d9dac6ea7e82.jpg', 405326, 'image/jpeg', NULL, b'1'),
(15, '6b82e286572933.5d9dac6ea7e82.jpg', 'backend/uploads/employee-profile/6b/622ab11aa1fdba4863c80d2a4a5a4a_6b82e286572933.5d9dac6ea7e82.jpg', 405326, 'image/jpeg', NULL, b'1'),
(16, '6b82e286572933.5d9dac6ea7e82.jpg', 'backend/uploads/employee-profile/9d/931105ecf66ba7d379dd619c1a1795_6b82e286572933.5d9dac6ea7e82.jpg', 405326, 'image/jpeg', NULL, b'1'),
(17, '6b82e286572933.5d9dac6ea7e82.jpg', 'backend/uploads/employee-profile/cd/3dc30a0a567a42f961946862d7881c_6b82e286572933.5d9dac6ea7e82.jpg', 405326, 'image/jpeg', NULL, b'1'),
(18, '6b82e286572933.5d9dac6ea7e82.jpg', 'backend/uploads/employee-profile/34/2889d9e25dc4327639749e4327a31e_6b82e286572933.5d9dac6ea7e82.jpg', 405326, 'image/jpeg', NULL, b'1'),
(19, '6f637e86572933.5d9dac6ea7840.jpg', 'backend/uploads/employee-profile/93/5d00b5810c7e36656b749ede39d368_6f637e86572933.5d9dac6ea7840.jpg', 285192, 'image/jpeg', NULL, b'1');

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
(1, 1, 'systemadmin@eocambo.com', '$2y$13$58f7hH5s7s9X.R/V7fge2.gdJ0Wmr9bqjYHz0yuQtlEapokTIsH46', NULL, '8tdRr0KstxcAKFdZ00UWb_SjnK73M5uz', 1, 1, '2019-07-10 20:07:12', '2019-07-17 08:38:48', 1, NULL, NULL, NULL, 'System', 'Admin', '', '', '20', 'systemadmin', 2, NULL, NULL),
(2, 1, '', '$2y$13$58f7hH5s7s9X.R/V7fge2.gdJ0Wmr9bqjYHz0yuQtlEapokTIsH46', NULL, '8tdRr0KstxcAKFdZ00UWb_SjnK73M5uz', 1, 1, '2019-09-17 09:35:41', '2019-10-02 08:32:43', 1, NULL, NULL, NULL, 'dara', 'tester', 'Mr.', '', '7', 'tester', NULL, 1, 1),
(3, 1, '', '$2y$13$RL6MA6M5IUI50XIcfy080OcLSScyy.E./w..hrDu90NO1xoI5Toka', NULL, 'jMKjHHF_-SYEUz7HAViFEfaiPrDOXhDa', 1, 1, '2019-09-20 09:09:28', '2019-10-28 14:25:21', 1, NULL, NULL, NULL, 'mara', 'ko', 'Ms.', '', '16', 'marako', NULL, 2, 1);

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
(1, b'1', 'Super Admin', 1, NULL, NULL, '2019-10-22 11:08:15', 1),
(2, b'1', 'Sales', 1, NULL, NULL, '2019-09-03 15:17:16', 13),
(3, b'1', 'Web Developer', 1, NULL, NULL, '2019-09-03 16:23:38', 1),
(4, b'1', 'Senior Web Developer', NULL, '2019-09-04 10:01:05', 1, '2019-09-04 10:02:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `working_group`
--

CREATE TABLE `working_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `working_group`
--

INSERT INTO `working_group` (`id`, `name`, `description`, `status`, `updated_by`, `updated_date`, `created_by`, `created_date`) VALUES
(1, 'Web Department', '', 1, 1, '2019-09-16 09:50:40', 1, '2019-09-16 09:50:09');

-- --------------------------------------------------------

--
-- Table structure for table `working_group_data`
--

CREATE TABLE `working_group_data` (
  `id` int(11) NOT NULL,
  `id_working_group` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `working_group_data`
--

INSERT INTO `working_group_data` (`id`, `id_working_group`, `id_user`) VALUES
(3, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `working_group_department`
--

CREATE TABLE `working_group_department` (
  `id` int(11) NOT NULL,
  `id_working_group` int(11) DEFAULT NULL,
  `id_department` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `working_group_department`
--

INSERT INTO `working_group_department` (`id`, `id_working_group`, `id_department`) VALUES
(1, 1, 2);

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
-- Indexes for table `contract_customer_contact`
--
ALTER TABLE `contract_customer_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_data`
--
ALTER TABLE `contract_data`
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
-- Indexes for table `customer_type`
--
ALTER TABLE `customer_type`
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
-- Indexes for table `finance_opening_balance`
--
ALTER TABLE `finance_opening_balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_pay_bill`
--
ALTER TABLE `finance_pay_bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_pay_bill_data`
--
ALTER TABLE `finance_pay_bill_data`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `hr_approval_permission`
--
ALTER TABLE `hr_approval_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_approval_permission_data`
--
ALTER TABLE `hr_approval_permission_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_approval_permission_department`
--
ALTER TABLE `hr_approval_permission_department`
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
-- Indexes for table `item_data`
--
ALTER TABLE `item_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_group`
--
ALTER TABLE `item_group`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `item_group_data`
--
ALTER TABLE `item_group_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_group_department`
--
ALTER TABLE `item_group_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_group_template_detail`
--
ALTER TABLE `item_group_template_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_group_type`
--
ALTER TABLE `item_group_type`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `leave_monthly`
--
ALTER TABLE `leave_monthly`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_monthly_data`
--
ALTER TABLE `leave_monthly_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_role`
--
ALTER TABLE `leave_role`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `leave_setup`
--
ALTER TABLE `leave_setup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_setup_data`
--
ALTER TABLE `leave_setup_data`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `permission_menu_live`
--
ALTER TABLE `permission_menu_live`
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
-- Indexes for table `sop_set_up_assign_position`
--
ALTER TABLE `sop_set_up_assign_position`
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
-- Indexes for table `standard_operation_member`
--
ALTER TABLE `standard_operation_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standard_operation_procedure_article`
--
ALTER TABLE `standard_operation_procedure_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standard_operation_procedure_set_up`
--
ALTER TABLE `standard_operation_procedure_set_up`
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
-- Indexes for table `supplier_department`
--
ALTER TABLE `supplier_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_position`
--
ALTER TABLE `supplier_position`
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
-- Indexes for table `supplier_profile_type`
--
ALTER TABLE `supplier_profile_type`
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
-- Indexes for table `working_group`
--
ALTER TABLE `working_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `working_group_data`
--
ALTER TABLE `working_group_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `working_group_department`
--
ALTER TABLE `working_group_department`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contract_customer_contact`
--
ALTER TABLE `contract_customer_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_data`
--
ALTER TABLE `contract_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contract_note`
--
ALTER TABLE `contract_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_type`
--
ALTER TABLE `contract_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_invoice_data`
--
ALTER TABLE `customer_invoice_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customer_invoice_tag`
--
ALTER TABLE `customer_invoice_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_payment`
--
ALTER TABLE `customer_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_profile`
--
ALTER TABLE `customer_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer_profile_contact`
--
ALTER TABLE `customer_profile_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_profile_group`
--
ALTER TABLE `customer_profile_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_profile_note`
--
ALTER TABLE `customer_profile_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_profile_solution`
--
ALTER TABLE `customer_profile_solution`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `customer_type`
--
ALTER TABLE `customer_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `document_format`
--
ALTER TABLE `document_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `employee_position`
--
ALTER TABLE `employee_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_profile`
--
ALTER TABLE `employee_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `event_list`
--
ALTER TABLE `event_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `expense_data`
--
ALTER TABLE `expense_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `expense_related_to`
--
ALTER TABLE `expense_related_to`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `finance_chart_of_account`
--
ALTER TABLE `finance_chart_of_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `finance_chart_of_account_amount`
--
ALTER TABLE `finance_chart_of_account_amount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `finance_opening_balance`
--
ALTER TABLE `finance_opening_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `finance_pay_bill`
--
ALTER TABLE `finance_pay_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `finance_pay_bill_data`
--
ALTER TABLE `finance_pay_bill_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `folder`
--
ALTER TABLE `folder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hls_solutions`
--
ALTER TABLE `hls_solutions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_approval_permission`
--
ALTER TABLE `hr_approval_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hr_approval_permission_data`
--
ALTER TABLE `hr_approval_permission_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `hr_approval_permission_department`
--
ALTER TABLE `hr_approval_permission_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `invoice_status`
--
ALTER TABLE `invoice_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `item_data`
--
ALTER TABLE `item_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_group`
--
ALTER TABLE `item_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `item_group_data`
--
ALTER TABLE `item_group_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_group_department`
--
ALTER TABLE `item_group_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_group_template_detail`
--
ALTER TABLE `item_group_template_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `item_group_type`
--
ALTER TABLE `item_group_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lead_profile_note`
--
ALTER TABLE `lead_profile_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leave_application`
--
ALTER TABLE `leave_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leave_in_the_year`
--
ALTER TABLE `leave_in_the_year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_in_the_year_data`
--
ALTER TABLE `leave_in_the_year_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_monthly`
--
ALTER TABLE `leave_monthly`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leave_monthly_data`
--
ALTER TABLE `leave_monthly_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `leave_role`
--
ALTER TABLE `leave_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leave_setup`
--
ALTER TABLE `leave_setup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `leave_setup_data`
--
ALTER TABLE `leave_setup_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membership_payment`
--
ALTER TABLE `membership_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membership_profile`
--
ALTER TABLE `membership_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1222;

--
-- AUTO_INCREMENT for table `permission_action_data`
--
ALTER TABLE `permission_action_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission_menu`
--
ALTER TABLE `permission_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `permission_menu_live`
--
ALTER TABLE `permission_menu_live`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_timesheet`
--
ALTER TABLE `project_timesheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project_timesheet_description`
--
ALTER TABLE `project_timesheet_description`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `project_timesheet_member`
--
ALTER TABLE `project_timesheet_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `project_timesheet_tag`
--
ALTER TABLE `project_timesheet_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal`
--
ALTER TABLE `proposal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `proposal_data`
--
ALTER TABLE `proposal_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quotation_data`
--
ALTER TABLE `quotation_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sop_goal_setup_data`
--
ALTER TABLE `sop_goal_setup_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sop_set_up_assign_position`
--
ALTER TABLE `sop_set_up_assign_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `source`
--
ALTER TABLE `source`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `standard_operation`
--
ALTER TABLE `standard_operation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `standard_operation_check_list`
--
ALTER TABLE `standard_operation_check_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `standard_operation_member`
--
ALTER TABLE `standard_operation_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `standard_operation_procedure_article`
--
ALTER TABLE `standard_operation_procedure_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `standard_operation_procedure_set_up`
--
ALTER TABLE `standard_operation_procedure_set_up`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `standard_operation_step`
--
ALTER TABLE `standard_operation_step`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `standard_operation_step_list`
--
ALTER TABLE `standard_operation_step_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `supplier_department`
--
ALTER TABLE `supplier_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier_position`
--
ALTER TABLE `supplier_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier_profile`
--
ALTER TABLE `supplier_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier_profile_tag`
--
ALTER TABLE `supplier_profile_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_profile_type`
--
ALTER TABLE `supplier_profile_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `task_check_list`
--
ALTER TABLE `task_check_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `task_member`
--
ALTER TABLE `task_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `task_related_to`
--
ALTER TABLE `task_related_to`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `working_group`
--
ALTER TABLE `working_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `working_group_data`
--
ALTER TABLE `working_group_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `working_group_department`
--
ALTER TABLE `working_group_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
