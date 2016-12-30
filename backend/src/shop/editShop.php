<?php
$active = false;
if($user->haveRole("admin")){
    $active = true;
}

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
            . "lat              = :LAT,"
            . "lon              = :LOT,"
            . "enabled          = :ENABLED,"
            . "active           = :ACTIVE "
        . "WHERE id = :ID";

$sth = $pdo->prepare($sql);
$sth->bindParam(":ID",$data->id,PDO::PARAM_INT);
$sth->bindParam(":NAME",$data->name,PDO::PARAM_STR);
$sth->bindParam(":ADDRESS",$data->address,PDO::PARAM_STR);
$sth->bindParam(":PHONE",$data->phone,PDO::PARAM_STR);
$sth->bindParam(":SITE",$data->site,PDO::PARAM_STR);
$sth->bindParam(":INST",$data->inst,PDO::PARAM_STR);
$sth->bindParam(":VK",$data->vk,PDO::PARAM_STR);
$sth->bindParam(":CITY_ID",$data->city_id,PDO::PARAM_INT);
$sth->bindParam(":ORG_ID",$user->org,PDO::PARAM_INT);
$sth->bindParam(":USER_ID",$user->id,PDO::PARAM_INT);
$sth->bindParam(":SHORT_DESC",$data->short_desc,PDO::PARAM_STR);
$sth->bindParam(":DESC",$data->description,PDO::PARAM_STR);
$sth->bindParam(":PARKING",$data->parking,PDO::PARAM_BOOL);
$sth->bindParam(":ALCOHOL",$data->alcohol,PDO::PARAM_BOOL);
$sth->bindParam(":FOOD",$data->food,PDO::PARAM_BOOL);
$sth->bindParam(":VERANDA",$data->veranda,PDO::PARAM_BOOL);
$sth->bindParam(":CONSOLE",$data->console,PDO::PARAM_BOOL);
$sth->bindParam(":BOARD",$data->board,PDO::PARAM_BOOL);
$sth->bindParam(":LAT",$data->lat,PDO::PARAM_STR);
$sth->bindParam(":LON",$data->lon,PDO::PARAM_STR);
$sth->bindParam(":ENABLED",$data->enabled,PDO::PARAM_BOOL);
$sth->bindParam(":ACTIVE",$active,PDO::PARAM_BOOL);

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






