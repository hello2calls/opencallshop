<?php
ini_set('display_errors', 'Off');
include('topheader.php');
include('nnpclass.php');
$n = new npp;
$msg = "";

if($_POST){
//print_r($_POST);
include("smtpconfig.php");

if($_POST['name']<>"" && $_POST['email']<>"" && $_POST['comments']<>""){

	$from = $_POST['email'];
	$name = $_POST['name'];
	$body = $_POST['comments'];

	$mail->From     = $from;
	$mail->FromName = $name ;
	
	$mail->WordWrap = 50;                             // set word wrap
	 
	$mail->IsHTML(true);                               // send as HTML

    $mail->AddAddress("callfw@gmail.com");


	$mail->Subject  =  "Technical Support";
	$mail->Body     =  $body;
	//$mail->AltBody  =  "This is the text-only body";

	if(!$mail->Send())
	{
	   $msg =  "Message was not sent <p>";
	   $msg = "Mailer Error: " . $mail->ErrorInfo;	  
	}else{
	$msg = MSG_SENT;
	}
}

}
?>




<script language = "Javascript">
/**
 * DHTML email validation script. Courtesy of SmartWebby.com (http://www.smartwebby.com/dhtml/)
 */

function echeck(str) {

		var at="@"
		var dot="."
		var lat=str.indexOf(at)
		var lstr=str.length
		var ldot=str.indexOf(dot)
		if (str.indexOf(at)==-1){
		   alert("Invalid E-mail ID")
		   return false
		}

		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
		   alert("Invalid E-mail ID")
		   return false
		}

		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
		    alert("Invalid E-mail ID")
		    return false
		}

		 if (str.indexOf(at,(lat+1))!=-1){
		    alert("Invalid E-mail ID")
		    return false
		 }

		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    alert("Invalid E-mail ID")
		    return false
		 }

		 if (str.indexOf(dot,(lat+2))==-1){
		    alert("Invalid E-mail ID")
		    return false
		 }
		
		 if (str.indexOf(" ")!=-1){
		    alert("Invalid E-mail ID")
		    return false
		 }

 		 return true					
	}

function ValidateForm(){
	var emailID=document.form1.email

	var x=document.forms["form1"]["name"].value

	if (x==null || x=="")
	  {
	  alert("Please Enter your Name");
	  return false;
	  }
	
	if ((emailID.value==null)||(emailID.value=="")){
		alert("Please Enter your Email ID")
		emailID.focus()
		return false
	}
	if (echeck(emailID.value)==false){
		emailID.value=""
		emailID.focus()
		return false
	}
	return true
 }
</script>



  <tr>
        <td><table border="0" cellspacing="0" cellpadding="0" class="tablebg">
      <tr>       
        <td width="100%" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="10">
          <tr>
            <td>
            <table width="95%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="25%" valign="top"><h3><?php echo TECH_SUPPORT ; ?></h3></td>
                <td width="75%" align="center">
				<?php
				if(!empty($msg)){
				echo "<b>".$msg."</b>";
				}
				?>
				</td>
              </tr>
            </table>
			<table width="95%" border="0" cellspacing="0" cellpadding="3" align="center">
            	<tr>
                	<td align=\"right\">
                    
                   <form name="form1" action="" method="post" onsubmit="return ValidateForm()">
                   <table border="1" cellspacing="0" cellpadding="3" align="center" style="border-collapse:collapse">
                    <tr>
                      <td class="topt"><?php echo NAME ; ?></td><td><input type="text" size="30" name="name"></td></tr>
                    <tr>
                      <td class="topt"><?php echo EMAIL ; ?></td><td><input type="text" size="30" name="email"></td></tr>
                    <tr>
                      <td valign="top" class="topt"><?php echo MESSAGE ; ?></td><td><textarea name="comments" rows="6" cols="30"></textarea></td></tr>
                    <tr><td colspan="2" align="center"><input type="submit" value="Send">
                    </td></tr>
                   </table>
                   </form>                                     
                    </td>
				</tr>
			</table>
            </td>
          </tr>
        </table>
        </td>
       
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><?php include('footer.php');?></td>
  </tr>
</table>
</body>
</html>
