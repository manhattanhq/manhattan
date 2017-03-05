-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2017 at 11:44 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Manhattan`
--

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
    `pharmacy_id` int(11) NOT NULL,
    `pharmaceutical_company_id` int(11) NOT NULL,
    `start_date` date NOT NULL,
    `end_date` date NOT NULL,
    `text` varchar(50),
    `supervisor` varchar(20),
    PRIMARY KEY (`pharmacy_id`,`pharmaceutical_company_id`),
    KEY `pharmacy_id` (`pharmacy_id`),
    KEY `pharmaceutical_company_id` (`pharmaceutical_company_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Stand-in structure for view `contracts_initialized_in_2016`
--

DROP TABLE IF EXISTS `contracts_initialized_in_2016`;
CREATE TABLE `contracts_initialized_in_2016` (
    `pharmacy_id` int(11) NOT NULL,
    `pharmaceutical_company_id` int(11) NOT NULL,
    `text` varchar(50),
    `supervisor` varchar(20),
    `start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Stand-in structure for view `contracts_terminated_in_2016`
--

DROP TABLE IF EXISTS `contracts_terminated_in_2016`;
CREATE TABLE `contracts_terminated_in_2016` (
    `pharmacy_id` int(11) NOT NULL,
    `pharmaceutical_company_id` int(11) NOT NULL,
    `text` varchar(50),
    `supervisor` varchar(20),
    `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
    `doctor_id` int(11) NOT NULL,
    `name` varchar(20) NOT NULL,
    `surname` varchar(20) NOT NULL,
    `specialty` varchar(20) NOT NULL,
    `experience_years` int(2),
    PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
CREATE TABLE `drug` (
    `drug_id` int(11) NOT NULL,
    `name` varchar(20) NOT NULL,
    `formula` varchar(30),
    `pharmaceutical_company_id` int(11) NOT NULL,
    PRIMARY KEY (`drug_id`),
    KEY `pharmaceutical_company_id` (`pharmaceutical_company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `make`
--

DROP TABLE IF EXISTS `make`;
CREATE TABLE `make` (
    `drug_id` int(11) NOT NULL,
    `pharmaceutical_company_id` int(11) NOT NULL,
    PRIMARY KEY (`drug_id`),
    KEY `pharmaceutical_company_id` (`pharmaceutical_company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
    `patient_id` int(11) NOT NULL,
    `name` varchar(20) NOT NULL,
    `surname` varchar(20) NOT NULL,
    `town` varchar(20) NOT NULL,
    `street_name` varchar(20),
    `number` int(11),
    `postalcode` int(11),
    `age` int(2) NOT NULL,
    `doctor_id` int(11) NOT NULL,
    PRIMARY KEY (`patient_id`),
    KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pharmaceutical_company`
--

DROP TABLE IF EXISTS `pharmaceutical_company`;
CREATE TABLE `pharmaceutical_company` (
    `pharmaceutical_company_id` int(11) NOT NULL,
    `name` varchar(20) NOT NULL,
    `phone_number` int(15),
    PRIMARY KEY (`pharmaceutical_company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

DROP TABLE IF EXISTS `pharmacy`;
CREATE TABLE `pharmacy` (
    `pharmacy_id` int(11) NOT NULL,
    `name` varchar(20) NOT NULL,
    `town` varchar(20) NOT NULL,
    `street_name` varchar(20),
    `number` int(11),
    `postalcode` int(11),
    `phone_number` int(15) NOT NULL,
    PRIMARY KEY (`pharmacy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
CREATE TABLE `prescription` (
    `patient_id` int(11) NOT NULL,
    `doctor_id` int(11) NOT NULL,
    `drug_id` int(11) NOT NULL,
    `date` date NOT NULL,
    `quantity` int(10),
    PRIMARY KEY (`patient_id`,`doctor_id`,`drug_id`),
    KEY `patient_id` (`patient_id`),
    KEY `doctor_id` (`doctor_id`),
    KEY `drug_id` (`drug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `seen_by`
--

DROP TABLE IF EXISTS `seen_by`;
CREATE TABLE `seen_by` (
    `patient_id` int(11) NOT NULL,
    `doctor_id` int(11) NOT NULL,
    PRIMARY KEY (`patient_id`),
    KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sell`
--

DROP TABLE IF EXISTS `sell`;
CREATE TABLE `sell` (
    `pharmacy_id` int(11) NOT NULL,
    `drug_id` int(11) NOT NULL,
    `price` int(10),
    PRIMARY KEY (`pharmacy_id`,`drug_id`),
    KEY `pharmacy_id` (`pharmacy_id`),
    KEY `drug_id` (`drug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `pat1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `con1` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`pharmacy_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `sell`
--
ALTER TABLE `sell`
  ADD CONSTRAINT `sel1` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`pharmacy_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `pre1` FOREIGN KEY (`patient_id`) REFERENCES `pharmacy` (`pharmacy_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Structure for view `contracts_initialized_in_2016`
--
DROP TABLE IF EXISTS `contracts_initialized_in_2016`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `contracts_initialized_in_2016` AS select `contract`.`pharmacy_id` AS `pharmacy_id`,`contract`.`pharmaceutical_company_id` AS `pharmaceutical_company_id`,`contract`.`text` AS `text`,`contract`.`supervisor` AS `supervisor`,`contract`.`start_date` AS `start_date` from `contract` where (`contract`.`start_date` between '2016-01-01' and '2016-12-31');

--
-- Structure for view `contracts_terminated_in_2016`
--
DROP TABLE IF EXISTS `contracts_terminated_in_2016`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `contracts_terminated_in_2016` AS select `contract`.`pharmacy_id` AS `pharmacy_id`,`contract`.`pharmaceutical_company_id` AS `pharmaceutical_company_id`,`contract`.`text` AS `text`,`contract`.`supervisor` AS `supervisor`,`contract`.`end_date` AS `end_date` from `contract` where (`contract`.`end_date` between '2016-01-01' and '2016-12-31');

--
-- Triggers `age_check`
--
DROP TRIGGER IF EXISTS `age_check`;
DELIMITER //
 CREATE TRIGGER `age_check` BEFORE INSERT ON `patient`
  FOR EACH ROW IF NEW.age < 0 THEN SET NEW.age = 0; END IF;
//
DELIMITER ;

--
-- Triggers `quantity_check`
--
DROP TRIGGER IF EXISTS `quantity_check`;
DELIMITER //
 CREATE TRIGGER `quantity_check` BEFORE INSERT ON `prescription`
  FOR EACH ROW IF NEW.quantity < 0 THEN SET NEW.quantity = 0; END IF;
//
DELIMITER ;

--
-- Triggers `xp_years_check`
--
DROP TRIGGER IF EXISTS `xp_years_check`;
DELIMITER //
 CREATE TRIGGER `xp_years_check` BEFORE INSERT ON `doctor`
  FOR EACH ROW IF NEW.experience_years < 0 THEN SET NEW.experience_years = 0; END IF;
//
DELIMITER ;

--
-- Triggers `prescription_date_check`
--
DROP TRIGGER IF EXISTS `prescription_date_check`;
DELIMITER //
CREATE TRIGGER `date` AFTER INSERT ON `prescription`
 FOR EACH ROW BEGIN
SET@date=NOW();
END
//
DELIMITER ;

--
-- Triggers `contract_date_check`
--
DROP TRIGGER IF EXISTS `contract_date_check`;
DELIMITER //
CREATE TRIGGER `contract_date_check` AFTER INSERT ON `contract`
 FOR EACH ROW BEGIN
SET@start_date=NOW();
END
//
DELIMITER ;


--
-- Triggers `pharmacy_deletion`
--
DROP TRIGGER IF EXISTS `pharmacy_deletion`;
DELIMITER //
CREATE TRIGGER `pharmacy_deletion` BEFORE DELETE ON `pharmacy`
  FOR EACH ROW BEGIN
  DELETE FROM contract
  WHERE OLD.pharmacy_id = contract.pharmacy_id;
  DELETE FROM sell
  WHERE OLD.pharmacy_id = sell.pharmacy_id;
END
//
DELIMITER ;

--
-- Triggers `drug_deletion`
--
DROP TRIGGER IF EXISTS `drug_deletion`;
DELIMITER //
CREATE TRIGGER `drug_deletion` BEFORE DELETE ON `drug`
  FOR EACH ROW BEGIN
  DELETE FROM sell
  WHERE OLD.drug_id = sell.drug_id;
  DELETE FROM prescription
  WHERE OLD.drug_id = prescription.drug_id;
END
//
DELIMITER ;

--
-- Triggers `drug_creation`
--
DROP TRIGGER IF EXISTS `drug_creation`;
DELIMITER //
CREATE TRIGGER `drug_creation` AFTER INSERT `drug`
  FOR EACH ROW BEGIN
  INSERT INTO sell
  VALUES (new.drug_id);
  INSERT INTO prescription
  VALUES (new.drug_id);
END
//
DELIMITER ;

  -- --------------------------------------------------------
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
