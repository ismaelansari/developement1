-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 23, 2020 at 06:47 PM
-- Server version: 5.7.31-0ubuntu0.18.04.1
-- PHP Version: 7.3.23-4+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `serviceapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertising`
--

CREATE TABLE `advertising` (
  `id` int(10) UNSIGNED NOT NULL,
  `integration` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'unitSlot or autoFit',
  `is_responsive` tinyint(1) UNSIGNED DEFAULT '0',
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'top, bottom or auto',
  `provider_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Translated in the languages files',
  `tracking_code_large` text COLLATE utf8_unicode_ci,
  `tracking_code_medium` text COLLATE utf8_unicode_ci,
  `tracking_code_small` text COLLATE utf8_unicode_ci,
  `active` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `advertising`
--

INSERT INTO `advertising` (`id`, `integration`, `is_responsive`, `slug`, `provider_name`, `description`, `tracking_code_large`, `tracking_code_medium`, `tracking_code_small`, `active`) VALUES
(1, 'unitSlot', 0, 'top', 'Google AdSense', 'advertising_unitSlot_hint', '', '', '', 1),
(2, 'unitSlot', 0, 'bottom', 'Google AdSense', 'advertising_unitSlot_hint', '', '', '', 0),
(3, 'autoFit', 1, 'auto', 'Google AdSense', 'advertising_autoFit_hint', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `blacklist`
--

CREATE TABLE `blacklist` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('domain','email','ip','word') COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` mediumtext COLLATE utf8_unicode_ci,
  `expiration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT '0',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_class` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('classified','job-offer','job-search','not-salable') COLLATE utf8_unicode_ci DEFAULT 'classified' COMMENT 'Only select this for parent categories',
  `is_for_permanent` tinyint(1) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `translation_lang`, `translation_of`, `parent_id`, `name`, `slug`, `description`, `picture`, `icon_class`, `lft`, `rgt`, `depth`, `type`, `is_for_permanent`, `active`) VALUES
