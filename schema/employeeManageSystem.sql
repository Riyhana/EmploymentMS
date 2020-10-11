-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2020 at 11:10 AM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `erform`
--

-- --------------------------------------------------------

--
-- Table structure for table `commentinfo`
--

CREATE TABLE `commentinfo` (
  `id` int(11) NOT NULL,
  `emp_comment` text NOT NULL,
  `emp_id` int(11) NOT NULL,
  `status` enum('High','Low','Middle') NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `commentinfo`
--

INSERT INTO `commentinfo` (`id`, `emp_comment`, `emp_id`, `status`, `user_id`) VALUES
(1, 'Hi ', 5, 'High', 1),
(2, 'Salam ', 6, 'High', 2);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `dname` varchar(95) NOT NULL,
  `Dstart_up` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `dname`, `Dstart_up`, `user_id`) VALUES
(1, 'Database', '2020-09-11 06:27:36', 1),
(2, 'Network', '2020-09-11 06:27:45', 1),
(3, 'Marketing', '2020-09-11 06:27:55', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `firstname` varchar(65) NOT NULL,
  `lastname` varchar(65) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `emp_hired_date` date NOT NULL,
  `DOB` date NOT NULL,
  `gender` enum('Female','Male') NOT NULL,
  `Address` varchar(255) NOT NULL,
  `dp_id` int(11) NOT NULL,
  `emp_status` enum('choosed','delayed','rejected') NOT NULL,
  `cv_file_url` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'It is the role for admin or superAdmin.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `firstname`, `lastname`, `phone`, `emp_hired_date`, `DOB`, `gender`, `Address`, `dp_id`, `emp_status`, `cv_file_url`, `user_id`) VALUES
(5, 'Moha', 'Mohammadi', '0789374633', '2020-05-04', '2000-09-04', 'Female', 'kabul', 1, 'choosed', 'home/lib/ahmad.pdf', 1),
(6, 'Golam', 'Karimi', '0789374633', '2020-07-04', '1999-09-04', 'Female', 'kabul', 1, 'choosed', 'home/lib/Golam.pdf', 1),
(7, 'Sharif', 'kazemi', '0786543234', '2019-07-09', '1999-12-04', 'Female', 'Mazar', 2, 'choosed', 'lib/cv/sharif.pdf', 1),
(8, 'Naser', 'karimi', '0786543234', '2019-07-09', '1999-12-04', 'Female', 'Mazar', 2, 'choosed', 'lib/cv/Naser.pdf', 1),
(9, 'Maryam', 'Jalili', '0789374633', '2020-05-04', '1999-06-07', 'Female', 'Mastofeat,Herat', 1, 'choosed', 'home/lib/maryam.pdf', 1);

-- --------------------------------------------------------

--
-- Table structure for table `emp_qualification`
--

CREATE TABLE `emp_qualification` (
  `id` int(11) NOT NULL,
  `date_acheived` datetime NOT NULL,
  `date_expired` datetime NOT NULL,
  `emp_id` int(11) NOT NULL,
  `qual_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qualification`
--

CREATE TABLE `qualification` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `qual_amount` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(8) NOT NULL DEFAULT 'admin',
  `type` enum('Admin','SuperAdmin') NOT NULL,
  `select` int(1) NOT NULL DEFAULT '0',
  `insert` int(1) NOT NULL DEFAULT '0',
  `delete` int(1) NOT NULL DEFAULT '0',
  `updata` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `password`, `type`, `select`, `insert`, `delete`, `updata`) VALUES
(1, 'Riyhana', 'Admin', '12345', 'SuperAdmin', 1, 1, 1, 1),
(2, 'Nasrin', 'Haidari', 'admin', 'Admin', 1, 1, 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `commentinfo`
--
ALTER TABLE `commentinfo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dp_id` (`dp_id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `emp_qualification`
--
ALTER TABLE `emp_qualification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `qual_id` (`qual_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `qualification`
--
ALTER TABLE `qualification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usertype` (`type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `commentinfo`
--
ALTER TABLE `commentinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `emp_qualification`
--
ALTER TABLE `emp_qualification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `qualification`
--
ALTER TABLE `qualification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `commentinfo`
--
ALTER TABLE `commentinfo`
  ADD CONSTRAINT `commentinfo_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commentinfo_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`dp_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `emp_qualification`
--
ALTER TABLE `emp_qualification`
  ADD CONSTRAINT `emp_qualification_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emp_qualification_ibfk_2` FOREIGN KEY (`qual_id`) REFERENCES `qualification` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emp_qualification_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `qualification`
--
ALTER TABLE `qualification`
  ADD CONSTRAINT `qualification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
