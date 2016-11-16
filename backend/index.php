<?php
ini_set("display_errors",0);
error_reporting(E_ALL);
header('Content-type: application/json');
spl_autoload_register(function($class){
    include 'classes/'.strtolower($class).'.php';
});


$config = json_decode(file_get_contents("config.json"),true);
$router = json_decode(file_get_contents("router.json"),true);

if(is_null(filter_input(INPUT_SERVER,"REDIRECT_URL"))){
    Error::show("Empty Url");
}else{
    $url = explode("/", filter_input(INPUT_SERVER,"REDIRECT_URL"));
    array_splice($url, 0, 1);
}

if(!is_null($router[$url[0]])){
//var_dump($router[$url[0]]);
    $data = json_decode(file_get_contents('php://input'));//принимаем что придет постом
    $pdo = Db::getPdo(Config::getConfig("postgres"));//подключение к бд
    if(isset($router[$url[0]]["auth"])&&($router[$url[0]]["auth"]===true)){
        if(!Token::checkAuth($data->email, $data->token)){
            Error::show("Auth failed");
        }
    }
    include_once 'src/'.$router[$url[0]]["src"];
}else{
    Error::show("Undefined route");
}


