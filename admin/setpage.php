<?php

$successmsg='';
if(isset($_POST['save']))
{
if($_POST['eng_pagetitle']!='' && $_POST['arb_pagetitle']!='')
	{
	$pagetitle1=$_POST['eng_pagetitle'];
	$pagetitle2=$_POST['arb_pagetitle'];
	$somecontent='<?php ';
	$somecontent .=' define("ENG_PAGE_TITLE","'.$pagetitle1.'");';
	$somecontent .=' define("ARB_PAGE_TITLE","'.$pagetitle2.'");';
	$somecontent.=' ?>';

	$filename = "./pagetitle.php";
	if (!$handle = fopen($filename, 'w+')) {
		 echo "Cannot open file ($filename)";
		 exit;
	}
	
	// Write $somecontent to our opened file.
	if (fwrite($handle, $somecontent) === FALSE) {
		echo "Cannot write to file ($filename)";
		exit;
	}
	
	$successmsg='Page title has been updated.';
	
	fclose($handle);
}else{
$successmsg='Change your Page title in both languages.';
}
}
include('./pagetitle.php');
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
	<h1>Page Title</h1><br/>
	<strong>English</strong>&nbsp;<input type="text" value="<?php echo ENG_PAGE_TITLE ;?>" size="90" name="eng_pagetitle" maxlength="150"/>&nbsp; 
	<br/><br/>
	<strong>Arabic</strong>&nbsp;&nbsp;<input type="text" value="<?php echo ARB_PAGE_TITLE ;?>" size="90" name="arb_pagetitle" maxlength="150"/>&nbsp;<br/>
	<input type="submit" name="save" value="Save" title="Save Your Setting"/>
	</form>
	</div>
</td>
</tr>
<?php include('footer.php');?>
</table>
</body>
</html>