<?php
$pdo = Db::getPdo(Config::getConfig("postgres"));
if(!isset($url[1])){
    include_once 'vhod.php';
}else{
    if(file_exists($url[1].".php")){
        include_once $url[1].".php";
    }else{
        s_error::show("Ошибка роутинга");
    }
}

