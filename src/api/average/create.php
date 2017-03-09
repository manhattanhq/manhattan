<?php
// include database and object file
include_once '../config/database.php';
include_once '../objects/average.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// instantiate average object
$average = new Average($db);

// get posted data
$data = json_decode(file_get_contents("php://input"));

// set average property values
$average->name = $data->name;
$average->formula = $data->formula;
$average->pharmaceutical_company_id = $data->pharmaceutical_company_id;
$average->created = date('Y-m-d H:i:s');
$average->avg = $data->avg;

// create the average
if($average->create()){
    echo "average was created.";
}

// if unable to create the average, tell the user
else{
    echo "Unable to create average.";
}
?>
