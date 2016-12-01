<?php
ini_set("display_errors",0);
error_reporting(E_ALL);
$pdo = new PDO(
                "pgsql:dbname=kalyan;host=localhost", 
                "postgres", "");

$json = json_decode(file_get_contents("samara.json"));
//var_dump($json->items[0]->id);

//$page = json_decode(file_get_contents("https://catalog.api.2gis.ru/2.0/catalog/branch/get?id=".$json->items[0]->id."&see_also_size=4&hash=6e51dcec2ba856de&stat%5Bpr%5D=21&fields=items.adm_div%2Citems.region_id%2Citems.reviews%2Citems.point%2Citems.links%2Citems.name_ex%2Citems.org%2Citems.group%2Citems.see_also%2Citems.dates%2Citems.external_content%2Citems.flags%2Citems.ads.options%2Citems.email_for_sending.allowed%2Chash%2Csearch_attributes&key=ruczoy1743"));
//$page = json_decode(file_get_contents("res.json"));

$day = array("Mon"=>1,"Tue"=>2,"Wed"=>3,"Thu"=>4,"Fri"=>5,"Sat"=>6,"Sun"=>7);
$org = 499099;
for($i=0;$i<count($json->items);$i++){
    
    $page = json_decode(file_get_contents("https://catalog.api.2gis.ru/2.0/catalog/branch/get?id=".$json->items[$i]->id."&see_also_size=4&hash=6e51dcec2ba856de&stat%5Bpr%5D=21&fields=items.adm_div%2Citems.region_id%2Citems.reviews%2Citems.point%2Citems.links%2Citems.name_ex%2Citems.org%2Citems.group%2Citems.see_also%2Citems.dates%2Citems.external_content%2Citems.flags%2Citems.ads.options%2Citems.email_for_sending.allowed%2Chash%2Csearch_attributes&key=ruczoy1743"));

    $sth = $pdo->prepare(" select id from shops where trim(upper(name)) = :NAME and city_id =  $org");
    $sth->bindParam(":NAME", trim(mb_strtoupper($page->result->items[0]->name_ex->primary)), PDO::PARAM_INT);
    $sth->execute();
    $res = $sth->fetch(PDO::FETCH_ASSOC);

    if(!$res){
        $phone = null;
        $site = null;
        $inst = null;
        $vk = null;
        $sql = "INSERT INTO shops(name,lat,lon,address,phone,site,inst,vk,organization_id,user_id,city_id,two_gis)"
                . "VALUES(:name,:lat,:lon,:address,:phone,:site,:inst,:vk,1,1,$org,true)";
        $sth = $pdo->prepare($sql);
        $sth->bindParam(":name", $page->result->items[0]->name_ex->primary, PDO::PARAM_STR);
        $sth->bindParam(":lat", $page->result->items[0]->point->lat, PDO::PARAM_STR);
        $sth->bindParam(":lon", $page->result->items[0]->point->lon, PDO::PARAM_STR);
        $sth->bindParam(":address", $page->result->items[0]->address_name, PDO::PARAM_STR);
        foreach ($page->result->items[0]->contact_groups[0]->contacts as $key => $value) {
            switch ($value->type){
                case "phone":
                    $phone = $value->text;
                    break;
                case "website":
                    $site = $value->text;
                    break;
                case "vkontakte":
                    $vk = $value->text;
                    break;
                case "instagram":
                    $inst = $value->text;
                    break;
            }
        }
        $sth->bindParam(":phone", $phone, PDO::PARAM_STR);
        $sth->bindParam(":site", $site, PDO::PARAM_STR);
        $sth->bindParam(":vk", $vk, PDO::PARAM_STR);
        $sth->bindParam(":inst", $inst, PDO::PARAM_STR);
        $sth->execute();

    }else{
//        var_dump($res["id"]);
        $sth = $pdo->prepare("DELETE FROM shedule WHERE shop_id = :id ");
        $sth->bindParam(":id", $res["id"], PDO::PARAM_INT);
        $sth->execute();
        
        foreach ($page->result->items[0]->schedule as $key => $value) {
//             var_dump($res["id"],$day[$key],(int)$value->working_hours[0]->to,(int)$value->working_hours[0]->from);
            $sth = $pdo->prepare("INSERT INTO shedule(shop_id,day_id,work_begin,work_end,type_work) "
                                . "VALUES(:id,:day_id,:b,:e,3)");
            $sth->bindParam(":id", $res["id"], PDO::PARAM_INT);
            $sth->bindParam(":day_id", $day[$key], PDO::PARAM_INT);
            $b = (int)$value->working_hours[0]->from;
            $e = (int)$value->working_hours[0]->to;
            $sth->bindParam(":b", $b, PDO::PARAM_STR);
            $sth->bindParam(":e", $e, PDO::PARAM_STR);
            $sth->execute();
        }
    }

}

//"instagram"
//vkontakte
//website
//551487