<?php
// include database and object files
include_once '../config/database.php';
include_once '../objects/experienced.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare experienced object
$experienced = new Experienced($db);

// get experienced_id of experienced to be edited
$data = json_decode(file_get_contents("php://input"));

// set experienced_id property of experienced to be edited
$experienced->experienced_id = $data->experienced_id;

// read the details of experienced to be edited
$experienced->readOne();

// create array
$product_arr[] = array(
  "experienced_id" =>  $experienced->experienced_id,
  "name" => $experienced->name,
  "surname" => $experienced->surname,
  "specialty" => $experienced->specialty,
  "experience_years" => $experienced->experience_years
);

// make it json format
print_r(json_encode($product_arr));
?>
