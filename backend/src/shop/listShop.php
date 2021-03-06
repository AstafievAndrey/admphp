<?php
$where = null;
$admin = true;
$limit = is_null(filter_input(INPUT_POST,"length"))?40:filter_input(INPUT_POST,"length");
$offset = is_null(filter_input(INPUT_POST,"start"))?1:filter_input(INPUT_POST,"start");
$draw = is_null(filter_input(INPUT_POST,"draw"))?1:filter_input(INPUT_POST,"draw");
//$columns = filter_input(INPUT_POST, 'columns', FILTER_DEFAULT , FILTER_REQUIRE_ARRAY);
$order = filter_input(INPUT_POST, 'order', FILTER_DEFAULT , FILTER_REQUIRE_ARRAY);

if(!$user->haveRole("admin")){
    $admin = false;
    $where = " and organization_id = :ORG_ID ";
}

$sql = "SELECT t1.id, t1.name, t1.address, t1.phone, t1.active "
        . "FROM shops t1 "
        . "WHERE  t1.enabled = true $where ";
        //. "ORDER BY ".$columns[$order[0]["column"]]["data"]." ".$order[0]["dir"]." "
//        . "LIMIT :L OFFSET :OFF ";
$sth = $pdo->prepare($sql);
//$sth->bindParam(":L", $limit, PDO::PARAM_INT);
//$sth->bindParam(":OFF", $offset, PDO::PARAM_INT);

if(!$admin){
    $sth->bindParam(":ORG_ID", $user->org, PDO::PARAM_INT);
}

$sth->execute();
$res = $sth->fetchAll(PDO::FETCH_ASSOC);

$sql = "SELECT count(*) cnt "
        . "FROM shops t1 "
        . "WHERE  t1.enabled = true $where ";
$sth = $pdo->prepare($sql);
if(!$admin){
    $sth->bindParam(":ORG_ID", $user->org, PDO::PARAM_INT);
}
$sth->execute();
$count = $sth->fetch(PDO::FETCH_ASSOC);

echo json_encode($res);
//echo json_encode(array("draw"=>$draw,"recordsTotals"=>$count["cnt"],  "recordsFiltered"=> $count["cnt"],"data"=>$res));
