<?php
// include database and object file
include_once '../config/database.php';
include_once '../objects/patient.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare patient object
$patient = new Patient($db);

// get patient patient_id
$data = json_decode(file_get_contents("php://input"));

// set patient patient_id to be deleted
$patient->patient_id = $data->patient_id;

// delete the patient
if($patient->delete()){
    echo "patient was deleted.";
}

// if unable to delete the patient
else{
    echo "Unable to delete object.";
}
?>
