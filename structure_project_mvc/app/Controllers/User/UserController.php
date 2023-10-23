<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:13/10/2023
 *Description:...
 */

namespace App\Controllers\User;

use App\Config\Controller;
use App\Models\Role\RoleModel;
use App\Models\User\UserModel;
use App\Models\UserStatus\UserStatusModel;


class UserController extends Controller
{
  private $model;
  private $modelUserStatus;
  private $modelRole;
  private $result;
  private $routeDefautl;

  protected $primary;
  public function __construct()
  {
    $this->model = new UserModel();
    $this->result = array();
    $this->routeDefautl = APP_URL_PUBLIC . 'user/show';
    $this->primary = "user_id";

  }
  /*Method view info */
  public function show()
  {
    $this->modelUserStatus = new UserStatusModel();
    $this->modelRole = new RoleModel();
    $data['userStatus'] = $this->modelUserStatus->showUserStatusAll();
    $data['roles'] = $this->modelRole->showRoleAll();
    if (!isset($_REQUEST[$this->primary])) {
    $data['users'] = $this->model->showUserAll();
    return $this->view("user/user", $data);}
    else{
      $getId = $_REQUEST[$this->primary];
      $data['user'] = $this->model->showUserId($getId);
      return $this->view("user/userShow", $data);
    }

  }
  /*Method create info */
  public function create()
  {

    if ($this->model->createUser($this->getDataModel(null))) {
      header("Location: " . $this->routeDefautl);
    }
  }
  /*Method edit info */
  public function edit()
  {
    $this->modelUserStatus = new UserStatusModel();
    $this->modelRole = new RoleModel();
    if ($_SERVER["REQUEST_METHOD"] == "GET") {
      if (isset($_REQUEST[$this->primary])) {
        $getId = $_REQUEST[$this->primary];
        $data['user'] = $this->model->showUserId($getId);
        $data['roles'] = $this->modelRole->showRoleAll();
        $data['userStatus'] = $this->modelUserStatus->showUserStatusAll();
      }
     
      return $this->view("user/userEdit", $data);
    }

  }
  /*Method update info */
  public function update()
  { 
    $getId = $_REQUEST[$this->primary];
    if ($this->model->updateUser($this->getDataModel($getId))) {
      header("Location: " . $this->routeDefautl);
    }

  }
  /*Method delete info */
  public function delete()
  {
   
    $getId = $_REQUEST[$this->primary];
    if ($this->model->deleteUser($getId)) {
      header("Location: " . $this->routeDefautl);
    }
  }

    /*Method get modules user */
    public function userModule()
    {
      
      $data['module'] = $this->model->modelUser(1);

      var_dump($data['module'][1]['module_name']);
     
    }
  /*Method get data info */

  public function getDataModel($getShares)
  {
    $data = [
      'user_id' => $getShares,
      'user_user' => $_REQUEST['user_user'],
      'user_password' => password_hash($_REQUEST['user_password'], PASSWORD_DEFAULT),
      'role_id' => $_REQUEST['role_id'],
      'user_status_id' => $_REQUEST['user_status_id'],
    ];
    return $data;
  }

}
?>