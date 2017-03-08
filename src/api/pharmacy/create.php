<?php
// include database and object file
include_once '../config/database.php';
include_once '../objects/pharmacy.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// instantiate pharmacy object
$pharmacy = new Pharmacy($db);

// get posted data
$data = json_decode(file_get_contents("php://input"));

// set pharmacy property values
$pharmacy->name = $data->name;
$pharmacy->town = $data->town;
$pharmacy->street_name = $data->street_name;
$pharmacy->number = $data->number;
$pharmacy->postalcode = $data->postalcode;
$pharmacy->phone_number = $data->phone_number;
$pharmacy->created = date('Y-m-d H:i:s');

// create the pharmacy
if($pharmacy->create()){
    echo "pharmacy was created.";
}

// if unable to create the pharmacy, tell the user
else{
    echo "Unable to create pharmacy.";
}
?>
