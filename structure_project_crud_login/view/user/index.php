<?php
include("../../config/config.php");

$sql = "CALL sp_select_all_user(); ";

if (!$result = $connect->query($sql)) {
  echo "Error consult: (" . $connect->errno . ") " . $connect->error;
} else {
  $resultUser = $result->fetch_all(MYSQLI_NUM);
}



?>
<!-- 
  #Ahutor:DIEGO CASALLAS
  #Busines: 
  #Date:21/07/2023
  #Description:View user
  #Vesion:1.0 indicar el tipo de documento que estamos creando. Esto en HTML5 es extremadamente sencillo: -->
<!DOCTYPE html>
<!--Luego de declarar el tipo de documento, debemos comenzar a construir la estructura HTML-->
<html lang="en">
<!--El elemento <head> va primero, por supuesto, y al igual que el resto de los elementos estructurales  tiene una etiqueta de apertura y una de cierre-->

<head>
  <!--Ésta es una etiqueta <meta> que especifica cómo el texto será presentado en pantalla-->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Name of My Form One</title>
  <!--Etiqueta de enlace con los estilos <link>-->

  <!--Include css php-->
  <?php
  include('../assets/css/css.php');
  ?>
</head>
<!--El cuerpo representa la parte visible de todo documento y es especificado entre etiquetas <body>-->

