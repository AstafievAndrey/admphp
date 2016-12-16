<?php

class user {
    public $id;
    public $email;
    public $roles;
    public $org;


    public function __construct($token,$conn='postgres') {
        $pdo = Db::getPdo(Config::getConfig($conn));  
        $sth = $pdo->prepare("  SELECT t1.id,t1.email,t1.organization_id,t2.name name_org
                                FROM auth.users t1
                                JOIN auth.organizations t2 ON t1.organization_id = t2.id
                                JOIN auth.users_roles t3 ON t1.id = t3.user_id
                                JOIN auth.roles t4 ON t4.id = t3.role_id
                                WHERE t1.token = :TOKEN");
        $sth->bindParam(":TOKEN", $token, PDO::PARAM_STR);
        if($sth->execute()){
            $res = $sth->fetch(PDO::FETCH_ASSOC);
            $this->id = $res["id"];
            $this->email = $res["email"];
            $this->org = $res["organization_id"];
            $sth = $pdo->prepare("  SELECT t3.id, t3.name
                                    FROM auth.users t1
                                    JOIN auth.users_roles t2 ON t1.id = t2.user_id
                                    JOIN auth.roles t3 ON t3.id = t2.role_id
                                    WHERE t1.token = :TOKEN");
            $sth->bindParam(":TOKEN", $token, PDO::PARAM_STR);
            $sth->execute();
            $res = $sth->fetchAll(PDO::FETCH_ASSOC);
            $this->roles = $res;
        }else{
            s_error::show("s_error don't find User");
        }
    }
    
    public function haveRole($name) {
        $res = false;
        foreach ($this->roles as $value){
            if(array_search($name, $value)){
                return true;
            }
        }
        return $res;
    }    
    
    public function getAll(){
        return array(
                "id"=>$this->id,
                "email"=>$this->email,
                "roles"=>$this->roles,
                "org"=>$this->org
            );
    }
    
}
