<?php
class Database {
    private $user;  // 用户名
    private $password;  // 密码
    private $database;  // 数据库名
    private $host;  // 主机
    private $port;  // 端口
    private $type = 'mysql';   // 数据库类型
    private $charset = 'utf8';  // 字符编码
    private $persistent = true;  // 是否使用持久连接
    private static $connect = null;  //静态属性, 避免重复连接

    /**
     * 构造函数
     * 参数：用户名，密码，数据库名，主机，端口
     */
    public function __construct($user = 'admin', $password = '123456', $database = 'news', $host = 'localhost', $port = '3306') {
        class_exists('PDO') or die('PDO class not found: check the PDO extension configuration in php.ini.');
        $this->user = $user;
        $this->password = $password;
        $this->database = $database;
        $this->host = $host;
        $this->port = $port;
        if (is_null(self::$connect)) {
            $this->connect();
        }
    }

    /**
     * 连接建立函数
     * 参数：无
     */
    private function connect() {
        $dsn = sprintf('%s:host=%s;port=%s;dbname=%s;charset=%s', $this->type, $this->host, $this->port, $this->database, $this->charset);
        $options = [
            PDO::ATTR_PERSISTENT => $this->persistent,  // 是否将建立长连接
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,  // 发生错误将会抛出异常，并且事务会回滚
            PDO::ATTR_EMULATE_PREPARES => false,  // 禁用Prepared Statements的仿真效果（防止宽字节SQL注入攻击）
        ];
        try {
            self::$connnect = new PDO($dsn, $this->user, $this->password, $options);
        }
        catch (PDOException $e) { 
            die('Connection failed: ' . $e->getMessage());
        }
    }

    /**
    * XSS防御
    */
    private function xssPrevent($str) {
        if (!is_array($str)) {
            $str = htmlspecialchars($str, ENT_QUOTES);
        }
        else {
            foreach ($str as $key=>$value) {
                $value = $this->xssPrevent($value);
            }
        }
        return $str;
    }

    /** 
    * 取得表的字段信息
    * 参数：表名
    * 返回值：数组
    */
    public function fields($tableName) {
        $query = "SELECT column_name 
                    FROM information_schema.columns 
                   WHERE table_name = ? 
                         AND table_schema = ?";
        $statement = self::$connect->prepare($query);
        $statement->execute([$tableName, $this->database]);
        $result = $statement->fetchAll(PDO::FETCH_ASSOC);
        return array_column($result, 'column_name');
    }

    /**
    * 查询语句
    * 参数：查询语句字符串，查询语句参数
    * 返回值：二维数组【行号】【字段名】，经过XSS过滤
    */
    public function query($query = '', $params) {
        is_array($params) or die('Query parameters wrong.');
        $statement = self::$connect->prepare($query);
        $statement->execute($params);
        $result = $statement->fetchAll(PDO::FETCH_ASSOC);
        return $this->xssPrevent($result);
    }

    public function execute($query) {
        $statement = self::$connect->query($query);
        $result = $statement->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }
}
