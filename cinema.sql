-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2024 at 08:58 AM
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
-- Database: `cinema`
--

-- --------------------------------------------------------

--
-- Table structure for table `corders`
--

CREATE TABLE `corders` (
  `canid` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `oid` int(10) NOT NULL,
  `refund` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `fid` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `feed` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `mid` int(10) NOT NULL,
  `mName` varchar(50) NOT NULL,
  `descriprion` text NOT NULL,
  `actors` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`mid`, `mName`, `descriprion`, `actors`, `price`, `photo`) VALUES
(1, 'Iron Man 3', '\"Iron Man 3\" follows Tony Stark as he faces a powerful new enemy, the Mandarin, while grappling with the aftermath of the events in \"The Avengers.\" With his world shattered, Stark must rely on his intellect and resourcefulness to protect those he loves and stop a global threat.', 'Robert Downey Jr', 2000, 'uploads/iron-man-3-fan-made-poster-iron-man-33779176-1200-1663.png'),
(3, 'Sniper Vengeance', '\"Sniper Vengeance\" follows the story of an elite sniper, who embarks on a mission of personal vengeance after his mentor is killed in cold blood. Get ready for a relentless pursuit of justice and retribution.', 'Gao Zhan', 2000, 'uploads/SV.jpg'),
(4, 'Deadpool 3', '\"Deadpool 3\" brings the irreverent antihero back for more action-packed chaos and humor. As Deadpool navigates a world filled with superpowered beings, he forms unexpected alliances and faces new threats.', 'Ryan Reynolds', 2000, 'uploads/Death Pool.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `oId` int(10) NOT NULL,
  `uId` int(10) NOT NULL,
  `sId` int(10) NOT NULL,
  `payment` int(11) NOT NULL,
  `seatNo` varchar(10) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE `shows` (
  `sId` int(10) NOT NULL,
  `mId` int(10) NOT NULL,
  `noSeat` int(10) NOT NULL,
  `time` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`sId`, `mId`, `noSeat`, `time`, `date`, `price`) VALUES
(2, 1, 0, '10:00:00', '2024-12-06', 2000),
(3, 1, 0, '18:00:00', '2024-12-08', 2000),
(4, 3, 0, '10:00:00', '2024-12-10', 2000),
(5, 1, 0, '18:00:00', '2024-12-13', 2000),
(6, 3, 0, '14:00:00', '2024-12-17', 2000),
(7, 1, 0, '18:00:00', '2024-12-15', 2000),
(8, 3, 0, '10:00:00', '2024-12-15', 2000),
(9, 4, 0, '18:00:00', '2024-12-17', 2000),
(10, 3, 0, '10:00:00', '2024-12-16', 2000),
(11, 4, 0, '14:00:00', '2024-12-16', 2000),
(12, 1, 0, '18:00:00', '2024-12-16', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `tp` varchar(50) NOT NULL,
  `isAdmin` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `uname`, `password`, `tp`, `isAdmin`) VALUES
(1, 'snathandaniel81@gmail.com', 'Nathan', 'nathan', ' ', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `corders`
--
ALTER TABLE `corders`
  ADD PRIMARY KEY (`canid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`oId`);

--
-- Indexes for table `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`sId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `corders`
--
ALTER TABLE `corders`
  MODIFY `canid` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `mid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `oId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shows`
--
ALTER TABLE `shows`
  MODIFY `sId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
