-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2021 at 02:23 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pinetco_media`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(17, '2014_10_12_000000_create_users_table', 1),
(18, '2014_10_12_100000_create_password_resets_table', 1),
(19, '2019_08_19_000000_create_failed_jobs_table', 1),
(20, '2021_07_07_064342_create_organizations_table', 1),
(21, '2021_07_07_090244_create_jobs_table', 1),
(22, '2021_07_07_093602_create_posts_table', 1),
(23, '2021_07_07_094020_create_post_likes_table', 2),
(24, '2021_07_07_094322_create_post_comments_table', 3),
(25, '2021_07_07_112734_create_notifications_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `organization_name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Pinetco India', NULL, '2021-07-07 04:27:26', NULL),
(2, 'Pinetco German', NULL, '2021-07-07 04:27:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_of_like` int(11) NOT NULL DEFAULT 0,
  `user_list_liked` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `description`, `image`, `no_of_like`, `user_list_liked`, `deleted_at`, `created_at`, `updated_at`) VALUES
(13, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'asdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaaasdsadsaa', NULL, 0, NULL, '2021-07-07 05:55:03', '2021-07-07 05:31:42', '2021-07-07 05:55:03'),
(14, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', '1625656345.jpg', 0, NULL, NULL, '2021-07-07 05:42:25', '2021-07-07 05:42:25'),
(15, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', NULL, 0, NULL, '2021-07-07 05:56:56', '2021-07-07 05:56:53', '2021-07-07 05:56:56'),
(16, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', NULL, 0, NULL, NULL, '2021-07-07 06:06:08', '2021-07-07 06:06:08'),
(17, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', NULL, 0, NULL, NULL, '2021-07-07 06:06:57', '2021-07-07 06:06:57'),
(18, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', NULL, 0, NULL, NULL, '2021-07-07 06:07:31', '2021-07-07 06:07:31'),
(19, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', NULL, 0, NULL, NULL, '2021-07-07 06:08:03', '2021-07-07 06:08:03'),
(20, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', NULL, 0, NULL, NULL, '2021-07-07 06:12:04', '2021-07-07 06:12:04'),
(21, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', NULL, 0, NULL, NULL, '2021-07-07 06:12:33', '2021-07-07 06:12:33'),
(22, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', NULL, 0, NULL, NULL, '2021-07-07 06:13:50', '2021-07-07 06:13:50'),
(23, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', NULL, 0, NULL, NULL, '2021-07-07 06:14:06', '2021-07-07 06:14:06'),
(24, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', NULL, 0, NULL, NULL, '2021-07-07 06:16:23', '2021-07-07 06:16:23'),
(25, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', NULL, 0, NULL, NULL, '2021-07-07 06:16:54', '2021-07-07 06:16:54'),
(26, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', NULL, 0, NULL, NULL, '2021-07-07 06:17:02', '2021-07-07 06:17:02'),
(27, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', NULL, 0, NULL, NULL, '2021-07-07 06:19:38', '2021-07-07 06:19:38'),
(28, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', NULL, 0, NULL, NULL, '2021-07-07 06:22:58', '2021-07-07 06:22:58'),
(29, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', NULL, 0, NULL, NULL, '2021-07-07 06:23:07', '2021-07-07 06:23:07'),
(30, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', NULL, 0, NULL, NULL, '2021-07-07 06:23:40', '2021-07-07 06:23:40'),
(31, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', NULL, 0, NULL, NULL, '2021-07-07 06:24:53', '2021-07-07 06:24:53'),
(32, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', '1625659073.jpg', 0, NULL, '2021-07-07 06:28:27', '2021-07-07 06:27:53', '2021-07-07 06:28:27'),
(33, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', NULL, 0, NULL, NULL, '2021-07-07 06:34:26', '2021-07-07 06:34:26'),
(34, 1, 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'ASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdASDASDasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', NULL, 0, NULL, NULL, '2021-07-07 06:45:03', '2021-07-07 06:45:03');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `like_id` int(11) NOT NULL,
  `comment_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

CREATE TABLE `post_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `like_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1 COMMENT '1 = active / 0 = InActive',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `organization_id`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'dm', 'deepjyot2616@gmail.com', NULL, '$2y$10$7L.5qMUIAdKTCXPBXsa5WON6HGgPGnJJ18Ily/06f/rwz233RDsgi', 1, 1, NULL, '2021-07-07 04:27:59', '2021-07-07 04:27:59'),
(3, 'dm', 'malidinesh164@gmail.com', NULL, '$2y$10$7L.5qMUIAdKTCXPBXsa5WON6HGgPGnJJ18Ily/06f/rwz233RDsgi', 1, 1, NULL, '2021-07-07 04:27:59', '2021-07-07 04:27:59'),
(4, 'dm', 'malidinesh6856@gmail.com', NULL, '$2y$10$7L.5qMUIAdKTCXPBXsa5WON6HGgPGnJJ18Ily/06f/rwz233RDsgi', 1, 1, NULL, '2021-07-07 04:27:59', '2021-07-07 04:27:59'),
(5, 'asd', 'deepjyot2616123@gmail.com', NULL, '$2y$10$3T5w2W9.PzCFNTRUA0zjluFTP9TjLB/kZHnDNEDsFhgIBoCvAWj3i', 1, 1, NULL, '2021-07-07 06:26:19', '2021-07-07 06:26:19');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_likes_post_id_index` (`post_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `post_likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
