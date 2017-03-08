<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// include database and object files
include_once '../config/database.php';
include_once '../objects/pharmaceutical_company.php';

// instantiate database and pharmaceutical_company object
$database = new Database();
$db = $database->getConnection();

// initialize object
$pharmaceutical_company = new Pharmaceutical_company($db);

// query pharmaceutical_companys
$stmt = $pharmaceutical_company->readAll();
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
          $data .= '"pharmaceutical_company_id":"'  . $pharmaceutical_company_id . '",';
          $data .= '"name":"'   . $name . '",';
          $data .= '"phone_number":"'   . $phone_number . '"';
        $data .= '}';

        $data .= $x<$num ? ',' : '';

        $x++;
    }
}

// json format output
echo '{"records":[' . $data . ']}';
?>
