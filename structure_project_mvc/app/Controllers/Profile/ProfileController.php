<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:24/10/2023
 *Description:...
 */

namespace App\Controllers\Profile;

use App\Config\Controller;
use App\Models\Profile\ProfileModel;



class ProfileController extends Controller
{
  private $model;
  private $modelUserStatus;
  private $modelRole;
  private $result;
  private $routeDefautl;

  protected $primary;
  protected $primaryUser;
  public function __construct()
  {
    $this->model = new ProfileModel();
    $this->result = array();
    $this->routeDefautl = APP_URL_PUBLIC . 'profile_id/show';
    $this->primary = "profile_id";
    $this->primaryUser = "user_id";
  }
  /*Method view info */
  public function show()
  {

    if (isset($_REQUEST[$this->primaryUser])) {
      $id=$_REQUEST[$this->primaryUser];
      $data['profile'] = $this->model->showProfileAll($id);
      return $this->view("profile/profileShow", $data);
      
    } 

  }
  /*Method create info */
  public function create()
  {

  }
  /*Method edit info */
  public function edit()
  {
  
 

  }
  /*Method update info */
  public function update()
  {
   

  }
  /*Method delete info */
  public function delete()
  {

   
  }

  /*Method get modules user */
  public function userModule($id)
  {

 

  }
  /*Method get data info */

  public function getDataModel($getShares)
  {
    
  }

}
?>