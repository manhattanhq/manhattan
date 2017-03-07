<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// include database and object files
include_once '../config/database.php';
include_once '../objects/patient.php';

// instantiate database and patient object
$database = new Database();
$db = $database->getConnection();

// initialize object
$patient = new Patient($db);

// query patients
$stmt = $patient->readAll();
$num = $stmt->rowCount();

$data="";

// check if more than 0 record found
if($num>0){


    $x=1;

    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);

        $data .= '{';
          $data .= '"patient_id":"'  . $patient_id . '",';
          $data .= '"name":"'   . $name . '",';
          $data .= '"surname":"'   . $surname . '",';
          $data .= '"town":"'   . $town . '",';
          $data .= '"street_name":"'   . $street_name . '",';
          $data .= '"number":"'   . $number . '",';
          $data .= '"postalcode":"'   . $postalcode . '",';
          $data .= '"age":"'   . $age . '",';
          $data .= '"doctor_id":"'   . $doctor_id . '"';
        $data .= '}';

        $data .= $x<$num ? ',' : '';

        $x++;
    }
}

// json format output
echo '{"records":[' . $data . ']}';
?>
