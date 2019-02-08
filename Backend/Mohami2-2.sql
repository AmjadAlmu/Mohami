-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 08, 2019 at 03:06 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Mohami2`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `masge` text COLLATE utf8_unicode_ci NOT NULL,
  `type_sender` tinyint(1) NOT NULL,
  `Lawyers_license` int(11) NOT NULL,
  `lawyers_license_date` date NOT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CV` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `trainee` tinyint(1) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `created_at`, `updated_at`, `name`, `email`, `masge`, `type_sender`, `Lawyers_license`, `lawyers_license_date`, `city`, `CV`, `trainee`, `user_id`) VALUES
(50, '2016-04-28 00:36:00', '2016-04-28 00:36:00', 'محمد', 'example@hotmail.com', 'السلام عليكم', 1, 2147483647, '2015-02-02', 'مكه', '', 0, 0),
(49, '2016-04-28 00:35:07', '2016-04-28 00:35:07', 'احمد', 'example@hotmail.com', 'السلام عليكم', 0, 0, '0000-00-00', '', '', 0, 0),
(48, '2016-04-28 00:31:24', '2016-04-28 00:31:24', 'محمد', 'example@hotmail.com', 'السلام عليكم', 0, 0, '0000-00-00', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `explain_issue` text COLLATE utf8_unicode_ci NOT NULL,
  `attachment` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `request_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `lawyer_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`id`, `created_at`, `updated_at`, `explain_issue`, `attachment`, `request_type`, `type_id`, `lawyer_id`, `user_id`) VALUES
(62, '2016-04-25 00:01:19', '2016-04-25 00:01:19', 'السلام عليكم ....................................', 'CV .pdf', 'Authorization', 2, 2, 0),
(64, '2016-04-25 00:06:52', '2016-04-25 00:06:52', 'السلام عليكم..........................', 'CV .pdf', 'Authorization', 2, 2, 0),
(82, NULL, NULL, 'sdorr44', '', 'fffss', 3, 33, 0),
(83, NULL, NULL, 'sdorr44', '', 'DDD', 3, 33, 0),
(84, NULL, NULL, 'sdorr44', '', 'fffss', 3, 33, 0),
(85, NULL, NULL, 'sdorr44', '', 'fffss', 3, 33, 0),
(86, NULL, NULL, 'تجربة لاظهار رد محامي', '', '1', 1, 27, 4),
(87, NULL, NULL, 'التجربة الثانيه لاظهار رد المحامي', '', '0', 2, 31, 2);

-- --------------------------------------------------------

--
-- Table structure for table `lawyers`
--

