<?php
$pdo = Db::getPdo(Config::getConfig("postgres"));
if(!isset($url[1])){
    include_once 'vhod.php';
}

