<?php
namespace Configs;

class Database {
    const DATABASE = "fantacalcio";
    const HOST = "localhost";
    const PORT = "3306";
    const TYPE = "mysql";
    const USERNAME = "mine";
    const PASSWORD = "mine";
            
    const CONNECT = self::TYPE.":dbname=".self::DATABASE.";host=".self::HOST.";port=".self::PORT;
}

// Configs\Database::CONNECT;
// Database::CONNECT;