CREATE TABLE `lawyers` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_number` int(11) NOT NULL,
  `lawyers_license` int(11) NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `nationality` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DOB` date NOT NULL,
  `phone_namber` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `genral_info` text COLLATE utf8_unicode_ci NOT NULL,
  `genral_info_more` text COLLATE utf8_unicode_ci NOT NULL,
  `imagePath` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lawyers`
--

INSERT INTO `lawyers` (`id`, `id_number`, `lawyers_license`, `first_name`, `city`, `gender`, `nationality`, `DOB`, `phone_namber`, `email`, `genral_info`, `genral_info_more`, `imagePath`) VALUES
(33, 0, 0, 'سلطان ', 'مكة المكرمة ', 0, 'سعودي ', '0000-00-00', '0000000000', '000', 'محكم ومحام منذ 1429هـ', 'بكالوريس شريعة من جامعة أم القرى \r\nمحام سابق للجمعية السعودية لحقوق الانسان \r\nشهادات متعمدة في التحكيم الخبرة لسنوات في الرد على الاستشارات القانونية عبر عدد من الصحف .	', './upload/1448090696_home.png'),
(27, 0, 0, 'أحمد ', 'مكة المكرمة ', 0, 'سعودي ', '0000-00-00', '0541112152', 'xx979xx@hotmail.com', 'محكم ومحام منذ 1432هـ', 'بكالريوس من قسم القضاء بجامعة أم القرى .\r\nشهادة في التحكيم من جامعة الملك عبدالعزيز .\r\nماجستير في القانون الدولي والقانون المقارن .', 'صورة1.png'),
(28, 0, 0, 'فلاج ', 'مكة المكرمة ', 0, 'سعودي ', '0000-00-00', '0000000000', '000', 'محام ومستشار قانوني منذ 1987م ', 'دبلوم في الانظمة من معهد الادارة العامة \r\nبكالريوس من جامعة الملك سعود في الاداب \r\nمستشار قانوني سابق لعدد من الجهات منها ( البنك الاهلي التجاري - لجنة المنازعات المصرفية - وزارة التجارة والصناعة ) \r\nعضو لجنة الاستئاف في منازعات الاوراق المالية وعضو في عدد من اللجان القضائية المهمة ', 'صورة1.png'),
(29, 0, 0, 'أحمد ', 'مكة المكرمة - الطائف ', 0, 'سعودي ', '0000-00-00', '0558575548', 'ahmad14302009@live.com', 'محام ومستشار قانوني منذ 1429هـ', 'بكالريوس في الشريعة من الجامعة الاسلامية بالمدينة \r\nشهادة  معتمدة في التحكيم من المركز المصري للتحكيم ', 'صورة1.png'),
(32, 0, 0, 'شهد ', 'مكة المكرمة ', 1, 'سعودية', '0000-00-00', '0566633898', 'shahadasiri@hotmail.com', 'محامي متدرب', 'بكالريوس في الانظمة من جامعة الملك عبدالعزيز . الحصول على عدد من الدورات المهمة في ذات المجال مثل ( قضايا الاحوال الشخصية - مهارات التحقيق الاداري - فن كتابة اللوائح والمذكرات - دور الوساطة والتحكيم - مهارات الصياغة القانونية )', 'صورة1.png'),
(31, 0, 0, 'تهاني ', 'مكة المكرمة ', 1, 'سعودية', '0000-00-00', '0000000000', '000', 'محامي متدرب ', 'بكالريوس شريعة من جامعة ام القرى \r\nالحصول على عدد من الدورات المهمة في ذات المجال مثل ( احكام الحضانة - قضايا الاحوال الشخصية - حقوق المرأة العاملة - نظام العمل الجديد ) ', 'صورة1.png'),
(24, 0, 0, 'محمد ', 'الطائف ', 0, 'سعودي ', '0000-00-00', '0000000000', '00000000000', 'محام ومستشار قانوني  منذ 1419 هـ ', '\r\nبكالوريوس انظمة من جامعة الملك عبدالعزيز, رئيس لجنة المحامين بالطائف عن الدورة من ١٤٢٨ – ١٤٣٦, المدير العام لمجموعة محمد السالمي القانونية للاستشارات .', 'شعار بدون خلفية.png');

-- --------------------------------------------------------

--
-- Table structure for table `lawyers_replies`
--

CREATE TABLE `lawyers_replies` (
  `id` int(11) NOT NULL,
  `issue_id` int(10) NOT NULL,
  `lawyer_id` int(10) NOT NULL,
  `explain_reply` text CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lawyers_replies`
--

INSERT INTO `lawyers_replies` (`id`, `issue_id`, `lawyer_id`, `explain_reply`) VALUES
(3, 86, 33, 'تجربة للرد على استشاره مجانيه'),
(4, 87, 33, 'التجربة الثانيه');

-- --------------------------------------------------------

--
-- Table structure for table `lawyers_type`
--

CREATE TABLE `lawyers_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lawyers_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lawyers_type`
--

