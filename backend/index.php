<?php
ini_set("display_s_errors",0);
error_reporting(E_ALL);
header('Content-type: application/json');
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
        if(isset($data->user)){
            $email = $data->user->email;
            $token = $data->user->token;
        }else{
            $email = $data->email;
            $token = $data->token;
        }
        if(!Token::checkAuth($email, $token)){
            s_error::show("Auth failed");
        }
    }
    include_once 'src/'.$router[$url[0]]["src"];
}else{
    s_error::show("Undefined route");
}


