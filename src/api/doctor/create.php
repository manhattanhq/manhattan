<?php
// include database and object file
include_once '../config/database.php';
include_once '../objects/doctor.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// instantiate doctor object
$doctor = new Doctor($db);

// get posted data
$data = json_decode(file_get_contents("php://input"));

// set doctor property values
$doctor->name = $data->name;
$doctor->surname = $data->surname;
$doctor->specialty = $data->specialty;
$doctor->experience_years = $data->experience_years;
$doctor->created = date('Y-m-d H:i:s');

// create the doctor
if($doctor->create()){
    echo "doctor was created.";
}

// if unable to create the doctor, tell the user
else{
    echo "Unable to create doctor.";
}
?>
