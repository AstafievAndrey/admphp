<?php
//$email = filter_input(INPUT_POST,"email");
//$password = base64_encode(md5(md5(filter_input(INPUT_POST,"password"))));
$data = json_decode(file_get_contents('php://input'));
$email = $data->email;
$password = base64_encode(md5(md5($data->password)));

$sql =  'SELECT t1.id, t1.enabled '
        . 'FROM auth.users t1 '
        . 'JOIN auth.organizations t2 ON t2.id = t1.organization_id '
        . 'WHERE t1.email = :EMAIL and t1.password = :PASSWORD';
$sth = $pdo->prepare($sql);
$sth->bindParam(":PASSWORD", $password, PDO::PARAM_STR);
$sth->bindParam(":EMAIL", $email, PDO::PARAM_STR);
$sth->execute();
$res = $sth->fetch(PDO::FETCH_ASSOC);

if($res===false){
    Error::show("Пользователь не найден");
}

if(!$res["enabled"]){
    Error::show("Пользователь заблокирован");
}

echo json_encode(
        array(
            "id"=>$res["id"],
            "email"=>$email,
            "token"=>Token::generateToken($res["id"])
        )
    );

