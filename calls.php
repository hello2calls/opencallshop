<?php
include('../admin/constant.php');
$refreshtime=REFRESHTIME;
include('topheader.php');
include('nnpclass.php');
$usertype=$_SESSION['usertype'];
$username=$_SESSION['username'];
?>

  <tr>
  <td><table border="0" cellspacing="0" cellpadding="0" class="tablebg">
      <tr>
       
        <td width="100%" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="10">
          <tr>
            <td>
<?php
print("</BR>");
print("<LABEL onClick=\"OpenLink('exportexcel');\" style='cursor:hand;'><u>Export Results to Excel</u> | </LABEL>");
print("<LABEL onClick=\"OpenLink('exportcsv');\" style='cursor:hand;'><u>Export Results to CSV</u> | </LABEL>");
print("<LABEL onClick=\"OpenLink('calls');\" style='cursor:hand;'><u>Calls</u> | </LABEL>");
print("<LABEL onClick=\"OpenLink('recharges');\" style='cursor:hand;'><u>Recharges</u> | </LABEL>");
print("<LABEL onClick=\"OpenLink('searchcalls');\" style='cursor:hand;'><u>Search Calls</u></LABEL>");
print("<form ID='frmProcessLogin' METHOD=POST ACTION=\"\">");
print("<INPUT TYPE=hidden name='username' ID='username' VALUE='" . $username . "'>");
print("<INPUT TYPE=hidden name='usertype' ID='usertype' VALUE='" . $usertype . "'>");
print("<INPUT TYPE=hidden name='op' ID='op' VALUE='calls'>");
print("<INPUT TYPE=hidden name='page_size' ID='page_size'>");
print("</form><br>");

switch($usertype)
{
	case 0:
		$sub_sql = "select id_client from clientsip where login='" . $username . "'";
        break;

	case 1:
		$sub_sql = "select id_client from clientshearlink where login='" . $username . "'";
        break;

	case 2:
		$sub_sql = "select id_client from clientse164 where login='" . $username . "'";
		break;

    case 8:
		$sub_sql = "select id_client from clientspin where login='" . $username . "'";
		break;
}

$sql = "select calls.call_start, calls.called_number, tariffdesc as tarriff_description, calls.duration, calls.call_start as diff1, calls.call_end as diff2, calls.cost as cost from calls as calls where id_client = (" . $sub_sql . ") AND client_type=". $usertype;
               
// for undefined page value, set it to 1
if ( $_REQUEST["pg_no"] == "")
{
	$_REQUEST["pg_no"] = 1;
}

//$result_set = mysql_query($sql, $con);
$result_set = execute($sql, 1);
$total_records = mysql_num_rows($result_set);

if ( $_REQUEST["page_size"] == "" || $_REQUEST["page_size"] == null)
{
	$pg_size = 10;
} else {
    $pg_size = $_REQUEST["page_size"];
}

$no_of_pgs = ceil($total_records / $pg_size);
$lower_limit = ((($_REQUEST["pg_no"] * $pg_size) - $pg_size) < 0 ? 0 : (($_REQUEST["pg_no"] * $pg_size) - $pg_size));
$upper_limit = $pg_size;

$sql = "select calls.caller_id, calls.call_start, calls.called_number, tariffdesc as tarriff_description, (select voice_rate from tariffs where id_tariff=calls.id_tariff and prefix=calls.tariff_prefix group by prefix,id_tariff having tariffs.voice_rate = max(tariffs.voice_rate)) as cost_per_min, (select resolution from tariffsnames where id_tariff=calls.id_tariff) as resolution, calls.duration, calls.cost as cost from calls as calls where id_client = (" . $sub_sql . ") AND client_type=". $usertype . " order by calls.call_end desc limit " . $lower_limit . "," . $upper_limit;

//$result_set = mysql_query($sql, $con);

$result_set = execute($sql, 1);

