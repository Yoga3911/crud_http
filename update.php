<?php

require_once "conn.php";

$nama = $_POST['nama'];
$umur = $_POST['umur'];

$query = "UPDATE data SET nama = '". $nama ."', umur = '". $umur ."' ";

$conn->query($query);