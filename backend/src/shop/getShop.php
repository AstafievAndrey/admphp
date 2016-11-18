<?php

$sql = "select t1.id, "
            . "t1.enabled, "
            . "0 active, "
            . "t1.name,"
            . "t1.address,"
            . "t1.phone,"
            . "t1.site,"
            . "t1.inst,"
            . "t1.vk,"
            . "t1.city_id,"
            . "t1.short_desc,"
            . "t1.description as desc,"
            . "(case when t1.parking then 'true' else 'false' end) as parking,"
            . "(case when t1.alcohol then 'true' else 'false' end) as alcohol,"
            . "(case when t1.food then 'true' else 'false' end) as food,"
            . "(case when t1.veranda then 'true' else 'false' end) as veranda,"
            . "(case when t1.console then 'true' else 'false' end) as console,"
            . "(case when t1.board then 'true' else 'false' end) as board "
        . "from shops t1 "
        . "where id = :ID and enabled = true";

$sth = $pdo->prepare($sql);
$sth->bindParam(":ID",$data->id,PDO::PARAM_INT);

if($sth->execute()){
    $res = $sth->fetch(PDO::FETCH_ASSOC);
    $sql = "SELECT category_id "
            . "FROM shops_categories t1 "
            . "WHERE t1.shop_id = :SHOP_ID";
    $sth = $pdo->prepare($sql);
    $sth->bindParam(":SHOP_ID",$data->id,PDO::FETCH_ASSOC);
    if($sth->execute()){
        $res["category_id"] = $sth->fetch(PDO::FETCH_ASSOC)["category_id"];
    }else{
        Error::show("Ошибка выбора категории");
    }
    $sql = "SELECT t1.day_id-1 id, t2.name, t1.type_work, coalesce(t1.work_begin,1) work_begin, coalesce(t1.work_end,24) work_end "
            . "FROM shedule t1 "
            . "JOIN days_week t2 on t2.id = t1.day_id "
            . "WHERE t1.shop_id = :SHOP_ID";
    $sth = $pdo->prepare($sql);
    $sth->bindParam(":SHOP_ID",$data->id,PDO::FETCH_ASSOC);
    if($sth->execute()){
        $res["shedule"] = $sth->fetchAll(PDO::FETCH_ASSOC);
    }else{
        Error::show("Ошибка при выборки графика работы");
    }
}else{
    Error::show("Запись не найдена");
}

echo json_encode($res);
