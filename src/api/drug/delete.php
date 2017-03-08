<?php
// include database and object file
include_once '../config/database.php';
include_once '../objects/drug.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare drug object
$drug = new Drug($db);

// get drug drug_id
$data = json_decode(file_get_contents("php://input"));

// set drug drug_id to be deleted
$drug->drug_id = $data->drug_id;

// delete the drug
if($drug->delete()){
    echo "drug was deleted.";
}

// if unable to delete the drug
else{
    echo "Unable to delete object.";
}
?>
