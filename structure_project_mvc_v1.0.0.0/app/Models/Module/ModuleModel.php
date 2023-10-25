<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:13/08/2023
 *Description:...
 */

namespace App\Models\Module;

use App\Config\Database;
use Exception;
use PDO;


class ModuleModel
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
    
    $this->table = "module";
    $this->primary = "module_id";
    $this->attributes = array("module_id","module_name","module_route","updated_at", "create_at");
    $this->objDB = new Database();
    $this->conn = $this->objDB->getInstance();
    $this->result = null;

  }

  
 


}
?>