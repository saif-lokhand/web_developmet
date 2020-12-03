-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2020 at 06:29 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `safina`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `Sno` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone_number` varchar(15) NOT NULL,
  `Message` text NOT NULL,
  `Date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`Sno`, `Name`, `Email`, `Phone_number`, `Message`, `Date`) VALUES
(1, 'saif', 'saif@gmail.com', '1234567890', 'hey', '2020-11-30 15:46:35'),
(2, 'saifuddin', 'saifuddin@gmail.com', '9876543210', 'nyc website', '2020-12-03 22:40:53');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `Sno` int(11) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Slug` varchar(50) NOT NULL,
  `Content` varchar(500) NOT NULL,
  `Img_file` varchar(25) NOT NULL,
  `Date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`Sno`, `Title`, `Slug`, `Content`, `Img_file`, `Date`) VALUES
(1, 'Python (programming language)', 'python-post', 'Python is an interpreted, high-level and general-purpose programming language. Python\'s design philosophy emphasizes code readability with its notable use of significant whitespace. Its language constructs and object-oriented approach aim to help programmers write clear, logical code for small and large-scale projects.', 'python-bg.png', '2020-12-03 22:42:07'),
(2, 'Car', 'car', 'A car is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four tires, and mainly transport people rather than goods.', 'car-bg.jpg', '2020-12-03 22:42:44'),
(3, 'Computer', 'computer', 'A computer is a machine that can be instructed to carry out sequences of arithmetic or logical operations automatically via computer programming. Modern computers have the ability to follow generalized sets of operations, called programs. These programs enable computers to perform an extremely wide range of tasks. A \"complete\" computer including the hardware, the operating system (main software), and peripheral equipment required and used for \"full\" operation can be referred to as a computer sys', 'computer-bg.jpg', '2020-12-03 00:46:08'),
(4, 'Skydiving', 'skydiving-post', 'Skydiving is parachuting from an airplane for fun. Skydiving can be done individually and with groups of people. Training is required. Unlike most paratroopers, skydivers often wait until they are low, before opening the parachute. The jump can also be made from a helicopter or a balloon that is high enough in the sky. Skydiving can be an exciting sport.', 'skydiving-bg.jpg', '2020-12-03 11:32:05'),
(5, 'Rafting', 'rafting-post', 'Rafting is an outdoor sport in which a person uses an inflatable raft to navigate a river or other body of water. This is often done on rough water. This usually requires teamwork.[1] Rafting is a dangerous sport. People can die while rafting. Rafting is also a competitive sport.', 'rafting-bg.jpg', '2020-12-03 22:45:25'),
(6, 'India', 'india-post', 'India is a country in Asia. It has an area of 3,287,263 square kilometres (1,269,219 sq mi). It is at the center of South Asia. India has more than 1.2 billion (1,210,000,000) people, which is the second largest population in the world.[15] It is the seventh largest country in the world by area and the largest country in South Asia. It is also the most populous democracy in the world', 'indianflag-bg.png', '2020-12-03 11:15:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`Sno`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`Sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `Sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `Sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
