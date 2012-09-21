<?php 
$successmsg='';
ini_set("memory_limit", "200000000"); // for large images so that we do not get "Allowed memory exhausted"?>
<?php
// upload the file
if ((isset($_POST["submitted_form"])) && ($_POST["submitted_form"] == "image_upload_form") && $_FILES['image_upload_box']['name']<>"") 

{
	// file needs to be jpg,gif,bmp,x-png and 4 MB max
	if (($_FILES["image_upload_box"]["type"] == "image/jpeg" || $_FILES["image_upload_box"]["type"] == "image/pjpeg" || $_FILES["image_upload_box"]["type"] == "image/gif" || $_FILES["image_upload_box"]["type"] == "image/x-png") && ($_FILES["image_upload_box"]["size"] < 4000000)){
	
			$file_name = basename( $_FILES['image_upload_box']['name']); 
			$somecontent='<?php ';
			$somecontent .=' define("LOGO_NAME","'.$file_name.'");';
			$somecontent.=' ?>';

			$filename = "./logoname.php";
			if (!$handle = fopen($filename, 'w+')) {
				 echo "Cannot open file ($filename)";
				 exit;
			}
			
			// Write $somecontent to our opened file.
			if (fwrite($handle, $somecontent) === FALSE) {
				echo "Cannot write to file ($filename)";
				exit;
			}
			
			fclose($handle);

			  
		// some settings
		$max_upload_width = 2592;
		$max_upload_height = 1944;

		// if user chosed properly then scale down the image according to user preferances
		if(isset($_REQUEST['max_width_box']) and $_REQUEST['max_width_box']!='' and $_REQUEST['max_width_box']<=$max_upload_width){
			$max_upload_width = $_REQUEST['max_width_box'];
		}    
		if(isset($_REQUEST['max_height_box']) and $_REQUEST['max_height_box']!='' and $_REQUEST['max_height_box']<=$max_upload_height){
			$max_upload_height = $_REQUEST['max_height_box'];
		}		
		// if uploaded image was JPG/JPEG
		if($_FILES["image_upload_box"]["type"] == "image/jpeg" || $_FILES["image_upload_box"]["type"] == "image/pjpeg"){	
			$image_source = imagecreatefromjpeg($_FILES["image_upload_box"]["tmp_name"]);
		}		
		// if uploaded image was GIF
		if($_FILES["image_upload_box"]["type"] == "image/gif"){	
			$image_source = imagecreatefromgif($_FILES["image_upload_box"]["tmp_name"]);
		}	
		// BMP doesn't seem to be supported so remove it form above image type test (reject bmps)	
		// if uploaded image was BMP
		if($_FILES["image_upload_box"]["type"] == "image/bmp"){	
			$image_source = imagecreatefromwbmp($_FILES["image_upload_box"]["tmp_name"]);
		}			
		// if uploaded image was PNG
		if($_FILES["image_upload_box"]["type"] == "image/x-png"){
			$image_source = imagecreatefrompng($_FILES["image_upload_box"]["tmp_name"]);
		}
		$remote_file = "image_files/".$_FILES["image_upload_box"]["name"];
		imagejpeg($image_source,$remote_file,100);
		chmod($remote_file,0644);	

		// get width and height of original image
		list($image_width, $image_height) = getimagesize($remote_file);
	
		if($image_width>$max_upload_width || $image_height >$max_upload_height){
			$proportions = $image_width/$image_height;
			
			if($image_width>$image_height){
				$new_width = $max_upload_width;
				$new_height = round($max_upload_width/$proportions);
			}		
			else{
				$new_height = $max_upload_height;
				$new_width = round($max_upload_height*$proportions);
			}		
			
			
			$new_image = imagecreatetruecolor($new_width , $new_height);
			$image_source = imagecreatefromjpeg($remote_file);
			
			imagecopyresampled($new_image, $image_source, 0, 0, 0, 0, $new_width, $new_height, $image_width, $image_height);
			imagejpeg($new_image,$remote_file,100);
			
			imagedestroy($new_image);
		}
		
		imagedestroy($image_source);

	}else{
		$successmsg = "make sure the file is jpg, gif or png and that is smaller than 4MB";
		//header("Location: submit.php?upload_message=make sure the file is jpg, gif or png and that is smaller than 4MB&upload_message_type=error");		
		//exit;
	}
}


else{

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
	<div class="contents">

        <?php if(isset($_REQUEST['upload_message'])){ echo htmlentities($_REQUEST['upload_message']);
		}?>
	<h1>Set Logo</h1><br/>
<form action="setlogo.php" method="post" enctype="multipart/form-data" name="image_upload_form" id="image_upload_form" style="margin-bottom:0px;">
	<strong>Filename:</strong>	
	  <input name="image_upload_box" type="file" id="image_upload_box" size="40" /><br /> 
      <label>Scale down image? (2592 x 1944 px max):</label>
      <br />
      <input name="max_width_box" type="text" id="max_width_box" value="272" size="4">
      x      
      <input name="max_height_box" type="text" id="max_height_box" value="73" size="4">
      px.
	  <br /><br /><input type="submit" name="submit" value="Upload image" /> 
	  	<br />    
	  <input name="submitted_form" type="hidden" id="submitted_form" value="image_upload_form" />
	</form>
	</div>
</td>
</tr>
<?php include('footer.php');?>
</table>
</body>
</html>
<?php if(isset($_REQUEST['show_image']) and $_REQUEST['show_image']!=''){?>
<p>
	<img src="image_files/<?php echo $_REQUEST['show_image'];?>" />
</p>
<?php }?>
</body>
</html>


