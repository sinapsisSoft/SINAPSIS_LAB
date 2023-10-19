<?php


namespace App\Controllers\User;

use App\Config\Controller;
use App\Models\User\UserModel;

class UserController extends Controller
{
  protected $model;
  protected $result;
  public function __construct()
  {
    $this->model = new UserModel();
    $this->result = array();

  }
  public function show()
  {
    $data['users'] = $this->model->getUserAll();
    $data['header'] = $this->view("template/header");
    echo ("<br> READING<br> ");
    $data['title'] ="MY PROJECT";
    return $this->view("user/user", $data);

  }

  public function create()
  {
    /* $this->result['users']=$this->model->getUserAll();
     var_dump($this->result['users']);*/
    echo (" CREATE");
  }
  public function edit()
  {
    /* $this->result['users']=$this->model->getUserAll();
     var_dump($this->result['users']);*/
    echo ("EDIT");
  }
  public function update()
  {
    /* $this->result['users']=$this->model->getUserAll();
     var_dump($this->result['users']);*/
    echo ("UPDATE");
  }
  public function delete()
  {
    /* $this->result['users']=$this->model->getUserAll();
     var_dump($this->result['users']);*/
    echo (" DELETE");
  }

}
?>