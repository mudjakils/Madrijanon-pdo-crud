-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2024 at 11:10 AM
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
-- Database: `u593341949_db_madrijanon`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `rrp` decimal(10,0) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL,
  `img` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `rrp`, `quantity`, `img`, `date_added`) VALUES
(1, 'Ninja 400', 'kaibog', '1', '1', 50, 'https://www.kawasaki.com/Content/Images/SubBrand/2024-ninja/my24_ninja_500.png', '2024-05-08 00:00:00'),
(2, 'Ninja H2® SX', 'gwapo', '2', '2', 30, 'https://content2.kawasaki.com/ContentStorage/KMC/ProductTrimGroup/63/028bb8b8-ccc1-4394-b30a-95d27515a16a.png?w=600', '2024-05-08 00:00:00'),
(3, 'NINJA® e-1', 'lami', '2', '2', 2, 'https://www.kawasaki.com/Content/Images/SubBrand/2024-ninja/my24_sblp_studio_0322.png?w=600', '2024-05-08 00:00:00'),
(4, 'NINJA® 650', 'Plushed foam collar', '6120', '6120', 60, 'https://www.kawasaki.com/Content/Images/SubBrand/2023-ninja/Ninja_650.png', '2024-05-08 00:00:00'),
(5, 'NINJA® ZX™-4R', 'White & Beige Rocky', '6895', '6895', 20, 'https://www.kawasaki.com/Content/Images/SubBrand/2024-ninja/my24_ninja_zx_4r_abs.png', '2024-05-08 00:00:00'),
(6, 'NINJA® ZX™-6R', 'Quick & Easy Get Into', '6375', '6375', 1, 'https://www.kawasaki.com/Content/Images/SubBrand/2023-ninja/8897_6r_abs_blk.png', '2024-05-13 19:35:55'),
(7, 'NINJA® ZX™-10R', 'Premium & Synthetic Leather', '10200', '10200', 1, 'https://www.kawasaki.com/Content/Images/SubBrand/2024-ninja/my24_ninja_10r.jpg', '2024-05-13 19:39:14'),
(8, 'NINJA® ZX™-14R', 'Black & White Carbon', '7650', '7650', 1, 'https://content2.kawasaki.com/ContentStorage/KMC/ProductTrimGroup/65/cf1dd66a-9da6-426c-b0d2-9499b4803e61.png?w=600', '2024-05-13 19:40:05');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `rrp` decimal(10,0) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL,
  `img` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `title`, `description`, `price`, `rrp`, `quantity`, `img`, `date_added`) VALUES
(1, 'NINJA® e-1', 'lami', '2', '0', 1, 'https://www.kawasaki.com/Content/Images/SubBrand/2024-ninja/my24_sblp_studio_0322.png?w=600', '2024-06-03 10:37:36');

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
(14, 'mudjakils', '$2y$10$p0aNSLnHZ11rv4oaT.ZPiePyvE8JkV7HGYia032povhlEHCACzKxS', '2024-06-03 16:19:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
