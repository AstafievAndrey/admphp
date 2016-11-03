<?php

class Error{
    public static function show($message){
        die(json_encode(array("error"=>$message)));
    }
}

