<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:27/10/2023
 *Description:...
 */

namespace App\Controllers\Report;

use App\Config\Controller;

class ReportController extends Controller
{


  public function __construct()
  {
    

  }
  
  public function show()
  {
    
      
      return $this->view("report/report");
    
  }

  
}
?>


