<?php
class Drug{
    // database connection and table name
    private $conn;
    private $table_name = "drug";

    // object properties
    public $drug_id;
    public $name;
    public $formula;
    public $pharmaceutical_company_id;
    public $created;

    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    // create drug
    function create(){

        // query to insert record
        $query = "INSERT INTO
                    " . $this->table_name . "
                SET
                    name=:name, formula=:formula, pharmaceutical_company_id=:pharmaceutical_company_id, created=:created";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // posted values
        $this->name=htmlspecialchars(strip_tags($this->name));
        $this->formula=htmlspecialchars(strip_tags($this->formula));
        $this->pharmaceutical_company_id=htmlspecialchars(strip_tags($this->pharmaceutical_company_id));

        // bind values
        $stmt->bindParam(":name", $this->name);
        $stmt->bindParam(":formula", $this->formula);
        $stmt->bindParam(":pharmaceutical_company_id", $this->pharmaceutical_company_id);
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

    // read drugs
    function readAll(){

        // select all query
        $query = "SELECT
                    drug_id, name, formula, pharmaceutical_company_id, created
                FROM
                    " . $this->table_name . "
                ORDER BY
                    drug_id DESC";

        // prepare query statement
        $stmt = $this->conn->prepare( $query );

        // execute query
        $stmt->execute();

        return $stmt;
    }

    // used when filling up the update drug form
    function readOne(){

        // query to read single record
        $query = "SELECT
                    name, formula, pharmaceutical_company_id
                FROM
                    " . $this->table_name . "
                WHERE
                    drug_id = ?
                LIMIT
                    0,1";

        // prepare query statement
        $stmt = $this->conn->prepare( $query );

        // bind drug_id of drug to be updated
        $stmt->bindParam(1, $this->drug_id);

        // execute query
        $stmt->execute();

        // get retrieved row
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        // set values to object properties
        $this->name = $row['name'];
        $this->formula = $row['formula'];
        $this->pharmaceutical_company_id = $row['pharmaceutical_company_id'];

    }

    // update the drug
    function update(){

        // update query
        $query = "UPDATE
                    " . $this->table_name . "
                SET
                    name = :name,
                    formula = :formula,
                    pharmaceutical_company_id = :pharmaceutical_company_id
                WHERE
                    drug_id = :drug_id";

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->name=htmlspecialchars(strip_tags($this->name));
        $this->formula=htmlspecialchars(strip_tags($this->formula));
        $this->pharmaceutical_company_id=htmlspecialchars(strip_tags($this->pharmaceutical_company_id));
        $this->drug_id=htmlspecialchars(strip_tags($this->drug_id));

        // bind new values
        $stmt->bindParam(':name', $this->name);
        $stmt->bindParam(':formula', $this->formula);
        $stmt->bindParam(':pharmaceutical_company_id', $this->pharmaceutical_company_id);
        $stmt->bindParam(':drug_id', $this->drug_id);

        // execute the query
        if($stmt->execute()){
            return true;
        }else{
            return false;
        }
    }

    // delete the drug
    function delete(){

        // delete query
        $query = "DELETE FROM " . $this->table_name . " WHERE drug_id = ?";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->drug_id=htmlspecialchars(strip_tags($this->drug_id));

        // bind drug_id of record to delete
        $stmt->bindParam(1, $this->drug_id);

        // execute query
        if($stmt->execute()){
            return true;
        }

        return false;
    }

}
?>
