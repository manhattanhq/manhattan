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

-- --------------------------------------------------------

--
-- Dumping data to tables
--

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_id`, `name`, `surname`, `specialty`, `experience_years`) VALUES
(1, 'Tsim', 'Booky', 'Cardiologist', 18),
(2, 'Mike', 'Litoris', 'Gynaecologist', 21),
(3, 'Christabella', 'Eggleston', 'Dermatologist', 9),
(4, 'Maggi', ' Holgate', 'Leprologist', 26),
(5, 'Cortney', 'Ryder', 'Neurologist', 22),
(6, 'Teodoro', ' Litwin', 'Orthopaedist', 30),
(7, 'Filberto', 'Chiogna', 'Urologist', 15),
(8, 'Gregorius', 'Afzal-khan', 'Sexologist', 20),
(9, 'Willie', 'Stanton', 'Radiologist', 11),
(10, 'Frankie', 'Gabor', 'Parasitologist', 5);
(11, 'Donald', 'Duck', 'Psychiatrist', 13);
(12, 'Michael', 'Heck', 'Urologist', 22);
(13, 'Andre', 'Young', 'Orthopaedist', 32);
(14, 'Romain', 'Blanc', 'Dermatologist', 10);
(15, 'DeShawn', 'Jackson', 'Sexologist', 17);
(16, 'Kimi', 'Raikkonen', 'Psychiatrist', 16);
(17, 'Ari', 'Vatanen', 'Cardiologist', 25);
(18, 'Rakim', 'Mayers', 'Radiologist', 6);
(19, 'Jarno', 'Trulli', 'Orthopaedist', 9);
(20, 'Calvin', 'Broadus', 'Pneumonologist', 20);

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `name`, `surname`, `town`, `street_name`, `number`, `postalcode`, `age`, `doctor_id`) VALUES
(1, 'Richard', 'Badillo', 'Chicago', 'Oakmound Road', 2538, 60647, 72, 1),
(2, 'William', 'Frazier', 'Detroit', 'Bombardier Way', 1248, 48219, 53 , 3),
(3, 'Nancy', 'Bonnell', 'Tampa', 'Saints Alley', 4459, 33624, 41, 2),
(4, 'Jennifer', 'May', 'Hilo', 'Randall Drive', 625, 96720, 61, 4),
(5, 'William', 'Cooper', 'Des Moines', 'Hazelwood Avenue', 3666, 50309, 77, 5),
(6, 'Jana', 'Winn', 'Ten Sleep', 'Arbor Court', 4792, 82442, 54, 6),
(7, 'Jason', 'Kleinman', 'Los Angeles', 'Canis Heights Drive', 1481, 90071, 21, 7),
(8, 'Rosalie', 'Regis', 'Pittsburgh', 'Pine Street', 2327, 15212, 83, 8),
(9, 'Gary', 'Hinton', 'Norfolk', 'Allison Avenue', 2529, 23510, 21, 9),
(10, 'Rosalie', 'Regis', 'Pittsburgh', 'Pine Street', 2327, 15212, 83, 10),
(11, 'Carlton', 'Chastain', 'Newark', 'Hilltop Haven Drive', 2313, 07102, 32, 7),
(12, 'Jerome', 'Melton', 'Farmingdale', 'Stanley Avenue', 3813, 11735, 77, 1),
(13, 'Sophia', 'Petersen', 'Sammamish', 'Stockert Hollow Road', 3318, 98053, 71, 3);
(14, 'Fernando', 'Soldado', 'New York', 'Wall Street', 2534, 19123, 46, 17);
(15, 'Lloyd', 'Banks', 'Compton', '2nd Street', 1233, 93425, 25, 16);
(16, 'Richard', 'Ferdinand', 'Synecdoche', 'King George Avenue', 662, 92415, 40, 20);
(17, 'Viggo', 'Geller', 'Los Angeles', 'Canis Heights Drive', 1230, 90071, 56, 18);
(18, 'Amber', 'Lancaster', 'Detroit', 'Main Avenue', 1532, 48252, 34, 15);


--
-- Dumping data for table `pharmacy`
--

INSERT INTO `pharmacy` (`pharmacy_id`, `name`, `town`, `street_name`, `number`, `postalcode`, `phone_number`) VALUES
(1, 'ACME Pharmacy', 'Chicago', 'Oakmound Road', 1450, 60647, 4258366485),
(2, 'Atlas Drugs', 'Detroit', 'Bombardier Way', 1308, 48219, 5152673748),
(3, 'Free Ganja', 'Tampa', 'Saints Alley', 4179, 33624, 5859488157),
(4, 'Buehler Pharmacy', 'Hilo', 'Randall Drive', 605, 96720, 9164569274),
(5, 'Discount Drug Mart', 'Des Moines', 'Hazelwood Avenue', 3606, 50309, 5082248438),
(6, 'Janckies United', 'Ten Sleep', 'Arbor Court', 4702, 82442, 7155224896),
(7, 'Family Fare Pharmacy', 'Los Angeles', 'Canis Heights Drive', 1491, 90071, 3198619201),
(8, 'Health Mart', 'Pittsburgh', 'Pine Street', 2387, 15212, 2567795407),
(9, 'Ingles Markets', 'Norfolk', 'Allison Avenue', 2549, 23510, 2812377851),
(10, 'Lifechek', 'Pittsburgh', 'Pine Street', 2350, 15212, 8315325671);
(11, 'Nature Store', 'Los Angeles', 'Canis Heights Drive', 250, 90071, 2814928491);
(12, 'Health Experts', 'Beverly Hills', 'Hollywood Avenue', 1242, 90210, 2914031829);
(13, 'Pharmalife', 'London', 'Beckham Street', 1125, 24501, 4149401922);
(14, 'Bambees', 'Chicago', 'MJ Street', 2323, 60648, 4258310529);

--
-- Dumping data for table `pharmaceutical_company`
--

INSERT INTO `pharmaceutical_company` (`pharmaceutical_company_id`, `name`, `phone_number`) VALUES
(1, 'ACMA', 7058366485),
(2, 'Atlasion', 6052673748),
(3, 'Ganjer', 9659488157),
(4, 'Buehlmeer', 4004569274),
(5, 'Drugmar', 3112248438),
(6, 'Drugunited', 9635224896),
(7, 'Cali', 4004569274),
(8, 'Narcos', 3112248438),
(9, 'Medellin', 9635224896),
(10, 'Pocuocos', 1336924896);
(11, 'Dealers Co.', 1920405279);
(12, 'Los Pollos Hermanos', 1924029104);
(13, 'Fring Laboratories', 9652014950);

--
-- Dumping data for table `drug`
--

INSERT INTO `drug` (`drug_id`, `name`, `formula`, `pharmaceutical_company_id`) VALUES
(1, 'Bakingsodium', 'NAHCO3', 1),
(2, 'Cocainot', 'C17H21NO4', 2),
(3, 'Borax', 'NaBO3', 3),
(4, 'Freon', 'CF2Cl2', 4),
(5, 'MEK', 'CH3COC2H5', 5),
(6, 'TSP', 'Na3PO4', 2),
(7, 'LYE', 'HCl', 6),
(8, 'LAG', 'N2O', 7),
(9, 'Bach', 'NaClO', 8),
(10, 'Alumum', 'Al2SO4', 9),
(11, 'Baren', 'BaCO3', 5),
(12, 'Calcioner', 'CaCO3', 4),
(13, 'Camphor', 'C10H16O', 8);

--
-- Dumping data for table `contract`
--

INSERT INTO `contract` (`pharmacy_id`, `pharmaceutical_company_id`, `start_date`, `end_date`, `supervisor`) VALUES
(1, 1, '2009-04-28', '2017-06-21', 'Fischer'),
(2, 2, '2013-10-10', '2016-12-08', 'Sanderson'),
(3, 3, '2012-07-24', '2016-08-24', 'Herrington'),
(4, 4, '2016-01-24', '2017-05-15', 'Miller'),
(5, 5, '2016-08-13', '2018-04-28', 'Majors'),
(6, 6, '2001-06-19', '2022-12-31', 'Matus'),
(7, 7, '2017-06-03', '2026-12-08', 'Overbeck'),
(8, 8, '2015-10-05', '2016-04-30', 'Britton'),
(9, 9, '2009-04-28', '2019-03-08', 'Cohen'),
(10, 10, '2016-11-08', '2029-01-18', 'Leahy'),
(1, 5, '2016-01-08', '2016-08-01', 'Irons'),
(2, 6, '2013-11-08' , '2016-03-23', 'Dixon'),
(5, 4, '2014-09-02', '2016-02-02', 'Love'),
(7, 10, '2013-03-03', '2016-02-22', 'Barnett');
(12, 13, '2015-02-05', '2017-04-20', 'Tubbs');
(11, 4, '2010-05-12', '2016-05-02', 'Brady');

--
-- Dumping data for table `make`
--

INSERT INTO `make` (`drug_id`, `pharmaceutical_company_id`) VALUES
(1, 1),
(2, 1),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 2),
(12, 3),
(13, 4);

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`patient_id` , `doctor_id`, `drug_id`, `date`, `quantity`) VALUES
(1, 1, 1, '2016-09-01', 50),
(1, 2, 3, '2016-02-01', 30),
(2, 3, 2, '2017-01-01', 20),
(2, 10, 5, '2016-03-01', 10),
(3, 9, 9, '2015-04-11', 90),
(3, 4, 4, '2014-12-01', 150),
(4, 5, 6, '2016-09-11', 250),
(4, 6, 7, '2016-07-07', 750),
(5, 7, 8, '2016-04-04', 450),
(5, 8, 9, '2016-03-03', 950),
(6, 9, 10, '2016-11-21', 600),
(6, 10, 11, '2016-12-27', 950),
(7, 1, 12, '2016-01-23', 80),
(8, 2, 13, '2016-09-09', 990),
(9, 10, 5, '2016-09-28', 502),
(10, 4, 6, '2016-09-29', 503),
(11, 7, 7, '2016-09-31', 350),
(12, 2, 8, '2016-12-21', 1250),
(13, 1, 1, '2016-12-12', 500),
(13, 4, 5, '2015-12-12', 500);

--
-- Dumping data for table `seen_by`
--

INSERT INTO `seen_by` (`patient_id` , `doctor_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 7),
(12, 1),
(13, 1);

--
-- Dumping data for table `sell`
--

INSERT INTO `sell` (`pharmacy_id` , `drug_id`, `price`) VALUES
(1, 1, 50),
(1, 2, 40),
(2, 5, 30),
(2, 13, 50),
(3, 5, 100),
(3, 4, 300),
(4, 5, 80),
(4, 12, 90),
(5, 7, 81),
(5, 8, 36),
(6, 12, 89),
(6, 11, 150),
(7, 1, 121),
(8, 2, 170),
(9, 10, 196),
(10, 4, 147),
(1, 3, 205),
(2, 6, 630),
(3, 9, 456);

-- --------------------------------------------------------

--
-- Constraints for dumped tables
--

--
-- Constraints for table `patient`
--
/*ALTER TABLE `patient`
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
*/
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
  -- --------------------------------------------------------
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
