<?php
// include database and object file
include_once '../config/database.php';
include_once '../objects/doctor.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare doctor object
$doctor = new Doctor($db);

// get doctor doctor_id
$data = json_decode(file_get_contents("php://input"));

// set doctor doctor_id to be deleted
$doctor->doctor_id = $data->doctor_id;

// delete the doctor
if($doctor->delete()){
    echo "doctor was deleted.";
}

// if unable to delete the doctor
else{
    echo "Unable to delete object.";
}
?>
