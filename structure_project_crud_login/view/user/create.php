<?php
include("../../config/config.php");

$sql = "SELECT * FROM `document_type` WHERE 1;";
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
$resultDocumentType = $resultArray[0];
$resultGenderType = $resultArray[1];
$resultStatus = $resultArray[2];

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
    <!--*****************************************************************************************************************-->
    <!--Estructura inicial del formulario-->
    <!--La etiqueta clave div solo especifica una división en el cuerpo, como la celda de una tabla-->
    <!--Inicio de división etiqueta <div>-->
    <!--Etiqueta div - name => permite a un script acceder a su contenido <div>-->
    <!--Etiqueta div - id => permite a un script o al css acceder a su contenido <div>-->
    <!--Etiqueta div - class => permite a una clase de css acceder a su contenido <div>-->
    <div id="sectionOne" class="sectionOne" name="sectionOne">
      <!--Etiqueta h2 de titulo <h2>-->
      <h2>REGISTRAR USUARIO</h2>

      <!--Inicio de formulario - etiqueta de formulario <form>-->
      <!--Formulario form - name => permite a un script acceder a su contenido <input>-->
      <!--Formulario form - id => permite a un script o al css acceder a su contenido <form>-->
      <!--Formulario form - class => permite a una clase de css acceder a su contenido <form>-->
      <form name="formUser" method="GET" action="../../controller/user/insert.php" id="formUser" class="row">
        <!--Inicio de tabla para los contenidos del formulario - etiqueta de tabla <table>-->
        <!--Etiqueta table - name => permite a un script acceder a su contenido <table>-->
        <!--Etiqueta table - id => permite a un script o al css acceder a su contenido <div>-->
        <!--Etiqueta table - class => permite a una clase de css acceder a su contenido <div>-->
        <!--Caja de texto etiqueta input - name => permite a un script acceder a su contenido <input>-->
        <!--Caja de texto etiqueta input - id => permite a un script o al css acceder a su contenido <input>-->
        <!--Caja de texto etiqueta input - class => permite a una clase de css acceder a su contenido <input>-->
        <!--Caja de texto etiqueta input - type => hidden campo oculto en el html<input>-->
        <input type="hidden" value="" id="User_id" name="User_id" />

        <div class="col-4">
          <div class="form-floating mb-1">
            <input type="text" class="form-control form-control-sm" id="User_name" name="User_name"
              placeholder="Digitar Nombre" required>
            <label for="User_name">Digitar Nombre</label>
          </div>
        </div>

        <div class="col-4">
          <div class="form-floating mb-1">
            <input type="text" class="form-control form-control-sm" id="User_lastName" name="User_lastName"
              placeholder="Digitar Apellido" required>
            <label for="User_lastName">Digitar Apellido</label>
          </div>
        </div>

        <div class="col-4">
          <div class="form-floating mb-1">
            <input type="number" class="form-control form-control-sm" id="User_document" name="User_document"
              placeholder="Digitar Documento" required>
            <label for="User_document">Digitar Documento</label>
          </div>
        </div>

        <div class="col-4">
          <div class="form-floating mb-1">
            <input type="email" class="form-control form-control-sm" id="User_email" name="User_email"
              placeholder="Digitar Correo Electrónico" required>
            <label for="User_email">Digitar Correo Electrónico</label>
          </div>
        </div>


        <div class="col-4">
          <div class="form-floating mb-1">
            <input type="number" class="form-control form-control-sm" id="User_cellphone" name="User_cellphone"
              placeholder="Digitar Número de Celular" required>
            <label for="User_cellphone">Digitar Número de Celular</label>
          </div>
        </div>

        <div class="col-4">
          <div class="form-floating mb-1">
            <input type="date" class="form-control form-control-sm" id="User_birthdate" name="User_birthdate"
              placeholder="Fecha de Nacimiento" required>
            <label for="User_birthdate">Fecha de Nacimiento</label>
          </div>
        </div>

        <div class="col-4">
          <div class="form-floating">
            <select class="form-select" id="DocumentType_id" name="DocumentType_id" aria-label="Floating label select example">
              <option selected>Open this select menu</option>

              <?php
                for ($i = 0; $i < count($resultDocumentType); $i++) {
                  echo '<option value="' . $resultDocumentType[$i][0] . '">' . $resultDocumentType[$i][1] . '</option>';
                }
                ;
                ?>
            </select>
            <label for="DocumentType_id">Tipo de Documento</label>
          </div>
        </div>

        <div class="col-4">
          <div class="form-floating">
            <select class="form-select" id="GenderType_id" name="GenderType_id" aria-label="Floating label select example">
              <option selected>Open this select menu</option>

              <?php
                 
                 for ($i = 0; $i < count($resultGenderType); $i++) {
                   echo '<option value="' . $resultGenderType[$i][0] . '">' . $resultGenderType[$i][1] . '</option>';
                 };
                ?>
            </select>
            <label for="GenderType_id">Genero</label>
          </div>
        </div>

        <div class="col-4">
          <div class="form-floating">
            <select class="form-select" id="Status_id" name="Status_id" aria-label="Floating label select example">
              <option selected>Open this select menu</option>
              <?php
                for ($i = 0; $i < count($resultStatus); $i++) {
                  echo '<option value="' . $resultStatus[$i][0] . '">' . $resultStatus[$i][1] . '</option>';
                }
                ;
                ?>
            </select>
            <label for="Status_id">Estado</label>
          </div>
        </div>


        <h3>SEGURIDAD</h3>

        <div class="col-4">
          <div class="form-floating mb-1">
            <input type="email" class="form-control form-control-sm" id="User_user" name="User_user"
              placeholder="Digitar Usuario - Electrónico" required>
            <label for="User_user">Digitar Usuario - Correo Electrónico</label>
          </div>
        </div>


        <div class="col-4">
          <div class="form-floating mb-1">
            <input type="password" class="form-control form-control-sm" id="User_password" name="User_password"
              placeholder="Digitar Contraseña" required>
            <label for="User_password">Digitar Contraseña</label>
          </div>
        </div>

        <div class="col-4">
          <div class="form-floating mb-1">
            <input type="password" class="form-control form-control-sm" id="passwordRepeat" name="passwordRepeat"
              placeholder="Repetir Contraseña" required>
            <label for="passwordRepeat">Repetir Contraseña</label>
          </div>
        </div>
        <button type="submit" value="" id="btnSubmit" name="btnSubmit" class="btn btn-success">CREAR USUARIO
              </button>
      </form>
      <!--Cierre de formulario <form>-->
    </div>
    <!--Cierre de división etiqueta </div>-->

    <!---End Container Table user-->
  </div>
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
<?php
$connect->close();
?>