-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 21, 2026 at 06:09 PM
-- Server version: 8.0.45
-- PHP Version: 8.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `analytics_daily`
--

CREATE TABLE `analytics_daily` (
  `id` int NOT NULL,
  `campus` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `total_visits` int DEFAULT '0',
  `self_study_count` int DEFAULT '0',
  `reading_books_count` int DEFAULT '0',
  `computer_access_count` int DEFAULT '0',
  `unique_students` int DEFAULT '0',
  `unique_visitors` int DEFAULT '0',
  `unique_lecturers` int DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `attender_type` varchar(20) DEFAULT 'Student' COMMENT 'Student, Lecturer, Visitor',
  `reg_number` varchar(50) DEFAULT NULL,
  `faculty` varchar(100) DEFAULT NULL,
  `lecturer_category` varchar(50) DEFAULT NULL COMMENT 'Full-Time, Part-Time',
  `national_id` varchar(50) DEFAULT NULL,
  `visitor_id` varchar(50) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `occupation_other` varchar(100) DEFAULT NULL,
  `action` varchar(50) NOT NULL COMMENT 'Self Study, Reading Books, Computer Access',
  `computer_code` varchar(50) DEFAULT NULL,
  `checkin_time` datetime NOT NULL,
  `checkout_time` datetime DEFAULT NULL,
  `campus` varchar(50) NOT NULL,
  `nfc_uid` varchar(100) DEFAULT NULL COMMENT 'Linked to students.nfc_uid',
  `student_id` int DEFAULT NULL COMMENT 'Linked to students.id',
  `recorded_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `full_name`, `attender_type`, `reg_number`, `faculty`, `lecturer_category`, `national_id`, `visitor_id`, `phone_number`, `occupation`, `occupation_other`, `action`, `computer_code`, `checkin_time`, `checkout_time`, `campus`, `nfc_uid`, `student_id`, `recorded_by`, `created_at`) VALUES
(2, 'ISHIMWE ADELAIDE', 'Student', '21880/2023', 'Law', NULL, NULL, NULL, NULL, NULL, NULL, 'Self Study', NULL, '2026-09-21 20:58:28', '2026-09-21 20:58:40', 'rwamagana', '1B67E7E6', NULL, 3, '2026-09-21 17:58:28'),
(3, 'Keza anne', 'Student', '213388', 'Law', NULL, NULL, NULL, NULL, NULL, NULL, 'Browing', NULL, '2026-09-21 21:00:00', '2026-09-21 21:00:04', 'rwamagana', NULL, NULL, 3, '2026-09-21 18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `book_lending`
--

CREATE TABLE `book_lending` (
  `id` int NOT NULL,
  `borrower_name` varchar(100) NOT NULL,
  `borrower_type` varchar(20) NOT NULL COMMENT 'Student, Lecturer, Visitor',
  `reg_number` varchar(50) DEFAULT NULL,
  `lecturer_category` varchar(50) DEFAULT NULL,
  `national_id` varchar(50) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `visitor_id` varchar(50) DEFAULT NULL,
  `visitor_tel` varchar(20) DEFAULT NULL,
  `book_title` varchar(200) NOT NULL,
  `book_code` varchar(50) NOT NULL,
  `date_borrowed` date NOT NULL,
  `date_due` date NOT NULL,
  `date_returned` date DEFAULT NULL,
  `campus` varchar(50) NOT NULL,
  `recorded_by` int DEFAULT NULL,
  `returned_by` int DEFAULT NULL,
  `item_type` varchar(50) NOT NULL DEFAULT 'Book',
  `computer_code` varchar(50) DEFAULT NULL,
  `computer_type` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `book_lending`
--

INSERT INTO `book_lending` (`id`, `borrower_name`, `borrower_type`, `reg_number`, `lecturer_category`, `national_id`, `tel`, `visitor_id`, `visitor_tel`, `book_title`, `book_code`, `date_borrowed`, `date_due`, `date_returned`, `campus`, `recorded_by`, `returned_by`, `item_type`, `computer_code`, `computer_type`, `created_at`) VALUES
(1, 'KEZA Alice', 'Student', '21660/2024', '', '', '', '', '', 'MATHEMATICS', 'IMATH0101', '2026-09-02', '2026-09-03', '2026-09-09', 'rwamagana', NULL, 3, 'Book', NULL, NULL, '2026-09-02 10:36:02');

-- --------------------------------------------------------

--
-- Table structure for table `nfc_sessions`
--

CREATE TABLE `nfc_sessions` (
  `id` int NOT NULL,
  `nfc_uid` varchar(100) NOT NULL,
  `action` varchar(50) DEFAULT NULL COMMENT 'tap_in, tap_out, register',
  `device_info` varchar(255) DEFAULT NULL COMMENT 'Browser/Device used',
  `session_data` text COMMENT 'Additional session data',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nfc_sessions`
--

INSERT INTO `nfc_sessions` (`id`, `nfc_uid`, `action`, `device_info`, `session_data`, `created_at`) VALUES
(4, '1B67E7E6', 'scan_lookup', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', 'Lookup for student: ISHIMWE ADELAIDE', '2026-09-21 17:58:19');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int NOT NULL,
  `nfc_uid` varchar(100) NOT NULL COMMENT 'NFC Card Unique ID',
  `full_name` varchar(100) NOT NULL,
  `reg_number` varchar(50) NOT NULL,
  `faculty` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `campus` varchar(50) NOT NULL COMMENT 'kigali, nyanza, rwamagana',
  `status` enum('active','inactive') DEFAULT 'active',
  `registered_by` int DEFAULT NULL COMMENT 'user_id who registered this student',
  `registered_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `role` enum('superadmin','campus_admin') DEFAULT 'campus_admin',
  `campus` varchar(50) DEFAULT NULL COMMENT 'kigali, nyanza, rwamagana, superadmin',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`, `role`, `campus`, `created_at`) VALUES
(1, 'superadmin', '0192023a7bbd73250516f069df18b500', 'Library Director', 'superadmin', 'superadmin', '2026-02-13 18:52:20'),
(2, 'Bob', '5ab152a93d0ae610038bfae2de840e74', 'NTAKIRUTIMANA Bob', 'campus_admin', 'kigali', '2026-02-14 09:31:56'),
(3, 'rwamagana_lib753', '5ab152a93d0ae610038bfae2de840e74', 'NTAMAJANA Beatrice', 'campus_admin', 'rwamagana', '2026-09-02 10:21:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `analytics_daily`
--
ALTER TABLE `analytics_daily`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_campus_date` (`campus`,`date`),
  ADD KEY `idx_date` (`date`),
  ADD KEY `idx_campus` (`campus`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_campus` (`campus`),
  ADD KEY `idx_checkin` (`checkin_time`),
  ADD KEY `idx_checkout` (`checkout_time`),
  ADD KEY `idx_nfc` (`nfc_uid`),
  ADD KEY `idx_student` (`student_id`),
  ADD KEY `idx_attender_type` (`attender_type`),
  ADD KEY `idx_action` (`action`);

--
-- Indexes for table `book_lending`
--
ALTER TABLE `book_lending`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_campus` (`campus`),
  ADD KEY `idx_borrower_type` (`borrower_type`),
  ADD KEY `idx_due` (`date_due`),
  ADD KEY `idx_returned` (`date_returned`),
  ADD KEY `idx_book_code` (`book_code`),
  ADD KEY `idx_borrower_name` (`borrower_name`);

--
-- Indexes for table `nfc_sessions`
--
ALTER TABLE `nfc_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nfc` (`nfc_uid`),
  ADD KEY `idx_created` (`created_at`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nfc_uid` (`nfc_uid`),
  ADD KEY `registered_by` (`registered_by`),
  ADD KEY `idx_campus` (`campus`),
  ADD KEY `idx_nfc` (`nfc_uid`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `idx_campus` (`campus`),
  ADD KEY `idx_role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `analytics_daily`
--
ALTER TABLE `analytics_daily`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `book_lending`
--
ALTER TABLE `book_lending`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nfc_sessions`
--
ALTER TABLE `nfc_sessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`registered_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
