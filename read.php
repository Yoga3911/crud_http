<?php

require_once "conn.php";

$result = $conn->query("SELECT * FROM data");

$datas = [];

while($data = $result->fetch_assoc()) {
    $datas[] = $data;
}

echo json_encode($datas);
