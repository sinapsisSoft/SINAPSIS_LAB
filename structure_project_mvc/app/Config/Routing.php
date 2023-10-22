<?php

/*
 * Author:DIEGO CASALLAS
 * DATE: 29/09/2023
 * DESCRIPTION: THIS FUNCTIONS ROUTING
 */
namespace App\Config;

use App\Controllers\User\UserController;
use App\Controllers\Home\HomeController;
use App\Controllers\Login\LoginController;
use Exception;

class Routing
{

  private $_folder;
  private $_defaultController;
  private $_defaultFolder;
  private $_defaultMethod;
  private $serverUri;
  private $url;
  private $_controller;
  private $_method;
  private $_attributes;

  public function __construct()
  {
    $this->_folder = "public/";
    $this->_defaultController = "home";
    $this->_defaultFolder = "Home";
    $this->_defaultMethod = "show";
    $this->serverUri = $_SERVER['REQUEST_URI'];

    $this->url = explode("/", substr($this->serverUri, strpos($this->serverUri, $this->_folder), strlen($this->serverUri)));

    $this->matchRoute();
  }

  public function matchRoute()
  {

    if (isset($this->url[1]) && isset($this->url[2])) {
      $_folderController = ucwords($this->url[1]);
      $this->_controller = ucwords($this->url[1] . "Controller");
      $this->_attributes = explode("?", $this->url[2]);
      $this->_method = $this->_attributes[0];

      if (isset($this->_attributes[1])) {
        $this->_attributes = $this->_attributes[1];
      } else {
        $this->_attributes = "";
      }
    } else {
      $_folderController = $this->_defaultFolder;
      $this->_controller = ucwords($_folderController . "Controller");
      $this->_method = $this->_defaultMethod;
      $this->_attributes = "";
    }
    /*var_dump( $this->_controller );
    echo("<br>");
    var_dump( $this->_method );
    echo("<br>");
    var_dump( $this->_attributes );*/


  }

  public function run()
  {
    try {

      switch ($this->_controller) {

        case "UserController":
          $controller = new UserController();
          break;
        default:
          $controller = new HomeController();
          break;
        case "HomeController":
          $controller = new HomeController();
          break;
        case "LoginController":
          $controller = new LoginController();
          break;

      }
      switch ($this->_method) {

        case "show":
          $controller->show();
          break;
        case "create":
          $controller->create();
          break;
        case "update":
          $controller->update();
          break;
        case "edit":
          $controller->edit();
          break;
        case "delete":
          $controller->delete();
          break;
        case "login":
          $controller->login();
          break;

      }


    } catch (Exception $e) {
      echo ($e->getMessage());

    }
  }



}



?>