<?php
include "../PHP/mysql_test.php";

$TESTER = new mysql_test("localhost", "Unoselfie", "");
$TESTER->add_file("../DDL/Init_1.ddl");
$TESTER->run();

?>

