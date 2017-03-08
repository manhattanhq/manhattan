<?php
// include database and object file
include_once '../config/database.php';
include_once '../objects/pharmaceutical_company.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare pharmaceutical_company object
$pharmaceutical_company = new Pharmaceutical_company($db);

// get pharmaceutical_company pharmaceutical_company_id
$data = json_decode(file_get_contents("php://input"));

// set pharmaceutical_company pharmaceutical_company_id to be deleted
$pharmaceutical_company->pharmaceutical_company_id = $data->pharmaceutical_company_id;

// delete the pharmaceutical_company
if($pharmaceutical_company->delete()){
    echo "pharmaceutical_company was deleted.";
}

// if unable to delete the pharmaceutical_company
else{
    echo "Unable to delete object.";
}
?>
