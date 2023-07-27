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
$clientId = $_REQUEST['Client_id'];
$clientName = $_REQUEST['Client_name'];
$clientIdentification = $_REQUEST['Client_identification'];
$clientEmail = $_REQUEST['Client_email'];
$clientPhone = $_REQUEST['Client_phone'];
$clientAddress = $_REQUEST['Client_address'];


$statusId = $_REQUEST['Status_id'];
$documentTypeId = $_REQUEST['DocumentType_id'];

  //Prepare and bind insert mysql 
  $stmt = $connect->prepare("UPDATE client SET Client_name=?,Client_identification=?,Client_email=?,Client_phone=?,Client_address=?,Status_id=?,DocumentType_id=? WHERE Client_id=?"); 
  $stmt->bind_param("sssssiii",$clientName,$clientIdentification,$clientEmail,$clientPhone,$clientAddress,$statusId,$documentTypeId,$clientId);


  $stmt->execute();
  echo "New records created successfully";
  $stmt->close();
  $connect->close();
  header('Location: ../../view/client/view.php');

  exit;
}
