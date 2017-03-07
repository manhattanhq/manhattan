<?php
// include database and object files
include_once '../config/database.php';
include_once '../objects/patient.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare patient object
$patient = new Patient($db);

// get patient_id of patient to be edited
$data = json_decode(file_get_contents("php://input"));

// set patient_id property of patient to be edited
$patient->patient_id = $data->patient_id;

// read the details of patient to be edited
$patient->readOne();

// create array
$product_arr[] = array(
  "patient_id" =>  $patient->patient_id,
  "name" => $patient->name,
  "surname" => $patient->surname,
  "town" => $patient->town,
  "street_name" => $patient->street_name,
  "number" => $patient->number,
  "postalcode" => $patient->postalcode,
  "age" => $patient->age,
  "doctor_id" => $patient->doctor_id
);

// make it json format
print_r(json_encode($product_arr));
?>
