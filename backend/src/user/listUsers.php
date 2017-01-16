<?php

$sql = "SELECT t1.id, t1.email, null as password, t1.organization_id "
        . "FROM auth.users t1 ";
$sth = $pdo->prepare($sql);
$sth->execute();
$res = $sth->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($res);

