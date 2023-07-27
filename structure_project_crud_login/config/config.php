<?php

#Ahutor:DIEGO CASALLAS
#Busines: 
#Date:14/07/2023
#Description:Connect database
#Vesion:1.0

/***********/
/*Variables*/

$server = "localhost";
$user = "root";
$pass = "";
$database = "db_project";
$connect = new mysqli($server, $user, $pass, $database);

//var_dump($connect);
if ($connect->connect_errno) {
  echo "Failed to connect to MySQL: " . $connect->connect_error;
  exit();
} else {
   echo "To connect Ok";
}


