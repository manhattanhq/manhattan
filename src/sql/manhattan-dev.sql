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

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
    `doctor_id` int(11) NOT NULL,
    `name` varchar(20) NOT NULL,
    `surname` varchar(20) NOT NULL,
    `specialty` varchar(20) NOT NULL,
    `experience_years` int(2),
    `created` datetime NOT NULL,
    `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `doctor` (`doctor_id`, `name`, `surname`, `specialty`, `experience_years`, `created`, `modified`) VALUES
(1, 'Tsim', 'Booky', 'Cardiologist', 18, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(2, 'Mike', 'Litoris', 'Gynaecologist', 21, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(3, 'Christabella', 'Eggleston', 'Dermatologist', 9, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(4, 'Maggi', ' Holgate', 'Leprologist', 26, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(5, 'Cortney', 'Ryder', 'Neurologist', 22, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(6, 'Teodoro', ' Litwin', 'Orthopaedist', 30, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(7, 'Filberto', 'Chiogna', 'Urologist', 15, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(8, 'Gregorius', 'Afzal-khan', 'Sexologist', 20, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(9, 'Willie', 'Stanton', 'Radiologist', 11, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(10, 'Frankie', 'Gabor', 'Parasitologist', 5, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(11, 'Donald', 'Duck', 'Psychiatrist', 13, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(12, 'Michael', 'Heck', 'Urologist', 22, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(13, 'Andre', 'Young', 'Orthopaedist', 32, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(14, 'Romain', 'Blanc', 'Dermatologist', 10, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(15, 'DeShawn', 'Jackson', 'Sexologist', 17, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(16, 'Kimi', 'Raikkonen', 'Psychiatrist', 16, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(17, 'Ari', 'Vatanen', 'Cardiologist', 25, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(18, 'Rakim', 'Mayers', 'Radiologist', 6, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(19, 'Jarno', 'Trulli', 'Orthopaedist', 9, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(20, 'Calvin', 'Broadus', 'Pneumonologist', 20, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(21, 'William', 'Oz', 'Cardiologist', 52, '2016-07-01 01:12:26', '2016-06-31 17:12:26'),
(22, 'Francis', 'Underwood', 'Urologist', 67, '2016-07-01 01:12:26', '2016-06-31 17:12:26');

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
    `created` datetime NOT NULL,
    `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`patient_id`),
    KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `patient` (`patient_id`, `name`, `surname`, `town`, `street_name`, `number`, `postalcode`, `age`, `doctor_id`, `created`, `modified`) VALUES
