<?php
class Title {
    private $database;

    /** 
    * 构造函数
    * 功能：建立数据库连接
    * 参数：无
    * 返回值：无
    */
    public function __construct() {
        require 'Database.php';
        $this->database = new Database();
    }

    /** 
    * 装载函数
    * 功能：取新闻标题信息
    * 参数：偏移量， 长度
    * 返回值：二维数组[数字][字段]
    */
    public function load($offset = 0, $length = 3) {
        $query = "SELECT news_id, title, synposis, title_img, time, category.name AS category, user.name AS user
                    FROM (
                         news 
                         JOIN category
                           ON news.cat_id = category.cat_id
                         )
                    JOIN user
                      ON news.user_id = user.user_id
                   LIMIT $offset, $length";
        return $this->database->execute($query);
    }
}
?>
