-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 28, 2022 at 04:50 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lara_mini_project_api_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Shirt', 1, '2022-09-19 18:55:10', '2022-09-19 18:55:10'),
(2, 'Bag', 1, '2022-09-19 18:55:10', '2022-09-19 18:55:10'),
(3, 'Shoe', 1, '2022-09-19 18:55:10', '2022-09-19 18:55:10'),
(4, 'Cosmetic', 1, '2022-09-19 18:55:10', '2022-09-19 18:55:10'),
(7, 'Food', 1, '2022-09-25 23:22:02', '2022-09-26 00:04:52');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint(20) NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `items_subcategory_id_foreign` (`subcategory_id`),
  KEY `items_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `code`, `subcategory_id`, `user_id`, `description`, `price`, `photo`, `discount`, `created_at`, `updated_at`) VALUES
(1, 'Beauty', 's-0002', 5, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 1300, '632939bc2056d-photo-beauty.png', 10, '2022-09-19 18:55:40', '2022-09-19 18:55:40'),
(2, 'Sunsilk', 's-0001', 5, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 1400, '632939d6466b2-photo-sunsilk.png', 10, '2022-09-19 18:56:06', '2022-09-19 18:56:06'),
(3, 'Lipstick', 's-0003', 6, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 1400, '6329468e166a4-photo-lipstick.jpg', 10, '2022-09-19 19:50:22', '2022-09-19 19:50:22'),
(4, 'Watch', 's-0005', 11, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 1400, '632946c768868-photo-watch.png', 10, '2022-09-19 19:51:19', '2022-09-27 19:11:34'),
(6, 'Poe', 'p-1111', 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1200, '633154a89b930-photo-poe3.jpg', NULL, '2022-09-25 22:28:40', '2022-09-25 22:28:40'),
(7, 'Apple & Orange', 'p-009', 7, 1, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.', 1500, '6332629c200a5-photo-apple&orange.jpg', NULL, '2022-09-26 17:40:28', '2022-09-26 17:47:45');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_09_16_035913_create_items_table', 1),
(6, '2022_09_16_035936_create_subcategories_table', 1),
(7, '2022_09_16_035954_create_categories_table', 1),
(8, '2022_09_19_070716_create_orders_table', 1),
(9, '2022_09_20_103252_create_aa_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `stock` int(11) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_item_id_foreign` (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `item_id`, `stock`, `amount`, `created_at`, `updated_at`) VALUES
(7, 1, 4, 1, 1400, NULL, NULL),
(8, 1, 3, 1, 1400, NULL, NULL),
(9, 1, 3, 1, 1400, '2022-09-23 15:00:00', '2022-09-23 15:00:00'),
(10, 1, 4, 1, 1400, '2022-09-24 09:02:33', '2022-09-24 09:02:33');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'phone', '49a7f300ca9c41c9d8c8bdace1beb2376b22190326018b281dd452d06be30e9a', '[\"*\"]', '2022-09-26 21:49:20', NULL, '2022-09-19 18:55:26', '2022-09-26 21:49:20'),
(2, 'App\\Models\\User', 1, 'phone', '2d81669342ec6e0e4c6d3887e6044e7f0a110a5bb819342512a769a7880ffd71', '[\"*\"]', '2022-09-19 20:03:42', NULL, '2022-09-19 19:22:16', '2022-09-19 20:03:42'),
(3, 'App\\Models\\User', 1, 'phone', '9e542b089d42076555e06c7286b35fe44e9e5c9be9e19337f9335c8380df4f9f', '[\"*\"]', NULL, NULL, '2022-09-19 20:06:15', '2022-09-19 20:06:15'),
(4, 'App\\Models\\User', 1, 'phone', 'fdaba2a9be7ecbb7bf0697d2ea06af505980a1288638f400e5384ed48d3c575b', '[\"*\"]', NULL, NULL, '2022-09-19 20:06:17', '2022-09-19 20:06:17'),
(5, 'App\\Models\\User', 1, 'phone', '0460b6aee13c7326a6d9eec091e3981f0f6a141d0403c36285696aa9506407bb', '[\"*\"]', NULL, NULL, '2022-09-19 20:07:04', '2022-09-19 20:07:04'),
(6, 'App\\Models\\User', 1, 'phone', 'affe131c9f00c719d4b846f0ccd2198d16bf7e1a00c794a1394245e2bbe4be81', '[\"*\"]', NULL, NULL, '2022-09-19 20:08:40', '2022-09-19 20:08:40'),
(7, 'App\\Models\\User', 1, 'phone', 'abb81030d8593da23d7928d0cf8dbd56e967f257a62fade3f063b070b9836ec1', '[\"*\"]', NULL, NULL, '2022-09-19 20:09:35', '2022-09-19 20:09:35'),
(8, 'App\\Models\\User', 1, 'phone', '59c320cd6c727a905a3465d207d0303d528d6db3439bb62af6fc0112432a0ebc', '[\"*\"]', NULL, NULL, '2022-09-19 20:11:27', '2022-09-19 20:11:27'),
(9, 'App\\Models\\User', 1, 'phone', '9ceb57f3fd01ab58c0d70517d7931889034b23f72e44e0f1bea9a72a25b9d0ce', '[\"*\"]', '2022-09-19 20:13:15', NULL, '2022-09-19 20:11:28', '2022-09-19 20:13:15'),
(10, 'App\\Models\\User', 1, 'phone', 'ef356761ae3e87dccbb99e287ce7c4f6a4bdc896135a8ad3354d50daf7ed7b5f', '[\"*\"]', '2022-09-19 20:13:21', NULL, '2022-09-19 20:13:15', '2022-09-19 20:13:21'),
(11, 'App\\Models\\User', 1, 'phone', '15577d3559b50fb34aee7206eb4732c9836718016e214babbb57ca6478dca4c7', '[\"*\"]', NULL, NULL, '2022-09-19 20:17:53', '2022-09-19 20:17:53'),
(12, 'App\\Models\\User', 1, 'phone', 'c351966f0842e63d3f85ccf3abcfd731381c45fdbc7a140365a749c7378d85e8', '[\"*\"]', NULL, NULL, '2022-09-19 20:17:54', '2022-09-19 20:17:54'),
(13, 'App\\Models\\User', 1, 'phone', '47abcebecee9fa2d3c411eddc8dcf3d58f05b87ced81afc10ccd09373fe28a5e', '[\"*\"]', NULL, NULL, '2022-09-19 20:17:54', '2022-09-19 20:17:54'),
(14, 'App\\Models\\User', 1, 'phone', '9da4ee2fd494fde5dd0cd98168d80d25f7022a205d2bc9fd0b7778d48af5faa1', '[\"*\"]', NULL, NULL, '2022-09-19 20:17:55', '2022-09-19 20:17:55'),
(15, 'App\\Models\\User', 1, 'phone', '10d4ba6e1676344f5e2f941a0c01040a39c64ff2b4792d9618ac4d3166e159fd', '[\"*\"]', NULL, NULL, '2022-09-19 20:17:55', '2022-09-19 20:17:55'),
(16, 'App\\Models\\User', 1, 'phone', 'e1e6cccc35c8d6b38881efc573d6361bc5fe90db162a9fb56910f117a427e0ff', '[\"*\"]', NULL, NULL, '2022-09-19 20:17:55', '2022-09-19 20:17:55'),
(17, 'App\\Models\\User', 1, 'phone', 'b562909fe40f11f9e63e75db1509c4ce12229d482926ab17cb61cd0fc69eb678', '[\"*\"]', NULL, NULL, '2022-09-19 20:17:56', '2022-09-19 20:17:56'),
(18, 'App\\Models\\User', 1, 'phone', 'f2fb349e1cf1822e5153e7c2956324e1369e2e39fcb1e63c65155bfde261442b', '[\"*\"]', NULL, NULL, '2022-09-19 20:17:56', '2022-09-19 20:17:56'),
(19, 'App\\Models\\User', 1, 'phone', 'd9deaecb0482a73da1b0196049dff97e8730860576e7321cca928b1246e79a4e', '[\"*\"]', NULL, NULL, '2022-09-19 20:17:57', '2022-09-19 20:17:57'),
(20, 'App\\Models\\User', 1, 'phone', '03906d2a8567c2ce85eacdd2dca1e583fde7d1447417a0acf6e879863565b3e6', '[\"*\"]', '2022-09-19 20:22:16', NULL, '2022-09-19 20:17:57', '2022-09-19 20:22:16'),
(21, 'App\\Models\\User', 1, 'phone', 'bb8a7a520b49de1412e6d8c4659069618eb6251d8aac9f3895075cbec4d72190', '[\"*\"]', '2022-09-19 20:30:13', NULL, '2022-09-19 20:29:56', '2022-09-19 20:30:13'),
(22, 'App\\Models\\User', 1, 'phone', '23902a70b133dca9a7bab3b1caa6c9af1efedc0769dee9fa0a202be4ced4e60a', '[\"*\"]', '2022-09-19 20:32:36', NULL, '2022-09-19 20:30:13', '2022-09-19 20:32:36'),
(23, 'App\\Models\\User', 1, 'phone', '111f6ce987d15a9f301e8aa48d377508d2340e629bcd38938df88d096f8cdc7b', '[\"*\"]', '2022-09-19 22:09:23', NULL, '2022-09-19 20:30:35', '2022-09-19 22:09:23'),
(24, 'App\\Models\\User', 1, 'phone', '1db70fcf990aecddd211417583cf1c4cf78c16a2ab4623fef07c114b14b3b046', '[\"*\"]', '2022-09-19 22:11:47', NULL, '2022-09-19 22:09:04', '2022-09-19 22:11:47'),
(25, 'App\\Models\\User', 1, 'phone', 'f01589d8c0dafffcbd802a0a8d69ee9cab9ffc4238993c9016e5bb93cdc17bf9', '[\"*\"]', '2022-09-19 22:14:47', NULL, '2022-09-19 22:11:38', '2022-09-19 22:14:47'),
(26, 'App\\Models\\User', 1, 'phone', '211dd1fd52173bbf23f73277bc338055a80b5a105942e54dea29f5293de18601', '[\"*\"]', '2022-09-19 22:21:10', NULL, '2022-09-19 22:14:46', '2022-09-19 22:21:10'),
(27, 'App\\Models\\User', 1, 'phone', '9d18e16308e2cbd9d27bbe76b9879dfdd36abe578f1da77bcb89d95cc2d21d2b', '[\"*\"]', '2022-09-20 00:41:59', NULL, '2022-09-19 22:21:10', '2022-09-20 00:41:59'),
(28, 'App\\Models\\User', 1, 'phone', '846df7a4769b36834754875e3b3ce229f83dc12c7421d748a7f6dfe5b134b467', '[\"*\"]', '2022-09-20 17:12:00', NULL, '2022-09-20 01:12:07', '2022-09-20 17:12:00'),
(29, 'App\\Models\\User', 1, 'phone', '00729859db91ed56748bf42d437ea004464d10127abcb9dfb9f0299a9153e8c3', '[\"*\"]', '2022-09-22 18:09:07', NULL, '2022-09-20 17:03:58', '2022-09-22 18:09:07'),
(30, 'App\\Models\\User', 1, 'phone', 'a393ff81f5df7cc3946221c022d4acd97ff8d5b6718082ed4b89b3652ef4fff8', '[\"*\"]', '2022-09-26 18:12:56', NULL, '2022-09-20 19:47:49', '2022-09-26 18:12:56'),
(31, 'App\\Models\\User', 1, 'phone', '652c30ae99879bbe35a5e7794c3c459f16f7ebbcf8e8375efba8c23fd3360252', '[\"*\"]', '2022-09-23 23:54:39', NULL, '2022-09-22 17:13:18', '2022-09-23 23:54:39'),
(32, 'App\\Models\\User', 1, 'phone', '21c060bc73d7428e5d29fcc6521eddc446f67b1697688751fdd2ee92a24ef05f', '[\"*\"]', '2022-09-25 16:54:38', NULL, '2022-09-23 23:50:07', '2022-09-25 16:54:38'),
(33, 'App\\Models\\User', 1, 'phone', '343e3b8a42aaa5cbe857e7cd09cae02802709c09ecf15ce743abb051ddbb1e69', '[\"*\"]', '2022-09-25 16:55:51', NULL, '2022-09-25 16:55:49', '2022-09-25 16:55:51'),
(34, 'App\\Models\\User', 1, 'phone', 'd10e58098b78a9577ecb8cb32ca6e2a1e1fdffa6919e2e7c42a53a0ad4a60229', '[\"*\"]', '2022-09-26 00:37:41', NULL, '2022-09-25 17:08:16', '2022-09-26 00:37:41'),
(35, 'App\\Models\\User', 1, 'phone', '814415fc35841f767ebb2c4864c529b4177010976b137ff957ed185bde975cc7', '[\"*\"]', '2022-09-25 20:06:28', NULL, '2022-09-25 19:43:10', '2022-09-25 20:06:28'),
(36, 'App\\Models\\User', 1, 'phone', 'fd52a161a5e6f962f693ed1cdb3ab3430c016cff3d72a6b656793991bbef1c3d', '[\"*\"]', '2022-09-26 00:43:02', NULL, '2022-09-26 00:41:52', '2022-09-26 00:43:02'),
(37, 'App\\Models\\User', 1, 'phone', '369b760c95a3b933fe20a73931616ef784226652c91e0a912775c36397ebc063', '[\"*\"]', '2022-09-26 00:45:34', NULL, '2022-09-26 00:44:30', '2022-09-26 00:45:34'),
(38, 'App\\Models\\User', 1, 'phone', '838d86918a8357fb65d53cca482ddeef062a0a6c93e78f94bdcc889c19bb0103', '[\"*\"]', '2022-09-26 00:51:47', NULL, '2022-09-26 00:48:40', '2022-09-26 00:51:47'),
(39, 'App\\Models\\User', 1, 'phone', '33353598e1ac3252b9de7e98d49d386792519e57749170c4da376ea4cd1c7147', '[\"*\"]', '2022-09-26 00:55:28', NULL, '2022-09-26 00:52:03', '2022-09-26 00:55:28'),
(40, 'App\\Models\\User', 1, 'phone', 'afccc6b237d3d497c6e3f40cddffc5b7ccf00b09a30ba2410048f26ff58c2f5f', '[\"*\"]', NULL, NULL, '2022-09-26 00:54:54', '2022-09-26 00:54:54'),
(41, 'App\\Models\\User', 1, 'phone', '66b159aaa5afdddfa0c14618bc735fac0e43e1d7f70eb683de24924d190e8837', '[\"*\"]', '2022-09-26 01:02:05', NULL, '2022-09-26 00:56:22', '2022-09-26 01:02:05'),
(42, 'App\\Models\\User', 1, 'phone', '06e151235596383b0e152e375bc27e822f6673ac5028a64a28ced4b3c87bf5a7', '[\"*\"]', '2022-09-26 01:02:57', NULL, '2022-09-26 01:02:01', '2022-09-26 01:02:57'),
(43, 'App\\Models\\User', 1, 'phone', 'b755a63aa4cb3f73aeaee4b0840be296fad591fbac724e268b2a85125aec0563', '[\"*\"]', '2022-09-26 01:04:32', NULL, '2022-09-26 01:03:27', '2022-09-26 01:04:32'),
(44, 'App\\Models\\User', 1, 'phone', '28a46a26c3a9bbc8eb559d7de5234af9a8657a7e1f97d45cc452c7a5a55763c0', '[\"*\"]', '2022-09-26 01:10:38', NULL, '2022-09-26 01:09:53', '2022-09-26 01:10:38'),
(45, 'App\\Models\\User', 1, 'phone', 'e2cb5fe718680f33b2c199b22f382a2b1cc5e82e9ef2d784537e555d30b510e2', '[\"*\"]', '2022-09-26 01:11:46', NULL, '2022-09-26 01:11:18', '2022-09-26 01:11:46'),
(46, 'App\\Models\\User', 1, 'phone', '636a58d89f3e16dafcb6929ab694a08b859b0db20b9abd3940e52b88951903a6', '[\"*\"]', '2022-09-26 01:16:40', NULL, '2022-09-26 01:14:55', '2022-09-26 01:16:40'),
(47, 'App\\Models\\User', 1, 'phone', 'd62ea523584d1225553988271a6bc9036c072de2b87aa747d395492b52a238e1', '[\"*\"]', NULL, NULL, '2022-09-26 01:16:22', '2022-09-26 01:16:22'),
(48, 'App\\Models\\User', 1, 'phone', 'f62e271449f7707682d876976130fe1905de3fd90e59ff4d184e5431e1a5eb47', '[\"*\"]', '2022-09-26 01:22:10', NULL, '2022-09-26 01:20:22', '2022-09-26 01:22:10'),
(49, 'App\\Models\\User', 1, 'phone', 'f20a1a47069de23d523c613ee9295af5e83cccc2492459aa509e5a17b234b6c7', '[\"*\"]', '2022-09-26 01:59:06', NULL, '2022-09-26 01:56:44', '2022-09-26 01:59:06'),
(50, 'App\\Models\\User', 1, 'phone', '57516fbc8a87e3146d49c468e21c230d3b203cb3c896e7af47ae34af4d383fb4', '[\"*\"]', NULL, NULL, '2022-09-26 01:58:44', '2022-09-26 01:58:44'),
(51, 'App\\Models\\User', 1, 'phone', '449edb0bcb3507d036c3e91524f33be6f982af1de97036521c371b461fd8c3fa', '[\"*\"]', '2022-09-26 17:11:12', NULL, '2022-09-26 17:06:17', '2022-09-26 17:11:12'),
(52, 'App\\Models\\User', 1, 'phone', '74fff210495c2162dfea8cad69d8434661004ead39158ec13645decd15a0c164', '[\"*\"]', '2022-09-26 20:00:53', NULL, '2022-09-26 17:07:41', '2022-09-26 20:00:53'),
(53, 'App\\Models\\User', 1, 'phone', 'b48b8c832b067ab80f2d8db8602955c87c006cf9090d2655fff2127933948099', '[\"*\"]', '2022-09-26 22:00:55', NULL, '2022-09-26 19:44:25', '2022-09-26 22:00:55'),
(54, 'App\\Models\\User', 4, 'phone', 'e36898c50aeb405fc632df19f75f676fb0ae5911dabd4d0a0e0eeb9b07b54c04', '[\"*\"]', '2022-09-26 22:02:02', NULL, '2022-09-26 21:53:36', '2022-09-26 22:02:02'),
(55, 'App\\Models\\User', 1, 'phone', '5663539953883ef068cedee341bc288b7b5d12d6bfd3fa438b1f96a0897b66ef', '[\"*\"]', '2022-09-27 01:32:01', NULL, '2022-09-26 22:02:43', '2022-09-27 01:32:01'),
(56, 'App\\Models\\User', 1, 'phone', '2321d8aa6bca6820f59a1385d771785fc4a267fbf2307404a07519e68bf61346', '[\"*\"]', '2022-09-27 01:43:01', NULL, '2022-09-27 01:36:46', '2022-09-27 01:43:01'),
(57, 'App\\Models\\User', 7, 'phone', '4e72d1d74f237dae755ab5c6771057741ec0dcbc50e10cc4efabeec53d73c165', '[\"*\"]', '2022-09-27 02:00:39', NULL, '2022-09-27 01:46:33', '2022-09-27 02:00:39'),
(58, 'App\\Models\\User', 7, 'phone', 'b842b9bd9da65c6fd4fafd7484707a71da51f4c06d3a5850ebf301b293108555', '[\"*\"]', '2022-09-27 17:19:57', NULL, '2022-09-27 02:00:19', '2022-09-27 17:19:57'),
(59, 'App\\Models\\User', 1, 'phone', '1b0a9f526b26b0e74092ffa74ddde7e2a55b241b8729148f4d2d0fec96db6e04', '[\"*\"]', NULL, NULL, '2022-09-27 17:21:50', '2022-09-27 17:21:50'),
(60, 'App\\Models\\User', 1, 'phone', '30010012cf5fe91fe998ceb13870c65529c8d69c1a0d7d0d274b77db798ff843', '[\"*\"]', '2022-09-27 19:07:00', NULL, '2022-09-27 17:27:47', '2022-09-27 19:07:00'),
(61, 'App\\Models\\User', 1, 'phone', '08e734b93d1ff34bca7e5bb3497c6cc9191356761ee387e7f4434242617914c9', '[\"*\"]', '2022-09-27 19:11:34', NULL, '2022-09-27 19:06:23', '2022-09-27 19:11:34');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
CREATE TABLE IF NOT EXISTS `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subcategories_category_id_foreign` (`category_id`),
  KEY `subcategories_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `title`, `category_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'woman shirt', 1, 2, '2022-09-19 18:55:10', '2022-09-19 18:55:10'),
