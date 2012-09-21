<?php

$successmsg='';
if(isset($_POST['save']))
{
if($_POST['eng_footer_text']!='' && $_POST['arb_footer_text']!='')
	{
	$footer_eng=$_POST['eng_footer_text'];
	$footer_arb=$_POST['arb_footer_text'];
	$somecontent='<?php ';
	$somecontent .=' define("ENG_FOOTER_TEXT","'.$footer_eng.'");';
	$somecontent .=' define("ARB_FOOTER_TEXT","'.$footer_arb.'");';
	$somecontent.=' ?>';

	$filename = "./footertext.php";
	if (!$handle = fopen($filename, 'w+')) {
		 echo "Cannot open file ($filename)";
		 exit;
	}
	
	// Write $somecontent to our opened file.
	if (fwrite($handle, $somecontent) === FALSE) {
		echo "Cannot write to file ($filename)";
		exit;
	}
	
	$successmsg='Footer text has been updated.';
	
	fclose($handle);
}else{
$successmsg='Change footer text in both languages.';
}
}
include('./footertext.php');
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
?>
<tr>
<?php include('left.php');?>
<td width="69%" align="left">
	<div class="contents"><?php if($successmsg!=''){echo '<strong>'.$successmsg.'</strong>';}?>
	<form name="frmsetting" method="post" action="">
	<h1>Footer Text</h1><br/>
	<strong>English</strong>&nbsp;<input type="text" value="<?php echo ENG_FOOTER_TEXT ;?>" size="90" name="eng_footer_text" maxlength="150"/>&nbsp; 
	<br/><br/>
	<strong>Arabic</strong>&nbsp;&nbsp;<input type="text" value="<?php echo ARB_FOOTER_TEXT ;?>" size="90" name="arb_footer_text" maxlength="150"/>&nbsp;<br/>
	<input type="submit" name="save" value="Save" title="Save Your Setting"/>
	</form>
	</div>
</td>
</tr>
<?php include('footer.php');?>
</table>
</body>
</html>