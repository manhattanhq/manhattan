<?php
// include database and object files
include_once '../config/database.php';
include_once '../objects/doctor.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare doctor object
$doctor = new Doctor($db);

// get doctor_id of doctor to be edited
$data = json_decode(file_get_contents("php://input"));

// set doctor_id property of doctor to be edited
$doctor->doctor_id = $data->doctor_id;

// read the details of doctor to be edited
$doctor->readOne();

// create array
$product_arr[] = array(
  "doctor_id" =>  $doctor->doctor_id,
  "name" => $doctor->name,
  "surname" => $doctor->surname,
  "specialty" => $doctor->specialty,
  "experience_years" => $doctor->experience_years
);

// make it json format
print_r(json_encode($product_arr));
?>
