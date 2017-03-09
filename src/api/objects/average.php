<?php
class Average{
    // database connection and table name
    private $conn;
    private $table_name = "average";

    // object properties
    public $average_id;
    public $name;
    public $formula;
    public $pharmaceutical_company_id;
    public $created;
    public $avg;

    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    // create average
    function create(){

        // query to insert record
        $query = "INSERT INTO
                    " . $this->table_name . "
                SET
                    name=:name, formula=:formula, pharmaceutical_company_id=:pharmaceutical_company_id, created=:created, avg=:avg";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // posted values
        $this->name=htmlspecialchars(strip_tags($this->name));
        $this->formula=htmlspecialchars(strip_tags($this->formula));
        $this->pharmaceutical_company_id=htmlspecialchars(strip_tags($this->pharmaceutical_company_id));
        $this->avg=htmlspecialchars(strip_tags($this->avg));

        // bind values
        $stmt->bindParam(":name", $this->name);
        $stmt->bindParam(":formula", $this->formula);
        $stmt->bindParam(":pharmaceutical_company_id", $this->pharmaceutical_company_id);
        $stmt->bindParam(":created", $this->created);
        $stmt->bindParam(":avg", $this->avg);

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

    // read averages
    function readAll(){

        // select all query
        $query = "SELECT
                    average_id, name, formula, pharmaceutical_company_id, created, avg
                FROM
                    " . $this->table_name . "
                ORDER BY
                    average_id DESC";

        // prepare query statement
        $stmt = $this->conn->prepare( $query );

        // execute query
        $stmt->execute();

        return $stmt;
    }

    // used when filling up the update average form
    function readOne(){

        // query to read single record
        $query = "SELECT
                    name, formula, pharmaceutical_company_id, avg
                FROM
                    " . $this->table_name . "
                WHERE
                    average_id = ?
                LIMIT
                    0,1";

        // prepare query statement
        $stmt = $this->conn->prepare( $query );

        // bind average_id of average to be updated
        $stmt->bindParam(1, $this->average_id);

        // execute query
        $stmt->execute();

        // get retrieved row
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        // set values to object properties
        $this->name = $row['name'];
        $this->formula = $row['formula'];
        $this->pharmaceutical_company_id = $row['pharmaceutical_company_id'];
        $this->avg = $row['avg'];

    }

    // update the average
    function update(){

        // update query
        $query = "UPDATE
                    " . $this->table_name . "
                SET
                    name = :name,
                    formula = :formula,
                    pharmaceutical_company_id = :pharmaceutical_company_id,
                    avg = :avg
                WHERE
                    average_id = :average_id";

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->name=htmlspecialchars(strip_tags($this->name));
        $this->formula=htmlspecialchars(strip_tags($this->formula));
        $this->pharmaceutical_company_id=htmlspecialchars(strip_tags($this->pharmaceutical_company_id));
        $this->avg=htmlspecialchars(strip_tags($this->avg));
        $this->average_id=htmlspecialchars(strip_tags($this->average_id));

        // bind new values
        $stmt->bindParam(':name', $this->name);
        $stmt->bindParam(':formula', $this->formula);
        $stmt->bindParam(':pharmaceutical_company_id', $this->pharmaceutical_company_id);
        $stmt->bindParam(':avg', $this->avg);
        $stmt->bindParam(':average_id', $this->average_id);

        // execute the query
        if($stmt->execute()){
            return true;
        }else{
            return false;
        }
    }

    // delete the average
    function delete(){

        // delete query
        $query = "DELETE FROM " . $this->table_name . " WHERE average_id = ?";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->average_id=htmlspecialchars(strip_tags($this->average_id));

        // bind average_id of record to delete
        $stmt->bindParam(1, $this->average_id);

        // execute query
        if($stmt->execute()){
            return true;
        }

        return false;
    }

}
?>
