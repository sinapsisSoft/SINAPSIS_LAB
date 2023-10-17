<?php

namespace App\Models\User;

use App\Config\Database as DB;

class UserModel
{

  protected $table;
  protected $primary;

  protected $attributes;

  protected $conn;

  protected $result;

  public function __construct()
  {
    $this->table = "user";
    $this->primary = "User_id";
    $this->attributes = array("User_passwor", "User_user", "Role_id", "UserStatus_id");
    $objDB = new DB();
    $this->conn=$objDB->getConnectPDO();

  }

  public function getUserAll()
  {
    $sql = "sp_select_user_all()";
    $result = $this->conn->query($sql);
    return $result;

  }

}
?>