-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 23, 2020 at 06:42 PM
-- Server version: 5.7.31-0ubuntu0.18.04.1
-- PHP Version: 7.3.23-4+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bikroykari_backup`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL,
  `sub_category_id` int(11) UNSIGNED NOT NULL,
  `city_id` int(11) UNSIGNED NOT NULL,
  `city_area_id` int(11) UNSIGNED NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  `is_publish` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `user_id`, `title`, `description`, `price`, `category_id`, `sub_category_id`, `city_id`, `city_area_id`, `is_active`, `is_publish`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 44, '17', 'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum', '500.00', 5, 17, 17, 16, '0', '0', '2020-10-23 06:45:09', '2020-10-23 06:45:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `parent_id` int(11) UNSIGNED DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `title_bn` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  `image` varchar(250) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `title`, `title_bn`, `is_active`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, NULL, 'Mobile', 'মুঠোফোন', '1', 'HQdEr9orZp.1602836647.png', '2020-10-14 13:02:54', '2020-10-16 08:24:07', NULL),
(4, NULL, 'Property', 'সম্পত্তি', '1', 'Vt6B81Xuuo.1602836634.png', '2020-10-14 13:02:54', '2020-10-16 08:23:54', NULL),
(5, NULL, 'Vehical', 'যানবাহন', '1', 'aM4SE2IcJY.1602836618.png', '2020-10-14 13:02:59', '2020-10-16 08:23:38', NULL),
(6, NULL, 'Job', 'চাকরি', '1', 'eoH6VQoCDi.1602836542.png', '2020-10-14 13:02:59', '2020-10-16 08:22:22', NULL),
(15, 3, 'Mobile Phones', 'মোবাইল ফোন গুলো', '1', NULL, '2020-10-15 10:50:01', '2020-10-15 10:50:01', NULL),
(16, 3, 'Mobile Phones Accessories', 'মোবাইল ফোন এক্সেসরিজ', '1', NULL, '2020-10-15 10:51:03', '2020-10-15 10:51:03', NULL),
(17, 5, 'Car', 'গাড়ি', '1', NULL, '2020-10-15 10:51:52', '2020-10-15 10:51:52', NULL),
(18, 5, 'Motorbikes & Scooters', 'মোটরবাইক ও স্কুটার', '1', NULL, '2020-10-15 10:52:14', '2020-10-15 10:52:14', NULL),
(19, 5, 'Bicycles & Three Wheelers', 'বাইসাইকেল ও থ্রি হুইলার', '1', NULL, '2020-10-15 10:52:42', '2020-10-15 10:52:42', NULL),
(20, 5, 'Trucks, Vans & Buses', 'ট্রাক, ভ্যান ও বাস', '1', NULL, '2020-10-15 10:53:09', '2020-10-15 10:53:09', NULL),
(21, 5, 'Auto Parts & Accessories', 'অটো পার্টস এবং আনুষাঙ্গিক', '1', NULL, '2020-10-15 10:53:46', '2020-10-15 10:53:46', NULL),
(22, 3, 'Mobile Phone Services', 'মোবাইল ফোন পরিষেবা', '1', NULL, '2020-10-15 10:54:42', '2020-10-15 10:54:42', NULL),
(23, 4, 'Apartments & Flats', 'অ্যাপার্টমেন্ট ও ফ্ল্যাটস', '1', NULL, '2020-10-15 10:55:11', '2020-10-15 10:55:11', NULL),
(24, 4, 'New Developments', 'নতুন উন্নয়ন', '1', NULL, '2020-10-15 10:55:37', '2020-10-15 10:55:37', NULL),
(25, 4, 'Houses', 'বাড়িগুলি', '1', NULL, '2020-10-15 10:56:03', '2020-10-15 10:56:03', NULL),
(26, NULL, 'Electronic', 'বৈদ্যুতিক', '1', 'XVw9IaTXRW.1602836706.png', '2020-10-16 08:24:55', '2020-10-16 08:25:06', NULL),
(27, NULL, 'Medical', 'চিকিৎসা', '1', '1kr4XsJs69.1602836781.png', '2020-10-16 08:26:21', '2020-10-16 08:26:21', NULL),
(28, NULL, 'Fashion', 'ফ্যাশন', '1', 'v99AvPzdru.1602836800.png', '2020-10-16 08:26:40', '2020-10-16 08:26:40', NULL),
(29, NULL, 'Furniture', 'আসবাবপত্র', '1', 'lLS6MXfFBT.1602836832.png', '2020-10-16 08:27:12', '2020-10-16 08:27:12', NULL),
(30, NULL, 'Household', 'গৃহস্থালীর', '1', 'fCl2lrevwq.1602836855.png', '2020-10-16 08:27:35', '2020-10-16 08:27:35', NULL),
(31, NULL, 'Education', 'শিক্ষা', '1', 'z1LgiE0sHm.1602836886.png', '2020-10-16 08:28:06', '2020-10-16 08:28:06', NULL),
(32, NULL, 'Services', 'সেবা', '1', '0GlT4bwiAp.1602836922.png', '2020-10-16 08:28:42', '2020-10-16 08:28:42', NULL),
(33, NULL, 'Beauty', 'সৌন্দর্য', '1', 'BbNqSherpE.1602836963.png', '2020-10-16 08:29:23', '2020-10-16 08:29:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `title_bn` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` enum('city','division') NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `title`, `title_bn`, `type`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Dhaka', 'ঢাকা', 'city', '1', '2020-10-16 15:05:07', NULL, NULL),
(2, 'Chattogram', 'চট্টগ্রাম', 'city', '1', '2020-10-16 15:05:14', NULL, NULL),
(3, 'Sylhet', 'সিলেট', 'city', '1', '2020-10-16 15:05:14', NULL, NULL),
(4, 'Khulna', 'খুলনা', 'city', '1', '2020-10-16 15:05:14', NULL, NULL),
(5, 'Barishal', 'বরিশাল', 'city', '1', '2020-10-16 15:05:14', NULL, NULL),
(6, 'Rajshahi', 'রাজশাহী', 'city', '1', '2020-10-16 15:05:14', NULL, NULL),
(7, 'Rangpur', 'রংপুর', 'city', '1', '2020-10-16 15:05:14', NULL, NULL),
(8, 'Mymensingh\n', 'ময়মনসিংহ', 'city', '1', '2020-10-16 15:08:00', NULL, NULL),
(9, 'Dhaka Division', 'ঢাকা বিভাগ', 'division', '1', '2020-10-16 15:43:21', NULL, NULL),
(10, 'Chattogram Division\n', 'চট্টগ্রাম বিভাগ', 'division', '1', '2020-10-16 15:43:30', NULL, NULL),
(11, 'Sylhet Division\n', 'সিলেট বিভাগ', 'division', '1', '2020-10-16 15:43:30', NULL, NULL),
(12, 'Khulna Division', 'খুলনা বিভাগ', 'division', '1', '2020-10-16 15:43:30', NULL, NULL),
(13, 'Rajshahi Division', 'রাজশাহী বিভাগ', 'division', '1', '2020-10-16 15:43:30', NULL, NULL),
(14, 'Rangpur Division', 'রংপুর বিভাগ', 'division', '1', '2020-10-16 15:43:30', NULL, NULL),
(15, 'Barishal Division', 'বরিশাল বিভাগ', 'division', '1', '2020-10-16 15:43:30', NULL, NULL),
(16, 'Mymensingh Division', 'ময়মনসিংহ বিভাগ', 'division', '1', '2020-10-16 15:43:30', NULL, NULL),
(17, 'Indore', 'ইন্দোর', 'division', '1', '2020-10-16 10:50:10', '2020-10-23 05:14:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `city_areas`
--

CREATE TABLE `city_areas` (
  `id` int(11) UNSIGNED NOT NULL,
  `city_id` int(11) UNSIGNED DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `title_bn` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city_areas`
--

INSERT INTO `city_areas` (`id`, `city_id`, `title`, `title_bn`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(16, 17, 'Placiya', 'পলসিয়া', '1', '2020-10-19 10:47:10', '2020-10-23 05:14:49', NULL),
(17, 17, 'Rajwada', 'রাজওয়াদা', '1', '2020-10-19 10:48:47', '2020-10-23 05:15:34', NULL),
(18, 17, 'Pardeshipura', 'পরদেশীপুর', '1', '2020-10-19 11:25:35', '2020-10-23 05:16:19', NULL),
(19, 17, 'Bhawarkua', 'ভাবারকুয়া', '1', '2020-10-19 11:28:34', '2020-10-23 05:16:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(250) NOT NULL,
  `value` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `key`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'postman', 'https://www.getpostman.com/collections/82e7f1ea5d4528081902', '2020-10-16 19:00:35', NULL, NULL);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ibn_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `device_token` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `first_name`, `last_name`, `ibn_no`, `national_id`, `email`, `phone`, `address`, `is_active`, `device_token`, `profile_image`, `password`, `device_type`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', 'admin', NULL, NULL, NULL, NULL, 'admin@gmail.com', '9999999999', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', 'WJCC3GwlKTX5LX3PHj33N6oLpbUq5TD2ICVuzi5QtUnXAwjdCaqOb8lnuzmQ', '2020-10-13 18:30:00', '2020-10-14 01:29:07', NULL),
(2, '2', 'Mohammad Naim', NULL, NULL, NULL, NULL, 'mohammad.naim@malinator.com\n', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(17, '2', 'Afif Hossain', NULL, NULL, NULL, NULL, 'afif.hossain@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(18, '2', 'Abu Jayed', NULL, NULL, NULL, NULL, 'abu.jayed@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(19, '2', 'Ariful Haque	', NULL, NULL, NULL, NULL, 'ariful.haque@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(20, '2', 'Fazle Mahmud', NULL, NULL, NULL, NULL, 'fazle.mahmud@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(21, '2', '	Nazmul Islam', NULL, NULL, NULL, NULL, '	nazmul.islam@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(22, '2', 'Abu Hider', NULL, NULL, NULL, NULL, 'abu.hider@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(23, '2', 'Mohammad Saifuddin', NULL, NULL, NULL, NULL, 'mohammad.saifuddin@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(24, '2', 'Sunzamul Islam', NULL, NULL, NULL, NULL, 'sunzamul.islam@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(25, '2', 'Mehidy Hasan', NULL, NULL, NULL, NULL, 'mehidy.hasan@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(26, '2', 'Tanbir Hayder', NULL, NULL, NULL, NULL, 'tanbir.hayder@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(27, '2', 'Subashis Roy', NULL, NULL, NULL, NULL, 'subashis.roy@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(28, '2', 'Nurul Hasan	', NULL, NULL, NULL, NULL, 'nurul.hasan@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(29, '2', '	Mosaddek Hossain', NULL, NULL, NULL, NULL, 'mosaddek. hossain@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, '2020-10-14 01:57:22', NULL),
(30, '2', 'Mustafizur Rahman', NULL, NULL, NULL, NULL, 'mustafizur.rahman@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(31, '2', 'Liton Das	', NULL, NULL, NULL, NULL, 'liton.das@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(32, '2', 'Taijul Islam', NULL, NULL, NULL, NULL, 'taijul.islam@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(33, '2', 'Soumya Sarkar	', NULL, NULL, NULL, NULL, 'soumya.sarkar@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(34, '2', 'Jubair Hossain', NULL, NULL, NULL, NULL, 'jubair.hossain@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(35, '2', 'Sabbir Rahman', NULL, NULL, NULL, NULL, 'sabbir.rahman@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(36, '2', 'Taskin Ahmed', NULL, NULL, NULL, NULL, 'taskin.ahmed@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(37, '2', 'Sabbir Rahman	', NULL, NULL, NULL, NULL, 'sabbir.rahman@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(38, '2', 'Taskin Ahmed', NULL, NULL, NULL, NULL, 'taskin.ahmed@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(39, '2', 'Mohammad Mithun', NULL, NULL, NULL, NULL, 'mohammad.mithun@malinator.com', '9632587412', NULL, '1', NULL, 'rdogi3iMgP.1602658747.jpeg', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', '0', NULL, NULL, NULL, NULL),
(40, '2', 'Shivam Yadav', NULL, NULL, NULL, NULL, 'shivamyadav@gmail.com', '7974682508', NULL, '1', NULL, NULL, '$2y$10$KRCon7v0HD8gjyKPK..Cku73O18JYNohh8BVmlFN8MXiCDJ9zrHga', '0', NULL, '2020-10-16 07:46:57', '2020-10-16 07:46:57', NULL),
(41, '2', 'Shivam Yadav', NULL, NULL, NULL, NULL, 'shivam@gmail.com', '8959070299', NULL, '1', NULL, NULL, '$2y$10$3ALEELfXDg3fmo/krS0gcOLFL4gJEi0w8NKfhmtc9rZz8./2qKZ8u', '0', NULL, '2020-10-16 07:47:42', '2020-10-16 07:47:42', NULL),
(42, '2', 'Shivam Yadav', NULL, NULL, NULL, NULL, 'rakesh@gmail.com', '9632587410', NULL, '1', NULL, NULL, '$2y$10$M5v/mMNu0ZaApXPSxFIKT.GdZADw20V34StjAP3W5SUKtKJjxDzgO', '0', NULL, '2020-10-16 07:48:48', '2020-10-16 07:48:48', NULL),
(43, '2', 'Santosh Yadav', 'Santosh', 'Yadav', NULL, NULL, 'santosh.yadav@gmail.com', '9926442334', NULL, '1', NULL, NULL, '$2y$10$tUEu/V3pq29axnnhB43YYOsu3oIjmuHDjf6JF/eG/X6prx4tlG47a', '0', NULL, '2020-10-16 07:49:20', '2020-10-16 07:54:02', NULL),
(44, '2', 'shivam yadav', NULL, NULL, NULL, NULL, 'shivam.codemegsoft@gmail.com', '79746825081', 'Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016', '1', NULL, 'lxfV8TADT8.1603448750.png', '$2y$10$gugML7CVB5N/Sp57htZMAuZ4UET9uahoiNrpmEgv/G3d1YaiKFT..', '0', NULL, '2020-10-21 04:10:44', '2020-10-23 06:35:49', NULL),
(45, '2', 'Aakash Tirole', NULL, NULL, NULL, NULL, 'akash.tirole@gmail.com', NULL, NULL, '1', NULL, NULL, '$2y$10$zEv8USOmOieaQf.DSpmR..KoavfgsVZvcCaAPnfP.w/971Qv/FSUy', '0', NULL, '2020-10-21 04:11:44', '2020-10-21 04:11:44', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city_areas`
--
ALTER TABLE `city_areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `city_areas`
--
ALTER TABLE `city_areas`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `city_areas`
--
ALTER TABLE `city_areas`
  ADD CONSTRAINT `city_areas_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
