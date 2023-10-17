<?php

  spl_autoload_register(function($class){

    $file=__DIR__."/".$class."php";
    $file=str_replace(" \\","/",$file);

    if(is_file($file)){
      require_once $file;
    }

  });

?>