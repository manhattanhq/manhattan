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

// read the details of drug to be edited
$drug->readOne();

// create array
$product_arr[] = array(
  "drug_id" =>  $drug->drug_id,
  "name" => $drug->name,
  "formula" => $drug->formula,
  "pharmaceutical_company_id" => $drug->pharmaceutical_company_id
);

// make it json format
print_r(json_encode($product_arr));
?>