<body>

  <!--nav-->
  <!--Include nav php-->
  <?php
  include('../assets/view/nav.php');
  ?>
  <!--End nav-->
  <!--Container-->
  <div class="container">

    <h2 style="text-align: center;">LISTA DE USUARIOS</h2>
    <div class="float-end">
      <button class="btn btn-info">
       <a href="create.php"> <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-fill-add" viewBox="0 0 16 16">
          <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0Zm-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"/>
          <path d="M2 13c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Z"/>
        </svg>
      </a>
      </button>
    </div>
    <!--Container search users-->
    <div class="row">
      <form action="#" method="get" id="searchUser">
        <div class="input-group mb-3">
          <button type="submit" form="searchUser" class="btn btn-outline-secondary"><svg
              xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search"
              viewBox="0 0 16 16">
              <path
                d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
            </svg></button>
          <button type="button" class="btn btn-outline-secondary dropdown-toggle dropdown-toggle-split"
            data-bs-toggle="dropdown" aria-expanded="false">
            <span class="visually-hidden">TIPO DE BUSQUEDA</span>
          </button>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">APELLIDO</a></li>
            <li><a class="dropdown-item" href="#">CORREO</a></li>
            <li><a class="dropdown-item" href="#">DOCUMENTO</a></li>
            <li><a class="dropdown-item" href="#">NOMBRE</a></li>
          </ul>
          <input type="search" class="form-control" placeholder="Digitar Busqueda de Usuarios"
            aria-label="Text input with segmented dropdown button" required>
        </div>

      </form>
    </div>
    <!--End Container search users-->

    <!---Container Table user-->

    <!--Inicio de tabla para los contenidos del formulario - etiqueta de tabla <table>-->
    <!--Etiqueta table - name => permite a un script acceder a su contenido <table>-->
    <!--Etiqueta table - id => permite a un script o al css acceder a su contenido <div>-->
    <!--Etiqueta table - class => permite a una clase de css acceder a su contenido <div>-->
    <div class="table-responsive">

      <table name="tableViewUser" id="tableViewUser" class="table table-hover table-sm">
        <!--Inicio de cabeza de tabla para los contenidos de la tabla  - etiqueta de cabeza tabla <thead>-->

        <thead>
          <tr>

            <!--Inicio de las columnas de la tabla de la cabecera  <th>-->
              <th>#</th>
              <th>NOMBRE</th>
              <th>APELLIDO</th>
              <th>TIPO DE DOCUMENTO</th>
              <th>DOCUMENTO</th>
              <th>CORREO</th>
              <th>CELULAR</th>
              <th>CONTRASEÑA</th>
              <th>GÉNERO</th>
              <th>FECHA DE NACIMIENTO</th>
              <th>ESTADO</th>
              <th>ACCIONES</th>

          </tr>
        </thead>
        <!--Cierre de cabeza de tabla para los contenidos de la tabla  - etiqueta de cabeza tabla <thead>-->
        <!--Inicio de cuerpo de tabla para los contenidos de la tabla  - etiqueta de cabeza tabla <tbody>-->
        <tbody>
          <?php
          $rowUser = $resultUser;
          for ($i = 0; $i < count($rowUser); $i++) {
            echo '<tr class="checkTr">';
            echo '<td>' . ($i + 1) . '</td>';
            echo '<td>' . $rowUser[$i][1] . '</td>';
            echo '<td>' . $rowUser[$i][2] . '</td>';
            echo '<td>' . $rowUser[$i][3] . '</td>';
            echo '<td>' . $rowUser[$i][4] . '</td>';
            echo '<td>' . $rowUser[$i][5] . '</td>';
            echo '<td>' . $rowUser[$i][6] . '</td>';
            echo '<td>' . $rowUser[$i][7] . '</td>';
            echo '<td>' . $rowUser[$i][8] . '</td>';
            echo '<td>' . $rowUser[$i][9] . '</td>';
            echo '<td>' . $rowUser[$i][10] . '</td>';
            echo '
          <td class="btnsActions" style="text-align: center;">
          <!--This route is to send a GET type which has the id-->
            <div class="btn-group" role="group" aria-label="Basic mixed styles example">
              <button type="button" class="btn btn-warning"><a href="show.php?User_id=' . $rowUser[$i][0] . '"><img src="../../assets/img/icons/visibility.png" width="20px" /><a></button>
              <button type="button" class="btn btn-info"><a href="edit.php?User_id=' . $rowUser[$i][0] . '"><img src="../../assets/img/icons/edit.png"  width="20px"/><a></button>
              <button type="button" class="btn btn-success"><a href="../../controller/user/delete.php?Delete_id=1&User_id=' . $rowUser[$i][0] . '"><img src="../../assets/img/icons/remove.png"  width="20px"/></a></button>
              <button type="button" class="btn btn-danger"><a href="../../controller/user/delete.php?Delete_id=0&User_id=' . $rowUser[$i][0] . '"><img src="../../assets/img/icons/lock.png"  width="20px"/></a></button>
            </div>
          </td>
        </tr>';
          }
          ?>

        </tbody>
        <!--Cierre de cuerpo de tabla para los contenidos de la tabla  - etiqueta de cabeza tabla <tbody>-->
        <!--Inicio de pie de tabla para los contenidos de la tabla  - etiqueta de pie tabla <tfoot>-->
        <tfoot>
          <tr>
            <td>#</td>
            <td>NOMBRE</td>
            <td>APELLIDO</td>
            <td>TIPO DE DOCUMENTO</td>
            <td>DOCUMENTO</td>
            <td>CORREO</td>
            <td>CELULAR</td>
            <td>CONTRASEÑA</td>
            <td>GÉNERO</td>
            <td>FECHA DE NACIMIENTO</td>
            <td>ESTADO</td>
            <td>ACCIONES</td>

            
          </tr>

        </tfoot>
        <!--Cierre de pie de tabla para los contenidos de la tabla  - etiqueta de pie tabla <tfoot>-->
      </table>
      <!--Cierre de tabla para los contenidos del formulario - etiqueta de tabla <table>-->
    </div>
    <!---End Container Table user-->
  </div>
  <!--Include js php-->
   <!--Container footer-->
   <div class="bottom-0 end-0 w-100" style="background: #e2e6e9; text-align: center;">
    <a href="#">www.miempresa.com</a>
  </div>
  <!--End Container footer-->
  <?php
  include('../assets/js/js.php');
  ?>
</body>

</html>