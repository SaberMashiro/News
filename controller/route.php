<?php
defined('APP_PATH') or die();

class Base
{
	private $controller;
	private $model;
	private $parameter;
	
	public function __construct()
	{
		
	}
	
	public function run()
	{
		$this->route();
		require APP_PATH."model/".$this->model.".php";	
		$mod = new $this->model($this->parameter);
		$mod->render();	
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