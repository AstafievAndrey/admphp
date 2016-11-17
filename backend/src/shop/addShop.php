<?php

$sql = "INSERT INTO shops(name,address,phone,site,inst,vk,city_id,organization_id,"
            . "user_id,short_desc,description,parking,alcohol,food,veranda,"
            . "console,board,lat,lon,enabled,active,seo_title,seo_desc,"
            . "seo_keys,seo_translit,file_id) "
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
            . ":ENABLED,"
            . ":ACTIVE,"
            . ":SEO_TITLE,"
            . ":SEO_DESC,"
            . ":SEO_KEYS,"
            . ":SEO_TRANSLIT,"
            . ":FILE_ID"
        . ") returning id ";
$sth = $pdo->prepare($sql);
$sth->bindParam(":NAME", $data->shop->name, PDO::PARAM_STR);
$sth->bindParam(":ADDRESS", $data->shop->address, PDO::PARAM_STR);
$sth->bindParam(":PHONE", $data->shop->phone, PDO::PARAM_STR);
$sth->bindParam(":SITE", $data->shop->site, PDO::PARAM_STR);
$sth->bindParam(":INST", $data->shop->inst, PDO::PARAM_STR);
$sth->bindParam(":VK", $data->shop->vk, PDO::PARAM_STR);
$sth->bindParam(":CITY_ID", $data->shop->city_id, PDO::PARAM_INT);
$sth->bindParam(":ORGANIZATION_ID", $data->user->org_id, PDO::PARAM_INT);
$sth->bindParam(":USER_ID", $data->user->id, PDO::PARAM_INT);
$sth->bindParam(":SHORT_DESC", $data->shop->short_desc, PDO::PARAM_STR);
$sth->bindParam(":DESCRIPTION", $data->shop->desc, PDO::PARAM_STR);
$sth->bindParam(":PARKING", $data->shop->parking, PDO::PARAM_BOOL);
$sth->bindParam(":ALCOHOL", $data->shop->alcohol, PDO::PARAM_BOOL);
$sth->bindParam(":FOOD", $data->shop->food, PDO::PARAM_BOOL);
$sth->bindParam(":VERANDA", $data->shop->veranda, PDO::PARAM_BOOL);
$sth->bindParam(":CONSOLE", $data->shop->console, PDO::PARAM_BOOL);
$sth->bindParam(":BOARD", $data->shop->board, PDO::PARAM_BOOL);
$sth->bindParam(":LAT", $data->shop->lat, PDO::PARAM_STR);
$sth->bindParam(":LON", $data->shop->lon, PDO::PARAM_STR);
$sth->bindParam(":ENABLED", $data->shop->enabled, PDO::PARAM_BOOL);
$sth->bindParam(":ACTIVE", $data->shop->active, PDO::PARAM_BOOL);
$sth->bindParam(":SEO_TITLE", $data->shop->seo_title, PDO::PARAM_STR);
$sth->bindParam(":SEO_DESC", $data->shop->seo_desc, PDO::PARAM_STR);
$sth->bindParam(":SEO_KEYS", $data->shop->seo_keys, PDO::PARAM_STR);

$sth->bindParam(":FILE_ID", $data->shop->file_id, PDO::PARAM_INT);
$sth->bindParam(":SEO_TRANSLIT", $data->shop->seo_translit, PDO::PARAM_STR);

if($sth->execute()){
    $res = $sth->fetchAll(PDO::FETCH_ASSOC);
    $sql = "INSERT INTO shops_categories(shop_id,category_id) VALUES(:SHOP_ID,:CATEGORY_ID)";
    $sth = $pdo->prepare($sql);
    $sth->bindParam(":SHOP_ID",$res[0]["id"],PDO::PARAM_INT);
    $sth->bindParam(":CATEGORY_ID",$data->shop->category_id,PDO::PARAM_INT);
    if($sth->execute()){
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
            $sth->bindParam(":SHOP_ID",$res[0]["id"],PDO::PARAM_INT);
            $sth->bindParam(":DAY_ID",$id,PDO::PARAM_INT);
            $sth->bindParam(":TYPE_WORK",$value->type_work,PDO::PARAM_INT);
            $sth->execute();
        }
    }else{
        $sth = $pdo->prepare("DELETE FROM shops WHERE id = :ID");
        $sth->bindParam(":ID",$res[0]["id"],PDO::PARAM_INT);
        $sth->execute();
        Error::show("Ошибка добавления категории");
    }
}else{
    Error::show("Ошибка добавления заведения");
}

echo json_encode(array("data"=>$data,"food"=>$data->food));

