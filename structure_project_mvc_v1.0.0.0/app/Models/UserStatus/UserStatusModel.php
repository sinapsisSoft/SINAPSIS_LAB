<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:13/08/2023
 *Description:...
 */

namespace App\Models\UserStatus;

use App\Config\Database;
use Exception;
use PDO;


class UserStatusModel
{

  protected $table;
  protected $primary;

  protected $attributes;

  protected $conn;

  protected $result;
  protected $typeConn;

  protected $objDB;

  public function __construct()
  {
    $this->table = "user_status";
    $this->primary = "user_status_id";
    $this->attributes = array("user_status_name", "updated_at", "create_at");
    $this->objDB = new Database();
    $this->conn = $this->objDB->getInstance();
    $this->result = null;

  }

  public function showUserStatusAll()
  {
    $sql = "CALL sp_select_user_status_all()";
    $stmt = $this->conn->prepare($sql);
    $stmt->execute();
    $this->result = $stmt->fetchAll(PDO::FETCH_DEFAULT);
    $this->objDB->closeInstance();
    return $this->result;
  }
 


}
?>