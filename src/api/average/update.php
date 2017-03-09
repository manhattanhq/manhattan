<?php
// include database and object files
include_once '../config/database.php';
include_once '../objects/average.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare average object
$average = new Average($db);

// get average_id of average to be edited
$data = json_decode(file_get_contents("php://input"));

// set average_id property of average to be edited
$average->average_id = $data->average_id;

// set average property values
$average->name = $data->name;
$average->formula = $data->formula;
$average->pharmaceutical_company_id = $data->pharmaceutical_company_id;
$average->avg = $data->avg;

// update the average
if($average->update()){
    echo "average was updated.";
}

// if unable to update the average, tell the user
else{
    echo "Unable to update average.";
}
?>