(2, 'man shirt', 1, 3, '2022-09-19 18:55:10', '2022-09-19 18:55:10'),
(3, 'wallet', 2, 2, '2022-09-19 18:55:10', '2022-09-19 18:55:10'),
(4, 'woman shoe', 3, 3, '2022-09-19 18:55:10', '2022-09-19 18:55:10'),
(5, 'shampoo', 4, 2, '2022-09-19 18:55:10', '2022-09-19 18:55:10'),
(6, 'litstick', 4, 3, '2022-09-19 18:55:10', '2022-09-19 18:55:10'),
(7, 'Snap', 7, 1, '2022-09-26 17:41:00', '2022-09-26 18:46:02'),
(11, 'watch', 4, 1, '2022-09-27 19:11:13', '2022-09-27 19:11:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','editor','author') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'author',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', '2022-09-19 18:55:10', '$2y$10$9KC4zDAx6DK.XJpHV0N0ZOWimJ5C2sRFCAnTUX.g8hBmhlPq2rzae', 'g1PsMMTO7K', '2022-09-19 18:55:10', '2022-09-27 01:02:33'),
(2, 'author', 'author@gmail.com', 'author', '2022-09-19 18:55:10', '$2y$10$OO8uxhGR1rmu980OWKMFretrgVkbTY9e8J8Fs8D2ooqlU6gOd.vK6', '7MqPOMXWQz', '2022-09-19 18:55:10', '2022-09-26 23:22:01'),
(3, 'editor', 'editor@gmail.com', 'editor', '2022-09-19 18:55:10', '$2y$10$1xxsI8zuf5/AHCfGVSDzr.oXhz/NIHZx7bUCXsJp5JeEtLEThjs3C', 'gcTMiPykdK', '2022-09-19 18:55:10', '2022-09-19 18:55:10'),
(7, 'su pon', 'supon@gmail.com', 'author', NULL, '$2y$10$CErlTxwA5YK6fzQU/zrMMebc7fwgIPNd5Y6OVEZwkuyIge3reWDVS', NULL, '2022-09-27 01:43:01', '2022-09-27 01:57:56');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
