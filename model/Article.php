<?php
class Article {
    private $database;

    /** 
    * 构造函数
    * 功能：建立数据库连接
    * 参数：无
    * 返回值：无
    */
    public function __construct() {
        require "Database.php";
        $this->database = new Database();
    }

    /** 
    * 装载函数
    * 功能：取新闻内容
    * 参数：新闻ID
    * 返回值：字符串 "新闻内容"
    */
    public function load($articleId) {
        $query = "SELECT content
                    FROM news
                   WHERE news_id = '$articleId'";
        return $this->database->execute($query)[0];
    }
}
?>
