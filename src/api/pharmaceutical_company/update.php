<?php
// include database and object files
include_once '../config/database.php';
include_once '../objects/pharmaceutical_company.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare pharmaceutical_company object
$pharmaceutical_company = new Pharmaceutical_company($db);

// get pharmaceutical_company_id of pharmaceutical_company to be edited
$data = json_decode(file_get_contents("php://input"));

// set pharmaceutical_company_id property of pharmaceutical_company to be edited
$pharmaceutical_company->pharmaceutical_company_id = $data->pharmaceutical_company_id;

// set pharmaceutical_company property values
$pharmaceutical_company->name = $data->name;
$pharmaceutical_company->phone_number = $data->phone_number;

// update the pharmaceutical_company
if($pharmaceutical_company->update()){
    echo "pharmaceutical_company was updated.";
}

// if unable to update the pharmaceutical_company, tell the user
else{
    echo "Unable to update pharmaceutical_company.";
}
?>
