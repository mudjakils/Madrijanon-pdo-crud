-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2024 at 09:59 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `it28-ecommerce.sql`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'admin', '$2y$10$kGp4g1TjBK4XwLIwRbBHSeZ4W5FpPbYoB1ap5NfFUjUPAcE3KR5QG', '2024-04-29 16:39:58'),
(0, 'jimjim', '$2y$10$MBe5y9.ZFkpJZnLImk8VoODPlNAHmLo4bACZtk/kdyqsixB7nU3hC', '2024-05-24 22:15:50'),
(0, 'jim', '$2y$10$X//sBW8xjgFshs3GOfJAbeeGoufNHrBJUIZzmsIJkaeKqMTt3KnWq', '2024-05-24 22:17:14'),
(0, 'admin11', '$2y$10$vrDO0OMbqLTT6MsAvo4rrO/4KgWmKCFzNDML9ZDISOEApzUpPPkny', '2024-05-24 22:18:34'),
(0, 'admin111', '$2y$10$8pBIrPSeNS5Q/rH4/Or3XOwDOiZL70OiVFdbqlnUG7r.sQkv1QcuK', '2024-05-27 15:26:34'),
(0, 'moymoy', '$2y$10$eO8jKnR6NewAGxmOOP0rI.U/JjLkgbpyPRYNTa/ImrF2Q3J3/5YN2', '2024-05-27 15:27:02'),
(0, 'moimoi', '$2y$10$kJ1UYH.BpB2Qq4pF6suLx.Ub8JpQQCF2Csv05zIactOIJyPtm.B/O', '2024-05-27 15:32:13');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
