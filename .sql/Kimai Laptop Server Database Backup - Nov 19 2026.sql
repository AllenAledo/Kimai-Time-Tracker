-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2026 at 06:24 PM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kimai`
--

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_access_token`
--

CREATE TABLE `kimai2_access_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `last_usage` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_activities`
--

CREATE TABLE `kimai2_activities` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `comment` text DEFAULT NULL,
  `visible` tinyint(1) NOT NULL,
  `color` varchar(7) DEFAULT NULL,
  `time_budget` int(11) NOT NULL DEFAULT 0,
  `budget` double NOT NULL DEFAULT 0,
  `budget_type` varchar(10) DEFAULT NULL,
  `billable` tinyint(1) NOT NULL DEFAULT 1,
  `invoice_text` longtext DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_activities`
--

INSERT INTO `kimai2_activities` (`id`, `project_id`, `name`, `comment`, `visible`, `color`, `time_budget`, `budget`, `budget_type`, `billable`, `invoice_text`, `number`, `created_at`) VALUES
(1, 1, 'Web Development', 'Standard Web Development work', 1, '#00bfff', 0, 0, NULL, 1, NULL, '1', '2026-11-18 16:34:46');

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_activities_meta`
--

CREATE TABLE `kimai2_activities_meta` (
  `id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_activities_rates`
--

CREATE TABLE `kimai2_activities_rates` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `rate` double NOT NULL,
  `fixed` tinyint(1) NOT NULL,
  `internal_rate` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_activities_teams`
--

CREATE TABLE `kimai2_activities_teams` (
  `activity_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_bookmarks`
--

CREATE TABLE `kimai2_bookmarks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_configuration`
--

CREATE TABLE `kimai2_configuration` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_configuration`
--

INSERT INTO `kimai2_configuration` (`id`, `name`, `value`) VALUES
(1, 'timesheet.rounding.default.mode', 'closest'),
(2, 'timesheet.rounding.default.begin', '0'),
(3, 'timesheet.rounding.default.end', '0'),
(4, 'timesheet.rounding.default.duration', '0'),
(5, 'timesheet.rounding.default.days', 'monday,tuesday,wednesday,thursday,friday,saturday,sunday'),
(6, 'invoice.number_format', '{Y}/{cy,3}'),
(7, 'invoice.rounding_mode', 'decimal'),
(8, 'defaults.customer.timezone', 'Asia/Manila'),
(9, 'defaults.customer.country', 'US'),
(10, 'customer.choice_pattern', '{name}'),
(11, 'customer.number_format', '{cc,4}'),
(12, 'customer.rules.allow_duplicate_number', '0'),
(13, 'theme.branding.logo', NULL),
(14, 'theme.branding.company', NULL),
(15, 'defaults.customer.currency', 'USD'),
(16, 'company.financial_year', '');

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_customers`
--

CREATE TABLE `kimai2_customers` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `number` varchar(50) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `visible` tinyint(1) NOT NULL,
  `company` varchar(100) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country` varchar(2) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `homepage` varchar(100) DEFAULT NULL,
  `timezone` varchar(64) NOT NULL,
  `color` varchar(7) DEFAULT NULL,
  `time_budget` int(11) NOT NULL DEFAULT 0,
  `budget` double NOT NULL DEFAULT 0,
  `vat_id` varchar(50) DEFAULT NULL,
  `budget_type` varchar(10) DEFAULT NULL,
  `billable` tinyint(1) NOT NULL DEFAULT 1,
  `invoice_template_id` int(11) DEFAULT NULL,
  `invoice_text` longtext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `address_line1` varchar(150) DEFAULT NULL,
  `address_line2` varchar(150) DEFAULT NULL,
  `address_line3` varchar(150) DEFAULT NULL,
  `postcode` varchar(20) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `buyer_reference` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_customers`
--

INSERT INTO `kimai2_customers` (`id`, `name`, `number`, `comment`, `visible`, `company`, `contact`, `address`, `country`, `currency`, `phone`, `fax`, `mobile`, `email`, `homepage`, `timezone`, `color`, `time_budget`, `budget`, `vat_id`, `budget_type`, `billable`, `invoice_template_id`, `invoice_text`, `created_at`, `address_line1`, `address_line2`, `address_line3`, `postcode`, `city`, `buyer_reference`) VALUES
(1, 'Michael McIver', '0002', 'SkyQuota Owner', 1, NULL, NULL, NULL, 'US', 'USD', NULL, NULL, NULL, 'mm@skymethods.com', NULL, 'America/New_York', '#00bfff', 0, 0, NULL, NULL, 1, NULL, NULL, '2026-11-18 16:30:03', NULL, NULL, NULL, NULL, 'Boston Massachusetts', NULL),
(2, 'Allen Brent Aledo', '0003', 'Full Stack Web Developer', 1, NULL, NULL, NULL, 'PH', 'USD', NULL, NULL, NULL, NULL, NULL, 'Asia/Manila', '#00bfff', 0, 0, NULL, NULL, 1, NULL, NULL, '2026-11-18 17:10:22', '#35 Purok 4', 'Locloc, Palauig', NULL, '2210', 'Zambales', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_customers_comments`
--

CREATE TABLE `kimai2_customers_comments` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_customers_meta`
--

CREATE TABLE `kimai2_customers_meta` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_customers_rates`
--

CREATE TABLE `kimai2_customers_rates` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `rate` double NOT NULL,
  `fixed` tinyint(1) NOT NULL,
  `internal_rate` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_customers_teams`
--

CREATE TABLE `kimai2_customers_teams` (
  `customer_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_customers_teams`
--

INSERT INTO `kimai2_customers_teams` (`customer_id`, `team_id`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_export_templates`
--

CREATE TABLE `kimai2_export_templates` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `renderer` varchar(20) NOT NULL,
  `language` varchar(6) DEFAULT NULL,
  `columns` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`columns`)),
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`options`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_invoices`
--

CREATE TABLE `kimai2_invoices` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `timezone` varchar(64) NOT NULL,
  `total` double NOT NULL,
  `tax` double NOT NULL,
  `currency` varchar(3) NOT NULL,
  `status` varchar(20) NOT NULL,
  `due_days` int(11) NOT NULL,
  `vat` double NOT NULL,
  `invoice_filename` varchar(150) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_invoices_meta`
