<?php
include APP_PATH."database/database.php";
session_start();
class loginCheck
{
	private $username;
	private $password;
	private $data;
	
	public function __construct($data)
	{	
		$this->data = json_decode($data);
		$this->setValue();
	}
	
	private function setValue()
	{
		$this->username = $this->data->username;
		$this->password = $this->data->password;
	}
	
	private function setToken()
	{
		$token = '';
		for($i=0;$i<16;$i++){
			$token.=mt_rand(0,9);
		}
		$_SESSION['token'] = $token;
		setcookie("token",$token);
	}
	
	public function render()
	{
		$pdo = new Database();
		$sql = "select password from user where name =?";
		$param = array($this->username);
		$content = $pdo -> query($sql,$param);
		if($content[0]['password'] === $this->password){
			echo json_encode(array("location"=>"index.php","success"=>true));
		}else{
			echo json_encode(array("location"=>"error.html","success"=>false));
		}
		
	}
	
}
