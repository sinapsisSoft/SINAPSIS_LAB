<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:13/08/2023
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
    $this->attributes = array("profile_id","profile_name","profile_document","document_type_id","profile_phone","user_id","updated_at", "create_at");
    $this->objDB = new Database();
    $this->conn = $this->objDB->getInstance();
    $this->result = null;
  }

   

  
 


}
?>