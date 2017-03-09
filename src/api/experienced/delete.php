<?php
// include database and object file
include_once '../config/database.php';
include_once '../objects/experienced.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare experienced object
$experienced = new Experienced($db);

// get experienced experienced_id
$data = json_decode(file_get_contents("php://input"));

// set experienced experienced_id to be deleted
$experienced->experienced_id = $data->experienced_id;

// delete the experienced
if($experienced->delete()){
    echo "experienced was deleted.";
}

// if unable to delete the experienced
else{
    echo "Unable to delete object.";
}
?>
