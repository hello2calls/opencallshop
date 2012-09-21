<?php
$successmsg='';
if(isset($_POST['save']) && ($_POST['timeframe']!=''))
{
	$refreshtime=$_POST['timeframe'];
$somecontent='<?php ';
$somecontent .=' define("REFRESHTIME","'.$refreshtime.'");';
$somecontent.=' ?>';

	$filename = "./constant.php";
	if (!$handle = fopen($filename, 'w+')) {
		 echo "Cannot open file ($filename)";
		 exit;
	}
	
	// Write $somecontent to our opened file.
	if (fwrite($handle, $somecontent) === FALSE) {
		echo "Cannot write to file ($filename)";
		exit;
	}
	
	$successmsg='Your record has been updated.';
	
	fclose($handle);

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
<?php include('header.php');
?>
<tr>
<?php include('left.php');?>
<td width="69%" align="left">
	<div class="contents"><?php if($successmsg!=''){echo '<strong>'.$successmsg.'</strong>';}?>
	<form name="frmsetting" method="post" action="">
	<h1>Site Setting</h1><br/>
	<p>Note: 1 second =1000 milisecond,please specify on millisecond.</p>
	<strong>Refresh Time:</strong>&nbsp;<input type="text" name="timeframe" maxlength="20"/>&nbsp; millisecond
	<input type="submit" name="save" value="Save" title="Save Your Setting"/><br/>
	</form>
	</div>
</td>
</tr>
<?php include('footer.php');?>
</table>
</body>
</html>