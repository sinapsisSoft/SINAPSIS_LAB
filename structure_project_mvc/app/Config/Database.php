<?php
namespace App\Config;
use App\Config;
use Exception;
use mysqli;
use PDO;
use PDOException;



class Database
{

	protected $host;
	protected $nameDB;
	protected $user;
	protected $pass;
	protected $conection;
	protected $dsn;

	public function __construct()
	{

		$this->host = "localhost";
		$this->nameDB = "project_general";
		$this->user = "root";
		$this->pass = "";
		$this->dsn = "mysql:host=".$this->host.";dbname=".$this->nameDB;
		$this->conection =null;
	}
	public function getConnectPDO()
	{
		try {
		
			$this->conection=new PDO($this->dsn, $this->user , $this->pass);
			echo("Connected...");
		} catch (PDOException  $e) {
			echo $e->getMessage();
			exit();
		}
		return $this->conection;
	}
	public function connectPDOClose()
	{
		try {
			$this->conection = null;
			echo "Close Connecting ..";
		} catch (PDOException $e) {
			echo $e->getMessage();
			exit();
		}
	}
	public function getConnectMYSQLI()
	{
		try {
			$this->conection = new mysqli($this->host, $this->user, $this->pass, $this->nameDB);
			echo "Connecting ..";
		} catch (Exception $e) {
			echo $e->getMessage();
			exit();
		}
		return $this->conection;
	}
	public function connectMysqliClose()
	{
		try {
			$this->conection->close();
			echo "Close Connecting ..";
		} catch (Exception $e) {
			echo $e->getMessage();
			exit();
		}
	}

}



?>