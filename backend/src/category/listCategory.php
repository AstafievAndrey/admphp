<?php

$sql = "SELECT t1.id, t1.name, t1.parent_id "
        . "FROM categories t1 "
        . "WHERE t1.parent_id = :PARENT_ID";

$sth = $pdo->prepare($sql);
$sth->bindParam(":PARENT_ID", $data->parent_id, PDO::PARAM_INT);
$sth->execute();
$res = $sth->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($res);

