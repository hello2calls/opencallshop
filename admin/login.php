<?php
@session_start();

if($_SESSION['admin_name'])
{
header("Location: index.php");
exit;
}
include("login_constant.php");
// Is the user already logged in? Redirect him/her to the private page
if(isset($_POST['admin_login']))
{
	if($_POST['admin_name']<>"" && $_POST['admin_pwd']<>"" && $_POST['admin_name']==$username && $_POST['admin_pwd']==$password){
		$_SESSION['admin_name'] = $username;
        $_SESSION['admin_pwd'] = $password;
		header("Location: index.php");
		}
	else{
	$msg = "Please enter the valid username and password for admin login and try again.";
	}
}
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
<tr class="headerbg">
<td colspan="2" align="left" height="100"><img border="0" src="../images/logo_iner.jpg"></td>
</tr>
<tr>
<td align="center" class="leftpanel">
	<div class="contents">
	<?php
	if(isset($msg) && $msg<>""){
	echo $msg;
	}else{
	echo "Enter the valid username and password for admin login.";
	}
	?>
	<form name="login" method="post" action="">                       
                <table width="100%" border="0" cellspacing="0" cellpadding="4">
                  <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td align="right"><span class="style8">Username:</span></td>
                    <td><input name="admin_name" type="text" class="txtBox" id="admin_name" size="16" maxlength="20" /></td>
                  </tr>
                  <tr>
                    <td align="right"><span class="style8">Password:</span></td>
                    <td><input name="admin_pwd" type="password" class="txtBox" id="admin_pwd" size="16" maxlength="12" /></td>
                  </tr>
                  <tr>
                  <tr>
                    <td colspan="2" align="center"><input name="admin_login" type="submit" class="login" id="btnLogin" value="Login" />
                   </td>
                    </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                </table>
                </form>
	</div>
</td>
</tr>
</table>
</body>
</html>