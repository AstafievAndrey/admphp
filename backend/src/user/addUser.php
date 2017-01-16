<?php
$email = $data->email;
$password = base64_encode(md5(md5($data->password)));

$sql = "INSERT INTO auth.users (email,password,organization_id)"
        . "VALUES(:EMAIL,:PASS,:ORG)";

$sth = $pdo->prepare($sql);
$sth->bindParam(":EMAIL", $email, PDO::PARAM_STR);
$sth->bindParam(":PASS", $password, PDO::PARAM_STR);
$sth->bindParam(":ORG", $data->organization_id, PDO::PARAM_STR);

if(!$sth->execute()){
    s_error::show("Ошибка мы не смогли добавить пользователя в бд");
}

echo json_encode(array("res"=>"Запись добавлена в бд"));

