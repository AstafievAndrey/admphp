<?php
$where = null;
$admin = false;
$limit = 10;
$offset = 0;
if(!$user->haveRole("admin")){
    $admin = true;
    $where = " and organization_id = :ORG_ID ";
}

$sql = "SELECT t1.id, t1.name, t1.address, t1.phone, t1.active "
        . "FROM shops t1 "
        . "WHERE  t1.enabled = true $where "
        . "LIMIT :L OFFSET :OFF";
$sth = $pdo->prepare($sql);
$sth->bindParam(":L", $limit, PDO::PARAM_INT);
$sth->bindParam(":OFF", $offset, PDO::PARAM_INT);

if(!$admin){
    $sth->bindParam(":ORG_ID", $user->org, PDO::PARAM_INT);
}

$sth->execute();
$res = $sth->fetchAll(PDO::FETCH_ASSOC);
//echo json_encode($user->getAll());
echo json_encode(array("draw"=>2,"recordsTotals"=>305,"data"=>$res));

