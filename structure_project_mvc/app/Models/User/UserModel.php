<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:13/08/2023
 *Description:...
 */

namespace App\Models\User;

use App\Config\Database;


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
    $objDB = new Database();
    $this->conn=$objDB->getConnectPDO();

  }

  public function getUserAll()
  {
    $sql = "CALL sp_select_user_all();";

    $this->result = $this->conn->prepare($sql);
    $this->result->execute();
    $row =  $this->result->fetch();
    return $row;

  }

}
?>