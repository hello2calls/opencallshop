<?php
include   dirname(__FILE__).'\libdir\database.php';
$link = mysql_connect($db_host, $db_user, $db_pass);
if (!$link) {
    die('Not connected : ' . mysql_error());
}

// make foo the current db
$db_selected = mysql_select_db($database, $link);
if (!$db_selected) {
    die ('Can't use '.$database.' : ' . mysql_error());
}

$sql = "CREATE TABLE userloginstatus
(
id_client varchar(15),
user_status int
)";

mysql_query($sql);
mysql_query("ALTER TABLE callscallshop ADD paid INT NOT NULL DEFAULT 0;");
mysql_query("UPDATE callscallshop SET paid=1;");
mysql_close($link);
?>
