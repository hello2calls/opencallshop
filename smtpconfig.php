<?php
require("./class.phpmailer.php");
$mail = new PHPMailer();
$mail->IsSMTP();                                
$mail->Host     = "localhost"; 
//$mail->Host     = "locahost"; 
$mail->SMTPAuth = false;   
//$mail->Username = "none";  
//$mail->Password = "none";
?>
