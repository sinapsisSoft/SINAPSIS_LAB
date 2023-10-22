<?php
namespace App\Config;
/*
 * Author:DIEGO CASALLAS
 * DATE: 29/09/2023
 * DESCRIPTION: THIS FUNCTIONS ROUTING
 */

/* Database connection values */
define("DB_HOST", "localhost");
define("DB", "my_project");
define("DB_USER", "root");
define("DB_PASS", "");
define("DB_TYPE_CONNECT", FALSE);

/* Default options */
define("DEFAULT_CONTROLLER", "home");
define("DEFAULT_ACTION", "list");

/* Default App options */

define("APP_URL","http://localhost/SENA/structure_project_mvc/app/");
define("APP_URL_PUBLIC","http://localhost/SENA/structure_project_mvc/public/");
define("APP_NAME","MY PROJECT");



/* Default time zone options */
date_default_timezone_set("America/Bogota");

?>