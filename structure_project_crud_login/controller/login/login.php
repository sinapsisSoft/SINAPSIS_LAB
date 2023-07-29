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


  $UserUser = $_REQUEST['User_user'];
  $UserPassword = $_REQUEST['User_password'];

  $sql = "CALL sp_select_user_email('" . $UserUser . "'); ";
  $routeResut="Location: ../../view/home/";
  if ($result = $connect->query($sql)) {
    $resultQuery = $result->fetch_all(MYSQLI_NUM);

    if (count($resultQuery)>0) {
      echo( $UserPassword);
      if (password_verify($UserPassword, $resultQuery[0][0])) {
        session_start();
        $_SESSION["newsession"]= $resultQuery[0][1];
        echo ("</br>Ok: Login succeeds");
        $routeResut="Location: ../../view/home/";
        
      } else {
        echo ("</br>Error: Password and User");
        $routeResut="Location: ../../view/login/";
      }

    } else {
      echo ("</br>Error: User name does not exist");
      $routeResut="Location: ../../view/login/";
    }

  }

  header( $routeResut);
  $connect->close();
}
?>