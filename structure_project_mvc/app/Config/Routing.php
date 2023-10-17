<?php

/*
 * Author:DIEGO CASALLAS
 * DATE: 29/09/2023
 * DESCRIPTION: THIS FUNCTIONS ROUTING
 */
namespace App\Config;

$folder = "public";
$_defaultController = "home";
$_defaultFolder = "home";
$_defaultMetho = "show";
$serverUri = $_SERVER['REQUEST_URI'];
$url = explode("/", strrchr($serverUri, $folder));

if (isset($url[1]) && isset($url[2])) {
  $_folderController = $url[1];
  $_controller = ucwords($_folderController . "Controller");
  $_getMethoAttributes = explode("?", $url[2]);
  $_method = $_getMethoAttributes[0];
  if (isset($_getMethoAttributes[1])) {
    $_attributes = $_getMethoAttributes[1];
  } else {
    $_attributes = "";
  }
} else {
  $_folderController = $_defaultFolder;
  $_controller = ucwords($_folderController . "Controller");
  $_method = $_defaultMetho;
}
 //require_once("../app/controller/".$_folderController."/".$_controller.".php");
  //$_objCOntroller= New $_controller();
  //$_objCOntroller->$_method();
  echo("Diego");
?>