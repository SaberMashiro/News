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
        require_once "Database.php";
        $this->database = new Database();
        $this->table = $table;
    }

    /**
     * 获取表的字段
     * 参数：无
     * 返回值：数组 [数字 => 字段名]
     */
    private function fields() {
        $fields = $this->database->fields($this->table);
        $fields = implode(', ', $fields);
        return $fields;
    }

    private function decouple($pairs) {
        $fields = [];
        $values = [];
        foreach ($assoc as $key => $value) {
            $fields[] = "`" . $key . "`";
            $values[] = "'" . $value . "'";
        }
        $fields = implode(', ', $fields);
        $values = implode(', ', $values);
        return ['fields' => $fields, 'values' => $values];
    }

    private function conditionalize($pairs) {
        $conditions = [];
        $parameters = [];
        foreach ($pairs as $key => $value) {
            $conditions[] = "`" . $key . "`" . ' = ' . '?';
            $parameters[] = $value;
        }
        $conditions = implode(' AND ', $conditions);
        return ['conditions' => $conditions, 'parameters' => $parameters];
    }

    /**
     * 关联数组字符串化
     * 参数：关联数组
     * 返回值：字符串 "键 = 值, 键 = 值, ..."
     */
    private function stringify($pairs) {
        $string = [];
        foreach ($pairs as $key => $value) {
            $string[] = "`" . $key . "`" . ' = ' . "'" . $value . "'";
        }
        $string = implode(', ', $string);
        return $string;
    }

    /**
     * 插入
     * 参数：数组 [数字 => 值]
     * 返回值：无
     */
    public function insert($pairs) {
        $string = $this->decouple($pairs);
        $fields = $string['fields'];
        $values = $string['values'];
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
    public function delete($conditions) {
        $string = $this->conditionalize($conditions);
        $conditions = $string['conditions'];
        $query = "DELETE
                    FROM $this->table
                   WHERE $conditions";
        $params = $string['parameters'];
        $this->database->query($query, $params);
    }

    /**
     * 更新
     * 参数：记录的主键， 关联数组[字段名 => 值]
     * 返回值：无
     */
    public function update($pairs, $conditions) {
        $pairs = $this->stringify($pairs);
        $string = $this->conditionalize($conditions);
        $conditions = $string['conditions'];
        $query = "UPDATE $this->table
                     SET $pairs
                   WHERE $conditions";
        $params = $string['parameters'];
        $this->database->query($query, $params);
    }

    /**
     * 查询
     * 参数：偏移量， 长度
     * 返回值：二维数组[行号][字段名]
     */
    public function select($offset, $length) {
        $fields = $this->fields();
        $query = "SELECT $fields
                    FROM $this->table
                   LIMIT $offset, $length";
        return $this->database->execute($query);
    }
}
?>
