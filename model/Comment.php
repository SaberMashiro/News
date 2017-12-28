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
        require_once "Database.php";
        $this->database = new Database();
    }

    private function decouple($pairs) {
        $fields = [];
        $values = [];
        foreach ($pairs as $key => $value) {
            $fields[] = "`" . $key . "`";
            $values[] = "'" . $value . "'";
        }
        $fields = implode(', ', $fields);
        $values = implode(', ', $values);
        return ['fields' => $fields, 'values' => $values];
    }

    /** 
    * 存储函数
    * 功能：添加评论
    * 参数：关联数组[字段名=>值]
    * 返回值：无
    */
    public function store($comment) {
        $string = $this->decouple($comment);
        $fields = $string['fields'];
        $values = $stirng['values'];
        $query = "INSERT
                    INTO comment 
                         ($fields)
                  VALUES ($values)";
        $this->database->execute($query);
    }

    /** 
    * 装载函数
    * 功能：取评论
    * 参数：新闻ID, 偏移量, 长度
    * 返回值：二维数组[索引][字段]
    */
    public function load($newsId, $offset, $length = 3) {
        $query = "SELECT guestname, content, time, ip
                    FROM comment
                   WHERE news_id = ?
                   LIMIT $offset, $length";
        $params = [$newsId];
        return $this->database->query($query, $params);
    }
}
?>
