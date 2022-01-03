-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2021 at 06:06 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `product`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Category` varchar(100) NOT NULL,
  `Brand` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `Price`, `Category`, `Brand`) VALUES
(3, 25, 'Shampoo', 'Pantene'),
(9, 5, 'Toffee', 'Pulse'),
(10, 17, 'Soap', 'Cinthol'),
(11, 14, 'Coldrink', 'Coca Cola'),
(12, 8, 'Notebook', 'Classmate'),
(13, 12, 'Milk', 'Amul'),
(14, 15, 'Milk', 'MotherDairy'),
(15, 26, 'Milk', 'Ganga'),
(16, 38, 'Milk', 'Gharjaisa'),
(17, 5, 'Pencil', 'HB'),
(18, 10, 'Pencil', 'Camel'),
(19, 7, 'Pencil', 'Natraj'),
(20, 9, 'Pencil', 'Sparker'),
(21, 25, 'Charger', 'Oppo'),
(22, 25, 'hdcbd', 'dcd'),
(23, 266, 'cd', 'dc'),
(24, 25, 'Rubber', 'Camel'),
(25, 0, 'vdv', 'fvf'),
(26, 1, 'fvf', 'fvgfbvgfbgbg'),
(27, 25, 'Bottel', 'Bisleri');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
