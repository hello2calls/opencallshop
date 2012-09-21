<?php
@session_start();
ob_start();
if(isset($_SESSION['admin_name']) && isset($_SESSION['admin_pwd']))
{	
unset($_SESSION['admin_name']);
unset($_SESSION['admin_pwd']);
//session_destroy();
header("Location: login.php");
exit;
}
?>