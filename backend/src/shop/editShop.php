<?php

var_dump($data);

$sql = "UPDATE shops SET"
            . "name             = :NAME,"
            . "address          = :ADDRESS,"
            . "phone            = :PHONE,"
            . "site             = :SITE,"
            . "inst             = :INST,"
            . "vk               = :VK,"
            . "city_id          = :CITY_ID,"
            . "organization_id  = :ORG_ID,"
            . "user_id          = :USER_ID,"
            . "short_desc       = :SHORT_DESC,"
            . "description,     = :DESC"
            . "parking          = :PARKING,"
            . "alcohol          = :ALCOHOL,"
            . "food             = :FOOD,"
            . "veranda          = :VERANDA,"
            . "console          = :CONSOLE,"
            . "board            = :BOARD,"
            . "lat              = :LAT,"
            . "lon              = :LOT,"
            . "enabled          = :ENABLED,"
            . "active           = :ACTIVE"
        . "WHERE id = :ID";
