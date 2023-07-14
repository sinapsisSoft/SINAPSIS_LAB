<?php

  #Ahutor:DIEGO CASALLAS
  #Busines: 
  #Date:14/07/2023
  #Description:Connect database
  #Vesion:1.0

  /***********/
  /*Variables*/

$server="localhost";
$user="root";
$pass="";
$database="db_project";
$connect =new mysqli($server,$user,$pass,$database);

if ($connect -> connect_errno) {
  echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
  exit();
}else{
  echo "To connect Ok"; 
}

$sql = "SELECT * FROM user WHERE 1";
$result = $connect -> query($sql);

// Numeric array

$result -> fetch_all(MYSQLI_ASSOC);
var_dump($result);


// Free result set
$result -> free_result();

$connect -> close();
?>