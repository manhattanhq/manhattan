<?php
// include database and object files
include_once '../config/database.php';
include_once '../objects/pharmaceutical_company.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare pharmaceutical_company object
$pharmaceutical_company = new Pharmaceutical_company($db);

// get pharmaceutical_company_id of pharmaceutical_company to be edited
$data = json_decode(file_get_contents("php://input"));

// set pharmaceutical_company_id property of pharmaceutical_company to be edited
$pharmaceutical_company->pharmaceutical_company_id = $data->pharmaceutical_company_id;

// read the details of pharmaceutical_company to be edited
$pharmaceutical_company->readOne();

// create array
$product_arr[] = array(
  "pharmaceutical_company_id" =>  $pharmaceutical_company->pharmaceutical_company_id,
  "name" => $pharmaceutical_company->name,
  "phone_number" => $pharmaceutical_company->phone_number
);

// make it json format
print_r(json_encode($product_arr));
?>