--

CREATE TABLE `kimai2_invoices_meta` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_invoice_templates`
--

CREATE TABLE `kimai2_invoice_templates` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `title` varchar(255) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `due_days` int(11) NOT NULL,
  `vat` double DEFAULT 0,
  `calculator` varchar(20) NOT NULL,
  `number_generator` varchar(20) NOT NULL,
  `renderer` varchar(20) NOT NULL,
  `payment_terms` text DEFAULT NULL,
  `vat_id` varchar(50) DEFAULT NULL,
  `contact` longtext DEFAULT NULL,
  `payment_details` longtext DEFAULT NULL,
  `language` varchar(6) NOT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_invoice_templates`
--

INSERT INTO `kimai2_invoice_templates` (`id`, `name`, `title`, `company`, `address`, `due_days`, `vat`, `calculator`, `number_generator`, `renderer`, `payment_terms`, `vat_id`, `contact`, `payment_details`, `language`, `customer_id`) VALUES
(3, 'SkyQuota - Invoice Template', 'Allen Brent Aledo - Invoice', NULL, NULL, 30, 0, 'default', 'default', 'Custom Template 1', NULL, NULL, NULL, NULL, 'en', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_invoice_templates_meta`
--

CREATE TABLE `kimai2_invoice_templates_meta` (
  `id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_projects`
--

CREATE TABLE `kimai2_projects` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `order_number` tinytext DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `visible` tinyint(1) NOT NULL,
  `budget` double NOT NULL DEFAULT 0,
  `color` varchar(7) DEFAULT NULL,
  `time_budget` int(11) NOT NULL DEFAULT 0,
  `order_date` datetime DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `budget_type` varchar(10) DEFAULT NULL,
  `billable` tinyint(1) NOT NULL DEFAULT 1,
  `invoice_text` longtext DEFAULT NULL,
  `global_activities` tinyint(1) NOT NULL DEFAULT 1,
  `number` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_projects`
--

INSERT INTO `kimai2_projects` (`id`, `customer_id`, `name`, `order_number`, `comment`, `visible`, `budget`, `color`, `time_budget`, `order_date`, `start`, `end`, `timezone`, `budget_type`, `billable`, `invoice_text`, `global_activities`, `number`, `created_at`) VALUES
(1, 1, 'SkyQuota', NULL, 'Michael McIver\'s company', 1, 0, '#00bfff', 0, NULL, NULL, NULL, 'Asia/Manila', NULL, 1, NULL, 1, '1', '2026-11-18 16:30:24');

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_projects_comments`
--

CREATE TABLE `kimai2_projects_comments` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_projects_meta`
--

CREATE TABLE `kimai2_projects_meta` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_projects_rates`
--

CREATE TABLE `kimai2_projects_rates` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `rate` double NOT NULL,
  `fixed` tinyint(1) NOT NULL,
  `internal_rate` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_projects_teams`
--

CREATE TABLE `kimai2_projects_teams` (
  `project_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_projects_teams`
--

INSERT INTO `kimai2_projects_teams` (`project_id`, `team_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_roles`
--

CREATE TABLE `kimai2_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_roles`
--

INSERT INTO `kimai2_roles` (`id`, `name`) VALUES
(3, 'ROLE_ADMIN'),
(4, 'ROLE_SUPER_ADMIN'),
(2, 'ROLE_TEAMLEAD'),
(1, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_roles_permissions`
--

CREATE TABLE `kimai2_roles_permissions` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission` varchar(50) NOT NULL,
  `allowed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_sessions`
--

CREATE TABLE `kimai2_sessions` (
  `id` varchar(128) NOT NULL,
  `data` blob NOT NULL,
  `time` int(10) UNSIGNED NOT NULL,
  `lifetime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_sessions`
--

INSERT INTO `kimai2_sessions` (`id`, `data`, `time`, `lifetime`) VALUES
('a7dbde94820123323d1b9128a72eb931', 0x5f7366325f617474726962757465737c613a33333a7b733a32333a225f73656375726974792e6c6173745f757365726e616d65223b733a32313a22616c6c656e2e616c65646f40676d61696c2e636f6d223b733a32323a225f73656375726974795f736563757265645f61726561223b733a3432313a224f3a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a333a7b693a303b4e3b693a313b733a31323a22736563757265645f61726561223b693a323b613a353a7b693a303b4f3a31353a224170705c456e746974795c55736572223a353a7b733a323a226964223b693a313b733a383a22757365726e616d65223b733a353a22616c6c656e223b733a373a22656e61626c6564223b623a313b733a353a22656d61696c223b733a32313a22616c6c656e2e616c65646f40676d61696c2e636f6d223b733a383a2270617373776f7264223b733a36303a2224327924313324727a3363654d704b5a57725357704e4a426964746f2e6644636b6d306463393978474f46686332546c73617448632e73656b47564f223b7d693a313b623a313b693a323b4e3b693a333b613a303a7b7d693a343b613a323a7b693a303b733a31363a22524f4c455f53555045525f41444d494e223b693a313b733a393a22524f4c455f55534552223b7d7d7d223b733a31363a225f637372662f68747470732d666f726d223b733a34333a2248734b48666c59693251446b69385f4d457a4a4b5f4846485970355f4a6e793237383670775f366931524d223b733a31383a225f637372662f68747470732d736561726368223b733a34333a2274624f6c717638317745597a484b43784b4e466a2d475232457543444e666c436e4531325836416c356559223b733a32383a225f637372662f68747470732d646174617461626c655f757064617465223b733a34333a226d625353657965796b7437703476345a4f516376343169514e35343871774634774538437157626e304e6b223b733a33303a225f637372662f68747470732d61646d696e5f70726f6a6563745f65646974223b733a34333a224342643459633942512d5f3372303546374e63687a6734426c4b707a384f553150636d2d6b62334f726467223b733a33313a225f637372662f68747470732d61646d696e5f637573746f6d65725f65646974223b733a34333a2248515435426e74677359626d35772d6b4a502d72665867576f364a4f4731584b3356575f48764f74645a30223b733a33343a225f637372662f68747470732d61646d696e5f637573746f6d65725f636f6d6d656e74223b733a34333a227556724e327a41364847664f35467a3369595036424149684b3139634c646d6759636e6250343665646941223b733a33333a225f637372662f68747470732d61646d696e5f70726f6a6563745f636f6d6d656e74223b733a34333a227a754e4431513266723779554330644f743763543754745639752d49575174724475354a365f7a71514a34223b733a32393a225f637372662f68747470732d70726f6a6563742e6475706c6963617465223b733a34333a2256686a4272444539655667726d556e3558675939665a71684f3930537a737a785365324f7469436f2d4a30223b733a33333a225f637372662f68747470732d656469745f757365725f707265666572656e636573223b733a34333a2236694d75704c367a6355794563487446346e66514e6d4831614b6a4157726c6e69464c51566a5142366345223b733a32363a225f637372662f68747470732d74696d6573686565745f65646974223b733a34333a226144576e4c545f62536f747451444248456f4c706c64334d6b6375323862727a6a304364384d7152663459223b733a33313a225f637372662f68747470732d61646d696e5f61637469766974795f65646974223b733a34333a22564e4234714c64373057495a3969486e366b3054384b664a3971506c3164554c66684f6a526f64646c5859223b733a33323a225f637372662f68747470732d656e7469746965735f6d756c7469757064617465223b733a34333a2243355144462d725a3763746a4736347150496e554746384d4155715472464357423843516a4b71635f5a49223b733a32393a225f637372662f68747470732d656469745f757365725f70726f66696c65223b733a34333a2234593253783855524c72476d76304b78696177694c6a735567723763417a6775646d7562456f4663467834223b733a33303a225f637372662f68747470732d656469745f757365725f70617373776f7264223b733a34333a226c4b3636676b4146556550705973314a7047766136396c785468576931615f63734f686d766976424e5a63223b733a32353a225f637372662f68747470732d656469745f757365725f326661223b733a34333a227762615a5a305436745272466f58445f6a316935445634574b6a72497437774253634b4c504b4474453034223b733a33363a225f637372662f68747470732d656469745f757365725f70617373776f72645f746f6b656e223b733a34333a2249396475435f6557434b5a756d516d55384574794c596e7a522d57624c52513551365a537754466a335163223b733a32373a225f637372662f68747470732d656469745f757365725f7465616d73223b733a34333a226d79457839484152424e78334f4158615a5f4c6975705264544d584c335131504b53325269457647787859223b733a32373a225f637372662f68747470732d656469745f757365725f726f6c6573223b733a34333a2275366d69725f5f5230773936746c4f4f7361775057435a50505976645a5a5f32314348786a5f6d624e2d55223b733a32373a225f637372662f68747470732d61646d696e5f7465616d5f65646974223b733a34333a224442554a38704644694a725a666c544232567962344b6a675853745135635f6274514341717a4e5668744d223b733a33303a225f637372662f68747470732d7465616d5f637573746f6d65725f666f726d223b733a34333a22412d67532d637842353434456e6c38554f4d624747312d497a4b314569625850693072354f333530434a63223b733a32393a225f637372662f68747470732d7465616d5f70726f6a6563745f666f726d223b733a34333a224849383758476e6e617942564176655179723771546f3835477a4a423030306832364d67446c5044413455223b733a33343a225f637372662f68747470732d61646d696e5f696e766f6963655f74656d706c617465223b733a34333a2277507063324d306149624d7a337a6a66475867656673505057674743722d346f4463336652506965773859223b733a33353a225f637372662f68747470732d696e766f6963652e64656c6574655f74656d706c617465223b733a34333a227879696666456a4d756f334a415a5063647345316c6c4a5657396f39586865306554715a6d47515f454545223b733a34313a225f637372662f68747470732d61646d696e5f696e766f6963655f646f63756d656e745f75706c6f6164223b733a34333a22516d76514b3850383849636d467345754d6537484834784f624942523635357456524a6c6b716668454b63223b733a33353a225f637372662f68747470732d696e766f6963652e64656c6574655f646f63756d656e74223b733a34333a225156507a7553474c59545978336e76375a6f686536304e7545674e3168794d754c66777073353256324134223b733a32373a225f637372662f68747470732d696e766f6963652e70726576696577223b733a34333a2272774e6e6d3569516a414e3066383467724447556877324378576e5635766d716d6841455264476c514a63223b733a32363a225f637372662f68747470732d696e766f6963652e637265617465223b733a34333a2276425a3363765a753655756155586b6e67377a33777a4a4b6a366e7556546651416d783268396b3646546b223b733a33303a225f637372662f68747470732d656469745f757365725f636f6e7472616374223b733a34333a225358756d415242775f46504c6b4b417546505f315543537576424374636c4b6a72734a2d6730765841416b223b733a33383a225f637372662f68747470732d656469745f73797374656d5f636f6e66696775726174696f6e73223b733a34333a224a5159716f654d4c6c30372d514550714857485f3043626474727145496b4e2d4c4637344e667734594c30223b733a32383a225f637372662f68747470732d646f63746f722e666c7573685f6c6f67223b733a34333a227634745f6c3161775830694b494a454e546c324e444134427432744b4236684d35632d7341776b38675845223b733a33333a225f637372662f68747470732d757365725f726f6c655f7065726d697373696f6e73223b733a34333a22636c46667863507662362d6745794c4e4548306d5866562d562d3235374a586f4271505852767959517277223b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313739353032323630373b733a313a2263223b693a313739353031393136363b733a313a226c223b693a303b7d, 1795022607, 1795024047);

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_tags`
--

CREATE TABLE `kimai2_tags` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `color` varchar(7) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_teams`
--

CREATE TABLE `kimai2_teams` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `color` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_teams`
--

INSERT INTO `kimai2_teams` (`id`, `name`, `color`) VALUES
(1, 'SkyQuota Team', '#00bfff');

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_timesheet`
--

CREATE TABLE `kimai2_timesheet` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `rate` double NOT NULL,
  `fixed_rate` double DEFAULT NULL,
  `hourly_rate` double DEFAULT NULL,
  `exported` tinyint(1) NOT NULL DEFAULT 0,
  `timezone` varchar(64) NOT NULL,
  `internal_rate` double DEFAULT NULL,
  `billable` tinyint(1) DEFAULT 1,
  `category` varchar(10) NOT NULL DEFAULT 'work',
  `modified_at` datetime DEFAULT NULL,
  `date_tz` date NOT NULL,
  `break` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_timesheet`
--

INSERT INTO `kimai2_timesheet` (`id`, `user`, `activity_id`, `project_id`, `start_time`, `end_time`, `duration`, `description`, `rate`, `fixed_rate`, `hourly_rate`, `exported`, `timezone`, `internal_rate`, `billable`, `category`, `modified_at`, `date_tz`, `break`) VALUES
(1, 1, 1, 1, '2026-10-22 13:56:00', '2026-10-22 14:35:00', 2340, 'Renewed SSL of SkyCRM, SkyDocx, SkyIntel, and SkyCode3 with Mike', 8.45, NULL, 13, 0, 'Asia/Manila', 8.45, 1, 'work', '2026-11-18 17:23:22', '2026-10-22', 0),
(2, 1, 1, 1, '2026-10-26 11:51:00', '2026-10-26 12:32:00', 2460, 'Nav from PPC team requested bug fixes on landing pages in MailerLite, I have to fix some bugs at: https://projects.andlc.com/patios', 8.84, NULL, 13, 0, 'Asia/Manila', 8.84, 1, 'work', '2026-11-18 17:23:19', '2026-10-26', 0),
(3, 1, 1, 1, '2026-11-19 14:30:00', '2026-11-19 15:42:00', 4320, 'Nav from PPC team requested bug fixes on landing pages in MailerLite, and gave me a list of links that needs fixing.', 15.6, NULL, 13, 0, 'Asia/Manila', 15.6, 1, 'work', '2026-11-18 17:23:16', '2026-11-19', 0),
(4, 1, 1, 1, '2026-11-19 15:00:00', '2026-11-19 15:43:00', 2580, 'Make changes so that search engines displays the correct page title based on current homepage <title> value', 9.36, NULL, 13, 0, 'Asia/Manila', 9.36, 1, 'work', '2026-11-18 17:23:13', '2026-11-19', 0);

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_timesheet_meta`
--

CREATE TABLE `kimai2_timesheet_meta` (
  `id` int(11) NOT NULL,
  `timesheet_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_timesheet_tags`
--

CREATE TABLE `kimai2_timesheet_tags` (
  `timesheet_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_users`
--

CREATE TABLE `kimai2_users` (
  `id` int(11) NOT NULL,
  `username` varchar(180) NOT NULL,
  `email` varchar(180) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alias` varchar(60) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `registration_date` datetime DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:array)',
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `api_token` varchar(255) DEFAULT NULL,
  `auth` varchar(20) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `account` varchar(30) DEFAULT NULL,
  `totp_secret` varchar(255) DEFAULT NULL,
  `totp_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `system_account` tinyint(1) NOT NULL DEFAULT 0,
  `supervisor_id` int(11) DEFAULT NULL,
  `signature_date` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_users`
--

INSERT INTO `kimai2_users` (`id`, `username`, `email`, `password`, `alias`, `enabled`, `registration_date`, `title`, `avatar`, `roles`, `last_login`, `confirmation_token`, `password_requested_at`, `api_token`, `auth`, `color`, `account`, `totp_secret`, `totp_enabled`, `system_account`, `supervisor_id`, `signature_date`) VALUES
(1, 'allen', 'allen.aledo@gmail.com', '$2y$13$rz3ceMpKZWrSWpNJBidto.fDckm0dc99xGOFhc2TlsatHc.sekGVO', 'Allen Brent Aledo', 1, '2026-11-18 16:25:50', 'Team Lead', NULL, 'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}', '2026-11-18 16:26:06', NULL, NULL, NULL, 'kimai', '#00bfff', NULL, 'KB4OOSDUVA4UQJLFPMUOULZSKH7LNFA6ZZJE36BBKWB2NQYHPKMQ', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_users_teams`
--

CREATE TABLE `kimai2_users_teams` (
  `user_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `teamlead` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_users_teams`
--

INSERT INTO `kimai2_users_teams` (`user_id`, `team_id`, `id`, `teamlead`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_user_preferences`
--

CREATE TABLE `kimai2_user_preferences` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_user_preferences`
--

INSERT INTO `kimai2_user_preferences` (`id`, `user_id`, `name`, `value`) VALUES
(1, 1, 'timezone', 'Asia/Manila'),
(2, 1, 'language', 'en'),
(3, 1, 'skin', 'default'),
(4, 1, 'hourly_rate', '13'),
(5, 1, 'internal_rate', NULL),
(6, 1, 'locale', 'en'),
(7, 1, 'first_weekday', 'monday'),
(8, 1, 'update_browser_title', '1'),
(9, 1, 'calendar_initial_view', 'month'),
(10, 1, 'login_initial_view', 'timesheet'),
(11, 1, 'favorite_routes', ''),
(12, 1, 'daily_stats', '0'),
(13, 1, 'export_decimal', '0'),
(14, 1, '__wizards__', 'intro,profile');

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_working_times`
--

CREATE TABLE `kimai2_working_times` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `expected` int(11) NOT NULL,
  `actual` int(11) NOT NULL,
  `approved_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20180701120000', '2026-11-18 16:25:11', 91),
('DoctrineMigrations\\Version20180715160326', '2026-11-18 16:25:11', 94),
('DoctrineMigrations\\Version20180730044139', '2026-11-18 16:25:11', 21),
('DoctrineMigrations\\Version20180805183527', '2026-11-18 16:25:11', 23),
('DoctrineMigrations\\Version20180903202256', '2026-11-18 16:25:11', 9),
('DoctrineMigrations\\Version20180905190737', '2026-11-18 16:25:11', 90),
('DoctrineMigrations\\Version20180924111853', '2026-11-18 16:25:12', 9),
('DoctrineMigrations\\Version20181031220003', '2026-11-18 16:25:12', 107),
('DoctrineMigrations\\Version20190124004014', '2026-11-18 16:25:12', 27),
('DoctrineMigrations\\Version20190201150324', '2026-11-18 16:25:12', 5),
('DoctrineMigrations\\Version20190219200020', '2026-11-18 16:25:12', 1),
('DoctrineMigrations\\Version20190305152308', '2026-11-18 16:25:12', 35),
('DoctrineMigrations\\Version20190321181243', '2026-11-18 16:25:12', 19),
('DoctrineMigrations\\Version20190502161758', '2026-11-18 16:25:12', 37),
('DoctrineMigrations\\Version20190510205245', '2026-11-18 16:25:12', 28),
('DoctrineMigrations\\Version20190605171157', '2026-11-18 16:25:12', 35),
('DoctrineMigrations\\Version20190617100845', '2026-11-18 16:25:12', 111),
('DoctrineMigrations\\Version20190706224211', '2026-11-18 16:25:12', 75),
('DoctrineMigrations\\Version20190706224219', '2026-11-18 16:25:12', 91),
('DoctrineMigrations\\Version20190729162655', '2026-11-18 16:25:12', 72),
('DoctrineMigrations\\Version20190730123324', '2026-11-18 16:25:12', 139),
('DoctrineMigrations\\Version20190813162649', '2026-11-18 16:25:12', 46),
('DoctrineMigrations\\Version20191024100951', '2026-11-18 16:25:12', 35),
('DoctrineMigrations\\Version20191108151534', '2026-11-18 16:25:12', 70),
('DoctrineMigrations\\Version20191113132640', '2026-11-18 16:25:12', 31),
('DoctrineMigrations\\Version20191116110124', '2026-11-18 16:25:13', 45),
('DoctrineMigrations\\Version20191204120823', '2026-11-18 16:25:13', 38),
('DoctrineMigrations\\Version20200109102138', '2026-11-18 16:25:13', 96),
('DoctrineMigrations\\Version20200125123942', '2026-11-18 16:25:13', 44),
('DoctrineMigrations\\Version20200204124425', '2026-11-18 16:25:13', 43),
('DoctrineMigrations\\Version20200205115243', '2026-11-18 16:25:13', 136),
('DoctrineMigrations\\Version20200205115244', '2026-11-18 16:25:13', 66),
('DoctrineMigrations\\Version20200308171950', '2026-11-18 16:25:13', 82),
('DoctrineMigrations\\Version20200323163038', '2026-11-18 16:25:13', 67),
('DoctrineMigrations\\Version20200323163039', '2026-11-18 16:25:13', 1),
('DoctrineMigrations\\Version20200413133226', '2026-11-18 16:25:13', 51),
('DoctrineMigrations\\Version20200524142042', '2026-11-18 16:25:13', 49),
('DoctrineMigrations\\Version20200705152310', '2026-11-18 16:25:13', 59),
('DoctrineMigrations\\Version20200725213424', '2026-11-18 16:25:13', 83),
('DoctrineMigrations\\Version20210316224358', '2026-11-18 16:25:13', 59),
('DoctrineMigrations\\Version20210320162820', '2026-11-18 16:25:13', 57),
('DoctrineMigrations\\Version20210405105611', '2026-11-18 16:25:14', 53),
('DoctrineMigrations\\Version20210605154245', '2026-11-18 16:25:14', 64),
('DoctrineMigrations\\Version20210704111542', '2026-11-18 16:25:14', 55),
('DoctrineMigrations\\Version20210717211144', '2026-11-18 16:25:14', 58),
('DoctrineMigrations\\Version20210719123928', '2026-11-18 16:25:14', 68),
('DoctrineMigrations\\Version20210727104955', '2026-11-18 16:25:14', 105),
('DoctrineMigrations\\Version20210802152259', '2026-11-18 16:25:14', 61),
('DoctrineMigrations\\Version20210802152814', '2026-11-18 16:25:14', 6),
('DoctrineMigrations\\Version20210802160837', '2026-11-18 16:25:14', 68),
('DoctrineMigrations\\Version20210802174318', '2026-11-18 16:25:14', 77),
('DoctrineMigrations\\Version20210802174319', '2026-11-18 16:25:14', 1),
('DoctrineMigrations\\Version20210802174320', '2026-11-18 16:25:14', 59),
('DoctrineMigrations\\Version20211008092010', '2026-11-18 16:25:14', 48),
('DoctrineMigrations\\Version20211230163612', '2026-11-18 16:25:14', 53),
('DoctrineMigrations\\Version20220101204501', '2026-11-18 16:25:14', 62),
('DoctrineMigrations\\Version20220315224645', '2026-11-18 16:25:14', 84),
('DoctrineMigrations\\Version20220404150236', '2026-11-18 16:25:14', 59),
('DoctrineMigrations\\Version20220531145920', '2026-11-18 16:25:15', 61),
('DoctrineMigrations\\Version20220722125847', '2026-11-18 16:25:15', 63),
('DoctrineMigrations\\Version20230126002049', '2026-11-18 16:25:15', 110),
('DoctrineMigrations\\Version20230126002050', '2026-11-18 16:25:15', 64),
('DoctrineMigrations\\Version20230327143628', '2026-11-18 16:25:15', 96),
('DoctrineMigrations\\Version20230606125948', '2026-11-18 16:25:15', 63),
('DoctrineMigrations\\Version20230819090536', '2026-11-18 16:25:15', 79),
('DoctrineMigrations\\Version20231130000719', '2026-11-18 16:25:15', 1),
('DoctrineMigrations\\Version20240214061246', '2026-11-18 16:25:15', 89),
('DoctrineMigrations\\Version20240326125247', '2026-11-18 16:25:15', 13),
('DoctrineMigrations\\Version20240920105524', '2026-11-18 16:25:15', 1),
('DoctrineMigrations\\Version20240926111739', '2026-11-18 16:25:15', 24),
('DoctrineMigrations\\Version20250608143244', '2026-11-18 16:25:15', 62),
('DoctrineMigrations\\Version20251031142000', '2026-11-18 16:25:15', 52),
('DoctrineMigrations\\Version20251031143000', '2026-11-18 16:25:15', 13),
('DoctrineMigrations\\Version20251214160001', '2026-11-18 16:25:15', 76),
('DoctrineMigrations\\Version20260530080724', '2026-11-18 16:25:15', 82);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kimai2_access_token`
--
ALTER TABLE `kimai2_access_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6FB0DB1E5F37A13B` (`token`),
  ADD KEY `IDX_6FB0DB1EA76ED395` (`user_id`);

--
-- Indexes for table `kimai2_activities`
--
ALTER TABLE `kimai2_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8811FE1C166D1F9C` (`project_id`),
  ADD KEY `IDX_8811FE1C7AB0E859166D1F9C` (`visible`,`project_id`),
  ADD KEY `IDX_8811FE1C7AB0E859166D1F9C5E237E06` (`visible`,`project_id`,`name`),
  ADD KEY `IDX_8811FE1C7AB0E8595E237E06` (`visible`,`name`);

--
-- Indexes for table `kimai2_activities_meta`
--
ALTER TABLE `kimai2_activities_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A7C0A43D81C060965E237E06` (`activity_id`,`name`),
  ADD KEY `IDX_A7C0A43D81C06096` (`activity_id`);

--
-- Indexes for table `kimai2_activities_rates`
--
ALTER TABLE `kimai2_activities_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4A7F11BEA76ED39581C06096` (`user_id`,`activity_id`),
  ADD KEY `IDX_4A7F11BEA76ED395` (`user_id`),
  ADD KEY `IDX_4A7F11BE81C06096` (`activity_id`);

--
-- Indexes for table `kimai2_activities_teams`
--
ALTER TABLE `kimai2_activities_teams`
  ADD PRIMARY KEY (`activity_id`,`team_id`),
  ADD KEY `IDX_986998DA81C06096` (`activity_id`),
  ADD KEY `IDX_986998DA296CD8AE` (`team_id`);

--
-- Indexes for table `kimai2_bookmarks`
--
ALTER TABLE `kimai2_bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4016EF25A76ED3955E237E06` (`user_id`,`name`),
  ADD KEY `IDX_4016EF25A76ED395` (`user_id`);

--
-- Indexes for table `kimai2_configuration`
--
ALTER TABLE `kimai2_configuration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1C5D63D85E237E06` (`name`);

--
-- Indexes for table `kimai2_customers`
--
ALTER TABLE `kimai2_customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5A9760447AB0E859` (`visible`),
  ADD KEY `IDX_5A97604412946D8B` (`invoice_template_id`);

--
-- Indexes for table `kimai2_customers_comments`
--
ALTER TABLE `kimai2_customers_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A5B142D99395C3F3` (`customer_id`),
  ADD KEY `IDX_A5B142D9B03A8386` (`created_by_id`);

--
-- Indexes for table `kimai2_customers_meta`
--
ALTER TABLE `kimai2_customers_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A48A760F9395C3F35E237E06` (`customer_id`,`name`),
  ADD KEY `IDX_A48A760F9395C3F3` (`customer_id`);

--
-- Indexes for table `kimai2_customers_rates`
--
ALTER TABLE `kimai2_customers_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_82AB0AECA76ED3959395C3F3` (`user_id`,`customer_id`),
  ADD KEY `IDX_82AB0AECA76ED395` (`user_id`),
  ADD KEY `IDX_82AB0AEC9395C3F3` (`customer_id`);

--
-- Indexes for table `kimai2_customers_teams`
--
ALTER TABLE `kimai2_customers_teams`
  ADD PRIMARY KEY (`customer_id`,`team_id`),
  ADD KEY `IDX_50BD83889395C3F3` (`customer_id`),
  ADD KEY `IDX_50BD8388296CD8AE` (`team_id`);

--
-- Indexes for table `kimai2_export_templates`
--
ALTER TABLE `kimai2_export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F0CA26F2B36786B` (`title`);

--
-- Indexes for table `kimai2_invoices`
--
ALTER TABLE `kimai2_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_76C38E372DA68207` (`invoice_number`),
  ADD UNIQUE KEY `UNIQ_76C38E372323B33D` (`invoice_filename`),
  ADD KEY `IDX_76C38E37A76ED395` (`user_id`),
  ADD KEY `IDX_76C38E379395C3F3` (`customer_id`);

--
-- Indexes for table `kimai2_invoices_meta`
--
ALTER TABLE `kimai2_invoices_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_7EDC37D92989F1FD5E237E06` (`invoice_id`,`name`),
  ADD KEY `IDX_7EDC37D92989F1FD` (`invoice_id`);

--
-- Indexes for table `kimai2_invoice_templates`
--
ALTER TABLE `kimai2_invoice_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1626CFE95E237E06` (`name`),
  ADD KEY `IDX_1626CFE99395C3F3` (`customer_id`);

--
-- Indexes for table `kimai2_invoice_templates_meta`
--
ALTER TABLE `kimai2_invoice_templates_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A165B0555DA0FB85E237E06` (`template_id`,`name`),
  ADD KEY `IDX_A165B0555DA0FB8` (`template_id`);

--
-- Indexes for table `kimai2_projects`
--
ALTER TABLE `kimai2_projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_407F12069395C3F3` (`customer_id`),
  ADD KEY `IDX_407F12069395C3F37AB0E8595E237E06` (`customer_id`,`visible`,`name`),
  ADD KEY `IDX_407F12069395C3F37AB0E859BF396750` (`customer_id`,`visible`,`id`);

--
-- Indexes for table `kimai2_projects_comments`
--
ALTER TABLE `kimai2_projects_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_29A23638166D1F9C` (`project_id`),
  ADD KEY `IDX_29A23638B03A8386` (`created_by_id`);

--
-- Indexes for table `kimai2_projects_meta`
--
ALTER TABLE `kimai2_projects_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_50536EF2166D1F9C5E237E06` (`project_id`,`name`),
  ADD KEY `IDX_50536EF2166D1F9C` (`project_id`);

--
-- Indexes for table `kimai2_projects_rates`
--
ALTER TABLE `kimai2_projects_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_41535D55A76ED395166D1F9C` (`user_id`,`project_id`),
  ADD KEY `IDX_41535D55A76ED395` (`user_id`),
  ADD KEY `IDX_41535D55166D1F9C` (`project_id`);

--
-- Indexes for table `kimai2_projects_teams`
--
ALTER TABLE `kimai2_projects_teams`
  ADD PRIMARY KEY (`project_id`,`team_id`),
  ADD KEY `IDX_9345D431166D1F9C` (`project_id`),
  ADD KEY `IDX_9345D431296CD8AE` (`team_id`);

--
-- Indexes for table `kimai2_roles`
--
ALTER TABLE `kimai2_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name` (`name`);

--
-- Indexes for table `kimai2_roles_permissions`
--
ALTER TABLE `kimai2_roles_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_permission` (`role_id`,`permission`),
  ADD KEY `IDX_D263A3B8D60322AC` (`role_id`);

--
-- Indexes for table `kimai2_sessions`
--
ALTER TABLE `kimai2_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lifetime_idx` (`lifetime`);

--
-- Indexes for table `kimai2_tags`
--
ALTER TABLE `kimai2_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_27CAF54C5E237E06` (`name`),
  ADD KEY `IDX_27CAF54C7AB0E859` (`visible`);

--
-- Indexes for table `kimai2_teams`
--
ALTER TABLE `kimai2_teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_3BEDDC7F5E237E06` (`name`);

--
-- Indexes for table `kimai2_timesheet`
--
ALTER TABLE `kimai2_timesheet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4F60C6B18D93D649` (`user`),
  ADD KEY `IDX_4F60C6B181C06096` (`activity_id`),
  ADD KEY `IDX_4F60C6B1166D1F9C` (`project_id`),
  ADD KEY `IDX_4F60C6B18D93D649502DF587` (`user`,`start_time`),
  ADD KEY `IDX_4F60C6B1502DF587` (`start_time`),
  ADD KEY `IDX_4F60C6B1502DF58741561401` (`start_time`,`end_time`),
  ADD KEY `IDX_4F60C6B1502DF587415614018D93D649` (`start_time`,`end_time`,`user`),
  ADD KEY `IDX_4F60C6B1BDF467148D93D649` (`date_tz`,`user`),
  ADD KEY `IDX_4F60C6B1415614018D93D649` (`end_time`,`user`),
  ADD KEY `IDX_TIMESHEET_TICKTAC` (`end_time`,`user`,`start_time`),
  ADD KEY `IDX_TIMESHEET_RECENT_ACTIVITIES` (`user`,`project_id`,`activity_id`),
  ADD KEY `IDX_TIMESHEET_RESULT_STATS` (`user`,`id`,`duration`);

--
-- Indexes for table `kimai2_timesheet_meta`
--
ALTER TABLE `kimai2_timesheet_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_CB606CBAABDD46BE5E237E06` (`timesheet_id`,`name`),
  ADD KEY `IDX_CB606CBAABDD46BE` (`timesheet_id`);

--
-- Indexes for table `kimai2_timesheet_tags`
--
ALTER TABLE `kimai2_timesheet_tags`
  ADD PRIMARY KEY (`timesheet_id`,`tag_id`),
  ADD KEY `IDX_E3284EFEABDD46BE` (`timesheet_id`),
  ADD KEY `IDX_E3284EFEBAD26311` (`tag_id`);

--
-- Indexes for table `kimai2_users`
--
ALTER TABLE `kimai2_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_B9AC5BCEF85E0677` (`username`),
  ADD UNIQUE KEY `UNIQ_B9AC5BCEE7927C74` (`email`),
  ADD UNIQUE KEY `UNIQ_B9AC5BCEC05FB297` (`confirmation_token`),
  ADD KEY `IDX_B9AC5BCE19E9AC5F` (`supervisor_id`);

--
-- Indexes for table `kimai2_users_teams`
--
ALTER TABLE `kimai2_users_teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_B5E92CF8A76ED395296CD8AE` (`user_id`,`team_id`),
  ADD KEY `IDX_B5E92CF8A76ED395` (`user_id`),
  ADD KEY `IDX_B5E92CF8296CD8AE` (`team_id`);

--
-- Indexes for table `kimai2_user_preferences`
--
ALTER TABLE `kimai2_user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D08F631A76ED3955E237E06` (`user_id`,`name`),
  ADD KEY `IDX_8D08F631A76ED395` (`user_id`);

--
-- Indexes for table `kimai2_working_times`
--
ALTER TABLE `kimai2_working_times`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_F95E4933A76ED395AA9E377A` (`user_id`,`date`),
  ADD KEY `IDX_F95E4933A76ED395` (`user_id`),
  ADD KEY `IDX_F95E49334EA3CB3D` (`approved_by`);

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kimai2_access_token`
--
ALTER TABLE `kimai2_access_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_activities`
--
ALTER TABLE `kimai2_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kimai2_activities_meta`
--
ALTER TABLE `kimai2_activities_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_activities_rates`
--
ALTER TABLE `kimai2_activities_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_bookmarks`
--
ALTER TABLE `kimai2_bookmarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_configuration`
--
ALTER TABLE `kimai2_configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `kimai2_customers`
--
ALTER TABLE `kimai2_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kimai2_customers_comments`
--
ALTER TABLE `kimai2_customers_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_customers_meta`
--
ALTER TABLE `kimai2_customers_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_customers_rates`
--
ALTER TABLE `kimai2_customers_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_export_templates`
--
ALTER TABLE `kimai2_export_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_invoices`
--
ALTER TABLE `kimai2_invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_invoices_meta`
--
ALTER TABLE `kimai2_invoices_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_invoice_templates`
--
ALTER TABLE `kimai2_invoice_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kimai2_invoice_templates_meta`
--
ALTER TABLE `kimai2_invoice_templates_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_projects`
--
ALTER TABLE `kimai2_projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kimai2_projects_comments`
--
ALTER TABLE `kimai2_projects_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_projects_meta`
--
ALTER TABLE `kimai2_projects_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_projects_rates`
--
ALTER TABLE `kimai2_projects_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_roles`
--
ALTER TABLE `kimai2_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kimai2_roles_permissions`
--
ALTER TABLE `kimai2_roles_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_tags`
--
ALTER TABLE `kimai2_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_teams`
--
ALTER TABLE `kimai2_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kimai2_timesheet`
--
ALTER TABLE `kimai2_timesheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kimai2_timesheet_meta`
--
ALTER TABLE `kimai2_timesheet_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_users`
--
ALTER TABLE `kimai2_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kimai2_users_teams`
--
ALTER TABLE `kimai2_users_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kimai2_user_preferences`
--
ALTER TABLE `kimai2_user_preferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `kimai2_working_times`
--
ALTER TABLE `kimai2_working_times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kimai2_access_token`
--
ALTER TABLE `kimai2_access_token`
  ADD CONSTRAINT `FK_6FB0DB1EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_activities`
--
ALTER TABLE `kimai2_activities`
  ADD CONSTRAINT `FK_8811FE1C166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `kimai2_projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_activities_meta`
--
ALTER TABLE `kimai2_activities_meta`
  ADD CONSTRAINT `FK_A7C0A43D81C06096` FOREIGN KEY (`activity_id`) REFERENCES `kimai2_activities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_activities_rates`
--
ALTER TABLE `kimai2_activities_rates`
  ADD CONSTRAINT `FK_4A7F11BE81C06096` FOREIGN KEY (`activity_id`) REFERENCES `kimai2_activities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_4A7F11BEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_activities_teams`
--
ALTER TABLE `kimai2_activities_teams`
  ADD CONSTRAINT `FK_986998DA296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `kimai2_teams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_986998DA81C06096` FOREIGN KEY (`activity_id`) REFERENCES `kimai2_activities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_bookmarks`
--
ALTER TABLE `kimai2_bookmarks`
  ADD CONSTRAINT `FK_4016EF25A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_customers`
--
ALTER TABLE `kimai2_customers`
  ADD CONSTRAINT `FK_5A97604412946D8B` FOREIGN KEY (`invoice_template_id`) REFERENCES `kimai2_invoice_templates` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kimai2_customers_comments`
--
ALTER TABLE `kimai2_customers_comments`
  ADD CONSTRAINT `FK_A5B142D99395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A5B142D9B03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_customers_meta`
--
ALTER TABLE `kimai2_customers_meta`
  ADD CONSTRAINT `FK_A48A760F9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_customers_rates`
--
ALTER TABLE `kimai2_customers_rates`
  ADD CONSTRAINT `FK_82AB0AEC9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_82AB0AECA76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_customers_teams`
--
ALTER TABLE `kimai2_customers_teams`
  ADD CONSTRAINT `FK_50BD8388296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `kimai2_teams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_50BD83889395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_invoices`
--
ALTER TABLE `kimai2_invoices`
  ADD CONSTRAINT `FK_76C38E379395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_76C38E37A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_invoices_meta`
--
ALTER TABLE `kimai2_invoices_meta`
  ADD CONSTRAINT `FK_7EDC37D92989F1FD` FOREIGN KEY (`invoice_id`) REFERENCES `kimai2_invoices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_invoice_templates`
--
ALTER TABLE `kimai2_invoice_templates`
  ADD CONSTRAINT `FK_1626CFE99395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kimai2_invoice_templates_meta`
--
ALTER TABLE `kimai2_invoice_templates_meta`
  ADD CONSTRAINT `FK_A165B0555DA0FB8` FOREIGN KEY (`template_id`) REFERENCES `kimai2_invoice_templates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_projects`
--
ALTER TABLE `kimai2_projects`
  ADD CONSTRAINT `FK_407F12069395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_projects_comments`
--
ALTER TABLE `kimai2_projects_comments`
  ADD CONSTRAINT `FK_29A23638166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `kimai2_projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_29A23638B03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_projects_meta`
--
ALTER TABLE `kimai2_projects_meta`
  ADD CONSTRAINT `FK_50536EF2166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `kimai2_projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_projects_rates`
--
ALTER TABLE `kimai2_projects_rates`
  ADD CONSTRAINT `FK_41535D55166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `kimai2_projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_41535D55A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_projects_teams`
--
ALTER TABLE `kimai2_projects_teams`
  ADD CONSTRAINT `FK_9345D431166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `kimai2_projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_9345D431296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `kimai2_teams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_roles_permissions`
--
ALTER TABLE `kimai2_roles_permissions`
  ADD CONSTRAINT `FK_D263A3B8D60322AC` FOREIGN KEY (`role_id`) REFERENCES `kimai2_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_timesheet`
--
ALTER TABLE `kimai2_timesheet`
  ADD CONSTRAINT `FK_4F60C6B1166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `kimai2_projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_4F60C6B181C06096` FOREIGN KEY (`activity_id`) REFERENCES `kimai2_activities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_4F60C6B18D93D649` FOREIGN KEY (`user`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_timesheet_meta`
--
ALTER TABLE `kimai2_timesheet_meta`
  ADD CONSTRAINT `FK_CB606CBAABDD46BE` FOREIGN KEY (`timesheet_id`) REFERENCES `kimai2_timesheet` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_timesheet_tags`
--
ALTER TABLE `kimai2_timesheet_tags`
  ADD CONSTRAINT `FK_732EECA9ABDD46BE` FOREIGN KEY (`timesheet_id`) REFERENCES `kimai2_timesheet` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_732EECA9BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `kimai2_tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_users`
--
ALTER TABLE `kimai2_users`
  ADD CONSTRAINT `FK_B9AC5BCE19E9AC5F` FOREIGN KEY (`supervisor_id`) REFERENCES `kimai2_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kimai2_users_teams`
--
ALTER TABLE `kimai2_users_teams`
  ADD CONSTRAINT `FK_B5E92CF8296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `kimai2_teams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B5E92CF8A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_user_preferences`
--
ALTER TABLE `kimai2_user_preferences`
  ADD CONSTRAINT `FK_8D08F631A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_working_times`
--
ALTER TABLE `kimai2_working_times`
  ADD CONSTRAINT `FK_F95E49334EA3CB3D` FOREIGN KEY (`approved_by`) REFERENCES `kimai2_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_F95E4933A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
