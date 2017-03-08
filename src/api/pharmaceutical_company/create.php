<?php
// include database and object file
include_once '../config/database.php';
include_once '../objects/pharmaceutical_company.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// instantiate pharmaceutical_company object
$pharmaceutical_company = new Pharmaceutical_company($db);

// get posted data
$data = json_decode(file_get_contents("php://input"));

// set pharmaceutical_company property values
$pharmaceutical_company->name = $data->name;
$pharmaceutical_company->phone_number = $data->phone_number;
$pharmaceutical_company->created = date('Y-m-d H:i:s');

// create the pharmaceutical_company
if($pharmaceutical_company->create()){
    echo "pharmaceutical_company was created.";
}

// if unable to create the pharmaceutical_company, tell the user
else{
    echo "Unable to create pharmaceutical_company.";
}
?>
