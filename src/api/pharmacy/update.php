<?php
// include database and object files
include_once '../config/database.php';
include_once '../objects/pharmacy.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare pharmacy object
$pharmacy = new Pharmacy($db);

// get pharmacy_id of pharmacy to be edited
$data = json_decode(file_get_contents("php://input"));

// set pharmacy_id property of pharmacy to be edited
$pharmacy->pharmacy_id = $data->pharmacy_id;

// set pharmacy property values
$pharmacy->name = $data->name;
$pharmacy->town = $data->town;
$pharmacy->street_name = $data->street_name;
$pharmacy->number = $data->number;
$pharmacy->postalcode = $data->postalcode;
$pharmacy->phone_number = $data->phone_number;

// update the pharmacy
if($pharmacy->update()){
    echo "pharmacy was updated.";
}

// if unable to update the pharmacy, tell the user
else{
    echo "Unable to update pharmacy.";
}
?>
