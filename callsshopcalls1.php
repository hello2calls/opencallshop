<table border="0" cellspacing="0" cellpadding="0" class="tablebg">
      <tr>        
        <td width="100%" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="10">
          <tr>
            <td>

<?php
@session_start();
include dirname(__FILE__).'\libdir\database.php';
include dirname(__FILE__).'\libdir\common.inc';

if($_SESSION['lang']=='eng')
{
require('./lang/english.php');
}else{
require('./lang/arb.php');
}

$sql1 = "select * from callshopusers where id_callshop=".$_SESSION['id_callshop']."";
//$result_for_sql2 = mysql_query($sql1, $con);
$result_for_sql2 = execute($sql1, 1);

print ("<table width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"4px\" cellspacing=\"0\"><tr>");	
$round = 1;
$str=0;
while ( $data_for_sql2 = mysql_fetch_array($result_for_sql2, MYSQL_ASSOC))
{
	$sql2 = "select * from clientse164 where id_client=".$data_for_sql2["id_client"]."";
	//$result_new = mysql_query($sql2, $con);
	$result_new = execute($sql2, 1);
	
	if (mysql_num_rows($result_new) > 0 ) 
	{		
		
		while ($data_new = mysql_fetch_array($result_new, MYSQL_ASSOC)) 
		{
			
			$IsUnpaid = "SELECT SUM(duration) as sum FROM callscallshop c WHERE paid = 0 AND id_client = ".$data_new["id_client"].' GROUP BY id_client';
			$IsUnpaid= execute($IsUnpaid, 1);
			$CntUnpaid = mysql_num_rows($IsUnpaid );

			$te_live = "SELECT * FROM callshopcurrentcalls_list c where ani=\"".$data_new["login"]."\"";
			//$result_live = mysql_query($sql_live, $con);
			$te_live = execute($te_live, 1);

			if (mysql_num_rows($te_live ) == 0 )
				$callbg='callbg';
			else
				$callbg='activecallbg';

			print ("<td>");
			print ("<table width=\"300\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"".$callbg."\">
			  <tr>
				<td valign=\"top\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">
				  <tr>
					<td width=\"158\" height=\"48\" valign=\"top\" align=\"left\"><div id=\"c_t_2\">".$data_new["login"]."</div>");
			if( $CntUnpaid != 0)
			{
				$row =  mysql_fetch_array($IsUnpaid);
				print("<div class='notice ".$_SESSION['lang']."'>".MY_UNPAID_CALLS."</div>");
//				print("<form name='formID' method='post' action='' style='padding-left:25px;'>");
//				print("<input type='text' size=4 name='total' value=".$row['cost']."> ");
//				print("<input name='pay' type='submit' id='pay' value=\"".PAY."\">");
//				print("</form>");
			}

				print("</td>
					<td width=\"147\" height=\"48\" valign=\"top\" style='position:relative;'>					
					<div id=\"c_t_3\"><LABEL onClick=\"OpenLinknew('ctariff','".base64_encode($data_new["id_client"].'client')."');\" style=\"cursor:pointer;\">".SELLINGTERRIF."</LABEL></div>");


			print(	"</td>
				  </tr>
			</table></td>
			  </tr>
			  <tr>
				<td height=\"84\" valign=\"top\"><div id=\"c_t_4\">");
			$sql_live = "SELECT * FROM callshopcurrentcalls_list c where ani=\"".$data_new["login"]."\"";
			//$result_live = mysql_query($sql_live, $con);
			$result_live = execute($sql_live, 1);			
					/*print("<div id=\"live\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\">
					  <tr>
						<td width=\"24\"><img src=\"images/hourglass.png\" /></td>
						<td width=\"100%\">Duration: </td>
						<td class=\"live_call\">
							<input type='hidden' id=\"startdate".$str."\" value=\"".date('F j Y H:i:s',strtotime('-'.($str+1).' day'))."\"/>
							<div id=\"cpcontainer".$str."\"></div>							
						</td>
					  </tr>
					  <tr>
						<td width=\"24\"><img src=\"images/telephone.png\" /></td>
						<td width=\"100%\">Dialed No.: </td>
						<td class=\"dailed_no\">12332222112</td>
					  </tr>
					</table>");
					print ("</div>");*/
			if (mysql_num_rows($result_live) == 0 ){
				print("<div id=\"no_live\">".NOCALL."</div>");				
			} else {
				$ctr=0;
				while ($data_live = mysql_fetch_array($result_live, MYSQL_ASSOC)) {				
					$start = date("F j Y H:i:s",strtotime($data_live["call_start"]));
					print("<div id=\"live\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\">
					  <tr>
						<td width=\"24\"><img src=\"images/hourglass.png\" /></td>
						<td width=\"100%\">Duration: </td>
						<td class=\"live_call\">
							<input type='hidden' id=\"startdate".$str."\" value=\"".$start."\"/>
							<div id=\"cpcontainer".$str."\"></div>							
						</td>
					  </tr>
					  <tr>
						<td width=\"24\"><img src=\"images/telephone.png\" /></td>
						<td width=\"100%\">Dialed No.: </td>
						<td class=\"dailed_no\">".$data_live["dialed_number"]."</td>
					  </tr>
					</table>");
					print ("</div>");
					$ctr++;
				}
			}

			print ("</div>");
			$quer2 = "SELECT SUM(cost) as costs  FROM callscallshop c WHERE paid = 0 AND id_client = ".$data_new["id_client"]." GROUP BY id_client ";
			$resul2 = mysql_query($quer2);
			$row = mysql_fetch_array($resul2);
			
			echo "<div id='summary' style='display:none;'>".$row['costs']."</div>";
			print("<form action='' method='post' id='PayAllForm'><input type='text' name='sum' value='".$row['costs']."' /> ".
					"<input type='hidden' value='".$data_new['id_client']."' name='id' />".
					"<input type='submit' value='".PAY."' /></form></td></tr>");
			print("<tr>
				<td height=\"48\" valign=\"top\">
				<div id=\"c_t_5\">
				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">
				  <tr>
					<td style='vertical-align:top;'>
						<form id=\"form1\" name=\"form1\" method=\"post\" action=\"callshis.php\" target=\"_blank\">
						<input type=\"hidden\" name=\"username\" id=\"hiddenField\" value=\"".$username."\"/>
						<input type=\"hidden\" name=\"password\" id=\"hiddenField\" value=\"".$password."\"/>
						<input type=\"hidden\" name=\"usertype\" id=\"hiddenField\" value=\"".$usertype."\"/>
						<input type=\"hidden\" name=\"c_id\" id=\"hiddenField\" value=\"".$data_new["id_client"]."\"/>
						<input type=\"button\" name=\"button\" id=\"button\" value=\"".CALLHISTORY."\" onclick=\"PopupCenter('callshis.php?id_client=".$data_new["id_client"]."', 'myPop1',1000,400);\" style=\"float:left;margin-left:40px\"/>
						</form>
					</td>
					<td style='vertical-align:top;'>
						<form id=\"form2\" name=\"form2\" method=\"post\" action=\"unpaidcalls.php\" target=\"_blank\">
						<input type=\"hidden\" name=\"username\" id=\"hiddenField\" value=\"".$username."\"/>
						<input type=\"hidden\" name=\"password\" id=\"hiddenField\" value=\"".$password."\"/>
						<input type=\"hidden\" name=\"usertype\" id=\"hiddenField\" value=\"".$usertype."\"/>
						<input type=\"hidden\" name=\"c_id\" id=\"hiddenField\" value=\"".$data_new["id_client"]."\"/>
						<input type=\"button\" name=\"button\" id=\"button\" value=\"".LASTCALL."\" onclick=\"PopupCenter('unpaidcalls.php?id_client=".$data_new["id_client"]."', 'myPop1',1000,400);\" />
						</form>						
					</td>


				  </tr>
				</table>
				</div>
				</td>
			  </tr>
			</table>");
			if($round % 3 == 0){
				print("</tr><tr>");
			}
		$round++;$str++;
		}		
	}
}
print ("</tr></table>");
//print ("<meta HTTP-EQUIV=\"REFRESH\" content=\"$refreshtime; url=callsshopcalls.php?username=$username&usertype=$usertype\">");
?>

            </td>
          </tr>
        </table>
        </td>
      
      </tr>
    </table>
