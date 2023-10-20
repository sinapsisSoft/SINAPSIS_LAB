<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:13/08/2023
 *Description:...
 */

namespace App\Models\User;

use App\Config\Database;
use PDO;


class UserModel
{

  protected $table;
  protected $primary;

  protected $attributes;

  protected $conn;

  protected $result;
  protected $typeConn;

  protected $objDB;

  public function __construct($type)
  {
    $this->table = "user";
    $this->primary = "User_id";
    $this->attributes = array("User_passwor", "User_user", "Role_id", "UserStatus_id");
    $this->objDB = new Database();
    $this->typeConn = $type;
    if ($this->typeConn) {
      $this->conn = $this->objDB->getConnectPDO();
    } else {
      $this->conn = $this->objDB->getConnectMYSQLI();
    }



  }

  public function getUserAll()
  {
    $sql = "CALL sp_select_user_all()";
    if ($this->typeConn) {
      $prepare_sql = $this->conn->prepare($sql);
      $prepare_sql->execute();
      $this->result = $prepare_sql->fetch(PDO::FETCH_DEFAULT);
    

      $this->objDB->connectPDOClose();
    } else {
 
      
      $prepare_sql = $this->conn->query($sql);
      $this->result = $prepare_sql->fetch_all(MYSQLI_NUM);
 
      $prepare_sql->free();
      $this->objDB->connectMysqliClose();
    }
    return $this->result;
  }


}
?>