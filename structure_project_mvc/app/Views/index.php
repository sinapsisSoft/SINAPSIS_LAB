<?php

/*
 * Author:DIEGO CASALLAS
 * DATE: 29/09/2023
 * DESCRIPTION: THIS VIEW GENERAL
*/

if(isset($_SERVER['HTTPS']) && $_SERVER['HTTPS']==='on')
$url="https://";
else
$url="http://";
  // Append the host(domain name, ip) to the URL.   
  $url.= $_SERVER['HTTP_HOST'];   
    
  // Append the requested resource location to the URL   
  $url.= $_SERVER['REQUEST_URI'];    
    
  echo $url;  
?>