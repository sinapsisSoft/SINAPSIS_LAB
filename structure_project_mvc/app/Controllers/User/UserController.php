<?php


namespace App\Controllers\User;

use App\Models\User\UserModel AS Model;
class UserController
{
  protected $model;
  protected $result;
  public function __construct()
  {
    $this->model= new Model();
    //$this->result=array();
  
  }
  public function show()
  {
    $this->result['users']=$this->model->getUserAll();
   
  }
}
?>