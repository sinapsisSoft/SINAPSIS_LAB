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
  #Vesion:1.0
-->
<!--<!DOCTYPE html> En primer lugar necesitamos indicar el tipo de documento que estamos creando. Esto en HTML5 es extremadamente sencillo: -->
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
  <link href="../../assets/css/formStyle.css" rel="stylesheet" />
</head>
<!--El cuerpo representa la parte visible de todo documento y es especificado entre etiquetas <body>-->

<body>


  <!--Inicio de división etiqueta <div>-->
  <!--Etiqueta div - id => permite a un script o al css acceder a su contenido <div>-->
  <!--Etiqueta div - class => permite a una clase de css acceder a su contenido <div>-->
  <!--Inicio de división etiqueta <div>-->
  <!--Etiqueta div - id => permite a un script o al css acceder a su contenido <div>-->
  <!--Etiqueta div - class => permite a una clase de css acceder a su contenido <div>-->
  <div id="sectionTwo" class="sectionTwo">
    <!--Etiqueta h1 de titulo <h1>-->
    <h2 style="text-align: center;">LISTA DE USUARIOS</h2>
    <div>
      <form>
        <table name="tableViewUserSearch" id="tableViewUserSearch" class="tableViewUserSearch">
          <tr>
            <!--Inicio de columna para de la tabla - etiqueta de columna <td>-->
            <td>
              <!--La etiqueta select (<select>) de HTML representa un control que muestra un menú de opciones-->
              <!--Inicio de la lista <select>-->
              <!--lista de selección select - required => indica que la caja de texto es requerida (obligatoria) <select>-->
              <!--lista de selección select - name => permite a un script acceder a su contenido <select>-->
              <!--lista de selección select - id => permite a un script o al css acceder a su contenido <select>-->
              <!--lista de selección select - class => permite a una clase de css acceder a su contenido <select>-->
              <select name="typeSearch" id="typeSearch" required>
                <!--Inicio de etiqueta de opciones de lista <option>-->
                <!--Valor de la opción - value => valor de la opción <option>-->

                <option value="0">DOCUMENTO</option>
                <!--Cierre de etiqueta de opciones de lista <option>-->
                <!--Inicio de etiqueta de opciones de lista <option>-->
                <!--Valor de la opción - value => valor de la opción <option>-->
                <option value="1">NOMBRE</option>
                <!--Cierre de etiqueta de opciones de lista <option>-->
                <!--Inicio de etiqueta de opciones de lista <option>-->
                <!--Valor de la opción - value => valor de la opción <option>-->
                <option value="2">APELLIDO</option>
                <!--Cierre de etiqueta de opciones de lista <option>-->
                <!--Cierre de etiqueta de opciones de lista <option>-->
                <!--Inicio de etiqueta de opciones de lista <option>-->
                <!--Valor de la opción - value => valor de la opción <option>-->
                <option value="3">CORREO</option>
                <!--Cierre de etiqueta de opciones de lista <option>-->
              </select>
              <!--Cierre de la lista <select>-->
            </td>
            <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->
            <td> <input type="search" value="" placeholder="Digitar busqueda" required /> </td>
            <td style="text-align: center;"> <button> <img src="../../assets/img/icons/search.png" /> </button></td>
          </tr>

        </table>
      </form>
    </div>

    <!--Inicio de tabla para los contenidos del formulario - etiqueta de tabla <table>-->
    <!--Etiqueta table - name => permite a un script acceder a su contenido <table>-->
    <!--Etiqueta table - id => permite a un script o al css acceder a su contenido <div>-->
    <!--Etiqueta table - class => permite a una clase de css acceder a su contenido <div>-->
    <table name="tableViewUser" id="tableViewUser" class="tableViewUser">
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
          <button class="btnWarning"> <a href="show.php?User_id=' . $rowUser[$i][0] . '"><img src="../../assets/img/icons/visibility.png" /><a> </button>
          <button class="btnInfo"><a href="edit.php?User_id=' . $rowUser[$i][0] . '"><img src="../../assets/img/icons/edit.png" /><a></button>
          <button class="btnSuccess"><a href="../../controller/user/delete.php?Delete_id=0&User_id=' . $rowUser[$i][0] . '"><img src="../../assets/img/icons/lock.png" /></a></button>
          <button class="btnDelete"><a href="../../controller/user/delete.php?Delete_id=1&User_id=' . $rowUser[$i][0] . '"><img src="../../assets/img/icons/remove.png" /></a></button>
        </td>
      </tr>';
        }
        ?>

      </tbody>
      <!--Cierre de cuerpo de tabla para los contenidos de la tabla  - etiqueta de cabeza tabla <tbody>-->
      <!--Inicio de pie de tabla para los contenidos de la tabla  - etiqueta de pie tabla <tfoot>-->
      <tfoot>
        <tr>
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

      </tfoot>
      <!--Cierre de pie de tabla para los contenidos de la tabla  - etiqueta de pie tabla <tfoot>-->
    </table>
    <!--Cierre de tabla para los contenidos del formulario - etiqueta de tabla <table>-->

  </div>
  <!--Cierre de división etiqueta </div>-->
  <!--*****************************************************************************************************************-->
  <!--Cierre de división etiqueta </div>-->
  <!--*****************************************************************************************************************-->
  <!--Etiqueta de enlace con la logíca de javascript <script>-->
  <script src="../assets/js/main.js" type="javascript"></script>
</body>

</html>