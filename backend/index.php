<?php
ini_set("display_s_errors",0);
error_reporting(E_ALL);

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Token, X-Requested-With");
header('P3P: CP="CAO PSA OUR"'); // Makes IE to support cookies
header("Content-Type: application/json; charset=utf-8");

spl_autoload_register(function($class){
    include 'classes/'.strtolower($class).'.php';
});


$config = json_decode(file_get_contents("config.json"),true);
$router = json_decode(file_get_contents("router.json"),true);

if(is_null(filter_input(INPUT_SERVER,"REDIRECT_URL"))){
    s_error::show("Empty Url");
}else{
    $url = explode("/", filter_input(INPUT_SERVER,"REDIRECT_URL"));
    array_splice($url, 0, 1);
}

if(!is_null($router[$url[0]])){
    $data = json_decode(file_get_contents('php://input'));//принимаем что придет постом
    $pdo = Db::getPdo(Config::getConfig("postgres"));//подключение к бд
    if(isset($router[$url[0]]["auth"])&&($router[$url[0]]["auth"]===true)){
        if(!is_null(filter_input(INPUT_SERVER,"HTTP_TOKEN"))){
            if(!Token::checkAuth($token)){
                s_error::show("Auth failed");
            }
        }
    }
    include_once 'src/'.$router[$url[0]]["src"];
}else{
    s_error::show("Undefined route");
}


