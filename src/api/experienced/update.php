<?php
// include database and object files
include_once '../config/database.php';
include_once '../objects/experienced.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare experienced object
$experienced = new Experienced($db);

// get experienced_id of experienced to be edited
$data = json_decode(file_get_contents("php://input"));

// set experienced_id property of experienced to be edited
$experienced->experienced_id = $data->experienced_id;

// set experienced property values
$experienced->name = $data->name;
$experienced->surname = $data->surname;
$experienced->specialty = $data->specialty;
$experienced->experience_years = $data->experience_years;

// update the experienced
if($experienced->update()){
    echo "experienced was updated.";
}

// if unable to update the experienced, tell the user
else{
    echo "Unable to update experienced.";
}
?>
