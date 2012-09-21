<?php
ob_start(); 
@session_start();
require_once 'config.php';
include('./admin/pagetitle.php');
include('./admin/footertext.php');

if(!isset($_SESSION['lang'])){
$_SESSION['lang'] = "eng";
}
$prelang = $_SESSION['lang'];

if(isset($_POST['changelang']))
{
	$_SESSION['lang']=$_POST['changelang'];
}
else
{
	$_SESSION['lang']=$prelang;
}

if($_SESSION['lang']=='eng')
{
require('./lang/english.php');
$footer_text = ENG_FOOTER_TEXT;
$page_title = ENG_PAGE_TITLE ;
}else{
require('./lang/arb.php');
	$footer_text = ARB_FOOTER_TEXT;
	$page_title = ARB_PAGE_TITLE ;
}

// Is the user already logged in? Redirect him/her to the private page

if($_SESSION['username'])
{
	header("Location: myhome.php");
	exit;
}


if(isset($_POST['login']))
{
$do_login = true;
include_once 'do_login.php';
}
?>
<?php
ob_start();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php
if($_SESSION['lang']=='eng')
{
?><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr"><?php
}else{
?><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ar" lang="ar" dir="rtl"><?php
}
?>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type=text/javascript language=javascript>

function switchlang(lang)
{
	document.getElementById('changelang').value=lang;
	document.frmlang.submit();
}
</script>

<title><?php echo $page_title ;?></title>
<link href="style.css" rel="stylesheet" type="text/css" />
<STYLE TYPE="text/css">

#error_notification
{
border: 1px #A25965 solid;
height: auto;
padding: 4px;
background: #F8F0F1;
text-align: center;
-moz-border-radius: 5px;
}

/* BR */

br { clear: left; }
-->
</STYLE>

</HEAD>
</head>
<body>
<table width="724" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/spacer.gif" width="1" height="50" /></td>
  </tr>
  <tr>
    <td align="left"><img src="images/logo.jpg" border="0" /></td>
  </tr>

	<tr>
		<td><form action="" method="post" name="frmlang"/><input type="hidden" id="changelang" name="changelang" value="<?php echo $_SESSION['lang'];?>"/>
		<a href="javascript:void(0);" onclick="switchlang('eng')"><?php echo ENGLISH ;?></a> | <a href="javascript:void(0);" onclick="switchlang('arb')"><?php echo ARABIC ;?></a>
		</form>
		</td>
	</tr>
  <tr>
    <td><img src="images/login-theme_05.gif" width="724" height="16" /></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
<?php
if($_SESSION['lang']=='eng')
{
?>
		 <td background="images/login-theme_06.gif"><img src="images/login-theme_06.gif" width="21" height="1" /></td>
<?php
}else{

?>
<td background="images/login-theme_08.gif"><img height="1" width="18" src="images/login-theme_08.gif"></td>
<?php
}
?>

        <td width="100%" align="center" bgcolor="#FFFFFF"><table width="292" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><img src="images/login-theme_12.gif" width="292" height="76" /></td>
          </tr>
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td background="images/login-theme_14.gif"><img src="images/login-theme_14.gif" width="4" height="1" /></td>
                <td width="100%">
				<form name="login" method="post" action="index.php"> 

<?php
if($login_error)
{
echo '<div id="error_notification">The submitted login info is incorrect.</div>';
}
?>                           
                <table width="100%" border="0" cellspacing="0" cellpadding="4">
                  <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td align="right"><span class="style8"><?php echo username ;?></span></td>
                    <td><input name="username" type="text" class="txtBox" id="username" size="16" maxlength="150" /></td>
                  </tr>
                  <tr>
                    <td align="right"><span class="style8"><?php echo password ;?></span></td>
                    <td><input name="password" type="password" class="txtBox" id="password" size="19" maxlength="100" /></td>
                  </tr>
                  <tr>
                    <td align="right"><span class="style8"><?php echo usertype ;?></span></td>
                    <td><select name="usertype" class="txtBox" id="usertype">
                            <option value="2"><?php echo USER_PASS ;?></option>
                            <option value="8"><?php echo IVR_CLIENT ;?></option>
                            <option value="1"><?php echo PC2_PHONE ;?></option>
                            <option value="0"><?php echo IP_TERM ;?></option>
							<option value="3"><?php echo RETAIL ;?></option>
                            <option value="9" selected="selected"><?php echo CALL_USER ;?></option>
                          </select></td>
                  </tr>
				  <tr>
                    <td colspan="2" align="center"><input type="checkbox" name="autologin" value="1"><?php echo remember ;?><br /></td>
                    </tr>
                  <tr>
                  <tr>
                    <td colspan="2" align="center"><input name="login" type="submit" class="login" id="btnLogin" value="<?php echo login ;?>" />
                   <input name="Reset" type="reset" class="login" id="btnReset" value="<?php echo resett ;?>" />
				   <input type="hidden" id="changelang" name="changelang" value="<?php echo $_SESSION['lang'];?>"/>
				   </td>
                    </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                </table>
                </form>
                </td>
                <td background="images/login-theme_16.gif"><img src="images/login-theme_16.gif" width="3" height="1" /></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td align="center"><img src="images/login-theme_19.gif" width="289" height="13" /></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table></td>
<?php
if($_SESSION['lang']=='eng')
{
?>
<td background="images/login-theme_08.gif"><img height="1" width="18" src="images/login-theme_08.gif"></td>
<?php
}else{

?>
<td background="images/login-theme_06.gif"><img height="1" width="21" src="images/login-theme_06.gif"></td>
<?php
}
?>
 </tr>
    </table></td>
  </tr>
  <tr>
    <td><img src="images/login-theme_21.gif" width="724" height="15" /></td>
  </tr>
</table>
<p align="center" class="style1"><?php echo $footer_text ;?></p>
</body>
</html>

<?php ob_flush();?>
