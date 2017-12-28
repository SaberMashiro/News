<?php
defined('APP_PATH') or die();

class Base
{
	private $controller;
	private $model;
	private $parameter;
	private $content;
	private $allow = ['Article','SignIn','Title'];
	
	public function __construct()
	{
		
	}
	
	public function run()
	{
		$this->route();
		if(in_array($this->parameter,$this->allow,true)){
			require APP_PATH."model/".$this->model.".php";
			$mod = new $this->model($this->parameter);
			$mod->render();	
		}
		else if($this->model === "login"){
			require APP_PATH."view/login/login.html";
		}
		else if($this->model === "detail"){
			$this->parameter = intval($this->parameter);
			require APP_PATH."model/Detail.php";
			$mod = new Detail();
			$this->content = $mod->load($this->parameter)['content'];
			#$aa = var_dump($this->content);
			$aa = file_get_contents(APP_PATH."view/detail/detail.html");
			$aa = str_replace("{{newscontent}}",$this->content,$aa);
			echo "$aa";
		}
		else{
			require APP_PATH."view/homePage/index.html";
		}
	}
	
	
	public function route()
	{
		$uri = $_SERVER['REQUEST_URI'];
		
		$uri = trim($uri,'/');
		$position = strpos($uri,'/');

		$parameter = !$position ? '' : substr($uri,$position+1);
		$model = !$position ? $uri : substr($uri,0,$position);
		
		$this->parameter = $parameter ? urldecode($parameter) : file_get_contents('php://input');
		$this->model = $model;
				
	}
	
}