<?php

class Config{
    public static function getConfig($param) {
        $config = json_decode(file_get_contents("./config.json"),true);
        return $config[$param];
    }
}

