<?php
// include database and object file
include_once '../config/database.php';
include_once '../objects/patient.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// instantiate patient object
$patient = new Patient($db);

// get posted data
$data = json_decode(file_get_contents("php://input"));

// set patient property values
$patient->name = $data->name;
$patient->surname = $data->surname;
$patient->town = $data->town;
$patient->street_name = $data->street_name;
$patient->number = $data->name;
$patient->age = $data->age;
$patient->doctor_id = $data->doctor_id;
$patient->created = date('Y-m-d H:i:s');

// create the patient
if($patient->create()){
    echo "patient was created.";
}

// if unable to create the patient, tell the user
else{
    echo "Unable to create patient.";
}
?>
