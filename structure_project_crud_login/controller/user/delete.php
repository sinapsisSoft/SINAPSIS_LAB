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
  $userId = $_REQUEST['User_id'];
  $deleteId=$_REQUEST['Delete_id'];
  if($deleteId==0){
    $statusId = 2;
    //Prepare and bind insert mysql 
    $stmt = $connect->prepare("UPDATE user SET Status_id=? WHERE User_id=?"); 
    $stmt->bind_param("ii",$statusId,$userId);
  }else{
   
  //Prepare and bind insert mysql 
  $stmt = $connect->prepare("DELETE FROM user WHERE User_id=?"); 
  $stmt->bind_param("i",$userId);
  }
  

  $stmt->execute();
  echo "New records created successfully";
  $stmt->close();
  $connect->close();
  header('Location: ../../view/user/view.php');
  exit;


  
}
