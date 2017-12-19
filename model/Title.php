<?php
class Title {
    private $database;
    private $result;

    public function __construct($offset = 0, $length = 3) {
        require 'Database.php';
        $this->database = new Database();
        $query = "SELECT news_id, title, synposis, title_img, time, category.name AS category, user.name AS user
                    FROM (
                         news
                         JOIN category
                           ON news.cat_id = category.cat_id
                         )
                    JOIN user
                      ON news.user_id = user.user_id
                   LIMIT $offset, $length";
        $this->result = $this->database->execute($query);
    }

    public function getResult() {
        return $result;
    }
}
?>
