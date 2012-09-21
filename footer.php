<?php
@session_start();
include('./admin/footertext.php');
if($_SESSION['lang']=='eng')
{
$footer_text = ENG_FOOTER_TEXT;
}else{
$footer_text = ARB_FOOTER_TEXT;
}
?>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="images/<?php echo $_SESSION["theme_11"];?>" border="0"/></td>
        <td width="100%" align="center" background="images/site-theme_12.gif"><p align="center" class="style1"><?php echo $footer_text ;?></p></td>
        <td><img src="images/<?php echo $_SESSION["theme_14"];?>" border="0"/></td>
      </tr>
    </table>