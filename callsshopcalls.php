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

while ( $data_for_sql2 = mysql_fetch_array($result_for_sql2, MYSQL_ASSOC)) {

	$sql2 = "select * from clientsshared where id_client=".$data_for_sql2["id_client"]."";
	//$result_new = mysql_query($sql2, $con);
	$result_new = execute($sql2, 1);
	
	if (mysql_num_rows($result_new) > 0 ) {		
		while ( $data_new = mysql_fetch_array($result_new, MYSQL_ASSOC)) {
			$te_live = "SELECT * FROM callshopcurrentcalls_list c where ani=\"".$data_new["login"]."\"";
			//$result_live = mysql_query($sql_live, $con);
			$te_live = execute($te_live, 1);
			if (mysql_num_rows($te_live ) == 0 ){ $callbg='callbg';
			}else{$callbg='activecallbg';}
			print ("<td>");
			print ("<table width=\"300\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"".$callbg."\">
			  <tr>
				<td valign=\"top\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">
				  <tr>
					<td width=\"158\" height=\"48\" valign=\"top\" align=\"left\"><div id=\"c_t_2\">".$data_new["login"]."</div></td>					
					<td width=\"147\" height=\"48\" valign=\"top\"><div id=\"c_t_3\"><LABEL onClick=\"OpenLink('ctariff');\" style=\"cursor:pointer;\">".SELLINGTERRIF."</LABEL></div></td>
				  </tr>
				</table></td>
			  </tr>
			  <tr>
				<td height=\"84\" valign=\"top\"><div id=\"c_t_4\">");
			$sql_live = "SELECT * FROM callshopcurrentcalls_list c where ani=\"".$data_new["login"]."\"";
			//$result_live = mysql_query($sql_live, $con);
			$result_live = execute($sql_live, 1);
			mysql_num_rows($result_live);
			
			if (mysql_num_rows($result_live) == 0 ){
				print("<div id=\"no_live\">".NOCALL."</div>");
			} else {
				while ($data_live = mysql_fetch_array($result_live, MYSQL_ASSOC)) {
					$start = date("F j Y H:i:s",strtotime($data_live["call_start"]));
					print("<div id=\"live\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\">
					  <tr>
						<td width=\"24\"><img src=\"images/hourglass.png\" /></td>
						<td width=\"100%\">Duration: </td>
						<td class=\"live_call\">
							<div id=\"cpcontainer".$data_live["id_call"]."\"></div>						
						</td>
					  </tr>
					  <tr>
						<td width=\"24\"><img src=\"images/telephone.png\" /></td>
						<td width=\"100%\">Dialed No.: </td>
						<td class=\"dailed_no\">".$data_live["dialed_number"]."</td>
					  </tr>
					</table>");
					print ("</div>");
				}
			}
			print ("</div></td>
			  </tr>
			  <tr>
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
						<input type=\"button\" name=\"button\" id=\"button\" value=\"".CALLHISTORY."\" onclick=\"PopupCenter('callshis.php?uname=".$username."&upass=".$password."&utype=".$usertype."&id_client=".$data_new["id_client"]."', 'myPop1',900,400);\" style=\"float:left;margin-left:40px\"/>
						</form>
					</td>
					<td style='vertical-align:top;'>
						<form id=\"form2\" name=\"form2\" method=\"post\" action=\"unpaidcalls.php\" target=\"_blank\">
						<input type=\"hidden\" name=\"username\" id=\"hiddenField\" value=\"".$username."\"/>
						<input type=\"hidden\" name=\"password\" id=\"hiddenField\" value=\"".$password."\"/>
						<input type=\"hidden\" name=\"usertype\" id=\"hiddenField\" value=\"".$usertype."\"/>
						<input type=\"hidden\" name=\"c_id\" id=\"hiddenField\" value=\"".$data_new["id_client"]."\"/>
						<input type=\"button\" name=\"button\" id=\"button\" value=\"".LASTCALL."\" onclick=\"PopupCenter('unpaidcalls.php?uname=".$username."&upass=".$password."&utype=".$usertype."&id_client=".$data_new["id_client"]."', 'myPop1',900,400);\" />
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
		$round++;
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
