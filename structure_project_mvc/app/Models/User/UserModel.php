<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:13/08/2023
 *Description:...
 */

namespace App\Models\User;

use App\Config\Database;
use Exception;
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

  public function __construct()
  {
    $this->table = "user";
    $this->primary = "user_id";
    $this->attributes = array("user_id", "user_user", "user_password", "role_id", "user_status_id", "updated_at", "create_at");
    $this->objDB = new Database();
    $this->conn = $this->objDB->getInstance();
    $this->result = null;

  }

  public function showUserAll()
  {
    $sql = "CALL sp_select_user_all()";
    $stmt = $this->conn->prepare($sql);
    $stmt->execute();
    $this->result = $stmt->fetchAll(PDO::FETCH_DEFAULT);
    $this->objDB->closeInstance();
    return $this->result;
  }
  public function showUserId($id)
  {
    $sql = "CALL sp_select_user_id(?)";
    $stmt = $this->conn->prepare($sql);
    $stmt->bindParam(1, $id);
    $stmt->execute();
    $this->result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $this->objDB->closeInstance();
    return $this->result;
  }
  public function showUserUser($user){

    $sql = "CALL sp_select_user_user(?)";
    $stmt = $this->conn->prepare($sql);
    $stmt->bindParam(1, $user);
    $stmt->execute();
    $this->result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $this->objDB->closeInstance();
    return $this->result;
  }
 
  public function createUser(array $dataUser)
  {
    try {
      $sql = "CALL sp_insert_user(?,?,?,?)";
      $stmt = $this->conn->prepare($sql);
      $stmt->bindParam(1, $dataUser[$this->attributes[1]]);
      $stmt->bindParam(2, $dataUser[$this->attributes[2]]);
      $stmt->bindParam(3, $dataUser[$this->attributes[3]]);
      $stmt->bindParam(4, $dataUser[$this->attributes[4]]);
      $stmt->execute();
      $this->objDB->closeInstance();
      $this->result = true;
    } catch (Exception $e) {
      //echo $e->getMessage();
      $this->result = false;
    }

    return $this->result;

  }
  public function updateUser(array $dataUser)
  {
    try {
      $sql = "CALL sp_update_user(?,?,?,?)";
      $stmt = $this->conn->prepare($sql);
      $stmt->bindParam(1, $dataUser[$this->attributes[0]]);
      $stmt->bindParam(2, $dataUser[$this->attributes[1]]);
      $stmt->bindParam(3, $dataUser[$this->attributes[3]]);
      $stmt->bindParam(4, $dataUser[$this->attributes[4]]);
      $stmt->execute();
      $this->objDB->closeInstance();
      $this->result = true;
    } catch (Exception $e) {
      //echo $e->getMessage();
      $this->result = false;
    }

    return $this->result;

  }

  public function deleteUser($id)
  {
    try {
      $sql = "CALL sp_delete_user(?)";
      $stmt = $this->conn->prepare($sql);
      $stmt->bindParam(1, $id);
      $stmt->execute();
      $this->result = $stmt->fetchAll(PDO::FETCH_ASSOC);
      $this->objDB->closeInstance();
      $this->result = true;
    } catch (Exception $e) {
      //echo $e->getMessage();
      $this->result = false;
    }

    return $this->result;


  }


}
?>