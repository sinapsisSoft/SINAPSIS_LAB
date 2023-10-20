<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:13/08/2023
 *Description:...
 */

namespace App\Config;

class Controller
{
  public function view($view, ?array $data = []): mixed
  {
    $newView = require_once("../app/Views/" . $view . ".php");
    return $newView;
  }
}
?>