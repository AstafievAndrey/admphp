<?php

global $pdo;

$pdo = new PDO(
                "pgsql:dbname=kalyan;host=localhost", 
                "postgres", 
                "");

if (($handle = fopen("organizations.csv", "r")) !== FALSE) {
    while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
        $sql = "INSERT INTO shops(organization_id,user_id,city_id,name,address,phone,"
                . "site,inst,vk,short_desc,description,parking,"
                . "alcohol,food,veranda,console,board,lat,lon,"
                . "seo_title,seo_desc,seo_keys,"
                . "seo_translit,old_id)"
        . "VALUES("
            . "1,1,:CITY_ID,:NAME,:ADDRESS,:PHONE,"
                . ":SITE,:INST,:VK,:SHORT_DESC,"
                . ":DESCRIPTION,:PARKING,:ALCOHOL,"
                . ":FOOD,:VERANDA,:CONSOLE,"
                . ":BOARD,:LAT,:LON,"
                . ":SEO_TITLE,:SEO_DESC,:SEO_KEYS,"
                . ":SEO_TRANSLIT,:OLD_ID"
        . ")";
        $sth = $pdo->prepare($sql);
        $sth->bindParam(":CITY_ID", $data[25], PDO::PARAM_INT);
        $sth->bindParam(":NAME", $data[5], PDO::PARAM_STR);
        $sth->bindParam(":ADDRESS", $data[20], PDO::PARAM_STR);
        $sth->bindParam(":PHONE", $data[6], PDO::PARAM_STR);
        $sth->bindParam(":SITE", (($data[7]=='')?null:$data[7]), PDO::PARAM_STR);
        $sth->bindParam(":INST", (($data[8]=='')?null:$data[8]), PDO::PARAM_STR);
        $sth->bindParam(":VK", (($data[9]=='')?null:$data[9]), PDO::PARAM_STR);
        $sth->bindParam(":SHORT_DESC", $data[18], PDO::PARAM_STR);
        $sth->bindParam(":DESCRIPTION", $data[19], PDO::PARAM_STR);
        $sth->bindParam(":PARKING", $data[13], PDO::PARAM_BOOL);
        $sth->bindParam(":ALCOHOL", $data[11], PDO::PARAM_BOOL);
        $sth->bindParam(":FOOD", $data[17], PDO::PARAM_BOOL);
        $sth->bindParam(":VERANDA", $data[12], PDO::PARAM_BOOL);
        $sth->bindParam(":CONSOLE", $data[14], PDO::PARAM_BOOL);
        $sth->bindParam(":BOARD", $data[15], PDO::PARAM_BOOL);
        $sth->bindParam(":LAT", $data[21], PDO::PARAM_STR);
        $sth->bindParam(":LON", $data[22], PDO::PARAM_STR);
        $sth->bindParam(":SEO_TITLE", (($data[1]=='')?null:$data[1]), PDO::PARAM_STR);
        $sth->bindParam(":SEO_DESC", (($data[2]=='')?null:$data[2]), PDO::PARAM_STR);
        $sth->bindParam(":SEO_KEYS", (($data[3]=='')?null:$data[3]), PDO::PARAM_STR);
        $sth->bindParam(":SEO_TRANSLIT", (($data[4]=='')?null:$data[4]), PDO::PARAM_STR);
        $sth->bindParam(":OLD_ID", $data[0], PDO::PARAM_STR);
        $sth->execute();
    }
    fclose($handle);
}

