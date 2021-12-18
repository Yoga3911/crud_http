<?php 

require_once "conn.php";

$query = "DELETE FROM data WHERE id = '". $_POST['id'] ."'";
$conn->query($query);