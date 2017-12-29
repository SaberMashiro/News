<?php
defined('APP_PATH') or die();
session_start();
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

		if($this->model === "detail"){
			$this->parameter = intval($this->parameter);
			require APP_PATH."model/Detail.php";
			$mod = new Detail();
			$content = $mod->load($this->parameter);
			$vegue = $content['content'];
			$title = $content['title'];
			$date = $content['time'];

			$file = file_get_contents(APP_PATH."view/detail/detail.html");
			$file = str_replace("{{newscontent}}",$vegue,$file);
			$file = str_replace("{{newsdate}}",$date,$file);
			$file = str_replace("{{newstitle}}",$title,$file);
			echo "$file";
		}
		else if($this->model === "title"){
			require APP_PATH."model/Title.php";
			$mod = new Title();
			$this->parameter = intval($this->parameter);
			$content = $mod->load($this->parameter*3);
			$content = json_encode($content);
			echo $content;
		}
		else if($this->model === "verify"){
			require APP_PATH."model/SignIn.php";
			$parameter = file_get_contents("php://input");
			$mod = new SignIn($parameter);
			$mod->render();
		}
		else if($this->model === "select"){
			require APP_PATH."model/Manage.php";
			$this->parameter = $_POST;
			if(isset($this->parameter['tablename'])){
				$mod = new Manage($this->parameter['tablename']);
				echo json_encode($mod->select(0,13));
			}
		}
		else if($this->model === "update"){
			require APP_PATH."model/Manage.php";
			$tablename = $this->parameter;
			$this->parameter = $_POST;
			$news_id = $this->parameter['news_id'];
			$title = $this->parameter['title'];
			$content = $this->parameter['content'];
			$icon = $this->parameter['icon'];
			$username = $this->parameter['username'];
			$synopsis = $this->parameter['synopsis'];
			
			$mod = new Manage($tablename);
			$mod->update(['title'=>$title,'content'=>$content,'icon'=>$icon,'username'=>$username,'synopsis'=>$synopsis],['news_id'=>"1"]);
		}
		else if($this->model === "delete"){
			require APP_PATH."model/Manage.php";
			$tablename = $_POST['tablename'];
			$news_id = $_POST['news_id'];
			$mod = new Manage($this->tablename);
			$mod->delete(['news_id'=>$news_id]);
			
		}
		else if($this->model === "add"){
			require APP_PATH."model/Manage.php";
			$tablename = $this->parameter;
			var_dump($_POST);
			$title = $_POST['title'];
			$content = $_POST['content'];
			$icon = $_POST['icon'];
			$username = $_POST['username'];
			$synopsis = $_POST['synopsis'];
			
			$mod = new Manage($tablename);
			$mod->insert(['title'=>$title,'content'=>$content,'icon'=>$icon,'username'=>$username,'synopsis'=>$synopsis]);
		}
		else if($this->model === "comment"){
			require APP_PATH."model/Comment.php";
			$this->parameter = $_POST;
			if(isset($_POST['guestname'])){
				$mod = new Comment();
				$mod->store(['news_id'=>$this->parameter['newsId'],'guestname'=>$this->parameter['guestname'],
					'content'=>$this->parameter['content'],'ip'=>$this->getip()]);
			}
			if(isset($_POST['count'])){
				$mod = new Comment();
				$result = $mod->load($this->parameter['newsId'],$this->parameter['count']*3);
				echo json_encode($result);
			}
		}
		else if($this->model === "manage"){
			require APP_PATH."view/manage/manage.html";
		
		}
		else if($this->model === "signin"){
			require APP_PATH."view/signin/signin.html";
		}
		else{
			require APP_PATH."view/home/home.html";
		}
	}
	
	public function getip()
	{
		if (getenv('HTTP_CLIENT_IP')) { 
            $ip = getenv('HTTP_CLIENT_IP'); 
        } 
        else if (getenv('HTTP_X_FORWARDED_FOR')) { 
            $ip = getenv('HTTP_X_FORWARDED_FOR'); 
        } 
        else if (getenv('HTTP_X_FORWARDED')) { 
            $ip = getenv('HTTP_X_FORWARDED'); 
        } 
        else if (getenv('HTTP_FORWARDED_FOR')) { 
            $ip = getenv('HTTP_FORWARDED_FOR'); 
        
        } 
        else if (getenv('HTTP_FORWARDED')) { 
            $ip = getenv('HTTP_FORWARDED'); 
        } 
        else { 
            $ip = $_SERVER['REMOTE_ADDR']; 
        } 
        return $ip; 
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