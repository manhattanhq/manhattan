<html><head><title>MySQL Table Viewer</title></head><body>
<?php
$db_host = 'localhost';
$db_user = 'root';
$db_pwd = '123';

$database = 'manhattan';

if (!mysql_connect($db_host, $db_user, $db_pwd))
    die("Can't connect to database");

if (!mysql_select_db($database))
    die("Can't select database");

// sending query
$result = mysql_query("SELECT `patient`.`name`, `patient`.`surname`, `doctor`.`name`, `doctor`.`surname`, `doctor`.`experience_years`
FROM `patient`, `doctor`
WHERE `patient`.`doctor_id` = `doctor`.`doctor_id`
GROUP BY `doctor`.`doctor_id`
HAVING `doctor`.`experience_years` > 20");
if (!$result) {
    die("Query to show fields from table failed");
}

$fields_num = mysql_num_fields($result);

echo "<h1>Query 6 - Havingg</h1>";
echo "<h2>Patients who are watched by doctor with more than 20 years of experience</h2>";
echo "<table border='1'><tr>";
// printing table headers
for($i=0; $i<$fields_num; $i++)
{
    $field = mysql_fetch_field($result);
    echo "<td>{$field->name}</td>";
}
echo "</tr>\n";
// printing table rows
while($row = mysql_fetch_row($result))
{
    echo "<tr>";

    // $row is array... foreach( .. ) puts every element
    // of $row to $cell variable
    foreach($row as $cell)
        echo "<td>$cell</td>";

    echo "</tr>\n";
}
mysql_free_result($result);
?>
</body></html>
