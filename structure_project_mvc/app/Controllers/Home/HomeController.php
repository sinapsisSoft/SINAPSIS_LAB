<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:23/10/2023
 *Description:...
 */

namespace App\Controllers\Home;

use App\Models\User\UserModel;
use App\Config\Controller;

class HomeController extends Controller
{

  private $model;

  private $result;
  private $routeDefautl;

  protected $primary;
  public function __construct()
  {
    $this->model = new UserModel();
    $this->result = array();
    $this->routeDefautl = APP_URL_PUBLIC . 'home/show';
    $this->primary = "user_id";

  }
  
  public function show()
  {
    
      
      return $this->view("home/home");
    
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
}
?>


