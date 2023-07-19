<?php
/*-- 
#Ahutor:DIEGO CASALLAS
#Busines: 
#Date:19/07/2023
#Description:MySQL and PHP actions to insert users
#Vesion:1.0
--*/
include("../../config/config.php");

if ($_SERVER["REQUEST_METHOD"] == "GET") {
/**These variables get the data from the form*/  
  $userName = $_REQUEST['User_name'];
  $userLastName = $_REQUEST['User_lastName'];
  $userDocument = $_REQUEST['User_document'];
  $userEmail = $_REQUEST['User_email'];
  $userCellphone = $_REQUEST['User_cellphone'];

  $userUser = $_REQUEST['User_user'];
  $userPassword =password_hash($_REQUEST['User_password'], PASSWORD_DEFAULT) ;

  $statusId = $_REQUEST['Status_id'];
  $documentTypeId = $_REQUEST['DocumentType_id'];
  $genderTypeId = $_REQUEST['GenderType_id'];

  //Prepare and bind insert mysql 
  $stmt = $connect->prepare("INSERT INTO user 
  (User_name, 
  User_lastName, 
  User_document,
  User_email,
  User_cellphone,
  User_user,
  User_password,
  Status_id,
  DocumentType_id,
  GenderType_id) VALUES 
  (?,?,?,?,?,?,?,?,?,?)");
  $stmt->bind_param("ssssissiii",$userName,$userLastName,$userDocument,$userEmail,$userCellphone,$userUser,$userPassword,$statusId,$documentTypeId,$genderTypeId);

  $stmt->execute();
  echo "New records created successfully";
  $stmt->close();
  $connect->close();
}
