-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 19, 2022 at 03:30 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dynamicform`
--

-- --------------------------------------------------------

--
-- Table structure for table `dynamic_forms`
--

DROP TABLE IF EXISTS `dynamic_forms`;
CREATE TABLE IF NOT EXISTS `dynamic_forms` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `form_definition` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dynamic_forms_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dynamic_forms`
--

INSERT INTO `dynamic_forms` (`id`, `user_id`, `form_definition`, `created_at`, `updated_at`) VALUES
(1, 1, '\"{\\\"components\\\":[{\\\"label\\\":\\\"Columns\\\",\\\"columns\\\":[{\\\"components\\\":[{\\\"label\\\":\\\"Name\\\",\\\"placeholder\\\":\\\"Full Name\\\",\\\"clearOnHide\\\":false,\\\"validate\\\":{\\\"required\\\":true,\\\"minLength\\\":6},\\\"key\\\":\\\"name\\\",\\\"type\\\":\\\"textfield\\\",\\\"input\\\":true,\\\"tableView\\\":true}],\\\"width\\\":6,\\\"offset\\\":0,\\\"push\\\":0,\\\"pull\\\":0,\\\"size\\\":\\\"md\\\",\\\"currentWidth\\\":6},{\\\"components\\\":[{\\\"label\\\":\\\"Email Address\\\",\\\"placeholder\\\":\\\"Email Address\\\",\\\"clearOnHide\\\":false,\\\"validate\\\":{\\\"required\\\":true},\\\"key\\\":\\\"emailAddress\\\",\\\"type\\\":\\\"textfield\\\",\\\"input\\\":true,\\\"tableView\\\":true}],\\\"width\\\":6,\\\"offset\\\":0,\\\"push\\\":0,\\\"pull\\\":0,\\\"size\\\":\\\"md\\\",\\\"currentWidth\\\":6}],\\\"key\\\":\\\"columns\\\",\\\"type\\\":\\\"columns\\\",\\\"input\\\":false,\\\"tableView\\\":false},{\\\"type\\\":\\\"button\\\",\\\"label\\\":\\\"Submit\\\",\\\"key\\\":\\\"submit\\\",\\\"disableOnInvalid\\\":true,\\\"input\\\":true,\\\"tableView\\\":false}]}\"', '2022-04-18 10:38:13', '2022-04-18 21:27:54');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_records`
--

DROP TABLE IF EXISTS `form_records`;
CREATE TABLE IF NOT EXISTS `form_records` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `open_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_records`
--

INSERT INTO `form_records` (`id`, `open_count`, `created_at`, `updated_at`) VALUES
(1, 3, '2022-04-18 21:25:45', '2022-04-18 21:28:08');

-- --------------------------------------------------------

--
-- Table structure for table `form_submissions`
--

DROP TABLE IF EXISTS `form_submissions`;
CREATE TABLE IF NOT EXISTS `form_submissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `form_submission` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_submissions_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_submissions`
--

INSERT INTO `form_submissions` (`id`, `user_id`, `form_submission`, `created_at`, `updated_at`) VALUES
(1, 1, '\"{\\\"name\\\":\\\"sds\\\",\\\"submit\\\":true}\"', '2022-04-18 11:42:30', '2022-04-18 11:42:30'),
(3, 3, '\"{\\\"name\\\":\\\"Siya Mishra\\\",\\\"emailAddress\\\":\\\"siya@gmail.com\\\",\\\"submit\\\":true}\"', '2022-04-18 21:28:25', '2022-04-18 21:28:25');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_04_18_114030_create_permission_tables', 1),
(6, '2022_04_18_154710_create_dynamic_forms_table', 2),
(7, '2022_04_18_163614_create_form_records_table', 3),
(8, '2022_04_18_163720_create_form_submissions_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-list', 'web', '2022-04-18 07:22:15', '2022-04-18 07:22:15'),
(2, 'role-create', 'web', '2022-04-18 07:22:15', '2022-04-18 07:22:15'),
(3, 'role-edit', 'web', '2022-04-18 07:22:15', '2022-04-18 07:22:15'),
(4, 'role-delete', 'web', '2022-04-18 07:22:15', '2022-04-18 07:22:15'),
(5, 'create-dynamic-form', 'web', '2022-04-18 07:22:15', '2022-04-18 07:22:15'),
(6, 'form-view', 'web', '2022-04-18 07:22:15', '2022-04-18 07:22:15'),
(7, 'form-submit', 'web', '2022-04-18 07:22:15', '2022-04-18 07:22:15'),
(8, 'form-records', 'web', '2022-04-18 07:22:15', '2022-04-18 07:22:15'),
(9, 'user-list', 'web', '2022-04-18 07:22:15', '2022-04-18 07:22:15'),
(10, 'user-create', 'web', '2022-04-18 07:22:15', '2022-04-18 07:22:15'),
(11, 'user-edit', 'web', '2022-04-18 07:22:15', '2022-04-18 07:22:15'),
(12, 'user-delete', 'web', '2022-04-18 07:22:15', '2022-04-18 07:22:15');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2022-04-18 07:22:15', '2022-04-18 07:22:15'),
(2, 'User', 'web', '2022-04-18 07:33:53', '2022-04-18 07:33:53');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(10, 1),
(11, 1),
(12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Shalini Tripathi', 'admin@gmail.com', NULL, '$2y$10$UfikhM9I8JgVT5It6xFuNOi6tkLcWLE.5GKqXBtVNjIThYOQUfct.', NULL, '2022-04-18 07:22:15', '2022-04-18 07:22:15'),
(3, 'Siya Mishra', 'siya@gmail.com', NULL, '$2y$10$GD6Dt7BJbVd73xHuWnTdsOa9xa6RojB1trT7/56JP9KdqwKuQr/ti', NULL, '2022-04-18 20:57:41', '2022-04-18 20:57:41');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
