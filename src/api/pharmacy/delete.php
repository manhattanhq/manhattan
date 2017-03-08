<?php
// include database and object file
include_once '../config/database.php';
include_once '../objects/pharmacy.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare pharmacy object
$pharmacy = new Pharmacy($db);

// get pharmacy pharmacy_id
$data = json_decode(file_get_contents("php://input"));

// set pharmacy pharmacy_id to be deleted
$pharmacy->pharmacy_id = $data->pharmacy_id;

// delete the pharmacy
if($pharmacy->delete()){
    echo "pharmacy was deleted.";
}

// if unable to delete the pharmacy
else{
    echo "Unable to delete object.";
}
?>
