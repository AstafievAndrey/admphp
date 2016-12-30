<?php
$active = false;
if($user->haveRole("admin")){
    $active = true;
}
$sth = $pdo->prepare("SELECT 1 res FROM shops WHERE seo_translit = :SEO_TRANSLIT");
$sth->bindParam(":SEO_TRANSLIT", $data->seo_translit, PDO::PARAM_STR);
if($sth->execute()){
    $res = $sth->fetch(PDO::FETCH_ASSOC);
    if($res["res"]==1){
        s_error::show("Транслит должен быть уникальным");
    }
}else{
    s_error::show("Ошибка бд");
}

$sql = "INSERT INTO shops("
            . "name,address,phone,"
            . "site,inst,vk,city_id,"
            . "organization_id,user_id,short_desc,"
            . "description,parking,alcohol,"
            . "food,veranda,console,"
            . "board,lat,lon,"
            . "enabled,active,seo_title,"
            . "seo_desc,seo_keys,seo_translit) "
        . "VALUES("
            . ":NAME,"
            . ":ADDRESS,"
            . ":PHONE,"
            . ":SITE,"
            . ":INST,"
            . ":VK,"
            . ":CITY_ID,"
            . ":ORGANIZATION_ID,"
            . ":USER_ID,"
            . ":SHORT_DESC,"
            . ":DESCRIPTION,"
            . ":PARKING,"
            . ":ALCOHOL,"
            . ":FOOD,"
            . ":VERANDA,"
            . ":CONSOLE,"
            . ":BOARD,"
            . ":LAT,"
            . ":LON,"
            . "true,"
            . ":ACTIVE,"
            . ":SEO_TITLE,"
            . ":SEO_DESC,"
            . ":SEO_KEYS,"
            . ":SEO_TRANSLIT"
        . ") returning id ";
$sth = $pdo->prepare($sql);
$sth->bindParam(":NAME", $data->name, PDO::PARAM_STR);
$sth->bindParam(":ADDRESS", $data->address, PDO::PARAM_STR);
$sth->bindParam(":PHONE", $data->phone, PDO::PARAM_STR);
$sth->bindParam(":SITE", $data->site, PDO::PARAM_STR);
$sth->bindParam(":INST", $data->inst, PDO::PARAM_STR);
$sth->bindParam(":VK", $data->vk, PDO::PARAM_STR);
$sth->bindParam(":CITY_ID", $data->city_id, PDO::PARAM_INT);
$sth->bindParam(":ORGANIZATION_ID", $user->org, PDO::PARAM_INT);
$sth->bindParam(":USER_ID", $user->id, PDO::PARAM_INT);
$sth->bindParam(":SHORT_DESC", $data->short_desc, PDO::PARAM_STR);
$sth->bindParam(":DESCRIPTION", $data->description, PDO::PARAM_STR);
$sth->bindParam(":PARKING", $data->parking, PDO::PARAM_BOOL);
$sth->bindParam(":ALCOHOL", $data->alcohol, PDO::PARAM_BOOL);
$sth->bindParam(":FOOD", $data->food, PDO::PARAM_BOOL);
$sth->bindParam(":VERANDA", $data->veranda, PDO::PARAM_BOOL);
$sth->bindParam(":CONSOLE", $data->console, PDO::PARAM_BOOL);
$sth->bindParam(":BOARD", $data->board, PDO::PARAM_BOOL);
$sth->bindParam(":LAT", $data->lat, PDO::PARAM_STR);
$sth->bindParam(":LON", $data->lon, PDO::PARAM_STR);
$sth->bindParam(":ENABLED", $data->enabled, PDO::PARAM_BOOL);
$sth->bindParam(":ACTIVE", $active, PDO::PARAM_BOOL);
$sth->bindParam(":SEO_TITLE", $data->seo_title, PDO::PARAM_STR);
$sth->bindParam(":SEO_DESC", $data->seo_desc, PDO::PARAM_STR);
$sth->bindParam(":SEO_KEYS", $data->seo_keys, PDO::PARAM_STR);

//$sth->bindParam(":FILE_ID", $data->shop->file_id, PDO::PARAM_INT);
$sth->bindParam(":SEO_TRANSLIT", $data->seo_translit, PDO::PARAM_STR);

if($sth->execute()){
    $res = $sth->fetchAll(PDO::FETCH_ASSOC);
    $sql = "INSERT INTO shops_categories(shop_id,category_id) VALUES(:SHOP_ID,:CATEGORY_ID)";
    $sth = $pdo->prepare($sql);
    $sth->bindParam(":SHOP_ID",$res[0]["id"],PDO::PARAM_INT);
    $sth->bindParam(":CATEGORY_ID",$data->category_id,PDO::PARAM_INT);
    if($sth->execute()){
        foreach ($data->shedule as $key => $value) {
            if((int)$value->type_work==3){
                $sth = $pdo->prepare("INSERT INTO shedule(shop_id,day_id,type_work,work_begin,work_end) "
                        . "VALUES(:SHOP_ID,:DAY_ID,:TYPE_WORK,:WORK_BEGIN,:WORK_END)");
                $sth->bindParam(":WORK_BEGIN",$value->work_begin,PDO::PARAM_INT);
                $sth->bindParam(":WORK_END",$value->work_end,PDO::PARAM_INT);
            }else{
                $sth = $pdo->prepare("INSERT INTO shedule(shop_id,day_id,type_work) VALUES(:SHOP_ID,:DAY_ID,:TYPE_WORK)");
            }
            $sth->bindParam(":SHOP_ID",$res[0]["id"],PDO::PARAM_INT);
            $sth->bindParam(":DAY_ID",$value->id,PDO::PARAM_INT);
            $sth->bindParam(":TYPE_WORK",$value->type_work,PDO::PARAM_INT);
            $sth->execute();
        }
    }else{
        $sth = $pdo->prepare("DELETE FROM shops WHERE id = :ID");
        $sth->bindParam(":ID",$res[0]["id"],PDO::PARAM_INT);
        $sth->execute();
        s_error::show("Ошибка добавления категории");
    }
}else{
    s_error::show("Ошибка добавления заведения");
}

echo json_encode(array("data"=>$data,"food"=>$data->food));

