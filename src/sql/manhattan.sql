
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Table structure for table `patient`
--

CREATE TABLE IF NOT EXISTS `patient` (

		`patient_id` int(11) NOT NULL AUTO_INCREMENT,
		`name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
		`surname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
		`town` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
		`street_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
		`number` int(11) NOT NULL,
		`postalcode` int(11) NOT NULL,
		`age` int(2) NOT NULL,
		PRIMARY KEY (`patient_id`),

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10;

--
-- Table structure for table `doctor`
--

CREATE TABLE IF NOT EXISTS `doctor` (

		`doctor_id` int(11) NOT NULL AUTO_INCREMENT,
		`name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
		`surname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
		`specialty` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
		`experience_years` int(2) NOT NULL,
		PRIMARY KEY (`doctor_id`),

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10;

--
-- Table structure for table `pharmaceutical_company`
--

CREATE TABLE IF NOT EXISTS `pharmaceutical_company` (

		`pharmaceutical_company_id` int(11) NOT NULL AUTO_INCREMENT,
		`name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
		`phone_number` int(15) NOT NULL,
		PRIMARY KEY (`pharmaceutical_company_id`),
		UNIQUE KEY `name` (`name`),
		UNIQUE KEY `phone_number` (`phone_number`),

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10;

--
-- Table structure for table `drug`
--

CREATE TABLE IF NOT EXISTS `drug` (

		`drug_id` int(11) NOT NULL AUTO_INCREMENT,
		`name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
		`formula` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
		PRIMARY KEY (`drug_id`),
		UNIQUE KEY `name` (`name`),

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10;

--
-- Table structure for table `pharmacy`
--

CREATE TABLE IF NOT EXISTS `pharmacy` (

		`pharmacy_id` int(11) NOT NULL AUTO_INCREMENT,
		`name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
		`town` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
		`street_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
		`number` int(11) NOT NULL,
		`postalcode` int(11) NOT NULL,
		`phone_number` int(15) NOT NULL,
		PRIMARY KEY (`pharmacy_id`),
		UNIQUE KEY `name` (`name`),

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10;

--
-- Table structure for table `seen_by`
--

CREATE TABLE IF NOT EXISTS `seen_by` (

		`patient_id` int(11) NOT NULL,
		`doctor_id` int(11) NOT NULL,
		PRIMARY KEY (`patient_id`),
		KEY `doctor_id` (`doctor_id`),

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `sell`
--

CREATE TABLE IF NOT EXISTS `sell` (

		`pharmacy_id` int(11) NOT NULL,
		`drug_id` int(11) NOT NULL,
		`price` int(10) NOT NULL,
		PRIMARY KEY (`pharmacy_id`, `drug_id`),

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `make`
--

CREATE TABLE IF NOT EXISTS `make` (

		`drug_id` int(11) NOT NULL,
		`pharmaceutical_company_id` int(11) NOT NULL,
		PRIMARY KEY (`drug_id`),
		KEY `pharmaceutical_company_id` (`pharmaceutical_company_id`),

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `prescription`
--

CREATE TABLE IF NOT EXISTS `prescription` (

		`patient_id` int(11) NOT NULL,
		`doctor_id` int(11) NOT NULL,
		`drug_id` int(11) NOT NULL,
		`date` date NOT NULL,
		`quantity` int(10) NOT NULL,
		PRIMARY KEY (`patient_id`, `doctor_id`, `drug_id`),

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `contract`
--

CREATE TABLE IF NOT EXISTS `contract` (

		`pharmacy_id` int(11) NOT NULL,
		`pharmaceutical_company_id` int(11) NOT NULL,
		`drug_id` int(11) NOT NULL,
		`start_date` date NOT NULL,
		`end_date` date NOT NULL,
		`text` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
		`supervisor` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
		PRIMARY KEY (`pharmacy_id`, `pharmaceutical_company_id`),
		KEY `drug_id` (`drug_id`),

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;