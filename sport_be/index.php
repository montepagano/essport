<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

spl_autoload_register(function($class_name) {
    require_once  str_replace("\\", DIRECTORY_SEPARATOR, $class_name.".php");
});
//die(print_r($_SERVER,1));
if (isset($_SERVER["CONTENT_TYPE"]) &&
        stripos($_SERVER["CONTENT_TYPE"], "application/json") === 0) {
    $_POST = json_decode(file_get_contents("php://input"), true);
}