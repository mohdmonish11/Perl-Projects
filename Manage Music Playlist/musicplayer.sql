-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2021 at 02:42 PM
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
-- Database: `musicplayer`
--

-- --------------------------------------------------------

--
-- Table structure for table `play_list_names`
--

CREATE TABLE `play_list_names` (
  `Sno` int(11) NOT NULL,
  `Name_P` varchar(200) NOT NULL,
  `Created_by` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `play_list_names`
--

INSERT INTO `play_list_names` (`Sno`, `Name_P`, `Created_by`) VALUES
(5, 'Romantic', 'Monish'),
(11, 'New Song', 'Monish');

-- --------------------------------------------------------

--
-- Table structure for table `play_list_songs`
--

CREATE TABLE `play_list_songs` (
  `Sno` int(11) NOT NULL,
  `Playlist_Name` varchar(200) NOT NULL,
  `SongName` varchar(200) NOT NULL,
  `SingerName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `play_list_songs`
--

INSERT INTO `play_list_songs` (`Sno`, `Playlist_Name`, `SongName`, `SingerName`) VALUES
(4, 'Romantic', 'Pehli Dafaa', 'Sagar Gupta'),
(5, 'Romantic', 'Nadaan Parinday', 'Arjit Singh'),
(6, 'Romantic', 'Mai Jis Din Bhula Du', 'Jubin Nautiyal'),
(7, 'Romantic', 'Matargasti', 'Mohit Chauhan');

-- --------------------------------------------------------

--
-- Table structure for table `song`
--

CREATE TABLE `song` (
  `Sno` int(11) NOT NULL,
  `Song_Name` varchar(200) NOT NULL,
  `Singer_Name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `song`
--

INSERT INTO `song` (`Sno`, `Song_Name`, `Singer_Name`) VALUES
(1, 'Nadaan Parinday', 'Arjit Singh'),
(2, 'Dil Chahte ho', 'Payal Dev'),
(3, 'Mai Jis Din Bhula Du', 'Jubin Nautiyal'),
(4, 'Matargasti', 'Mohit Chauhan'),
(5, 'Khawaja Mere Khawaja', 'A R Rahman'),
(6, 'Kun Faya Kun', 'A R Rahman'),
(7, 'Meri Aashiqui', 'Jubin Nautiyal'),
(8, 'Khairiyat', 'Arjit Singh'),
(9, 'Mirchi', 'Divine'),
(10, 'Kabira', 'Pritam Chakarborty'),
(11, 'Zindagi kuch Toh Bata', 'Pritam Chakarborty'),
(12, 'Pehli Dafaa', 'Sagar Gupta'),
(13, 'Mujko Barsaat Bna lo', 'Armaan Malik'),
(14, 'Dil Ibaadat Kr rha', 'Mohit Chauhan'),
(15, 'Chala Chala', 'NO body');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `play_list_names`
--
ALTER TABLE `play_list_names`
  ADD PRIMARY KEY (`Sno`);

--
-- Indexes for table `play_list_songs`
--
ALTER TABLE `play_list_songs`
  ADD PRIMARY KEY (`Sno`);

--
-- Indexes for table `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`Sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `play_list_names`
--
ALTER TABLE `play_list_names`
  MODIFY `Sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `play_list_songs`
--
ALTER TABLE `play_list_songs`
  MODIFY `Sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `song`
--
ALTER TABLE `song`
  MODIFY `Sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
