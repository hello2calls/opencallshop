<?php
$db_user="joodcs";
$db_pass="2565jood64";
$database="voipswitch";
$db_host="69.28.212.74";
$link = mysql_connect($db_host, $db_user,$db_pass);
if (!$link) {
    die('Not connected : ' . mysql_error());
}

// make foo the current db
$db_selected = mysql_select_db($database, $link);
if (!$db_selected) {
    die ('Can\'t use '.$database.' : ' . mysql_error());
}
echo "hello";
$sql = "CREATE TABLE userloginstatus
(
id_client varchar(15),
user_status int
)";
// Execute query
//mysql_query($sql,$link);

$res = mysql_query('SHOW TABLES');
while($row = mysql_fetch_array($res)) {
   print_r($row);
}

?>