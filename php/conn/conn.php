<?php
  $hostname = "127.0.0.1";
  $username = "root";
  $pwd = "";
  $db = "project_db";
  $conn = new mysqli($hostname, $username, $pwd, $db) ;
  mysqli_set_charset($conn,"utf8");
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
?>