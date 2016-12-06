<?php

//var_dump($data);

$sql = "UPDATE shops SET "
            . "name             = :NAME,"
            . "address          = :ADDRESS,"
            . "phone            = :PHONE,"
            . "site             = :SITE,"
            . "inst             = :INST,"
            . "vk               = :VK,"
            . "city_id          = :CITY_ID, "
            . "organization_id  = :ORG_ID,"
            . "user_id          = :USER_ID,"
            . "short_desc       = :SHORT_DESC,"
            . "description      = :DESC,"
            . "parking          = :PARKING,"
            . "alcohol          = :ALCOHOL,"
            . "food             = :FOOD,"
            . "veranda          = :VERANDA,"
            . "console          = :CONSOLE,"
            . "board            = :BOARD,"
//            . "lat              = :LAT,"
//            . "lon              = :LOT,"
            . "enabled          = :ENABLED,"
            . "active           = :ACTIVE "
        . "WHERE id = :ID";

$sth = $pdo->prepare($sql);
$sth->bindParam(":ID",$data->shop->id,PDO::PARAM_INT);
$sth->bindParam(":NAME",$data->shop->name,PDO::PARAM_STR);
$sth->bindParam(":ADDRESS",$data->shop->address,PDO::PARAM_STR);
$sth->bindParam(":PHONE",$data->shop->phone,PDO::PARAM_STR);
$sth->bindParam(":SITE",$data->shop->site,PDO::PARAM_STR);
$sth->bindParam(":INST",$data->shop->inst,PDO::PARAM_STR);
$sth->bindParam(":VK",$data->shop->vk,PDO::PARAM_STR);
$sth->bindParam(":CITY_ID",$data->shop->city_id,PDO::PARAM_INT);
$sth->bindParam(":ORG_ID",$data->user->org_id,PDO::PARAM_INT);
$sth->bindParam(":USER_ID",$data->user->id,PDO::PARAM_INT);
$sth->bindParam(":SHORT_DESC",$data->shop->short_desc,PDO::PARAM_STR);
$sth->bindParam(":DESC",$data->shop->desc,PDO::PARAM_STR);
$sth->bindParam(":PARKING",$data->shop->parking,PDO::PARAM_BOOL);
$sth->bindParam(":ALCOHOL",$data->shop->alcohol,PDO::PARAM_BOOL);
$sth->bindParam(":FOOD",$data->shop->food,PDO::PARAM_BOOL);
$sth->bindParam(":VERANDA",$data->shop->veranda,PDO::PARAM_BOOL);
$sth->bindParam(":CONSOLE",$data->shop->console,PDO::PARAM_BOOL);
$sth->bindParam(":BOARD",$data->shop->board,PDO::PARAM_BOOL);
$sth->bindParam(":ENABLED",$data->shop->enabled,PDO::PARAM_BOOL);
$sth->bindParam(":ACTIVE",$data->shop->active,PDO::PARAM_BOOL);

if($sth->execute()){
    
    $sth = $pdo->prepare("DELETE FROM shops_categories WHERE shop_id = :ID AND category_id = :CATEG_ID");
    $sth->bindParam(":ID",$data->shop->id,PDO::PARAM_INT);
    $sth->bindParam(":CATEG_ID",$data->shop->category_id,PDO::PARAM_INT);
    if(!$sth->execute()){
        s_error::show("Не удалось обновить информацию по категориям заведения");
    }
    
    $sth = $pdo->prepare("INSERT INTO shops_categories(shop_id,category_id) VALUES(:SHOP_ID,:CATEG_ID)");
    $sth->bindParam(":SHOP_ID",$data->shop->id,PDO::PARAM_INT);
    $sth->bindParam(":CATEG_ID",$data->shop->category_id,PDO::PARAM_INT);
    if(!$sth->execute()){
        s_error::show("Не удалось обновить информацию по категориям заведения");
    }
    
    $sth = $pdo->prepare("DELETE FROM shedule WHERE shop_id = :ID");
    $sth->bindParam(":ID",$data->shop->id,PDO::PARAM_INT);
    $sth->execute();
    
    foreach ($data->shop->shedule as $key => $value) {
            $id = ((int)$value->id)+1;
            if((int)$value->type_work==3){
                $sth = $pdo->prepare("INSERT INTO shedule(shop_id,day_id,type_work,work_begin,work_end) "
                        . "VALUES(:SHOP_ID,:DAY_ID,:TYPE_WORK,:WORK_BEGIN,:WORK_END)");
                $sth->bindParam(":WORK_BEGIN",$value->work_begin,PDO::PARAM_INT);
                $sth->bindParam(":WORK_END",$value->work_end,PDO::PARAM_INT);
            }else{
                $sth = $pdo->prepare("INSERT INTO shedule(shop_id,day_id,type_work) VALUES(:SHOP_ID,:DAY_ID,:TYPE_WORK)");
            }
            $sth->bindParam(":SHOP_ID",$data->shop->id,PDO::PARAM_INT);
            $sth->bindParam(":DAY_ID",$id,PDO::PARAM_INT);
            $sth->bindParam(":TYPE_WORK",$value->type_work,PDO::PARAM_INT);
            $sth->execute();
    }
}else{
    s_error::show("Не удалось обновить информацию по заведению");
}

echo json_encode(array("state"=>1));






