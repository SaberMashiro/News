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
        require_once 'Database.php';
        $this->database = new Database();
    }

    /** 
    * 装载函数
    * 功能：取新闻标题信息
    * 参数：偏移量， 长度
    * 返回值：二维数组[数字][字段]
    */
    public function load($offset, $length = 3) {
        $query = "SELECT news_id, title, icon, synopsis, time, username 
                    FROM news 
                   LIMIT $offset, $length";
        $result = $this->database->execute($query);
        foreach ($result as &$value) {
            $newsId = $value['news_id'];
            $query = "SELECT name 
                        FROM category
                        JOIN category_news
                          ON category_news.news_id = '$newsId'
                             AND category_news.category_id = category.category_id";
            $categories = $this->database->execute($query);
            $value['categories'] = array_column($categories, 'name');
        }
        return $result;
    }
}
?>
