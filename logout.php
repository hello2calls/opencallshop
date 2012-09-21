<?php
ob_start();
include 'config.php';
include dirname(__FILE__).'\libdir\database.php';
include dirname(__FILE__).'\libdir\common.inc';
$sql2 = "UPDATE userloginstatus SET user_status='0' WHERE id_client='".$_SESSION['id_callshop']."'";
$query_result2 = execute($sql2);
// Finally, destroy the session.
session_destroy();
header("Location: ./index.php");
exit;
?>