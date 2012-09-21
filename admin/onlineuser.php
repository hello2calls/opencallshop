<?php
@session_start();
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Hosted CallShop System:Administator Panel</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="layout">
<?php include('header.php');
include '../libdir/database.php';
//include '..\..\libdir\common.inc';
?>
<tr>
<?php 
include('left.php');
///////Code from database.php and common.inc///////////////////

function mysql_real_escape_array($t){
    global $db_handle;
        if (!$db_handle) {dbconnect();}    	
    return array_map("mysql_real_escape_string",$t);
} 

function execute($query, $error=0)
{
        global $message,$database;
        global $db_handle;
        if (!$db_handle) {dbconnect();}
	
        $AllData = mysql_db_query($database,$query);
        if (mysql_errno())
         {
               // print "<br> Error in query: $query <br> -->Error:".mysql_error()."<hr><a href=javascript:history.back()>Back</a>";
                exit;
                }
 
         return $AllData;
}

function dbconnect(){
        global $db_handle,$db_user,$db_host,$db_pass;
        global $message;
        $db_handle = @mysql_pconnect($db_host,$db_user,$db_pass);

        if (!$db_handle) {
                $message = mysql_error();
                return 0;
        } else {
 
                return 1;
 
        }
}
///////Code from database.php and common.inc  End///////////////////



$sql = "select * from `userloginstatus` WHERE id_client='".$_SESSION['id_callshop']."'";
$query_result = execute($sql, 1);	
$a = mysql_num_rows($query_result);
//$data = mysql_fetch_array($query_result,MYSQL_ASSOC);
//print_r($data);
?>
<td width="69%" align="left">
	<div class="contents"><?php if($successmsg!=''){echo '<strong>'.$successmsg.'</strong>';}?>
	<form name="frmsetting" method="post" action="">
	<h1>Online Users</h1><br/>
	<strong></strong><input type="text" name="userstatus" readonly="readonly"  value="<?php echo  $a;?>" maxlength="10"/>
	</form>
	</div>
</td>
</tr>
<?php include('footer.php');?>
</table>
</body>
</html>