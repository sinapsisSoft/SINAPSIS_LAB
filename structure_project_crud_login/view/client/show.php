<?php
include("../../config/config.php");

if ($_SERVER["REQUEST_METHOD"] == "GET") {
  $userId = $_REQUEST['Client_id'];
  $sql = "CALL sp_select_client_id(" . $userId . "); ";
  $sql .= "SELECT * FROM `document_type` WHERE 1;";
  $sql .= "SELECT * FROM `status` WHERE 1;";
  $sql .= "SELECT * FROM `country` WHERE 1;";
  $sql .= "SELECT * FROM `company` WHERE 1;";
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
  $resultClient = $resultArray[0];
  $resultDocumentType = $resultArray[1];
  $resultStatus = $resultArray[2];
  $resultCountry = $resultArray[3];
  $resultCompany = $resultArray[4];
}
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
    <h2>REGISTRAR CLIENTES</h2>

    <!--Inicio de formulario - etiqueta de formulario <form>-->
    <!--Formulario form - name => permite a un script acceder a su contenido <input>-->
    <!--Formulario form - id => permite a un script o al css acceder a su contenido <form>-->
    <!--Formulario form - class => permite a una clase de css acceder a su contenido <form>-->
    <form name="formUser" method="GET" action="../../controller/client/insert.php" id="formUser" class="formUser">
      <!--Inicio de tabla para los contenidos del formulario - etiqueta de tabla <table>-->
      <!--Etiqueta table - name => permite a un script acceder a su contenido <table>-->
      <!--Etiqueta table - id => permite a un script o al css acceder a su contenido <div>-->
      <!--Etiqueta table - class => permite a una clase de css acceder a su contenido <div>-->
      <!--Caja de texto etiqueta input - name => permite a un script acceder a su contenido <input>-->
      <!--Caja de texto etiqueta input - id => permite a un script o al css acceder a su contenido <input>-->
      <!--Caja de texto etiqueta input - class => permite a una clase de css acceder a su contenido <input>-->
      <!--Caja de texto etiqueta input - type => hidden campo oculto en el html<input>-->
      <input type="hidden" value="<?= $resultClient[0][0] ?>" id="Client_id" name="Client_id " />
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
            <input type="text" value="<?= $resultClient[0][1] ?>" placeholder="Digitar Nombre" id="Client_name" name="Client_name" required disabled />
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
            <input type="number" value="<?= $resultClient[0][2] ?>" placeholder="Digitar Documento" id="Client_identification" name="Client_identification" required disabled />

          </td>
          <td>
            <!--Caja de texto etiqueta input - type => tipo email <input>-->
            <!--Caja de texto etiqueta input - value => valor de la caja de texto <input>-->
            <!--Caja de texto etiqueta input - placeholder => Texto de referencia en el campo de texto <input>-->
            <!--Caja de texto etiqueta input - required => indica que la caja de texto es requerida (obligatoria) <input>-->
            <!--Caja de texto etiqueta input - name => permite a un script acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - id => permite a un script o al css acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - class => permite a una clase de css acceder a su contenido <input>-->
            <input type="email" value="<?= $resultClient[0][3] ?>" placeholder="Digitar Correo Electrónico" id="Client_email" name="Client_email" required disabled />
          </td>
          <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->
        </tr>
        <!--Cierre de fila para de la tabla - etiqueta de fila <tr>-->

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
            <input type="number" value="<?= $resultClient[0][4] ?>" placeholder="Digitar Número de Celular" id="Client_phone" name="Client_phone" required disabled />

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
            <input type="text" value="<?= $resultClient[0][5] ?>" placeholder="Dirección " id="Client_address" name="Client_address" required disabled />
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
            <select name="Status_id" id="Status_id" required disabled>
              <!--Inicio de etiqueta de opciones de lista <option>-->
              <!--Valor de la opción - value => valor de la opción <option>-->
              <?php
              for ($i = 0; $i < count($resultStatus); $i++) {

                if ($resultClient[0][7] == $resultStatus[$i][0]) {
                  echo '<option value="' . $resultStatus[$i][0] . '" selected="selected">' . $resultStatus[$i][1] . '</option>';
                } else {
                  echo '<option value="' . $resultStatus[$i][0] . '">' . $resultStatus[$i][1] . '</option>';
                }
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
          <td>
            <!--La etiqueta select (<select>) de HTML representa un control que muestra un menú de opciones-->
            <!--Inicio de la lista <select>-->
            <!--lista de selección select - required => indica que la caja de texto es requerida (obligatoria) <select>-->
            <!--lista de selección select - name => permite a un script acceder a su contenido <select>-->
            <!--lista de selección select - id => permite a un script o al css acceder a su contenido <select>-->
            <!--lista de selección select - class => permite a una clase de css acceder a su contenido <select>-->
            <select name="DocumentType_id" id="DocumentType_id" required disabled>
              <!--Inicio de etiqueta de opciones de lista <option>-->
              <!--Valor de la opción - value => valor de la opción <option>-->
              <?php
              for ($i = 0; $i < count($resultDocumentType); $i++) {

                if ($resultClient[0][6] == $resultDocumentType[$i][0]) {
                  echo '<option value="' . $resultDocumentType[$i][0] . '" selected="selected">' . $resultDocumentType[$i][1] . '</option>';
                } else {
                  echo '<option value="' . $resultDocumentType[$i][0] . '">' . $resultDocumentType[$i][1] . '</option>';
                }
              };
              ?>
            </select>
            <!--Cierre de la lista <select>-->
          </td>
          <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->
          <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->
          <!--Inicio de columna para de la tabla - etiqueta de columna <td>-->
          <td>
            <!--La etiqueta select (<select>) de HTML representa un control que muestra un menú de opciones-->
            <!--Inicio de la lista <select>-->
            <!--lista de selección select - required => indica que la caja de texto es requerida (obligatoria) <select>-->
            <!--lista de selección select - name => permite a un script acceder a su contenido <select>-->
            <!--lista de selección select - id => permite a un script o al css acceder a su contenido <select>-->
            <!--lista de selección select - class => permite a una clase de css acceder a su contenido <select>-->
            <select name="Comp_id" id="Comp_id" required disabled>
              <!--Inicio de etiqueta de opciones de lista <option>-->
              <!--Valor de la opción - value => valor de la opción <option>-->
              <?php
              for ($i = 0; $i < count($resultCompany); $i++) {

                if ($resultClient[0][8] == $resultCompany[$i][0]) {
                  echo '<option value="' . $resultCompany[$i][0] . '" selected="selected">' . $resultCompany[$i][1] . '</option>';
                } else {
                  echo '<option value="' . $resultCompany[$i][0] . '">' . $resultCompany[$i][1] . '</option>';
                }
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
            <select name="Country_id" id="Country_id" required disabled>
              <!--Inicio de etiqueta de opciones de lista <option>-->
              <!--Valor de la opción - value => valor de la opción <option>-->
              <?php
              for ($i = 0; $i < count($resultCountry); $i++) {

                if ($resultClient[0][9] == $resultCountry[$i][0]) {
                  echo '<option value="' . $resultCountry[$i][0] . '" selected="selected">' . $resultCountry[$i][1] . '</option>';
                } else {
                  echo '<option value="' . $resultCountry[$i][0] . '">' . $resultCountry[$i][1] . '</option>';
                }
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


          </td>
          <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->
        </tr>

      </table>
      <!--Cierre de tabla para los contenidos del formulario - etiqueta de tabla <table>-->



    </form>
    <!--Cierre de formulario <form>-->
  </div>
  <!--Cierre de división etiqueta </div>-->

  <!--Etiqueta de enlace con la logíca de javascript <script>-->
  <script src="../assets/js/main.js" type="javascript"></script>
</body>

</html>
<?php
$connect->close();
?>