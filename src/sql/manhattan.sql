
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
