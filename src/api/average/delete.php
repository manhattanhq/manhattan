<?php
// include database and object file
include_once '../config/database.php';
include_once '../objects/average.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare average object
$average = new Average($db);

// get average average_id
$data = json_decode(file_get_contents("php://input"));

// set average average_id to be deleted
$average->average_id = $data->average_id;

// delete the average
if($average->delete()){
    echo "average was deleted.";
}

// if unable to delete the average
else{
    echo "Unable to delete object.";
}
?>