(1, 'Richard', 'Badillo', 'Chicago', 'Oakmound Road', 2538, 60647, 72, 1, '2016-06-01 01:12:26', '2016-05-31 17:12:26'),
(2, 'William', 'Frazier', 'Detroit', 'Bombardier Way', 1248, 48219, 53 , 3, '2016-06-01 01:12:26', '2016-05-31 17:12:26'),
(3, 'Nancy', 'Bonnell', 'Tampa', 'Saints Alley', 4459, 33624, 41, 2, '2016-06-01 01:12:26', '2016-05-31 17:12:26'),
(4, 'Jennifer', 'May', 'Hilo', 'Randall Drive', 625, 96720, 61, 4, '2016-06-01 01:12:26', '2016-05-31 02:12:21'),
(5, 'William', 'Cooper', 'Des Moines', 'Hazelwood Avenue', 3666, 50309, 77, 5, '2016-06-01 01:13:45', '2016-05-31 02:13:39'),
(6, 'Jana', 'Winn', 'Ten Sleep', 'Arbor Court', 4792, 82442, 54, 6, '2016-06-01 01:14:13', '2016-05-31 02:14:08'),
(7, 'Jason', 'Kleinman', 'Los Angeles', 'Canis Heights Drive', 1481, 90071, 21, 7, '2016-06-01 01:18:36', '2016-05-31 02:18:31'),
(8, 'Rosalie', 'Regis', 'Pittsburgh', 'Pine Street', 2327, 15212, 83, 8, '2016-11-22 18:42:13', '2016-11-21 19:42:13'),
(9, 'Gary', 'Hinton', 'Norfolk', 'Allison Avenue', 2529, 23510, 21, 9, '2016-11-22 18:42:13', '2016-11-21 19:42:13'),
(10, 'Rosalie', 'Regis', 'Pittsburgh', 'Pine Street', 2327, 15212, 83, 10, '2016-11-22 18:42:13', '2016-11-21 19:42:13'),
(11, 'Carlton', 'Chastain', 'Newark', 'Hilltop Haven Drive', 2313, 07102, 32, 7,'2016-11-22 18:42:13', '2016-11-21 19:42:13'),
(12, 'Jerome', 'Melton', 'Farmingdale', 'Stanley Avenue', 3813, 11735, 77, 1, '2016-11-22 18:42:13', '2016-11-21 19:42:13'),
(13, 'Sophia', 'Petersen', 'Sammamish', 'Stockert Hollow Road', 3318, 98053, 71, 3, '2016-11-22 18:42:13', '2016-11-21 19:42:13'),
(14, 'Fernando', 'Soldado', 'New York', 'Wall Street', 2534, 19123, 46, 17, '2016-11-22 18:42:13', '2016-11-21 19:42:13'),
(15, 'Lloyd', 'Banks', 'Compton', '2nd Street', 1233, 93425, 25, 16, '2016-12-04 21:11:36', '2016-12-03 22:11:36'),
(16, 'Richard', 'Ferdinand', 'Synecdoche', 'King George Avenue', 662, 92415, 40, 20, '2016-12-04 21:12:03', '2016-12-03 22:12:03'),
(17, 'Viggo', 'Geller', 'Los Angeles', 'Canis Heights Drive', 1230, 90071, 56, 18, '2016-12-13 00:52:29', '2016-12-12 01:52:29'),
(18, 'Amber', 'Lancaster', 'Detroit', 'Main Avenue', 1532, 48252, 34, 15, '2016-12-13 00:52:54', '2016-12-12 01:52:54'),
(19, 'Anabelle', 'Ocon', 'Miami', 'Ocean Drive', 1413, 49201, 92, 22, '2015-01-08 22:44:15', '2015-01-07 23:44:15');

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
    `created` datetime NOT NULL,
    `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`pharmacy_id`,`pharmaceutical_company_id`),
    KEY `pharmacy_id` (`pharmacy_id`),
    KEY `pharmaceutical_company_id` (`pharmaceutical_company_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

  INSERT INTO `contract` (`pharmacy_id`, `pharmaceutical_company_id`, `start_date`, `end_date`, `text`, `supervisor`, `created`, `modified`) VALUES
  (1, 1, '2009-04-28', '2017-06-21', 'Lorem ipsum dolor sit amet, ius ex velit munere commune', 'Fischer', '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
  (2, 2, '2013-10-10', '2016-12-08', 'Vel no mandamus honestatis disputando', 'Sanderson', '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
  (3, 3, '2012-07-24', '2016-08-24', 'At discere rationibus contentiones vis putent commodo pri at', 'Herrington', '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
  (4, 4, '2016-01-24', '2017-05-15', 'Cu quo simul oratio molestiae', 'Miller', '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
  (5, 5, '2016-08-13', '2018-04-28', 'Pro postea nemore dolores at ne vel feugait adipiscing', 'Majors', '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
  (6, 6, '2001-06-19', '2022-12-31', 'Mei ei voluptua consulatu', 'Matus', '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
  (7, 7, '2017-06-03', '2026-12-08', 'Eos commodo aperiri ut', 'Overbeck', '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
  (8, 8, '2015-10-05', '2016-04-30', 'Id ipsum luptatum comprehensam usu', 'Britton', '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
  (9, 9, '2009-04-28', '2019-03-08', 'Mea no quod nibh nec at mundi congue', 'Cohen', '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
  (10, 10, '2016-11-08', '2029-01-18', 'Aperiam referrentur comprehensam cu pri', 'Leahy', '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
  (1, 5, '2016-01-08', '2016-08-01', 'Vel eu quas etiam admodum id sea prima ancillae', 'Irons', '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
  (2, 6, '2013-11-08' , '2016-03-23', 'Eu his consul repudiandae vix ad modus patrioque', 'Dixon', '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
  (5, 4, '2014-09-02', '2016-02-02', 'Ut pri minim nihil partiendo', 'Love', '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
  (7, 10, '2013-03-03', '2016-02-22', 'Mea no quod nibh rationibus contentiones vis', 'Barnett', '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
  (12, 13, '2015-02-05', '2017-04-20', 'Id ipsum luptatum ei voluptua consulatu', 'Tubbs','2016-02-01 01:12:26', '2016-02-31 17:12:26'),
  (11, 4, '2010-05-12', '2016-05-02', 'Cu quo simul oratio putent commodo pri at', 'Brady','2016-02-01 01:12:26', '2016-02-31 17:12:26');

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
    `created` datetime NOT NULL,
    `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`drug_id`),
    KEY `pharmaceutical_company_id` (`pharmaceutical_company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `drug` (`drug_id`, `name`, `formula`, `pharmaceutical_company_id`, `created`, `modified`) VALUES
(1, 'Bakingsodium', 'NAHCO3', 1, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(2, 'Cocainot', 'C17H21NO4', 2, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(3, 'Borax', 'NaBO3', 3, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(4, 'Freon', 'CF2Cl2', 4, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(5, 'MEK', 'CH3COC2H5', 5, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(6, 'TSP', 'Na3PO4', 2, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(7, 'LYE', 'HCl', 6, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(8, 'LAG', 'N2O', 7, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(9, 'Bach', 'NaClO', 8, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(10, 'Alumum', 'Al2SO4', 9, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(11, 'Baren', 'BaCO3', 5, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(12, 'Calcioner', 'CaCO3', 4, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(13, 'Camphor', 'C10H16O', 8, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(14, 'Insanitum', 'Na3C4H20', 13, '2016-02-01 01:12:26', '2016-02-31 17:12:26');

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

-- --------------------------------------------------------

--
-- Table structure for table `pharmaceutical_company`
--

DROP TABLE IF EXISTS `pharmaceutical_company`;
CREATE TABLE `pharmaceutical_company` (
    `pharmaceutical_company_id` int(11) NOT NULL,
    `name` varchar(20) NOT NULL,
    `phone_number` int(15),
    `created` datetime NOT NULL,
    `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`pharmaceutical_company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `pharmaceutical_company` (`pharmaceutical_company_id`, `name`, `phone_number`, `created`, `modified`) VALUES
(1, 'ACMA', 7058366485,'2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(2, 'Atlasion', 6052673748, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(3, 'Ganjer', 9659488157, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(4, 'Buehlmeer', 4004569274, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(5, 'Drugmar', 3112248438, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(6, 'Drugunited', 9635224896, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(7, 'Cali', 4004569274, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(8, 'Narcos', 3112248438, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(9, 'Medellin', 9635224896, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(10, 'Pocuocos', 1336924896, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(11, 'Dealers Co.', 1920405279, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(12, 'Los Pollos Hermanos', 1924029104, '2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(13, 'Fring Laboratories', 9652014950, '2016-02-01 01:12:26', '2016-02-31 17:12:26');


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
    `created` datetime NOT NULL,
    `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`pharmacy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO `pharmacy` (`pharmacy_id`, `name`, `town`, `street_name`, `number`, `postalcode`, `phone_number`, `created`, `modified`) VALUES
(1, 'ACME Pharmacy', 'Chicago', 'Oakmound Road', 1450, 60647, 4258366485,'2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(2, 'Atlas Drugs', 'Detroit', 'Bombardier Way', 1308, 48219, 5152673748,'2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(3, 'Free Ganja', 'Tampa', 'Saints Alley', 4179, 33624, 5859488157,'2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(4, 'Buehler Pharmacy', 'Hilo', 'Randall Drive', 605, 96720, 9164569274,'2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(5, 'Discount Drug Mart', 'Des Moines', 'Hazelwood Avenue', 3606, 50309, 5082248438,'2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(6, 'Janckies United', 'Ten Sleep', 'Arbor Court', 4702, 82442, 7155224896,'2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(7, 'Family Fare Pharmacy', 'Los Angeles', 'Canis Heights Drive', 1491, 90071, 3198619201,'2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(8, 'Health Mart', 'Pittsburgh', 'Pine Street', 2387, 15212, 2567795407,'2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(9, 'Ingles Markets', 'Norfolk', 'Allison Avenue', 2549, 23510, 2812377851,'2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(10, 'Lifechek', 'Pittsburgh', 'Pine Street', 2350, 15212, 8315325671,'2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(11, 'Nature Store', 'Los Angeles', 'Canis Heights Drive', 250, 90071, 2814928491,'2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(12, 'Health Experts', 'Beverly Hills', 'Hollywood Avenue', 1242, 90210, 2914031829,'2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(13, 'Pharmalife', 'London', 'Beckham Street', 1125, 24501, 4149401922,'2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(14, 'Bambees', 'Chicago', 'MJ Street', 2323, 60648, 4258310529,'2016-02-01 01:12:26', '2016-02-31 17:12:26'),
(15, 'NuLife', 'Miami', 'Ocean Drive', 1425, 49201, 4293019204,'2016-02-01 01:12:26', '2016-02-31 17:12:26');

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

--
-- Dumping data for table `pharmacy`
--

--
-- Dumping data for table `pharmaceutical_company`
--



--
-- Dumping data for table `drug`
--

--
-- Dumping data for table `contract`
--

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
(13, 4),
(14, 13);

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
(13, 4, 5, '2015-12-12', 500),
(14, 21, 14, '2013-08-29', 600);

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
(13, 1),
(14, 21);

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
(3, 9, 456),
(15, 14, 230),
(13, 9, 800),
(10, 8, 942);


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
/*DROP TABLE IF EXISTS `contracts_initialized_in_2016`;

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
DELIMITER ;*/
  -- --------------------------------------------------------
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
