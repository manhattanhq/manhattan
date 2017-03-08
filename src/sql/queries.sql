/* count of patients per doctor */ naturaljoin


SELECT `doctor`.`doctor_id`, `doctor`.`name`, `doctor`.`surname`, count(*)
FROM `doctor`, `patient` as `p`
WHERE (`doctor`.`doctor_id`  = `p`.`doctor_id`)
GROUP BY `p`.`doctor_id`


/*  average price of each drug */ aggregatequery

SELECT `drug`.`name`, `drug`.`formula`, (SUM(`sell`.`price`) DIV (count(`sell`.`price`))) as `Average Price`
FROM `drug`, `sell`
WHERE `drug`.`drug_id` = `sell`.`drug_id`
GROUP BY `sell`.`drug_id`


/* How many Patients are elderly */ ordered


SELECT `patient`.`name`, `patient`.`surname`, `patient`.`age`
FROM `patient`
WHERE (`patient`.`age` > 65)
ORDER BY `patient`.`age` ASC

/* how many pharmacies per town */ grouped

SELECT `pharmacy`.`town`, count(*)
FROM `pharmacy`
GROUP BY `pharmacy`.`town`

/* which pharmacy sells the most expensive drug */ nested

SELECT `pharmacy`.`name`, `pharmacy`.`town`, `pharmacy`.`street_name`, `pharmacy`.`number`, `sell`.`price`
FROM `sell`, `pharmacy`
WHERE `sell`.`pharmacy_id` = `pharmacy`.`pharmacy_id` AND `sell`.`price` = (SELECT MAX(`sell`.`price`) FROM `sell`)

/* patients who are watched by doctor with more than 20 years of experience */ havingg

SELECT `patient`.`name`, `patient`.`surname`, `doctor`.`name`, `doctor`.`surname`, `doctor`.`experience_years`
FROM `patient`, `doctor`
WHERE `patient`.`doctor_id` = `doctor`.`doctor_id`
GROUP BY `doctor`.`doctor_id`
HAVING `doctor`.`experience_years` > 20

/* show how many prescriptions each patient has been prescribed */

SELECT `patient`.`name`, `patient`.`surname`, COUNT(`prescription`.`patient_id`)  as 'Total Prescriptions'
FROM `patient`, `prescription`
WHERE `patient`.`patient_id` = `prescription`.`patient_id`
GROUP BY `prescription`.`patient_id`
ORDER BY `patient`.`surname` ASC

/* Emfanise tous as8eneis kai tis eidikothtes twn giatrwn pou tous parakolou8oun */

SELECT `patient`.`surname`, `patient`.`name`, `doctor`.`specialty` as 'Monitored by'
FROM `patient`
JOIN `doctor`
ON `patient`.`doctor_id` = `doctor`.`doctor_id`
ORDER BY `patient`.`surname`

/* 3 most experienced doctors */

SELECT `doctor`.`name`, `doctor`.`surname` as 'Name', `doctor`.`specialty`, `doctor`.`experience_years`
FROM `doctor`
ORDER BY `doctor`.`experience_years` DESC
LIMIT 3

/* Which doctor prescribes Cocainot*/

SELECT `doctor`.`name`, `doctor`.`surname`
FROM `doctor`, `prescription`, `drug`
WHERE `doctor`.`doctor_id` = `prescription`.`doctor_id` AND `prescription`.`drug_id` = `drug`.`drug_id` AND `drug`.`name` = 'Cocainot'

