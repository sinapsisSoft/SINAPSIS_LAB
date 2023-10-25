<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:13/08/2023
 *Description:...
 */

namespace App\Config;

use \PDO;
use \PDOException;
use \mysqli;
use \Exception;
use App\Config\App;


class Database extends App
{
	private $host;
	private $nameDB;
	private $user;
	private $pass;
	private $conection;
	private $dsn;

	public function __construct()
	{
		$this->host = DB_HOST;
		$this->nameDB = DB;
		$this->user = DB_USER;
		$this->pass = DB_PASS;
		$this->conection = null;
		$this->dsn = "";
	}
	public function getInstance()
	{
		try {
			if ($this->conection == null) {
				if (DB_TYPE_CONNECT) {
					$this->conection = new mysqli($this->host, $this->user, $this->pass, $this->nameDB);
					if ($this->conection->connect_errno != null) {
						echo "Error $this->conection->connect_errno";
						exit();
					} else {
						echo "Connected MYSQLI....";
					}
				} else {
					$this->dsn = "mysql:host=$this->host;dbname=$this->nameDB;charset=UTF8";
					$this->conection = new PDO($this->dsn, $this->user, $this->pass);
					if ($this->conection) {
						echo "Connected PDO....";
					} else {
						echo "Error";
					}
				}
			} else {
				return $this->conection;
			}
		} catch (Exception $e) {
			echo $e->getMessage();
			exit();
		} catch (PDOException $e) {
			echo $e->getMessage();
			exit();
		}
		return $this->conection;
	}


	public function closeInstance()
	{
		try {
			if (DB_TYPE_CONNECT) {
				$this->conection->close();
			} else {
				$this->conection = null;
			}
		} catch (Exception $e) {
			echo $e->getMessage();
			exit();
		}
	}
}

?>