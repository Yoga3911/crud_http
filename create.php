<?php

require_once "conn.php";

$nama = $_POST['nama'];
$umur = $_POST['umur'];

$query = "INSERT INTO data VALUES(0, '". $nama ."', '". $umur ."')";

if($conn->query($query) == false) {
    throw "error";
};
