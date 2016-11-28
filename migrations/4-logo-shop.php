<?php

global $pdo;

$pdo = new PDO(
                "pgsql:dbname=kalyan;host=localhost", 
                "postgres", 
                "");

if (($handle = fopen("organizations.csv", "r")) !== FALSE) {
    while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
        $sth = $pdo->prepare("SELECT id FROM shops WHERE old_id = :OLD_ID");
        $sth->bindParam(":OLD_ID", $data[0], PDO::PARAM_INT);
        $sth->execute();
        $org_id = $sth->fetch()["id"];
        $sth = $pdo->prepare("SELECT id FROM files WHERE old_id = :OLD_ID");
        $sth->bindParam(":OLD_ID", $data[23], PDO::PARAM_INT);
        $sth->execute();
        $file_id = $sth->fetch()["id"];
        $sth = $pdo->prepare("UPDATE shops SET file_id = :FILE_ID WHERE id = :ORG_ID ");
        $sth->bindParam(":ORG_ID", $org_id, PDO::PARAM_INT);
        $sth->bindParam(":FILE_ID", $file_id, PDO::PARAM_INT);
        $sth->execute();
    }
    fclose($handle);
}

