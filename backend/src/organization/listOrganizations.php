<?php

$sql = "SELECT t1.id, t1.name, t1.address, t1.phone, t1.email "
        . "FROM auth.organizations t1 ";
$sth = $pdo->prepare($sql);
$sth->execute();
$res = $sth->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($res);

