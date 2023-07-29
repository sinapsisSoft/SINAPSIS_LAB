<?php
/*-- 
#Ahutor:DIEGO CASALLAS
#Busines: 
#Date:20/07/2023
#Description:MySQL and PHP actions to update user
#Vesion:1.0
--*/
include("../../config/config.php");

if ($_SERVER["REQUEST_METHOD"] == "GET") {
/**These variables get the data from the form*/  
  $userId = $_REQUEST['User_id'];
  $userName = $_REQUEST['User_name'];
  $userLastName = $_REQUEST['User_lastName'];
 $userDocument = $_REQUEST['User_document'];
 
  $userEmail = $_REQUEST['User_email'];
  $userCellphone = $_REQUEST['User_cellphone'];
  $userBirthdate = $_REQUEST['User_birthdate'];
  
var_dump( $userCellphone);
  $statusId = $_REQUEST['Status_id'];
  $documentTypeId = $_REQUEST['DocumentType_id'];
  $genderTypeId = $_REQUEST['GenderType_id'];

  //Prepare and bind insert mysql 
  $stmt = $connect->prepare("UPDATE user SET User_name=?,User_lastName=?,User_document=?,User_email=?,User_birthdate=?,User_cellphone=?,Status_id=?,DocumentType_id=?,GenderType_id=? WHERE User_id=?"); 
  $stmt->bind_param("ssssssiiii",$userName,$userLastName,$userDocument,$userEmail,$userBirthdate,$userCellphone,$statusId,$documentTypeId,$genderTypeId,$userId);

  $stmt->execute();
  echo "New records created successfully";
  $stmt->close();
  $connect->close();
  header('Location: ../../view/user/');

  exit;
}
