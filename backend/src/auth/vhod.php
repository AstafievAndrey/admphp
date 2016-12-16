<?php
//$email = filter_input(INPUT_POST,"email");
//$password = base64_encode(md5(md5(filter_input(INPUT_POST,"password"))));
//$data = json_decode(file_get_contents('php://input'));
$email = $data->email;
$password = base64_encode(md5(md5($data->password)));

$sql =  'SELECT t1.id, t1.enabled, t2.id org_id '
        . 'FROM auth.users t1 '
        . 'JOIN auth.organizations t2 ON t2.id = t1.organization_id '
        . 'WHERE t1.email = :EMAIL and t1.password = :PASSWORD';
$sth = $pdo->prepare($sql);
$sth->bindParam(":PASSWORD", $password, PDO::PARAM_STR);
$sth->bindParam(":EMAIL", $email, PDO::PARAM_STR);
$sth->execute();
$res = $sth->fetch(PDO::FETCH_ASSOC);

if($res===false){
    s_error::show("Пользователь не найден");
}

if(!$res["enabled"]){
    s_error::show("Пользователь заблокирован");
}

$sql =  'SELECT t3.name '
        . 'FROM auth.users_roles t1 '
        . 'JOIN auth.users t2 ON t2.id = t1.user_id '
        . 'JOIN auth.roles t3 ON t3.id = t1.role_id '
        . 'WHERE t2.email = :EMAIL and t2.password = :PASSWORD';
$sth = $pdo->prepare($sql);
$sth->bindParam(":PASSWORD", $password, PDO::PARAM_STR);
$sth->bindParam(":EMAIL", $email, PDO::PARAM_STR);
$sth->execute();
$roles = $sth->fetchAll(PDO::FETCH_ASSOC);

echo json_encode(
        array(
//            "id"=>$res["id"],
            "email"=>$email,
            "token"=>Token::generateToken($res["id"]),
            "org_id"=>$res["org_id"],
            "roles"=>$roles
        )
    );


