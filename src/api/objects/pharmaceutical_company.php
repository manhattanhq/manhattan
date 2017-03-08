<?php
class Pharmaceutical_company{
    // database connection and table name
    private $conn;
    private $table_name = "pharmaceutical_company";

    // object properties
    public $pharmaceutical_company_id;
    public $name;
    public $phone_number;
    public $created;

    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    // create pharmaceutical_company
    function create(){

        // query to insert record
        $query = "INSERT INTO
                    " . $this->table_name . "
                SET
                    name=:name, phone_number=:phone_number, created=:created";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // posted values
        $this->name=htmlspecialchars(strip_tags($this->name));
        $this->phone_number=htmlspecialchars(strip_tags($this->phone_number));

        // bind values
        $stmt->bindParam(":name", $this->name);
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

    // read pharmaceutical_companys
    function readAll(){

        // select all query
        $query = "SELECT
                    pharmaceutical_company_id, name, phone_number, created
                FROM
                    " . $this->table_name . "
                ORDER BY
                    pharmaceutical_company_id DESC";

        // prepare query statement
        $stmt = $this->conn->prepare( $query );

        // execute query
        $stmt->execute();

        return $stmt;
    }

    // used when filling up the update pharmaceutical_company form
    function readOne(){

        // query to read single record
        $query = "SELECT
                    name, phone_number
                FROM
                    " . $this->table_name . "
                WHERE
                    pharmaceutical_company_id = ?
                LIMIT
                    0,1";

        // prepare query statement
        $stmt = $this->conn->prepare( $query );

        // bind pharmaceutical_company_id of pharmaceutical_company to be updated
        $stmt->bindParam(1, $this->pharmaceutical_company_id);

        // execute query
        $stmt->execute();

        // get retrieved row
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        // set values to object properties
        $this->name = $row['name'];
        $this->phone_number = $row['phone_number'];
    }

    // update the pharmaceutical_company
    function update(){

        // update query
        $query = "UPDATE
                    " . $this->table_name . "
                SET
                    name = :name,
                    phone_number = :phone_number
                WHERE
                    pharmaceutical_company_id = :pharmaceutical_company_id";

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->name=htmlspecialchars(strip_tags($this->name));
        $this->phone_number=htmlspecialchars(strip_tags($this->phone_number));
        $this->pharmaceutical_company_id=htmlspecialchars(strip_tags($this->pharmaceutical_company_id));

        // bind new values
        $stmt->bindParam(':name', $this->name);
        $stmt->bindParam(':phone_number', $this->phone_number);
        $stmt->bindParam(':pharmaceutical_company_id', $this->pharmaceutical_company_id);

        // execute the query
        if($stmt->execute()){
            return true;
        }else{
            return false;
        }
    }

    // delete the pharmaceutical_company
    function delete(){

        // delete query
        $query = "DELETE FROM " . $this->table_name . " WHERE pharmaceutical_company_id = ?";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->pharmaceutical_company_id=htmlspecialchars(strip_tags($this->pharmaceutical_company_id));

        // bind pharmaceutical_company_id of record to delete
        $stmt->bindParam(1, $this->pharmaceutical_company_id);

        // execute query
        if($stmt->execute()){
            return true;
        }

        return false;
    }

}
?>
