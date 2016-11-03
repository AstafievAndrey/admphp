<?php

class Token{
    /*
     * return string   - возвращаем новый токен
     * @param int $id  - ид пользователя для которого создаем токен
     */
    public static function generateToken($id,$conn='postgres') {
        $token = substr(base64_encode(md5(base64_encode(md5(md5($id).time().rand(0, 1000000))))),0,-1);
        $pdo = Db::getPdo(Config::getConfig($conn));        
        $sth = $pdo->prepare("UPDATE auth.users SET token = :TOKEN where id = :ID");
        $sth->bindParam(":ID", $id, PDO::PARAM_INT);
        $sth->bindParam(":TOKEN", $token, PDO::PARAM_STR);
        $sth->execute();
        return $token;
    }
}

