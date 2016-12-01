<?php

class user {
    public $id;
    public $email;
    public $idRole;
    public $idOrg;
    public $nameOrg;
    public $nameRole;


    public function __construct($id) {
        $pdo = Db::getPdo(Config::getConfig($conn));  
        $sth = $pdo->prepare("  SELECT t1.id,t1.email,t1.organization_id,t2.name name_org,t3.role_id, t4.name name_role
                                FROM auth.users t1
                                JOIN auth.organizations t2 ON t1.organization_id = t2.id
                                JOIN auth.users_roles t3 ON t1.id = t3.user_id
                                JOIN auth.roles t4 ON t4.id = t3.role_id
                                WHERE t1.user_id = :ID");
        $sth->bindParam(":ID", $id, PDO::PARAM_INT);
        if($sth->execute()){
            $res = $sth->fetchAll(PDO::FETCH_ASSOC);
            $this->id = $res["id"];
            $this->email = $res["email"];
            $this->idOrg = $res["organization_id"];
            $this->nameOrg = $res["name_org"];
            $this->idRole = $res["role_id"];
            $this->nameRole = $res["name_role"];
        }else{
            Error::show("Error don't find User");
        }
        
    }
    
}
