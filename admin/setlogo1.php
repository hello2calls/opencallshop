<?php

$successmsg='';
$target_path = "uploads/";
$target_path = $target_path . basename( $_FILES['uploadedfile']['name']); 
$allowedExtensions = array("gif","jpeg","pjpeg","jpg"); 


if(isset($_POST['save']))
print_r($_FILES);
{
if ((($_FILES["uploadedfile"]["type"] == "image/gif")
|| ($_FILES["uploadedfile"]["type"] == "image/jpeg")
|| ($_FILES["uploadedfile"]["type"] == "image/pjpeg"))
&& ($_FILES["uploadedfile"]["size"] < 20000))
  {
	  if(move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $target_path)) {
		$successmsg = "The file ".  basename( $_FILES['uploadedfile']['name']). 
		" has been uploaded";
	} else{
		$successmsg = "There was an error uploading the file, please try again!";
	}
  }else
  {
 $successmsg = "Invalid file";
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
<?php include('header.php');
?>
<tr>
<?php include('left.php');?>
<td width="69%" align="left">
	<div class="contents"><?php if($successmsg!=''){echo '<strong>'.$successmsg.'</strong>';}?>
	<h1>Set Logo</h1><br/>
	<form action="" method="post"
	enctype="multipart/form-data">
	<strong>Filename:</strong>
	<input type="file" name="uploadedfile" id="uploadedfile" />
	<br /><br />
	<input type="submit" name="save" value="Save" />
	</form>
	</div>
</td>
</tr>
<?php include('footer.php');?>
</table>
</body>
</html>