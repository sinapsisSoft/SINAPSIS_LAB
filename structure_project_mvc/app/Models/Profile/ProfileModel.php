<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:23/10/2023
 *Description:...
 */

namespace App\Models\Profile;

use App\Config\Database;
use Exception;
use PDO;


class ProfileModel
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
    $this->table = "profile";
    $this->primary = "profile_id";
    $this->attributes = array("profile_id","profile_name","profile_document","document_type_id","profile_phone","profile_photo","user_id","updated_at", "create_at");
    $this->objDB = new Database();
    $this->conn = $this->objDB->getInstance();
    $this->result = null;
  }
    /*Method show profile all*/
    public function showProfileAll($id)
    {
      $sql = "CALL sp_select_profile_id(?)";
      $stmt = $this->conn->prepare($sql);
      $stmt->bindParam(1, $id);
      $stmt->execute();
      $this->result = $stmt->fetchAll(PDO::FETCH_ASSOC);
      $this->objDB->closeInstance();
      return $this->result;
    }

   


}
?>