if ( mysql_num_rows($result_set) > 0 )
{
	print("<table width=\"95%\" align=\"center\" border=\"1\" cellspacing=\"0\" cellpadding=\"5\" style=\"border-collapse: collapse\">");
    print("<TR>");
    // print("<TH>Caller ID</TD>");
    print("<td class=\"topt\">Call Start</TD>");
    print("<td class=\"topt\">Called Number</TD>");
    print("<td class=\"topt\">Country name</TD>");
    print("<td class=\"topt\">Duration</TD>");
    // print("<TH>Pulse Rate</TD>");
    print("<td class=\"topt\">Rate/min</TD>");
    print("<td class=\"topt\">Time</TH>");
    print("<td class=\"topt\" STYLE='color:#FF0000;'>Minutes</TD>");
    print("<td class=\"topt\" style='color:#FF0000;'>Cost</TD>");
    print("</TR>");

    $row_counter = 0;
    $total_duration = 0;
    $total_cost = 0;

	while ( $data_row = mysql_fetch_array($result_set, MYSQL_ASSOC))
    {
	    if ( $row_counter % 2 == 0)
        {
	        $row_class = "even_row";
        } else {
            $row_class = "odd_row";
        }

        if ( $data_row["resolution"] == 0 )
        {
	        continue;
        }

        $pulse = ceil($data_row["duration"]/$data_row["resolution"]);
        $billed_mins = ceil($data_row["duration"]/60);
        $min_pulse_ratio = 60/$data_row["resolution"];
        $min_part = floor($pulse / $min_pulse_ratio);
        $sec_part = $pulse % $min_pulse_ratio;
        $sec_part = $sec_part * $data_row["resolution"];

        print("<TR class='" . $row_class . "'>");
        // print("<TD>" . $data_row["caller_id"] . "</TD>");
        print("<TD>" . $data_row["call_start"] . "</TD>");
        print("<TD>" . $data_row["called_number"] . "</TD>");
        print("<TD>&nbsp;" . $data_row["tarriff_description"] . "</TD>");
        print("<TD>" . $data_row["duration"] . "</TD>");
        // print("<TD>" . $data_row["resolution"] . "</TD>");
        print("<TD>" . $data_row["cost_per_min"] . "</TD>");
        print("<TD>" . $min_part . " mins " . $sec_part . " secs" . "</TD>");
        print("<TD STYLE='color:#FF0000;'>" . $billed_mins . "</TD>");
        sprintf("%01.2f", $money);
        $fammount = sprintf("%01.4f",(($data_row["cost_per_min"]*($data_row["resolution"]/60)) * $pulse));
        print("<TD style='color:#FF0000;'>" . $fammount . "</TD>");
        print("</TR>");

        $total_duration += $data_row["duration"];
        $total_cost += (($data_row["cost_per_min"]*($data_row["resolution"]/60)) * $pulse);
        $row_counter++;
	}
    $total_mins = floor($total_duration / 60 );
    $total_secs = $total_duration % 60 ;

    print("<TR>");
    print("<TD class=\"topt\" COLSPAN=6 style='text-align:right;'><B>" . $total_mins . " mins " . $total_secs . " secs</B></TD>");
	$ftotal = sprintf("%01.4f",$total_cost);
	print("<TD class=\"topt\" COLSPAN=2 style='color:#FF0000; text-align:right;'><B>".$ftotal."</B></TD>");
	print("</TR>");
	print("</TABLE>");
} else {
	print("<DIV STYLE='font-family:verdana; font-size:10px; font-weight:bold; color:red;'>No records found</DIV>");
}
print("</BR></BR>");
 
print("<INPUT TYPE=text  name='pg_size' ID='pg_size' VALUE='".$pg_size."' size='1' maxlength='3'>&nbsp;&nbsp;");
print("<INPUT TYPE=button name='btnPageSize' ID='btnPageSize' VALUE='Go' onClick='ChangePageSize();'>");


$pipe = "";
if ($no_of_pgs > 10 )
{
	$no_of_pgs = 10;
}
for ($pg_no = 1; $pg_no <= $no_of_pgs; $pg_no++)
{
	if ($pg_no == $_REQUEST["pg_no"])
    {
		print($pipe."<LABEL onClick='GotoPage(".$pg_no.")' style=\"cursor:pointer;\"><B>&nbsp;".$pg_no."</B></LABEL>&nbsp;");
	} else {
	    print($pipe."<LABEL onClick='GotoPage(".$pg_no.")' style=\"cursor:pointer;\">&nbsp;".$pg_no."</LABEL>&nbsp;");
	}
	$pipe = "|";
}
?>
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