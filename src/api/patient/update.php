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

// set patient property values
$patient->name = $data->name;
$patient->surname = $data->surname;
$patient->town = $data->town;
$patient->street_name = $data->street_name;
$patient->number = $data->number;
$patient->postalcode = $data->postalcode;
$patient->age = $data->age;
$patient->doctor_id = $data->doctor_id;

// update the patient
if($patient->update()){
    echo "patient was updated.";
}

// if unable to update the patient, tell the user
else{
    echo "Unable to update patient.";
}
?>
