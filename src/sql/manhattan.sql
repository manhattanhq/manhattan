-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2017 at 03:48 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `TEST14`
--

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE `contract` (
  `pharmacy_id` int(11) NOT NULL,
  `pharmaceutical_company_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `text` varchar(50) NOT NULL,
  `supervisor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `contract`
--
DELIMITER $$
CREATE TRIGGER `contract_date_check` AFTER INSERT ON `contract` FOR EACH ROW BEGIN
SET@start_date=NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `contracts_initialized_in_2016`
-- (See below for the actual view)
--
CREATE TABLE `contracts_initialized_in_2016` (
`pharmacy_id` int(11)
,`pharmaceutical_company_id` int(11)
,`text` varchar(50)
,`supervisor` varchar(20)
,`start_date` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `contracts_terminated_in_2016`
-- (See below for the actual view)
--
CREATE TABLE `contracts_terminated_in_2016` (
`pharmacy_id` int(11)
,`pharmaceutical_company_id` int(11)
,`text` varchar(50)
,`supervisor` varchar(20)
,`end_date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctor_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `specialty` varchar(20) NOT NULL,
  `experience_years` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `doctor`
--
DELIMITER $$
CREATE TRIGGER `xp_years_check` BEFORE INSERT ON `doctor` FOR EACH ROW IF NEW.experience_years < 0 THEN SET NEW.experience_years = 0; END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `drug`
--

CREATE TABLE `drug` (
  `drug_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `formula` varchar(30) NOT NULL,
  `pharmaceutical_company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `make`
--

CREATE TABLE `make` (
  `drug_id` int(11) NOT NULL,
  `pharmaceutical_company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `town` varchar(20) NOT NULL,
  `street_name` varchar(20) NOT NULL,
  `number` int(11) NOT NULL,
  `postalcode` int(11) NOT NULL,
  `age` int(2) NOT NULL,
  `doctor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `patient`
--
DELIMITER $$
CREATE TRIGGER `age_check` BEFORE INSERT ON `patient` FOR EACH ROW IF NEW.age < 0 THEN SET NEW.age = 0; END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pharmaceutical_company`
--

CREATE TABLE `pharmaceutical_company` (
  `pharmaceutical_company_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone_number` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `pharmacy_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `town` varchar(20) NOT NULL,
  `street_name` varchar(20) NOT NULL,
  `number` int(11) NOT NULL,
  `postalcode` int(11) NOT NULL,
  `phone_number` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `prescription`
--
DELIMITER $$
CREATE TRIGGER `date` AFTER INSERT ON `prescription` FOR EACH ROW BEGIN
SET@date=NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `quantity_check` BEFORE INSERT ON `prescription` FOR EACH ROW IF NEW.quantity < 0 THEN SET NEW.quantity = 0; END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `seen_by`
--

CREATE TABLE `seen_by` (
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sell`
--

CREATE TABLE `sell` (
  `pharmacy_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure for view `contracts_initialized_in_2016`
--
DROP TABLE IF EXISTS `contracts_initialized_in_2016`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `test14`.`contracts_initialized_in_2016`  AS  select `test14`.`contract`.`pharmacy_id` AS `pharmacy_id`,`test14`.`contract`.`pharmaceutical_company_id` AS `pharmaceutical_company_id`,`test14`.`contract`.`text` AS `text`,`test14`.`contract`.`supervisor` AS `supervisor`,`test14`.`contract`.`start_date` AS `start_date` from `test14`.`contract` where (`test14`.`contract`.`start_date` between '2016-01-01' and '2016-12-31') ;

-- --------------------------------------------------------

--
-- Structure for view `contracts_terminated_in_2016`
--
DROP TABLE IF EXISTS `contracts_terminated_in_2016`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `test14`.`contracts_terminated_in_2016`  AS  select `test14`.`contract`.`pharmacy_id` AS `pharmacy_id`,`test14`.`contract`.`pharmaceutical_company_id` AS `pharmaceutical_company_id`,`test14`.`contract`.`text` AS `text`,`test14`.`contract`.`supervisor` AS `supervisor`,`test14`.`contract`.`end_date` AS `end_date` from `test14`.`contract` where (`test14`.`contract`.`end_date` between '2016-01-01' and '2016-12-31') ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`pharmacy_id`,`pharmaceutical_company_id`),
  ADD KEY `pharmacy_id` (`pharmacy_id`),
  ADD KEY `pharmaceutical_company_id` (`pharmaceutical_company_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `drug`
--
ALTER TABLE `drug`
  ADD PRIMARY KEY (`drug_id`),
  ADD KEY `pharmaceutical_company_id` (`pharmaceutical_company_id`);

--
-- Indexes for table `make`
--
ALTER TABLE `make`
  ADD PRIMARY KEY (`drug_id`),
  ADD KEY `pharmaceutical_company_id` (`pharmaceutical_company_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `pharmaceutical_company`
--
ALTER TABLE `pharmaceutical_company`
  ADD PRIMARY KEY (`pharmaceutical_company_id`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`pharmacy_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`patient_id`,`doctor_id`,`drug_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `drug_id` (`drug_id`);

--
-- Indexes for table `seen_by`
--
ALTER TABLE `seen_by`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `sell`
--
ALTER TABLE `sell`
  ADD PRIMARY KEY (`pharmacy_id`,`drug_id`),
  ADD KEY `pharmacy_id` (`pharmacy_id`),
  ADD KEY `drug_id` (`drug_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `con1` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`pharmacy_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `pat1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `pre1` FOREIGN KEY (`patient_id`) REFERENCES `pharmacy` (`pharmacy_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `sell`
--
ALTER TABLE `sell`
  ADD CONSTRAINT `sel1` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`pharmacy_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
