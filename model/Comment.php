<?php
class Comment {
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
    * 存储函数
    * 功能：添加评论
    * 参数：新闻ID, 评论内容
    * 返回值：无
    */
    public function store($newsId, $content, $ip) {
        $query = "INSERT
                    INTO comment (news_id, content, time, ip) 
                  VALUES ('$newsId', '$content', now(), '$ip')";
        $this->database->execute($query);
    }

    /** 
    * 装载函数
    * 功能：取评论
    * 参数：新闻ID, 偏移量, 长度
    * 返回值：二维数组[索引][字段]
    */
    public function load($newsId, $offset, $length = 3) {
        $query = "SELECT content, time, ip
                    FROM comment
                   WHERE news_id = '$newsId'
                   LIMIT $offset, $length";
        return $this->database->execute($query);
    }
}
?>
