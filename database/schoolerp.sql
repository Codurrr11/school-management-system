-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2026 at 03:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schoolerp`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_sessions`
--

CREATE TABLE `academic_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_current` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `academic_sessions`
--

INSERT INTO `academic_sessions` (`id`, `school_id`, `name`, `start_date`, `end_date`, `is_current`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-27', '2026-04-01', '2027-03-31', 1, '2026-06-15 10:26:11', '2026-06-15 10:26:11');

-- --------------------------------------------------------

--
-- Table structure for table `admission_form_settings`
--

CREATE TABLE `admission_form_settings` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `show_fields` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admission_form_settings`
--

INSERT INTO `admission_form_settings` (`id`, `school_id`, `show_fields`) VALUES
(1, 1, '[\"name\",\"mobile_no\",\"whatsapp_no\",\"admission_no\",\"registration_no\",\"enrollment_no\",\"sr_no\",\"class_name\",\"section_name\",\"gender\",\"city\",\"state\",\"country\",\"blood_group\",\"caste\",\"category\",\"religion\",\"nationality\",\"date_of_birth\",\"admission_type\",\"mother_name\",\"father_name\",\"father_occupation\",\"mother_mobile\",\"father_mobile\",\"admission_date\",\"dob_certificate_no\",\"mother_aadhar\",\"father_aadhar\",\"samagra_id\"]');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `class_name` varchar(50) NOT NULL,
  `roman_number` varchar(10) DEFAULT NULL,
  `class_code` varchar(20) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `status` varchar(20) DEFAULT 'active',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `school_id`, `name`, `created_at`, `class_name`, `roman_number`, `class_code`, `sort_order`, `status`, `updated_at`) VALUES
(1, 1, 'Class 1', '2026-06-15 10:42:23', 'Class 1', 'I', 'C1', 3, 'active', '2026-06-26 07:38:14'),
(2, 1, 'Class 2', '2026-06-15 10:42:23', 'Class 2', 'II', 'C2', 4, 'active', '2026-06-26 07:38:14'),
(3, 1, 'Class 3', '2026-06-15 10:42:23', 'Class 3', 'III', 'C3', 5, 'active', '2026-06-26 07:38:14'),
(4, 1, 'Class 4', '2026-06-15 10:42:23', 'Class 4', 'IV', 'C4', 6, 'active', '2026-06-26 07:38:14'),
(5, 1, 'Nursery', '2026-06-15 10:42:23', 'Nursery', 'NUR', 'NUR', 0, 'active', '2026-06-26 07:38:14'),
(6, 1, 'Class 5', '2026-06-15 10:42:23', 'Class 5', 'V', 'C5', 7, 'active', '2026-06-26 07:38:14'),
(7, 1, 'LKG', '2026-06-26 07:38:14', 'LKG', 'LKG', 'LKG', 1, 'active', '2026-06-26 07:38:14'),
(8, 1, 'UKG', '2026-06-26 07:38:14', 'UKG', 'UKG', 'UKG', 2, 'active', '2026-06-26 07:38:14'),
(9, 1, 'Class 6', '2026-06-26 07:38:14', 'Class 6', 'VI', 'C6', 8, 'active', '2026-06-26 07:38:14'),
(10, 1, 'Class 7', '2026-06-26 07:38:14', 'Class 7', 'VII', 'C7', 9, 'active', '2026-06-26 07:38:14'),
(11, 1, 'Class 8', '2026-06-26 07:38:14', 'Class 8', 'VIII', 'C8', 10, 'active', '2026-06-26 07:38:14'),
(12, 1, 'Class 9', '2026-06-26 07:38:14', 'Class 9', 'IX', 'C9', 12, 'active', '2026-06-26 12:35:02'),
(13, 1, 'Class 10', '2026-06-26 07:38:14', 'Class 10', 'X', 'C10', 13, 'active', '2026-06-26 12:35:02'),
(14, 1, 'Class 11', '2026-06-26 07:38:14', 'Class 11', 'XI', 'C11', 14, 'active', '2026-06-26 12:35:02'),
(15, 1, 'Class 12', '2026-06-26 07:38:14', 'Class 12', 'XII', 'C12', 15, 'active', '2026-06-26 12:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_todos`
--

CREATE TABLE `dashboard_todos` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `due_label` varchar(100) DEFAULT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_todos`
--

INSERT INTO `dashboard_todos` (`id`, `school_id`, `user_id`, `title`, `due_label`, `is_completed`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Chai Peeni hai', 'Chai', 0, 0, '2026-06-26 18:41:30', '2026-06-26 18:41:30');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `expense_type` varchar(150) NOT NULL COMMENT 'Maps to expense_categories.name',
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `payment_mode` varchar(50) NOT NULL COMMENT 'Cash, UPI, Bank Transfer, Cheque, DD, Online',
  `payment_account` varchar(150) DEFAULT NULL,
  `paid_by` varchar(150) DEFAULT NULL COMMENT 'Staff who paid',
  `paid_to` varchar(150) DEFAULT NULL COMMENT 'Vendor / party paid to',
  `narration` varchar(255) DEFAULT NULL,
  `payment_txn_id` varchar(200) DEFAULT NULL,
  `expense_date` datetime NOT NULL,
  `voucher_no` varchar(100) DEFAULT NULL,
  `utr_reference_no` varchar(200) DEFAULT NULL,
  `prepared_by` varchar(150) DEFAULT NULL,
  `approved_by` varchar(150) DEFAULT NULL,
  `received_by` varchar(150) DEFAULT NULL,
  `expense_details` text DEFAULT NULL COMMENT 'Rich-text/plain notes',
  `files` text DEFAULT NULL COMMENT 'JSON array of file paths',
  `created_by` int(11) DEFAULT NULL COMMENT 'users.id',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL COMMENT 'Soft-delete timestamp'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `school_id`, `expense_type`, `amount`, `payment_mode`, `payment_account`, `paid_by`, `paid_to`, `narration`, `payment_txn_id`, `expense_date`, `voucher_no`, `utr_reference_no`, `prepared_by`, `approved_by`, `received_by`, `expense_details`, `files`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Refreshment', 450.00, 'Cash', 'Cash in Hand', 'Madhu Singh', 'Sharma Tea Stall', 'Tea and snacks for staff meeting', NULL, '2026-06-20 10:30:00', 'V-2026-001', NULL, 'Madhu Singh', 'Admin', 'Ramesh Sharma', 'Refreshment for weekly review meeting.', NULL, 2, '2026-06-20 12:26:44', NULL, NULL),
(2, 1, 'Stationery', 1200.00, 'UPI', 'HDFC Bank', 'Kunal Verma', 'Vikas Stationers', 'A4 paper packets and white board markers', 'TXN1234567890', '2026-06-19 14:15:00', 'V-2026-002', 'UTR9876543210', 'Kunal Verma', 'Admin', 'Vikas Gupta', 'Purchase of office stationery.', NULL, 2, '2026-06-20 12:26:44', '2026-06-20 12:27:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `school_id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Staff Salary Payments', '2026-06-19 11:09:29', NULL, NULL),
(2, 1, 'Refreshment', '2026-06-19 11:09:29', NULL, NULL),
(3, 1, 'Chalkpiece', '2026-06-19 11:09:29', NULL, NULL),
(4, 1, 'Medical Expenses', '2026-06-19 11:09:29', NULL, NULL),
(5, 1, 'Stationery', '2026-06-19 11:09:29', NULL, NULL),
(6, 1, 'Printing And Stationary', '2026-06-19 11:09:29', NULL, NULL),
(7, 1, 'Book', '2026-06-19 11:09:29', NULL, NULL),
(8, 1, 'Budget', '2026-06-19 11:09:29', NULL, NULL),
(9, 1, 'Staff Welfare', '2026-06-19 11:09:29', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fees_settings`
--

CREATE TABLE `fees_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `fees_months` text DEFAULT NULL COMMENT 'CSV of month short-codes, e.g. Apr,May,Jun',
  `transport_fees_months` text DEFAULT NULL COMMENT 'CSV of month short-codes',
  `receipt_label` varchar(100) DEFAULT 'Fees Receipt',
  `receipt_prefix` varchar(20) DEFAULT NULL,
  `start_receipt_no` varchar(30) DEFAULT NULL,
  `receipt_no_updated_at` datetime DEFAULT NULL,
  `font_header_school_name` int(11) DEFAULT 18,
  `font_header_details` int(11) DEFAULT 12,
  `font_receipt_title` int(11) DEFAULT 14,
  `font_other_details` int(11) DEFAULT 12,
  `logo_width` int(11) DEFAULT 60,
  `receipt_fields` text DEFAULT NULL,
  `qr_code_path` varchar(255) DEFAULT NULL,
  `fine_enabled` tinyint(1) DEFAULT 1,
  `fine_same_day` tinyint(1) DEFAULT 1,
  `receipt_options` longtext DEFAULT NULL,
  `receipt_print_layout` varchar(50) DEFAULT NULL,
  `notifications` longtext DEFAULT NULL,
  `receipt_note` text DEFAULT NULL,
  `migrated_students_enabled` tinyint(1) DEFAULT 1,
  `low_fees_notice_enabled` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fees_settings`
--

INSERT INTO `fees_settings` (`id`, `school_id`, `fees_months`, `transport_fees_months`, `receipt_label`, `receipt_prefix`, `start_receipt_no`, `receipt_no_updated_at`, `font_header_school_name`, `font_header_details`, `font_receipt_title`, `font_other_details`, `logo_width`, `receipt_fields`, `qr_code_path`, `fine_enabled`, `fine_same_day`, `receipt_options`, `receipt_print_layout`, `notifications`, `receipt_note`, `migrated_students_enabled`, `low_fees_notice_enabled`, `created_at`, `updated_at`) VALUES
(1, 1, 'Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec,Jan,Feb,Mar', 'Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec,Jan,Feb,Mar', 'Fees Receipt', 'REC', '', '2026-06-19 12:26:18', 18, 12, 14, 12, 60, '', NULL, 1, 1, '{\"show_logo\":1,\"show_org_address\":1,\"show_affiliation_code\":1,\"show_affiliated_to\":1,\"show_org_code\":1,\"show_phone\":1,\"show_email\":1,\"show_watermark_receipt\":1,\"show_watermark_demand\":1,\"show_tagline\":1,\"show_gst\":0,\"show_accountant_signature\":1,\"print_qr_demand\":0,\"print_qr_receipt\":0,\"regen_receipt_no_on_delete\":1,\"regen_receipt_no_on_session\":1,\"hide_amount_in_words\":0,\"print_single_page\":1,\"open_print_next_tab\":1,\"hide_received_by\":0,\"admin_select_past_date\":1}', '', '{\"sms_fees_received_enabled\":1,\"sms_fees_received_template\":\"Online Paymnt Received - Parent\",\"sms_fees_received_gateway_enabled\":0,\"sms_defaulter_enabled\":0,\"app_fees_received_enabled\":1,\"app_fees_received_gateway_enabled\":1,\"app_defaulter_enabled\":1,\"admin_fees_collection_sms_enabled\":1,\"admin_fees_collection_mobiles\":\"\",\"admin_fees_collection_template\":\"Online Paymnt Received - Parent\",\"admin_fees_collection_gateway_sms_enabled\":1,\"admin_fees_collection_gateway_mobiles\":\"\",\"admin_fees_collection_gateway_template\":\"Fee Received Alert!\",\"admin_daily_total_sms_enabled\":1,\"admin_daily_total_mobiles\":\"\",\"admin_daily_total_time\":\"10:00 AM\",\"admin_daily_total_template\":\"Online Paymnt Received - Parent\",\"wa_fees_received_enabled\":1,\"wa_fees_received_template\":\"\",\"wa_defaulter_enabled\":1,\"wa_defaulter_template\":\"\"}', '', 1, 0, '2026-06-19 10:26:18', '2026-06-19 10:26:18');

-- --------------------------------------------------------

--
-- Table structure for table `fee_payments`
--

CREATE TABLE `fee_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `fine_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_date` datetime NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `screenshot` varchar(255) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `source` varchar(100) DEFAULT NULL,
  `referred_by` varchar(100) DEFAULT NULL,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `mobile_no` varchar(20) NOT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `mother_qualification` varchar(100) DEFAULT NULL,
  `mother_address` text DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL,
  `mother_official_address` text DEFAULT NULL,
  `mother_income` varchar(50) DEFAULT NULL,
  `mother_email` varchar(150) DEFAULT NULL,
  `mother_mobile` varchar(20) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `father_qualification` varchar(100) DEFAULT NULL,
  `father_address` text DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `father_official_address` text DEFAULT NULL,
  `father_income` varchar(50) DEFAULT NULL,
  `father_email` varchar(150) DEFAULT NULL,
  `father_mobile` varchar(20) DEFAULT NULL,
  `nationality` varchar(100) DEFAULT 'INDIAN',
  `religion` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `aadhar_no` varchar(50) DEFAULT NULL,
  `last_school_name` varchar(255) DEFAULT NULL,
  `last_school_class` varchar(100) DEFAULT NULL,
  `last_school_affiliation` varchar(100) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT 'India',
  `address` text DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Interested',
  `remark` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `assigned_to` bigint(20) UNSIGNED DEFAULT NULL,
  `scheduled_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `school_id`, `session_id`, `class_id`, `source`, `referred_by`, `first_name`, `last_name`, `email`, `mobile_no`, `gender`, `dob`, `mother_name`, `mother_qualification`, `mother_address`, `mother_occupation`, `mother_official_address`, `mother_income`, `mother_email`, `mother_mobile`, `father_name`, `father_qualification`, `father_address`, `father_occupation`, `father_official_address`, `father_income`, `father_email`, `father_mobile`, `nationality`, `religion`, `category`, `aadhar_no`, `last_school_name`, `last_school_class`, `last_school_affiliation`, `pincode`, `city`, `state`, `country`, `address`, `status`, `remark`, `photo`, `created_by`, `assigned_to`, `scheduled_at`, `created_at`, `updated_at`, `deleted_at`, `sort_order`) VALUES
(1, 1, 1, 1, NULL, NULL, 'Jsjsjs', 'Djdjnd', NULL, '9464916691', NULL, NULL, 'Dbjdnd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'INDIAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'India', 'Dndjjd', 'Interested', '', NULL, 2, NULL, NULL, '2026-06-19 04:24:04', '2026-06-26 12:49:29', '2026-06-25 07:09:03', 1),
(2, 1, 1, 2, NULL, NULL, 'Pulkit', 'Yadav', NULL, '7303527855', NULL, NULL, 'Poonam Yadav', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Brijesh Yadav', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'INDIAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'India', 'Vivek Khand Lucknow UTTAR PRADESH', 'Interested', 'Admission created', NULL, 2, NULL, NULL, '2026-04-28 10:30:57', '2026-06-26 13:14:04', '2026-06-26 13:14:04', 2),
(3, 1, 1, 1, NULL, NULL, 'Vinod', 'Singh', NULL, '9198110991', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'INDIAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'India', '', 'Interested', 'Admission created', NULL, 2, NULL, NULL, '2026-04-05 17:41:55', '2026-06-26 12:49:29', NULL, 3),
(4, 1, 1, 3, NULL, NULL, 'Kvvya', 'Gupta', NULL, '8899889900', NULL, NULL, 'Amita', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Manoj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'INDIAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'India', '', 'Interested', 'Admission created', NULL, 2, NULL, NULL, '2026-03-18 07:58:46', '2026-06-26 12:49:29', NULL, 4),
(5, 1, 1, 3, NULL, NULL, 'Aman', 'Kumar', NULL, '9900000099', NULL, NULL, 'Maya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kishor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'INDIAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'India', 'Bhopal', 'Interested', 'Admission created', NULL, 2, NULL, NULL, '2026-03-18 06:56:25', '2026-06-26 12:49:29', NULL, 5),
(6, 1, 1, 2, NULL, NULL, 'Akash', 'Aksh', NULL, '9909990011', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'INDIAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'India', '', 'Interested', 'Admission created', NULL, 2, NULL, NULL, '2026-03-18 06:26:27', '2026-06-26 12:49:29', NULL, 6),
(7, 1, 1, 1, NULL, NULL, 'Amit', 'Sharma', NULL, '7867676767', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'INDIAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'India', '', 'Interested', 'Admission created', NULL, 2, NULL, NULL, '2026-01-28 13:11:45', '2026-06-26 12:49:29', NULL, 7),
(8, 1, 1, 1, NULL, NULL, 'Amit', '', NULL, '5645453434', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'INDIAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'India', '', 'Interested', '', NULL, 2, NULL, NULL, '2026-01-28 13:10:53', '2026-06-26 12:49:29', NULL, 8),
(9, 1, 1, 2, NULL, NULL, 'Test', '', NULL, '1234567890', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'INDIAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'India', '', 'Interested', '', NULL, 2, NULL, NULL, '2026-01-22 09:45:02', '2026-06-26 12:49:29', NULL, 9),
(10, 1, 1, 2, '', '', 'VANSI', 'PANDEY', '', '7007300825', 'female', NULL, 'JYOTI', '', '', '', '', '', '', '', 'PRANESH', '', '', '', '', '', '', '', 'INDIAN', '', '', '', '', '', '', '', '', '', 'India', 'KATHARI BAZAR', 'Admission Created', 'Admission created', NULL, 2, NULL, '2026-01-20 20:06:00', '2026-01-20 14:32:55', '2026-06-26 12:49:29', NULL, 10);

-- --------------------------------------------------------

--
-- Table structure for table `lead_sources`
--

CREATE TABLE `lead_sources` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lead_sources`
--

INSERT INTO `lead_sources` (`id`, `school_id`, `name`, `created_at`) VALUES
(1, 1, 'Facebook', '2026-06-22 07:31:20'),
(2, 1, 'Instagram', '2026-06-22 07:31:20'),
(3, 1, 'Google', '2026-06-22 07:31:20'),
(4, 1, 'Reference', '2026-06-22 07:31:20'),
(5, 1, 'Banner / Flyer', '2026-06-22 07:31:20'),
(6, 1, 'Walk-in', '2026-06-22 07:31:20');

-- --------------------------------------------------------

--
-- Table structure for table `lead_statuses`
--

CREATE TABLE `lead_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `sort_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lead_statuses`
--

INSERT INTO `lead_statuses` (`id`, `school_id`, `name`, `color`, `created_at`, `sort_order`) VALUES
(1, 1, 'Interested', 'success', '2026-06-22 07:31:20', 1),
(2, 1, 'not interested', 'danger', '2026-06-22 07:31:20', 2),
(3, 1, 'ADMIN', 'success-light', '2026-06-22 07:31:20', 3),
(4, 1, 'follow-up', 'info', '2026-06-22 07:31:20', 4),
(5, 1, 'call back', 'warning', '2026-06-22 07:31:20', 5),
(6, 1, 'Intersted', 'danger-dark', '2026-06-22 07:31:20', 6),
(7, 1, 'Admission Created', 'teal', '2026-06-22 07:31:20', 7);

-- --------------------------------------------------------

--
-- Table structure for table `online_fee_payments`
--

CREATE TABLE `online_fee_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `school_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `order_id` varchar(120) NOT NULL DEFAULT '',
  `payment_id` varchar(120) NOT NULL DEFAULT '',
  `payment_method` varchar(80) NOT NULL DEFAULT '',
  `amount_types` varchar(255) NOT NULL DEFAULT '',
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status` enum('Success','Failed','Incomplete') NOT NULL DEFAULT 'Incomplete',
  `payment_date` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `alternate_mobile` varchar(20) DEFAULT NULL,
  `whatsapp_no` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT 'male',
  `parent_type` enum('Father','Mother','Guardian') NOT NULL,
  `aadhaar_no` varchar(20) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `company_name` varchar(150) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `company_address` text DEFAULT NULL,
  `company_phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT 'India',
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`id`, `school_id`, `user_id`, `first_name`, `last_name`, `mobile`, `alternate_mobile`, `whatsapp_no`, `email`, `gender`, `parent_type`, `aadhaar_no`, `qualification`, `occupation`, `company_name`, `designation`, `company_address`, `company_phone`, `address`, `pincode`, `city`, `state`, `country`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, 'Ramesh', 'Gupta', '9876543210', '', '9876543210', 'ramesh.gupta@example.com', 'male', 'Father', '123456789014', 'Post Graduate', 'Engineer', 'Tech Solutions India', 'Senior Manager', '', '', 'A-12, Sector 4, Rohini', '110085', 'New Delhi', 'Delhi', 'India', 'active', '2026-06-27 07:32:18', '2026-06-27 07:32:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parent_students`
--

CREATE TABLE `parent_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parent_students`
--

INSERT INTO `parent_students` (`id`, `parent_id`, `student_id`) VALUES
(2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment_bank_accounts`
--

CREATE TABLE `payment_bank_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `school_id` int(10) UNSIGNED NOT NULL,
  `bank_name` varchar(255) NOT NULL DEFAULT '',
  `branch` varchar(255) NOT NULL DEFAULT '',
  `ifsc_code` varchar(20) NOT NULL DEFAULT '',
  `address` text NOT NULL,
  `account_holder` varchar(255) NOT NULL DEFAULT '',
  `account_no` varchar(50) NOT NULL DEFAULT '',
  `linked_mobile` varchar(20) NOT NULL DEFAULT '',
  `linked_email` varchar(255) NOT NULL DEFAULT '',
  `bank_mobile` varchar(20) NOT NULL DEFAULT '',
  `bank_email` varchar(255) NOT NULL DEFAULT '',
  `upi` varchar(100) NOT NULL DEFAULT '',
  `payment_modes` varchar(255) NOT NULL DEFAULT '',
  `opening_balance` decimal(14,2) NOT NULL DEFAULT 0.00,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `remark` text DEFAULT NULL,
  `added_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_bank_accounts`
--

INSERT INTO `payment_bank_accounts` (`id`, `school_id`, `bank_name`, `branch`, `ifsc_code`, `address`, `account_holder`, `account_no`, `linked_mobile`, `linked_email`, `bank_mobile`, `bank_email`, `upi`, `payment_modes`, `opening_balance`, `status`, `remark`, `added_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'HDFC Bank', 'Main Branch Kota', 'HDFC0000256', '123, Shopping Centre, Kota, Rajasthan', 'Brighton School Kota', '50100234567891', '9057137074', 'billing@brightonschool.com', '1800223344', 'support@hdfcbank.com', 'brightonschool@hdfc', 'Cash,UPI,NEFT,RTGS,Cheque', 50000.00, 'Active', 'Primary school account for fee collection', 2, '2026-06-20 06:35:21', '2026-06-20 06:35:21'),
(2, 1, 'State Bank of India', 'Borkheda Branch', 'SBIN0012345', 'Borkheda Road, Near Police Station, Kota, Rajasthan', 'Brighton School', '31234567890', '9057137074', 'contact@brightonschool.com', '1800112211', 'sbi.012345@sbi.co.in', 'brightonschoolsbi@sbi', 'UPI,NEFT,RTGS,Cheque,Card', 25000.00, 'Active', 'Secondary school account for administrative expenses', 2, '2026-06-20 06:35:22', '2026-06-20 06:35:22');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `label`) VALUES
(1, 'super_admin', 'Super Admin'),
(2, 'school_admin', 'School Admin'),
(3, 'teacher', 'Teacher'),
(4, 'parent', 'Parent'),
(5, 'student', 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `timezone` varchar(60) DEFAULT 'Asia/Kolkata',
  `status` enum('active','inactive','suspended') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `name`, `slug`, `email`, `phone`, `address`, `logo`, `website`, `timezone`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Brighton School Kota', 'brighton-school-kota', 'contact@brightonschool.com', '9057137074', 'Plot No 484, Chandresal Rd,\r\nnear Parvatipuram-II Colony,\r\nBorkheda Kota, Rajasthan 324002', NULL, 'https://brightonschoolkota.com', 'Asia/Kolkata', 'active', '2026-06-15 09:41:05', '2026-06-15 09:41:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `section_name` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sort_order` int(11) DEFAULT 0,
  `class_teacher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `school_id`, `class_id`, `section_name`, `name`, `sort_order`, `class_teacher_id`, `capacity`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'A', 'A', 1, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(2, 1, 2, 'A', 'A', 2, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(3, 1, 3, 'A', 'A', 3, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(4, 1, 4, 'A', 'A', 4, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(5, 1, 5, 'A', 'A', 5, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(6, 1, 6, 'A', 'A', 6, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(7, 1, 7, 'A', 'A', 7, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(8, 1, 8, 'A', 'A', 8, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(9, 1, 9, 'A', 'A', 9, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(10, 1, 10, 'A', 'A', 10, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(11, 1, 11, 'A', 'A', 11, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(12, 1, 12, 'A', 'A', 12, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(13, 1, 13, 'A', 'A', 13, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(14, 1, 14, 'A', 'A', 14, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(15, 1, 15, 'A', 'A', 15, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(16, 1, 1, 'B', 'B', 16, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(17, 1, 2, 'B', 'B', 17, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(18, 1, 3, 'B', 'B', 18, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(19, 1, 4, 'B', 'B', 19, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(20, 1, 5, 'B', 'B', 20, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(21, 1, 6, 'B', 'B', 21, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(22, 1, 7, 'B', 'B', 22, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(23, 1, 8, 'B', 'B', 23, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(24, 1, 9, 'B', 'B', 24, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(25, 1, 10, 'B', 'B', 25, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(26, 1, 11, 'B', 'B', 26, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(27, 1, 12, 'B', 'B', 27, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(28, 1, 13, 'B', 'B', 28, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(29, 1, 14, 'B', 'B', 29, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38'),
(30, 1, 15, 'B', 'B', 30, NULL, NULL, 'active', '2026-06-26 07:38:14', '2026-06-26 12:48:38');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `session_id` bigint(20) UNSIGNED DEFAULT NULL,
  `class_id` bigint(20) UNSIGNED DEFAULT NULL,
  `section_id` bigint(20) UNSIGNED DEFAULT NULL,
  `apaar_id` varchar(50) DEFAULT NULL,
  `pen_no` varchar(50) DEFAULT NULL,
  `registration_no_prefix` varchar(20) DEFAULT NULL,
  `registration_no` varchar(50) DEFAULT NULL,
  `enrollment_no_prefix` varchar(20) DEFAULT NULL,
  `enrollment_no` varchar(50) DEFAULT NULL,
  `sr_no_prefix` varchar(20) DEFAULT NULL,
  `sr_no` varchar(50) DEFAULT NULL,
  `general_reg_no` varchar(50) DEFAULT NULL,
  `admission_no_prefix` varchar(20) DEFAULT NULL,
  `admission_no` varchar(50) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `srn_no` varchar(50) DEFAULT NULL,
  `roll_no` varchar(50) DEFAULT NULL,
  `stream` varchar(50) DEFAULT NULL,
  `education_medium` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `profile_file` varchar(255) DEFAULT NULL,
  `referred_by` varchar(100) DEFAULT NULL,
  `is_rte` enum('yes','no') DEFAULT 'no',
  `rte_application_no` varchar(100) DEFAULT NULL,
  `enrolled_session` varchar(50) DEFAULT NULL,
  `enrolled_class_id` bigint(20) UNSIGNED DEFAULT NULL,
  `enrolled_year` varchar(10) DEFAULT NULL,
  `special_needs` enum('yes','no') DEFAULT 'no',
  `is_bpl` enum('yes','no') DEFAULT 'no',
  `house_block` varchar(100) DEFAULT NULL,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(20) DEFAULT NULL,
  `alternate_no` varchar(20) DEFAULT NULL,
  `whatsapp_no` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT 'male',
  `blood_group` varchar(10) DEFAULT NULL,
  `height` varchar(20) DEFAULT NULL,
  `weight` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `place_of_birth` varchar(100) DEFAULT NULL,
  `dob_certificate` varchar(255) DEFAULT NULL,
  `dob_certificate_no` varchar(100) DEFAULT NULL,
  `total_fees` decimal(10,2) DEFAULT 0.00,
  `total_paid` decimal(10,2) DEFAULT 0.00,
  `total_discount` decimal(10,2) DEFAULT 0.00,
  `fine_amount` decimal(10,2) DEFAULT 0.00,
  `biometric_code` varchar(50) DEFAULT NULL,
  `status` enum('active','inactive','passed','dropped','suspended') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `income_app_no` varchar(100) DEFAULT NULL,
  `caste_app_no` varchar(100) DEFAULT NULL,
  `domicile_app_no` varchar(100) DEFAULT NULL,
  `nationality` varchar(100) DEFAULT 'INDIAN',
  `religion` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `caste` varchar(100) DEFAULT NULL,
  `category_certificate` varchar(255) DEFAULT NULL,
  `aadhar_no` varchar(50) DEFAULT NULL,
  `aadhar_file` varchar(255) DEFAULT NULL,
  `tc_no` varchar(100) DEFAULT NULL,
  `tc_issue_date` date DEFAULT NULL,
  `tc_file` varchar(255) DEFAULT NULL,
  `scholarship_id` varchar(100) DEFAULT NULL,
  `scholarship_password` varchar(100) DEFAULT NULL,
  `govt_student_id` varchar(100) DEFAULT NULL,
  `govt_family_id` varchar(100) DEFAULT NULL,
  `samagra_id` varchar(100) DEFAULT NULL,
  `bank_name` varchar(150) DEFAULT NULL,
  `bank_branch` varchar(150) DEFAULT NULL,
  `ifsc_code` varchar(50) DEFAULT NULL,
  `bank_account_holder` varchar(150) DEFAULT NULL,
  `bank_account_no` varchar(100) DEFAULT NULL,
  `pan_no` varchar(50) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `mother_qualification` varchar(100) DEFAULT NULL,
  `mother_address` text DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL,
  `mother_official_address` text DEFAULT NULL,
  `mother_income` varchar(50) DEFAULT NULL,
  `mother_email` varchar(150) DEFAULT NULL,
  `mother_mobile` varchar(20) DEFAULT NULL,
  `mother_aadhar` varchar(20) DEFAULT NULL,
  `mother_photo` varchar(255) DEFAULT NULL,
  `mother_aadhar_file` varchar(255) DEFAULT NULL,
  `father_qualification` varchar(100) DEFAULT NULL,
  `father_address` text DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `father_official_address` text DEFAULT NULL,
  `father_income` varchar(50) DEFAULT NULL,
  `father_email` varchar(150) DEFAULT NULL,
  `father_mobile` varchar(20) DEFAULT NULL,
  `father_aadhar` varchar(20) DEFAULT NULL,
  `father_photo` varchar(255) DEFAULT NULL,
  `father_aadhar_file` varchar(255) DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_qualification` varchar(100) DEFAULT NULL,
  `guardian_address` text DEFAULT NULL,
  `guardian_occupation` varchar(100) DEFAULT NULL,
  `guardian_official_address` text DEFAULT NULL,
  `guardian_income` varchar(50) DEFAULT NULL,
  `guardian_email` varchar(150) DEFAULT NULL,
  `guardian_mobile` varchar(20) DEFAULT NULL,
  `guardian_aadhar` varchar(20) DEFAULT NULL,
  `guardian_photo` varchar(255) DEFAULT NULL,
  `guardian_aadhar_file` varchar(255) DEFAULT NULL,
  `transport_route_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `school_id`, `user_id`, `session_id`, `class_id`, `section_id`, `apaar_id`, `pen_no`, `registration_no_prefix`, `registration_no`, `enrollment_no_prefix`, `enrollment_no`, `sr_no_prefix`, `sr_no`, `general_reg_no`, `admission_no_prefix`, `admission_no`, `admission_date`, `srn_no`, `roll_no`, `stream`, `education_medium`, `photo`, `profile_file`, `referred_by`, `is_rte`, `rte_application_no`, `enrolled_session`, `enrolled_class_id`, `enrolled_year`, `special_needs`, `is_bpl`, `house_block`, `first_name`, `last_name`, `father_name`, `mobile_no`, `alternate_no`, `whatsapp_no`, `email`, `gender`, `blood_group`, `height`, `weight`, `dob`, `place_of_birth`, `dob_certificate`, `dob_certificate_no`, `total_fees`, `total_paid`, `total_discount`, `fine_amount`, `biometric_code`, `status`, `created_at`, `updated_at`, `deleted_at`, `income_app_no`, `caste_app_no`, `domicile_app_no`, `nationality`, `religion`, `category`, `caste`, `category_certificate`, `aadhar_no`, `aadhar_file`, `tc_no`, `tc_issue_date`, `tc_file`, `scholarship_id`, `scholarship_password`, `govt_student_id`, `govt_family_id`, `samagra_id`, `bank_name`, `bank_branch`, `ifsc_code`, `bank_account_holder`, `bank_account_no`, `pan_no`, `mother_name`, `mother_qualification`, `mother_address`, `mother_occupation`, `mother_official_address`, `mother_income`, `mother_email`, `mother_mobile`, `mother_aadhar`, `mother_photo`, `mother_aadhar_file`, `father_qualification`, `father_address`, `father_occupation`, `father_official_address`, `father_income`, `father_email`, `father_mobile`, `father_aadhar`, `father_photo`, `father_aadhar_file`, `guardian_name`, `guardian_qualification`, `guardian_address`, `guardian_occupation`, `guardian_official_address`, `guardian_income`, `guardian_email`, `guardian_mobile`, `guardian_aadhar`, `guardian_photo`, `guardian_aadhar_file`, `transport_route_id`) VALUES
(1, 1, 4, 1, 1, 1, 'AP-12345678', 'PEN-123456', '2026', 'REG-1002', '26', 'ENR-88990', '26', 'SR-11223', 'GRN-4455', '2026', '5001', '2026-04-01', 'SRN-7788', '101', 'General', 'English', 'uploads/students/photo_6a3f7e7dd168b.jpeg', 'uploads/students/sample_profile.pdf', NULL, 'no', NULL, '2026-27', 1, '2026', 'no', 'no', NULL, 'Rohan', 'Sharma', 'Ramesh Gupta', '9876543210', '9876543211', '9876543210', 'rohan.sharma@example.com', 'male', 'O+', '125 cm', '28 kg', '2015-08-20', 'New Delhi', 'uploads/students/dob_cert.pdf', 'DOB-2015-9988', 25000.00, 0.00, 0.00, 0.00, 'BIO-101', 'active', '2026-06-27 07:32:18', '2026-06-27 07:40:45', NULL, 'INC-8877', 'CST-6655', 'DOM-4433', 'Indian', 'Hindu', 'General', 'Brahmin', 'uploads/students/cat_cert.pdf', '123456789012', 'uploads/students/aadhar_card.pdf', 'TC-5544', '2026-03-15', 'uploads/students/tc_file.pdf', 'SCH-9988', 'schpass123', 'GOV-5544', 'FAM-3322', 'SAM-1122', 'State Bank of India', 'Noida Sector 22', 'SBIN0001234', 'Rohan Sharma', '12345678901', 'ABCDE1234F', 'Jane Gupta', 'Graduate', 'A-12, Sector 4, Rohini', 'Homemaker', NULL, NULL, 'jane.g@example.com', '9876543212', '123456789013', 'uploads/students/mother_photo.jpg', 'uploads/students/mother_aadhar.pdf', 'Post Graduate', 'A-12, Sector 4, Rohini', 'Engineer', NULL, '1200000', 'ramesh.gupta@example.com', '9876543210', '123456789014', 'uploads/students/father_photo.jpg', 'uploads/students/father_aadhar.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_attendance`
--

CREATE TABLE `student_attendance` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `status` enum('present','absent','late','half_day','leave') DEFAULT 'present',
  `check_in` time DEFAULT NULL,
  `check_out` time DEFAULT NULL,
  `leave_type` varchar(50) DEFAULT NULL,
  `leave_reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_fee_items`
--

CREATE TABLE `student_fee_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `fee_name` varchar(100) NOT NULL,
  `fee_type` varchar(50) NOT NULL,
  `apply_to` varchar(50) NOT NULL,
  `linked_to` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) DEFAULT NULL,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `remark` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `route_details` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_migrations`
--

CREATE TABLE `student_migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `from_session_id` bigint(20) UNSIGNED NOT NULL,
  `to_session_id` bigint(20) UNSIGNED NOT NULL,
  `from_class_id` bigint(20) UNSIGNED DEFAULT NULL,
  `to_class_id` bigint(20) UNSIGNED DEFAULT NULL,
  `from_section_id` bigint(20) UNSIGNED DEFAULT NULL,
  `to_section_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_students` int(11) NOT NULL,
  `student_ids` text NOT NULL,
  `migrated_by` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_qualifications`
--

CREATE TABLE `student_qualifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `qualification` varchar(150) NOT NULL,
  `passing_year` varchar(20) DEFAULT NULL,
  `roll_no` varchar(50) DEFAULT NULL,
  `obtained_marks` varchar(50) DEFAULT NULL,
  `percentage` varchar(20) DEFAULT NULL,
  `subjects` varchar(255) DEFAULT NULL,
  `school_college_name` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` varchar(50) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  `email` varchar(150) NOT NULL,
  `mobile_no` varchar(20) NOT NULL,
  `alternate_mobile_no` varchar(20) DEFAULT NULL,
  `whatsapp_no` varchar(20) DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `marital_status` varchar(50) DEFAULT NULL,
  `spouse_name` varchar(100) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `nationality` varchar(100) DEFAULT 'INDIAN',
  `religion` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `last_org_name` varchar(150) DEFAULT NULL,
  `last_job_position` varchar(100) DEFAULT NULL,
  `exp_years` int(10) UNSIGNED DEFAULT 0,
  `qualifications` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`qualifications`)),
  `pincode` varchar(20) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `state` varchar(80) DEFAULT NULL,
  `country` varchar(80) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `bank_acc_holder` varchar(150) DEFAULT NULL,
  `bank_name` varchar(150) DEFAULT NULL,
  `bank_ifsc` varchar(50) DEFAULT NULL,
  `bank_acc_no` varchar(50) DEFAULT NULL,
  `pan_no` varchar(20) DEFAULT NULL,
  `pf_acc_no` varchar(50) DEFAULT NULL,
  `uan_no` varchar(50) DEFAULT NULL,
  `aadhar_no` varchar(20) DEFAULT NULL,
  `aadhar_file` varchar(255) DEFAULT NULL,
  `signature_file` varchar(255) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `biometric_code` varchar(50) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `school_id`, `user_id`, `staff_id`, `joining_date`, `photo`, `first_name`, `last_name`, `email`, `mobile_no`, `alternate_mobile_no`, `whatsapp_no`, `gender`, `dob`, `marital_status`, `spouse_name`, `father_name`, `nationality`, `religion`, `category`, `last_org_name`, `last_job_position`, `exp_years`, `qualifications`, `pincode`, `city`, `state`, `country`, `address`, `bank_acc_holder`, `bank_name`, `bank_ifsc`, `bank_acc_no`, `pan_no`, `pf_acc_no`, `uan_no`, `aadhar_no`, `aadhar_file`, `signature_file`, `designation`, `department`, `biometric_code`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 'TCH-1001', '2025-06-01', 'uploads/teachers/photo_6a3f7d8d12401.jpeg', 'Priya', 'Nair', 'priya.nair@example.com', '9876543220', '', '9876543220', 'female', '1990-05-12', 'Single', '', 'Vasudevan Nair', 'Indian', 'Hindu', 'General', 'Delhi Public School', 'PRT Teacher', 5, '[\"B.Sc\",\"B.Ed\"]', '201301', 'Noida', 'Uttar Pradesh', 'India', 'C-10, Sector 15, Noida', 'Priya Nair', 'State Bank of India', 'SBIN0001234', '998877665544', 'ABCDE9988F', '', '', '123456789015', 'uploads/teachers/aadhar.pdf', 'uploads/teachers/sig.png', 'PRT Teacher', 'Primary Education', 'BIO-T101', 'active', NULL, '2026-06-27 07:32:18', '2026-06-27 07:36:45');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_attendance`
--

CREATE TABLE `teacher_attendance` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `status` enum('present','absent','late','half_day','leave') DEFAULT 'present',
  `check_in` time DEFAULT NULL,
  `check_out` time DEFAULT NULL,
  `leave_type` varchar(50) DEFAULT NULL,
  `leave_reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_classes`
--

CREATE TABLE `teacher_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `is_class_teacher` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teacher_classes`
--

INSERT INTO `teacher_classes` (`id`, `teacher_id`, `class_id`, `section_id`, `is_class_teacher`) VALUES
(1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `transport_routes`
--

CREATE TABLE `transport_routes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `route_name` varchar(255) NOT NULL,
  `route_structure` text DEFAULT NULL,
  `session` varchar(50) NOT NULL,
  `vehicle_no` varchar(100) DEFAULT '',
  `vehicle_type` varchar(100) DEFAULT '',
  `vehicle_condition` varchar(50) DEFAULT '',
  `driver_name` varchar(255) DEFAULT '',
  `driver_mobile` varchar(50) DEFAULT '',
  `driver_aadhaar` varchar(50) DEFAULT '',
  `fine_type` enum('daily','monthly','none') DEFAULT 'none',
  `fine_amount` decimal(10,2) DEFAULT 0.00,
  `sub_day_date` varchar(50) DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transport_routes`
--

INSERT INTO `transport_routes` (`id`, `school_id`, `route_name`, `route_structure`, `session`, `vehicle_no`, `vehicle_type`, `vehicle_condition`, `driver_name`, `driver_mobile`, `driver_aadhaar`, `fine_type`, `fine_amount`, `sub_day_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'bhopal', 'bhopal - school (500)', '2026 - 2027', 'xz0101', 'school bus', 'new', 'aman', '990001100', '', 'none', 0.00, '', '2026-06-19 07:12:41', '2026-06-19 07:12:41', NULL),
(2, 1, 'a to z', 'aa to zz - kk (500)', '2026 - 2027', 'px0101', 'school bus', 'new', 'varun', '', '', 'none', 0.00, '', '2026-06-19 07:12:41', '2026-06-19 07:12:41', NULL),
(3, 1, 'MINPUR', '- (200)', '2026 - 2027', '', '', '', '', '', '', 'none', 0.00, '', '2026-06-19 07:12:41', '2026-06-19 07:12:41', NULL),
(4, 1, 'Route 1', 'school - Balram nagar (2500)\nschool - Loni (2400)\nSchool - Roopnagar (2200)\nSchool - New Vikas nagar (2150)\nSchool - Banthla (2100)', '2026 - 2027', 'Up14bt 1442', 'school bus', 'new', 'Pappu', '9760424799', '', 'none', 0.00, '', '2026-06-19 07:12:41', '2026-06-19 07:12:41', NULL),
(5, 1, 'Town', '[{\"starting_from\":\"Kohla\",\"stop_to\":\"Coaching\",\"fees\":1800},{\"starting_from\":\"Town Bus stand\",\"stop_to\":\"Coaching\",\"fees\":2000},{\"starting_from\":\"Town junction over bridge\",\"stop_to\":\"Coaching\",\"fees\":1500},{\"starting_from\":\"Junction\",\"stop_to\":\"Coaching\",\"fees\":1000}]', '2026 - 2027', 'RJ 31 3220', 'school bus', 'old', 'Major singh', '1234567890', '169902728828282928', 'daily', 10.00, '', '2026-06-19 07:12:41', '2026-06-19 07:23:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` tinyint(3) UNSIGNED NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `alternate_phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` text DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `status` enum('active','inactive','suspended') DEFAULT 'active',
  `last_login` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `school_id`, `role_id`, `username`, `first_name`, `last_name`, `email`, `phone`, `alternate_phone`, `password`, `avatar`, `website`, `gender`, `bio`, `dob`, `address`, `pincode`, `city`, `state`, `country`, `status`, `last_login`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 1, NULL, 'Abhishek', 'Tyagi', 'admin@google.com', '9057137074', NULL, '$2y$12$bB0r6YBfbGoRMhmZ/cIlXu86YgiTnAII35nZbopg2oAslW7deeddG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2026-06-26 13:27:59', NULL, '2026-06-15 09:32:07', '2026-06-26 13:27:59', NULL),
