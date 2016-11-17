<?php

//$sql = "SELECT t1.id, t1.name, t1.address, t1.phone, t1.active "
//        . "FROM shops t1 "
//        . "WHERE t1.organization_id = :ORG_ID";
//$sth = $pdo->prepare($sql);
//$sth->bindParam(":ORG_ID", $data->org_id, PDO::PARAM_INT);
//$sth->execute();
//$res = $sth->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($data);

