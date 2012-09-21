<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>Hosted CallShop System</TITLE>
  <link href="style.css" rel="stylesheet" type="text/css" />
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">

<script type="text/javascript">
function validForm()
{
	document.myForm.submit();
	if(document.myForm.stime.value == "") {
		alert("Please enter the value");
		document.myForm.stime.focus();
		return false;
	}
	document.myForm.action="registration.php";
	document.myForm.submit();
}
</script>
 </HEAD>

 <BODY>
 <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
    <td align="center">
    <?php
	$path = $_SERVER['DOCUMENT_ROOT'];
	$path .= "/JoodCallshop_dev/topheader.php";
	//include_once($path);
	?>
    </td>
  </tr>
  <tr><td>
 <form name="myForm.php" action="" method="post">
  Enter the time <input type="text" name="stime" /><br />
  <input type="submit" value="Submit" />
</form>
</td></tr>
<?php

IF($_POST<>""){
$myFile = "constant.php";
$fh = fopen($myFile, 'w') or die("can't open file");
$stringData = "<?php\n";
fwrite($fh, $stringData);
$stringData = "$"."settime=".$_POST[stime].";\n";
fwrite($fh, $stringData);
$stringData = "?>";
fwrite($fh, $stringData);
fclose($fh);
}
?>
 <tr><td>

 </td></tr>
</table>


</BODY>
</HTML>