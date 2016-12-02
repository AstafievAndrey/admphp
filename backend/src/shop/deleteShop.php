<?php

$sql = "UPDATE shops SET enabled = false, user_id = :USER_ID WHERE id = :ID";
$sth = $pdo->prepare($sql);
$sth->bindParam(":ID",$data->shop->id,PDO::PARAM_INT);
$sth->bindParam(":USER_ID",$data->user->id,PDO::PARAM_INT);
if(!$sth->execute()){
    s_error::show("Не удалось удалить");
}

echo json_encode(array("state"=>1));
