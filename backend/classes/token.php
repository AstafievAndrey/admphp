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
    
    public static function checkToken($id,$email,$token,$conn='postgres'){
        $pdo = Db::getPdo(Config::getConfig($conn));
        $sth = $pdo->prepare("select 1 res from auth.users where email = :EMAIL and token = :TOKEN");
        $sth->bindParam(":EMAIL", $email, PDO::PARAM_STR);
        $sth->bindParam(":TOKEN", $token, PDO::PARAM_STR);
        $sth->execute();
        $res = $sth->fetch(PDO::FETCH_ASSOC);
        if($res['res']===1){
            return array(
                "id"=>$id,
                "email"=>$email,
//                "token"=>Token::generateToken($id,$conn)
            );
        }else{
            return false;
        }
    }
    
    public static function checkAuth($email,$token,$conn='postgres'){
        $pdo = Db::getPdo(Config::getConfig($conn));
        $sth = $pdo->prepare("select 1 res from auth.users where token = :TOKEN");
        $sth->bindParam(":TOKEN", $token, PDO::PARAM_STR);
        $sth->execute();
        $res = $sth->fetch(PDO::FETCH_ASSOC);
        if($res['res']===1){
            return true;
        }else{
            return false;
        }
    }
    
}

