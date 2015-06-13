<?php

// Check out https://stackoverflow.com/questions/6781931/how-do-i-create-and-store-md5-passwords-in-mysql


$escapedName = "helloworld";
$escapedPW = "hi";

# generate a random salt to use for this account
$salt = bin2hex(mcrypt_create_iv(32, MCRYPT_DEV_URANDOM));

$saltedPW =  $escapedPW . $salt;

$hashedPW = hash('sha512', $saltedPW);
var_dump($salt);
var_dump($hashedPW);
?>
