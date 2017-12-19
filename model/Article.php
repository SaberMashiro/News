<?php
class Article {
    private $database;
    private $result;

    public function __construct($articleId) {
        require "Database.php";
        $this->database = new Database();
        $query = "SELECT content
                    FROM news
                   WHERE news_id = '$articleId'";
        $this->result = $this->database->execute($query);
    }

    public function getArticle() {
        return $result[0];
    }
}
?>
