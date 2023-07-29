<!--<!DOCTYPE html> En primer lugar necesitamos indicar el tipo de documento que estamos creando. Esto en HTML5 es extremadamente sencillo: -->
<!DOCTYPE html>
<!--Luego de declarar el tipo de documento, debemos comenzar a construir la estructura HTML-->
<html lang="en">
<!--El elemento <head> va primero, por supuesto, y al igual que el resto de los elementos estructurales  tiene una etiqueta de apertura y una de cierre-->

<head>
  <!--Ésta es una etiqueta <meta> que especifica cómo el texto será presentado en pantalla-->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Name of My Form Change Login</title>
  <!--Etiqueta de enlace con los estilos <link>-->
  <!--Inclución del archivo php con los estilos bootstrap-->
  <?php
    include('../assets/css.php');
  ?>
</head>
<!--El cuerpo representa la parte visible de todo documento y es especificado entre etiquetas <body>-->

<body>
  <!--Container-->
  <div class="container">
    <!-- Content here responsive -->
    <div class="row">
      <!-- Content  responsive -->
      <div class="col-6 col-xs-6 col-md-6 col-xl-6 col-xxl-6">


      </div>
    </div>

  </div>

  <!--Inclución del archivo php con los javascript de bootstrap -->

  <?php
    include('../assets/js.php');
  ?>
</body>

</html>