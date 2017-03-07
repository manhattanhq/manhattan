<?php
class Patient{
    // database connection and table name
    private $conn;
    private $table_name = "patient";

    // object properties
    public $patient_id;
    public $name;
    public $surname;
    public $town;
    public $street_name;
    public $number;
    public $postalcode;
    public $age;
    public $doctor_id;
    public $created;

    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    // create patient
    function create(){

        // query to insert record
        $query = "INSERT INTO
                    " . $this->table_name . "
                SET
                    name=:name, surname=:surname, town=:town, street_name=:street_name, number=:number, postalcode=:postalcode, age=:age, doctor_id=:doctor_id, created=:created";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // posted values
        $this->name=htmlspecialchars(strip_tags($this->name));
        $this->surname=htmlspecialchars(strip_tags($this->surname));
        $this->town=htmlspecialchars(strip_tags($this->town));
        $this->street_name=htmlspecialchars(strip_tags($this->street_name));
        $this->number=htmlspecialchars(strip_tags($this->number));
        $this->postalcode=htmlspecialchars(strip_tags($this->postalcode));
        $this->age=htmlspecialchars(strip_tags($this->age));
        $this->doctor_id=htmlspecialchars(strip_tags($this->doctor_id));

        // bind values
        $stmt->bindParam(":name", $this->name);
        $stmt->bindParam(":surname", $this->surname);
        $stmt->bindParam(":town", $this->town);
        $stmt->bindParam(":street_name", $this->street_name);
        $stmt->bindParam(":number", $this->number);
        $stmt->bindParam(":postalcode", $this->postalcode);
        $stmt->bindParam(":age", $this->age);
        $stmt->bindParam(":doctor_id", $this->street_name);
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

    // read patients
    function readAll(){

        // select all query
        $query = "SELECT
                    patient_id, name, surname, town, street_name, number, postalcode, age, doctor_id, created
                FROM
                    " . $this->table_name . "
                ORDER BY
                    patient_id DESC";

        // prepare query statement
        $stmt = $this->conn->prepare( $query );

        // execute query
        $stmt->execute();

        return $stmt;
    }

    // used when filling up the update patient form
    function readOne(){

        // query to read single record
        $query = "SELECT
                    name, surname, town, street_name, number, postalcode, age, doctor_id
                FROM
                    " . $this->table_name . "
                WHERE
                    patient_id = ?
                LIMIT
                    0,1";

        // prepare query statement
        $stmt = $this->conn->prepare( $query );

        // bind patient_id of patient to be updated
        $stmt->bindParam(1, $this->patient_id);

        // execute query
        $stmt->execute();

        // get retrieved row
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        // set values to object properties
        $this->name = $row['name'];
        $this->surname = $row['surname'];
        $this->town = $row['town'];
        $this->street_name = $row['street_name'];
        $this->number = $row['number'];
        $this->postalcode = $row['postalcode'];
        $this->age = $row['age'];
        $this->doctor_id = $row['doctor_id'];

    }

    // update the patient
    function update(){

        // update query
        $query = "UPDATE
                    " . $this->table_name . "
                SET
                    name = :name,
                    surname = :surname,
                    town = :town,
                    street_name = :street_name,
                    number = :number,
                    postalcode = :postalcode,
                    age = :age,
                    doctor_id = :doctor_id
                WHERE
                    patient_id = :patient_id";

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->name=htmlspecialchars(strip_tags($this->name));
        $this->surname=htmlspecialchars(strip_tags($this->surname));
        $this->town=htmlspecialchars(strip_tags($this->town));
        $this->street_name=htmlspecialchars(strip_tags($this->street_name));
        $this->number=htmlspecialchars(strip_tags($this->number));
        $this->postalcode=htmlspecialchars(strip_tags($this->postalcode));
        $this->age=htmlspecialchars(strip_tags($this->age));
        $this->doctor_id=htmlspecialchars(strip_tags($this->doctor_id));
        $this->patient_id=htmlspecialchars(strip_tags($this->patient_id));

        // bind new values
        $stmt->bindParam(':name', $this->name);
        $stmt->bindParam(':surname', $this->surname);
        $stmt->bindParam(':town', $this->town);
        $stmt->bindParam(':street_name', $this->street_name);
        $stmt->bindParam(':number', $this->number);
        $stmt->bindParam(':postalcode', $this->postalcode);
        $stmt->bindParam(':age', $this->age);
        $stmt->bindParam(':doctor_id', $this->doctor_id);
        $stmt->bindParam(':patient_id', $this->patient_id);

        // execute the query
        if($stmt->execute()){
            return true;
        }else{
            return false;
        }
    }

    // delete the patient
    function delete(){

        // delete query
        $query = "DELETE FROM " . $this->table_name . " WHERE patient_id = ?";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->patient_id=htmlspecialchars(strip_tags($this->patient_id));

        // bind patient_id of record to delete
        $stmt->bindParam(1, $this->patient_id);

        // execute query
        if($stmt->execute()){
            return true;
        }

        return false;
    }

}
?>
