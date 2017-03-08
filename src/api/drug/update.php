<?php
// include database and object files
include_once '../config/database.php';
include_once '../objects/drug.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare drug object
$drug = new Drug($db);

// get drug_id of drug to be edited
$data = json_decode(file_get_contents("php://input"));

// set drug_id property of drug to be edited
$drug->drug_id = $data->drug_id;

// set drug property values
$drug->name = $data->name;
$drug->formula = $data->formula;
$drug->pharmaceutical_company_id = $data->pharmaceutical_company_id;

// update the drug
if($drug->update()){
    echo "drug was updated.";
}

// if unable to update the drug, tell the user
else{
    echo "Unable to update drug.";
}
?>
