<?php

global $pdo;

$pdo = new PDO(
                "pgsql:dbname=kalyan;host=localhost", 
                "postgres", 
                "");

if (($handle = fopen("images.csv", "r")) !== FALSE) {
    while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
        $sql = "INSERT INTO files(name,size,active,organization_id,old_id)"
        . "VALUES(:NAME,:SIZE,TRUE,1,:OLD_ID)";
        $sth = $pdo->prepare($sql);
        $sth->bindParam(":SIZE", filesize("../cloud/images/".$data[1]), PDO::PARAM_INT);
        $sth->bindParam(":NAME", $data[1], PDO::PARAM_STR);
        $sth->bindParam(":OLD_ID", $data[0], PDO::PARAM_STR);
        $sth->execute();
    }
    fclose($handle);
}

