<?php

$sql = "INSERT INTO auth.organizations (name,address,phone,email)"
        . "VALUES(:NAME,:ADDRESS,:PHONE,:EMAIL)";

$sth = $pdo->prepare($sql);
$sth->bindParam(":NAME", $data->name, PDO::PARAM_STR);
$sth->bindParam(":ADDRESS", $data->address, PDO::PARAM_STR);
$sth->bindParam(":PHONE", $data->phone, PDO::PARAM_STR);
$sth->bindParam(":EMAIL", $data->email, PDO::PARAM_STR);

if(!$sth->execute()){
    s_error::show("Ошибка мы не смогли добавить организацию в бд");
}

echo json_encode(array("res"=>"Запись добавлена в бд"));