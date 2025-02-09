-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 09, 2025 at 09:55 AM
-- Server version: 10.6.18-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, NULL, '$2y$12$Nk4CoGFMrDTJ54Wk2tu6AebWa8IOLVmhVhEfqq6B3aHW86APvOOQy', NULL, '2025-02-09 03:29:11', '2025-02-09 03:29:11');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `store_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Category One', '2025-02-08 23:43:11', '2025-02-08 23:43:11'),
(2, 1, 1, 'Category Two', '2025-02-08 23:43:20', '2025-02-08 23:43:20'),
(3, 1, 2, 'Category One', '2025-02-08 23:43:29', '2025-02-08 23:43:29'),
(4, 1, 2, 'Category Two', '2025-02-08 23:43:39', '2025-02-08 23:43:39'),
(5, 1, 1, 'Category Three', '2025-02-08 23:44:42', '2025-02-08 23:44:51'),
(6, 1, 2, 'Category Three', '2025-02-08 23:44:59', '2025-02-08 23:44:59'),
(7, 2, 6, 'Category One', '2025-02-08 23:45:28', '2025-02-08 23:45:28'),
(8, 2, 6, 'Category Two', '2025-02-08 23:45:38', '2025-02-08 23:45:38'),
(9, 2, 6, 'Category Three', '2025-02-08 23:45:44', '2025-02-08 23:45:44');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(5, '2025_02_09_040902_create_stores_table', 2),
(6, '2025_02_09_050049_create_categories_table', 3),
(7, '2025_02_09_054706_create_products_table', 4),
(8, '2025_02_09_082516_create_admins_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `store_id`, `category_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Product One', '2025-02-09 00:31:10', '2025-02-09 00:31:10'),
(2, 1, 1, 1, 'Product Two', '2025-02-09 00:31:31', '2025-02-09 00:31:31'),
(3, 1, 1, 1, 'Product Three', '2025-02-09 00:31:48', '2025-02-09 00:31:48'),
(4, 1, 1, 2, 'Product One', '2025-02-09 00:32:04', '2025-02-09 00:32:36'),
(5, 1, 1, 2, 'Product Two', '2025-02-09 00:32:57', '2025-02-09 00:32:57'),
(6, 1, 1, 2, 'Product Three', '2025-02-09 00:33:17', '2025-02-09 00:33:17'),
(7, 1, 1, 5, 'Product One', '2025-02-09 00:33:37', '2025-02-09 00:33:37'),
(8, 1, 1, 5, 'Product Two', '2025-02-09 00:33:53', '2025-02-09 00:33:53'),
(9, 1, 1, 5, 'Product Three', '2025-02-09 00:34:20', '2025-02-09 00:34:36'),
(10, 1, 2, 3, 'Product One', '2025-02-09 00:34:53', '2025-02-09 00:34:53'),
(11, 1, 2, 3, 'Product Two', '2025-02-09 00:35:10', '2025-02-09 00:35:10'),
(12, 1, 2, 3, 'Product Three', '2025-02-09 00:35:23', '2025-02-09 00:35:23'),
(13, 1, 2, 4, 'Product One', '2025-02-09 00:35:39', '2025-02-09 00:35:39'),
(14, 1, 2, 4, 'Product Two', '2025-02-09 00:35:56', '2025-02-09 00:35:56'),
(15, 1, 2, 4, 'Product Three', '2025-02-09 00:36:09', '2025-02-09 00:36:09'),
(16, 1, 2, 6, 'Product One', '2025-02-09 00:36:27', '2025-02-09 00:36:27'),
(17, 1, 2, 6, 'Product Two', '2025-02-09 00:36:37', '2025-02-09 00:36:37'),
(18, 1, 2, 6, 'Product Three', '2025-02-09 00:36:59', '2025-02-09 00:36:59'),
(19, 2, 6, 7, 'Product One', '2025-02-09 00:37:23', '2025-02-09 00:37:23'),
(20, 2, 6, 7, 'Product Two', '2025-02-09 00:37:30', '2025-02-09 00:37:30'),
(21, 2, 6, 7, 'Product Three', '2025-02-09 00:38:16', '2025-02-09 00:38:34'),
(22, 2, 6, 8, 'Product One', '2025-02-09 00:38:46', '2025-02-09 00:38:46'),
(23, 2, 6, 8, 'Product Two', '2025-02-09 00:38:54', '2025-02-09 00:38:54'),
(24, 2, 6, 8, 'Product Three', '2025-02-09 00:39:05', '2025-02-09 00:39:05'),
(25, 2, 6, 9, 'Product One', '2025-02-09 00:39:17', '2025-02-09 00:39:17'),
(26, 2, 6, 9, 'Product Two', '2025-02-09 00:39:25', '2025-02-09 00:39:25'),
(27, 2, 6, 9, 'Product Three', '2025-02-09 00:39:33', '2025-02-09 00:39:33'),
(29, 1, 1, 2, 'Product Four', '2025-02-09 02:03:54', '2025-02-09 02:04:54'),
(30, 1, 1, 5, 'Product Four', '2025-02-09 02:04:23', '2025-02-09 02:05:02'),
(31, 1, 1, 5, 'Product Five', '2025-02-09 02:05:13', '2025-02-09 02:05:13');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0bmm1GJAEA7XqTSrI9dhmzruILkBROsoqgTKOFzy', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiam00ZW9VU0FPeFZqN0dvM0Nla0lkQzlWQzNrY1VRRjhmQXRmOWlWMiI7czo2OiJ0b2FzdHMiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjE6e2k6MDthOjE4OntzOjc6Im1lc3NhZ2UiO3M6MTU6IlN0b3JlIG5vdCBmb3VuZCI7czo1OiJ0aXRsZSI7TjtzOjQ6InR5cGUiO3M6NToiZXJyb3IiO3M6ODoicG9zaXRpb24iO3M6ODoidG9wUmlnaHQiO3M6NDoiaWNvbiI7TjtzOjEwOiJ0aXRsZUNvbG9yIjtzOjA6IiI7czoxMjoibWVzc2FnZUNvbG9yIjtzOjA6IiI7czo5OiJ0aXRsZVNpemUiO3M6MjoiMTUiO3M6MTE6Im1lc3NhZ2VTaXplIjtzOjI6IjE1IjtzOjE1OiJ0aXRsZUxpbmVIZWlnaHQiO3M6MjoiMzgiO3M6MTc6Im1lc3NhZ2VMaW5lSGVpZ2h0IjtzOjI6IjM4IjtzOjEyOiJ0cmFuc2l0aW9uSW4iO3M6NzoiZmxpcEluWCI7czoxMzoidHJhbnNpdGlvbk91dCI7czo4OiJmbGlwT3V0WCI7czo2OiJ6aW5kZXgiO047czoxMjoiY2xvc2VPbkNsaWNrIjtiOjE7czo3OiJ0aW1lb3V0IjtpOjUwMDA7czo0OiJkcmFnIjtiOjE7czoxMToicHJvZ3Jlc3NCYXIiO2I6MTt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjE6e2k6MDtzOjY6InRvYXN0cyI7fX1zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNjoiaHR0cDovL3Nob3Bfb3NuZS50YXNrLnRlc3QiO319', 1739088832),
('c56L6HT7Xul3ihokMVlyGS7esUJ6fQ1AugzdrMBz', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYW5UbkZwMTdtSHlIQmJhYTFab1RScllqb1AyaVdYUXR2NEtycld3VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zaG9wc19vbmUudGFzay50ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1739088520),
('gvi0UQchKCaklw6hHg98WQT50dUojnl57ErNLTVr', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzFPRFo4NVVmdmV1UjZrdDhONjlPaEdNWWpoemh6MUJNUzlUMUNtQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9zaG9wX29uZS5sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1739092580),
('GWsNm7Qfn3dhQcC1Y4UGACG2IqXjpB6eCsPf3xV3', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXg5SU5BTUVUcE9Kczljd0I5VDRRUHJwWGRqdnV0ZXR1YzFkSzRUOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly9zaG9wX3R3by50YXNrLnRlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1739094288),
('h6uTp0meA6UUop4k29GYPdTNansJDITgv3pcx9Ni', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiajFSSEFJR3FnMHhqd2dhcXFkR1V3Z0N1VkI2S2M2aE5uSnVJT2piUyI7czo2OiJ0b2FzdHMiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjE6e2k6MDthOjE4OntzOjc6Im1lc3NhZ2UiO3M6MTU6IlN0b3JlIG5vdCBmb3VuZCI7czo1OiJ0aXRsZSI7TjtzOjQ6InR5cGUiO3M6NToiZXJyb3IiO3M6ODoicG9zaXRpb24iO3M6ODoidG9wUmlnaHQiO3M6NDoiaWNvbiI7TjtzOjEwOiJ0aXRsZUNvbG9yIjtzOjA6IiI7czoxMjoibWVzc2FnZUNvbG9yIjtzOjA6IiI7czo5OiJ0aXRsZVNpemUiO3M6MjoiMTUiO3M6MTE6Im1lc3NhZ2VTaXplIjtzOjI6IjE1IjtzOjE1OiJ0aXRsZUxpbmVIZWlnaHQiO3M6MjoiMzgiO3M6MTc6Im1lc3NhZ2VMaW5lSGVpZ2h0IjtzOjI6IjM4IjtzOjEyOiJ0cmFuc2l0aW9uSW4iO3M6NzoiZmxpcEluWCI7czoxMzoidHJhbnNpdGlvbk91dCI7czo4OiJmbGlwT3V0WCI7czo2OiJ6aW5kZXgiO047czoxMjoiY2xvc2VPbkNsaWNrIjtiOjE7czo3OiJ0aW1lb3V0IjtpOjUwMDA7czo0OiJkcmFnIjtiOjE7czoxMToicHJvZ3Jlc3NCYXIiO2I6MTt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjE6e2k6MDtzOjY6InRvYXN0cyI7fX1zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNjoiaHR0cDovL3Nob3BfZG9uZS50YXNrLnRlc3QiO319', 1739088925),
('IF8FEOAxtGctuZ2D0UErQpXzRyzg01VPBxQMdWSF', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnNrZTZGdm9kM0pUTHhYY09UaHkzNzNtQk1HdG9FNjloZ1VZTnZWMiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9zaG9wX29uZXMudGFzay50ZXN0L21lcmNoYW50L2xvZ2luIjt9fQ==', 1739088507),
('IUNAfFqkkllobXDmqkuiRpQTStoyv2afk0N6SNWC', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieGxyeU9UeU1kOXJhck50TVE1NHFXa1o2N0hsSkU2aW9LaVBabXhqQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1739092367),
('K7umXTrFWc2B4xCu6Yce5q8Kx6xZ13UPxpeeDBya', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVk5aFdUc25CMzZSNUNmb00weVJwRFBJd0ZmMzJUMVl0ZFZldHV6VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1739092508),
('kh5RQgKgWSt7A71kl8KGiYCRlloWKftFT8a2f6ae', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVDh6VzE2Zm55cjNpTm9yTkc2b3FOZnNaUWoxWk1WeU0wYW1UUkd2ayI7czo2OiJ0b2FzdHMiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjE6e2k6MDthOjE4OntzOjc6Im1lc3NhZ2UiO3M6MTU6IlN0b3JlIG5vdCBmb3VuZCI7czo1OiJ0aXRsZSI7TjtzOjQ6InR5cGUiO3M6NToiZXJyb3IiO3M6ODoicG9zaXRpb24iO3M6ODoidG9wUmlnaHQiO3M6NDoiaWNvbiI7TjtzOjEwOiJ0aXRsZUNvbG9yIjtzOjA6IiI7czoxMjoibWVzc2FnZUNvbG9yIjtzOjA6IiI7czo5OiJ0aXRsZVNpemUiO3M6MjoiMTUiO3M6MTE6Im1lc3NhZ2VTaXplIjtzOjI6IjE1IjtzOjE1OiJ0aXRsZUxpbmVIZWlnaHQiO3M6MjoiMzgiO3M6MTc6Im1lc3NhZ2VMaW5lSGVpZ2h0IjtzOjI6IjM4IjtzOjEyOiJ0cmFuc2l0aW9uSW4iO3M6NzoiZmxpcEluWCI7czoxMzoidHJhbnNpdGlvbk91dCI7czo4OiJmbGlwT3V0WCI7czo2OiJ6aW5kZXgiO047czoxMjoiY2xvc2VPbkNsaWNrIjtiOjE7czo3OiJ0aW1lb3V0IjtpOjUwMDA7czo0OiJkcmFnIjtiOjE7czoxMToicHJvZ3Jlc3NCYXIiO2I6MTt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjE6e2k6MDtzOjY6InRvYXN0cyI7fX1zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNjoiaHR0cDovL3Nob3Bfb25lcy50YXNrLnRlc3QiO319', 1739088812),
('mKIgbDQZBNqi1UUaytTeexZYEirsMf0JKaiQEoeO', 2, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQW9MWDhBWnN0clV6cVJ1SGJkdHZpZU5uQ0FJWlpIY2dUVDV5VGZsaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly90YXNrLnRlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUyOiJsb2dpbl9hZG1pbl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1739094722),
('MNCYMluREduim1YVKG9FHSdttYOSckj5TDVI9Flc', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmVqSGZwbVJ2RmZVS2dNa3o4TWJFWVk1VEQwakpDd2N0Sm9rTnhJcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly9zaG9wX29uZS50YXNrLnRlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1739088809),
('oHncSyRu4nC8GAAN0UwPqPeFmVp5oNboT1khkrEY', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0puQ3FsUXpic1VhRU1tMGVHem9TeExUT2xnbDJZWjRwTm1keHBkcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9zaG9wX29uZTEudGFzay50ZXN0L21lcmNoYW50L2xvZ2luIjt9fQ==', 1739088459),
('RRSifl5vckIvtSEkTUxWApzTSrxRhqzelcTdMlOO', 2, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQlh3bUJhbmRsSXdmMFJRMEZidWxET0JzZXJCeGdoWjk4RDlSOEhhWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly90YXNrLnRlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1739088812),
('Tf5H1oG11p6L7fePKxIpKXUqXHL0LTX0NLGBQYw6', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiam1KTWY4Qk1kOExXQUFvbmtRd2hiOHNsalVsYkxWWXB3OTdGeHUzQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9tZXJjaGVudF90d29fc3RvcmUudGFzay50ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1739089325),
('UAHLLfj6uBdKiiVlvz0pApJf7U4cTZ5pFGZMabgb', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRk5ZazZtSzJKSUppRzRtTlNXQjFoZ3RNQ29tMHBya2YwaXI2SVlrdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9zaG9wX29uZS50YXNrLnRlc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1739092583),
('yaYGR9fPxhJvH0puyOh3zBiNY3VW1APqgkHzNzSi', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSjZkUjA3T1hHVHZMNGZxYWM1TjlTU01oNDVJUHg5R3BYdjlBZTNEMiI7czo2OiJ0b2FzdHMiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjE6e2k6MDthOjE4OntzOjc6Im1lc3NhZ2UiO3M6MTU6IlN0b3JlIG5vdCBmb3VuZCI7czo1OiJ0aXRsZSI7TjtzOjQ6InR5cGUiO3M6NToiZXJyb3IiO3M6ODoicG9zaXRpb24iO3M6ODoidG9wUmlnaHQiO3M6NDoiaWNvbiI7TjtzOjEwOiJ0aXRsZUNvbG9yIjtzOjA6IiI7czoxMjoibWVzc2FnZUNvbG9yIjtzOjA6IiI7czo5OiJ0aXRsZVNpemUiO3M6MjoiMTUiO3M6MTE6Im1lc3NhZ2VTaXplIjtzOjI6IjE1IjtzOjE1OiJ0aXRsZUxpbmVIZWlnaHQiO3M6MjoiMzgiO3M6MTc6Im1lc3NhZ2VMaW5lSGVpZ2h0IjtzOjI6IjM4IjtzOjEyOiJ0cmFuc2l0aW9uSW4iO3M6NzoiZmxpcEluWCI7czoxMzoidHJhbnNpdGlvbk91dCI7czo4OiJmbGlwT3V0WCI7czo2OiJ6aW5kZXgiO047czoxMjoiY2xvc2VPbkNsaWNrIjtiOjE7czo3OiJ0aW1lb3V0IjtpOjUwMDA7czo0OiJkcmFnIjtiOjE7czoxMToicHJvZ3Jlc3NCYXIiO2I6MTt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjE6e2k6MDtzOjY6InRvYXN0cyI7fX1zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNjoiaHR0cDovL3Nob3Bfb25zZS50YXNrLnRlc3QiO319', 1739088865);

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `user_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'shop_one', '2025-02-08 22:55:20', '2025-02-08 22:55:20'),
(2, 1, 'shop_two', '2025-02-08 22:55:26', '2025-02-08 22:55:26'),
(6, 2, 'merchent_two_store', '2025-02-08 23:17:46', '2025-02-08 23:17:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `shop_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `shop_name`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Merchant One', 'merchant1@gmail.com', NULL, 'Merchant One Shop', '$2y$12$KmbsC8IDIWZJbemipZVP/u378GltwoFfn278NBPBaxCJKvvOgLmTy', NULL, '2025-02-09 04:20:16', '2025-02-09 04:20:16'),
(2, 'Merchant Two', 'merchant2@gmail.com', NULL, 'Merchant Two Shop', '$2y$12$7rVSTsReKkP5aVwdqYOuv.1fKSxuq.KA6csFztTDfntMkbmfRjJV6', NULL, '2025-02-09 04:24:10', '2025-02-09 04:24:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_user_id_foreign` (`user_id`),
  ADD KEY `categories_store_id_foreign` (`store_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_store_id_foreign` (`store_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stores_name_unique` (`name`),
  ADD KEY `stores_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