(1, 'en', 1, 0, 'سيارات', 'سيارات', NULL, 'app/categories/skin-green/fa-car.png', NULL, 5280, 5337, 0, 'classified', 0, 1),
(2, 'en', 2, 1, 'Auto Parts, Accessories', 'auto-parts-accessories', NULL, NULL, NULL, 4071, 4072, 1, 'classified', 0, 1),
(3, 'en', 3, 1, 'Car, Motorcycle Rental', 'car-motorcycle-rental', NULL, NULL, NULL, 4073, 4074, 1, 'classified', 0, 1),
(4, 'en', 4, 1, 'Caravan and Boating', 'caravan-and-boating', NULL, NULL, NULL, 4075, 4076, 1, 'classified', 0, 1),
(5, 'en', 5, 1, 'Motorcycle parts, Accessories', 'motorcycle-parts-accessories', NULL, NULL, NULL, 4077, 4078, 1, 'classified', 0, 1),
(6, 'en', 6, 1, 'Motorcycles, Scooters, Quads', 'motorcycles-scooters-quads', NULL, NULL, NULL, 4079, 4080, 1, 'classified', 0, 1),
(7, 'en', 7, 1, 'Used Cars - New Cars', 'used-cars-new-cars', NULL, NULL, NULL, 4081, 4082, 1, 'classified', 0, 1),
(8, 'en', 8, 1, 'Utility Vehicles, Machinery', 'utility-vehicles-machinery', NULL, NULL, NULL, 4083, 4084, 1, 'classified', 0, 1),
(9, 'en', 9, 0, 'Real estate', 'real-estate', NULL, 'app/categories/skin-green/fa-home.png', 'icon-home', 4128, 4217, 0, 'classified', 0, 1),
(10, 'en', 10, 9, 'Commercial Property - Offices - Premises', 'commercial-property-offices-premises', NULL, NULL, NULL, 4129, 4130, 1, 'classified', 0, 1),
(11, 'en', 11, 9, 'I\'m looking for', 'im-looking-for', NULL, NULL, NULL, 4131, 4132, 1, 'classified', 0, 1),
(12, 'en', 12, 9, 'Roomates', 'roomates', NULL, NULL, NULL, 4133, 4134, 1, 'classified', 0, 1),
(13, 'en', 13, 9, 'Accommodation and Hotels', 'accommodation-and-hotels', NULL, NULL, NULL, 4135, 4136, 1, 'classified', 0, 1),
(14, 'en', 14, 9, 'Vacation Rental', 'vacation-rental', NULL, NULL, NULL, 4137, 4138, 1, 'classified', 0, 1),
(15, 'en', 15, 9, 'Garage, Parking, Farms', 'garage-parking-farms', NULL, NULL, NULL, 4139, 4140, 1, 'classified', 0, 1),
(16, 'en', 16, 9, 'Real Estate Services', 'real-estate-services', NULL, NULL, NULL, 4141, 4142, 1, 'classified', 0, 1),
(17, 'en', 17, 9, 'Rooms - Studio for Rent', 'rooms-studio-for-rent', NULL, NULL, NULL, 4143, 4144, 1, 'classified', 0, 1),
(18, 'en', 18, 9, 'Land for Sale, Rent', 'land-for-sale-rent', NULL, NULL, NULL, 4145, 4146, 1, 'classified', 0, 1),
(19, 'en', 19, 9, 'Property for sale', 'property-for-sale', NULL, NULL, NULL, 4147, 4148, 1, 'classified', 0, 1),
(20, 'en', 20, 9, 'Rentals', 'rentals', NULL, NULL, NULL, 4149, 4150, 1, 'classified', 0, 1),
(21, 'en', 21, 0, 'Services', 'services', NULL, 'app/categories/skin-green/ion-clipboard.png', 'fa fa-briefcase', 4218, 4355, 0, 'classified', 0, 1),
(22, 'en', 22, 21, 'Other services', 'other-services', NULL, NULL, NULL, 4219, 4220, 1, 'classified', 0, 1),
(23, 'en', 23, 21, 'Casting, Model, Photographer', 'casting-model-photographer', NULL, NULL, NULL, 4221, 4222, 1, 'classified', 0, 1),
(24, 'en', 24, 21, 'Carpooling', 'carpooling', NULL, NULL, NULL, 4223, 4224, 1, 'classified', 0, 1),
(25, 'en', 25, 21, 'Moving, Furniture Guard', 'moving-furniture-guard', NULL, NULL, NULL, 4225, 4226, 1, 'classified', 0, 1),
(26, 'en', 26, 21, 'Destocking - Commercial', 'destocking-commercial', NULL, NULL, NULL, 4227, 4228, 1, 'classified', 0, 1),
(27, 'en', 27, 21, 'Industrial Equipment', 'industrial-equipment', NULL, NULL, NULL, 4229, 4230, 1, 'classified', 0, 1),
(28, 'en', 28, 21, 'Aesthetics, Hairstyling', 'aesthetics-hairstyling', NULL, NULL, NULL, 4231, 4232, 1, 'classified', 0, 1),
(29, 'en', 29, 21, 'Horoscope - Tarot - Healers - Spell', 'horoscope-tarot-healers-spell', NULL, NULL, NULL, 4233, 4234, 1, 'classified', 0, 1),
(30, 'en', 30, 21, 'Materials and Equipment Pro', 'materials-and-equipment-pro', NULL, NULL, NULL, 4235, 4236, 1, 'classified', 0, 1),
(31, 'en', 31, 21, 'Event Organization Services', 'event-organization-services', NULL, NULL, NULL, 4237, 4238, 1, 'classified', 0, 1),
(32, 'en', 32, 21, 'Service Provision', 'service-provision', NULL, NULL, NULL, 4239, 4240, 1, 'classified', 0, 1),
(33, 'en', 33, 21, 'Health, Beauty', 'health-beauty', NULL, NULL, NULL, 4241, 4242, 1, 'classified', 0, 1),
(34, 'en', 34, 21, 'Artisan, Troubleshooting, Handyman', 'artisan-troubleshooting-handyman', NULL, NULL, NULL, 4243, 4244, 1, 'classified', 0, 1),
(35, 'en', 35, 21, 'Computing Services', 'computing-services', NULL, NULL, NULL, 4245, 4246, 1, 'classified', 0, 1),
(36, 'en', 36, 21, 'Tourism and Travel Services', 'tourism-and-travel-services', NULL, NULL, NULL, 4247, 4248, 1, 'classified', 0, 1),
(37, 'en', 37, 21, 'Translation, Writing', 'translation-writing', NULL, NULL, NULL, 4249, 4250, 1, 'classified', 0, 1),
(38, 'en', 38, 21, 'Construction - Renovation - Carpentry', 'construction-renovation-carpentry', NULL, NULL, NULL, 4251, 4252, 1, 'classified', 0, 1),
(39, 'en', 39, 0, 'Community', 'community', NULL, 'app/categories/skin-green/fa-users.png', 'icon-theatre', 4356, 4413, 0, 'classified', 0, 1),
(40, 'en', 40, 39, 'Sporting goods, Exercise', 'sporting-goods-exercise', NULL, NULL, NULL, 4357, 4358, 1, 'classified', 0, 1),
(41, 'en', 41, 39, 'Artists, Musicians', 'artists-musicians', NULL, NULL, NULL, 4359, 4360, 1, 'classified', 0, 1),
(42, 'en', 42, 39, 'Associations, Voluntary', 'associations-voluntary', NULL, NULL, NULL, 4361, 4362, 1, 'classified', 0, 1),
(43, 'en', 43, 39, 'Friendships for Events', 'friendships-for-events', NULL, NULL, NULL, 4363, 4364, 1, 'classified', 0, 1),
(44, 'en', 44, 39, 'My neighborhood', 'my-neighborhood', NULL, NULL, NULL, 4365, 4366, 1, 'classified', 0, 1),
(45, 'en', 45, 39, 'Nightlife, Restaurant & Bar', 'nightlife-restaurant-bar', NULL, NULL, NULL, 4367, 4368, 1, 'classified', 0, 1),
(46, 'en', 46, 39, 'Outings, Entertainment', 'outings-entertainment', NULL, NULL, NULL, 4369, 4370, 1, 'classified', 0, 1),
(47, 'en', 47, 0, 'Multimedia', 'multimedia', NULL, 'app/categories/skin-green/fa-laptop.png', 'icon-laptop', 4414, 4503, 0, 'classified', 0, 1),
(48, 'en', 48, 47, 'Multimedia & Phones Accessories', 'multimedia-phones-accessories', NULL, NULL, NULL, 4415, 4416, 1, 'classified', 0, 1),
(49, 'en', 49, 47, 'CD/DVD - Books - Movies', 'cddvd-books-movies', NULL, NULL, NULL, 4417, 4418, 1, 'classified', 0, 1),
(50, 'en', 50, 47, 'Consoles - Video Games', 'consoles-video-games', NULL, NULL, NULL, 4419, 4420, 1, 'classified', 0, 1),
(51, 'en', 51, 47, 'Computers - PC - Office Supplies', 'computers-pc-office-supplies', NULL, NULL, NULL, 4421, 4422, 1, 'classified', 0, 1),
(52, 'en', 52, 47, 'Wanted', 'wanted', NULL, NULL, NULL, 4423, 4424, 1, 'classified', 0, 1),
(53, 'en', 53, 47, 'Tablets - Touchscreens', 'tablets-touchscreens', NULL, NULL, NULL, 4425, 4426, 1, 'classified', 0, 1),
(54, 'en', 54, 47, 'Mobiles phones - Smartphones', 'mobiles-phones-smartphones', NULL, NULL, NULL, 4427, 4428, 1, 'classified', 0, 1),
(55, 'en', 55, 47, 'TV - Images - Sound', 'tv-images-sound', NULL, NULL, NULL, 4429, 4430, 1, 'classified', 0, 1),
(56, 'en', 56, 47, 'Clearance - Commercial', 'clearance-commercial', NULL, NULL, NULL, 4431, 4432, 1, 'classified', 0, 1),
(57, 'en', 57, 47, 'Industrial Equipment', 'industrial-equipment', NULL, NULL, NULL, 4433, 4434, 1, 'classified', 0, 1),
(58, 'en', 58, 47, 'Materials & Professional equipment', 'materials-professional-equipment', NULL, NULL, NULL, 4435, 4436, 1, 'classified', 0, 1),
(59, 'en', 59, 0, 'Fashion, Home & Garden', 'fashion-home-garden', NULL, 'app/categories/skin-green/fa-home.png', 'icon-basket-1', 4504, 4601, 0, 'classified', 0, 1),
(60, 'en', 60, 59, 'Furniture - Tableware', 'furniture-tableware', NULL, NULL, NULL, 4505, 4506, 1, 'classified', 0, 1),
(61, 'en', 61, 59, 'Antiques - Art - Decoration', 'antiques-art-decoration', NULL, NULL, NULL, 4507, 4508, 1, 'classified', 0, 1),
(62, 'en', 62, 59, 'Appliances', 'appliances', NULL, NULL, NULL, 4509, 4510, 1, 'classified', 0, 1),
(63, 'en', 63, 59, 'Jewelry - Watches - Luggage', 'jewelry-watches-luggage', NULL, NULL, NULL, 4511, 4512, 1, 'classified', 0, 1),
(64, 'en', 64, 59, 'DIY - Gardening', 'diy-gardening', NULL, NULL, NULL, 4513, 4514, 1, 'classified', 0, 1),
(65, 'en', 65, 59, 'Various flea markets', 'various-flea-markets', NULL, NULL, NULL, 4515, 4516, 1, 'classified', 0, 1),
(66, 'en', 66, 59, 'Shoes', 'shoes', NULL, NULL, NULL, 4517, 4518, 1, 'classified', 0, 1),
(67, 'en', 67, 59, 'Toys - Games - Figurines', 'toys-games-figurines', NULL, NULL, NULL, 4519, 4520, 1, 'classified', 0, 1),
(68, 'en', 68, 59, 'Clothing, Fashion & Accessories', 'clothing-fashion-accessories', NULL, NULL, NULL, 4521, 4522, 1, 'classified', 0, 1),
(69, 'en', 69, 59, 'Stuffs for Baby and Child', 'stuffs-for-baby-and-child', NULL, NULL, NULL, 4523, 4524, 1, 'classified', 0, 1),
(70, 'en', 70, 59, 'Stuffs for Beauty and Health', 'stuffs-for-beauty-and-health', NULL, NULL, NULL, 4525, 4526, 1, 'classified', 0, 1),
(71, 'en', 71, 59, 'Wine & Gourmet - Recipes', 'wine-gourmet-recipes', NULL, NULL, NULL, 4527, 4528, 1, 'classified', 0, 1),
(72, 'en', 72, 0, 'Pets & Mascots', 'pets-mascots', NULL, 'app/categories/skin-green/map-icon-pet-store.png', 'icon-guidedog', 4602, 4619, 0, 'classified', 0, 1),
(73, 'en', 73, 72, 'Accessories - Other Pets services', 'accessories-other-pets-services', NULL, NULL, NULL, 4603, 4604, 1, 'classified', 0, 1),
(74, 'en', 74, 72, 'Sales, Adoptions, Lost', 'sales-adoptions-lost', NULL, NULL, NULL, 4605, 4606, 1, 'classified', 0, 1),
(75, 'en', 75, 0, 'Free Dating', 'free-dating', NULL, 'app/categories/skin-green/ion-ios-heart.png', 'icon-heart', 4620, 4693, 0, 'not-salable', 0, 1),
(76, 'en', 76, 75, 'Friendship - Friends', 'friendship-friends', NULL, NULL, NULL, 4621, 4622, 1, 'not-salable', 0, 1),
(77, 'en', 77, 75, 'Escorts - Adult Services', 'escorts-adult-services', NULL, NULL, NULL, 4623, 4624, 1, 'not-salable', 0, 1),
(78, 'en', 78, 75, 'Women Seeking Women', 'women-seeking-women', NULL, NULL, NULL, 4625, 4626, 1, 'not-salable', 0, 1),
(79, 'en', 79, 75, 'Women Seeking Men', 'women-seeking-men', NULL, NULL, NULL, 4627, 4628, 1, 'not-salable', 0, 1),
(80, 'en', 80, 75, 'Men Seeking Women', 'men-seeking-women', NULL, NULL, NULL, 4629, 4630, 1, 'not-salable', 0, 1),
(81, 'en', 81, 75, 'Men Seeking Men', 'men-seeking-men', NULL, NULL, NULL, 4631, 4632, 1, 'not-salable', 0, 1),
(82, 'en', 82, 75, 'Massage Services - Relaxation', 'massage-services-relaxation', NULL, NULL, NULL, 4633, 4634, 1, 'not-salable', 0, 1),
(83, 'en', 83, 75, 'Adults Products - Articles', 'adults-products-articles', NULL, NULL, NULL, 4635, 4636, 1, 'not-salable', 0, 1),
(84, 'en', 84, 75, 'Casual Encounter', 'casual-encounter', NULL, NULL, NULL, 4637, 4638, 1, 'not-salable', 0, 1),
(85, 'en', 85, 0, 'Jobs Offers', 'jobs-offers', NULL, 'app/categories/skin-green/mfglabs-users.png', 'icon-megaphone-1', 4694, 4879, 0, 'job-offer', 0, 1),
(86, 'en', 86, 85, 'Agriculture - Environment', 'agriculture-environment', NULL, NULL, NULL, 4695, 4696, 1, 'classified', 0, 1),
(87, 'en', 87, 85, 'Assistantship - Secretariat - Helpdesk', 'assistantship-secretariat-helpdesk', NULL, NULL, NULL, 4697, 4698, 1, 'classified', 0, 1),
(88, 'en', 88, 85, 'Automotive - Mechanic', 'automotive-mechanic', NULL, NULL, NULL, 4699, 4700, 1, 'classified', 0, 1),
(89, 'en', 89, 85, 'Others Jobs Offer', 'others-jobs-offer', NULL, NULL, NULL, 4701, 4702, 1, 'classified', 0, 1),
(90, 'en', 90, 85, 'BTP - Construction - Building', 'btp-construction-building', NULL, NULL, NULL, 4703, 4704, 1, 'classified', 0, 1),
(91, 'en', 91, 85, 'Trade - Business Services', 'trade-business-services', NULL, NULL, NULL, 4705, 4706, 1, 'classified', 0, 1),
(92, 'en', 92, 85, 'Commercial - Sale Jobs Offer', 'commercial-sale-jobs-offer', NULL, NULL, NULL, 4707, 4708, 1, 'classified', 0, 1),
(93, 'en', 93, 85, 'Accounting - Management - Finance', 'accounting-management-finance', NULL, NULL, NULL, 4709, 4710, 1, 'classified', 0, 1),
(94, 'en', 94, 85, 'Steering - Manager', 'steering-manager', NULL, NULL, NULL, 4711, 4712, 1, 'classified', 0, 1),
(95, 'en', 95, 85, 'Aesthetics - Hair - Beauty', 'aesthetics-hair-beauty', NULL, NULL, NULL, 4713, 4714, 1, 'classified', 0, 1),
(96, 'en', 96, 85, 'Public Service Jobs Offer', 'public-service-jobs-offer', NULL, NULL, NULL, 4715, 4716, 1, 'classified', 0, 1),
(97, 'en', 97, 85, 'Real Estate Jobs Offer', 'real-estate-jobs-offer', NULL, NULL, NULL, 4717, 4718, 1, 'classified', 0, 1),
(98, 'en', 98, 85, 'Independent - Freelance - Telecommuting', 'independent-freelance-telecommuting', NULL, NULL, NULL, 4719, 4720, 1, 'classified', 0, 1),
(99, 'en', 99, 85, 'Computers - Internet - Telecommunications', 'computers-internet-telecommunications', NULL, NULL, NULL, 4721, 4722, 1, 'classified', 0, 1),
(100, 'en', 100, 85, 'Industry, Production & engineering', 'industry-production-engineering', NULL, NULL, NULL, 4723, 4724, 1, 'classified', 0, 1),
(101, 'en', 101, 85, 'Marketing - Communication', 'marketing-communication', NULL, NULL, NULL, 4725, 4726, 1, 'classified', 0, 1),
(102, 'en', 102, 85, 'Babysitting - Nanny Work', 'babysitting-nanny-work', NULL, NULL, NULL, 4727, 4728, 1, 'classified', 0, 1),
(103, 'en', 103, 85, 'HR - Training - Education', 'hr-training-education', NULL, NULL, NULL, 4729, 4730, 1, 'classified', 0, 1),
(104, 'en', 104, 85, 'Medical - Healthcare - Social', 'medical-healthcare-social', NULL, NULL, NULL, 4731, 4732, 1, 'classified', 0, 1),
(105, 'en', 105, 85, 'Security - Guarding', 'security-guarding', NULL, NULL, NULL, 4733, 4734, 1, 'classified', 0, 1),
(106, 'en', 106, 85, 'Household Services - Housekeeping', 'household-services-housekeeping', NULL, NULL, NULL, 4735, 4736, 1, 'classified', 0, 1),
(107, 'en', 107, 85, 'Tourism - Hotels - Restaurants - Leisure', 'tourism-hotels-restaurants-leisure', NULL, NULL, NULL, 4737, 4738, 1, 'classified', 0, 1),
(108, 'en', 108, 85, 'Transportation - Logistics', 'transportation-logistics', NULL, NULL, NULL, 4739, 4740, 1, 'classified', 0, 1),
(109, 'en', 109, 0, 'Job Search', 'job-search', NULL, 'app/categories/skin-green/fa-search.png', 'icon-search', 4880, 5065, 0, 'job-search', 0, 1),
(110, 'en', 110, 109, 'Agriculture - Environment', 'agriculture-environment', NULL, NULL, NULL, 4881, 4882, 1, 'job-search', 0, 1),
(111, 'en', 111, 109, 'Assistantship - Secretariat - Helpdesk', 'assistantship-secretariat-helpdesk', NULL, NULL, NULL, 4883, 4884, 1, 'job-search', 0, 1),
(112, 'en', 112, 109, 'Automotive - Mechanic', 'automotive-mechanic', NULL, NULL, NULL, 4885, 4886, 1, 'job-search', 0, 1),
(113, 'en', 113, 109, 'Others Jobs Search', 'others-jobs-search', NULL, NULL, NULL, 4887, 4888, 1, 'job-search', 0, 1),
(114, 'en', 114, 109, 'BTP - Construction - Building', 'btp-construction-building', NULL, NULL, NULL, 4889, 4890, 1, 'job-search', 0, 1),
(115, 'en', 115, 109, 'Trade - Business Services', 'trade-business-services', NULL, NULL, NULL, 4891, 4892, 1, 'job-search', 0, 1),
(116, 'en', 116, 109, 'Commercial - Sale Jobs Search', 'commercial-sale-jobs-search', NULL, NULL, NULL, 4893, 4894, 1, 'job-search', 0, 1),
(117, 'en', 117, 109, 'Accounting - Management - Finance', 'accounting-management-finance', NULL, NULL, NULL, 4895, 4896, 1, 'job-search', 0, 1),
(118, 'en', 118, 109, 'Steering - Manager', 'steering-manager', NULL, NULL, NULL, 4897, 4898, 1, 'job-search', 0, 1),
(119, 'en', 119, 109, 'Aesthetics - Hair - Beauty', 'aesthetics-hair-beauty', NULL, NULL, NULL, 4899, 4900, 1, 'job-search', 0, 1),
(120, 'en', 120, 109, 'Public Service Jobs Search', 'public-service-jobs-search', NULL, NULL, NULL, 4901, 4902, 1, 'job-search', 0, 1),
(121, 'en', 121, 109, 'Real Estate Jobs Search', 'real-estate-jobs-search', NULL, NULL, NULL, 4903, 4904, 1, 'job-search', 0, 1),
(122, 'en', 122, 109, 'Independent - Freelance - Telecommuting', 'independent-freelance-telecommuting', NULL, NULL, NULL, 4905, 4906, 1, 'job-search', 0, 1),
(123, 'en', 123, 109, 'Computers - Internet - Telecommunications', 'computers-internet-telecommunications', NULL, NULL, NULL, 4907, 4908, 1, 'job-search', 0, 1),
(124, 'en', 124, 109, 'Industry, Production & engineering', 'industry-production-engineering', NULL, NULL, NULL, 4909, 4910, 1, 'job-search', 0, 1),
(125, 'en', 125, 109, 'Marketing - Communication', 'marketing-communication', NULL, NULL, NULL, 4911, 4912, 1, 'job-search', 0, 1),
(126, 'en', 126, 109, 'Babysitting - Nanny Work', 'babysitting-nanny-work', NULL, NULL, NULL, 4913, 4914, 1, 'job-search', 0, 1),
(127, 'en', 127, 109, 'HR - Training - Education', 'hr-training-education', NULL, NULL, NULL, 4915, 4916, 1, 'job-search', 0, 1),
(128, 'en', 128, 109, 'Medical - Healthcare - Social', 'medical-healthcare-social', NULL, NULL, NULL, 4917, 4918, 1, 'job-search', 0, 1),
(129, 'en', 129, 109, 'Security - Guarding', 'security-guarding', NULL, NULL, NULL, 4919, 4920, 1, 'job-search', 0, 1),
(130, 'en', 130, 109, 'Household Services - Housekeeping', 'household-services-housekeeping', NULL, NULL, NULL, 4921, 4922, 1, 'job-search', 0, 1),
(131, 'en', 131, 109, 'Tourism - Hotels - Restaurants - Leisure', 'tourism-hotels-restaurants-leisure', NULL, NULL, NULL, 4923, 4924, 1, 'job-search', 0, 1),
(132, 'en', 132, 109, 'Transportation - Logistics', 'transportation-logistics', NULL, NULL, NULL, 4925, 4926, 1, 'job-search', 0, 1),
(133, 'en', 133, 0, 'Learning', 'learning', NULL, 'app/categories/skin-green/fa-graduation-cap.png', 'icon-book-open', 5066, 5123, 0, 'classified', 0, 1),
(134, 'en', 134, 133, 'Language Classes', 'language-classes', NULL, NULL, NULL, 5067, 5068, 1, 'classified', 0, 1),
(135, 'en', 135, 133, 'Computer Courses', 'computer-courses', NULL, NULL, NULL, 5069, 5070, 1, 'classified', 0, 1),
(136, 'en', 136, 133, 'Tutoring, Private Lessons', 'tutoring-private-lessons', NULL, NULL, NULL, 5071, 5072, 1, 'classified', 0, 1),
(137, 'en', 137, 133, 'Vocational Training', 'vocational-training', NULL, NULL, NULL, 5073, 5074, 1, 'classified', 0, 1),
(138, 'en', 138, 133, 'Maths, Physics, Chemistry', 'maths-physics-chemistry', NULL, NULL, NULL, 5075, 5076, 1, 'classified', 0, 1),
(139, 'en', 139, 133, 'Music, Theatre, Dance', 'music-theatre-dance', NULL, NULL, NULL, 5077, 5078, 1, 'classified', 0, 1),
(140, 'en', 140, 133, 'School support', 'school-support', NULL, NULL, NULL, 5079, 5080, 1, 'classified', 0, 1),
(141, 'en', 141, 0, 'Local Events', 'local-events', NULL, 'app/categories/skin-green/fa-calendar.png', 'icon-megaphone-1', 5124, 5221, 0, 'classified', 0, 1),
(142, 'en', 142, 141, 'Concerts & Festivals', 'concerts-festivals', NULL, NULL, NULL, 5125, 5126, 1, 'classified', 0, 1),
(143, 'en', 143, 141, 'Networking & Meetups', 'networking-meetups', NULL, NULL, NULL, 5127, 5128, 1, 'classified', 0, 1),
(144, 'en', 144, 141, 'Sports & Outdoors', 'sports-outdoors', NULL, NULL, NULL, 5129, 5130, 1, 'classified', 0, 1),
(145, 'en', 145, 141, 'Trade Shows & Conventions', 'trade-shows-conventions', NULL, NULL, NULL, 5131, 5132, 1, 'classified', 0, 1),
(146, 'en', 146, 141, 'Training & Seminars', 'training-seminars', NULL, NULL, NULL, 5133, 5134, 1, 'classified', 0, 1),
(147, 'en', 147, 141, 'Ceremonies', 'ceremonies', NULL, NULL, NULL, 5135, 5136, 1, 'classified', 0, 1),
(148, 'en', 148, 141, 'Conferences', 'conferences', NULL, NULL, NULL, 5137, 5138, 1, 'classified', 0, 1),
(149, 'en', 149, 141, 'Weddings', 'weddings', NULL, NULL, NULL, 5139, 5140, 1, 'classified', 0, 1),
(150, 'en', 150, 141, 'Birthdays', 'birthdays', NULL, NULL, NULL, 5141, 5142, 1, 'classified', 0, 1),
(151, 'en', 151, 141, 'Family Events', 'family-events', NULL, NULL, NULL, 5143, 5144, 1, 'classified', 0, 1),
(152, 'en', 152, 141, 'Nightlife', 'nightlife', NULL, NULL, NULL, 5145, 5146, 1, 'classified', 0, 1),
(153, 'en', 153, 141, 'All others events', 'all-others-events', NULL, NULL, NULL, 5147, 5148, 1, 'classified', 0, 1),
(307, 'ar', 1, 0, 'Automobiles', 'automobiles-ar', NULL, 'app/categories/skin-green/fa-car.png', NULL, 3257, 3314, 0, 'classified', 0, 1),
(308, 'ar', 2, 1, 'Auto Parts, Accessories', 'auto-parts-accessories-ar', NULL, NULL, NULL, 2062, 2063, 1, 'classified', 0, 1),
(309, 'ar', 3, 1, 'Car, Motorcycle Rental', 'car-motorcycle-rental-ar', NULL, NULL, NULL, 2064, 2065, 1, 'classified', 0, 1),
(310, 'ar', 4, 1, 'Caravan and Boating', 'caravan-and-boating-ar', NULL, NULL, NULL, 2066, 2067, 1, 'classified', 0, 1),
(311, 'ar', 5, 1, 'Motorcycle parts, Accessories', 'motorcycle-parts-accessories-ar', NULL, NULL, NULL, 2068, 2069, 1, 'classified', 0, 1),
(312, 'ar', 6, 1, 'Motorcycles, Scooters, Quads', 'motorcycles-scooters-quads-ar', NULL, NULL, NULL, 2070, 2071, 1, 'classified', 0, 1),
(313, 'ar', 7, 1, 'Used Cars - New Cars', 'used-cars-new-cars-ar', NULL, NULL, NULL, 2072, 2073, 1, 'classified', 0, 1),
(314, 'ar', 8, 1, 'Utility Vehicles, Machinery', 'utility-vehicles-machinery-ar', NULL, NULL, NULL, 2074, 2075, 1, 'classified', 0, 1),
(315, 'ar', 9, 0, 'Real estate', 'real-estate-ar', NULL, 'app/categories/skin-green/fa-home.png', 'icon-home', 2105, 2194, 0, 'classified', 0, 1),
(316, 'ar', 10, 9, 'Commercial Property - Offices - Premises', 'commercial-property-offices-premises-ar', NULL, NULL, NULL, 2128, 2129, 1, 'classified', 0, 1),
(317, 'ar', 11, 9, 'I\'m looking for', 'im-looking-for-ar', NULL, NULL, NULL, 2130, 2131, 1, 'classified', 0, 1),
(318, 'ar', 12, 9, 'Roomates', 'roomates-ar', NULL, NULL, NULL, 2132, 2133, 1, 'classified', 0, 1),
(319, 'ar', 13, 9, 'Accommodation and Hotels', 'accommodation-and-hotels-ar', NULL, NULL, NULL, 2134, 2135, 1, 'classified', 0, 1),
(320, 'ar', 14, 9, 'Vacation Rental', 'vacation-rental-ar', NULL, NULL, NULL, 2136, 2137, 1, 'classified', 0, 1),
(321, 'ar', 15, 9, 'Garage, Parking, Farms', 'garage-parking-farms-ar', NULL, NULL, NULL, 2138, 2139, 1, 'classified', 0, 1),
(322, 'ar', 16, 9, 'Real Estate Services', 'real-estate-services-ar', NULL, NULL, NULL, 2140, 2141, 1, 'classified', 0, 1),
(323, 'ar', 17, 9, 'Rooms - Studio for Rent', 'rooms-studio-for-rent-ar', NULL, NULL, NULL, 2142, 2143, 1, 'classified', 0, 1),
(324, 'ar', 18, 9, 'Land for Sale, Rent', 'land-for-sale-rent-ar', NULL, NULL, NULL, 2144, 2145, 1, 'classified', 0, 1),
(325, 'ar', 19, 9, 'Property for sale', 'property-for-sale-ar', NULL, NULL, NULL, 2146, 2147, 1, 'classified', 0, 1),
(326, 'ar', 20, 9, 'Rentals', 'rentals-ar', NULL, NULL, NULL, 2148, 2149, 1, 'classified', 0, 1),
(327, 'ar', 21, 0, 'Services', 'services-ar', NULL, 'app/categories/skin-green/ion-clipboard.png', 'fa fa-briefcase', 2195, 2332, 0, 'classified', 0, 1),
(328, 'ar', 22, 21, 'Other services', 'other-services-ar', NULL, NULL, NULL, 2230, 2231, 1, 'classified', 0, 1),
(329, 'ar', 23, 21, 'Casting, Model, Photographer', 'casting-model-photographer-ar', NULL, NULL, NULL, 2232, 2233, 1, 'classified', 0, 1),
(330, 'ar', 24, 21, 'Carpooling', 'carpooling-ar', NULL, NULL, NULL, 2234, 2235, 1, 'classified', 0, 1),
(331, 'ar', 25, 21, 'Moving, Furniture Guard', 'moving-furniture-guard-ar', NULL, NULL, NULL, 2236, 2237, 1, 'classified', 0, 1),
(332, 'ar', 26, 21, 'Destocking - Commercial', 'destocking-commercial-ar', NULL, NULL, NULL, 2238, 2239, 1, 'classified', 0, 1),
(333, 'ar', 27, 21, 'Industrial Equipment', 'industrial-equipment-ar', NULL, NULL, NULL, 2240, 2241, 1, 'classified', 0, 1),
(334, 'ar', 28, 21, 'Aesthetics, Hairstyling', 'aesthetics-hairstyling-ar', NULL, NULL, NULL, 2242, 2243, 1, 'classified', 0, 1),
(335, 'ar', 29, 21, 'Horoscope - Tarot - Healers - Spell', 'horoscope-tarot-healers-spell-ar', NULL, NULL, NULL, 2244, 2245, 1, 'classified', 0, 1),
(336, 'ar', 30, 21, 'Materials and Equipment Pro', 'materials-and-equipment-pro-ar', NULL, NULL, NULL, 2246, 2247, 1, 'classified', 0, 1),
(337, 'ar', 31, 21, 'Event Organization Services', 'event-organization-services-ar', NULL, NULL, NULL, 2248, 2249, 1, 'classified', 0, 1),
(338, 'ar', 32, 21, 'Service Provision', 'service-provision-ar', NULL, NULL, NULL, 2250, 2251, 1, 'classified', 0, 1),
(339, 'ar', 33, 21, 'Health, Beauty', 'health-beauty-ar', NULL, NULL, NULL, 2252, 2253, 1, 'classified', 0, 1),
(340, 'ar', 34, 21, 'Artisan, Troubleshooting, Handyman', 'artisan-troubleshooting-handyman-ar', NULL, NULL, NULL, 2254, 2255, 1, 'classified', 0, 1),
(341, 'ar', 35, 21, 'Computing Services', 'computing-services-ar', NULL, NULL, NULL, 2256, 2257, 1, 'classified', 0, 1),
(342, 'ar', 36, 21, 'Tourism and Travel Services', 'tourism-and-travel-services-ar', NULL, NULL, NULL, 2258, 2259, 1, 'classified', 0, 1),
(343, 'ar', 37, 21, 'Translation, Writing', 'translation-writing-ar', NULL, NULL, NULL, 2260, 2261, 1, 'classified', 0, 1),
(344, 'ar', 38, 21, 'Construction - Renovation - Carpentry', 'construction-renovation-carpentry-ar', NULL, NULL, NULL, 2262, 2263, 1, 'classified', 0, 1),
(345, 'ar', 39, 0, 'Community', 'community-ar', NULL, 'app/categories/skin-green/fa-users.png', 'icon-theatre', 2333, 2390, 0, 'classified', 0, 1),
(346, 'ar', 40, 39, 'Sporting goods, Exercise', 'sporting-goods-exercise-ar', NULL, NULL, NULL, 2348, 2349, 1, 'classified', 0, 1),
(347, 'ar', 41, 39, 'Artists, Musicians', 'artists-musicians-ar', NULL, NULL, NULL, 2350, 2351, 1, 'classified', 0, 1),
(348, 'ar', 42, 39, 'Associations, Voluntary', 'associations-voluntary-ar', NULL, NULL, NULL, 2352, 2353, 1, 'classified', 0, 1),
(349, 'ar', 43, 39, 'Friendships for Events', 'friendships-for-events-ar', NULL, NULL, NULL, 2354, 2355, 1, 'classified', 0, 1),
(350, 'ar', 44, 39, 'My neighborhood', 'my-neighborhood-ar', NULL, NULL, NULL, 2356, 2357, 1, 'classified', 0, 1),
(351, 'ar', 45, 39, 'Nightlife, Restaurant & Bar', 'nightlife-restaurant-bar-ar', NULL, NULL, NULL, 2358, 2359, 1, 'classified', 0, 1),
(352, 'ar', 46, 39, 'Outings, Entertainment', 'outings-entertainment-ar', NULL, NULL, NULL, 2360, 2361, 1, 'classified', 0, 1),
(353, 'ar', 47, 0, 'Multimedia', 'multimedia-ar', NULL, 'app/categories/skin-green/fa-laptop.png', 'icon-laptop', 2391, 2480, 0, 'classified', 0, 1),
(354, 'ar', 48, 47, 'Multimedia & Phones Accessories', 'multimedia-phones-accessories-ar', NULL, NULL, NULL, 2414, 2415, 1, 'classified', 0, 1),
(355, 'ar', 49, 47, 'CD/DVD - Books - Movies', 'cddvd-books-movies-ar', NULL, NULL, NULL, 2416, 2417, 1, 'classified', 0, 1),
(356, 'ar', 50, 47, 'Consoles - Video Games', 'consoles-video-games-ar', NULL, NULL, NULL, 2418, 2419, 1, 'classified', 0, 1),
(357, 'ar', 51, 47, 'Computers - PC - Office Supplies', 'computers-pc-office-supplies-ar', NULL, NULL, NULL, 2420, 2421, 1, 'classified', 0, 1),
(358, 'ar', 52, 47, 'Wanted', 'wanted-ar', NULL, NULL, NULL, 2422, 2423, 1, 'classified', 0, 1),
(359, 'ar', 53, 47, 'Tablets - Touchscreens', 'tablets-touchscreens-ar', NULL, NULL, NULL, 2424, 2425, 1, 'classified', 0, 1),
(360, 'ar', 54, 47, 'Mobiles phones - Smartphones', 'mobiles-phones-smartphones-ar', NULL, NULL, NULL, 2426, 2427, 1, 'classified', 0, 1),
(361, 'ar', 55, 47, 'TV - Images - Sound', 'tv-images-sound-ar', NULL, NULL, NULL, 2428, 2429, 1, 'classified', 0, 1),
(362, 'ar', 56, 47, 'Clearance - Commercial', 'clearance-commercial-ar', NULL, NULL, NULL, 2430, 2431, 1, 'classified', 0, 1),
(363, 'ar', 57, 47, 'Industrial Equipment', 'industrial-equipment-ar', NULL, NULL, NULL, 2432, 2433, 1, 'classified', 0, 1),
(364, 'ar', 58, 47, 'Materials & Professional equipment', 'materials-professional-equipment-ar', NULL, NULL, NULL, 2434, 2435, 1, 'classified', 0, 1),
(365, 'ar', 59, 0, 'Fashion, Home & Garden', 'fashion-home-garden-ar', NULL, 'app/categories/skin-green/fa-home.png', 'icon-basket-1', 2481, 2578, 0, 'classified', 0, 1),
(366, 'ar', 60, 59, 'Furniture - Tableware', 'furniture-tableware-ar', NULL, NULL, NULL, 2506, 2507, 1, 'classified', 0, 1),
(367, 'ar', 61, 59, 'Antiques - Art - Decoration', 'antiques-art-decoration-ar', NULL, NULL, NULL, 2508, 2509, 1, 'classified', 0, 1),
(368, 'ar', 62, 59, 'Appliances', 'appliances-ar', NULL, NULL, NULL, 2510, 2511, 1, 'classified', 0, 1),
(369, 'ar', 63, 59, 'Jewelry - Watches - Luggage', 'jewelry-watches-luggage-ar', NULL, NULL, NULL, 2512, 2513, 1, 'classified', 0, 1),
(370, 'ar', 64, 59, 'DIY - Gardening', 'diy-gardening-ar', NULL, NULL, NULL, 2514, 2515, 1, 'classified', 0, 1),
(371, 'ar', 65, 59, 'Various flea markets', 'various-flea-markets-ar', NULL, NULL, NULL, 2516, 2517, 1, 'classified', 0, 1),
(372, 'ar', 66, 59, 'Shoes', 'shoes-ar', NULL, NULL, NULL, 2518, 2519, 1, 'classified', 0, 1),
(373, 'ar', 67, 59, 'Toys - Games - Figurines', 'toys-games-figurines-ar', NULL, NULL, NULL, 2520, 2521, 1, 'classified', 0, 1),
(374, 'ar', 68, 59, 'Clothing, Fashion & Accessories', 'clothing-fashion-accessories-ar', NULL, NULL, NULL, 2522, 2523, 1, 'classified', 0, 1),
(375, 'ar', 69, 59, 'Stuffs for Baby and Child', 'stuffs-for-baby-and-child-ar', NULL, NULL, NULL, 2524, 2525, 1, 'classified', 0, 1),
(376, 'ar', 70, 59, 'Stuffs for Beauty and Health', 'stuffs-for-beauty-and-health-ar', NULL, NULL, NULL, 2526, 2527, 1, 'classified', 0, 1),
(377, 'ar', 71, 59, 'Wine & Gourmet - Recipes', 'wine-gourmet-recipes-ar', NULL, NULL, NULL, 2528, 2529, 1, 'classified', 0, 1),
(378, 'ar', 72, 0, 'Pets & Mascots', 'pets-mascots-ar', NULL, 'app/categories/skin-green/map-icon-pet-store.png', 'icon-guidedog', 2579, 2596, 0, 'classified', 0, 1),
(379, 'ar', 73, 72, 'Accessories - Other Pets services', 'accessories-other-pets-services-ar', NULL, NULL, NULL, 2584, 2585, 1, 'classified', 0, 1),
(380, 'ar', 74, 72, 'Sales, Adoptions, Lost', 'sales-adoptions-lost-ar', NULL, NULL, NULL, 2586, 2587, 1, 'classified', 0, 1),
(381, 'ar', 75, 0, 'Free Dating', 'free-dating-ar', NULL, 'app/categories/skin-green/ion-ios-heart.png', 'icon-heart', 2597, 2670, 0, 'not-salable', 0, 1),
(382, 'ar', 76, 75, 'Friendship - Friends', 'friendship-friends-ar', NULL, NULL, NULL, 2616, 2617, 1, 'not-salable', 0, 1),
(383, 'ar', 77, 75, 'Escorts - Adult Services', 'escorts-adult-services-ar', NULL, NULL, NULL, 2618, 2619, 1, 'not-salable', 0, 1),
(384, 'ar', 78, 75, 'Women Seeking Women', 'women-seeking-women-ar', NULL, NULL, NULL, 2620, 2621, 1, 'not-salable', 0, 1),
(385, 'ar', 79, 75, 'Women Seeking Men', 'women-seeking-men-ar', NULL, NULL, NULL, 2622, 2623, 1, 'not-salable', 0, 1),
(386, 'ar', 80, 75, 'Men Seeking Women', 'men-seeking-women-ar', NULL, NULL, NULL, 2624, 2625, 1, 'not-salable', 0, 1),
(387, 'ar', 81, 75, 'Men Seeking Men', 'men-seeking-men-ar', NULL, NULL, NULL, 2626, 2627, 1, 'not-salable', 0, 1),
(388, 'ar', 82, 75, 'Massage Services - Relaxation', 'massage-services-relaxation-ar', NULL, NULL, NULL, 2628, 2629, 1, 'not-salable', 0, 1),
(389, 'ar', 83, 75, 'Adults Products - Articles', 'adults-products-articles-ar', NULL, NULL, NULL, 2630, 2631, 1, 'not-salable', 0, 1),
(390, 'ar', 84, 75, 'Casual Encounter', 'casual-encounter-ar', NULL, NULL, NULL, 2632, 2633, 1, 'not-salable', 0, 1),
(391, 'ar', 85, 0, 'Jobs Offers', 'jobs-offers-ar', NULL, 'app/categories/skin-green/mfglabs-users.png', 'icon-megaphone-1', 2671, 2856, 0, 'job-offer', 0, 1),
(392, 'ar', 86, 85, 'Agriculture - Environment', 'agriculture-environment-ar', NULL, NULL, NULL, 2718, 2719, 1, 'classified', 0, 1),
(393, 'ar', 87, 85, 'Assistantship - Secretariat - Helpdesk', 'assistantship-secretariat-helpdesk-ar', NULL, NULL, NULL, 2720, 2721, 1, 'classified', 0, 1),
(394, 'ar', 88, 85, 'Automotive - Mechanic', 'automotive-mechanic-ar', NULL, NULL, NULL, 2722, 2723, 1, 'classified', 0, 1),
(395, 'ar', 89, 85, 'Others Jobs Offer', 'others-jobs-offer-ar', NULL, NULL, NULL, 2724, 2725, 1, 'classified', 0, 1),
(396, 'ar', 90, 85, 'BTP - Construction - Building', 'btp-construction-building-ar', NULL, NULL, NULL, 2726, 2727, 1, 'classified', 0, 1),
(397, 'ar', 91, 85, 'Trade - Business Services', 'trade-business-services-ar', NULL, NULL, NULL, 2728, 2729, 1, 'classified', 0, 1),
(398, 'ar', 92, 85, 'Commercial - Sale Jobs Offer', 'commercial-sale-jobs-offer-ar', NULL, NULL, NULL, 2730, 2731, 1, 'classified', 0, 1),
(399, 'ar', 93, 85, 'Accounting - Management - Finance', 'accounting-management-finance-ar', NULL, NULL, NULL, 2732, 2733, 1, 'classified', 0, 1),
(400, 'ar', 94, 85, 'Steering - Manager', 'steering-manager-ar', NULL, NULL, NULL, 2734, 2735, 1, 'classified', 0, 1),
(401, 'ar', 95, 85, 'Aesthetics - Hair - Beauty', 'aesthetics-hair-beauty-ar', NULL, NULL, NULL, 2736, 2737, 1, 'classified', 0, 1),
(402, 'ar', 96, 85, 'Public Service Jobs Offer', 'public-service-jobs-offer-ar', NULL, NULL, NULL, 2738, 2739, 1, 'classified', 0, 1),
(403, 'ar', 97, 85, 'Real Estate Jobs Offer', 'real-estate-jobs-offer-ar', NULL, NULL, NULL, 2740, 2741, 1, 'classified', 0, 1),
(404, 'ar', 98, 85, 'Independent - Freelance - Telecommuting', 'independent-freelance-telecommuting-ar', NULL, NULL, NULL, 2742, 2743, 1, 'classified', 0, 1),
(405, 'ar', 99, 85, 'Computers - Internet - Telecommunications', 'computers-internet-telecommunications-ar', NULL, NULL, NULL, 2744, 2745, 1, 'classified', 0, 1),
(406, 'ar', 100, 85, 'Industry, Production & engineering', 'industry-production-engineering-ar', NULL, NULL, NULL, 2746, 2747, 1, 'classified', 0, 1),
(407, 'ar', 101, 85, 'Marketing - Communication', 'marketing-communication-ar', NULL, NULL, NULL, 2748, 2749, 1, 'classified', 0, 1),
(408, 'ar', 102, 85, 'Babysitting - Nanny Work', 'babysitting-nanny-work-ar', NULL, NULL, NULL, 2750, 2751, 1, 'classified', 0, 1),
(409, 'ar', 103, 85, 'HR - Training - Education', 'hr-training-education-ar', NULL, NULL, NULL, 2752, 2753, 1, 'classified', 0, 1),
(410, 'ar', 104, 85, 'Medical - Healthcare - Social', 'medical-healthcare-social-ar', NULL, NULL, NULL, 2754, 2755, 1, 'classified', 0, 1),
(411, 'ar', 105, 85, 'Security - Guarding', 'security-guarding-ar', NULL, NULL, NULL, 2756, 2757, 1, 'classified', 0, 1),
(412, 'ar', 106, 85, 'Household Services - Housekeeping', 'household-services-housekeeping-ar', NULL, NULL, NULL, 2758, 2759, 1, 'classified', 0, 1),
(413, 'ar', 107, 85, 'Tourism - Hotels - Restaurants - Leisure', 'tourism-hotels-restaurants-leisure-ar', NULL, NULL, NULL, 2760, 2761, 1, 'classified', 0, 1),
(414, 'ar', 108, 85, 'Transportation - Logistics', 'transportation-logistics-ar', NULL, NULL, NULL, 2762, 2763, 1, 'classified', 0, 1),
(415, 'ar', 109, 0, 'Job Search', 'job-search-ar', NULL, 'app/categories/skin-green/fa-search.png', 'icon-search', 2857, 3042, 0, 'job-search', 0, 1),
(416, 'ar', 110, 109, 'Agriculture - Environment', 'agriculture-environment-ar', NULL, NULL, NULL, 2904, 2905, 1, 'job-search', 0, 1),
(417, 'ar', 111, 109, 'Assistantship - Secretariat - Helpdesk', 'assistantship-secretariat-helpdesk-ar', NULL, NULL, NULL, 2906, 2907, 1, 'job-search', 0, 1),
(418, 'ar', 112, 109, 'Automotive - Mechanic', 'automotive-mechanic-ar', NULL, NULL, NULL, 2908, 2909, 1, 'job-search', 0, 1),
(419, 'ar', 113, 109, 'Others Jobs Search', 'others-jobs-search-ar', NULL, NULL, NULL, 2910, 2911, 1, 'job-search', 0, 1),
(420, 'ar', 114, 109, 'BTP - Construction - Building', 'btp-construction-building-ar', NULL, NULL, NULL, 2912, 2913, 1, 'job-search', 0, 1),
(421, 'ar', 115, 109, 'Trade - Business Services', 'trade-business-services-ar', NULL, NULL, NULL, 2914, 2915, 1, 'job-search', 0, 1),
(422, 'ar', 116, 109, 'Commercial - Sale Jobs Search', 'commercial-sale-jobs-search-ar', NULL, NULL, NULL, 2916, 2917, 1, 'job-search', 0, 1),
(423, 'ar', 117, 109, 'Accounting - Management - Finance', 'accounting-management-finance-ar', NULL, NULL, NULL, 2918, 2919, 1, 'job-search', 0, 1),
(424, 'ar', 118, 109, 'Steering - Manager', 'steering-manager-ar', NULL, NULL, NULL, 2920, 2921, 1, 'job-search', 0, 1),
(425, 'ar', 119, 109, 'Aesthetics - Hair - Beauty', 'aesthetics-hair-beauty-ar', NULL, NULL, NULL, 2922, 2923, 1, 'job-search', 0, 1),
(426, 'ar', 120, 109, 'Public Service Jobs Search', 'public-service-jobs-search-ar', NULL, NULL, NULL, 2924, 2925, 1, 'job-search', 0, 1),
(427, 'ar', 121, 109, 'Real Estate Jobs Search', 'real-estate-jobs-search-ar', NULL, NULL, NULL, 2926, 2927, 1, 'job-search', 0, 1),
(428, 'ar', 122, 109, 'Independent - Freelance - Telecommuting', 'independent-freelance-telecommuting-ar', NULL, NULL, NULL, 2928, 2929, 1, 'job-search', 0, 1),
(429, 'ar', 123, 109, 'Computers - Internet - Telecommunications', 'computers-internet-telecommunications-ar', NULL, NULL, NULL, 2930, 2931, 1, 'job-search', 0, 1),
(430, 'ar', 124, 109, 'Industry, Production & engineering', 'industry-production-engineering-ar', NULL, NULL, NULL, 2932, 2933, 1, 'job-search', 0, 1),
(431, 'ar', 125, 109, 'Marketing - Communication', 'marketing-communication-ar', NULL, NULL, NULL, 2934, 2935, 1, 'job-search', 0, 1),
(432, 'ar', 126, 109, 'Babysitting - Nanny Work', 'babysitting-nanny-work-ar', NULL, NULL, NULL, 2936, 2937, 1, 'job-search', 0, 1),
(433, 'ar', 127, 109, 'HR - Training - Education', 'hr-training-education-ar', NULL, NULL, NULL, 2938, 2939, 1, 'job-search', 0, 1),
(434, 'ar', 128, 109, 'Medical - Healthcare - Social', 'medical-healthcare-social-ar', NULL, NULL, NULL, 2940, 2941, 1, 'job-search', 0, 1),
(435, 'ar', 129, 109, 'Security - Guarding', 'security-guarding-ar', NULL, NULL, NULL, 2942, 2943, 1, 'job-search', 0, 1),
(436, 'ar', 130, 109, 'Household Services - Housekeeping', 'household-services-housekeeping-ar', NULL, NULL, NULL, 2944, 2945, 1, 'job-search', 0, 1),
(437, 'ar', 131, 109, 'Tourism - Hotels - Restaurants - Leisure', 'tourism-hotels-restaurants-leisure-ar', NULL, NULL, NULL, 2946, 2947, 1, 'job-search', 0, 1),
(438, 'ar', 132, 109, 'Transportation - Logistics', 'transportation-logistics-ar', NULL, NULL, NULL, 2948, 2949, 1, 'job-search', 0, 1),
(439, 'ar', 133, 0, 'Learning', 'learning-ar', NULL, 'app/categories/skin-green/fa-graduation-cap.png', 'icon-book-open', 3043, 3100, 0, 'classified', 0, 1),
(440, 'ar', 134, 133, 'Language Classes', 'language-classes-ar', NULL, NULL, NULL, 3058, 3059, 1, 'classified', 0, 1),
(441, 'ar', 135, 133, 'Computer Courses', 'computer-courses-ar', NULL, NULL, NULL, 3060, 3061, 1, 'classified', 0, 1),
(442, 'ar', 136, 133, 'Tutoring, Private Lessons', 'tutoring-private-lessons-ar', NULL, NULL, NULL, 3062, 3063, 1, 'classified', 0, 1),
(443, 'ar', 137, 133, 'Vocational Training', 'vocational-training-ar', NULL, NULL, NULL, 3064, 3065, 1, 'classified', 0, 1),
(444, 'ar', 138, 133, 'Maths, Physics, Chemistry', 'maths-physics-chemistry-ar', NULL, NULL, NULL, 3066, 3067, 1, 'classified', 0, 1),
(445, 'ar', 139, 133, 'Music, Theatre, Dance', 'music-theatre-dance-ar', NULL, NULL, NULL, 3068, 3069, 1, 'classified', 0, 1),
(446, 'ar', 140, 133, 'School support', 'school-support-ar', NULL, NULL, NULL, 3070, 3071, 1, 'classified', 0, 1),
(447, 'ar', 141, 0, 'Local Events', 'local-events-ar', NULL, 'app/categories/skin-green/fa-calendar.png', 'icon-megaphone-1', 3101, 3198, 0, 'classified', 0, 1),
(448, 'ar', 142, 141, 'Concerts & Festivals', 'concerts-festivals-ar', NULL, NULL, NULL, 3126, 3127, 1, 'classified', 0, 1),
(449, 'ar', 143, 141, 'Networking & Meetups', 'networking-meetups-ar', NULL, NULL, NULL, 3128, 3129, 1, 'classified', 0, 1),
(450, 'ar', 144, 141, 'Sports & Outdoors', 'sports-outdoors-ar', NULL, NULL, NULL, 3130, 3131, 1, 'classified', 0, 1),
(451, 'ar', 145, 141, 'Trade Shows & Conventions', 'trade-shows-conventions-ar', NULL, NULL, NULL, 3132, 3133, 1, 'classified', 0, 1),
(452, 'ar', 146, 141, 'Training & Seminars', 'training-seminars-ar', NULL, NULL, NULL, 3134, 3135, 1, 'classified', 0, 1),
(453, 'ar', 147, 141, 'Ceremonies', 'ceremonies-ar', NULL, NULL, NULL, 3136, 3137, 1, 'classified', 0, 1),
(454, 'ar', 148, 141, 'Conferences', 'conferences-ar', NULL, NULL, NULL, 3138, 3139, 1, 'classified', 0, 1),
(455, 'ar', 149, 141, 'Weddings', 'weddings-ar', NULL, NULL, NULL, 3140, 3141, 1, 'classified', 0, 1),
(456, 'ar', 150, 141, 'Birthdays', 'birthdays-ar', NULL, NULL, NULL, 3142, 3143, 1, 'classified', 0, 1),
(457, 'ar', 151, 141, 'Family Events', 'family-events-ar', NULL, NULL, NULL, 3144, 3145, 1, 'classified', 0, 1),
(458, 'ar', 152, 141, 'Nightlife', 'nightlife-ar', NULL, NULL, NULL, 3146, 3147, 1, 'classified', 0, 1),
(459, 'ar', 153, 141, 'All others events', 'all-others-events-ar', NULL, NULL, NULL, 3148, 3149, 1, 'classified', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_field`
--

CREATE TABLE `category_field` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `disabled_in_subcategories` tinyint(1) UNSIGNED DEFAULT '0',
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_field`
--

INSERT INTO `category_field` (`id`, `category_id`, `field_id`, `disabled_in_subcategories`, `parent_id`, `lft`, `rgt`, `depth`) VALUES
(1, 1, 1, 0, 0, 2, 3, 1),
(2, 1, 6, 0, 0, 16, 17, 1),
(3, 109, 7, 0, NULL, NULL, NULL, NULL),
(4, 1, 5, 0, 0, 8, 9, 1),
(5, 1, 4, 0, 0, 14, 15, 1),
(6, 1, 2, 0, 0, 4, 5, 1),
(7, 1, 3, 0, 0, 6, 7, 1),
(8, 1, 8, 0, 0, 12, 13, 1),
(9, 47, 8, 0, 0, 4, 5, 1),
(10, 59, 8, 0, NULL, NULL, NULL, NULL),
(11, 1, 9, 0, 0, 10, 11, 1),
(12, 85, 10, 0, NULL, NULL, NULL, NULL),
(13, 85, 11, 0, NULL, NULL, NULL, NULL),
(14, 85, 12, 0, NULL, NULL, NULL, NULL),
(15, 109, 12, 0, NULL, NULL, NULL, NULL),
(16, 9, 13, 0, 0, 2, 3, 1),
(17, 9, 14, 0, 0, 4, 5, 1),
(18, 9, 15, 0, 0, 8, 9, 1),
(19, 9, 16, 0, 0, 10, 11, 1),
(20, 9, 17, 0, 0, 6, 7, 1),
(21, 47, 18, 0, 0, 2, 3, 1),
(22, 75, 19, 0, NULL, NULL, NULL, NULL),
(23, 75, 20, 0, NULL, NULL, NULL, NULL),
(24, 75, 21, 0, NULL, NULL, NULL, NULL),
(25, 141, 22, 0, NULL, NULL, NULL, NULL),
(26, 141, 23, 0, NULL, NULL, NULL, NULL),
(27, 141, 24, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'ISO-3166 2-letter country code, 2 characters',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'name of geographical point (utf8) varchar(200)',
  `asciiname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'name of geographical point in plain ascii characters, varchar(200)',
  `latitude` float DEFAULT NULL COMMENT 'latitude in decimal degrees (wgs84)',
  `longitude` float DEFAULT NULL COMMENT 'longitude in decimal degrees (wgs84)',
  `feature_class` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'see http://www.geonames.org/export/codes.html, char(1)',
  `feature_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'see http://www.geonames.org/export/codes.html, varchar(10)',
  `subadmin1_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'fipscode (subject to change to iso code), see exceptions below, see file admin1Codes.txt for display names of this code; varchar(20)',
  `subadmin2_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'code for the second administrative division, a county in the US, see file admin2Codes.txt; varchar(80)',
  `population` bigint(20) DEFAULT NULL COMMENT 'bigint (4 byte int)',
  `time_zone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'the timezone id (see file timeZone.txt)',
  `active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_code`, `name`, `asciiname`, `latitude`, `longitude`, `feature_class`, `feature_code`, `subadmin1_code`, `subadmin2_code`, `population`, `time_zone`, `active`, `created_at`, `updated_at`) VALUES
(1, 'QA', 'Umm Şalāl Muḩammad', 'Umm Salal Muhammad', 25.4152, 51.4065, 'P', 'PPL', 'QA.09', NULL, 29391, 'Asia/Qatar', 1, '2016-08-02 23:00:00', '2016-08-02 23:00:00'),
(2, 'QA', 'Umm Şalāl ‘Alī', 'Umm Salal `Ali', 25.4697, 51.3975, 'P', 'PPLA', 'QA.09', NULL, 0, 'Asia/Qatar', 1, '2018-03-27 23:00:00', '2018-03-27 23:00:00'),
(3, 'QA', 'Musay‘īd', 'Musay`id', 24.9923, 51.5507, 'P', 'PPL', 'QA.10', NULL, 5769, 'Asia/Qatar', 1, '2016-08-02 23:00:00', '2016-08-02 23:00:00'),
(4, 'QA', 'Madīnat ash Shamāl', 'Madinat ash Shamal', 26.1293, 51.2009, 'P', 'PPLA', 'QA.08', NULL, 5267, 'Asia/Qatar', 1, '2013-08-09 23:00:00', '2013-08-09 23:00:00'),
(5, 'QA', 'Dukhān', 'Dukhan', 25.4249, 50.7823, 'P', 'PPL', 'QA.14', NULL, 7250, 'Asia/Qatar', 1, '2017-12-06 23:00:00', '2017-12-06 23:00:00'),
(6, 'QA', 'Az̧ Z̧a‘āyin', 'Az Za`ayin', 25.5774, 51.4831, 'P', 'PPLA', 'QA.13', NULL, 0, 'Asia/Qatar', 1, '2012-02-01 23:00:00', '2012-02-01 23:00:00'),
(7, 'QA', 'Ash Shīḩānīyah', 'Ash Shihaniyah', 25.3709, 51.2226, 'P', 'PPLA', 'QA.14', NULL, 8380, 'Asia/Qatar', 1, '2018-03-27 23:00:00', '2018-03-27 23:00:00'),
(8, 'QA', 'Ar Rayyān', 'Ar Rayyan', 25.2919, 51.4244, 'P', 'PPLA', 'QA.06', NULL, 272465, 'Asia/Qatar', 1, '2014-07-22 23:00:00', '2014-07-22 23:00:00'),
(9, 'QA', 'Al Wukayr', 'Al Wukayr', 25.1511, 51.5372, 'P', 'PPL', 'QA.10', NULL, 5146, 'Asia/Qatar', 1, '2016-08-02 23:00:00', '2016-08-02 23:00:00'),
(10, 'QA', 'Al Wakrah', 'Al Wakrah', 25.1715, 51.6034, 'P', 'PPLA', 'QA.10', NULL, 26436, 'Asia/Qatar', 1, '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(11, 'QA', 'Al Khawr', 'Al Khawr', 25.6839, 51.5058, 'P', 'PPLA', 'QA.04', NULL, 18923, 'Asia/Qatar', 1, '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(12, 'QA', 'Doha', 'Doha', 25.2854, 51.531, 'P', 'PPLC', 'QA.01', NULL, 344939, 'Asia/Qatar', 1, '2019-09-04 23:00:00', '2019-09-04 23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `continents`
--

CREATE TABLE `continents` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `continents`
--

INSERT INTO `continents` (`id`, `code`, `name`, `active`) VALUES
(1, 'AF', 'Africa', 1),
(2, 'AN', 'Antarctica', 1),
(3, 'AS', 'Asia', 1),
(4, 'EU', 'Europe', 1),
(5, 'NA', 'North America', 1),
(6, 'OC', 'Oceania', 1),
(7, 'SA', 'South America', 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `iso3` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iso_numeric` int(10) UNSIGNED DEFAULT NULL,
  `fips` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `asciiname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capital` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` int(10) UNSIGNED DEFAULT NULL,
  `population` int(10) UNSIGNED DEFAULT NULL,
  `continent_code` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tld` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code_format` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code_regex` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `languages` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `neighbours` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `equivalent_fips_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `background_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_type` enum('0','1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `admin_field_active` tinyint(1) UNSIGNED DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `iso3`, `iso_numeric`, `fips`, `name`, `asciiname`, `capital`, `area`, `population`, `continent_code`, `tld`, `currency_code`, `phone`, `postal_code_format`, `postal_code_regex`, `languages`, `neighbours`, `equivalent_fips_code`, `background_image`, `admin_type`, `admin_field_active`, `active`, `created_at`, `updated_at`) VALUES
(1, 'AD', 'AND', 20, 'AN', 'Andorra', 'Andorra', 'Andorra la Vella', 468, 84000, 'EU', '.ad', 'EUR', '376', 'AD###', '^(?:AD)*(d{3})$', 'ca', 'ES,FR', '', NULL, '0', 0, 0, NULL, NULL),
(2, 'AE', 'ARE', 784, 'AE', 'al-Imārāt', 'United Arab Emirates', 'Abu Dhabi', 82880, 4975593, 'AS', '.ae', 'AED', '971', '', '', 'ar-AE,fa,en,hi,ur', 'SA,OM', '', NULL, '0', 0, 0, NULL, NULL),
(3, 'AF', 'AFG', 4, 'AF', 'Afġānistān', 'Afghanistan', 'Kabul', 647500, 29121286, 'AS', '.af', 'AFN', '93', '', '', 'fa-AF,ps,uz-AF,tk', 'TM,CN,IR,TJ,PK,UZ', '', NULL, '0', 0, 0, NULL, NULL),
(4, 'AG', 'ATG', 28, 'AC', 'Antigua and Barbuda', 'Antigua and Barbuda', 'St. John\'s', 443, 86754, 'NA', '.ag', 'XCD', '+1-268', '', '', 'en-AG', '', '', NULL, '0', 0, 0, NULL, NULL),
(5, 'AI', 'AIA', 660, 'AV', 'Anguilla', 'Anguilla', 'The Valley', 102, 13254, 'NA', '.ai', 'XCD', '+1-264', '', '', 'en-AI', '', '', NULL, '0', 0, 0, NULL, NULL),
(6, 'AL', 'ALB', 8, 'AL', 'Shqipëria', 'Albania', 'Tirana', 28748, 2986952, 'EU', '.al', 'ALL', '355', '', '', 'sq,el', 'MK,GR,ME,RS,XK', '', NULL, '0', 0, 0, NULL, NULL),
(7, 'AM', 'ARM', 51, 'AM', 'Hayastan', 'Armenia', 'Yerevan', 29800, 2968000, 'AS', '.am', 'AMD', '374', '######', '^(d{6})$', 'hy', 'GE,IR,AZ,TR', '', NULL, '0', 0, 0, NULL, NULL),
(8, 'AN', 'ANT', 530, 'NT', 'Netherlands Antilles', 'Netherlands Antilles', 'Willemstad', 960, 136197, 'NA', '.an', 'ANG', '599', '', '', 'nl-AN,en,es', 'GP', '', NULL, '0', 0, 0, NULL, NULL),
(9, 'AO', 'AGO', 24, 'AO', 'Angola', 'Angola', 'Luanda', 1246700, 13068161, 'AF', '.ao', 'AOA', '244', '', '', 'pt-AO', 'CD,NA,ZM,CG', '', NULL, '0', 0, 0, NULL, NULL),
(10, 'AQ', 'ATA', 10, 'AY', 'Antarctica', 'Antarctica', '', 14000000, 0, 'AN', '.aq', '', '', '', '', '', '', '', NULL, '0', 0, 0, NULL, NULL),
(11, 'AR', 'ARG', 32, 'AR', 'Argentina', 'Argentina', 'Buenos Aires', 2766890, 41343201, 'SA', '.ar', 'ARS', '54', '@####@@@', '^([A-Z]d{4}[A-Z]{3})$', 'es-AR,en,it,de,fr,gn', 'CL,BO,UY,PY,BR', '', NULL, '0', 0, 0, NULL, NULL),
(12, 'AS', 'ASM', 16, 'AQ', 'American Samoa', 'American Samoa', 'Pago Pago', 199, 57881, 'OC', '.as', 'USD', '+1-684', '', '', 'en-AS,sm,to', '', '', NULL, '0', 0, 0, NULL, NULL),
(13, 'AT', 'AUT', 40, 'AU', 'Österreich', 'Austria', 'Vienna', 83858, 8205000, 'EU', '.at', 'EUR', '43', '####', '^(d{4})$', 'de-AT,hr,hu,sl', 'CH,DE,HU,SK,CZ,IT,SI,LI', '', NULL, '0', 0, 0, NULL, NULL),
(14, 'AU', 'AUS', 36, 'AS', 'Australia', 'Australia', 'Canberra', 7686850, 21515754, 'OC', '.au', 'AUD', '61', '####', '^(d{4})$', 'en-AU', '', '', NULL, '0', 0, 0, NULL, NULL),
(15, 'AW', 'ABW', 533, 'AA', 'Aruba', 'Aruba', 'Oranjestad', 193, 71566, 'NA', '.aw', 'AWG', '297', '', '', 'nl-AW,es,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(16, 'AX', 'ALA', 248, '', 'Aland Islands', 'Aland Islands', 'Mariehamn', 1580, 26711, 'EU', '.ax', 'EUR', '+358-18', '#####', '^(?:FI)*(d{5})$', 'sv-AX', '', 'FI', NULL, '0', 0, 0, NULL, NULL),
(17, 'AZ', 'AZE', 31, 'AJ', 'Azərbaycan', 'Azerbaijan', 'Baku', 86600, 8303512, 'AS', '.az', 'AZN', '994', 'AZ ####', '^(?:AZ)*(d{4})$', 'az,ru,hy', 'GE,IR,AM,TR,RU', '', NULL, '0', 0, 0, NULL, NULL),
(18, 'BA', 'BIH', 70, 'BK', 'Bosna i Hercegovina', 'Bosnia and Herzegovina', 'Sarajevo', 51129, 4590000, 'EU', '.ba', 'BAM', '387', '#####', '^(d{5})$', 'bs,hr-BA,sr-BA', 'HR,ME,RS', '', NULL, '0', 0, 0, NULL, NULL),
(19, 'BB', 'BRB', 52, 'BB', 'Barbados', 'Barbados', 'Bridgetown', 431, 285653, 'NA', '.bb', 'BBD', '+1-246', 'BB#####', '^(?:BB)*(d{5})$', 'en-BB', '', '', NULL, '0', 0, 0, NULL, NULL),
(20, 'BD', 'BGD', 50, 'BG', 'Bāṅlādēś', 'Bangladesh', 'Dhaka', 144000, 156118464, 'AS', '.bd', 'BDT', '880', '####', '^(d{4})$', 'bn-BD,en', 'MM,IN', '', NULL, '0', 0, 0, NULL, NULL),
(21, 'BE', 'BEL', 56, 'BE', 'Belgique', 'Belgium', 'Brussels', 30510, 10403000, 'EU', '.be', 'EUR', '32', '####', '^(d{4})$', 'nl-BE,fr-BE,de-BE', 'DE,NL,LU,FR', '', NULL, '0', 0, 0, NULL, NULL),
(22, 'BF', 'BFA', 854, 'UV', 'Burkina Faso', 'Burkina Faso', 'Ouagadougou', 274200, 16241811, 'AF', '.bf', 'XOF', '226', '', '', 'fr-BF', 'NE,BJ,GH,CI,TG,ML', '', NULL, '0', 0, 0, NULL, NULL),
(23, 'BG', 'BGR', 100, 'BU', 'Bŭlgarija', 'Bulgaria', 'Sofia', 110910, 7148785, 'EU', '.bg', 'BGN', '359', '####', '^(d{4})$', 'bg,tr-BG,rom', 'MK,GR,RO,TR,RS', '', NULL, '0', 0, 0, NULL, NULL),
(24, 'BH', 'BHR', 48, 'BA', 'al-Baḥrayn', 'Bahrain', 'Manama', 665, 738004, 'AS', '.bh', 'BHD', '973', '####|###', '^(d{3}d?)$', 'ar-BH,en,fa,ur', '', '', NULL, '0', 0, 0, NULL, NULL),
(25, 'BI', 'BDI', 108, 'BY', 'Burundi', 'Burundi', 'Bujumbura', 27830, 9863117, 'AF', '.bi', 'BIF', '257', '', '', 'fr-BI,rn', 'TZ,CD,RW', '', NULL, '0', 0, 0, NULL, NULL),
(26, 'BJ', 'BEN', 204, 'BN', 'Bénin', 'Benin', 'Porto-Novo', 112620, 9056010, 'AF', '.bj', 'XOF', '+229', '', '', 'fr-BJ', 'NE,TG,BF,NG', '', NULL, '0', 0, 0, NULL, '2016-05-09 20:55:29'),
(27, 'BL', 'BLM', 652, 'TB', 'Saint Barthelemy', 'Saint Barthelemy', 'Gustavia', 21, 8450, 'NA', '.gp', 'EUR', '590', '### ###', '', 'fr', '', '', NULL, '0', 0, 0, NULL, NULL),
(28, 'BM', 'BMU', 60, 'BD', 'Bermuda', 'Bermuda', 'Hamilton', 53, 65365, 'NA', '.bm', 'BMD', '+1-441', '@@ ##', '^([A-Z]{2}d{2})$', 'en-BM,pt', '', '', NULL, '0', 0, 0, NULL, NULL),
(29, 'BN', 'BRN', 96, 'BX', 'Brunei Darussalam', 'Brunei', 'Bandar Seri Begawan', 5770, 395027, 'AS', '.bn', 'BND', '673', '@@####', '^([A-Z]{2}d{4})$', 'ms-BN,en-BN', 'MY', '', NULL, '0', 0, 0, NULL, NULL),
(30, 'BO', 'BOL', 68, 'BL', 'Bolivia', 'Bolivia', 'Sucre', 1098580, 9947418, 'SA', '.bo', 'BOB', '591', '', '', 'es-BO,qu,ay', 'PE,CL,PY,BR,AR', '', NULL, '0', 0, 0, NULL, NULL),
(31, 'BQ', 'BES', 535, '', 'Bonaire, Saint Eustatius and Saba ', 'Bonaire, Saint Eustatius and Saba ', '', 328, 18012, 'NA', '.bq', 'USD', '599', '', '', 'nl,pap,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(32, 'BR', 'BRA', 76, 'BR', 'Brasil', 'Brazil', 'Brasilia', 8511965, 201103330, 'SA', '.br', 'BRL', '55', '#####-###', '^(d{8})$', 'pt-BR,es,en,fr', 'SR,PE,BO,UY,GY,PY,GF,VE,CO,AR', '', NULL, '0', 0, 0, NULL, NULL),
(33, 'BS', 'BHS', 44, 'BF', 'Bahamas', 'Bahamas', 'Nassau', 13940, 301790, 'NA', '.bs', 'BSD', '+1-242', '', '', 'en-BS', '', '', NULL, '0', 0, 0, NULL, NULL),
(34, 'BT', 'BTN', 64, 'BT', 'Druk-yul', 'Bhutan', 'Thimphu', 47000, 699847, 'AS', '.bt', 'BTN', '975', '', '', 'dz', 'CN,IN', '', NULL, '0', 0, 0, NULL, NULL),
(35, 'BV', 'BVT', 74, 'BV', 'Bouvet Island', 'Bouvet Island', '', 49, 0, 'AN', '.bv', 'NOK', '', '', '', '', '', '', NULL, '0', 0, 0, NULL, NULL),
(36, 'BW', 'BWA', 72, 'BC', 'Botswana', 'Botswana', 'Gaborone', 600370, 2029307, 'AF', '.bw', 'BWP', '267', '', '', 'en-BW,tn-BW', 'ZW,ZA,NA', '', NULL, '0', 0, 0, NULL, NULL),
(37, 'BY', 'BLR', 112, 'BO', 'Biełaruś', 'Belarus', 'Minsk', 207600, 9685000, 'EU', '.by', 'BYR', '375', '######', '^(d{6})$', 'be,ru', 'PL,LT,UA,RU,LV', '', NULL, '0', 0, 0, NULL, NULL),
(38, 'BZ', 'BLZ', 84, 'BH', 'Belize', 'Belize', 'Belmopan', 22966, 314522, 'NA', '.bz', 'BZD', '501', '', '', 'en-BZ,es', 'GT,MX', '', NULL, '0', 0, 0, NULL, NULL),
(39, 'CA', 'CAN', 124, 'CA', 'Canada', 'Canada', 'Ottawa', 9984670, 33679000, 'NA', '.ca', 'CAD', '1', '@#@ #@#', '^([ABCEGHJKLMNPRSTVXY]d[ABCEGHJKLMNPRSTVWXYZ]) ?(d[ABCEGHJKLMNPRSTVWXYZ]d)$ ', 'en-CA,fr-CA,iu', 'US', '', NULL, '0', 0, 0, NULL, NULL),
(40, 'CC', 'CCK', 166, 'CK', 'Cocos Islands', 'Cocos Islands', 'West Island', 14, 628, 'AS', '.cc', 'AUD', '61', '', '', 'ms-CC,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(41, 'CD', 'COD', 180, 'CG', 'RDC', 'Democratic Republic of the Congo', 'Kinshasa', 2345410, 70916439, 'AF', '.cd', 'CDF', '243', '', '', 'fr-CD,ln,kg', 'TZ,CF,SS,RW,ZM,BI,UG,CG,AO', '', NULL, '0', 0, 0, NULL, NULL),
(42, 'CF', 'CAF', 140, 'CT', 'Centrafrique', 'Central African Republic', 'Bangui', 622984, 4844927, 'AF', '.cf', 'XAF', '236', '', '', 'fr-CF,sg,ln,kg', 'TD,SD,CD,SS,CM,CG', '', NULL, '0', 0, 0, NULL, NULL),
(43, 'CG', 'COG', 178, 'CF', 'Congo', 'Republic of the Congo', 'Brazzaville', 342000, 3039126, 'AF', '.cg', 'XAF', '242', '', '', 'fr-CG,kg,ln-CG', 'CF,GA,CD,CM,AO', '', NULL, '0', 0, 0, NULL, NULL),
(44, 'CH', 'CHE', 756, 'SZ', 'Switzerland', 'Switzerland', 'Berne', 41290, 7581000, 'EU', '.ch', 'CHF', '41', '####', '^(d{4})$', 'de-CH,fr-CH,it-CH,rm', 'DE,IT,LI,FR,AT', '', NULL, '0', 0, 0, NULL, NULL),
(45, 'CI', 'CIV', 384, 'IV', 'Côte d\'Ivoire', 'Ivory Coast', 'Yamoussoukro', 322460, 21058798, 'AF', '.ci', 'XOF', '225', '', '', 'fr-CI', 'LR,GH,GN,BF,ML', '', NULL, '0', 0, 0, NULL, NULL),
(46, 'CK', 'COK', 184, 'CW', 'Cook Islands', 'Cook Islands', 'Avarua', 240, 21388, 'OC', '.ck', 'NZD', '682', '', '', 'en-CK,mi', '', '', NULL, '0', 0, 0, NULL, NULL),
(47, 'CL', 'CHL', 152, 'CI', 'Chile', 'Chile', 'Santiago', 756950, 16746491, 'SA', '.cl', 'CLP', '56', '#######', '^(d{7})$', 'es-CL', 'PE,BO,AR', '', NULL, '0', 0, 0, NULL, NULL),
(48, 'CM', 'CMR', 120, 'CM', 'Cameroun', 'Cameroon', 'Yaounde', 475440, 19294149, 'AF', '.cm', 'XAF', '237', '', '', 'fr-CM,en-CM', 'TD,CF,GA,GQ,CG,NG', '', NULL, '0', 0, 0, NULL, NULL),
(49, 'CN', 'CHN', 156, 'CH', 'Zhōngguó', 'China', 'Beijing', 9596960, 1330044000, 'AS', '.cn', 'CNY', '86', '######', '^(d{6})$', 'zh-CN,yue,wuu,dta,ug,za', 'LA,BT,TJ,KZ,MN,AF,NP,MM,KG,PK,KP,RU,VN,IN', '', NULL, '0', 0, 0, NULL, NULL),
(50, 'CO', 'COL', 170, 'CO', 'Colombia', 'Colombia', 'Bogota', 1138910, 47790000, 'SA', '.co', 'COP', '57', '', '', 'es-CO', 'EC,PE,PA,BR,VE', '', NULL, '0', 0, 0, NULL, NULL),
(51, 'CR', 'CRI', 188, 'CS', 'Costa Rica', 'Costa Rica', 'San Jose', 51100, 4516220, 'NA', '.cr', 'CRC', '506', '####', '^(d{4})$', 'es-CR,en', 'PA,NI', '', NULL, '0', 0, 0, NULL, NULL),
(52, 'CS', 'SCG', 891, 'YI', 'Serbia and Montenegro', 'Serbia and Montenegro', 'Belgrade', 102350, 10829175, 'EU', '.cs', 'RSD', '381', '#####', '^(d{5})$', 'cu,hu,sq,sr', 'AL,HU,MK,RO,HR,BA,BG', '', NULL, '0', 0, 0, NULL, NULL),
(53, 'CU', 'CUB', 192, 'CU', 'Cuba', 'Cuba', 'Havana', 110860, 11423000, 'NA', '.cu', 'CUP', '53', 'CP #####', '^(?:CP)*(d{5})$', 'es-CU', 'US', '', NULL, '0', 0, 0, NULL, NULL),
(54, 'CV', 'CPV', 132, 'CV', 'Cabo Verde', 'Cape Verde', 'Praia', 4033, 508659, 'AF', '.cv', 'CVE', '238', '####', '^(d{4})$', 'pt-CV', '', '', NULL, '0', 0, 0, NULL, NULL),
(55, 'CW', 'CUW', 531, 'UC', 'Curacao', 'Curacao', ' Willemstad', 444, 141766, 'NA', '.cw', 'ANG', '599', '', '', 'nl,pap', '', '', NULL, '0', 0, 0, NULL, NULL),
(56, 'CX', 'CXR', 162, 'KT', 'Christmas Island', 'Christmas Island', 'Flying Fish Cove', 135, 1500, 'AS', '.cx', 'AUD', '61', '####', '^(d{4})$', 'en,zh,ms-CC', '', '', NULL, '0', 0, 0, NULL, NULL),
(57, 'CY', 'CYP', 196, 'CY', 'Kýpros (Kıbrıs)', 'Cyprus', 'Nicosia', 9250, 1102677, 'EU', '.cy', 'EUR', '357', '####', '^(d{4})$', 'el-CY,tr-CY,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(58, 'CZ', 'CZE', 203, 'EZ', 'Česko', 'Czech Republic', 'Prague', 78866, 10476000, 'EU', '.cz', 'CZK', '420', '### ##', '^(d{5})$', 'cs,sk', 'PL,DE,SK,AT', '', NULL, '0', 0, 0, NULL, NULL),
(59, 'DE', 'DEU', 276, 'GM', 'Deutschland', 'Germany', 'Berlin', 357021, 81802257, 'EU', '.de', 'EUR', '49', '#####', '^(d{5})$', 'de', 'CH,PL,NL,DK,BE,CZ,LU,FR,AT', '', NULL, '0', 0, 0, NULL, NULL),
(60, 'DJ', 'DJI', 262, 'DJ', 'Djibouti', 'Djibouti', 'Djibouti', 23000, 740528, 'AF', '.dj', 'DJF', '253', '', '', 'fr-DJ,ar,so-DJ,aa', 'ER,ET,SO', '', NULL, '0', 0, 0, NULL, NULL),
(61, 'DK', 'DNK', 208, 'DA', 'Danmark', 'Denmark', 'Copenhagen', 43094, 5484000, 'EU', '.dk', 'DKK', '45', '####', '^(d{4})$', 'da-DK,en,fo,de-DK', 'DE', '', NULL, '0', 0, 0, NULL, NULL),
(62, 'DM', 'DMA', 212, 'DO', 'Dominica', 'Dominica', 'Roseau', 754, 72813, 'NA', '.dm', 'XCD', '+1-767', '', '', 'en-DM', '', '', NULL, '0', 0, 0, NULL, NULL),
(63, 'DO', 'DOM', 214, 'DR', 'República Dominicana', 'Dominican Republic', 'Santo Domingo', 48730, 9823821, 'NA', '.do', 'DOP', '+809/829/849', '#####', '^(d{5})$', 'es-DO', 'HT', '', NULL, '0', 0, 0, NULL, NULL),
(64, 'DZ', 'DZA', 12, 'AG', 'Algérie', 'Algeria', 'Algiers', 2381740, 34586184, 'AF', '.dz', 'DZD', '213', '#####', '^(d{5})$', 'ar-DZ,fr', 'NE,EH,LY,MR,TN,MA,ML', '', NULL, '0', 0, 0, NULL, NULL),
(65, 'EC', 'ECU', 218, 'EC', 'Ecuador', 'Ecuador', 'Quito', 283560, 14790608, 'SA', '.ec', 'USD', '593', '@####@', '^([a-zA-Z]d{4}[a-zA-Z])$', 'es-EC', 'PE,CO', '', NULL, '0', 0, 0, NULL, NULL),
(66, 'EE', 'EST', 233, 'EN', 'Eesti', 'Estonia', 'Tallinn', 45226, 1291170, 'EU', '.ee', 'EUR', '372', '#####', '^(d{5})$', 'et,ru', 'RU,LV', '', NULL, '0', 0, 0, NULL, NULL),
(67, 'EG', 'EGY', 818, 'EG', 'Egypt', 'Egypt', 'Cairo', 1001450, 80471869, 'AF', '.eg', 'EGP', '20', '#####', '^(d{5})$', 'ar-EG,en,fr', 'LY,SD,IL,PS', '', NULL, '0', 0, 0, NULL, NULL),
(68, 'EH', 'ESH', 732, 'WI', 'aṣ-Ṣaḥrāwīyâ al-ʿArabīyâ', 'Western Sahara', 'El-Aaiun', 266000, 273008, 'AF', '.eh', 'MAD', '212', '', '', 'ar,mey', 'DZ,MR,MA', '', NULL, '0', 0, 0, NULL, NULL),
(69, 'ER', 'ERI', 232, 'ER', 'Ertrā', 'Eritrea', 'Asmara', 121320, 5792984, 'AF', '.er', 'ERN', '291', '', '', 'aa-ER,ar,tig,kun,ti-ER', 'ET,SD,DJ', '', NULL, '0', 0, 0, NULL, NULL),
(70, 'ES', 'ESP', 724, 'SP', 'España', 'Spain', 'Madrid', 504782, 46505963, 'EU', '.es', 'EUR', '34', '#####', '^(d{5})$', 'es-ES,ca,gl,eu,oc', 'AD,PT,GI,FR,MA', '', NULL, '0', 0, 0, NULL, NULL),
(71, 'ET', 'ETH', 231, 'ET', 'Ityoṗya', 'Ethiopia', 'Addis Ababa', 1127127, 88013491, 'AF', '.et', 'ETB', '251', '####', '^(d{4})$', 'am,en-ET,om-ET,ti-ET,so-ET,sid', 'ER,KE,SD,SS,SO,DJ', '', NULL, '0', 0, 0, NULL, NULL),
(72, 'FI', 'FIN', 246, 'FI', 'Suomi (Finland)', 'Finland', 'Helsinki', 337030, 5244000, 'EU', '.fi', 'EUR', '358', '#####', '^(?:FI)*(d{5})$', 'fi-FI,sv-FI,smn', 'NO,RU,SE', '', NULL, '0', 0, 0, NULL, NULL),
(73, 'FJ', 'FJI', 242, 'FJ', 'Viti', 'Fiji', 'Suva', 18270, 875983, 'OC', '.fj', 'FJD', '679', '', '', 'en-FJ,fj', '', '', NULL, '0', 0, 0, NULL, NULL),
(74, 'FK', 'FLK', 238, 'FK', 'Falkland Islands', 'Falkland Islands', 'Stanley', 12173, 2638, 'SA', '.fk', 'FKP', '500', '', '', 'en-FK', '', '', NULL, '0', 0, 0, NULL, NULL),
(75, 'FM', 'FSM', 583, 'FM', 'Micronesia', 'Micronesia', 'Palikir', 702, 107708, 'OC', '.fm', 'USD', '691', '#####', '^(d{5})$', 'en-FM,chk,pon,yap,kos,uli,woe,nkr,kpg', '', '', NULL, '0', 0, 0, NULL, NULL),
(76, 'FO', 'FRO', 234, 'FO', 'Føroyar', 'Faroe Islands', 'Torshavn', 1399, 48228, 'EU', '.fo', 'DKK', '298', 'FO-###', '^(?:FO)*(d{3})$', 'fo,da-FO', '', '', NULL, '0', 0, 0, NULL, NULL),
(77, 'FR', 'FRA', 250, 'FR', 'France', 'France', 'Paris', 547030, 64768389, 'EU', '.fr', 'EUR', '33', '#####', '^(d{5})$', 'fr-FR,frp,br,co,ca,eu,oc', 'CH,DE,BE,LU,IT,AD,MC,ES', '', NULL, '0', 0, 0, NULL, NULL),
(78, 'GA', 'GAB', 266, 'GB', 'Gabon', 'Gabon', 'Libreville', 267667, 1545255, 'AF', '.ga', 'XAF', '241', '', '', 'fr-GA', 'CM,GQ,CG', '', NULL, '0', 0, 0, NULL, NULL),
(79, 'GD', 'GRD', 308, 'GJ', 'Grenada', 'Grenada', 'St. George\'s', 344, 107818, 'NA', '.gd', 'XCD', '+1-473', '', '', 'en-GD', '', '', NULL, '0', 0, 0, NULL, NULL),
(80, 'GE', 'GEO', 268, 'GG', 'Sak\'art\'velo', 'Georgia', 'Tbilisi', 69700, 4630000, 'AS', '.ge', 'GEL', '995', '####', '^(d{4})$', 'ka,ru,hy,az', 'AM,AZ,TR,RU', '', NULL, '0', 0, 0, NULL, NULL),
(81, 'GF', 'GUF', 254, 'FG', 'Guyane', 'French Guiana', 'Cayenne', 91000, 195506, 'SA', '.gf', 'EUR', '594', '#####', '^((97|98)3d{2})$', 'fr-GF', 'SR,BR', '', NULL, '0', 0, 0, NULL, NULL),
(82, 'GG', 'GGY', 831, 'GK', 'Guernsey', 'Guernsey', 'St Peter Port', 78, 65228, 'EU', '.gg', 'GBP', '+44-1481', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,fr', '', '', NULL, '0', 0, 0, NULL, NULL),
(83, 'GH', 'GHA', 288, 'GH', 'Ghana', 'Ghana', 'Accra', 239460, 24339838, 'AF', '.gh', 'GHS', '233', '', '', 'en-GH,ak,ee,tw', 'CI,TG,BF', '', NULL, '0', 0, 0, NULL, NULL),
(84, 'GI', 'GIB', 292, 'GI', 'Gibraltar', 'Gibraltar', 'Gibraltar', 7, 27884, 'EU', '.gi', 'GIP', '350', '', '', 'en-GI,es,it,pt', 'ES', '', NULL, '0', 0, 0, NULL, NULL),
(85, 'GL', 'GRL', 304, 'GL', 'Grønland', 'Greenland', 'Nuuk', 2166086, 56375, 'NA', '.gl', 'DKK', '299', '####', '^(d{4})$', 'kl,da-GL,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(86, 'GM', 'GMB', 270, 'GA', 'Gambia', 'Gambia', 'Banjul', 11300, 1593256, 'AF', '.gm', 'GMD', '220', '', '', 'en-GM,mnk,wof,wo,ff', 'SN', '', NULL, '0', 0, 0, NULL, NULL),
(87, 'GN', 'GIN', 324, 'GV', 'Guinée', 'Guinea', 'Conakry', 245857, 10324025, 'AF', '.gn', 'GNF', '224', '', '', 'fr-GN', 'LR,SN,SL,CI,GW,ML', '', NULL, '0', 0, 0, NULL, NULL),
(88, 'GP', 'GLP', 312, 'GP', 'Guadeloupe', 'Guadeloupe', 'Basse-Terre', 1780, 443000, 'NA', '.gp', 'EUR', '590', '#####', '^((97|98)d{3})$', 'fr-GP', '', '', NULL, '0', 0, 0, NULL, NULL),
(89, 'GQ', 'GNQ', 226, 'EK', 'Guinée Equatoriale', 'Equatorial Guinea', 'Malabo', 28051, 1014999, 'AF', '.gq', 'XAF', '240', '', '', 'es-GQ,fr', 'GA,CM', '', NULL, '0', 0, 0, NULL, NULL),
(90, 'GR', 'GRC', 300, 'GR', 'Elláda', 'Greece', 'Athens', 131940, 11000000, 'EU', '.gr', 'EUR', '30', '### ##', '^(d{5})$', 'el-GR,en,fr', 'AL,MK,TR,BG', '', NULL, '0', 0, 0, NULL, NULL),
(91, 'GS', 'SGS', 239, 'SX', 'South Georgia and the South Sandwich Islands', 'South Georgia and the South Sandwich Islands', 'Grytviken', 3903, 30, 'AN', '.gs', 'GBP', '', '', '', 'en', '', '', NULL, '0', 0, 0, NULL, NULL),
(92, 'GT', 'GTM', 320, 'GT', 'Guatemala', 'Guatemala', 'Guatemala City', 108890, 13550440, 'NA', '.gt', 'GTQ', '502', '#####', '^(d{5})$', 'es-GT', 'MX,HN,BZ,SV', '', NULL, '0', 0, 0, NULL, NULL),
(93, 'GU', 'GUM', 316, 'GQ', 'Guam', 'Guam', 'Hagatna', 549, 159358, 'OC', '.gu', 'USD', '+1-671', '969##', '^(969d{2})$', 'en-GU,ch-GU', '', '', NULL, '0', 0, 0, NULL, NULL),
(94, 'GW', 'GNB', 624, 'PU', 'Guiné-Bissau', 'Guinea-Bissau', 'Bissau', 36120, 1565126, 'AF', '.gw', 'XOF', '245', '####', '^(d{4})$', 'pt-GW,pov', 'SN,GN', '', NULL, '0', 0, 0, NULL, NULL),
(95, 'GY', 'GUY', 328, 'GY', 'Guyana', 'Guyana', 'Georgetown', 214970, 748486, 'SA', '.gy', 'GYD', '592', '', '', 'en-GY', 'SR,BR,VE', '', NULL, '0', 0, 0, NULL, NULL),
(96, 'HK', 'HKG', 344, 'HK', 'Hèunggóng', 'Hong Kong', 'Hong Kong', 1092, 6898686, 'AS', '.hk', 'HKD', '852', '', '', 'zh-HK,yue,zh,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(97, 'HM', 'HMD', 334, 'HM', 'Heard Island and McDonald Islands', 'Heard Island and McDonald Islands', '', 412, 0, 'AN', '.hm', 'AUD', ' ', '', '', '', '', '', NULL, '0', 0, 0, NULL, NULL),
(98, 'HN', 'HND', 340, 'HO', 'Honduras', 'Honduras', 'Tegucigalpa', 112090, 7989415, 'NA', '.hn', 'HNL', '504', '@@####', '^([A-Z]{2}d{4})$', 'es-HN', 'GT,NI,SV', '', NULL, '0', 0, 0, NULL, NULL),
(99, 'HR', 'HRV', 191, 'HR', 'Hrvatska', 'Croatia', 'Zagreb', 56542, 4491000, 'EU', '.hr', 'HRK', '385', '#####', '^(?:HR)*(d{5})$', 'hr-HR,sr', 'HU,SI,BA,ME,RS', '', NULL, '0', 0, 0, NULL, NULL),
(100, 'HT', 'HTI', 332, 'HA', 'Haïti', 'Haiti', 'Port-au-Prince', 27750, 9648924, 'NA', '.ht', 'HTG', '509', 'HT####', '^(?:HT)*(d{4})$', 'ht,fr-HT', 'DO', '', NULL, '0', 0, 0, NULL, NULL),
(101, 'HU', 'HUN', 348, 'HU', 'Magyarország', 'Hungary', 'Budapest', 93030, 9982000, 'EU', '.hu', 'HUF', '36', '####', '^(d{4})$', 'hu-HU', 'SK,SI,RO,UA,HR,AT,RS', '', NULL, '0', 0, 0, NULL, NULL),
(102, 'ID', 'IDN', 360, 'ID', 'Indonesia', 'Indonesia', 'Jakarta', 1919440, 242968342, 'AS', '.id', 'IDR', '62', '#####', '^(d{5})$', 'id,en,nl,jv', 'PG,TL,MY', '', NULL, '0', 0, 0, NULL, NULL),
(103, 'IE', 'IRL', 372, 'EI', 'Ireland', 'Ireland', 'Dublin', 70280, 4622917, 'EU', '.ie', 'EUR', '353', '', '', 'en-IE,ga-IE', 'GB', '', NULL, '0', 0, 0, NULL, NULL),
(104, 'IL', 'ISR', 376, 'IS', 'Yiśrā\'ēl', 'Israel', 'Jerusalem', 20770, 7353985, 'AS', '.il', 'ILS', '972', '#####', '^(d{5})$', 'he,ar-IL,en-IL,', 'SY,JO,LB,EG,PS', '', NULL, '0', 0, 0, NULL, NULL),
(105, 'IM', 'IMN', 833, 'IM', 'Isle of Man', 'Isle of Man', 'Douglas, Isle of Man', 572, 75049, 'EU', '.im', 'GBP', '+44-1624', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,gv', '', '', NULL, '0', 0, 0, NULL, NULL),
(106, 'IN', 'IND', 356, 'IN', 'Bhārat', 'India', 'New Delhi', 3287590, 1173108018, 'AS', '.in', 'INR', '91', '######', '^(d{6})$', 'en-IN,hi,bn,te,mr,ta,ur,gu,kn,ml,or,pa,as,bh,sat,k', 'CN,NP,MM,BT,PK,BD', '', NULL, '0', 0, 0, NULL, NULL),
(107, 'IO', 'IOT', 86, 'IO', 'British Indian Ocean Territory', 'British Indian Ocean Territory', 'Diego Garcia', 60, 4000, 'AS', '.io', 'USD', '246', '', '', 'en-IO', '', '', NULL, '0', 0, 0, NULL, NULL),
(108, 'IQ', 'IRQ', 368, 'IZ', 'al-ʿIrāq', 'Iraq', 'Baghdad', 437072, 29671605, 'AS', '.iq', 'IQD', '964', '#####', '^(d{5})$', 'ar-IQ,ku,hy', 'SY,SA,IR,JO,TR,KW', '', NULL, '0', 0, 0, NULL, NULL),
(109, 'IR', 'IRN', 364, 'IR', 'Īrān', 'Iran', 'Tehran', 1648000, 76923300, 'AS', '.ir', 'IRR', '98', '##########', '^(d{10})$', 'fa-IR,ku', 'TM,AF,IQ,AM,PK,AZ,TR', '', NULL, '0', 0, 0, NULL, NULL),
(110, 'IS', 'ISL', 352, 'IC', 'Ísland', 'Iceland', 'Reykjavik', 103000, 308910, 'EU', '.is', 'ISK', '354', '###', '^(d{3})$', 'is,en,de,da,sv,no', '', '', NULL, '0', 0, 0, NULL, NULL),
(111, 'IT', 'ITA', 380, 'IT', 'Italia', 'Italy', 'Rome', 301230, 60340328, 'EU', '.it', 'EUR', '39', '#####', '^(d{5})$', 'it-IT,en,de-IT,fr-IT,sc,ca,co,sl', 'CH,VA,SI,SM,FR,AT', '', NULL, '0', 0, 0, NULL, NULL),
(112, 'JE', 'JEY', 832, 'JE', 'Jersey', 'Jersey', 'Saint Helier', 116, 90812, 'EU', '.je', 'GBP', '+44-1534', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,pt', '', '', NULL, '0', 0, 0, NULL, NULL),
(113, 'JM', 'JAM', 388, 'JM', 'Jamaica', 'Jamaica', 'Kingston', 10991, 2847232, 'NA', '.jm', 'JMD', '+1-876', '', '', 'en-JM', '', '', NULL, '0', 0, 0, NULL, NULL),
(114, 'JO', 'JOR', 400, 'JO', 'al-Urdun', 'Jordan', 'Amman', 92300, 6407085, 'AS', '.jo', 'JOD', '962', '#####', '^(d{5})$', 'ar-JO,en', 'SY,SA,IQ,IL,PS', '', NULL, '0', 0, 0, NULL, NULL),
(115, 'JP', 'JPN', 392, 'JA', 'Nihon', 'Japan', 'Tokyo', 377835, 127288000, 'AS', '.jp', 'JPY', '81', '###-####', '^(d{7})$', 'ja', '', '', NULL, '0', 0, 0, NULL, NULL),
(116, 'KE', 'KEN', 404, 'KE', 'Kenya', 'Kenya', 'Nairobi', 582650, 40046566, 'AF', '.ke', 'KES', '254', '#####', '^(d{5})$', 'en-KE,sw-KE', 'ET,TZ,SS,SO,UG', '', NULL, '0', 0, 0, NULL, NULL),
(117, 'KG', 'KGZ', 417, 'KG', 'Kyrgyzstan', 'Kyrgyzstan', 'Bishkek', 198500, 5508626, 'AS', '.kg', 'KGS', '996', '######', '^(d{6})$', 'ky,uz,ru', 'CN,TJ,UZ,KZ', '', NULL, '0', 0, 0, NULL, NULL),
(118, 'KH', 'KHM', 116, 'CB', 'Kambucā', 'Cambodia', 'Phnom Penh', 181040, 14453680, 'AS', '.kh', 'KHR', '855', '#####', '^(d{5})$', 'km,fr,en', 'LA,TH,VN', '', NULL, '0', 0, 0, NULL, NULL),
(119, 'KI', 'KIR', 296, 'KR', 'Kiribati', 'Kiribati', 'Tarawa', 811, 92533, 'OC', '.ki', 'AUD', '686', '', '', 'en-KI,gil', '', '', NULL, '0', 0, 0, NULL, NULL),
(120, 'KM', 'COM', 174, 'CN', 'Comores', 'Comoros', 'Moroni', 2170, 773407, 'AF', '.km', 'KMF', '269', '', '', 'ar,fr-KM', '', '', NULL, '0', 0, 0, NULL, NULL),
(121, 'KN', 'KNA', 659, 'SC', 'Saint Kitts and Nevis', 'Saint Kitts and Nevis', 'Basseterre', 261, 51134, 'NA', '.kn', 'XCD', '+1-869', '', '', 'en-KN', '', '', NULL, '0', 0, 0, NULL, NULL),
(122, 'KP', 'PRK', 408, 'KN', 'Joseon', 'North Korea', 'Pyongyang', 120540, 22912177, 'AS', '.kp', 'KPW', '850', '###-###', '^(d{6})$', 'ko-KP', 'CN,KR,RU', '', NULL, '0', 0, 0, NULL, NULL),
(123, 'KR', 'KOR', 410, 'KS', 'Hanguk', 'South Korea', 'Seoul', 98480, 48422644, 'AS', '.kr', 'KRW', '82', 'SEOUL ###-###', '^(?:SEOUL)*(d{6})$', 'ko-KR,en', 'KP', '', NULL, '0', 0, 0, NULL, NULL),
(124, 'KW', 'KWT', 414, 'KU', 'al-Kuwayt', 'Kuwait', 'Kuwait City', 17820, 2789132, 'AS', '.kw', 'KWD', '965', '#####', '^(d{5})$', 'ar-KW,en', 'SA,IQ', '', NULL, '0', 0, 0, NULL, NULL),
(125, 'KY', 'CYM', 136, 'CJ', 'Cayman Islands', 'Cayman Islands', 'George Town', 262, 44270, 'NA', '.ky', 'KYD', '+1-345', '', '', 'en-KY', '', '', NULL, '0', 0, 0, NULL, NULL),
(126, 'KZ', 'KAZ', 398, 'KZ', 'Ķazaķstan', 'Kazakhstan', 'Astana', 2717300, 15340000, 'AS', '.kz', 'KZT', '7', '######', '^(d{6})$', 'kk,ru', 'TM,CN,KG,UZ,RU', '', NULL, '0', 0, 0, NULL, NULL),
(127, 'LA', 'LAO', 418, 'LA', 'Lāw', 'Laos', 'Vientiane', 236800, 6368162, 'AS', '.la', 'LAK', '856', '#####', '^(d{5})$', 'lo,fr,en', 'CN,MM,KH,TH,VN', '', NULL, '0', 0, 0, NULL, NULL),
(128, 'LB', 'LBN', 422, 'LE', 'Lubnān', 'Lebanon', 'Beirut', 10400, 4125247, 'AS', '.lb', 'LBP', '961', '#### ####|####', '^(d{4}(d{4})?)$', 'ar-LB,fr-LB,en,hy', 'SY,IL', '', NULL, '0', 0, 0, NULL, NULL),
(129, 'LC', 'LCA', 662, 'ST', 'Saint Lucia', 'Saint Lucia', 'Castries', 616, 160922, 'NA', '.lc', 'XCD', '+1-758', '', '', 'en-LC', '', '', NULL, '0', 0, 0, NULL, NULL),
(130, 'LI', 'LIE', 438, 'LS', 'Liechtenstein', 'Liechtenstein', 'Vaduz', 160, 35000, 'EU', '.li', 'CHF', '423', '####', '^(d{4})$', 'de-LI', 'CH,AT', '', NULL, '0', 0, 0, NULL, NULL),
(131, 'LK', 'LKA', 144, 'CE', 'Šrī Laṁkā', 'Sri Lanka', 'Colombo', 65610, 21513990, 'AS', '.lk', 'LKR', '94', '#####', '^(d{5})$', 'si,ta,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(132, 'LR', 'LBR', 430, 'LI', 'Liberia', 'Liberia', 'Monrovia', 111370, 3685076, 'AF', '.lr', 'LRD', '231', '####', '^(d{4})$', 'en-LR', 'SL,CI,GN', '', NULL, '0', 0, 0, NULL, NULL),
(133, 'LS', 'LSO', 426, 'LT', 'Lesotho', 'Lesotho', 'Maseru', 30355, 1919552, 'AF', '.ls', 'LSL', '266', '###', '^(d{3})$', 'en-LS,st,zu,xh', 'ZA', '', NULL, '0', 0, 0, NULL, NULL),
(134, 'LT', 'LTU', 440, 'LH', 'Lietuva', 'Lithuania', 'Vilnius', 65200, 2944459, 'EU', '.lt', 'EUR', '370', 'LT-#####', '^(?:LT)*(d{5})$', 'lt,ru,pl', 'PL,BY,RU,LV', '', NULL, '0', 0, 0, NULL, NULL),
(135, 'LU', 'LUX', 442, 'LU', 'Lëtzebuerg', 'Luxembourg', 'Luxembourg', 2586, 497538, 'EU', '.lu', 'EUR', '352', 'L-####', '^(d{4})$', 'lb,de-LU,fr-LU', 'DE,BE,FR', '', NULL, '0', 0, 0, NULL, NULL),
(136, 'LV', 'LVA', 428, 'LG', 'Latvija', 'Latvia', 'Riga', 64589, 2217969, 'EU', '.lv', 'EUR', '371', 'LV-####', '^(?:LV)*(d{4})$', 'lv,ru,lt', 'LT,EE,BY,RU', '', NULL, '0', 0, 0, NULL, NULL),
(137, 'LY', 'LBY', 434, 'LY', 'Lībiyā', 'Libya', 'Tripolis', 1759540, 6461454, 'AF', '.ly', 'LYD', '218', '', '', 'ar-LY,it,en', 'TD,NE,DZ,SD,TN,EG', '', NULL, '0', 0, 0, NULL, NULL),
(138, 'MA', 'MAR', 504, 'MO', 'Maroc', 'Morocco', 'Rabat', 446550, 31627428, 'AF', '.ma', 'MAD', '212', '#####', '^(d{5})$', 'ar-MA,fr', 'DZ,EH,ES', '', NULL, '0', 0, 0, NULL, NULL),
(139, 'MC', 'MCO', 492, 'MN', 'Monaco', 'Monaco', 'Monaco', 2, 32965, 'EU', '.mc', 'EUR', '377', '#####', '^(d{5})$', 'fr-MC,en,it', 'FR', '', NULL, '0', 0, 0, NULL, NULL),
(140, 'MD', 'MDA', 498, 'MD', 'Moldova', 'Moldova', 'Chisinau', 33843, 4324000, 'EU', '.md', 'MDL', '373', 'MD-####', '^(?:MD)*(d{4})$', 'ro,ru,gag,tr', 'RO,UA', '', NULL, '0', 0, 0, NULL, NULL),
(141, 'ME', 'MNE', 499, 'MJ', 'Crna Gora', 'Montenegro', 'Podgorica', 14026, 666730, 'EU', '.me', 'EUR', '382', '#####', '^(d{5})$', 'sr,hu,bs,sq,hr,rom', 'AL,HR,BA,RS,XK', '', NULL, '0', 0, 0, NULL, NULL),
(142, 'MF', 'MAF', 663, 'RN', 'Saint Martin', 'Saint Martin', 'Marigot', 53, 35925, 'NA', '.gp', 'EUR', '590', '### ###', '', 'fr', 'SX', '', NULL, '0', 0, 0, NULL, NULL),
(143, 'MG', 'MDG', 450, 'MA', 'Madagascar', 'Madagascar', 'Antananarivo', 587040, 21281844, 'AF', '.mg', 'MGA', '261', '###', '^(d{3})$', 'fr-MG,mg', '', '', NULL, '0', 0, 0, NULL, NULL),
(144, 'MH', 'MHL', 584, 'RM', 'Marshall Islands', 'Marshall Islands', 'Majuro', 181, 65859, 'OC', '.mh', 'USD', '692', '', '', 'mh,en-MH', '', '', NULL, '0', 0, 0, NULL, NULL),
(145, 'MK', 'MKD', 807, 'MK', 'Makedonija', 'Macedonia', 'Skopje', 25333, 2062294, 'EU', '.mk', 'MKD', '389', '####', '^(d{4})$', 'mk,sq,tr,rmm,sr', 'AL,GR,BG,RS,XK', '', NULL, '0', 0, 0, NULL, NULL),
(146, 'ML', 'MLI', 466, 'ML', 'Mali', 'Mali', 'Bamako', 1240000, 13796354, 'AF', '.ml', 'XOF', '223', '', '', 'fr-ML,bm', 'SN,NE,DZ,CI,GN,MR,BF', '', NULL, '0', 0, 0, NULL, NULL),
(147, 'MM', 'MMR', 104, 'BM', 'Mẏanmā', 'Myanmar', 'Nay Pyi Taw', 678500, 53414374, 'AS', '.mm', 'MMK', '95', '#####', '^(d{5})$', 'my', 'CN,LA,TH,BD,IN', '', NULL, '0', 0, 0, NULL, NULL),
(148, 'MN', 'MNG', 496, 'MG', 'Mongol Uls', 'Mongolia', 'Ulan Bator', 1565000, 3086918, 'AS', '.mn', 'MNT', '976', '######', '^(d{6})$', 'mn,ru', 'CN,RU', '', NULL, '0', 0, 0, NULL, NULL),
(149, 'MO', 'MAC', 446, 'MC', 'Ngoumún', 'Macao', 'Macao', 254, 449198, 'AS', '.mo', 'MOP', '853', '', '', 'zh,zh-MO,pt', '', '', NULL, '0', 0, 0, NULL, NULL),
(150, 'MP', 'MNP', 580, 'CQ', 'Northern Mariana Islands', 'Northern Mariana Islands', 'Saipan', 477, 53883, 'OC', '.mp', 'USD', '+1-670', '', '', 'fil,tl,zh,ch-MP,en-MP', '', '', NULL, '0', 0, 0, NULL, NULL),
(151, 'MQ', 'MTQ', 474, 'MB', 'Martinique', 'Martinique', 'Fort-de-France', 1100, 432900, 'NA', '.mq', 'EUR', '596', '#####', '^(d{5})$', 'fr-MQ', '', '', NULL, '0', 0, 0, NULL, NULL),
(152, 'MR', 'MRT', 478, 'MR', 'Mauritanie', 'Mauritania', 'Nouakchott', 1030700, 3205060, 'AF', '.mr', 'MRO', '222', '', '', 'ar-MR,fuc,snk,fr,mey,wo', 'SN,DZ,EH,ML', '', NULL, '0', 0, 0, NULL, NULL),
(153, 'MS', 'MSR', 500, 'MH', 'Montserrat', 'Montserrat', 'Plymouth', 102, 9341, 'NA', '.ms', 'XCD', '+1-664', '', '', 'en-MS', '', '', NULL, '0', 0, 0, NULL, NULL),
(154, 'MT', 'MLT', 470, 'MT', 'Malta', 'Malta', 'Valletta', 316, 403000, 'EU', '.mt', 'EUR', '356', '@@@ ###|@@@ ##', '^([A-Z]{3}d{2}d?)$', 'mt,en-MT', '', '', NULL, '0', 0, 0, NULL, NULL),
(155, 'MU', 'MUS', 480, 'MP', 'Mauritius', 'Mauritius', 'Port Louis', 2040, 1294104, 'AF', '.mu', 'MUR', '230', '', '', 'en-MU,bho,fr', '', '', NULL, '0', 0, 0, NULL, NULL),
(156, 'MV', 'MDV', 462, 'MV', 'Dhivehi', 'Maldives', 'Male', 300, 395650, 'AS', '.mv', 'MVR', '960', '#####', '^(d{5})$', 'dv,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(157, 'MW', 'MWI', 454, 'MI', 'Malawi', 'Malawi', 'Lilongwe', 118480, 15447500, 'AF', '.mw', 'MWK', '265', '', '', 'ny,yao,tum,swk', 'TZ,MZ,ZM', '', NULL, '0', 0, 0, NULL, NULL),
(158, 'MX', 'MEX', 484, 'MX', 'México', 'Mexico', 'Mexico City', 1972550, 112468855, 'NA', '.mx', 'MXN', '52', '#####', '^(d{5})$', 'es-MX', 'GT,US,BZ', '', NULL, '0', 0, 0, NULL, NULL),
(159, 'MY', 'MYS', 458, 'MY', 'Malaysia', 'Malaysia', 'Kuala Lumpur', 329750, 28274729, 'AS', '.my', 'MYR', '60', '#####', '^(d{5})$', 'ms-MY,en,zh,ta,te,ml,pa,th', 'BN,TH,ID', '', NULL, '0', 0, 0, NULL, NULL),
(160, 'MZ', 'MOZ', 508, 'MZ', 'Moçambique', 'Mozambique', 'Maputo', 801590, 22061451, 'AF', '.mz', 'MZN', '258', '####', '^(d{4})$', 'pt-MZ,vmw', 'ZW,TZ,SZ,ZA,ZM,MW', '', NULL, '0', 0, 0, NULL, NULL),
(161, 'NA', 'NAM', 516, 'WA', 'Namibia', 'Namibia', 'Windhoek', 825418, 2128471, 'AF', '.na', 'NAD', '264', '', '', 'en-NA,af,de,hz,naq', 'ZA,BW,ZM,AO', '', NULL, '0', 0, 0, NULL, NULL),
(162, 'NC', 'NCL', 540, 'NC', 'Nouvelle Calédonie', 'New Caledonia', 'Noumea', 19060, 216494, 'OC', '.nc', 'XPF', '687', '#####', '^(d{5})$', 'fr-NC', '', '', NULL, '0', 0, 0, NULL, NULL),
(163, 'NE', 'NER', 562, 'NG', 'Niger', 'Niger', 'Niamey', 1267000, 15878271, 'AF', '.ne', 'XOF', '227', '####', '^(d{4})$', 'fr-NE,ha,kr,dje', 'TD,BJ,DZ,LY,BF,NG,ML', '', NULL, '0', 0, 0, NULL, NULL),
(164, 'NF', 'NFK', 574, 'NF', 'Norfolk Island', 'Norfolk Island', 'Kingston', 35, 1828, 'OC', '.nf', 'AUD', '672', '####', '^(d{4})$', 'en-NF', '', '', NULL, '0', 0, 0, NULL, NULL),
(165, 'NG', 'NGA', 566, 'NI', 'Nigeria', 'Nigeria', 'Abuja', 923768, 154000000, 'AF', '.ng', 'NGN', '234', '######', '^(d{6})$', 'en-NG,ha,yo,ig,ff', 'TD,NE,BJ,CM', '', NULL, '0', 0, 0, NULL, NULL),
(166, 'NI', 'NIC', 558, 'NU', 'Nicaragua', 'Nicaragua', 'Managua', 129494, 5995928, 'NA', '.ni', 'NIO', '505', '###-###-#', '^(d{7})$', 'es-NI,en', 'CR,HN', '', NULL, '0', 0, 0, NULL, NULL),
(167, 'NL', 'NLD', 528, 'NL', 'Nederland', 'Netherlands', 'Amsterdam', 41526, 16645000, 'EU', '.nl', 'EUR', '31', '#### @@', '^(d{4}[A-Z]{2})$', 'nl-NL,fy-NL', 'DE,BE', '', NULL, '0', 0, 0, NULL, NULL),
(168, 'NO', 'NOR', 578, 'NO', 'Norge (Noreg)', 'Norway', 'Oslo', 324220, 5009150, 'EU', '.no', 'NOK', '47', '####', '^(d{4})$', 'no,nb,nn,se,fi', 'FI,RU,SE', '', NULL, '0', 0, 0, NULL, NULL),
(169, 'NP', 'NPL', 524, 'NP', 'Nēpāl', 'Nepal', 'Kathmandu', 140800, 28951852, 'AS', '.np', 'NPR', '977', '#####', '^(d{5})$', 'ne,en', 'CN,IN', '', NULL, '0', 0, 0, NULL, NULL),
(170, 'NR', 'NRU', 520, 'NR', 'Naoero', 'Nauru', 'Yaren', 21, 10065, 'OC', '.nr', 'AUD', '674', '', '', 'na,en-NR', '', '', NULL, '0', 0, 0, NULL, NULL),
(171, 'NU', 'NIU', 570, 'NE', 'Niue', 'Niue', 'Alofi', 260, 2166, 'OC', '.nu', 'NZD', '683', '', '', 'niu,en-NU', '', '', NULL, '0', 0, 0, NULL, NULL),
(172, 'NZ', 'NZL', 554, 'NZ', 'New Zealand', 'New Zealand', 'Wellington', 268680, 4252277, 'OC', '.nz', 'NZD', '64', '####', '^(d{4})$', 'en-NZ,mi', '', '', NULL, '0', 0, 0, NULL, NULL),
(173, 'OM', 'OMN', 512, 'MU', 'ʿUmān', 'Oman', 'Muscat', 212460, 2967717, 'AS', '.om', 'OMR', '968', '###', '^(d{3})$', 'ar-OM,en,bal,ur', 'SA,YE,AE', '', NULL, '0', 0, 0, NULL, NULL),
(174, 'PA', 'PAN', 591, 'PM', 'Panamá', 'Panama', 'Panama City', 78200, 3410676, 'NA', '.pa', 'PAB', '507', '', '', 'es-PA,en', 'CR,CO', '', NULL, '0', 0, 0, NULL, NULL),
(175, 'PE', 'PER', 604, 'PE', 'Perú', 'Peru', 'Lima', 1285220, 29907003, 'SA', '.pe', 'PEN', '51', '', '', 'es-PE,qu,ay', 'EC,CL,BO,BR,CO', '', NULL, '0', 0, 0, NULL, NULL),
(176, 'PF', 'PYF', 258, 'FP', 'Polinésie Française', 'French Polynesia', 'Papeete', 4167, 270485, 'OC', '.pf', 'XPF', '689', '#####', '^((97|98)7d{2})$', 'fr-PF,ty', '', '', NULL, '0', 0, 0, NULL, NULL),
(177, 'PG', 'PNG', 598, 'PP', 'Papua New Guinea', 'Papua New Guinea', 'Port Moresby', 462840, 6064515, 'OC', '.pg', 'PGK', '675', '###', '^(d{3})$', 'en-PG,ho,meu,tpi', 'ID', '', NULL, '0', 0, 0, NULL, NULL),
(178, 'PH', 'PHL', 608, 'RP', 'Pilipinas', 'Philippines', 'Manila', 300000, 99900177, 'AS', '.ph', 'PHP', '63', '####', '^(d{4})$', 'tl,en-PH,fil', '', '', NULL, '0', 0, 0, NULL, NULL),
(179, 'PK', 'PAK', 586, 'PK', 'Pākistān', 'Pakistan', 'Islamabad', 803940, 184404791, 'AS', '.pk', 'PKR', '92', '#####', '^(d{5})$', 'ur-PK,en-PK,pa,sd,ps,brh', 'CN,AF,IR,IN', '', NULL, '0', 0, 0, NULL, NULL),
(180, 'PL', 'POL', 616, 'PL', 'Polska', 'Poland', 'Warsaw', 312685, 38500000, 'EU', '.pl', 'PLN', '48', '##-###', '^(d{5})$', 'pl', 'DE,LT,SK,CZ,BY,UA,RU', '', NULL, '0', 0, 0, NULL, NULL),
(181, 'PM', 'SPM', 666, 'SB', 'Saint Pierre and Miquelon', 'Saint Pierre and Miquelon', 'Saint-Pierre', 242, 7012, 'NA', '.pm', 'EUR', '508', '#####', '^(97500)$', 'fr-PM', '', '', NULL, '0', 0, 0, NULL, NULL),
(182, 'PN', 'PCN', 612, 'PC', 'Pitcairn', 'Pitcairn', 'Adamstown', 47, 46, 'OC', '.pn', 'NZD', '870', '', '', 'en-PN', '', '', NULL, '0', 0, 0, NULL, NULL),
(183, 'PR', 'PRI', 630, 'RQ', 'Puerto Rico', 'Puerto Rico', 'San Juan', 9104, 3916632, 'NA', '.pr', 'USD', '+1-787/1-939', '#####-####', '^(d{9})$', 'en-PR,es-PR', '', '', NULL, '0', 0, 0, NULL, NULL),
(184, 'PS', 'PSE', 275, 'WE', 'Filasṭīn', 'Palestinian Territory', 'East Jerusalem', 5970, 3800000, 'AS', '.ps', 'ILS', '970', '', '', 'ar-PS', 'JO,IL,EG', '', NULL, '0', 0, 0, NULL, NULL),
(185, 'PT', 'PRT', 620, 'PO', 'Portugal', 'Portugal', 'Lisbon', 92391, 10676000, 'EU', '.pt', 'EUR', '351', '####-###', '^(d{7})$', 'pt-PT,mwl', 'ES', '', NULL, '0', 0, 0, NULL, NULL),
(186, 'PW', 'PLW', 585, 'PS', 'Palau', 'Palau', 'Melekeok', 458, 19907, 'OC', '.pw', 'USD', '680', '96940', '^(96940)$', 'pau,sov,en-PW,tox,ja,fil,zh', '', '', NULL, '0', 0, 0, NULL, NULL),
(187, 'PY', 'PRY', 600, 'PA', 'Paraguay', 'Paraguay', 'Asuncion', 406750, 6375830, 'SA', '.py', 'PYG', '595', '####', '^(d{4})$', 'es-PY,gn', 'BO,BR,AR', '', NULL, '0', 0, 0, NULL, NULL),
(188, 'QA', 'QAT', 634, 'QA', 'Qaṭar', 'Qatar', 'Doha', 11437, 840926, 'AS', '.qa', 'QAR', '974', '', '', 'ar-QA,en', 'SA', '', NULL, '0', 0, 1, NULL, NULL),
(189, 'RE', 'REU', 638, 'RE', 'Réunion', 'Reunion', 'Saint-Denis', 2517, 776948, 'AF', '.re', 'EUR', '262', '#####', '^((97|98)(4|7|8)d{2})$', 'fr-RE', '', '', NULL, '0', 0, 0, NULL, NULL),
(190, 'RO', 'ROU', 642, 'RO', 'România', 'Romania', 'Bucharest', 237500, 21959278, 'EU', '.ro', 'RON', '40', '######', '^(d{6})$', 'ro,hu,rom', 'MD,HU,UA,BG,RS', '', NULL, '0', 0, 0, NULL, NULL),
(191, 'RS', 'SRB', 688, 'RI', 'Srbija', 'Serbia', 'Belgrade', 88361, 7344847, 'EU', '.rs', 'RSD', '381', '######', '^(d{6})$', 'sr,hu,bs,rom', 'AL,HU,MK,RO,HR,BA,BG,ME,XK', '', NULL, '0', 0, 0, NULL, NULL),
(192, 'RU', 'RUS', 643, 'RS', 'Rossija', 'Russia', 'Moscow', 17100000, 140702000, 'EU', '.ru', 'RUB', '7', '######', '^(d{6})$', 'ru,tt,xal,cau,ady,kv,ce,tyv,cv,udm,tut,mns,bua,myv', 'GE,CN,BY,UA,KZ,LV,PL,EE,LT,FI,MN,NO,AZ,KP', '', NULL, '0', 0, 0, NULL, NULL),
(193, 'RW', 'RWA', 646, 'RW', 'Rwanda', 'Rwanda', 'Kigali', 26338, 11055976, 'AF', '.rw', 'RWF', '250', '', '', 'rw,en-RW,fr-RW,sw', 'TZ,CD,BI,UG', '', NULL, '0', 0, 0, NULL, NULL),
(194, 'SA', 'SAU', 682, 'SA', 'as-Saʿūdīyâ', 'Saudi Arabia', 'Riyadh', 1960582, 25731776, 'AS', '.sa', 'SAR', '966', '#####', '^(d{5})$', 'ar-SA', 'QA,OM,IQ,YE,JO,AE,KW', '', NULL, '0', 0, 0, NULL, NULL),
(195, 'SB', 'SLB', 90, 'BP', 'Solomon Islands', 'Solomon Islands', 'Honiara', 28450, 559198, 'OC', '.sb', 'SBD', '677', '', '', 'en-SB,tpi', '', '', NULL, '0', 0, 0, NULL, NULL),
(196, 'SC', 'SYC', 690, 'SE', 'Seychelles', 'Seychelles', 'Victoria', 455, 88340, 'AF', '.sc', 'SCR', '248', '', '', 'en-SC,fr-SC', '', '', NULL, '0', 0, 0, NULL, NULL),
(197, 'SD', 'SDN', 729, 'SU', 'Sudan', 'Sudan', 'Khartoum', 1861484, 35000000, 'AF', '.sd', 'SDG', '249', '#####', '^(d{5})$', 'ar-SD,en,fia', 'SS,TD,EG,ET,ER,LY,CF', '', NULL, '0', 0, 0, NULL, NULL),
(198, 'SE', 'SWE', 752, 'SW', 'Sverige', 'Sweden', 'Stockholm', 449964, 9555893, 'EU', '.se', 'SEK', '46', '### ##', '^(?:SE)*(d{5})$', 'sv-SE,se,sma,fi-SE', 'NO,FI', '', NULL, '0', 0, 0, NULL, NULL),
(199, 'SG', 'SGP', 702, 'SN', 'xīnjiāpō', 'Singapore', 'Singapur', 693, 4701069, 'AS', '.sg', 'SGD', '65', '######', '^(d{6})$', 'cmn,en-SG,ms-SG,ta-SG,zh-SG', '', '', NULL, '0', 0, 0, NULL, NULL),
(200, 'SH', 'SHN', 654, 'SH', 'Saint Helena', 'Saint Helena', 'Jamestown', 410, 7460, 'AF', '.sh', 'SHP', '290', 'STHL 1ZZ', '^(STHL1ZZ)$', 'en-SH', '', '', NULL, '0', 0, 0, NULL, NULL),
(201, 'SI', 'SVN', 705, 'SI', 'Slovenija', 'Slovenia', 'Ljubljana', 20273, 2007000, 'EU', '.si', 'EUR', '386', '####', '^(?:SI)*(d{4})$', 'sl,sh', 'HU,IT,HR,AT', '', NULL, '0', 0, 0, NULL, NULL),
(202, 'SJ', 'SJM', 744, 'SV', 'Svalbard and Jan Mayen', 'Svalbard and Jan Mayen', 'Longyearbyen', 62049, 2550, 'EU', '.sj', 'NOK', '47', '', '', 'no,ru', '', '', NULL, '0', 0, 0, NULL, NULL),
(203, 'SK', 'SVK', 703, 'LO', 'Slovensko', 'Slovakia', 'Bratislava', 48845, 5455000, 'EU', '.sk', 'EUR', '421', '### ##', '^(d{5})$', 'sk,hu', 'PL,HU,CZ,UA,AT', '', NULL, '0', 0, 0, NULL, NULL),
(204, 'SL', 'SLE', 694, 'SL', 'Sierra Leone', 'Sierra Leone', 'Freetown', 71740, 5245695, 'AF', '.sl', 'SLL', '232', '', '', 'en-SL,men,tem', 'LR,GN', '', NULL, '0', 0, 0, NULL, NULL),
(205, 'SM', 'SMR', 674, 'SM', 'San Marino', 'San Marino', 'San Marino', 61, 31477, 'EU', '.sm', 'EUR', '378', '4789#', '^(4789d)$', 'it-SM', 'IT', '', NULL, '0', 0, 0, NULL, NULL),
(206, 'SN', 'SEN', 686, 'SG', 'Sénégal', 'Senegal', 'Dakar', 196190, 12323252, 'AF', '.sn', 'XOF', '221', '#####', '^(d{5})$', 'fr-SN,wo,fuc,mnk', 'GN,MR,GW,GM,ML', '', NULL, '0', 0, 0, NULL, NULL),
(207, 'SO', 'SOM', 706, 'SO', 'Soomaaliya', 'Somalia', 'Mogadishu', 637657, 10112453, 'AF', '.so', 'SOS', '252', '@@  #####', '^([A-Z]{2}d{5})$', 'so-SO,ar-SO,it,en-SO', 'ET,KE,DJ', '', NULL, '0', 0, 0, NULL, NULL),
(208, 'SR', 'SUR', 740, 'NS', 'Suriname', 'Suriname', 'Paramaribo', 163270, 492829, 'SA', '.sr', 'SRD', '597', '', '', 'nl-SR,en,srn,hns,jv', 'GY,BR,GF', '', NULL, '0', 0, 0, NULL, NULL),
(209, 'SS', 'SSD', 728, 'OD', 'South Sudan', 'South Sudan', 'Juba', 644329, 8260490, 'AF', '', 'SSP', '211', '', '', 'en', 'CD,CF,ET,KE,SD,UG,', '', NULL, '0', 0, 0, NULL, NULL),
(210, 'ST', 'STP', 678, 'TP', 'São Tomé e Príncipe', 'Sao Tome and Principe', 'Sao Tome', 1001, 175808, 'AF', '.st', 'STD', '239', '', '', 'pt-ST', '', '', NULL, '0', 0, 0, NULL, NULL),
(211, 'SV', 'SLV', 222, 'ES', 'El Salvador', 'El Salvador', 'San Salvador', 21040, 6052064, 'NA', '.sv', 'USD', '503', 'CP ####', '^(?:CP)*(d{4})$', 'es-SV', 'GT,HN', '', NULL, '0', 0, 0, NULL, NULL),
(212, 'SX', 'SXM', 534, 'NN', 'Sint Maarten', 'Sint Maarten', 'Philipsburg', 21, 37429, 'NA', '.sx', 'ANG', '599', '', '', 'nl,en', 'MF', '', NULL, '0', 0, 0, NULL, NULL),
(213, 'SY', 'SYR', 760, 'SY', 'Sūrīyâ', 'Syria', 'Damascus', 185180, 22198110, 'AS', '.sy', 'SYP', '963', '', '', 'ar-SY,ku,hy,arc,fr,en', 'IQ,JO,IL,TR,LB', '', NULL, '0', 0, 0, NULL, NULL),
(214, 'SZ', 'SWZ', 748, 'WZ', 'Swaziland', 'Swaziland', 'Mbabane', 17363, 1354051, 'AF', '.sz', 'SZL', '268', '@###', '^([A-Z]d{3})$', 'en-SZ,ss-SZ', 'ZA,MZ', '', NULL, '0', 0, 0, NULL, NULL),
(215, 'TC', 'TCA', 796, 'TK', 'Turks and Caicos Islands', 'Turks and Caicos Islands', 'Cockburn Town', 430, 20556, 'NA', '.tc', 'USD', '+1-649', 'TKCA 1ZZ', '^(TKCA 1ZZ)$', 'en-TC', '', '', NULL, '0', 0, 0, NULL, NULL),
(216, 'TD', 'TCD', 148, 'CD', 'Tchad', 'Chad', 'N\'Djamena', 1284000, 10543464, 'AF', '.td', 'XAF', '235', '', '', 'fr-TD,ar-TD,sre', 'NE,LY,CF,SD,CM,NG', '', NULL, '0', 0, 0, NULL, NULL),
(217, 'TF', 'ATF', 260, 'FS', 'French Southern Territories', 'French Southern Territories', 'Port-aux-Francais', 7829, 140, 'AN', '.tf', 'EUR', '', '', '', 'fr', '', '', NULL, '0', 0, 0, NULL, NULL),
(218, 'TG', 'TGO', 768, 'TO', 'Togo', 'Togo', 'Lome', 56785, 6587239, 'AF', '.tg', 'XOF', '228', '', '', 'fr-TG,ee,hna,kbp,dag,ha', 'BJ,GH,BF', '', NULL, '0', 0, 0, NULL, NULL),
(219, 'TH', 'THA', 764, 'TH', 'Prathēt tai', 'Thailand', 'Bangkok', 514000, 67089500, 'AS', '.th', 'THB', '66', '#####', '^(d{5})$', 'th,en', 'LA,MM,KH,MY', '', NULL, '0', 0, 0, NULL, NULL),
(220, 'TJ', 'TJK', 762, 'TI', 'Tojikiston', 'Tajikistan', 'Dushanbe', 143100, 7487489, 'AS', '.tj', 'TJS', '992', '######', '^(d{6})$', 'tg,ru', 'CN,AF,KG,UZ', '', NULL, '0', 0, 0, NULL, NULL),
(221, 'TK', 'TKL', 772, 'TL', 'Tokelau', 'Tokelau', '', 10, 1466, 'OC', '.tk', 'NZD', '690', '', '', 'tkl,en-TK', '', '', NULL, '0', 0, 0, NULL, NULL),
(222, 'TL', 'TLS', 626, 'TT', 'Timór Lorosa\'e', 'East Timor', 'Dili', 15007, 1154625, 'OC', '.tl', 'USD', '670', '', '', 'tet,pt-TL,id,en', 'ID', '', NULL, '0', 0, 0, NULL, NULL),
(223, 'TM', 'TKM', 795, 'TX', 'Turkmenistan', 'Turkmenistan', 'Ashgabat', 488100, 4940916, 'AS', '.tm', 'TMT', '993', '######', '^(d{6})$', 'tk,ru,uz', 'AF,IR,UZ,KZ', '', NULL, '0', 0, 0, NULL, NULL),
(224, 'TN', 'TUN', 788, 'TS', 'Tunisie', 'Tunisia', 'Tunis', 163610, 10589025, 'AF', '.tn', 'TND', '216', '####', '^(d{4})$', 'ar-TN,fr', 'DZ,LY', '', NULL, '0', 0, 0, NULL, NULL),
(225, 'TO', 'TON', 776, 'TN', 'Tonga', 'Tonga', 'Nuku\'alofa', 748, 122580, 'OC', '.to', 'TOP', '676', '', '', 'to,en-TO', '', '', NULL, '0', 0, 0, NULL, NULL),
(226, 'TR', 'TUR', 792, 'TU', 'Türkiye', 'Turkey', 'Ankara', 780580, 77804122, 'AS', '.tr', 'TRY', '90', '#####', '^(d{5})$', 'tr-TR,ku,diq,az,av', 'SY,GE,IQ,IR,GR,AM,AZ,BG', '', NULL, '0', 0, 0, NULL, NULL),
(227, 'TT', 'TTO', 780, 'TD', 'Trinidad and Tobago', 'Trinidad and Tobago', 'Port of Spain', 5128, 1228691, 'NA', '.tt', 'TTD', '+1-868', '', '', 'en-TT,hns,fr,es,zh', '', '', NULL, '0', 0, 0, NULL, NULL),
(228, 'TV', 'TUV', 798, 'TV', 'Tuvalu', 'Tuvalu', 'Funafuti', 26, 10472, 'OC', '.tv', 'AUD', '688', '', '', 'tvl,en,sm,gil', '', '', NULL, '0', 0, 0, NULL, NULL),
(229, 'TW', 'TWN', 158, 'TW', 'T\'ai2-wan1', 'Taiwan', 'Taipei', 35980, 22894384, 'AS', '.tw', 'TWD', '886', '#####', '^(d{5})$', 'zh-TW,zh,nan,hak', '', '', NULL, '0', 0, 0, NULL, NULL),
(230, 'TZ', 'TZA', 834, 'TZ', 'Tanzania', 'Tanzania', 'Dodoma', 945087, 41892895, 'AF', '.tz', 'TZS', '255', '', '', 'sw-TZ,en,ar', 'MZ,KE,CD,RW,ZM,BI,UG,MW', '', NULL, '0', 0, 0, NULL, NULL),
(231, 'UA', 'UKR', 804, 'UP', 'Ukrajina', 'Ukraine', 'Kiev', 603700, 45415596, 'EU', '.ua', 'UAH', '380', '#####', '^(d{5})$', 'uk,ru-UA,rom,pl,hu', 'PL,MD,HU,SK,BY,RO,RU', '', NULL, '0', 0, 0, NULL, NULL),
(232, 'UG', 'UGA', 800, 'UG', 'Uganda', 'Uganda', 'Kampala', 236040, 33398682, 'AF', '.ug', 'UGX', '256', '', '', 'en-UG,lg,sw,ar', 'TZ,KE,SS,CD,RW', '', NULL, '0', 0, 0, NULL, NULL),
(233, 'UK', 'GBR', 826, 'UK', 'United Kingdom', 'United Kingdom', 'London', 244820, 62348447, 'EU', '.uk', 'GBP', '44', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en-GB,cy-GB,gd', 'IE', '', NULL, '0', 0, 0, NULL, NULL),
(234, 'UM', 'UMI', 581, '', 'United States Minor Outlying Islands', 'United States Minor Outlying Islands', '', 0, 0, 'OC', '.um', 'USD', '1', '', '', 'en-UM', '', '', NULL, '0', 0, 0, NULL, NULL),
(235, 'US', 'USA', 840, 'US', 'USA', 'United States', 'Washington', 9629091, 310232863, 'NA', '.us', 'USD', '1', '#####-####', '^d{5}(-d{4})?$', 'en-US,es-US,haw,fr', 'CA,MX,CU', '', NULL, '0', 0, 0, NULL, NULL),
(236, 'UY', 'URY', 858, 'UY', 'Uruguay', 'Uruguay', 'Montevideo', 176220, 3477000, 'SA', '.uy', 'UYU', '598', '#####', '^(d{5})$', 'es-UY', 'BR,AR', '', NULL, '0', 0, 0, NULL, NULL),
(237, 'UZ', 'UZB', 860, 'UZ', 'O\'zbekiston', 'Uzbekistan', 'Tashkent', 447400, 27865738, 'AS', '.uz', 'UZS', '998', '######', '^(d{6})$', 'uz,ru,tg', 'TM,AF,KG,TJ,KZ', '', NULL, '0', 0, 0, NULL, NULL),
(238, 'VA', 'VAT', 336, 'VT', 'Vaticanum', 'Vatican', 'Vatican City', 0, 921, 'EU', '.va', 'EUR', '379', '#####', '^(d{5})$', 'la,it,fr', 'IT', '', NULL, '0', 0, 0, NULL, NULL),
(239, 'VC', 'VCT', 670, 'VC', 'Saint Vincent and the Grenadines', 'Saint Vincent and the Grenadines', 'Kingstown', 389, 104217, 'NA', '.vc', 'XCD', '+1-784', '', '', 'en-VC,fr', '', '', NULL, '0', 0, 0, NULL, NULL),
(240, 'VE', 'VEN', 862, 'VE', 'Venezuela', 'Venezuela', 'Caracas', 912050, 27223228, 'SA', '.ve', 'VEF', '58', '####', '^(d{4})$', 'es-VE', 'GY,BR,CO', '', NULL, '0', 0, 0, NULL, NULL),
(241, 'VG', 'VGB', 92, 'VI', 'British Virgin Islands', 'British Virgin Islands', 'Road Town', 153, 21730, 'NA', '.vg', 'USD', '+1-284', '', '', 'en-VG', '', '', NULL, '0', 0, 0, NULL, NULL),
(242, 'VI', 'VIR', 850, 'VQ', 'U.S. Virgin Islands', 'U.S. Virgin Islands', 'Charlotte Amalie', 352, 108708, 'NA', '.vi', 'USD', '+1-340', '#####-####', '^d{5}(-d{4})?$', 'en-VI', '', '', NULL, '0', 0, 0, NULL, NULL),
(243, 'VN', 'VNM', 704, 'VM', 'Việt Nam', 'Vietnam', 'Hanoi', 329560, 89571130, 'AS', '.vn', 'VND', '84', '######', '^(d{6})$', 'vi,en,fr,zh,km', 'CN,LA,KH', '', NULL, '0', 0, 0, NULL, NULL),
(244, 'VU', 'VUT', 548, 'NH', 'Vanuatu', 'Vanuatu', 'Port Vila', 12200, 221552, 'OC', '.vu', 'VUV', '678', '', '', 'bi,en-VU,fr-VU', '', '', NULL, '0', 0, 0, NULL, NULL),
(245, 'WF', 'WLF', 876, 'WF', 'Wallis and Futuna', 'Wallis and Futuna', 'Mata Utu', 274, 16025, 'OC', '.wf', 'XPF', '681', '#####', '^(986d{2})$', 'wls,fud,fr-WF', '', '', NULL, '0', 0, 0, NULL, NULL),
(246, 'WS', 'WSM', 882, 'WS', 'Samoa', 'Samoa', 'Apia', 2944, 192001, 'OC', '.ws', 'WST', '685', '', '', 'sm,en-WS', '', '', NULL, '0', 0, 0, NULL, NULL),
(247, 'XK', 'XKX', 0, 'KV', 'Kosovo', 'Kosovo', 'Pristina', 10908, 1800000, 'EU', '', 'EUR', '', '', '', 'sq,sr', 'RS,AL,MK,ME', '', NULL, '0', 0, 0, NULL, NULL),
(248, 'YE', 'YEM', 887, 'YM', 'al-Yaman', 'Yemen', 'Sanaa', 527970, 23495361, 'AS', '.ye', 'YER', '967', '', '', 'ar-YE', 'SA,OM', '', NULL, '0', 0, 0, NULL, NULL),
(249, 'YT', 'MYT', 175, 'MF', 'Mayotte', 'Mayotte', 'Mamoudzou', 374, 159042, 'AF', '.yt', 'EUR', '262', '#####', '^(d{5})$', 'fr-YT', '', '', NULL, '0', 0, 0, NULL, NULL),
(250, 'ZA', 'ZAF', 710, 'SF', 'South Africa', 'South Africa', 'Pretoria', 1219912, 49000000, 'AF', '.za', 'ZAR', '27', '####', '^(d{4})$', 'zu,xh,af,nso,en-ZA,tn,st,ts,ss,ve,nr', 'ZW,SZ,MZ,BW,NA,LS', '', NULL, '0', 0, 0, NULL, NULL),
(251, 'ZM', 'ZMB', 894, 'ZA', 'Zambia', 'Zambia', 'Lusaka', 752614, 13460305, 'AF', '.zm', 'ZMW', '260', '#####', '^(d{5})$', 'en-ZM,bem,loz,lun,lue,ny,toi', 'ZW,TZ,MZ,CD,NA,MW,AO', '', NULL, '0', 0, 0, NULL, NULL),
(252, 'ZW', 'ZWE', 716, 'ZI', 'Zimbabwe', 'Zimbabwe', 'Harare', 390580, 11651858, 'AF', '.zw', 'ZWL', '263', '', '', 'en-ZW,sn,nr,nd', 'ZA,MZ,BW,ZM', '', NULL, '0', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `html_entity` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'From Github : An array of currency symbols as HTML entities',
  `font_arial` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `font_code2000` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unicode_decimal` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unicode_hex` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `in_left` tinyint(1) UNSIGNED DEFAULT '0',
  `decimal_places` int(10) UNSIGNED DEFAULT '2' COMMENT 'Currency Decimal Places - ISO 4217',
  `decimal_separator` varchar(10) COLLATE utf8_unicode_ci DEFAULT '.',
  `thousand_separator` varchar(10) COLLATE utf8_unicode_ci DEFAULT ',',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `html_entity`, `font_arial`, `font_code2000`, `unicode_decimal`, `unicode_hex`, `in_left`, `decimal_places`, `decimal_separator`, `thousand_separator`, `created_at`, `updated_at`) VALUES
(119, 'QAR', 'Qatar Riyal', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 2, '.', ',', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `belongs_to` enum('posts','users') COLLATE utf8_unicode_ci NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `max` int(10) UNSIGNED DEFAULT '255',
  `default` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `required` tinyint(1) UNSIGNED DEFAULT NULL,
  `use_as_filter` tinyint(1) DEFAULT '0',
  `help` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `belongs_to`, `translation_lang`, `translation_of`, `name`, `type`, `max`, `default`, `required`, `use_as_filter`, `help`, `active`) VALUES
(1, 'posts', 'en', 1, 'Car Brand', 'select', NULL, NULL, 1, 1, NULL, 1),
(2, 'posts', 'en', 2, 'Model', 'text', NULL, NULL, 0, 0, NULL, 1),
(3, 'posts', 'en', 3, 'Year of registration', 'number', NULL, NULL, 0, 0, NULL, 1),
(4, 'posts', 'en', 4, 'Mileage', 'text', NULL, NULL, 0, 0, NULL, 1),
(5, 'posts', 'en', 5, 'Fuel Type', 'select', NULL, NULL, 0, 1, NULL, 1),
(6, 'posts', 'en', 6, 'Features', 'checkbox_multiple', NULL, NULL, 0, 1, NULL, 1),
(7, 'posts', 'en', 7, 'Resume', 'file', NULL, NULL, 1, 0, NULL, 1),
(8, 'posts', 'en', 8, 'Condition', 'select', NULL, NULL, 0, 1, NULL, 1),
(9, 'posts', 'en', 9, 'Transmission', 'radio', NULL, NULL, 0, 1, NULL, 1),
(10, 'posts', 'en', 10, 'Start Date', 'date', 50, NULL, 0, 1, NULL, 1),
(11, 'posts', 'en', 11, 'Company', 'text', 100, NULL, 1, 0, NULL, 1),
(12, 'posts', 'en', 12, 'Work Type', 'select', NULL, NULL, 1, 1, NULL, 1),
(13, 'posts', 'en', 13, 'Size', 'number', 50, NULL, 1, 1, NULL, 1),
(14, 'posts', 'en', 14, 'Rooms', 'select', NULL, NULL, 1, 1, NULL, 1),
(15, 'posts', 'en', 15, 'Building Type', 'select', NULL, NULL, 0, 1, NULL, 1),
(16, 'posts', 'en', 16, 'Parking', 'checkbox', NULL, NULL, 0, 1, NULL, 1),
(17, 'posts', 'en', 17, 'Furnished', 'radio', NULL, NULL, 0, 1, NULL, 1),
(18, 'posts', 'en', 18, 'Electronic Brand', 'select', NULL, NULL, 0, 1, NULL, 1),
(19, 'posts', 'en', 19, 'Sex', 'radio', NULL, NULL, 1, 1, NULL, 1),
(20, 'posts', 'en', 20, 'Looking for', 'checkbox_multiple', NULL, NULL, 0, 1, NULL, 1),
(21, 'posts', 'en', 21, 'Age', 'select', NULL, NULL, 1, 1, NULL, 1),
(22, 'posts', 'en', 22, 'Start date', 'date', 50, NULL, 1, 1, NULL, 1),
(23, 'posts', 'en', 23, 'End date', 'date', 50, NULL, 1, 1, NULL, 1),
(24, 'posts', 'en', 24, 'Event Address', 'text', 200, NULL, 1, 0, NULL, 1),
(49, 'posts', 'ar', 1, 'Car Brand', 'select', NULL, NULL, 1, 1, NULL, 1),
(50, 'posts', 'ar', 2, 'Model', 'text', NULL, NULL, 0, 0, NULL, 1),
(51, 'posts', 'ar', 3, 'Year of registration', 'number', NULL, NULL, 0, 0, NULL, 1),
(52, 'posts', 'ar', 4, 'Mileage', 'text', NULL, NULL, 0, 0, NULL, 1),
(53, 'posts', 'ar', 5, 'Fuel Type', 'select', NULL, NULL, 0, 1, NULL, 1),
(54, 'posts', 'ar', 6, 'Features', 'checkbox_multiple', NULL, NULL, 0, 1, NULL, 1),
(55, 'posts', 'ar', 7, 'Resume', 'file', NULL, NULL, 1, 0, NULL, 1),
(56, 'posts', 'ar', 8, 'Condition', 'select', NULL, NULL, 0, 1, NULL, 1),
(57, 'posts', 'ar', 9, 'Transmission', 'radio', NULL, NULL, 0, 1, NULL, 1),
(58, 'posts', 'ar', 10, 'Start Date', 'date', 50, NULL, 0, 1, NULL, 1),
(59, 'posts', 'ar', 11, 'Company', 'text', 100, NULL, 1, 0, NULL, 1),
(60, 'posts', 'ar', 12, 'Work Type', 'select', NULL, NULL, 1, 1, NULL, 1),
(61, 'posts', 'ar', 13, 'Size', 'number', 50, NULL, 1, 1, NULL, 1),
(62, 'posts', 'ar', 14, 'Rooms', 'select', NULL, NULL, 1, 1, NULL, 1),
(63, 'posts', 'ar', 15, 'Building Type', 'select', NULL, NULL, 0, 1, NULL, 1),
(64, 'posts', 'ar', 16, 'Parking', 'checkbox', NULL, NULL, 0, 1, NULL, 1),
(65, 'posts', 'ar', 17, 'Furnished', 'radio', NULL, NULL, 0, 1, NULL, 1),
(66, 'posts', 'ar', 18, 'Electronic Brand', 'select', NULL, NULL, 0, 1, NULL, 1),
(67, 'posts', 'ar', 19, 'Sex', 'radio', NULL, NULL, 1, 1, NULL, 1),
(68, 'posts', 'ar', 20, 'Looking for', 'checkbox_multiple', NULL, NULL, 0, 1, NULL, 1),
(69, 'posts', 'ar', 21, 'Age', 'select', NULL, NULL, 1, 1, NULL, 1),
(70, 'posts', 'ar', 22, 'Start date', 'date', 50, NULL, 1, 1, NULL, 1),
(71, 'posts', 'ar', 23, 'End date', 'date', 50, NULL, 1, 1, NULL, 1),
(72, 'posts', 'ar', 24, 'Event Address', 'text', 200, NULL, 1, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fields_options`
--

CREATE TABLE `fields_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` bigint(20) UNSIGNED DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fields_options`
--

INSERT INTO `fields_options` (`id`, `field_id`, `translation_lang`, `translation_of`, `value`, `parent_id`, `lft`, `rgt`, `depth`) VALUES
(1, 1, 'en', 1, 'BMW', NULL, NULL, NULL, NULL),
(2, 1, 'en', 2, 'Mercedes', NULL, NULL, NULL, NULL),
(3, 1, 'en', 3, 'Renault', NULL, NULL, NULL, NULL),
(4, 6, 'en', 4, 'Air conditionar', NULL, NULL, NULL, NULL),
(5, 6, 'en', 5, 'GPS', NULL, NULL, NULL, NULL),
(6, 6, 'en', 6, 'Security System', NULL, NULL, NULL, NULL),
(7, 6, 'en', 7, 'Stepney', NULL, NULL, NULL, NULL),
(8, 5, 'en', 8, 'Essence', NULL, NULL, NULL, NULL),
(9, 5, 'en', 9, 'Diesel', NULL, NULL, NULL, NULL),
(10, 1, 'en', 10, 'Toyota', NULL, NULL, NULL, NULL),
(11, 8, 'en', 11, 'New', NULL, NULL, NULL, NULL),
(12, 8, 'en', 12, 'Used', NULL, NULL, NULL, NULL),
(13, 9, 'en', 13, 'Automatic', NULL, NULL, NULL, NULL),
(14, 9, 'en', 14, 'Manual', NULL, NULL, NULL, NULL),
(15, 12, 'en', 15, 'Full-time', NULL, NULL, NULL, NULL),
(16, 12, 'en', 16, 'Part-time', NULL, NULL, NULL, NULL),
(17, 12, 'en', 17, 'Temporary', NULL, NULL, NULL, NULL),
(18, 12, 'en', 18, 'Internship', NULL, NULL, NULL, NULL),
(19, 12, 'en', 19, 'Permanent', NULL, NULL, NULL, NULL),
(20, 14, 'en', 20, '1', 0, 4, 5, 1),
(21, 14, 'en', 21, '2', 0, 6, 7, 1),
(22, 14, 'en', 22, '3', 0, 8, 9, 1),
(23, 14, 'en', 23, '4', 0, 10, 11, 1),
(24, 14, 'en', 24, '5', 0, 12, 13, 1),
(25, 14, 'en', 25, '6', 0, 14, 15, 1),
(26, 14, 'en', 26, '7', 0, 16, 17, 1),
(27, 14, 'en', 27, '8', 0, 18, 19, 1),
(28, 14, 'en', 28, '9', 0, 20, 21, 1),
(29, 14, 'en', 29, '10', 0, 22, 23, 1),
(30, 14, 'en', 30, '> 10', 0, 24, 25, 1),
(31, 15, 'en', 31, 'Apartment', NULL, NULL, NULL, NULL),
(32, 15, 'en', 32, 'House', NULL, NULL, NULL, NULL),
(33, 17, 'en', 33, 'Yes', NULL, NULL, NULL, NULL),
(34, 17, 'en', 34, 'No', NULL, NULL, NULL, NULL),
(35, 15, 'en', 35, 'Office', NULL, NULL, NULL, NULL),
(36, 15, 'en', 36, 'Store', NULL, NULL, NULL, NULL),
(37, 15, 'en', 37, 'Plot of land', NULL, NULL, NULL, NULL),
(38, 14, 'en', 38, '0', 0, 2, 3, 1),
(39, 1, 'en', 39, 'Chevrolet', NULL, NULL, NULL, NULL),
(40, 1, 'en', 40, 'Cadillac', NULL, NULL, NULL, NULL),
(41, 1, 'en', 41, 'Buick', NULL, NULL, NULL, NULL),
(42, 1, 'en', 42, 'GMC', NULL, NULL, NULL, NULL),
(43, 1, 'en', 43, 'Ford', NULL, NULL, NULL, NULL),
(44, 1, 'en', 44, 'Chrysler', NULL, NULL, NULL, NULL),
(45, 1, 'en', 45, 'Dodge', NULL, NULL, NULL, NULL),
(46, 1, 'en', 46, 'Jeep', NULL, NULL, NULL, NULL),
(47, 1, 'en', 47, 'Tesla', NULL, NULL, NULL, NULL),
(48, 1, 'en', 48, 'Lexus', NULL, NULL, NULL, NULL),
(49, 1, 'en', 49, 'Suzuki', NULL, NULL, NULL, NULL),
(50, 1, 'en', 50, 'Mazda', NULL, NULL, NULL, NULL),
(51, 1, 'en', 51, 'Honda', NULL, NULL, NULL, NULL),
(52, 1, 'en', 52, 'Acura', NULL, NULL, NULL, NULL),
(53, 1, 'en', 53, 'Mitsubishi', NULL, NULL, NULL, NULL),
(54, 1, 'en', 54, 'Nissan', NULL, NULL, NULL, NULL),
(55, 1, 'en', 55, 'Infiniti', NULL, NULL, NULL, NULL),
(56, 1, 'en', 56, 'Audi', NULL, NULL, NULL, NULL),
(57, 1, 'en', 57, 'Volkswagen', NULL, NULL, NULL, NULL),
(58, 1, 'en', 58, 'Porsche', NULL, NULL, NULL, NULL),
(59, 1, 'en', 59, 'Opel', NULL, NULL, NULL, NULL),
(60, 1, 'en', 60, 'Jaguar', NULL, NULL, NULL, NULL),
(61, 1, 'en', 61, 'Land Rover', NULL, NULL, NULL, NULL),
(62, 1, 'en', 62, 'Mini', NULL, NULL, NULL, NULL),
(63, 1, 'en', 63, 'Aston Martin', NULL, NULL, NULL, NULL),
(64, 1, 'en', 64, 'Bentley', NULL, NULL, NULL, NULL),
(65, 1, 'en', 65, 'Rolls Royce', NULL, NULL, NULL, NULL),
(66, 1, 'en', 66, 'McLaren', NULL, NULL, NULL, NULL),
(67, 1, 'en', 67, 'Fiat', NULL, NULL, NULL, NULL),
(68, 1, 'en', 68, 'Alfa Romeo', NULL, NULL, NULL, NULL),
(69, 1, 'en', 69, 'Maserati', NULL, NULL, NULL, NULL),
(70, 1, 'en', 70, 'Ferrari', NULL, NULL, NULL, NULL),
(71, 1, 'en', 71, 'Lamborghini', NULL, NULL, NULL, NULL),
(72, 1, 'en', 72, 'Pagani', NULL, NULL, NULL, NULL),
(73, 1, 'en', 73, 'Lancia', NULL, NULL, NULL, NULL),
(74, 1, 'en', 74, 'Peugeot', NULL, NULL, NULL, NULL),
(75, 1, 'en', 75, 'Citroen', NULL, NULL, NULL, NULL),
(76, 1, 'en', 76, 'Bugatti', NULL, NULL, NULL, NULL),
(77, 1, 'en', 77, 'Tata', NULL, NULL, NULL, NULL),
(78, 1, 'en', 78, 'Hyundai', NULL, NULL, NULL, NULL),
(79, 1, 'en', 79, 'Kia', NULL, NULL, NULL, NULL),
(80, 1, 'en', 80, 'Daewoo', NULL, NULL, NULL, NULL),
(81, 1, 'en', 81, 'Volvo', NULL, NULL, NULL, NULL),
(82, 1, 'en', 82, 'Saab', NULL, NULL, NULL, NULL),
(83, 1, 'en', 83, 'Lada', NULL, NULL, NULL, NULL),
(84, 1, 'en', 84, 'Volga', NULL, NULL, NULL, NULL),
(85, 1, 'en', 85, 'Zil', NULL, NULL, NULL, NULL),
(86, 1, 'en', 86, 'GAZ', NULL, NULL, NULL, NULL),
(87, 1, 'en', 87, 'Geely', NULL, NULL, NULL, NULL),
(88, 1, 'en', 88, 'Chery', NULL, NULL, NULL, NULL),
(89, 1, 'en', 89, 'Hongqi', NULL, NULL, NULL, NULL),
(90, 18, 'en', 90, 'Huawei', NULL, NULL, NULL, NULL),
(91, 18, 'en', 91, 'Lenovo', NULL, NULL, NULL, NULL),
(92, 18, 'en', 92, 'TP-Link', NULL, NULL, NULL, NULL),
(93, 18, 'en', 93, 'Xiaomi', NULL, NULL, NULL, NULL),
(94, 18, 'en', 94, 'Canon', NULL, NULL, NULL, NULL),
(95, 18, 'en', 95, 'Casio', NULL, NULL, NULL, NULL),
(96, 18, 'en', 96, 'Epson', NULL, NULL, NULL, NULL),
(97, 18, 'en', 97, 'Fuji', NULL, NULL, NULL, NULL),
(98, 18, 'en', 98, 'Funai', NULL, NULL, NULL, NULL),
(99, 18, 'en', 99, 'JVC', NULL, NULL, NULL, NULL),
(100, 18, 'en', 100, 'Nikon', NULL, NULL, NULL, NULL),
(101, 18, 'en', 101, 'Nintendo', NULL, NULL, NULL, NULL),
(102, 18, 'en', 102, 'Olympus', NULL, NULL, NULL, NULL),
(103, 18, 'en', 103, 'Panasonic', NULL, NULL, NULL, NULL),
(104, 18, 'en', 104, 'Pentax', NULL, NULL, NULL, NULL),
(105, 18, 'en', 105, 'Pioneer', NULL, NULL, NULL, NULL),
(106, 18, 'en', 106, 'Sega', NULL, NULL, NULL, NULL),
(107, 18, 'en', 107, 'Sharp', NULL, NULL, NULL, NULL),
(108, 18, 'en', 108, 'Sony', NULL, NULL, NULL, NULL),
(109, 18, 'en', 109, 'Toshiba', NULL, NULL, NULL, NULL),
(110, 18, 'en', 110, 'Daewoo', NULL, NULL, NULL, NULL),
(111, 18, 'en', 111, 'LG', NULL, NULL, NULL, NULL),
(112, 18, 'en', 112, 'Samsung', NULL, NULL, NULL, NULL),
(113, 18, 'en', 113, 'Hyundai', NULL, NULL, NULL, NULL),
(114, 18, 'en', 114, 'Kova', NULL, NULL, NULL, NULL),
(115, 18, 'en', 115, 'Acer', NULL, NULL, NULL, NULL),
(116, 18, 'en', 116, 'Asus', NULL, NULL, NULL, NULL),
(117, 18, 'en', 117, 'D-Link', NULL, NULL, NULL, NULL),
(118, 18, 'en', 118, 'Gigabyte', NULL, NULL, NULL, NULL),
(119, 18, 'en', 119, 'Beko', NULL, NULL, NULL, NULL),
(120, 18, 'en', 120, 'Nokia', NULL, NULL, NULL, NULL),
(121, 18, 'en', 121, 'Alcatel-Lucent', NULL, NULL, NULL, NULL),
(122, 18, 'en', 122, 'Bosch', NULL, NULL, NULL, NULL),
(123, 18, 'en', 123, 'Siemens', NULL, NULL, NULL, NULL),
(124, 18, 'en', 124, 'Sennheiser', NULL, NULL, NULL, NULL),
(125, 18, 'en', 125, 'Telefunken', NULL, NULL, NULL, NULL),
(126, 18, 'en', 126, 'Philips', NULL, NULL, NULL, NULL),
(127, 18, 'en', 127, 'Electrolux', NULL, NULL, NULL, NULL),
(128, 18, 'en', 128, 'Russell Hobbs', NULL, NULL, NULL, NULL),
(129, 18, 'en', 129, 'BlackBerry', NULL, NULL, NULL, NULL),
(130, 18, 'en', 130, 'Thomson', NULL, NULL, NULL, NULL),
(131, 18, 'en', 131, 'Amazon', NULL, NULL, NULL, NULL),
(132, 18, 'en', 132, 'Apple', NULL, NULL, NULL, NULL),
(133, 18, 'en', 133, 'Bose', NULL, NULL, NULL, NULL),
(134, 18, 'en', 134, 'Cisco Systems', NULL, NULL, NULL, NULL),
(135, 18, 'en', 135, 'Dell', NULL, NULL, NULL, NULL),
(136, 18, 'en', 136, 'Gateway', NULL, NULL, NULL, NULL),
(137, 18, 'en', 137, 'Google', NULL, NULL, NULL, NULL),
(138, 18, 'en', 138, 'Hewlett-Packard', NULL, NULL, NULL, NULL),
(139, 18, 'en', 139, 'IBM', NULL, NULL, NULL, NULL),
(140, 18, 'en', 140, 'Intel', NULL, NULL, NULL, NULL),
(141, 18, 'en', 141, 'Microsoft', NULL, NULL, NULL, NULL),
(142, 18, 'en', 142, 'Motorola', NULL, NULL, NULL, NULL),
(143, 18, 'en', 143, 'NVIDIA', NULL, NULL, NULL, NULL),
(144, 18, 'en', 144, 'Packard Bell', NULL, NULL, NULL, NULL),
(145, 18, 'en', 145, 'Qualcomm', NULL, NULL, NULL, NULL),
(146, 18, 'en', 146, 'Seagate', NULL, NULL, NULL, NULL),
(147, 18, 'en', 147, 'Sun Microsystems', NULL, NULL, NULL, NULL),
(148, 18, 'en', 148, 'Vizio', NULL, NULL, NULL, NULL),
(149, 18, 'en', 149, 'Western Digital', NULL, NULL, NULL, NULL),
(150, 18, 'en', 150, 'Xerox', NULL, NULL, NULL, NULL),
(151, 18, 'en', 151, 'Other', NULL, NULL, NULL, NULL),
(152, 1, 'en', 152, 'Other', NULL, NULL, NULL, NULL),
(153, 19, 'en', 153, 'man', NULL, NULL, NULL, NULL),
(154, 19, 'en', 154, 'woman', NULL, NULL, NULL, NULL),
(155, 20, 'en', 155, 'man', NULL, NULL, NULL, NULL),
(156, 20, 'en', 156, 'woman', NULL, NULL, NULL, NULL),
(157, 21, 'en', 157, '18 - 25', NULL, NULL, NULL, NULL),
(158, 21, 'en', 158, '26 - 30', NULL, NULL, NULL, NULL),
(159, 21, 'en', 159, '31 - 40', NULL, NULL, NULL, NULL),
(160, 21, 'en', 160, '41 - 50', NULL, NULL, NULL, NULL),
(161, 21, 'en', 161, '50 - 60', NULL, NULL, NULL, NULL),
(323, 1, 'ar', 1, 'BMW', NULL, NULL, NULL, NULL),
(324, 1, 'ar', 2, 'Mercedes', NULL, NULL, NULL, NULL),
(325, 1, 'ar', 3, 'Renault', NULL, NULL, NULL, NULL),
(326, 6, 'ar', 4, 'Air conditionar', NULL, NULL, NULL, NULL),
(327, 6, 'ar', 5, 'GPS', NULL, NULL, NULL, NULL),
(328, 6, 'ar', 6, 'Security System', NULL, NULL, NULL, NULL),
(329, 6, 'ar', 7, 'Stepney', NULL, NULL, NULL, NULL),
(330, 5, 'ar', 8, 'Essence', NULL, NULL, NULL, NULL),
(331, 5, 'ar', 9, 'Diesel', NULL, NULL, NULL, NULL),
(332, 1, 'ar', 10, 'Toyota', NULL, NULL, NULL, NULL),
(333, 8, 'ar', 11, 'New', NULL, NULL, NULL, NULL),
(334, 8, 'ar', 12, 'Used', NULL, NULL, NULL, NULL),
(335, 9, 'ar', 13, 'Automatic', NULL, NULL, NULL, NULL),
(336, 9, 'ar', 14, 'Manual', NULL, NULL, NULL, NULL),
(337, 12, 'ar', 15, 'Full-time', NULL, NULL, NULL, NULL),
(338, 12, 'ar', 16, 'Part-time', NULL, NULL, NULL, NULL),
(339, 12, 'ar', 17, 'Temporary', NULL, NULL, NULL, NULL),
(340, 12, 'ar', 18, 'Internship', NULL, NULL, NULL, NULL),
(341, 12, 'ar', 19, 'Permanent', NULL, NULL, NULL, NULL),
(342, 14, 'ar', 20, '1', 0, 4, 5, 1),
(343, 14, 'ar', 21, '2', 0, 6, 7, 1),
(344, 14, 'ar', 22, '3', 0, 8, 9, 1),
(345, 14, 'ar', 23, '4', 0, 10, 11, 1),
(346, 14, 'ar', 24, '5', 0, 12, 13, 1),
(347, 14, 'ar', 25, '6', 0, 14, 15, 1),
(348, 14, 'ar', 26, '7', 0, 16, 17, 1),
(349, 14, 'ar', 27, '8', 0, 18, 19, 1),
(350, 14, 'ar', 28, '9', 0, 20, 21, 1),
(351, 14, 'ar', 29, '10', 0, 22, 23, 1),
(352, 14, 'ar', 30, '> 10', 0, 24, 25, 1),
(353, 15, 'ar', 31, 'Apartment', NULL, NULL, NULL, NULL),
(354, 15, 'ar', 32, 'House', NULL, NULL, NULL, NULL),
(355, 17, 'ar', 33, 'Yes', NULL, NULL, NULL, NULL),
(356, 17, 'ar', 34, 'No', NULL, NULL, NULL, NULL),
(357, 15, 'ar', 35, 'Office', NULL, NULL, NULL, NULL),
(358, 15, 'ar', 36, 'Store', NULL, NULL, NULL, NULL),
(359, 15, 'ar', 37, 'Plot of land', NULL, NULL, NULL, NULL),
(360, 14, 'ar', 38, '0', 0, 2, 3, 1),
(361, 1, 'ar', 39, 'Chevrolet', NULL, NULL, NULL, NULL),
(362, 1, 'ar', 40, 'Cadillac', NULL, NULL, NULL, NULL),
(363, 1, 'ar', 41, 'Buick', NULL, NULL, NULL, NULL),
(364, 1, 'ar', 42, 'GMC', NULL, NULL, NULL, NULL),
(365, 1, 'ar', 43, 'Ford', NULL, NULL, NULL, NULL),
(366, 1, 'ar', 44, 'Chrysler', NULL, NULL, NULL, NULL),
(367, 1, 'ar', 45, 'Dodge', NULL, NULL, NULL, NULL),
(368, 1, 'ar', 46, 'Jeep', NULL, NULL, NULL, NULL),
(369, 1, 'ar', 47, 'Tesla', NULL, NULL, NULL, NULL),
(370, 1, 'ar', 48, 'Lexus', NULL, NULL, NULL, NULL),
(371, 1, 'ar', 49, 'Suzuki', NULL, NULL, NULL, NULL),
(372, 1, 'ar', 50, 'Mazda', NULL, NULL, NULL, NULL),
(373, 1, 'ar', 51, 'Honda', NULL, NULL, NULL, NULL),
(374, 1, 'ar', 52, 'Acura', NULL, NULL, NULL, NULL),
(375, 1, 'ar', 53, 'Mitsubishi', NULL, NULL, NULL, NULL),
(376, 1, 'ar', 54, 'Nissan', NULL, NULL, NULL, NULL),
(377, 1, 'ar', 55, 'Infiniti', NULL, NULL, NULL, NULL),
(378, 1, 'ar', 56, 'Audi', NULL, NULL, NULL, NULL),
(379, 1, 'ar', 57, 'Volkswagen', NULL, NULL, NULL, NULL),
(380, 1, 'ar', 58, 'Porsche', NULL, NULL, NULL, NULL),
(381, 1, 'ar', 59, 'Opel', NULL, NULL, NULL, NULL),
(382, 1, 'ar', 60, 'Jaguar', NULL, NULL, NULL, NULL),
(383, 1, 'ar', 61, 'Land Rover', NULL, NULL, NULL, NULL),
(384, 1, 'ar', 62, 'Mini', NULL, NULL, NULL, NULL),
(385, 1, 'ar', 63, 'Aston Martin', NULL, NULL, NULL, NULL),
(386, 1, 'ar', 64, 'Bentley', NULL, NULL, NULL, NULL),
(387, 1, 'ar', 65, 'Rolls Royce', NULL, NULL, NULL, NULL),
(388, 1, 'ar', 66, 'McLaren', NULL, NULL, NULL, NULL),
(389, 1, 'ar', 67, 'Fiat', NULL, NULL, NULL, NULL),
(390, 1, 'ar', 68, 'Alfa Romeo', NULL, NULL, NULL, NULL),
(391, 1, 'ar', 69, 'Maserati', NULL, NULL, NULL, NULL),
(392, 1, 'ar', 70, 'Ferrari', NULL, NULL, NULL, NULL),
(393, 1, 'ar', 71, 'Lamborghini', NULL, NULL, NULL, NULL),
(394, 1, 'ar', 72, 'Pagani', NULL, NULL, NULL, NULL),
(395, 1, 'ar', 73, 'Lancia', NULL, NULL, NULL, NULL),
(396, 1, 'ar', 74, 'Peugeot', NULL, NULL, NULL, NULL),
(397, 1, 'ar', 75, 'Citroen', NULL, NULL, NULL, NULL),
(398, 1, 'ar', 76, 'Bugatti', NULL, NULL, NULL, NULL),
(399, 1, 'ar', 77, 'Tata', NULL, NULL, NULL, NULL),
(400, 1, 'ar', 78, 'Hyundai', NULL, NULL, NULL, NULL),
(401, 1, 'ar', 79, 'Kia', NULL, NULL, NULL, NULL),
(402, 1, 'ar', 80, 'Daewoo', NULL, NULL, NULL, NULL),
(403, 1, 'ar', 81, 'Volvo', NULL, NULL, NULL, NULL),
(404, 1, 'ar', 82, 'Saab', NULL, NULL, NULL, NULL),
(405, 1, 'ar', 83, 'Lada', NULL, NULL, NULL, NULL),
(406, 1, 'ar', 84, 'Volga', NULL, NULL, NULL, NULL),
(407, 1, 'ar', 85, 'Zil', NULL, NULL, NULL, NULL),
(408, 1, 'ar', 86, 'GAZ', NULL, NULL, NULL, NULL),
(409, 1, 'ar', 87, 'Geely', NULL, NULL, NULL, NULL),
(410, 1, 'ar', 88, 'Chery', NULL, NULL, NULL, NULL),
(411, 1, 'ar', 89, 'Hongqi', NULL, NULL, NULL, NULL),
(412, 18, 'ar', 90, 'Huawei', NULL, NULL, NULL, NULL),
(413, 18, 'ar', 91, 'Lenovo', NULL, NULL, NULL, NULL),
(414, 18, 'ar', 92, 'TP-Link', NULL, NULL, NULL, NULL),
(415, 18, 'ar', 93, 'Xiaomi', NULL, NULL, NULL, NULL),
(416, 18, 'ar', 94, 'Canon', NULL, NULL, NULL, NULL),
(417, 18, 'ar', 95, 'Casio', NULL, NULL, NULL, NULL),
(418, 18, 'ar', 96, 'Epson', NULL, NULL, NULL, NULL),
(419, 18, 'ar', 97, 'Fuji', NULL, NULL, NULL, NULL),
(420, 18, 'ar', 98, 'Funai', NULL, NULL, NULL, NULL),
(421, 18, 'ar', 99, 'JVC', NULL, NULL, NULL, NULL),
(422, 18, 'ar', 100, 'Nikon', NULL, NULL, NULL, NULL),
(423, 18, 'ar', 101, 'Nintendo', NULL, NULL, NULL, NULL),
(424, 18, 'ar', 102, 'Olympus', NULL, NULL, NULL, NULL),
(425, 18, 'ar', 103, 'Panasonic', NULL, NULL, NULL, NULL),
(426, 18, 'ar', 104, 'Pentax', NULL, NULL, NULL, NULL),
(427, 18, 'ar', 105, 'Pioneer', NULL, NULL, NULL, NULL),
(428, 18, 'ar', 106, 'Sega', NULL, NULL, NULL, NULL),
(429, 18, 'ar', 107, 'Sharp', NULL, NULL, NULL, NULL),
(430, 18, 'ar', 108, 'Sony', NULL, NULL, NULL, NULL),
(431, 18, 'ar', 109, 'Toshiba', NULL, NULL, NULL, NULL),
(432, 18, 'ar', 110, 'Daewoo', NULL, NULL, NULL, NULL),
(433, 18, 'ar', 111, 'LG', NULL, NULL, NULL, NULL),
(434, 18, 'ar', 112, 'Samsung', NULL, NULL, NULL, NULL),
(435, 18, 'ar', 113, 'Hyundai', NULL, NULL, NULL, NULL),
(436, 18, 'ar', 114, 'Kova', NULL, NULL, NULL, NULL),
(437, 18, 'ar', 115, 'Acer', NULL, NULL, NULL, NULL),
(438, 18, 'ar', 116, 'Asus', NULL, NULL, NULL, NULL),
(439, 18, 'ar', 117, 'D-Link', NULL, NULL, NULL, NULL),
(440, 18, 'ar', 118, 'Gigabyte', NULL, NULL, NULL, NULL),
(441, 18, 'ar', 119, 'Beko', NULL, NULL, NULL, NULL),
(442, 18, 'ar', 120, 'Nokia', NULL, NULL, NULL, NULL),
(443, 18, 'ar', 121, 'Alcatel-Lucent', NULL, NULL, NULL, NULL),
(444, 18, 'ar', 122, 'Bosch', NULL, NULL, NULL, NULL),
(445, 18, 'ar', 123, 'Siemens', NULL, NULL, NULL, NULL),
(446, 18, 'ar', 124, 'Sennheiser', NULL, NULL, NULL, NULL),
(447, 18, 'ar', 125, 'Telefunken', NULL, NULL, NULL, NULL),
(448, 18, 'ar', 126, 'Philips', NULL, NULL, NULL, NULL),
(449, 18, 'ar', 127, 'Electrolux', NULL, NULL, NULL, NULL),
(450, 18, 'ar', 128, 'Russell Hobbs', NULL, NULL, NULL, NULL),
(451, 18, 'ar', 129, 'BlackBerry', NULL, NULL, NULL, NULL),
(452, 18, 'ar', 130, 'Thomson', NULL, NULL, NULL, NULL),
(453, 18, 'ar', 131, 'Amazon', NULL, NULL, NULL, NULL),
(454, 18, 'ar', 132, 'Apple', NULL, NULL, NULL, NULL),
(455, 18, 'ar', 133, 'Bose', NULL, NULL, NULL, NULL),
(456, 18, 'ar', 134, 'Cisco Systems', NULL, NULL, NULL, NULL),
(457, 18, 'ar', 135, 'Dell', NULL, NULL, NULL, NULL),
(458, 18, 'ar', 136, 'Gateway', NULL, NULL, NULL, NULL),
(459, 18, 'ar', 137, 'Google', NULL, NULL, NULL, NULL),
(460, 18, 'ar', 138, 'Hewlett-Packard', NULL, NULL, NULL, NULL),
(461, 18, 'ar', 139, 'IBM', NULL, NULL, NULL, NULL),
(462, 18, 'ar', 140, 'Intel', NULL, NULL, NULL, NULL),
(463, 18, 'ar', 141, 'Microsoft', NULL, NULL, NULL, NULL),
(464, 18, 'ar', 142, 'Motorola', NULL, NULL, NULL, NULL),
(465, 18, 'ar', 143, 'NVIDIA', NULL, NULL, NULL, NULL),
(466, 18, 'ar', 144, 'Packard Bell', NULL, NULL, NULL, NULL),
(467, 18, 'ar', 145, 'Qualcomm', NULL, NULL, NULL, NULL),
(468, 18, 'ar', 146, 'Seagate', NULL, NULL, NULL, NULL),
(469, 18, 'ar', 147, 'Sun Microsystems', NULL, NULL, NULL, NULL),
(470, 18, 'ar', 148, 'Vizio', NULL, NULL, NULL, NULL),
(471, 18, 'ar', 149, 'Western Digital', NULL, NULL, NULL, NULL),
(472, 18, 'ar', 150, 'Xerox', NULL, NULL, NULL, NULL),
(473, 18, 'ar', 151, 'Other', NULL, NULL, NULL, NULL),
(474, 1, 'ar', 152, 'Other', NULL, NULL, NULL, NULL),
(475, 19, 'ar', 153, 'man', NULL, NULL, NULL, NULL),
(476, 19, 'ar', 154, 'woman', NULL, NULL, NULL, NULL),
(477, 20, 'ar', 155, 'man', NULL, NULL, NULL, NULL),
(478, 20, 'ar', 156, 'woman', NULL, NULL, NULL, NULL),
(479, 21, 'ar', 157, '18 - 25', NULL, NULL, NULL, NULL),
(480, 21, 'ar', 158, '26 - 30', NULL, NULL, NULL, NULL),
(481, 21, 'ar', 159, '31 - 40', NULL, NULL, NULL, NULL),
(482, 21, 'ar', 160, '41 - 50', NULL, NULL, NULL, NULL),
(483, 21, 'ar', 161, '50 - 60', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `translation_lang`, `translation_of`, `name`) VALUES
(1, 'en', 1, 'Mr'),
(2, 'en', 2, 'Mrs'),
(5, 'ar', 1, 'Mr'),
(6, 'ar', 2, 'Mrs');

-- --------------------------------------------------------

--
-- Table structure for table `home_sections`
--

CREATE TABLE `home_sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `view` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `field` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `home_sections`
--

INSERT INTO `home_sections` (`id`, `method`, `name`, `value`, `view`, `field`, `parent_id`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, 'getSearchForm', 'Search Form Area', '{\"enable_form_area_customization\":\"1\",\"background_color\":null,\"background_image\":null,\"height\":null,\"parallax\":\"0\",\"hide_form\":\"0\",\"form_border_color\":null,\"form_border_width\":null,\"form_btn_background_color\":null,\"form_btn_text_color\":null,\"hide_titles\":\"0\",\"title_en\":null,\"sub_title_en\":null,\"title_ar\":null,\"sub_title_ar\":null,\"big_title_color\":null,\"sub_title_color\":null,\"hide_on_mobile\":\"0\",\"active\":\"1\"}', 'home.inc.search', NULL, 0, 0, 1, 1, 0),
(2, 'getLocations', 'Locations & Country Map', NULL, 'home.inc.locations', NULL, 0, 2, 3, 1, 0),
(3, 'getSponsoredPosts', 'Sponsored Ads', NULL, 'home.inc.featured', NULL, 0, 4, 5, 1, 1),
(4, 'getCategories', 'Categories', '{\"type_of_display\":\"c_picture_icon\",\"max_items\":null,\"show_icon\":\"1\",\"count_categories_posts\":\"1\",\"max_sub_cats\":\"3\",\"cache_expiration\":null,\"hide_on_mobile\":\"0\",\"active\":\"1\"}', 'home.inc.categories', NULL, 0, 6, 7, 1, 1),
(5, 'getLatestPosts', 'Latest Ads', NULL, 'home.inc.latest', NULL, 0, 8, 9, 1, 1),
(6, 'getStats', 'Mini Stats', NULL, 'home.inc.stats', NULL, 0, 10, 11, 1, 1),
(7, 'getTopAdvertising', 'Advertising #1', NULL, 'layouts.inc.advertising.top', NULL, 0, 12, 13, 1, 0),
(8, 'getBottomAdvertising', 'Advertising #2', NULL, 'layouts.inc.advertising.bottom', NULL, 0, 14, 15, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `abbr` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `native` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `script` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ltr',
  `russian_pluralization` tinyint(1) UNSIGNED DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `abbr`, `locale`, `name`, `native`, `flag`, `app_name`, `script`, `direction`, `russian_pluralization`, `active`, `default`, `parent_id`, `lft`, `rgt`, `depth`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'en', 'en_US', 'English', 'English', NULL, 'english', 'Latn', 'ltr', 0, 1, 1, 0, 2, 3, 0, NULL, NULL, NULL),
(2, 'ar', 'ar', 'Arabic', 'Arabic', NULL, 'arabic', NULL, 'rtl', 0, 1, 0, 0, 4, 5, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT '0',
  `parent_id` bigint(20) UNSIGNED DEFAULT '0',
  `from_user_id` bigint(20) UNSIGNED DEFAULT '0',
  `from_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_user_id` bigint(20) UNSIGNED DEFAULT '0',
  `to_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  `filename` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) UNSIGNED DEFAULT '0',
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meta_tags`
--

CREATE TABLE `meta_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `translation_of` int(10) UNSIGNED NOT NULL,
  `page` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meta_tags`
--

INSERT INTO `meta_tags` (`id`, `translation_lang`, `translation_of`, `page`, `title`, `description`, `keywords`, `active`) VALUES
(1, 'en', 1, 'home', '{app_name} - Geo Classified Ads CMS', 'Sell and Buy products and services on {app_name} in Minutes {country}. Free ads in {country}. Looking for a product or service - {country}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 0),
(2, 'en', 2, 'register', 'Sign Up - {app_name}', 'Sign Up on {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(3, 'en', 3, 'login', 'Login - {app_name}', 'Log in to {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(4, 'en', 4, 'create', 'Post Free Ads', 'Post Free Ads - {country}.', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(5, 'en', 5, 'countries', 'Free Local Classified Ads in the World', 'Welcome to {app_name} : 100% Free Ads Classified. Sell and buy near you. Simple, fast and efficient.', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(6, 'en', 6, 'contact', 'Contact Us - {app_name}', 'Contact Us - {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(7, 'en', 7, 'sitemap', 'Sitemap {app_name} - {country}', 'Sitemap {app_name} - {country}. 100% Free Ads Classified', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(8, 'en', 8, 'password', 'Lost your password? - {app_name}', 'Lost your password? - {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(9, 'en', 9, 'pricing', 'Pricing - {app_name}', 'Pricing - {app_name}', '{app_name}, {country}, pricing, free ads, classified, ads, script, app, premium ads', 0),
(19, 'ar', 1, 'home', '{app_name} - Geo Classified Ads CMS', 'Sell and Buy products and services on {app_name} in Minutes {country}. Free ads in {country}. Looking for a product or service - {country}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 0),
(20, 'ar', 2, 'register', 'Sign Up - {app_name}', 'Sign Up on {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(21, 'ar', 3, 'login', 'Login - {app_name}', 'Log in to {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(22, 'ar', 4, 'create', 'Post your Ads', 'Post your Ads - {country}.', '{app_name}, {country},  ads, classified, ads, script, app, premium ads', 1),
(23, 'ar', 5, 'countries', 'Free Local Classified Ads in the World', 'Welcome to {app_name} : 100% Free Ads Classified. Sell and buy near you. Simple, fast and efficient.', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(24, 'ar', 6, 'contact', 'Contact Us - {app_name}', 'Contact Us - {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(25, 'ar', 7, 'sitemap', 'Sitemap {app_name} - {country}', 'Sitemap {app_name} - {country}. 100% Free Ads Classified', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(26, 'ar', 8, 'password', 'Lost your password? - {app_name}', 'Lost your password? - {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(27, 'ar', 9, 'pricing', 'Pricing - {app_name}', 'Pricing - {app_name}', '{app_name}, {country}, pricing, free ads, classified, ads, script, app, premium ads', 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_id`, `model_type`) VALUES
(1, 1, 'App\\Models\\User');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'In country language',
  `short_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'In country language',
  `ribbon` enum('red','orange','green') COLLATE utf8_unicode_ci DEFAULT NULL,
  `has_badge` tinyint(1) UNSIGNED DEFAULT '0',
  `price` decimal(10,2) UNSIGNED DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `promo_duration` int(11) DEFAULT '30' COMMENT 'In days',
  `duration` int(10) UNSIGNED DEFAULT '30' COMMENT 'In days',
  `pictures_limit` int(11) DEFAULT '5',
  `description` text COLLATE utf8_unicode_ci COMMENT 'In country language',
  `facebook_ads_duration` int(10) UNSIGNED DEFAULT '0',
  `google_ads_duration` int(10) UNSIGNED DEFAULT '0',
  `twitter_ads_duration` int(10) UNSIGNED DEFAULT '0',
  `linkedin_ads_duration` int(10) UNSIGNED DEFAULT '0',
  `recommended` tinyint(1) DEFAULT '0',
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `translation_lang`, `translation_of`, `name`, `short_name`, `ribbon`, `has_badge`, `price`, `currency_code`, `promo_duration`, `duration`, `pictures_limit`, `description`, `facebook_ads_duration`, `google_ads_duration`, `twitter_ads_duration`, `linkedin_ads_duration`, `recommended`, `parent_id`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, 'en', 1, 'Regular List', 'Free', 'red', 1, '2.00', 'QAR', 0, 15, 5, NULL, 0, 0, 0, 0, 0, 0, 2, 3, 0, 1),
(2, 'en', 2, 'Top page Ad', 'Premium', 'orange', 1, '7.50', 'USD', 7, 60, 10, 'Featured on the homepage\r\nFeatured in the category', 0, 0, 0, 0, 0, 0, 4, 5, 0, 1),
(3, 'en', 3, 'Top page Ad+', 'Premium+', 'green', 1, '9.00', 'USD', 30, 120, 15, 'Featured on the homepage\r\nFeatured in the category', 0, 0, 0, 0, 0, 0, 6, 7, 0, 1),
(7, 'ar', 1, 'Regular List', 'Free', 'red', 1, '2.00', 'QAR', 0, 15, 5, NULL, 0, 0, 0, 0, 0, 0, 2, 3, 0, 1),
(8, 'ar', 2, 'Top page Ad', 'Premium', 'orange', 1, '7.50', 'USD', 7, 60, 10, 'Featured on the homepage\r\nFeatured in the category', 0, 0, 0, 0, 0, 0, 4, 5, 0, 1),
(9, 'ar', 3, 'Top page Ad+', 'Premium+', 'green', 1, '9.00', 'USD', 30, 120, 15, 'Featured on the homepage\r\nFeatured in the category', 0, 0, 0, 0, 0, 0, 6, 7, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('standard','terms','privacy','tips') COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `external_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `name_color` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_color` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_blank` tinyint(1) UNSIGNED DEFAULT '0',
  `excluded_from_footer` tinyint(1) UNSIGNED DEFAULT '0',
  `active` tinyint(1) UNSIGNED DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `translation_lang`, `translation_of`, `parent_id`, `type`, `name`, `slug`, `title`, `picture`, `content`, `external_link`, `lft`, `rgt`, `depth`, `name_color`, `title_color`, `target_blank`, `excluded_from_footer`, `active`, `created_at`, `updated_at`) VALUES
(1, 'en', 1, 0, 'terms', 'Terms', 'terms', 'Terms & Conditions', NULL, '<h4><b>Definitions</b></h4><p>Each of the terms mentioned below have in these Conditions of Sale LaraClassified Service (hereinafter the \"Conditions\") the following meanings:</p><ol><li>Announcement&nbsp;: refers to all the elements and data (visual, textual, sound, photographs, drawings), presented by an Advertiser editorial under his sole responsibility, in order to buy, rent or sell a product or service and broadcast on the Website and Mobile Site.</li><li>Advertiser&nbsp;: means any natural or legal person, a major, established in France, holds an account and having submitted an announcement, from it, on the Website. Any Advertiser must be connected to the Personal Account for deposit and or manage its ads. Ad first deposit automatically entails the establishment of a Personal Account to the Advertiser.</li><li>Personal Account&nbsp;: refers to the free space than any Advertiser must create and which it should connect from the Website to disseminate, manage and view its ads.</li><li>LaraClassified&nbsp;: means the company that publishes and operates the Website and Mobile Site {YourCompany}, registered at the Trade and Companies Register of {YourCity} under the number {YourCompany Registration Number} whose registered office is at {YourCompany Address}.</li><li>Customer Service&nbsp;: LaraClassified means the department to which the Advertiser may obtain further information. This service can be contacted via email by clicking the link on the Website and Mobile Site.</li><li>LaraClassified Service&nbsp;: LaraClassified means the services made available to Users and Advertisers on the Website and Mobile Site.</li><li>Website&nbsp;: means the website operated by LaraClassified accessed mainly from the URL <a href=\"https://bedigit.com\">https://bedigit.com</a> and allowing Users and Advertisers to access the Service via internet LaraClassified.</li><li>Mobile Site&nbsp;: is the mobile site operated by LaraClassified accessible from the URL <a href=\"https://bedigit.com\">https://bedigit.com</a> and allowing Users and Advertisers to access via their mobile phone service {YourSiteName}.</li><li>User&nbsp;: any visitor with access to LaraClassified Service via the Website and Mobile Site and Consultant Service LaraClassified accessible from different media.</li></ol><h4><b>Subject</b></h4><p>These Terms and Conditions Of Use establish the contractual conditions applicable to any subscription by an Advertiser connected to its Personal Account from the Website and Mobile Site.<br></p><h4><b>Acceptance</b></h4><p>Any use of the website by an Advertiser is full acceptance of the current Terms.<br></p><h4><b>Responsibility</b></h4><p>Responsibility for LaraClassified can not be held liable for non-performance or improper performance of due control, either because of the Advertiser, or a case of major force.<br></p><h4><b>Modification of these terms</b></h4><p>LaraClassified reserves the right, at any time, to modify all or part of the Terms and Conditions.</p><p>Advertisers are advised to consult the Terms to be aware of the changes.</p><h4><b>Miscellaneous</b></h4><p>If part of the Terms should be illegal, invalid or unenforceable for any reason whatsoever, the provisions in question would be deemed unwritten, without questioning the validity of the remaining provisions will continue to apply between Advertisers and LaraClassified.</p><p>Any complaints should be addressed to Customer Service LaraClassified.</p>', NULL, 6, 7, 1, NULL, NULL, 0, 0, 0, '2017-02-10 11:10:40', '2020-10-19 00:07:12'),
(2, 'en', 2, 0, 'privacy', 'Privacy', 'privacy', 'Privacy', NULL, '<p>Your privacy is an important part of our relationship with you. Protecting your privacy is only part of our mission to provide a secure web environment. When using our site, including our services, your information will remain strictly confidential. Contributions made on our blog or on our forum are open to public view; so please do not post any personal information in your dealings with others. We accept no liability for those actions because it is your sole responsibility to adequate and safe post content on our site. We will not share, rent or share your information with third parties.</p><p>When you visit our site, we collect technical information about your computer and how you access our website and analyze this information such as Internet Protocol (IP) address of your computer, the operating system used by your computer, the browser (eg, Chrome, Firefox, Internet Explorer or other) your computer uses, the name of your Internet service provider (ISP), the Uniform Resource Locator (URL) of the website from which you come and the URL to which you go next and certain operating metrics such as the number of times you use our website. This general information can be used to help us better understand how our site is viewed and used. We may share this general information about our site with our business partners or the general public. For example, we may share the information on the number of daily unique visitors to our site with potential corporate partners or use them for advertising purposes. This information does contain any of your personal data that can be used to contact you or identify you.</p><p>When we place links or banners to other sites of our website, please note that we do not control this kind of content or practices or privacy policies of those sites. We do not endorse or assume no responsibility for the privacy policies or information collection practices of any other website other than managed sites LaraClassified.</p><p>We use the highest security standard available to protect your identifiable information in transit to us. All data stored on our servers are protected by a secure firewall for the unauthorized use or activity can not take place. Although we make every effort to protect your personal information against loss, misuse or alteration by third parties, you should be aware that there is always a risk that low-intentioned manage to find a way to thwart our security system or that Internet transmissions could be intercepted.</p><p>We reserve the right, without notice, to change, modify, add or remove portions of our Privacy Policy at any time and from time to time. These changes will be posted publicly on our website. When you visit our website, you accept all the terms of our privacy policy. Your continued use of this website constitutes your continued agreement to these terms. If you do not agree with the terms of our privacy policy, you should cease using our website.</p>', NULL, 8, 9, 1, NULL, NULL, 0, 0, 0, '2017-02-10 11:28:37', '2020-10-19 00:07:12'),
(3, 'en', 3, 0, 'standard', 'Anti-Scam', 'anti-scam', 'Anti-Scam', NULL, '<p><b>Protect yourself against Internet fraud!</b></p><p>The vast majority of ads are posted by honest people and trust. So you can do excellent business. Despite this, it is important to follow a few common sense rules following to prevent any attempt to scam.</p><p><b>Our advices</b></p><ul><li>Doing business with people you can meet in person.</li><li>Never send money by Western Union, MoneyGram or other anonymous payment systems.</li><li>Never send money or products abroad.</li><li>Do not accept checks.</li><li>Ask about the person you\'re dealing with another confirming source name, address and telephone number.</li><li>Keep copies of all correspondence (emails, ads, letters, etc.) and details of the person.</li><li>If a deal seems too good to be true, there is every chance that this is the case. Refrain.</li></ul><p><b>Recognize attempted scam</b></p><ul><li>The majority of scams have one or more of these characteristics:</li><li>The person is abroad or traveling abroad.</li><li>The person refuses to meet you in person.</li><li>Payment is made through Western Union, Money Gram or check.</li><li>The messages are in broken language (English or French or ...).</li><li>The texts seem to be copied and pasted.</li><li>The deal seems to be too good to be true.</li></ul>', NULL, 4, 5, 1, NULL, NULL, 0, 0, 0, '2017-02-10 11:31:56', '2020-10-19 00:07:12'),
(4, 'en', 4, 0, 'standard', 'FAQ', 'faq', 'Frequently Asked Questions', NULL, '<p><b>How do I place an ad?</b></p><p>It\'s very easy to place an ad: click on the button \"Post free Ads\" above right.</p><p><b>What does it cost to advertise?</b></p><p>The publication is 100% free throughout the website.</p><p><b>If I post an ad, will I also get more spam e-mails?</b></p><p>Absolutely not because your email address is not visible on the website.</p><p><b>How long will my ad remain on the website?</b></p><p>In general, an ad is automatically deactivated from the website after 3 months. You will receive an email a week before D-Day and another on the day of deactivation. You have the ability to put them online in the following month by logging into your account on the site. After this delay, your ad will be automatically removed permanently from the website.</p><p><b>I sold my item. How do I delete my ad?</b></p><p>Once your product is sold or leased, log in to your account to remove your ad.</p>', NULL, 2, 3, 1, NULL, NULL, 0, 0, 0, '2017-02-10 11:34:56', '2020-10-19 00:07:12'),
(9, 'ar', 1, 0, 'terms', 'Terms', 'terms', 'Terms & Conditions', NULL, '<h4><b>Definitions</b></h4><p>Each of the terms mentioned below have in these Conditions of Sale LaraClassified Service (hereinafter the \"Conditions\") the following meanings:</p><ol><li>Announcement&nbsp;: refers to all the elements and data (visual, textual, sound, photographs, drawings), presented by an Advertiser editorial under his sole responsibility, in order to buy, rent or sell a product or service and broadcast on the Website and Mobile Site.</li><li>Advertiser&nbsp;: means any natural or legal person, a major, established in France, holds an account and having submitted an announcement, from it, on the Website. Any Advertiser must be connected to the Personal Account for deposit and or manage its ads. Ad first deposit automatically entails the establishment of a Personal Account to the Advertiser.</li><li>Personal Account&nbsp;: refers to the free space than any Advertiser must create and which it should connect from the Website to disseminate, manage and view its ads.</li><li>LaraClassified&nbsp;: means the company that publishes and operates the Website and Mobile Site {YourCompany}, registered at the Trade and Companies Register of {YourCity} under the number {YourCompany Registration Number} whose registered office is at {YourCompany Address}.</li><li>Customer Service&nbsp;: LaraClassified means the department to which the Advertiser may obtain further information. This service can be contacted via email by clicking the link on the Website and Mobile Site.</li><li>LaraClassified Service&nbsp;: LaraClassified means the services made available to Users and Advertisers on the Website and Mobile Site.</li><li>Website&nbsp;: means the website operated by LaraClassified accessed mainly from the URL <a href=\"https://bedigit.com\">https://bedigit.com</a> and allowing Users and Advertisers to access the Service via internet LaraClassified.</li><li>Mobile Site&nbsp;: is the mobile site operated by LaraClassified accessible from the URL <a href=\"https://bedigit.com\">https://bedigit.com</a> and allowing Users and Advertisers to access via their mobile phone service {YourSiteName}.</li><li>User&nbsp;: any visitor with access to LaraClassified Service via the Website and Mobile Site and Consultant Service LaraClassified accessible from different media.</li></ol><h4><b>Subject</b></h4><p>These Terms and Conditions Of Use establish the contractual conditions applicable to any subscription by an Advertiser connected to its Personal Account from the Website and Mobile Site.<br></p><h4><b>Acceptance</b></h4><p>Any use of the website by an Advertiser is full acceptance of the current Terms.<br></p><h4><b>Responsibility</b></h4><p>Responsibility for LaraClassified can not be held liable for non-performance or improper performance of due control, either because of the Advertiser, or a case of major force.<br></p><h4><b>Modification of these terms</b></h4><p>LaraClassified reserves the right, at any time, to modify all or part of the Terms and Conditions.</p><p>Advertisers are advised to consult the Terms to be aware of the changes.</p><h4><b>Miscellaneous</b></h4><p>If part of the Terms should be illegal, invalid or unenforceable for any reason whatsoever, the provisions in question would be deemed unwritten, without questioning the validity of the remaining provisions will continue to apply between Advertisers and LaraClassified.</p><p>Any complaints should be addressed to Customer Service LaraClassified.</p>', NULL, 6, 7, 1, NULL, NULL, 0, 0, 0, '2020-10-16 18:12:17', '2020-10-19 00:07:12'),
(10, 'ar', 2, 0, 'privacy', 'Privacy', 'privacy', 'Privacy', NULL, '<p>Your privacy is an important part of our relationship with you. Protecting your privacy is only part of our mission to provide a secure web environment. When using our site, including our services, your information will remain strictly confidential. Contributions made on our blog or on our forum are open to public view; so please do not post any personal information in your dealings with others. We accept no liability for those actions because it is your sole responsibility to adequate and safe post content on our site. We will not share, rent or share your information with third parties.</p><p>When you visit our site, we collect technical information about your computer and how you access our website and analyze this information such as Internet Protocol (IP) address of your computer, the operating system used by your computer, the browser (eg, Chrome, Firefox, Internet Explorer or other) your computer uses, the name of your Internet service provider (ISP), the Uniform Resource Locator (URL) of the website from which you come and the URL to which you go next and certain operating metrics such as the number of times you use our website. This general information can be used to help us better understand how our site is viewed and used. We may share this general information about our site with our business partners or the general public. For example, we may share the information on the number of daily unique visitors to our site with potential corporate partners or use them for advertising purposes. This information does contain any of your personal data that can be used to contact you or identify you.</p><p>When we place links or banners to other sites of our website, please note that we do not control this kind of content or practices or privacy policies of those sites. We do not endorse or assume no responsibility for the privacy policies or information collection practices of any other website other than managed sites LaraClassified.</p><p>We use the highest security standard available to protect your identifiable information in transit to us. All data stored on our servers are protected by a secure firewall for the unauthorized use or activity can not take place. Although we make every effort to protect your personal information against loss, misuse or alteration by third parties, you should be aware that there is always a risk that low-intentioned manage to find a way to thwart our security system or that Internet transmissions could be intercepted.</p><p>We reserve the right, without notice, to change, modify, add or remove portions of our Privacy Policy at any time and from time to time. These changes will be posted publicly on our website. When you visit our website, you accept all the terms of our privacy policy. Your continued use of this website constitutes your continued agreement to these terms. If you do not agree with the terms of our privacy policy, you should cease using our website.</p>', NULL, 8, 9, 1, NULL, NULL, 0, 0, 0, '2020-10-16 18:12:17', '2020-10-19 00:07:12'),
(11, 'ar', 3, 0, 'standard', 'Anti-Scam', 'anti-scam', 'Anti-Scam', NULL, '<p><b>Protect yourself against Internet fraud!</b></p><p>The vast majority of ads are posted by honest people and trust. So you can do excellent business. Despite this, it is important to follow a few common sense rules following to prevent any attempt to scam.</p><p><b>Our advices</b></p><ul><li>Doing business with people you can meet in person.</li><li>Never send money by Western Union, MoneyGram or other anonymous payment systems.</li><li>Never send money or products abroad.</li><li>Do not accept checks.</li><li>Ask about the person you\'re dealing with another confirming source name, address and telephone number.</li><li>Keep copies of all correspondence (emails, ads, letters, etc.) and details of the person.</li><li>If a deal seems too good to be true, there is every chance that this is the case. Refrain.</li></ul><p><b>Recognize attempted scam</b></p><ul><li>The majority of scams have one or more of these characteristics:</li><li>The person is abroad or traveling abroad.</li><li>The person refuses to meet you in person.</li><li>Payment is made through Western Union, Money Gram or check.</li><li>The messages are in broken language (English or French or ...).</li><li>The texts seem to be copied and pasted.</li><li>The deal seems to be too good to be true.</li></ul>', NULL, 4, 5, 1, NULL, NULL, 0, 0, 0, '2020-10-16 18:12:17', '2020-10-19 00:07:12'),
(12, 'ar', 4, 0, 'standard', 'FAQ', 'faq', 'Frequently Asked Questions', NULL, '<p><b>How do I place an ad?</b></p><p>It\'s very easy to place an ad: click on the button \"Post free Ads\" above right.</p><p><b>What does it cost to advertise?</b></p><p>The publication is 100% free throughout the website.</p><p><b>If I post an ad, will I also get more spam e-mails?</b></p><p>Absolutely not because your email address is not visible on the website.</p><p><b>How long will my ad remain on the website?</b></p><p>In general, an ad is automatically deactivated from the website after 3 months. You will receive an email a week before D-Day and another on the day of deactivation. You have the ability to put them online in the following month by logging into your account on the site. After this delay, your ad will be automatically removed permanently from the website.</p><p><b>I sold my item. How do I delete my ad?</b></p><p>Once your product is sold or leased, log in to your account to remove your ad.</p>', NULL, 2, 3, 1, NULL, NULL, 0, 0, 0, '2020-10-16 18:12:17', '2020-10-19 00:07:12');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_method_id` int(10) UNSIGNED DEFAULT '0',
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Transaction''s ID at the Provider',
  `amount` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `has_ccbox` tinyint(1) UNSIGNED DEFAULT '0',
  `is_compatible_api` tinyint(1) DEFAULT '0',
  `countries` text COLLATE utf8_unicode_ci COMMENT 'Countries codes separated by comma.',
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT '0',
  `active` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `display_name`, `description`, `has_ccbox`, `is_compatible_api`, `countries`, `lft`, `rgt`, `depth`, `parent_id`, `active`) VALUES
(1, 'paypal', 'Paypal', 'Payment with Paypal', 0, 0, 'ad,ae,af,ag,ai,al,am,an,ao,aq,ar,as,at,au,aw,ax,az,ba,bb,bd,be,bf,bg,bh,bi,bj,bl,bm,bn,bo,bq,br,bs,bt,bv,bw,by,bz,ca,cc,cd,cf,cg,ch,ci,ck,cl,cm,cn,co,cr,cs,cu,cv,cw,cx,cy,cz,de,dj,dk,dm,do,dz,ec,ee,eg,eh,er,es,et,fi,fj,fk,fm,fo,fr,ga,gd,ge,gf,gg,gh,gi,gl,gm,gn,gp,gq,gr,gs,gt,gu,gw,gy,hk,hm,hn,hr,ht,hu,id,ie,il,im,in,io,iq,ir,is,it,je,jm,jo,jp,ke,kg,kh,ki,km,kn,kp,kr,kw,ky,kz,la,lb,lc,li,lk,lr,ls,lt,lu,lv,ly,ma,mc,md,me,mf,mg,mh,mk,ml,mm,mn,mo,mp,mq,mr,ms,mt,mu,mv,mw,mx,my,mz,na,nc,ne,nf,ng,ni,nl,no,np,nr,nu,nz,om,pa,pe,pf,pg,ph,pk,pl,pm,pn,pr,ps,pt,pw,py,qa,re,ro,rs,ru,rw,sa,sb,sc,sd,se,sg,sh,si,sj,sk,sl,sm,sn,so,sr,ss,st,sv,sx,sy,sz,tc,td,tf,tg,th,tj,tk,tl,tm,tn,to,tr,tt,tv,tw,tz,ua,ug,uk,um,us,uy,uz,va,vc,ve,vg,vi,vn,vu,wf,ws,xk,ye,yt,za,zm,zw', 0, 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `updated_at`, `created_at`) VALUES
(1, 'list-permission', 'web', '2020-10-16 18:08:09', '2020-10-16 18:08:09'),
(2, 'create-permission', 'web', '2020-10-16 18:08:09', '2020-10-16 18:08:09'),
(3, 'update-permission', 'web', '2020-10-16 18:08:09', '2020-10-16 18:08:09'),
(4, 'delete-permission', 'web', '2020-10-16 18:08:10', '2020-10-16 18:08:10'),
(5, 'list-role', 'web', '2020-10-16 18:08:10', '2020-10-16 18:08:10'),
(6, 'create-role', 'web', '2020-10-16 18:08:10', '2020-10-16 18:08:10'),
(7, 'update-role', 'web', '2020-10-16 18:08:10', '2020-10-16 18:08:10'),
(8, 'delete-role', 'web', '2020-10-16 18:08:10', '2020-10-16 18:08:10'),
(9, 'access-dashboard', 'web', '2020-10-16 18:08:10', '2020-10-16 18:08:10');

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE `pictures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `active` tinyint(1) UNSIGNED DEFAULT '1' COMMENT 'Set at 0 on updating the ad',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `post_type_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(17,2) UNSIGNED DEFAULT NULL,
  `negotiable` tinyint(1) DEFAULT '0',
  `contact_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_hidden` tinyint(1) DEFAULT '0',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `lon` float DEFAULT NULL COMMENT 'longitude in decimal degrees (wgs84)',
  `lat` float DEFAULT NULL COMMENT 'latitude in decimal degrees (wgs84)',
  `ip_addr` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visits` int(10) UNSIGNED DEFAULT '0',
  `email_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tmp_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified_email` tinyint(1) DEFAULT '0',
  `verified_phone` tinyint(1) UNSIGNED DEFAULT '1',
  `is_permanent` tinyint(1) DEFAULT '0',
  `reviewed` tinyint(1) UNSIGNED DEFAULT '0',
  `featured` tinyint(1) UNSIGNED DEFAULT '0',
  `archived` tinyint(1) UNSIGNED DEFAULT '0',
  `archived_at` timestamp NULL DEFAULT NULL,
  `archived_manually` tinyint(1) UNSIGNED DEFAULT '0',
  `deletion_mail_sent_at` timestamp NULL DEFAULT NULL,
  `fb_profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `partner` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_types`
--

CREATE TABLE `post_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post_types`
--

INSERT INTO `post_types` (`id`, `translation_lang`, `translation_of`, `name`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, 'en', 1, 'Private individual', NULL, NULL, NULL, 1),
(2, 'en', 2, 'Professional', NULL, NULL, NULL, 1),
(5, 'ar', 1, 'Private individual', NULL, NULL, NULL, 1),
(6, 'ar', 2, 'Professional', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_values`
--

CREATE TABLE `post_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `option_id` bigint(20) UNSIGNED DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_types`
--

CREATE TABLE `report_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `report_types`
--

INSERT INTO `report_types` (`id`, `translation_lang`, `translation_of`, `name`) VALUES
(1, 'en', 1, 'Fraud'),
(2, 'en', 2, 'Duplicate'),
(3, 'en', 3, 'Spam'),
(4, 'en', 4, 'Wrong category'),
(5, 'en', 5, 'Other'),
(11, 'ar', 1, 'Fraud'),
(12, 'ar', 2, 'Duplicate'),
(13, 'ar', 3, 'Spam'),
(14, 'ar', 4, 'Wrong category'),
(15, 'ar', 5, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `updated_at`, `created_at`) VALUES
(1, 'super-admin', 'web', '2020-10-16 18:08:09', '2020-10-16 18:08:09');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(7, 1),
(8, 1),
(9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `saved_posts`
--

CREATE TABLE `saved_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saved_search`
--

CREATE TABLE `saved_search` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'To show',
  `query` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payload` text COLLATE utf8_unicode_ci,
  `last_activity` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(250) COLLATE utf8_unicode_ci DEFAULT '',
  `user_agent` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field` text COLLATE utf8_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `name`, `value`, `description`, `field`, `parent_id`, `lft`, `rgt`, `depth`, `active`, `created_at`, `updated_at`) VALUES
(1, 'app', 'Application', '{\"purchase_code\":\"fa08d61b-350c-096e-a1df-40a7dcbe5613\",\"app_name\":\"\\u062f\\u0648\\u062d\\u0629 \\u0633\\u064a\\u0644\",\"slogan\":\"\\u0627\\u0634\\u0631\\u064a \\u0648\\u0628\\u064a\\u0639\",\"logo\":\"app\\/logo\\/logo-5f8dbb6571e99.png\",\"favicon\":\"app\\/ico\\/ico-5f8db9479a5e6.png\",\"email\":\"admin@doha4sale.com\",\"phone_number\":null,\"auto_detect_language\":\"1\",\"default_date_format\":\"%d %B %Y\",\"default_datetime_format\":\"%d %B %Y %H:%M\",\"default_timezone\":\"America\\/New_York\",\"date_force_utf8\":\"0\",\"logo_dark\":\"app\\/backend\\/logo-dark-5f8db9479c706.png\",\"logo_light\":\"app\\/backend\\/logo-light-5f8db9479e38d.png\",\"vector_charts_type\":\"morris_bar\",\"latest_entries_limit\":\"5\",\"show_countries_charts\":\"1\"}', 'Application Setup', NULL, 0, 2, 3, 1, 1, NULL, NULL),
(2, 'style', 'Style', '{\"app_skin\":\"skin-green\",\"body_background_color\":null,\"body_text_color\":null,\"body_background_image\":null,\"body_background_image_fixed\":\"0\",\"page_width\":null,\"title_color\":null,\"progress_background_color\":null,\"link_color\":null,\"link_color_hover\":null,\"header_sticky\":\"0\",\"header_height\":null,\"header_background_color\":null,\"header_bottom_border_width\":null,\"header_bottom_border_color\":\"#E8E8E8\",\"header_link_color\":null,\"header_link_color_hover\":null,\"footer_background_color\":null,\"footer_text_color\":null,\"footer_title_color\":null,\"footer_link_color\":null,\"footer_link_color_hover\":null,\"payment_icon_top_border_width\":null,\"payment_icon_top_border_color\":null,\"payment_icon_bottom_border_width\":null,\"payment_icon_bottom_border_color\":null,\"btn_post_bg_top_color\":null,\"btn_post_bg_bottom_color\":null,\"btn_post_border_color\":null,\"btn_post_text_color\":null,\"btn_post_bg_top_color_hover\":null,\"btn_post_bg_bottom_color_hover\":null,\"btn_post_border_color_hover\":null,\"btn_post_text_color_hover\":null,\"custom_css\":null,\"login_bg_image\":\"app\\/backend\\/login-bg-image-5f8db9fbda3e2.png\",\"admin_logo_bg\":\"skin3\",\"admin_navbar_bg\":\"skin6\",\"admin_sidebar_type\":\"full\",\"admin_sidebar_bg\":\"skin5\",\"admin_sidebar_position\":\"1\",\"admin_header_position\":\"1\",\"admin_boxed_layout\":\"0\",\"admin_dark_theme\":\"0\"}', 'Style Customization', NULL, 0, 4, 5, 1, 1, NULL, NULL),
(3, 'listing', 'Listing & Search', NULL, 'Listing & Search Options', NULL, 0, 6, 7, 1, 1, NULL, NULL),
(4, 'single', 'Ads (Form & Single Page)', '{\"publication_form_type\":\"1\",\"picture_mandatory\":\"1\",\"pictures_limit\":\"5\",\"tags_limit\":\"15\",\"guests_can_post_ads\":\"0\",\"posts_review_activation\":\"0\",\"permanent_posts_enabled\":\"4\",\"pricing_page_enabled\":\"0\",\"auto_registration\":\"0\",\"wysiwyg_editor\":\"tinymce\",\"remove_url_before\":\"1\",\"remove_url_after\":\"1\",\"remove_email_before\":\"1\",\"remove_email_after\":\"1\",\"remove_phone_before\":\"1\",\"remove_phone_after\":\"1\",\"convert_phone_number_to_img\":\"0\",\"hide_phone_number\":\"2\",\"show_security_tips\":\"1\",\"enable_whatsapp_btn\":\"1\",\"pre_filled_whatsapp_message\":\"1\",\"guests_can_contact_ads_authors\":\"1\",\"similar_posts\":\"1\",\"show_post_on_googlemap\":\"1\",\"activation_facebook_comments\":\"1\"}', 'Ads (Form & Single Page) Options', NULL, 0, 8, 9, 1, 1, NULL, NULL),
(5, 'mail', 'Mail', '{\"driver\":\"smtp\",\"host\":\"https:\\/\\/mail.doha4sale.com\",\"port\":\"2080\",\"username\":\"e:\\tnoreplay@doha4sale.com\",\"password\":\"interchange123\",\"encryption\":null,\"mailgun_domain\":\"sandbox181a3826ebe64d71b3fb94347a4f14e1.mailgun.org\",\"mailgun_secret\":\"01814fff3756f40e8cc9c58230c2dde3-2fbe671d-addd48aa\",\"mailgun_endpoint\":\"api.mailgun.net\",\"postmark_token\":null,\"ses_key\":null,\"ses_secret\":null,\"ses_region\":null,\"mandrill_secret\":null,\"sparkpost_secret\":null,\"sendmail_path\":\"\\/usr\\/sbin\\/sendmail -bs\",\"email_sender\":\"noreplay@doha4sale.com\",\"email_verification\":\"1\",\"confirmation\":\"1\",\"admin_notification\":\"1\",\"payment_notification\":\"1\"}', 'Mail Sending Configuration', NULL, 0, 10, 11, 1, 1, NULL, NULL),
(6, 'sms', 'SMS', '{\"driver\":\"twilio\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_account_sid\":\"ACdc3b97bf49ec9556126cbdfe3a845450\",\"twilio_auth_token\":\"f03178c2b7aced90ab01de7acf21d1d8\",\"twilio_from\":null,\"phone_verification\":\"1\",\"message_activation\":\"1\"}', 'SMS Sending Configuration', NULL, 0, 12, 13, 1, 1, NULL, NULL),
(7, 'upload', 'Upload', '{\"file_types\":\"pdf,doc,docx,word,rtf,rtx,ppt,pptx,odt,odp,wps,jpeg,jpg,bmp,png\",\"min_file_size\":\"0\",\"max_file_size\":\"2500\",\"image_types\":\"jpg,jpeg,gif,png\",\"image_quality\":\"100\",\"min_image_size\":\"0\",\"max_image_size\":\"3500\",\"img_resize_width\":\"1500\",\"img_resize_height\":\"1500\",\"img_resize_ratio\":\"1\",\"img_resize_upsize\":\"0\",\"img_resize_logo_width\":\"500\",\"img_resize_logo_height\":\"100\",\"img_resize_logo_ratio\":\"1\",\"img_resize_logo_upsize\":\"0\",\"img_resize_cat_width\":\"70\",\"img_resize_cat_height\":\"70\",\"img_resize_cat_ratio\":\"1\",\"img_resize_cat_upsize\":\"0\",\"img_resize_small_resize_type\":\"2\",\"img_resize_small_width\":\"120\",\"img_resize_small_height\":\"90\",\"img_resize_small_ratio\":\"1\",\"img_resize_small_upsize\":\"0\",\"img_resize_small_position\":\"center\",\"img_resize_small_relative\":\"0\",\"img_resize_small_bg_color\":\"#FFFFFF\",\"img_resize_medium_resize_type\":\"2\",\"img_resize_medium_width\":\"320\",\"img_resize_medium_height\":\"240\",\"img_resize_medium_ratio\":\"1\",\"img_resize_medium_upsize\":\"0\",\"img_resize_medium_position\":\"center\",\"img_resize_medium_relative\":\"0\",\"img_resize_medium_bg_color\":\"#FFFFFF\",\"img_resize_big_resize_type\":\"0\",\"img_resize_big_width\":\"816\",\"img_resize_big_height\":\"460\",\"img_resize_big_ratio\":\"1\",\"img_resize_big_upsize\":\"0\",\"img_resize_big_position\":\"center\",\"img_resize_big_relative\":\"0\",\"img_resize_big_bg_color\":\"#FFFFFF\"}', 'Upload Settings', NULL, 0, 14, 15, 1, 1, NULL, NULL),
(8, 'geo_location', 'Geo Location', '{\"geolocation_activation\":\"0\",\"default_country_code\":\"QA\",\"country_flag_activation\":\"1\",\"local_currency_packages_activation\":\"1\"}', 'Geo Location Configuration', NULL, 0, 16, 17, 1, 1, NULL, NULL),
(9, 'security', 'Security', '{\"login_open_in_modal\":\"1\",\"login_max_attempts\":\"5\",\"login_decay_minutes\":\"15\",\"recaptcha_activation\":\"1\",\"recaptcha_site_key\":\"6LdwYNgZAAAAAFfCPHXrNrNz_pYpe5xAUp_fcZ4L\",\"recaptcha_secret_key\":\"6LdwYNgZAAAAAEYJW92P9-mnfu_AFU632wRORT_7\",\"recaptcha_version\":\"v2\",\"recaptcha_skip_ips\":null}', 'Security Options', NULL, 0, 18, 19, 1, 1, NULL, NULL),
(10, 'social_auth', 'Social Login', NULL, 'Social Network Login', NULL, 0, 20, 21, 1, 1, NULL, NULL),
(11, 'social_link', 'Social Network', NULL, 'Social Network Profiles', NULL, 0, 22, 23, 1, 1, NULL, NULL),
(12, 'optimization', 'Optimization', NULL, 'Optimization Tools', NULL, 0, 24, 25, 1, 1, NULL, NULL),
(13, 'seo', 'SEO', '{\"google_site_verification\":null,\"alexa_verify_id\":null,\"msvalidate\":null,\"yandex_verification\":null,\"twitter_username\":null,\"robots_txt\":\"User-agent: *\\r\\nDisallow:\\r\\n\\r\\nAllow: \\/\\r\\n\\r\\nUser-agent: *\\r\\nDisallow: \\/admin\\/\\r\\nDisallow: \\/ajax\\/\\r\\nDisallow: \\/assets\\/\\r\\nDisallow: \\/css\\/\\r\\nDisallow: \\/js\\/\\r\\nDisallow: \\/vendor\\/\\r\\nDisallow: \\/main.php\\r\\nDisallow: \\/mix-manifest.json\",\"robots_txt_sm_indexes\":\"1\",\"no_index_categories\":\"0\",\"no_index_tags\":\"0\",\"no_index_cities\":\"0\",\"no_index_users\":\"0\",\"no_index_post_report\":\"0\",\"no_index_all\":\"0\",\"posts_permalink\":\"{slug}\\/{id}\",\"posts_permalink_ext\":null,\"multi_countries_urls\":\"1\"}', 'SEO Tools', NULL, 0, 26, 27, 1, 1, NULL, NULL),
(14, 'other', 'Others', NULL, 'Other Options', NULL, 0, 28, 29, 1, 1, NULL, NULL),
(15, 'cron', 'Cron', NULL, 'Cron Job', NULL, 0, 30, 31, 1, 1, NULL, NULL),
(16, 'footer', 'Footer', '{\"hide_links\":\"1\",\"hide_payment_plugins_logos\":\"1\",\"hide_powered_by\":\"1\",\"powered_by_info\":null,\"tracking_code\":null}', 'Pages Footer', NULL, 0, 32, 33, 1, 1, NULL, NULL),
(17, 'backup', 'Backup', '{\"storage_disk\":\"0\",\"backup_all\":\"1\",\"backup_frequency_all\":\"0\",\"backup_database\":\"1\",\"backup_frequency_database\":\"0\",\"backup_files\":\"1\",\"backup_frequency_files\":\"0\",\"backup_languages\":\"1\",\"backup_frequency_languages\":\"0\",\"backup_cleanup_keep_days\":\"7\",\"backup_cleanup_dobwummt\":\"5000\"}', 'Backup Configuration', NULL, 0, 34, 35, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subadmin1`
--

CREATE TABLE `subadmin1` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `asciiname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subadmin1`
--

INSERT INTO `subadmin1` (`id`, `code`, `country_code`, `name`, `asciiname`, `active`) VALUES
(1, 'QA.08', 'QA', 'Madīnat ash Shamāl', 'Madinat ash Shamal', 1),
(2, 'QA.04', 'QA', 'Al Khor', 'Al Khor', 1),
(3, 'QA.09', 'QA', 'Baladīyat Umm Şalāl', 'Baladiyat Umm Salal', 1),
(4, 'QA.06', 'QA', 'Baladīyat ar Rayyān', 'Baladiyat ar Rayyan', 1),
(5, 'QA.01', 'QA', 'Baladīyat ad Dawḩah', 'Baladiyat ad Dawhah', 1),
(6, 'QA.10', 'QA', 'Al Wakrah', 'Al Wakrah', 1),
(7, 'QA.13', 'QA', 'Baladīyat az̧ Z̧a‘āyin', 'Baladiyat az Za`ayin', 1),
(8, 'QA.14', 'QA', 'Al-Shahaniya', 'Al-Shahaniya', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subadmin2`
--

CREATE TABLE `subadmin2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subadmin1_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `asciiname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_zones`
--

CREATE TABLE `time_zones` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `time_zone_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `gmt` double DEFAULT NULL,
  `dst` double DEFAULT NULL,
  `raw` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `time_zones`
--

INSERT INTO `time_zones` (`id`, `country_code`, `time_zone_id`, `gmt`, `dst`, `raw`) VALUES
(1, 'CI', 'Africa/Abidjan', 0, 0, 0),
(2, 'GH', 'Africa/Accra', 0, 0, 0),
(3, 'ET', 'Africa/Addis_Ababa', 3, 3, 3),
(4, 'DZ', 'Africa/Algiers', 1, 1, 1),
(5, 'ER', 'Africa/Asmara', 3, 3, 3),
(6, 'ML', 'Africa/Bamako', 0, 0, 0),
(7, 'CF', 'Africa/Bangui', 1, 1, 1),
(8, 'GM', 'Africa/Banjul', 0, 0, 0),
(9, 'GW', 'Africa/Bissau', 0, 0, 0),
(10, 'MW', 'Africa/Blantyre', 2, 2, 2),
(11, 'CG', 'Africa/Brazzaville', 1, 1, 1),
(12, 'BI', 'Africa/Bujumbura', 2, 2, 2),
(13, 'EG', 'Africa/Cairo', 2, 2, 2),
(14, 'MA', 'Africa/Casablanca', 0, 1, 0),
(15, 'ES', 'Africa/Ceuta', 1, 2, 1),
(16, 'GN', 'Africa/Conakry', 0, 0, 0),
(17, 'SN', 'Africa/Dakar', 0, 0, 0),
(18, 'TZ', 'Africa/Dar_es_Salaam', 3, 3, 3),
(19, 'DJ', 'Africa/Djibouti', 3, 3, 3),
(20, 'CM', 'Africa/Douala', 1, 1, 1),
(21, 'EH', 'Africa/El_Aaiun', 0, 1, 0),
(22, 'SL', 'Africa/Freetown', 0, 0, 0),
(23, 'BW', 'Africa/Gaborone', 2, 2, 2),
(24, 'ZW', 'Africa/Harare', 2, 2, 2),
(25, 'ZA', 'Africa/Johannesburg', 2, 2, 2),
(26, 'SS', 'Africa/Juba', 3, 3, 3),
(27, 'UG', 'Africa/Kampala', 3, 3, 3),
(28, 'SD', 'Africa/Khartoum', 3, 3, 3),
(29, 'RW', 'Africa/Kigali', 2, 2, 2),
(30, 'CD', 'Africa/Kinshasa', 1, 1, 1),
(31, 'NG', 'Africa/Lagos', 1, 1, 1),
(32, 'GA', 'Africa/Libreville', 1, 1, 1),
(33, 'TG', 'Africa/Lome', 0, 0, 0),
(34, 'AO', 'Africa/Luanda', 1, 1, 1),
(35, 'CD', 'Africa/Lubumbashi', 2, 2, 2),
(36, 'ZM', 'Africa/Lusaka', 2, 2, 2),
(37, 'GQ', 'Africa/Malabo', 1, 1, 1),
(38, 'MZ', 'Africa/Maputo', 2, 2, 2),
(39, 'LS', 'Africa/Maseru', 2, 2, 2),
(40, 'SZ', 'Africa/Mbabane', 2, 2, 2),
(41, 'SO', 'Africa/Mogadishu', 3, 3, 3),
(42, 'LR', 'Africa/Monrovia', 0, 0, 0),
(43, 'KE', 'Africa/Nairobi', 3, 3, 3),
(44, 'TD', 'Africa/Ndjamena', 1, 1, 1),
(45, 'NE', 'Africa/Niamey', 1, 1, 1),
(46, 'MR', 'Africa/Nouakchott', 0, 0, 0),
(47, 'BF', 'Africa/Ouagadougou', 0, 0, 0),
(48, 'BJ', 'Africa/Porto-Novo', 1, 1, 1),
(49, 'ST', 'Africa/Sao_Tome', 0, 0, 0),
(50, 'LY', 'Africa/Tripoli', 2, 2, 2),
(51, 'TN', 'Africa/Tunis', 1, 1, 1),
(52, 'NA', 'Africa/Windhoek', 2, 1, 1),
(53, 'US', 'America/Adak', -10, -9, -10),
(54, 'US', 'America/Anchorage', -9, -8, -9),
(55, 'AI', 'America/Anguilla', -4, -4, -4),
(56, 'AG', 'America/Antigua', -4, -4, -4),
(57, 'BR', 'America/Araguaina', -3, -3, -3),
(58, 'AR', 'America/Argentina/Buenos_Aires', -3, -3, -3),
(59, 'AR', 'America/Argentina/Catamarca', -3, -3, -3),
(60, 'AR', 'America/Argentina/Cordoba', -3, -3, -3),
(61, 'AR', 'America/Argentina/Jujuy', -3, -3, -3),
(62, 'AR', 'America/Argentina/La_Rioja', -3, -3, -3),
(63, 'AR', 'America/Argentina/Mendoza', -3, -3, -3),
(64, 'AR', 'America/Argentina/Rio_Gallegos', -3, -3, -3),
(65, 'AR', 'America/Argentina/Salta', -3, -3, -3),
(66, 'AR', 'America/Argentina/San_Juan', -3, -3, -3),
(67, 'AR', 'America/Argentina/San_Luis', -3, -3, -3),
(68, 'AR', 'America/Argentina/Tucuman', -3, -3, -3),
(69, 'AR', 'America/Argentina/Ushuaia', -3, -3, -3),
(70, 'AW', 'America/Aruba', -4, -4, -4),
(71, 'PY', 'America/Asuncion', -3, -4, -4),
(72, 'CA', 'America/Atikokan', -5, -5, -5),
(73, 'BR', 'America/Bahia', -3, -3, -3),
(74, 'MX', 'America/Bahia_Banderas', -6, -5, -6),
(75, 'BB', 'America/Barbados', -4, -4, -4),
(76, 'BR', 'America/Belem', -3, -3, -3),
(77, 'BZ', 'America/Belize', -6, -6, -6),
(78, 'CA', 'America/Blanc-Sablon', -4, -4, -4),
(79, 'BR', 'America/Boa_Vista', -4, -4, -4),
(80, 'CO', 'America/Bogota', -5, -5, -5),
(81, 'US', 'America/Boise', -7, -6, -7),
(82, 'CA', 'America/Cambridge_Bay', -7, -6, -7),
(83, 'BR', 'America/Campo_Grande', -3, -4, -4),
(84, 'MX', 'America/Cancun', -5, -5, -5),
(85, 'VE', 'America/Caracas', -4, -4, -4),
(86, 'GF', 'America/Cayenne', -3, -3, -3),
(87, 'KY', 'America/Cayman', -5, -5, -5),
(88, 'US', 'America/Chicago', -6, -5, -6),
(89, 'MX', 'America/Chihuahua', -7, -6, -7),
(90, 'CR', 'America/Costa_Rica', -6, -6, -6),
(91, 'CA', 'America/Creston', -7, -7, -7),
(92, 'BR', 'America/Cuiaba', -3, -4, -4),
(93, 'CW', 'America/Curacao', -4, -4, -4),
(94, 'GL', 'America/Danmarkshavn', 0, 0, 0),
(95, 'CA', 'America/Dawson', -8, -7, -8),
(96, 'CA', 'America/Dawson_Creek', -7, -7, -7),
(97, 'US', 'America/Denver', -7, -6, -7),
(98, 'US', 'America/Detroit', -5, -4, -5),
(99, 'DM', 'America/Dominica', -4, -4, -4),
(100, 'CA', 'America/Edmonton', -7, -6, -7),
(101, 'BR', 'America/Eirunepe', -5, -5, -5),
(102, 'SV', 'America/El_Salvador', -6, -6, -6),
(103, 'CA', 'America/Fort_Nelson', -7, -7, -7),
(104, 'BR', 'America/Fortaleza', -3, -3, -3),
(105, 'CA', 'America/Glace_Bay', -4, -3, -4),
(106, 'GL', 'America/Godthab', -3, -2, -3),
(107, 'CA', 'America/Goose_Bay', -4, -3, -4),
(108, 'TC', 'America/Grand_Turk', -4, -4, -4),
(109, 'GD', 'America/Grenada', -4, -4, -4),
(110, 'GP', 'America/Guadeloupe', -4, -4, -4),
(111, 'GT', 'America/Guatemala', -6, -6, -6),
(112, 'EC', 'America/Guayaquil', -5, -5, -5),
(113, 'GY', 'America/Guyana', -4, -4, -4),
(114, 'CA', 'America/Halifax', -4, -3, -4),
(115, 'CU', 'America/Havana', -5, -4, -5),
(116, 'MX', 'America/Hermosillo', -7, -7, -7),
(117, 'US', 'America/Indiana/Indianapolis', -5, -4, -5),
(118, 'US', 'America/Indiana/Knox', -6, -5, -6),
(119, 'US', 'America/Indiana/Marengo', -5, -4, -5),
(120, 'US', 'America/Indiana/Petersburg', -5, -4, -5),
(121, 'US', 'America/Indiana/Tell_City', -6, -5, -6),
(122, 'US', 'America/Indiana/Vevay', -5, -4, -5),
(123, 'US', 'America/Indiana/Vincennes', -5, -4, -5),
(124, 'US', 'America/Indiana/Winamac', -5, -4, -5),
(125, 'CA', 'America/Inuvik', -7, -6, -7),
(126, 'CA', 'America/Iqaluit', -5, -4, -5),
(127, 'JM', 'America/Jamaica', -5, -5, -5),
(128, 'US', 'America/Juneau', -9, -8, -9),
(129, 'US', 'America/Kentucky/Louisville', -5, -4, -5),
(130, 'US', 'America/Kentucky/Monticello', -5, -4, -5),
(131, 'BQ', 'America/Kralendijk', -4, -4, -4),
(132, 'BO', 'America/La_Paz', -4, -4, -4),
(133, 'PE', 'America/Lima', -5, -5, -5),
(134, 'US', 'America/Los_Angeles', -8, -7, -8),
(135, 'SX', 'America/Lower_Princes', -4, -4, -4),
(136, 'BR', 'America/Maceio', -3, -3, -3),
(137, 'NI', 'America/Managua', -6, -6, -6),
(138, 'BR', 'America/Manaus', -4, -4, -4),
(139, 'MF', 'America/Marigot', -4, -4, -4),
(140, 'MQ', 'America/Martinique', -4, -4, -4),
(141, 'MX', 'America/Matamoros', -6, -5, -6),
(142, 'MX', 'America/Mazatlan', -7, -6, -7),
(143, 'US', 'America/Menominee', -6, -5, -6),
(144, 'MX', 'America/Merida', -6, -5, -6),
(145, 'US', 'America/Metlakatla', -9, -8, -9),
(146, 'MX', 'America/Mexico_City', -6, -5, -6),
(147, 'PM', 'America/Miquelon', -3, -2, -3),
(148, 'CA', 'America/Moncton', -4, -3, -4),
(149, 'MX', 'America/Monterrey', -6, -5, -6),
(150, 'UY', 'America/Montevideo', -3, -3, -3),
(151, 'MS', 'America/Montserrat', -4, -4, -4),
(152, 'BS', 'America/Nassau', -5, -4, -5),
(153, 'US', 'America/New_York', -5, -4, -5),
(154, 'CA', 'America/Nipigon', -5, -4, -5),
(155, 'US', 'America/Nome', -9, -8, -9),
(156, 'BR', 'America/Noronha', -2, -2, -2),
(157, 'US', 'America/North_Dakota/Beulah', -6, -5, -6),
(158, 'US', 'America/North_Dakota/Center', -6, -5, -6),
(159, 'US', 'America/North_Dakota/New_Salem', -6, -5, -6),
(160, 'MX', 'America/Ojinaga', -7, -6, -7),
(161, 'PA', 'America/Panama', -5, -5, -5),
(162, 'CA', 'America/Pangnirtung', -5, -4, -5),
(163, 'SR', 'America/Paramaribo', -3, -3, -3),
(164, 'US', 'America/Phoenix', -7, -7, -7),
(165, 'HT', 'America/Port-au-Prince', -5, -4, -5),
(166, 'TT', 'America/Port_of_Spain', -4, -4, -4),
(167, 'BR', 'America/Porto_Velho', -4, -4, -4),
(168, 'PR', 'America/Puerto_Rico', -4, -4, -4),
(169, 'CL', 'America/Punta_Arenas', -3, -3, -3),
(170, 'CA', 'America/Rainy_River', -6, -5, -6),
(171, 'CA', 'America/Rankin_Inlet', -6, -5, -6),
(172, 'BR', 'America/Recife', -3, -3, -3),
(173, 'CA', 'America/Regina', -6, -6, -6),
(174, 'CA', 'America/Resolute', -6, -5, -6),
(175, 'BR', 'America/Rio_Branco', -5, -5, -5),
(176, 'BR', 'America/Santarem', -3, -3, -3),
(177, 'CL', 'America/Santiago', -3, -4, -4),
(178, 'DO', 'America/Santo_Domingo', -4, -4, -4),
(179, 'BR', 'America/Sao_Paulo', -2, -3, -3),
(180, 'GL', 'America/Scoresbysund', -1, 0, -1),
(181, 'US', 'America/Sitka', -9, -8, -9),
(182, 'BL', 'America/St_Barthelemy', -4, -4, -4),
(183, 'CA', 'America/St_Johns', -3.5, -2.5, -3.5),
(184, 'KN', 'America/St_Kitts', -4, -4, -4),
(185, 'LC', 'America/St_Lucia', -4, -4, -4),
(186, 'VI', 'America/St_Thomas', -4, -4, -4),
(187, 'VC', 'America/St_Vincent', -4, -4, -4),
(188, 'CA', 'America/Swift_Current', -6, -6, -6),
(189, 'HN', 'America/Tegucigalpa', -6, -6, -6),
(190, 'GL', 'America/Thule', -4, -3, -4),
(191, 'CA', 'America/Thunder_Bay', -5, -4, -5),
(192, 'MX', 'America/Tijuana', -8, -7, -8),
(193, 'CA', 'America/Toronto', -5, -4, -5),
(194, 'VG', 'America/Tortola', -4, -4, -4),
(195, 'CA', 'America/Vancouver', -8, -7, -8),
(196, 'CA', 'America/Whitehorse', -8, -7, -8),
(197, 'CA', 'America/Winnipeg', -6, -5, -6),
(198, 'US', 'America/Yakutat', -9, -8, -9),
(199, 'CA', 'America/Yellowknife', -7, -6, -7),
(200, 'AQ', 'Antarctica/Casey', 11, 11, 11),
(201, 'AQ', 'Antarctica/Davis', 7, 7, 7),
(202, 'AQ', 'Antarctica/DumontDUrville', 10, 10, 10),
(203, 'AU', 'Antarctica/Macquarie', 11, 11, 11),
(204, 'AQ', 'Antarctica/Mawson', 5, 5, 5),
(205, 'AQ', 'Antarctica/McMurdo', 13, 12, 12),
(206, 'AQ', 'Antarctica/Palmer', -3, -3, -3),
(207, 'AQ', 'Antarctica/Rothera', -3, -3, -3),
(208, 'AQ', 'Antarctica/Syowa', 3, 3, 3),
(209, 'AQ', 'Antarctica/Troll', 0, 2, 0),
(210, 'AQ', 'Antarctica/Vostok', 6, 6, 6),
(211, 'SJ', 'Arctic/Longyearbyen', 1, 2, 1),
(212, 'YE', 'Asia/Aden', 3, 3, 3),
(213, 'KZ', 'Asia/Almaty', 6, 6, 6),
(214, 'JO', 'Asia/Amman', 2, 3, 2),
(215, 'RU', 'Asia/Anadyr', 12, 12, 12),
(216, 'KZ', 'Asia/Aqtau', 5, 5, 5),
(217, 'KZ', 'Asia/Aqtobe', 5, 5, 5),
(218, 'TM', 'Asia/Ashgabat', 5, 5, 5),
(219, 'KZ', 'Asia/Atyrau', 5, 5, 5),
(220, 'IQ', 'Asia/Baghdad', 3, 3, 3),
(221, 'BH', 'Asia/Bahrain', 3, 3, 3),
(222, 'AZ', 'Asia/Baku', 4, 4, 4),
(223, 'TH', 'Asia/Bangkok', 7, 7, 7),
(224, 'RU', 'Asia/Barnaul', 7, 7, 7),
(225, 'LB', 'Asia/Beirut', 2, 3, 2),
(226, 'KG', 'Asia/Bishkek', 6, 6, 6),
(227, 'BN', 'Asia/Brunei', 8, 8, 8),
(228, 'RU', 'Asia/Chita', 9, 9, 9),
(229, 'MN', 'Asia/Choibalsan', 8, 8, 8),
(230, 'LK', 'Asia/Colombo', 5.5, 5.5, 5.5),
(231, 'SY', 'Asia/Damascus', 2, 3, 2),
(232, 'BD', 'Asia/Dhaka', 6, 6, 6),
(233, 'TL', 'Asia/Dili', 9, 9, 9),
(234, 'AE', 'Asia/Dubai', 4, 4, 4),
(235, 'TJ', 'Asia/Dushanbe', 5, 5, 5),
(236, 'CY', 'Asia/Famagusta', 3, 3, 3),
(237, 'PS', 'Asia/Gaza', 2, 3, 2),
(238, 'PS', 'Asia/Hebron', 2, 3, 2),
(239, 'VN', 'Asia/Ho_Chi_Minh', 7, 7, 7),
(240, 'HK', 'Asia/Hong_Kong', 8, 8, 8),
(241, 'MN', 'Asia/Hovd', 7, 7, 7),
(242, 'RU', 'Asia/Irkutsk', 8, 8, 8),
(243, 'ID', 'Asia/Jakarta', 7, 7, 7),
(244, 'ID', 'Asia/Jayapura', 9, 9, 9),
(245, 'IL', 'Asia/Jerusalem', 2, 3, 2),
(246, 'AF', 'Asia/Kabul', 4.5, 4.5, 4.5),
(247, 'RU', 'Asia/Kamchatka', 12, 12, 12),
(248, 'PK', 'Asia/Karachi', 5, 5, 5),
(249, 'NP', 'Asia/Kathmandu', 5.75, 5.75, 5.75),
(250, 'RU', 'Asia/Khandyga', 9, 9, 9),
(251, 'IN', 'Asia/Kolkata', 5.5, 5.5, 5.5),
(252, 'RU', 'Asia/Krasnoyarsk', 7, 7, 7),
(253, 'MY', 'Asia/Kuala_Lumpur', 8, 8, 8),
(254, 'MY', 'Asia/Kuching', 8, 8, 8),
(255, 'KW', 'Asia/Kuwait', 3, 3, 3),
(256, 'MO', 'Asia/Macau', 8, 8, 8),
(257, 'RU', 'Asia/Magadan', 11, 11, 11),
(258, 'ID', 'Asia/Makassar', 8, 8, 8),
(259, 'PH', 'Asia/Manila', 8, 8, 8),
(260, 'OM', 'Asia/Muscat', 4, 4, 4),
(261, 'CY', 'Asia/Nicosia', 2, 3, 2),
(262, 'RU', 'Asia/Novokuznetsk', 7, 7, 7),
(263, 'RU', 'Asia/Novosibirsk', 7, 7, 7),
(264, 'RU', 'Asia/Omsk', 6, 6, 6),
(265, 'KZ', 'Asia/Oral', 5, 5, 5),
(266, 'KH', 'Asia/Phnom_Penh', 7, 7, 7),
(267, 'ID', 'Asia/Pontianak', 7, 7, 7),
(268, 'KP', 'Asia/Pyongyang', 8.5, 8.5, 8.5),
(269, 'QA', 'Asia/Qatar', 3, 3, 3),
(270, 'KZ', 'Asia/Qyzylorda', 6, 6, 6),
(271, 'SA', 'Asia/Riyadh', 3, 3, 3),
(272, 'RU', 'Asia/Sakhalin', 11, 11, 11),
(273, 'UZ', 'Asia/Samarkand', 5, 5, 5),
(274, 'KR', 'Asia/Seoul', 9, 9, 9),
(275, 'CN', 'Asia/Shanghai', 8, 8, 8),
(276, 'SG', 'Asia/Singapore', 8, 8, 8),
(277, 'RU', 'Asia/Srednekolymsk', 11, 11, 11),
(278, 'TW', 'Asia/Taipei', 8, 8, 8),
(279, 'UZ', 'Asia/Tashkent', 5, 5, 5),
(280, 'GE', 'Asia/Tbilisi', 4, 4, 4),
(281, 'IR', 'Asia/Tehran', 3.5, 4.5, 3.5),
(282, 'BT', 'Asia/Thimphu', 6, 6, 6),
(283, 'JP', 'Asia/Tokyo', 9, 9, 9),
(284, 'RU', 'Asia/Tomsk', 7, 7, 7),
(285, 'MN', 'Asia/Ulaanbaatar', 8, 8, 8),
(286, 'CN', 'Asia/Urumqi', 6, 6, 6),
(287, 'RU', 'Asia/Ust-Nera', 10, 10, 10),
(288, 'LA', 'Asia/Vientiane', 7, 7, 7),
(289, 'RU', 'Asia/Vladivostok', 10, 10, 10),
(290, 'RU', 'Asia/Yakutsk', 9, 9, 9),
(291, 'MM', 'Asia/Yangon', 6.5, 6.5, 6.5),
(292, 'RU', 'Asia/Yekaterinburg', 5, 5, 5),
(293, 'AM', 'Asia/Yerevan', 4, 4, 4),
(294, 'PT', 'Atlantic/Azores', -1, 0, -1),
(295, 'BM', 'Atlantic/Bermuda', -4, -3, -4),
(296, 'ES', 'Atlantic/Canary', 0, 1, 0),
(297, 'CV', 'Atlantic/Cape_Verde', -1, -1, -1),
(298, 'FO', 'Atlantic/Faroe', 0, 1, 0),
(299, 'PT', 'Atlantic/Madeira', 0, 1, 0),
(300, 'IS', 'Atlantic/Reykjavik', 0, 0, 0),
(301, 'GS', 'Atlantic/South_Georgia', -2, -2, -2),
(302, 'SH', 'Atlantic/St_Helena', 0, 0, 0),
(303, 'FK', 'Atlantic/Stanley', -3, -3, -3),
(304, 'AU', 'Australia/Adelaide', 10.5, 9.5, 9.5),
(305, 'AU', 'Australia/Brisbane', 10, 10, 10),
(306, 'AU', 'Australia/Broken_Hill', 10.5, 9.5, 9.5),
(307, 'AU', 'Australia/Currie', 11, 10, 10),
(308, 'AU', 'Australia/Darwin', 9.5, 9.5, 9.5),
(309, 'AU', 'Australia/Eucla', 8.75, 8.75, 8.75),
(310, 'AU', 'Australia/Hobart', 11, 10, 10),
(311, 'AU', 'Australia/Lindeman', 10, 10, 10),
(312, 'AU', 'Australia/Lord_Howe', 11, 10.5, 10.5),
(313, 'AU', 'Australia/Melbourne', 11, 10, 10),
(314, 'AU', 'Australia/Perth', 8, 8, 8),
(315, 'AU', 'Australia/Sydney', 11, 10, 10),
(316, 'NL', 'Europe/Amsterdam', 1, 2, 1),
(317, 'AD', 'Europe/Andorra', 1, 2, 1),
(318, 'RU', 'Europe/Astrakhan', 4, 4, 4),
(319, 'GR', 'Europe/Athens', 2, 3, 2),
(320, 'RS', 'Europe/Belgrade', 1, 2, 1),
(321, 'DE', 'Europe/Berlin', 1, 2, 1),
(322, 'SK', 'Europe/Bratislava', 1, 2, 1),
(323, 'BE', 'Europe/Brussels', 1, 2, 1),
(324, 'RO', 'Europe/Bucharest', 2, 3, 2),
(325, 'HU', 'Europe/Budapest', 1, 2, 1),
(326, 'DE', 'Europe/Busingen', 1, 2, 1),
(327, 'MD', 'Europe/Chisinau', 2, 3, 2),
(328, 'DK', 'Europe/Copenhagen', 1, 2, 1),
(329, 'IE', 'Europe/Dublin', 0, 1, 0),
(330, 'GI', 'Europe/Gibraltar', 1, 2, 1),
(331, 'GG', 'Europe/Guernsey', 0, 1, 0),
(332, 'FI', 'Europe/Helsinki', 2, 3, 2),
(333, 'IM', 'Europe/Isle_of_Man', 0, 1, 0),
(334, 'TR', 'Europe/Istanbul', 3, 3, 3),
(335, 'JE', 'Europe/Jersey', 0, 1, 0),
(336, 'RU', 'Europe/Kaliningrad', 2, 2, 2),
(337, 'UA', 'Europe/Kiev', 2, 3, 2),
(338, 'RU', 'Europe/Kirov', 3, 3, 3),
(339, 'PT', 'Europe/Lisbon', 0, 1, 0),
(340, 'SI', 'Europe/Ljubljana', 1, 2, 1),
(341, 'UK', 'Europe/London', 0, 1, 0),
(342, 'LU', 'Europe/Luxembourg', 1, 2, 1),
(343, 'ES', 'Europe/Madrid', 1, 2, 1),
(344, 'MT', 'Europe/Malta', 1, 2, 1),
(345, 'AX', 'Europe/Mariehamn', 2, 3, 2),
(346, 'BY', 'Europe/Minsk', 3, 3, 3),
(347, 'MC', 'Europe/Monaco', 1, 2, 1),
(348, 'RU', 'Europe/Moscow', 3, 3, 3),
(349, 'NO', 'Europe/Oslo', 1, 2, 1),
(350, 'FR', 'Europe/Paris', 1, 2, 1),
(351, 'ME', 'Europe/Podgorica', 1, 2, 1),
(352, 'CZ', 'Europe/Prague', 1, 2, 1),
(353, 'LV', 'Europe/Riga', 2, 3, 2),
(354, 'IT', 'Europe/Rome', 1, 2, 1),
(355, 'RU', 'Europe/Samara', 4, 4, 4),
(356, 'SM', 'Europe/San_Marino', 1, 2, 1),
(357, 'BA', 'Europe/Sarajevo', 1, 2, 1),
(358, 'RU', 'Europe/Saratov', 4, 4, 4),
(359, 'RU', 'Europe/Simferopol', 3, 3, 3),
(360, 'MK', 'Europe/Skopje', 1, 2, 1),
(361, 'BG', 'Europe/Sofia', 2, 3, 2),
(362, 'SE', 'Europe/Stockholm', 1, 2, 1),
(363, 'EE', 'Europe/Tallinn', 2, 3, 2),
(364, 'AL', 'Europe/Tirane', 1, 2, 1),
(365, 'RU', 'Europe/Ulyanovsk', 4, 4, 4),
(366, 'UA', 'Europe/Uzhgorod', 2, 3, 2),
(367, 'LI', 'Europe/Vaduz', 1, 2, 1),
(368, 'VA', 'Europe/Vatican', 1, 2, 1),
(369, 'AT', 'Europe/Vienna', 1, 2, 1),
(370, 'LT', 'Europe/Vilnius', 2, 3, 2),
(371, 'RU', 'Europe/Volgograd', 3, 3, 3),
(372, 'PL', 'Europe/Warsaw', 1, 2, 1),
(373, 'HR', 'Europe/Zagreb', 1, 2, 1),
(374, 'UA', 'Europe/Zaporozhye', 2, 3, 2),
(375, 'CH', 'Europe/Zurich', 1, 2, 1),
(376, 'MG', 'Indian/Antananarivo', 3, 3, 3),
(377, 'IO', 'Indian/Chagos', 6, 6, 6),
(378, 'CX', 'Indian/Christmas', 7, 7, 7),
(379, 'CC', 'Indian/Cocos', 6.5, 6.5, 6.5),
(380, 'KM', 'Indian/Comoro', 3, 3, 3),
(381, 'TF', 'Indian/Kerguelen', 5, 5, 5),
(382, 'SC', 'Indian/Mahe', 4, 4, 4),
(383, 'MV', 'Indian/Maldives', 5, 5, 5),
(384, 'MU', 'Indian/Mauritius', 4, 4, 4),
(385, 'YT', 'Indian/Mayotte', 3, 3, 3),
(386, 'RE', 'Indian/Reunion', 4, 4, 4),
(387, 'WS', 'Pacific/Apia', 14, 13, 13),
(388, 'NZ', 'Pacific/Auckland', 13, 12, 12),
(389, 'PG', 'Pacific/Bougainville', 11, 11, 11),
(390, 'NZ', 'Pacific/Chatham', 13.75, 12.75, 12.75),
(391, 'FM', 'Pacific/Chuuk', 10, 10, 10),
(392, 'CL', 'Pacific/Easter', -5, -6, -6),
(393, 'VU', 'Pacific/Efate', 11, 11, 11),
(394, 'KI', 'Pacific/Enderbury', 13, 13, 13),
(395, 'TK', 'Pacific/Fakaofo', 13, 13, 13),
(396, 'FJ', 'Pacific/Fiji', 13, 12, 12),
(397, 'TV', 'Pacific/Funafuti', 12, 12, 12),
(398, 'EC', 'Pacific/Galapagos', -6, -6, -6),
(399, 'PF', 'Pacific/Gambier', -9, -9, -9),
(400, 'SB', 'Pacific/Guadalcanal', 11, 11, 11),
(401, 'GU', 'Pacific/Guam', 10, 10, 10),
(402, 'US', 'Pacific/Honolulu', -10, -10, -10),
(403, 'KI', 'Pacific/Kiritimati', 14, 14, 14),
(404, 'FM', 'Pacific/Kosrae', 11, 11, 11),
(405, 'MH', 'Pacific/Kwajalein', 12, 12, 12),
(406, 'MH', 'Pacific/Majuro', 12, 12, 12),
(407, 'PF', 'Pacific/Marquesas', -9.5, -9.5, -9.5),
(408, 'UM', 'Pacific/Midway', -11, -11, -11),
(409, 'NR', 'Pacific/Nauru', 12, 12, 12),
(410, 'NU', 'Pacific/Niue', -11, -11, -11),
(411, 'NF', 'Pacific/Norfolk', 11, 11, 11),
(412, 'NC', 'Pacific/Noumea', 11, 11, 11),
(413, 'AS', 'Pacific/Pago_Pago', -11, -11, -11),
(414, 'PW', 'Pacific/Palau', 9, 9, 9),
(415, 'PN', 'Pacific/Pitcairn', -8, -8, -8),
(416, 'FM', 'Pacific/Pohnpei', 11, 11, 11),
(417, 'PG', 'Pacific/Port_Moresby', 10, 10, 10),
(418, 'CK', 'Pacific/Rarotonga', -10, -10, -10),
(419, 'MP', 'Pacific/Saipan', 10, 10, 10),
(420, 'PF', 'Pacific/Tahiti', -10, -10, -10),
(421, 'KI', 'Pacific/Tarawa', 12, 12, 12),
(422, 'TO', 'Pacific/Tongatapu', 14, 13, 13),
(423, 'UM', 'Pacific/Wake', 12, 12, 12),
(424, 'WF', 'Pacific/Wallis', 12, 12, 12);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type_id` int(10) UNSIGNED DEFAULT NULL,
  `gender_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_hidden` tinyint(1) UNSIGNED DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) UNSIGNED DEFAULT '0',
  `can_be_impersonated` tinyint(1) UNSIGNED DEFAULT '1',
  `disable_comments` tinyint(1) UNSIGNED DEFAULT '0',
  `receive_newsletter` tinyint(1) UNSIGNED DEFAULT '1',
  `receive_advice` tinyint(1) UNSIGNED DEFAULT '1',
  `ip_addr` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified_email` tinyint(1) UNSIGNED DEFAULT '1',
  `verified_phone` tinyint(1) UNSIGNED DEFAULT '0',
  `blocked` tinyint(1) UNSIGNED DEFAULT '0',
  `closed` tinyint(1) UNSIGNED DEFAULT '0',
  `last_login_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `country_code`, `language_code`, `user_type_id`, `gender_id`, `name`, `photo`, `about`, `phone`, `phone_hidden`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `is_admin`, `can_be_impersonated`, `disable_comments`, `receive_newsletter`, `receive_advice`, `ip_addr`, `provider`, `provider_id`, `email_token`, `phone_token`, `verified_email`, `verified_phone`, `blocked`, `closed`, `last_login_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'QA', NULL, 1, 1, 'Dohafous', NULL, 'Administrator', NULL, 0, NULL, 'admin@doha4sale.com', NULL, '$2y$10$ICXm7Hjun5lQU2nhCKgsOuS7TqpU.5ezREAH6UwIQjTGCYnuSjQ36', NULL, NULL, 1, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, NULL, NULL, '2020-10-19 00:07:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `name`, `active`) VALUES
(1, 'Professional', 1),
(2, 'Individual', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertising`
--
ALTER TABLE `advertising`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`entry`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `slug` (`slug`),
  ADD KEY `lft` (`lft`,`translation_lang`),
  ADD KEY `rgt` (`rgt`,`translation_lang`),
  ADD KEY `depth` (`depth`,`translation_lang`);

--
-- Indexes for table `category_field`
--
ALTER TABLE `category_field`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_id` (`category_id`,`field_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `name` (`name`),
  ADD KEY `subadmin1_code` (`subadmin1_code`),
  ADD KEY `subadmin2_code` (`subadmin2_code`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `continents`
--
ALTER TABLE `continents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`),
  ADD KEY `belongs_to` (`belongs_to`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `fields_options`
--
ALTER TABLE `fields_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`);

--
-- Indexes for table `home_sections`
--
ALTER TABLE `home_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `abbr` (`abbr`),
  ADD KEY `active` (`active`),
  ADD KEY `default` (`default`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `from_user_id` (`from_user_id`),
  ADD KEY `to_user_id` (`to_user_id`),
  ADD KEY `deleted_by` (`deleted_by`);

--
-- Indexes for table `meta_tags`
--
ALTER TABLE `meta_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`phone`),
  ADD KEY `email` (`email`) USING BTREE,
  ADD KEY `phone` (`phone`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_method_id` (`payment_method_id`),
  ADD KEY `package_id` (`package_id`) USING BTREE,
  ADD KEY `post_id` (`post_id`),
  ADD KEY `active` (`active`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `has_ccbox` (`has_ccbox`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lat` (`lon`,`lat`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `title` (`title`),
  ADD KEY `address` (`address`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `reviewed` (`reviewed`),
  ADD KEY `featured` (`featured`),
  ADD KEY `post_type_id` (`post_type_id`),
  ADD KEY `verified_email` (`verified_email`),
  ADD KEY `verified_phone` (`verified_phone`),
  ADD KEY `contact_name` (`contact_name`),
  ADD KEY `tags` (`tags`),
  ADD KEY `is_permanent` (`is_permanent`);

--
-- Indexes for table `post_types`
--
ALTER TABLE `post_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`);

--
-- Indexes for table `post_values`
--
ALTER TABLE `post_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `option_id` (`option_id`);

--
-- Indexes for table `report_types`
--
ALTER TABLE `report_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `saved_posts`
--
ALTER TABLE `saved_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `saved_search`
--
ALTER TABLE `saved_search`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `country_code` (`country_code`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `key` (`key`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `subadmin1`
--
ALTER TABLE `subadmin1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `name` (`name`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `subadmin2`
--
ALTER TABLE `subadmin2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `subadmin1_code` (`subadmin1_code`),
  ADD KEY `name` (`name`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `time_zones`
--
ALTER TABLE `time_zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `time_zone_id` (`time_zone_id`),
  ADD KEY `country_code` (`country_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `user_type_id` (`user_type_id`),
  ADD KEY `gender_id` (`gender_id`),
  ADD KEY `username` (`username`),
  ADD KEY `verified_email` (`verified_email`),
  ADD KEY `verified_phone` (`verified_phone`),
  ADD KEY `is_admin` (`is_admin`),
  ADD KEY `can_be_impersonated` (`can_be_impersonated`),
  ADD KEY `email` (`email`,`email_verified_at`) USING BTREE,
  ADD KEY `phone` (`phone`,`verified_phone`) USING BTREE;

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertising`
--
ALTER TABLE `advertising`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `blacklist`
--
ALTER TABLE `blacklist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=460;
--
-- AUTO_INCREMENT for table `category_field`
--
ALTER TABLE `category_field`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `continents`
--
ALTER TABLE `continents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;
--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;
--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `fields_options`
--
ALTER TABLE `fields_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=484;
--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `home_sections`
--
ALTER TABLE `home_sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `meta_tags`
--
ALTER TABLE `meta_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `post_types`
--
ALTER TABLE `post_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `post_values`
--
ALTER TABLE `post_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `report_types`
--
ALTER TABLE `report_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `saved_posts`
--
ALTER TABLE `saved_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `saved_search`
--
ALTER TABLE `saved_search`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `subadmin1`
--
ALTER TABLE `subadmin1`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `subadmin2`
--
ALTER TABLE `subadmin2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `time_zones`
--
ALTER TABLE `time_zones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
