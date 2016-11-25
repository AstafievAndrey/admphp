<?php

global $pdo;

$pdo = new PDO(
                "pgsql:dbname=kalyan;host=localhost", 
                "postgres", 
                "");

function getId($id){
    global $pdo;
    $sth = $pdo->prepare("SELECT id FROM shops where old_id = ".$id);
    $sth->execute();
    $res = $sth->fetch();
    return $res;
}

if (($handle = fopen("schedule.csv", "r")) !== FALSE) {
    while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
        $shop_id = getId($data[1])["id"];
        
        if($data[6]=="1"){
            $sql = "INSERT INTO shedule(shop_id,day_id,work_begin,work_end,type_work)"
            . "VALUES($shop_id,$data[2],1,24,2)";
        }
        if($data[5]=="1"){
            $sql = "INSERT INTO shedule(shop_id,day_id,work_begin,work_end,type_work)"
            . "VALUES($shop_id,$data[2],1,24,1)";
        }
        
        $sql = "INSERT INTO shedule(shop_id,day_id,work_begin,work_end,type_work)"
        . "VALUES($shop_id,$data[2],$data[3],$data[4],3)";
        
        $sth = $pdo->prepare($sql);
        $sth->execute();
    }
    fclose($handle);
}

