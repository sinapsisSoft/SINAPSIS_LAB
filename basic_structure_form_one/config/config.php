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
  // echo "To connect Ok";
}

$sql = "SELECT * FROM user ";
//$sql = "SELECT * FROM `status` WHERE 1";
$result = $connect->query($sql);

// Numeric array

$row = $result->fetch_all(MYSQLI_NUM);



//var_dump($row[0][0]);


echo (' <table name="tableViewUser" id="tableViewUser" class="tableViewUser">
<!--Inicio de cabeza de tabla para los contenidos de la tabla  - etiqueta de cabeza tabla <thead>-->

<thead>
  <tr>


    <th>ID</th>
    <th>NOMBRE</th>
    <th>CONTRASEÑA</th>
    <th>ESTADO</th>
    <th>ACCIONES</th>

  </tr>
</thead>

<tbody>');
for ($i = 0; $i < count($row); $i++) {

  echo ('<tr class="checkTr">
  <td>'.$row[$i][0].'</td>
  <td>'.$row[$i][1].'</td>
  <td>'.$row[$i][2].'</td>
  <td>'.$row[$i][3].'</td>
 
  <td class="btnsActions" style="text-align: center;">
    <button class="btnView" onclick="alert('.$row[$i][0].')"> <img src="../assets/img/icons/visibility.png" /> </button>
    <button class="btnUpdate" onclick="alert('.$row[$i][0].')"> <img src="../assets/img/icons/edit.png" /> </button>
    <button class="btnDelete" onclick="alert('.$row[$i][0].')"> <img src="../assets/img/icons/remove.png" /> </button>
  </td>
</tr>');
 }
  
echo('
</tbody>

<tfoot>
  <tr>
  <th>ID</th>
  <th>NOMBRE</th>
  <th>CONTRASEÑA</th>
  <th>ESTADO</th>
  <th>ACCIONES</th>
  </tr>

</tfoot>
<!--Cierre de pie de tabla para los contenidos de la tabla  - etiqueta de pie tabla <tfoot>-->
</table>  ');


// Free result set
$result->free_result();

$connect->close();
