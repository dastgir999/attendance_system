-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2025 at 11:27 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` enum('present','absent','late') DEFAULT 'absent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `student_id`, `date`, `status`) VALUES
(1, 1, '2025-02-22', 'present'),
(2, 2, '2025-02-22', 'present'),
(5, 1, '2025-02-21', 'present'),
(6, 2, '2025-02-21', 'present'),
(7, 1, '2025-02-20', 'present'),
(8, 2, '2025-02-20', 'present'),
(9, 1, '2025-02-18', 'present'),
(10, 2, '2025-02-18', 'present'),
(13, 1, '2025-02-16', 'absent'),
(14, 2, '2025-02-16', 'absent'),
(15, 1, '2025-02-14', 'absent'),
(16, 2, '2025-02-14', 'present'),
(21, 3, '2025-02-21', 'present'),
(22, 4, '2025-02-21', 'present'),
(25, 3, '2025-02-20', 'present'),
(26, 4, '2025-02-20', 'present'),
(29, 3, '2025-02-22', 'present'),
(30, 4, '2025-02-22', 'present'),
(31, 5, '2025-02-22', 'present'),
(36, 5, '2025-02-21', 'present');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `roll_no` varchar(20) NOT NULL,
  `class` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `roll_no`, `class`) VALUES
(1, 'John Doe', 'R001', 'Class A'),
(2, 'Jane Smith', 'R002', 'Class A'),
(3, 'Alham raza', '1', '1'),
(4, 'Md Tausif', '2', '1'),
(5, 'aman ali hasan', '3', '1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','teacher') DEFAULT 'teacher',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'admin', '$2y$10$YOUR_HASHED_PASSWORD', 'admin', '2025-02-22 08:58:17'),
(2, 'teacher1', '$2y$10$YOUR_HASHED_PASSWORD', 'teacher', '2025-02-22 08:58:17'),
(3, 'aman', '$2y$10$fc5VTXBV9.nlkCW8pV2RUuzjvZZgaxMP6lR1dWuqjy1XyMqrgTLle', 'teacher', '2025-02-22 09:24:21'),
(4, 'admin2', 'admin', 'admin', '2025-02-22 09:55:24'),
(5, 'admin3', '$2y$10$MHHGHbRrHVDRMdRAqYCW2.66jyfc1TUdZov.ta9lLRpNSLvA7gM0C', 'admin', '2025-02-22 09:56:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_id` (`student_id`,`date`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roll_no` (`roll_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
