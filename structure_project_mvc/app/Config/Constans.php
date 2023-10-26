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
define("DEFAULT_CONTROLLER", "login");
define("DEFAULT_METHOD", "show");
define("DEFAULT_ACTION", "list");


/* Default App options */
define("APP_SERVER","http://localhost/SENA/");
define("APP_URL",APP_SERVER."structure_project_mvc/app/");
define("APP_URL_PUBLIC",APP_SERVER."structure_project_mvc/public/");
define("APP_NAME","MY PROJECT");

define("DEFAULT_ROUTE", APP_URL_PUBLIC.DEFAULT_CONTROLLER.'/'.DEFAULT_METHOD);

/* Default time zone options */
date_default_timezone_set("America/Bogota");

?>