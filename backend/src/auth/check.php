<?php

//$email = filter_input(INPUT_POST,"email");
//$password = base64_encode(md5(md5(filter_input(INPUT_POST,"password"))));
//$data = json_decode(file_get_contents('php://input'));
//$id = $data->id;
//$email = $data->email;
//$token = $data->token;

$res = Token::checkToken(filter_input(INPUT_SERVER,"HTTP_TOKEN"));

if($res===false){
    s_error::show("Auth failed");
}else{
    echo json_encode($res);
}