(2, 1, 2, NULL, 'Brighton', 'Admin', 'school@admin.com', '', '', '$2y$10$h0tIfAZwBu.WSZfEPR48aONFquuGke0KY0WBcMkUO0IVcW1jGRynO', 'avatar_2_1782455765.jpg', '', 'male', '', NULL, '', '', '', '', '', 'active', '2026-06-27 06:25:38', NULL, '2026-06-15 09:57:29', '2026-06-27 06:25:38', NULL),
(3, 1, 4, 'ramesh_gupta', 'Ramesh', 'Gupta', 'ramesh.gupta@example.com', '9876543210', NULL, '$2y$10$GcojpKIRefehU2zdD5kRWu70weIZERRdYmpJb0LeQtvIxEhrebT2S', NULL, NULL, 'male', NULL, '1982-11-15', 'A-12, Sector 4, Rohini', '110085', 'New Delhi', 'Delhi', 'India', 'active', NULL, NULL, '2026-06-27 07:32:18', '2026-06-27 07:32:18', NULL),
(4, 1, 5, 'rohan_sharma', 'Rohan', 'Sharma', 'rohan.sharma@example.com', '9876543210', NULL, '$2y$10$ulRjIe5zX2E9kyDMaU9TD.p0VTXtf1834FodOlYbDrxrGwyNFzR26', NULL, NULL, 'male', NULL, '2015-08-20', 'H-402, Sector 22, Noida', '201301', 'Noida', 'Uttar Pradesh', 'India', 'active', NULL, NULL, '2026-06-27 07:32:18', '2026-06-27 07:32:18', NULL),
(5, 1, 3, 'priya_nair', 'Priya', 'Nair', 'priya.nair@example.com', '9876543220', NULL, '$2y$10$nXHk2Bap/XNyidL6zm3vYu0wxQM8LMoaRd6l4gO0DJKoxUY.DWF7e', 'uploads/teachers/photo_6a3f7d8d12401.jpeg', NULL, 'female', NULL, '1990-05-12', 'C-10, Sector 15, Noida', '201301', 'Noida', 'Uttar Pradesh', 'India', 'active', NULL, NULL, '2026-06-27 07:32:18', '2026-06-27 07:36:45', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_sessions`
--
ALTER TABLE `academic_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `admission_form_settings`
--
ALTER TABLE `admission_form_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_school_id` (`school_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_class_name` (`class_name`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `dashboard_todos`
--
ALTER TABLE `dashboard_todos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_school_user` (`school_id`,`user_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_exp_school` (`school_id`),
  ADD KEY `idx_exp_type` (`expense_type`),
  ADD KEY `idx_exp_date` (`expense_date`),
  ADD KEY `idx_exp_deleted` (`deleted_at`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ec_school` (`school_id`),
  ADD KEY `idx_ec_name` (`name`);

--
-- Indexes for table `fees_settings`
--
ALTER TABLE `fees_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_school` (`school_id`);

--
-- Indexes for table `fee_payments`
--
ALTER TABLE `fee_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `assigned_to` (`assigned_to`);

--
-- Indexes for table `lead_sources`
--
ALTER TABLE `lead_sources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `lead_statuses`
--
ALTER TABLE `lead_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `online_fee_payments`
--
ALTER TABLE `online_fee_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_school_id` (`school_id`),
  ADD KEY `idx_student_id` (`student_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `parent_students`
--
ALTER TABLE `parent_students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_parent_student` (`parent_id`,`student_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `payment_bank_accounts`
--
ALTER TABLE `payment_bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_school_id` (`school_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_class_section` (`class_id`,`section_name`),
  ADD KEY `sections_ibfk_1` (`school_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `fk_students_transport_route` (`transport_route_id`);

--
-- Indexes for table `student_attendance`
--
ALTER TABLE `student_attendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_student_date` (`student_id`,`date`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `student_fee_items`
--
ALTER TABLE `student_fee_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student_migrations`
--
ALTER TABLE `student_migrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `student_qualifications`
--
ALTER TABLE `student_qualifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `teacher_attendance`
--
ALTER TABLE `teacher_attendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_teacher_date` (`teacher_id`,`date`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `teacher_classes`
--
ALTER TABLE `teacher_classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `teacher_classes_ibfk_3` (`section_id`);

--
-- Indexes for table `transport_routes`
--
ALTER TABLE `transport_routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email_school` (`email`,`school_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_sessions`
--
ALTER TABLE `academic_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admission_form_settings`
--
ALTER TABLE `admission_form_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `dashboard_todos`
--
ALTER TABLE `dashboard_todos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `fees_settings`
--
ALTER TABLE `fees_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fee_payments`
--
ALTER TABLE `fee_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `lead_sources`
--
ALTER TABLE `lead_sources`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lead_statuses`
--
ALTER TABLE `lead_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `online_fee_payments`
--
ALTER TABLE `online_fee_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `parent_students`
--
ALTER TABLE `parent_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_bank_accounts`
--
ALTER TABLE `payment_bank_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_attendance`
--
ALTER TABLE `student_attendance`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `student_fee_items`
--
ALTER TABLE `student_fee_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `student_migrations`
--
ALTER TABLE `student_migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_qualifications`
--
ALTER TABLE `student_qualifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teacher_attendance`
--
ALTER TABLE `teacher_attendance`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `teacher_classes`
--
ALTER TABLE `teacher_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transport_routes`
--
ALTER TABLE `transport_routes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `academic_sessions`
--
ALTER TABLE `academic_sessions`
  ADD CONSTRAINT `academic_sessions_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fees_settings`
--
ALTER TABLE `fees_settings`
  ADD CONSTRAINT `fees_settings_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_payments`
--
ALTER TABLE `fee_payments`
  ADD CONSTRAINT `fee_payments_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_payments_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `parents`
--
ALTER TABLE `parents`
  ADD CONSTRAINT `parents_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `parents_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `parent_students`
--
ALTER TABLE `parent_students`
  ADD CONSTRAINT `ps_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ps_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_students_transport_route` FOREIGN KEY (`transport_route_id`) REFERENCES `transport_routes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_attendance`
--
ALTER TABLE `student_attendance`
  ADD CONSTRAINT `student_attendance_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_attendance_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_fee_items`
--
ALTER TABLE `student_fee_items`
  ADD CONSTRAINT `student_fee_items_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_migrations`
--
ALTER TABLE `student_migrations`
  ADD CONSTRAINT `student_migrations_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_qualifications`
--
ALTER TABLE `student_qualifications`
  ADD CONSTRAINT `student_qualifications_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teachers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teacher_attendance`
--
ALTER TABLE `teacher_attendance`
  ADD CONSTRAINT `teacher_attendance_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_attendance_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teacher_classes`
--
ALTER TABLE `teacher_classes`
  ADD CONSTRAINT `teacher_classes_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_classes_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_classes_ibfk_3` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transport_routes`
--
ALTER TABLE `transport_routes`
  ADD CONSTRAINT `transport_routes_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
