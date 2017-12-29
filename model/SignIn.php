<?php
include "database.php";
error_reporting(0);
session_start();
class SignIn
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
		$sql = "select password from user where username =?";
		$param = array($this->username);
		$content = $pdo -> query($sql,$param);
		if(isset($this->password) && $content[0]['password'] === $this->password){
			$this->setToken();
			echo json_encode(['verified' => true, 'location' => '/manage']);
		}else{
			echo json_encode(['verified' => false]);
		}
		
	}
	
}
