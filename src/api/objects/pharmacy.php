<?php
class Pharmacy{
    // database connection and table name
    private $conn;
    private $table_name = "pharmacy";

    // object properties
    public $pharmacy_id;
    public $name;
    public $town;
    public $street_name;
    public $number;
    public $postalcode;
    public $phone_number;
    public $created;

    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    // create pharmacy
    function create(){

        // query to insert record
        $query = "INSERT INTO
                    " . $this->table_name . "
                SET
                    name=:name, town=:town, street_name=:street_name, number=:number, postalcode=:postalcode, phone_number=:phone_number, created=:created";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // posted values
        $this->name=htmlspecialchars(strip_tags($this->name));
        $this->town=htmlspecialchars(strip_tags($this->town));
        $this->street_name=htmlspecialchars(strip_tags($this->street_name));
        $this->number=htmlspecialchars(strip_tags($this->number));
        $this->postalcode=htmlspecialchars(strip_tags($this->postalcode));
        $this->phone_number=htmlspecialchars(strip_tags($this->phone_number));

        // bind values
        $stmt->bindParam(":name", $this->name);
        $stmt->bindParam(":town", $this->town);
        $stmt->bindParam(":street_name", $this->street_name);
        $stmt->bindParam(":number", $this->number);
        $stmt->bindParam(":postalcode", $this->postalcode);
        $stmt->bindParam(":phone_number", $this->phone_number);
        $stmt->bindParam(":created", $this->created);

        // execute query
        if($stmt->execute()){
            return true;
        }else{
            echo "<pre>";
                print_r($stmt->errorInfo());
            echo "</pre>";

            return false;
        }
    }

    // read pharmacys
    function readAll(){

        // select all query
        $query = "SELECT
                    pharmacy_id, name, town, street_name, number, postalcode, phone_number, created
                FROM
                    " . $this->table_name . "
                ORDER BY
                    pharmacy_id DESC";

        // prepare query statement
        $stmt = $this->conn->prepare( $query );

        // execute query
        $stmt->execute();

        return $stmt;
    }

    // used when filling up the update pharmacy form
    function readOne(){

        // query to read single record
        $query = "SELECT
                    name, town, street_name, number, postalcode, phone_number
                FROM
                    " . $this->table_name . "
                WHERE
                    pharmacy_id = ?
                LIMIT
                    0,1";

        // prepare query statement
        $stmt = $this->conn->prepare( $query );

        // bind pharmacy_id of pharmacy to be updated
        $stmt->bindParam(1, $this->pharmacy_id);

        // execute query
        $stmt->execute();

        // get retrieved row
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        // set values to object properties
        $this->name = $row['name'];
        $this->town = $row['town'];
        $this->street_name = $row['street_name'];
        $this->number = $row['number'];
        $this->postalcode = $row['postalcode'];
        $this->phone_number = $row['phone_number'];

    }

    // update the pharmacy
    function update(){

        // update query
        $query = "UPDATE
                    " . $this->table_name . "
                SET
                    name = :name,
                    town = :town,
                    street_name = :street_name,
                    number = :number,
                    postalcode = :postalcode,
                    phone_number = :phone_number
                WHERE
                    pharmacy_id = :pharmacy_id";

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->name=htmlspecialchars(strip_tags($this->name));
        $this->town=htmlspecialchars(strip_tags($this->town));
        $this->street_name=htmlspecialchars(strip_tags($this->street_name));
        $this->number=htmlspecialchars(strip_tags($this->number));
        $this->postalcode=htmlspecialchars(strip_tags($this->postalcode));
        $this->phone_number=htmlspecialchars(strip_tags($this->phone_number));

        // bind new values
        $stmt->bindParam(':name', $this->name);
        $stmt->bindParam(':town', $this->town);
        $stmt->bindParam(':street_name', $this->street_name);
        $stmt->bindParam(':number', $this->number);
        $stmt->bindParam(':postalcode', $this->postalcode);
        $stmt->bindParam(':phone_number', $this->phone_number);

        // execute the query
        if($stmt->execute()){
            return true;
        }else{
            return false;
        }
    }

    // delete the pharmacy
    function delete(){

        // delete query
        $query = "DELETE FROM " . $this->table_name . " WHERE pharmacy_id = ?";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->pharmacy_id=htmlspecialchars(strip_tags($this->pharmacy_id));

        // bind pharmacy_id of record to delete
        $stmt->bindParam(1, $this->pharmacy_id);

        // execute query
        if($stmt->execute()){
            return true;
        }

        return false;
    }

}
?>
