<?php

// define('DB_HOST', '127.0.0.1'); // 
// define('DB_NAME', 'dbusrhou25se04ma');
// define('DB_USER', 'dbusrhou25se04ma');
// define('DB_PASS', 'db#Ho!25us04#mn!');
// define('DB_PORT', 3306);
// define('DB_CHAR', 'utf8');


define('DB_HOST', 'db');
define('DB_NAME', 'nineonelabs');
define('DB_USER', 'user');
define('DB_PASS', 'password');
define('DB_PORT', 3306);
define('DB_CHAR', 'utf8mb4');


class DB {
    static $instance = null;

    public static function getInstance() {
        if (self::$instance) {
            return self::$instance;
        }

        try {
            // DSN에 문자셋 추가
            $dsn = "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=" . DB_CHAR;
            $conn = new PDO($dsn, DB_USER, DB_PASS);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            // echo "연결 성공"; // 선택 사항: 성공 시 메시지 출력
        } catch (PDOException $e) {
            //echo "연결 실패: " . $e->getMessage();
        }

        self::$instance = $conn;
        return self::$instance;
    }
}