-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2021 at 10:54 AM
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
-- Database: `studentmanagementsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `course_details`
--

CREATE TABLE `course_details` (
  `course_name` varchar(200) NOT NULL,
  `course_fee` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_details`
--

INSERT INTO `course_details` (`course_name`, `course_fee`, `course_id`, `description`) VALUES
('Data Science', 50000, 50, 'Study Material, Beginner to Advance level'),
('React Beginner', 5000, 51, 'Study Material, Live Projects, Tutorials'),
('French Language Diploma', 10000, 52, 'one year course with certification'),
('Bacherlor of Science', 20000, 53, 'three year course with certification'),
('Youtube', 15000, 54, 'Design thumbnail, youtube managment, monetisation planning'),
('Mobile Tech', 25000, 55, 'live practical on mobile hardware and software'),
('Software', 5000, 56, 'basic of MS office '),
('Stock Analyst', 50000, 57, 'Basic of Stocks, Candle Pattern, Technical Analysis');

-- --------------------------------------------------------

--
-- Table structure for table `student_course_details`
--

CREATE TABLE `student_course_details` (
  `Sno` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `fees_paid_amount` int(11) NOT NULL,
  `fees_left_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_course_details`
--

INSERT INTO `student_course_details` (`Sno`, `course_id`, `student_id`, `fees_paid_amount`, `fees_left_amount`) VALUES
(2, 52, 153, 5000, 5000),
(3, 54, 10005, 5000, 10000),
(8, 51, 10009, 2500, 0),
(9, 57, 10009, 25000, 25000);

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE `student_details` (
  `Name` varchar(100) NOT NULL,
  `student_id` int(11) NOT NULL,
  `Address` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`Name`, `student_id`, `Address`) VALUES
('Monish', 153, 'Bardarpur Delhi'),
('Mukul	', 10003, 'Banaras'),
('Abdul', 10005, 'Ayodhaya'),
('Shyam', 10008, 'Jaipur'),
('Brenda', 10009, 'Karnataka'),
('Akanasha', 10010, 'Noida');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course_details`
--
ALTER TABLE `course_details`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `student_course_details`
--
ALTER TABLE `student_course_details`
  ADD PRIMARY KEY (`Sno`),
  ADD KEY `student_course_details_ibfk_1` (`course_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student_details`
--
ALTER TABLE `student_details`
  ADD PRIMARY KEY (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course_details`
--
ALTER TABLE `course_details`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `student_course_details`
--
ALTER TABLE `student_course_details`
  MODIFY `Sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `student_details`
--
ALTER TABLE `student_details`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10011;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student_course_details`
--
ALTER TABLE `student_course_details`
  ADD CONSTRAINT `student_course_details_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_details` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
