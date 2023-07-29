<?php
/*-- 
#Ahutor:DIEGO CASALLAS
#Busines: 
#Date:28/07/2023
#Description:MySQL and PHP actions to close session user 
#Vesion:1.0
--*/

session_start();
$routeResut="Location: ../../view/login/";
unset($_SESSION["newsession"]);
header( $routeResut);

?>