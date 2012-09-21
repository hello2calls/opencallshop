<?php
require("./class.phpmailer.php");
$mail = new PHPMailer();
$mail->IsSMTP();                                
$mail->Host     = "localhost"; 
//$mail->Host     = "mail.joodtelecomgroup.com"; 
$mail->SMTPAuth = false;   
//$mail->Username = "team@joodtelecomgroup.com";  
//$mail->Password = "fidelpiero";
?>
