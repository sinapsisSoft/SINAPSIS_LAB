<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:22/10/2023
 *Description:...
 */

namespace App\Controllers\Login;

use App\Models\User\UserModel;
use App\Config\Controller;

class LoginController extends Controller
{

  private $model;

  private $result;
  private $routeDefautl;

  protected $primary;
  public function __construct()
  {
    $this->model = new UserModel();
    $this->result = array();
    $this->routeDefautl = APP_URL_PUBLIC . 'login/show';
    $this->primary = "user_id";

  }

  public function show()
  {


    return $this->view("login/login");

  }
  public function login()
  {
    $this->routeDefautl = APP_URL_PUBLIC . 'home/show';
    if ($_SERVER['REQUEST_METHOD'] == "POST") {
      $modelUser = $this->getDataModel(null);
      $userPassword = $modelUser['user_password'];
      $userEmail = $modelUser['user_user'];
      $this->result = $this->model->showUserUser($userEmail);

      if (count($this->result) > 0) {
        if (password_verify($userPassword, $this->result[0]["user_password"])) {
          session_start();
          $_SESSION["newsession"] = $this->result[0]["user_id"];
          header("Location: " . $this->routeDefautl);

        } else {

          $data['message'] = "Invalid password";
          return $this->view("login/login", $data);
        }

      } else {
        $data['message'] = "User does not exist error";
        return $this->view("login/login", $data);
      }
    } else {

    }

    return $this->result;
  }
  /*Method get data info */

  public function getDataModel($getShares)
  {
    $data = [
      'user_user' => $_REQUEST['user_user'],
      'user_password' => $_REQUEST['user_password']
    ];
    return $data;
  }
 /*Method  signOff*/
  public function signOff()
  {
    session_start();
    unset($_SESSION["newsession"]);
    header("Location: " . $this->routeDefautl);
  }
}
?>