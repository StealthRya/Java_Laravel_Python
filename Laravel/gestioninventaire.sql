-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 20, 2025 at 05:49 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestioninventaire`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
CREATE TABLE IF NOT EXISTS `activities` (
  `idActivite` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `dateActivite` date NOT NULL,
  `TypeActivite` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idActivite`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`idActivite`, `dateActivite`, `TypeActivite`, `created_at`, `updated_at`) VALUES
(2, '2025-03-15', 'retave', '2025-03-17 18:08:41', '2025-03-17 18:08:41'),
(3, '2025-03-21', 'op', '2025-03-20 17:34:12', '2025-03-20 17:34:12');

-- --------------------------------------------------------

--
-- Table structure for table `add_product_saves`
--

DROP TABLE IF EXISTS `add_product_saves`;
CREATE TABLE IF NOT EXISTS `add_product_saves` (
  `idAddProductSave` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantityReceived` int NOT NULL,
  `nameSupplier` varchar(60) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateReceipt` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idAddProductSave`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `idCategory` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nameCategory` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`idCategory`, `nameCategory`, `created_at`, `updated_at`) VALUES
(1, 'bonbon', '2025-03-15 10:27:24', '2025-03-15 10:27:24'),
(2, 'legume', '2025-03-15 10:27:29', '2025-03-15 10:27:29'),
(3, 'collation', '2025-03-15 10:27:34', '2025-03-15 10:27:34'),
(4, 'Fruit', '2025-03-15 10:27:40', '2025-03-15 10:27:40');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `idEmployee` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nameEmployee` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `cityEmployee` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idEmployee`),
  KEY `employees_warehouse_id_foreign` (`warehouse_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`idEmployee`, `nameEmployee`, `cityEmployee`, `warehouse_id`, `created_at`, `updated_at`) VALUES
(4, 'ertyuio', 'KDGOU', 5, '2025-03-18 12:58:38', '2025-03-18 12:58:38');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_02_25_143250_create_employees_table', 1),
(6, '2025_02_25_143309_create_activities_table', 1),
(7, '2025_02_25_143332_create_warehouses_table', 1),
(8, '2025_02_25_143453_create_categories_table', 1),
(9, '2025_02_25_143509_create_add_product_saves_table', 1),
(10, '2025_02_25_143527_create_remove_product_saves_table', 1),
(11, '2025_02_25_143552_create_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb3_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `idProduct` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nameProduct` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `purchasePrice` int NOT NULL,
  `dateReceipt` date NOT NULL,
  `quantityProduct` int NOT NULL,
  `idCategory` int UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idProduct`),
  KEY `products_warehouse_id_foreign` (`warehouse_id`),
  KEY `products_idcategory_foreign` (`idCategory`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`idProduct`, `nameProduct`, `purchasePrice`, `dateReceipt`, `quantityProduct`, `idCategory`, `warehouse_id`, `created_at`, `updated_at`) VALUES
(19, 'Tomate', 100, '2025-03-18', 1500, 2, 7, '2025-03-18 12:44:10', '2025-03-18 12:44:10'),
(9, 'Tomate', 1244, '2004-02-01', 12, 1, 5, '2025-03-14 16:19:13', '2025-03-14 16:19:13'),
(10, 'Tomate', 1244, '2004-02-01', 12, 1, 2, '2025-03-14 16:21:01', '2025-03-14 16:21:01'),
(11, 'Tomate', 1244, '2004-02-01', 12, 1, 4, '2025-03-14 16:21:03', '2025-03-14 16:21:03'),
(12, 'Tomate', 1244, '2004-02-01', 12, 1, 2, '2025-03-14 16:21:05', '2025-03-14 16:21:05'),
(13, 'Tomate', 1244, '2004-02-01', 12, 1, 2, '2025-03-14 16:22:32', '2025-03-14 16:22:32'),
(14, 'Tomate', 1244, '2004-02-01', 12, 1, 2, '2025-03-14 16:22:35', '2025-03-14 16:22:35'),
(15, 'Tomate', 124, '2025-03-15', 12, 1, 2, '2025-03-15 10:22:55', '2025-03-15 10:22:55'),
(16, 'E- commerce', 23, '2025-03-16', 56, NULL, 2, '2025-03-15 11:02:43', '2025-03-15 11:02:43');

-- --------------------------------------------------------

--
-- Table structure for table `remove_product_saves`
--

DROP TABLE IF EXISTS `remove_product_saves`;
CREATE TABLE IF NOT EXISTS `remove_product_saves` (
  `idProduct` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantityRemoved` int NOT NULL,
  `removedReason` varchar(60) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idProduct`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
CREATE TABLE IF NOT EXISTS `warehouses` (
  `idWarehouse` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nameWarehouse` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `cityWarehouse` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idWarehouse`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`idWarehouse`, `nameWarehouse`, `cityWarehouse`, `created_at`, `updated_at`) VALUES
(5, 'SONKAR', 'Koudougou', '2025-03-17 18:07:29', '2025-03-17 18:07:29'),
(7, 'LEGTEX', 'Koudoug', '2025-03-17 18:26:30', '2025-03-18 12:43:06'),
(6, 'SOFITEX', 'Ouaga', '2025-03-17 18:07:43', '2025-03-17 18:07:43');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
