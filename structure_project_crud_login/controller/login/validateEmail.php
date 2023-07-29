<?php
/*-- 
#Ahutor:DIEGO CASALLAS
#Busines: 
#Date:27/07/2023
#Description:MySQL and PHP actions to select user email
#Vesion:1.0
--*/
include("../../config/config.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {


  $userEmail = $_REQUEST['userEmail'];

  $sql = "CALL sp_select_user_email('" . $userEmail . "'); ";

  if (!$result = $connect->query($sql)) {
    echo "Error consult: (" . $connect->errno . ") " . $connect->error;
  } else {
    $resultUser = $result->fetch_all(MYSQLI_NUM);
  }
  echo ("<br>");


  if ($resultUser[0][0] == "0") {
    echo ("Error: Usuario no existe");
  } else {
    $email="test@sinapsissoft.com";
    $form="info@sinapsist.com.co";
    $subject="Password recovery";
    $message="This message";
    $body="<html><head><title>Test Email</title></head><body><h1>$message</h1></body></html>";

    $headers =  'MIME-Version: 1.0' . "\r\n";
    $headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";
    $headers .= 'Form:'.$email."\r\n";
    $headers .= "Return-path:$form\r\n";

   
    if (mail($form, $subject, $body, $headers)) {
      echo ("Ok: Correo enviado");
    } else {
      $errorMessage = error_get_last();
      echo ("Error: Correo no enviado".$errorMessage);
    }
  }


}
?>