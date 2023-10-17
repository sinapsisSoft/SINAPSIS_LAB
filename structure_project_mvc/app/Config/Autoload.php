<?php
namespace Config;
class Autoload{
  public static function run(){

    spl_autoload_register(function($class_Name){
 
      $rute=str_replace("\\","/",$class_Name).".php";
      require_once($rute);
    });

    
  }


}
?>