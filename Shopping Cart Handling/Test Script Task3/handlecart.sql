-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2021 at 03:04 PM
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
-- Database: `handlecart`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `Sno` int(11) NOT NULL,
  `ItemName` varchar(200) NOT NULL,
  `Price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `TaxAmount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`Sno`, `ItemName`, `Price`, `qty`, `TaxAmount`) VALUES
(46, 'Bread', 70, 2, 10),
(47, 'Clock', 3000, 2, 100),
(48, 'Brush', 160, 4, 12);

-- --------------------------------------------------------

--
-- Table structure for table `stockitems`
--

CREATE TABLE `stockitems` (
  `Sno` int(11) NOT NULL,
  `ItemName` varchar(20) NOT NULL,
  `PricePerUnit` int(11) NOT NULL,
  `TaxAmount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stockitems`
--

INSERT INTO `stockitems` (`Sno`, `ItemName`, `PricePerUnit`, `TaxAmount`) VALUES
(2, 'Hp Laptop', 45000, 500),
(3, 'Television', 60000, 1500),
(4, 'Washing Machine', 12000, 350),
(5, 'Invertor', 15000, 1300),
(6, 'Bed', 30000, 250),
(7, 'Brush', 40, 3),
(8, 'Clock', 1500, 50),
(9, 'Wrist Watch', 8000, 1500),
(10, 'Spects', 2600, 250),
(11, 'Bread', 35, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`Sno`);

--
-- Indexes for table `stockitems`
--
ALTER TABLE `stockitems`
  ADD PRIMARY KEY (`Sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `Sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `stockitems`
--
ALTER TABLE `stockitems`
  MODIFY `Sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
