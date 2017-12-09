<?php

define('APP_PATH',__DIR__.'/');

require APP_PATH."controller/route.php";

$base = new Base();

$base->run();
