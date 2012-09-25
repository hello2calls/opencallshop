<?php
session_start();
print_r($_SESSION);
$link = mysql_connect("localhost","root","dbpassword");
if (!$link) {
    die('Not connected : ' . mysql_error());
}

// make foo the current db
$db_selected = mysql_select_db('voipswitch', $link);
if (!$db_selected) {
    die ('Can\'t use voipswitch : ' . mysql_error());
}
$result = mysql_query("select * from clientsshared limit 10");

while ($row = mysql_fetch_assoc($result)) {
   print '<pre>';print_r($row);
}

mysql_free_result($result);
?>
