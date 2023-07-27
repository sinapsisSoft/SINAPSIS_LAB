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
  <title>Name of My Form Change Login</title>
  <!--Etiqueta de enlace con los estilos <link>-->
  <link href="../../assets/css/style.css" rel="stylesheet" />
  <link href="../../assets/css/styleLogin.css" rel="stylesheet" />
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
    <!--Etiqueta h1 de titulo <h1>-->
    <h1>FORMULARIO DE RECUPERACIÓN DE CONTRASEÑA</h1>

    <!--Inicio de formulario - etiqueta de formulario <form>-->
    <!--Formulario form - name => permite a un script acceder a su contenido <input>-->
    <!--Formulario form - id => permite a un script o al css acceder a su contenido <form>-->
    <!--Formulario form - class => permite a una clase de css acceder a su contenido <form>-->
    <form name="formChangeLogin" id="formChangeLogin" class="formChangeLogin">
      <!--Inicio de tabla para los contenidos del formulario - etiqueta de tabla <table>-->
      <!--Etiqueta table - name => permite a un script acceder a su contenido <table>-->
      <!--Etiqueta table - id => permite a un script o al css acceder a su contenido <div>-->
      <!--Etiqueta table - class => permite a una clase de css acceder a su contenido <div>-->
      <table name="tableLogin" id="tableLogin" class="tableLogin">
        <!--Inicio de fila para de la tabla - etiqueta de fila <tr>-->
        <tr>
          <!--Inicio de columna para de la tabla - etiqueta de columna <td>-->
          <td style="text-align: center;">
            <img class="img-logo" src="../../assets/img/icons/logo.png">
          </td>
          <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->
        </tr>
        <!--Cierre de fila para de la tabla - etiqueta de fila <tr>-->
        <!--Inicio de fila para de la tabla - etiqueta de fila <tr>-->
        <tr>
          <!--Inicio de columna para de la tabla - etiqueta de columna <td>-->
          <td>
            <label>DIGITAR CORREO</label>
            <input type="email" value="" placeholder="Digitar Correo" id="email" name="email" required />
          </td>
          <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->
        </tr>
        <!--Cierre de fila para de la tabla - etiqueta de fila <tr>-->
       
<!--Inicio de fila para de la tabla - etiqueta de fila <tr>-->
  <tr>
    <!--Inicio de columna para de la tabla - etiqueta de columna <td>-->
    <td>
      <a href="#">INGRESAR</a>
    </td>
    <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->
  </tr>
  <!--Cierre de fila para de la tabla - etiqueta de fila <tr>-->
        <!--Inicio de fila para de la tabla - etiqueta de fila <tr>-->
        <tr>
          <!--Inicio de columna para de la tabla - etiqueta de columna <td>-->
          <td>
            <!--Caja de texto etiqueta input - type => tipo submit <input>-->
            <!--Caja de texto etiqueta input - value => valor de la caja de texto <input>-->
            <!--Caja de texto etiqueta input - required => indica que la caja de texto es requerida (obligatoria) <input>-->
            <!--Caja de texto etiqueta input - name => permite a un script acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - id => permite a un script o al css acceder a su contenido <input>-->
            <!--Caja de texto etiqueta input - class => permite a una clase de css acceder a su contenido <input>-->
            <input type="submit" value="SOLICITAR CAMBIO DE CONTRASEÑA" id="btnGetInto" name="btnGetInto" class="btnGetInto" required />

          </td>
          <!--Cierre de columna para de la tabla - etiqueta de columna <td>-->
        </tr>
        <!--Cierre de fila para de la tabla - etiqueta de fila <tr>-->
      </table>
      <!--Cierre de tabla para los contenidos del formulario - etiqueta de tabla <table>-->
    </form>
    <!--Cierre de formulario <form>-->
  </div>
  <!--Cierre de división etiqueta </div>-->

  <!--*****************************************************************************************************************-->


  <!--Etiqueta de enlace con la logíca de javascript <script>-->
  <script src="../../assets/js/main.js" type="javascript"></script>

</body>

</html>