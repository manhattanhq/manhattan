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

// read the details of pharmacy to be edited
$pharmacy->readOne();

// create array
$product_arr[] = array(
  "pharmacy_id" =>  $pharmacy->pharmacy_id,
  "name" => $pharmacy->name,
  "town" => $pharmacy->town,
  "street_name" => $pharmacy->street_name,
  "number" => $pharmacy->number,
  "postalcode" => $pharmacy->postalcode,
  "phone_number" => $pharmacy->phone_number,
);

// make it json format
print_r(json_encode($product_arr));
?>
