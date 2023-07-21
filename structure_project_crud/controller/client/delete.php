<?php
/*-- 
#Ahutor:DIEGO CASALLAS
#Busines: 
#Date:20/07/2023
#Description:MySQL and PHP actions to delete user
#Vesion:1.0
--*/
include("../../config/config.php");

if ($_SERVER["REQUEST_METHOD"] == "GET") {
/**These variables get the data from the form*/  
  $clientId  = $_REQUEST['Client_id'];
  $deleteId=$_REQUEST['Delete_id'];
  if($deleteId==0){
    $statusId = 2;
    //Prepare and bind insert mysql 
    $stmt = $connect->prepare("UPDATE client SET Status_id=? WHERE Client_id=?"); 
    $stmt->bind_param("ii",$statusId,$clientId);
  }else{
   
  //Prepare and bind insert mysql 
  $stmt = $connect->prepare("DELETE FROM client WHERE Client_id=?"); 
  $stmt->bind_param("i",$clientId);
  }
  

  $stmt->execute();
  echo "New records created successfully";
  $stmt->close();
  $connect->close();
  header('Location: ../../view/client/view.php');
  exit;


  
}
