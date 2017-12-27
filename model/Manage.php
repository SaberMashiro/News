<?php
class Manage {
    private $database; // 数据库
    private $table; // 表名

    /**
     * 构造函数
     * 参数：表名
     * 返回值：无
     */
    public function __construct($table) {
        require "Database.php";
        $this->database = new Database();
        $this->table = $table;
    }

    /**
     * 获取表的字段
     * 参数：无
     * 返回值：数组 [数字 => 字段名]
     */
    private function fields() {
        return $this->database->fields($this->table);
    }

    /**
     * 关联数组字符串化
     * 参数：关联数组
     * 返回值：字符串 "键 = 值, 键 = 值, ..."
     */
    private function stringify($pairs) {
        $string = [];
        foreach ($pairs as $key => $value) {
            $string[] = $key . ' = ' . $value;
        }
        return implode(', ', $string);
    }

    /**
     * 插入
     * 参数：数组 [数字 => 值]
     * 返回值：无
     */
    public function insert($values) {
        $fields = implode(', ', array_shift(fields()));
        $values = implode(', ', $values);
        $query = "INSERT
                    INTO $this->table
                         ($fields)
                  VALUES ($values)";
        $this->database->execute($query);
    }

    /**
     * 删除
     * 参数：记录的主键
     * 返回值：无
     */
    public function delete($id) {
        $idField = fields()[0];
        $query = "DELETE
                    FROM $this->table
                   WHERE $idField = ?";
        $params = [$id];
        $this->database->query($query, $params);
    }

    /**
     * 更新
     * 参数：记录的主键， 关联数组[字段名 => 值]
     * 返回值：无
     */
    public function update($id, $pairs) {
        $pairs = stringify($pairs);
        $idField = fields()[0];
        $query = "UPDATE $this->table
                     SET $pairs
                   WHERE $idField = ?";
        $params = [$id];
        $this->database->query($query, $params);
    }

    /**
     * 查询
     * 参数：偏移量， 长度
     * 返回值：二维数组[行号][字段名]
     */
    public function select($offset, $length) {
        $fields = implode(', ', fields());
        $query = "SELECT $fields
                    FROM $this->table
                   LIMIT $offset, $length";
        return $this->database->execute($query);
    }
}
?>
