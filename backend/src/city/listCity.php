<?php

$sql = "SELECT t1.id, t1.name "
        . "FROM cities t1 ";
$sth = $pdo->prepare($sql);
$sth->execute();
$res = $sth->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($res);

