<?php
// include database and object files
include_once '../config/database.php';
include_once '../objects/average.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare average object
$average = new Average($db);

// get average_id of average to be edited
$data = json_decode(file_get_contents("php://input"));

// set average_id property of average to be edited
$average->average_id = $data->average_id;

// read the details of average to be edited
$average->readOne();

// create array
$product_arr[] = array(
  "average_id" =>  $average->average_id,
  "name" => $average->name,
  "formula" => $average->formula,
  "pharmaceutical_company_id" => $average->pharmaceutical_company_id,
  "avg" => $average->avg
);

// make it json format
print_r(json_encode($product_arr));
?>
