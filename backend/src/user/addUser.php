<?php
$email = $data->email;
$password = base64_encode(md5(md5($data->password)));

$sql = "INSERT INTO auth.users (email,password,organization_id)"
        . "VALUES(:EMAIL,:PASS,:ORG) returning id ";

$pdo->beginTransaction();

$sth = $pdo->prepare($sql);
$sth->bindParam(":EMAIL", $email, PDO::PARAM_STR);
$sth->bindParam(":PASS", $password, PDO::PARAM_STR);
$sth->bindParam(":ORG", $data->organization_id, PDO::PARAM_STR);

if($sth->execute()){
    $res = $sth->fetchAll(PDO::FETCH_ASSOC);
    $sql = "INSERT INTO auth.users_roles(role_id,user_id)"
            . "VALUES(:ROLE_ID,:USER_ID)";
    
    $sth = $pdo->prepare($sql);
    $sth->bindParam(":ROLE_ID", $data->role_id, PDO::PARAM_INT);
    $sth->bindParam(":USER_ID", $res[0]["id"], PDO::PARAM_INT);
    
    if($sth->execute()){
        $pdo->commit();
        echo json_encode(array("res"=>"Запись добавлена в бд"));
    }else{
        $pdo->rollback();
        s_error::show("Ошибка мы не смогли добавить роль");
    }
    
}else{
    s_error::show("Ошибка мы не смогли добавить пользователя в бд");
}

