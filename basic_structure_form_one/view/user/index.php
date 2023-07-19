<?php
include("../../config/config.php");


$sql = "CALL sp_select_all_user(); ";
$sql .= "SELECT * FROM `document_type` WHERE 1;";
$sql .= "SELECT * FROM `gendertype` WHERE 1;";
$sql .= "SELECT * FROM `status` WHERE 1;";
$resultArray = array();
if (!$connect->multi_query($sql)) {
  echo "Falló la multiconsulta: (" . $connect->errno . ") " . $connect->error;
}

do {
  if ($result = $connect->store_result()) {


    $resultQuery = $result->fetch_all(MYSQLI_NUM);
    array_push($resultArray, $resultQuery);

    $result->free();
  }
} while ($connect->more_results() && $connect->next_result());
$resultUser = $resultArray[0];
$resultDocumentType = $resultArray[1];
$resultGenderType = $resultArray[2];
$resultStatus = $resultArray[3];

?>
<!-- 
  #Ahutor:DIEGO CASALLAS
  #Busines: 
  #Date:14/07/2023
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

  <!--*****************************************************************************************************************-->
  <!--Estructura inicial del formulario-->
  <!--La etiqueta clave div solo especifica una división en el cuerpo, como la celda de una tabla-->
  <!--Inicio de división etiqueta <div>-->
  <!--Etiqueta div - name => permite a un script acceder a su contenido <div>-->
  <!--Etiqueta div - id => permite a un script o al css acceder a su contenido <div>-->
  <!--Etiqueta div - class => permite a una clase de css acceder a su contenido <div>-->
  <div id="sectionOne" class="sectionOne" name="sectionOne">
    <!--Etiqueta h2 de titulo <h2>-->
    <h2>REGISTRAR USUARIOS</h2>

    <!--Inicio de formulario - etiqueta de formulario <form>-->
    <!--Formulario form - name => permite a un script acceder a su contenido <input>-->
    <!--Formulario form - id => permite a un script o al css acceder a su contenido <form>-->
    <!--Formulario form - class => permite a una clase de css acceder a su contenido <form>-->
    <form name="formUser" method="GET" action="../../controller/user/insert.php" id="formUser" class="formUser">
      <!--Inicio de tabla para los contenidos del formulario - etiqueta de tabla <table>-->
      <!--Etiqueta table - name => permite a un script acceder a su contenido <table>-->
      <!--Etiqueta table - id => permite a un script o al css acceder a su contenido <div>-->
      <!--Etiqueta table - class => permite a una clase de css acceder a su contenido <div>-->
      <!--Caja de texto etiqueta input - name => permite a un script acceder a su contenido <input>-->
      <!--Caja de texto etiqueta input - id => permite a un script o al css acceder a su contenido <input>-->
      <!--Caja de texto etiqueta input - class => permite a una clase de css acceder a su contenido <input>-->
      <!--Caja de texto etiqueta input - type => hidden campo oculto en el html<input>-->
      <input type="hidden" value="" id="User_id" name="User_id" />
      <table name="tableUser" id="tableUser" class="tableUser">
        <!--Inicio de fila para de la tabla - etiqueta de fila <tr>-->
        <tr>
          <!--Inicio de columna para de la tabla - etiqueta de columna <td>-->
          <td>
            <!--Caja de texto etiqueta input - type => tipo texto <input>-->
            <!--Caja de texto etiqueta input - value => valor de la caja de texto <input>-->
            <!--Caja de texto etiqueta input - placeholder => Texto de referencia en el campo de texto <input>-->
            <!--Caja de texto etiqueta input - required => indica que la caja de texto es requerida (obligatoria) <input>-->
            <!--Caja de texto etiqueta input - name => permite a un script acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - id => permite a un script o al css acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - class => permite a una clase de css acceder a su contenido <input>-->
            <input type="text" value="" placeholder="Digitar Nombre" id="User_name" name="User_name" required />
          </td>
          <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->

          <!--Inicio de columna para de la tabla - etiqueta de columna <td>-->
          <td>
            <!--Caja de texto etiqueta input - type => tipo texto <input>-->
            <!--Caja de texto etiqueta input - value => valor de la caja de texto <input>-->
            <!--Caja de texto etiqueta input - placeholder => Texto de referencia en el campo de texto <input>-->
            <!--Caja de texto etiqueta input - required => indica que la caja de texto es requerida (obligatoria) <input>-->
            <!--Caja de texto etiqueta input - name => permite a un script acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - id => permite a un script o al css acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - class => permite a una clase de css acceder a su contenido <input>-->
            <input type="text" value="" placeholder="Digitar Apellido" id="User_lastName" name="User_lastName" required />
          </td>
          <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->
          <!--Inicio de columna para de la tabla - etiqueta de columna <td>-->
          <td>
            <!--Caja de texto etiqueta input - type => tipo texto <input>-->
            <!--Caja de texto etiqueta input - value => valor de la caja de texto <input>-->
            <!--Caja de texto etiqueta input - placeholder => Texto de referencia en el campo de texto <input>-->
            <!--Caja de texto etiqueta input - required => indica que la caja de texto es requerida (obligatoria) <input>-->
            <!--Caja de texto etiqueta input - name => permite a un script acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - id => permite a un script o al css acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - class => permite a una clase de css acceder a su contenido <input>-->
            <input type="number" value="" placeholder="Digitar Documento" id="User_document" name="User_document" required />

          </td>

        </tr>
        <!--Cierre de fila para de la tabla - etiqueta de fila <tr>-->

        <!--Inicio de fila para de la tabla - etiqueta de fila <tr>-->
        <tr>

          <td>
            <!--Caja de texto etiqueta input - type => tipo email <input>-->
            <!--Caja de texto etiqueta input - value => valor de la caja de texto <input>-->
            <!--Caja de texto etiqueta input - placeholder => Texto de referencia en el campo de texto <input>-->
            <!--Caja de texto etiqueta input - required => indica que la caja de texto es requerida (obligatoria) <input>-->
            <!--Caja de texto etiqueta input - name => permite a un script acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - id => permite a un script o al css acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - class => permite a una clase de css acceder a su contenido <input>-->
            <input type="email" value="" placeholder="Digitar Correo Electrónico" id="User_email" name="User_email" required />
          </td>
          <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->

          <!--Inicio de columna para de la tabla - etiqueta de columna <td>-->
          <td>
            <!--Caja de texto etiqueta input - type => tipo texto <input>-->
            <!--Caja de texto etiqueta input - value => valor de la caja de texto <input>-->
            <!--Caja de texto etiqueta input - placeholder => Texto de referencia en el campo de texto <input>-->
            <!--Caja de texto etiqueta input - required => indica que la caja de texto es requerida (obligatoria) <input>-->
            <!--Caja de texto etiqueta input - name => permite a un script acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - id => permite a un script o al css acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - class => permite a una clase de css acceder a su contenido <input>-->
            <input type="number" value="" placeholder="Digitar Número de Celular" id="User_cellphone" name="User_cellphone" required />
          </td>
          <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->
          <!--Inicio de columna para de la tabla - etiqueta de columna <td>-->
          <td>
            <!--Caja de texto etiqueta input - type => tipo date <input>-->
            <!--Caja de texto etiqueta input - value => valor de la caja de texto <input>-->
            <!--Caja de texto etiqueta input - placeholder => Texto de referencia en el campo de texto <input>-->
            <!--Caja de texto etiqueta input - required => indica que la caja de texto es requerida (obligatoria) <input>-->
            <!--Caja de texto etiqueta input - name => permite a un script acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - id => permite a un script o al css acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - class => permite a una clase de css acceder a su contenido <input>-->
            <input type="date" value="" placeholder="Fecha de Nacimiento" id="birthdate" name="birthdate" required />
          </td>
          <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->

        </tr>
        <!--Cierre de fila para de la tabla - etiqueta de fila <tr>-->

        <!--Inicio de fila para de la tabla - etiqueta de fila <tr>-->
        <tr>
          <!--Inicio de columna para de la tabla - etiqueta de columna <td>-->
          <td>
            <!--La etiqueta select (<select>) de HTML representa un control que muestra un menú de opciones-->
            <!--Inicio de la lista <select>-->
            <!--lista de selección select - required => indica que la caja de texto es requerida (obligatoria) <select>-->
            <!--lista de selección select - name => permite a un script acceder a su contenido <select>-->
            <!--lista de selección select - id => permite a un script o al css acceder a su contenido <select>-->
            <!--lista de selección select - class => permite a una clase de css acceder a su contenido <select>-->
            <select name="DocumentType_id" id="DocumentType_id" required>
              <!--Inicio de etiqueta de opciones de lista <option>-->
              <!--Valor de la opción - value => valor de la opción <option>-->
              <?php
              for ($i = 0; $i < count($resultDocumentType); $i++) {
                echo '<option value="' . $resultDocumentType[$i][0] . '">' . $resultDocumentType[$i][1] . '</option>';
              };
              ?>
            </select>
            <!--Cierre de la lista <select>-->
          </td>
          <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->

          <!--Inicio de columna para de la tabla - etiqueta de columna <td>-->
          <td>
            <!--La etiqueta select (<select>) de HTML representa un control que muestra un menú de opciones-->
            <!--Inicio de la lista <select>-->
            <!--lista de selección select - required => indica que la caja de texto es requerida (obligatoria) <select>-->
            <!--lista de selección select - name => permite a un script acceder a su contenido <select>-->
            <!--lista de selección select - id => permite a un script o al css acceder a su contenido <select>-->
            <!--lista de selección select - class => permite a una clase de css acceder a su contenido <select>-->
            <select name="GenderType_id" id="GenderType_id" required>
              <!--Inicio de etiqueta de opciones de lista <option>-->
              <!--Valor de la opción - value => valor de la opción <option>-->
              <?php
              for ($i = 0; $i < count($resultGenderType); $i++) {
                echo '<option value="' . $resultGenderType[$i][0] . '">' . $resultGenderType[$i][1] . '</option>';
              };

              ?>

              <!--Cierre de etiqueta de opciones de lista <option>-->
            </select>
            <!--Cierre de la lista <select>-->
          </td>
          <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->

          <!--Inicio de columna para de la tabla - etiqueta de columna <td>-->
          <td>
            <!--La etiqueta select (<select>) de HTML representa un control que muestra un menú de opciones-->
            <!--Inicio de la lista <select>-->
            <!--lista de selección select - required => indica que la caja de texto es requerida (obligatoria) <select>-->
            <!--lista de selección select - name => permite a un script acceder a su contenido <select>-->
            <!--lista de selección select - id => permite a un script o al css acceder a su contenido <select>-->
            <!--lista de selección select - class => permite a una clase de css acceder a su contenido <select>-->
            <select name="Status_id" id="Status_id" required>
              <!--Inicio de etiqueta de opciones de lista <option>-->
              <!--Valor de la opción - value => valor de la opción <option>-->
              <?php
              for ($i = 0; $i < count($resultStatus); $i++) {
                echo '<option value="' . $resultStatus[$i][0] . '">' . $resultStatus[$i][1] . '</option>';
              };
              ?>
            </select>
            <!--Cierre de la lista <select>-->

          </td>
          <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->
        </tr>
        <!--Cierre de fila para de la tabla - etiqueta de fila <tr>-->


        <!--Inicio de fila para de la tabla - etiqueta de fila <tr>-->
        <tr>
          <!--Inicio de columna para de la tabla - etiqueta de columna <td>-->
          <td colspan="3">
            <!--Caja de texto etiqueta input - type => tipo submit <input>-->
            <!--Caja de texto etiqueta input - value => valor de la caja de texto <input>-->
            <!--Caja de texto etiqueta input - required => indica que la caja de texto es requerida (obligatoria) <input>-->
            <!--Caja de texto etiqueta input - name => permite a un script acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - id => permite a un script o al css acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - class => permite a una clase de css acceder a su contenido <input>-->
            <button type="submit" value="" id="btnSubmit" name="btnSubmit" class="btnSubmit"><img src="../../assets/img/icons/add.png">
            </button>

          </td>
          <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->
        </tr>

      </table>
      <!--Cierre de tabla para los contenidos del formulario - etiqueta de tabla <table>-->
      <h3>SEGURIDAD</h3>
      <table class="tableUser">
        <!--Inicio de fila para de la tabla - etiqueta de fila <tr>-->
        <tr>
          <!--Inicio de columna para de la tabla - etiqueta de columna <td>-->
          <td>
            <!--Caja de texto etiqueta input - type => tipo texto <input>-->
            <!--Caja de texto etiqueta input - value => valor de la caja de texto <input>-->
            <!--Caja de texto etiqueta input - placeholder => Texto de referencia en el campo de texto <input>-->
            <!--Caja de texto etiqueta input - required => indica que la caja de texto es requerida (obligatoria) <input>-->
            <!--Caja de texto etiqueta input - name => permite a un script acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - id => permite a un script o al css acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - class => permite a una clase de css acceder a su contenido <input>-->
            <input type="email" value="" placeholder="Digitar Usuario" id="User_user" name="User_user" required />
          </td>
          <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->
          <!--Inicio de columna para de la tabla - etiqueta de columna <td>-->
          <td>
            <!--Caja de texto etiqueta input - type => tipo texto <input>-->
            <!--Caja de texto etiqueta input - value => valor de la caja de texto <input>-->
            <!--Caja de texto etiqueta input - placeholder => Texto de referencia en el campo de texto <input>-->
            <!--Caja de texto etiqueta input - required => indica que la caja de texto es requerida (obligatoria) <input>-->
            <!--Caja de texto etiqueta input - name => permite a un script acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - id => permite a un script o al css acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - class => permite a una clase de css acceder a su contenido <input>-->
            <input type="password" value="" placeholder="Digitar Contraseña" id="User_password" name="User_password" required />
          </td>
          <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->

          <!--Inicio de columna para de la tabla - etiqueta de columna <td>-->
          <td>
            <!--Caja de texto etiqueta input - type => tipo texto <input>-->
            <!--Caja de texto etiqueta input - value => valor de la caja de texto <input>-->
            <!--Caja de texto etiqueta input - placeholder => Texto de referencia en el campo de texto <input>-->
            <!--Caja de texto etiqueta input - required => indica que la caja de texto es requerida (obligatoria) <input>-->
            <!--Caja de texto etiqueta input - name => permite a un script acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - id => permite a un script o al css acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - class => permite a una clase de css acceder a su contenido <input>-->
            <input type="password" value="" placeholder="Repetir Contraseña" id="passwordRepeat" name="passwordRepeat" required />
          </td>
          <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->
          <!--Inicio de columna para de la tabla - etiqueta de columna <td>-->
          <td style="text-align: center;">
            <button type="button" name="btnViewPassword" id="btnViewPassword" class="btnViewPassword" value=""> <img src="../../assets/img/icons/lock.png" width="30px"> </button>

          </td>
          <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->
        </tr>
        <!--Cierre de fila para de la tabla - etiqueta de fila <tr>-->
      </table>

    </form>
    <!--Cierre de formulario <form>-->
  </div>
  <!--Cierre de división etiqueta </div>-->

  <!--*****************************************************************************************************************-->
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
            <button class="btnView"> <a><img src="../../assets/img/icons/visibility.png" /></a> </button>
            <button class="btnUpdate"><a href="edit.php?User_id=' . $rowUser[$i][0] . '"><img src="../../assets/img/icons/edit.png" /><a></button>
            <button class="btnDelete"> <img src="../../assets/img/icons/remove.png" /> </button>
          </td>
        </tr>';
        };

        $connect->close();
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
  <!--Etiqueta de enlace con la logíca de javascript <script>-->
  <script src="../assets/js/main.js" type="javascript"></script>
</body>

</html>