<?php
class Doctor{
    // database connection and table name
    private $conn;
    private $table_name = "doctor";

    // object properties
    public $doctor_id;
    public $name;
    public $surname;
    public $specialty;
    public $experience_years;
    public $created;

    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    // create doctor
    function create(){

        // query to insert record
        $query = "INSERT INTO
                    " . $this->table_name . "
                SET
                    name=:name, surname=:surname, specialty=:specialty, experience_years=:experience_years, created=:created";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // posted values
        $this->name=htmlspecialchars(strip_tags($this->name));
        $this->surname=htmlspecialchars(strip_tags($this->surname));
        $this->specialty=htmlspecialchars(strip_tags($this->specialty));
        $this->experience_years=htmlspecialchars(strip_tags($this->experience_years));

        // bind values
        $stmt->bindParam(":name", $this->name);
        $stmt->bindParam(":surname", $this->surname);
        $stmt->bindParam(":specialty", $this->specialty);
        $stmt->bindParam(":experience_years", $this->experience_years);
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

    // read doctors
    function readAll(){

        // select all query
        $query = "SELECT
                    doctor_id, name, surname, specialty, experience_years, created
                FROM
                    " . $this->table_name . "
                ORDER BY
                    doctor_id DESC";

        // prepare query statement
        $stmt = $this->conn->prepare( $query );

        // execute query
        $stmt->execute();

        return $stmt;
    }

    // used when filling up the update doctor form
    function readOne(){

        // query to read single record
        $query = "SELECT
                    name, surname, specialty, experience_years
                FROM
                    " . $this->table_name . "
                WHERE
                    doctor_id = ?
                LIMIT
                    0,1";

        // prepare query statement
        $stmt = $this->conn->prepare( $query );

        // bind doctor_id of doctor to be updated
        $stmt->bindParam(1, $this->doctor_id);

        // execute query
        $stmt->execute();

        // get retrieved row
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        // set values to object properties
        $this->name = $row['name'];
        $this->surname = $row['surname'];
        $this->specialty = $row['specialty'];
        $this->experience_years = $row['experience_years'];

    }

    // update the doctor
    function update(){

        // update query
        $query = "UPDATE
                    " . $this->table_name . "
                SET
                    name = :name,
                    surname = :surname,
                    specialty = :specialty,
                    experience_years = :experience_years
                WHERE
                    doctor_id = :doctor_id";

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->name=htmlspecialchars(strip_tags($this->name));
        $this->surname=htmlspecialchars(strip_tags($this->surname));
        $this->specialty=htmlspecialchars(strip_tags($this->specialty));
        $this->experience_years=htmlspecialchars(strip_tags($this->experience_years));
        $this->doctor_id=htmlspecialchars(strip_tags($this->doctor_id));

        // bind new values
        $stmt->bindParam(':name', $this->name);
        $stmt->bindParam(':surname', $this->surname);
        $stmt->bindParam(':specialty', $this->specialty);
        $stmt->bindParam(':experience_years', $this->experience_years);
        $stmt->bindParam(':doctor_id', $this->doctor_id);

        // execute the query
        if($stmt->execute()){
            return true;
        }else{
            return false;
        }
    }

    // delete the doctor
    function delete(){

        // delete query
        $query = "DELETE FROM " . $this->table_name . " WHERE doctor_id = ?";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->doctor_id=htmlspecialchars(strip_tags($this->doctor_id));

        // bind doctor_id of record to delete
        $stmt->bindParam(1, $this->doctor_id);

        // execute query
        if($stmt->execute()){
            return true;
        }

        return false;
    }

}
?>