INSERT INTO `lawyers_type` (`id`, `type_id`, `lawyers_id`) VALUES
(33, '1', 20),
(32, '2', 20),
(31, '3', 20),
(30, '4', 20),
(29, '5', 20),
(27, '1', 17),
(26, '2', 17),
(25, '3', 17),
(24, '3', 19),
(23, '4', 19),
(20, '5', 17),
(22, '5', 19),
(21, '4', 17),
(34, '5', 22),
(36, '4', 22),
(37, '3', 22),
(38, '2', 22),
(39, '1', 22),
(40, '5', 23),
(42, '4', 23),
(43, '3', 23),
(44, '2', 23),
(45, '1', 23),
(46, '5', 21),
(47, '4', 21),
(48, 'Administrative_Issues', 21),
(49, 'Personal_Status', 27),
(50, 'Administrative_Issues', 27),
(51, 'Civil_cases', 27),
(52, 'Business', 28),
(53, 'Administrative_Issues', 28),
(54, 'Civil_cases', 28),
(55, 'Personal_Status', 29),
(56, 'Civil_cases', 29),
(57, 'Administrative_Issues', 29),
(58, 'Business', 29),
(59, 'Workers', 29),
(60, 'Personal_Status', 30),
(61, 'Civil_cases', 30),
(62, 'Personal_Status', 25),
(63, 'Civil_cases', 25),
(64, 'Administrative_Issues', 25),
(65, 'Business', 25),
(66, 'Workers', 25),
(67, 'Personal_Status', 24),
(68, 'Civil_cases', 24),
(69, 'Administrative_Issues', 24),
(70, 'Business', 24),
(71, 'Workers', 24),
(72, 'Personal_Status', 31),
(73, 'Civil_cases', 31),
(74, 'Personal_Status', 33),
(75, 'Personal_Status', 33),
(76, 'Civil_cases', 33),
(77, 'Administrative_Issues', 33),
(78, 'Business', 33),
(79, 'Workers', 33);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_04_03_231610_create_contacts_table', 1),
('2016_04_03_231610_create_issues_table', 1),
('2016_04_03_231610_create_lawyers_table', 1),
('2016_04_03_231610_create_types_table', 1),
('2016_04_03_231620_create_foreign_keys', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` int(30) NOT NULL,
  `type` varchar(70) NOT NULL,
  `isFree` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `type`, `isFree`) VALUES
(1, 'Workers', 0),
(2, 'Business', 0),
(3, 'Administrative_Issues\r\n', 0),
(4, 'Civil_cases', 0),
(5, 'Personal_Status', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_phone_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `user_phone_number`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'عبير الشهري', 'ro-a-ro@hotmail.com', '', '$2y$10$Xr0dOstfowNkzePyb79gvucymkmZ2W3ZalgK2O5yZEYnaw83kPNBq', 'VohWaF6MXce39ZmeAq0CZSSO0v3TCY28GzcXlSIZSbXc6GYXE0CDvI7Q3Y4A', '2016-04-24 14:43:27', '2016-07-25 22:27:43'),
(2, 'وجدان عسيري', 'wejdan-sh@live.com', '', '$2y$10$5QEg2PWid.JKdspPmsqJKegKd0fc7fZup84sUM23FGv2ht9B.CPTS', 'nAahiFRjdArwnc147wHWYZ6xK623yzXWnIFktLFAr4f3Lrga3kG28rH8opnr', '2016-04-24 14:26:40', '2016-04-24 14:27:42'),
(3, 'فاطمه برناوي', 'toomaa4@hotmail.com', '', '$2y$10$TBlNvrrZ/3GBaB0PGcWb1O9ZQ000naXhX/e/M6Prnp.EpUf/FrHzq', 'TzrgoaBCtLvt5TBODHj5wWON42LcoFZ4v2LptnqZfuvThHjWu1XLrYOmTBZM', '2016-04-24 14:37:45', '2016-07-23 16:47:29'),
(4, 'امجاد المولد', 'amjad119e@gmail.com', '', '$2y$10$yGDQ2ROkepVwsWyrTIR/3uS.kclZxdY4SVYcEWMm.Kz4iiIJ2nXGW', '4kqHv8tpvEj0cYwUA3YUrjR11h31La5NwB9VY6HHB8j8Lz3AuIMjwnnNAd8r', '2016-04-24 14:39:11', '2016-04-24 14:39:20'),
(6, 'amjad', 'aaa@gmail.com', '223424', '123', NULL, '2016-08-03 21:00:00', NULL),
(7, 'amjad', 'aas@fd', '34534', '123', NULL, NULL, NULL),
(8, 'amjad', 'sfsdfsd@fd', '34sdfsd534', '1sdfsdf23', NULL, NULL, NULL),
(9, 'Ø§Ù…Ø¬Ø§Ø¯', 'sdfsd@fd', '34sdfdfdsfsdfsd534', '1sdfsdfsfsf23', NULL, NULL, NULL),
(10, 'مجواامجاد', 's@fd', '34sdfdfdsfsdfsd534', '1sdfsdfsfsf23', NULL, NULL, NULL),
(11, 'جولي', 'ss@fd', '34sd3fdfdsfsdfsd534', '1sdfsdfsfsf23', NULL, NULL, NULL),
(12, 'جولي', 'ssf@fd', '34sd3fdfdsfsdfsd534', '1sdfsdfsfsf23', NULL, NULL, NULL),
(13, 'جودي', '4ssf@fd', '34sd3fdfdsfsdfsd534', '1sdfsdfsfsf23', NULL, NULL, NULL),
(14, 'juda', 'jojo@c.v', '000863', '123', NULL, NULL, NULL),
(15, 'juda', 'jojo33@c.v', '000863', '123', NULL, NULL, NULL),
(16, 'juda', 'jojo2@c.v', '000863', '123', NULL, NULL, NULL),
(17, 'juda', 'jojo42@c.v', '000863', '123', NULL, NULL, NULL),
(18, 'juda', 'jjjjj@c.v', '000863', '123', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issues_id_types_foreign` (`type_id`),
  ADD KEY `issues_id_lawyers_foreign` (`lawyer_id`),
  ADD KEY `ID_types` (`type_id`,`lawyer_id`);

--
-- Indexes for table `lawyers`
--
ALTER TABLE `lawyers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lawyers_replies`
--
ALTER TABLE `lawyers_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lawyers_type`
--
ALTER TABLE `lawyers_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `types_id_lawyers_foreign` (`lawyers_id`),
  ADD KEY `type_id` (`type_id`,`lawyers_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `lawyers`
--
ALTER TABLE `lawyers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `lawyers_replies`
--
ALTER TABLE `lawyers_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `lawyers_type`
--
ALTER TABLE `lawyers_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
