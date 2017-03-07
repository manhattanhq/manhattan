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

// set doctor property values
$doctor->name = $data->name;
$doctor->surname = $data->surname;
$doctor->specialty = $data->specialty;
$doctor->experience_years = $data->experience_years;

// update the doctor
if($doctor->update()){
    echo "doctor was updated.";
}

// if unable to update the doctor, tell the user
else{
    echo "Unable to update doctor.";
}
?>
