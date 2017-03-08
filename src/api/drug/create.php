<?php
// include database and object file
include_once '../config/database.php';
include_once '../objects/drug.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// instantiate drug object
$drug = new Drug($db);

// get posted data
$data = json_decode(file_get_contents("php://input"));

// set drug property values
$drug->name = $data->name;
$drug->formula = $data->formula;
$drug->pharmaceutical_company_id = $data->pharmaceutical_company_id;
$drug->created = date('Y-m-d H:i:s');

// create the drug
if($drug->create()){
    echo "drug was created.";
}

// if unable to create the drug, tell the user
else{
    echo "Unable to create drug.";
}
?>
