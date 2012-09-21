<?php
include('../admin/constant.php');
$refreshtime=REFRESHTIME;
include('topheader.php');
$usertype=$_SESSION['usertype'];
$username=$_SESSION['username'];
if(isset($_POST["c_id"]))
{
	$_SESSION["c_id"]=$_POST["c_id"];
}
include('nnpclass.php');
$n = new npp;

if(isset($_REQUEST['limit'])){
	$limit = $_REQUEST['limit'];
} else {
	$limit = 10;
}
$page = $_GET['page'];

// Get current username and password
$username = $_REQUEST["username"];
// $password = $_REQUEST["password"];
$usertype = $_REQUEST["usertype"];
$c_id = $_SESSION["c_id"];
if($_GET['calendar']!=""){
	$d_from = $_GET['calendar'];
	$d_to = $_GET['calendar1'];
} else {
	$d_from = $_REQUEST['calendar'];
	$d_to = $_REQUEST['calendar1'];
}
?>
  <tr>
     <td><table border="0" cellspacing="0" cellpadding="0" class="tablebg">
      <tr>
        
        <td width="100%" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="10">
          <tr>
            <td>
            <table width="95%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="25%" valign="top"><h4>Latest unpaid calls: </h4></td>
                <td width="75%"></td>
              </tr>
            </table>
<?php
if($_REQUEST['calendar']=="" || $_REQUEST['calendar1']==""){
	$query = "SELECT * FROM callscallshop c WHERE paid = 0 AND id_client = ".$_SESSION["c_id"]."";
} else {
	$query = "SELECT * FROM callscallshop c WHERE paid = 0 AND id_client = ".$_SESSION["c_id"]." AND (call_start between '".$d_from."' AND '".$d_to."' OR call_end between '".$d_from."' AND '".$d_to."')";
}
//$result = mysql_query($query);
$result = execute($query,1);
$totalRecords = mysql_num_rows($result);

$n->set($page,$limit,$totalRecords);

if($_REQUEST['calendar']=="" || $_REQUEST['calendar1']==""){
	$query2 = "SELECT * FROM callscallshop c WHERE paid = 0 AND id_client = ".$_SESSION["c_id"]." ORDER BY call_end DESC limit ".$n->sql()."";
} else {
	$query2 = "SELECT * FROM callscallshop c WHERE paid = 0 AND id_client = ".$_SESSION["c_id"]." AND (call_start between '".$d_from."' AND '".$d_to."' OR call_end between '".$d_from."' AND '".$d_to."') ORDER BY call_end DESC LIMIT ".$n->sql()."";
}
//$result2 = mysql_query($query2);
$result2 = execute($query2,1);

$r = $n->row();

if (mysql_num_rows($result2) > 0 )
{
	print("<form name=\"formID\" method=\"post\" action=\"unpaidcalls.php\">");
	print("<table width=\"95%\" align=\"center\" border=\"1\" cellspacing=\"0\" cellpadding=\"5\" style=\"border-collapse: collapse\">
	  <tr>
		<td class=\"topt\"><input type=\"checkbox\" name=\"checkall\" onclick=\"checkUncheckAll(this);\"/></td>
    	<td class=\"topt\">Called Number</td>
	    <td class=\"topt\">Caller ID</td>
		<td class=\"topt\">Call Start</td>
		<td class=\"topt\">Call End</td>
		<td class=\"topt\">Duration</td>
		<td class=\"topt\">Tariff</td>	
		<td class=\"topt\">Cost</td>		
		<td class=\"topt\">Paid</td>
	  </tr>");
    $row_counter = 0;
	$w=1;
	while ($row = mysql_fetch_array($result2)) {
		$r++;
		 if ( $row_counter % 2 == 0)
        {
	        $row_class = "even_row";
        } else {
            $row_class = "odd_row";
        }
		print("<tr class='".$row_class."'><td>
		<input name=\"".$w."\" type=\"checkbox\" onchange=\"calculate()\" value=\"".$row["cost"]."\"></td>");
		print("<td>".$row["called_number"]."</td>");
		print("<td>".$row["caller_id"]."</td>");
		print("<td>".$row["call_start"]."</td>");
		print("<td>".$row["call_end"]."</td>");
		print("<td>".ceil($row["duration"]/60)."</td>");
		print("<td>".$row["tariffdesc"]."</td>");
		print("<td>".$row["cost"]."</td>");
		print("<td align=center><img src=\"images/".$row["paid"].".png\" /></td></tr>");
		$row_counter++;
		$name[$w] = $row['id_call'];
		$w++;
	}		
	echo "<tr><td class=\"topt\" colspan=\"7\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\"><tr><td align=\"left\">".$n->show($op="{H}","","")."</td><td align=\"right\">Total Bill: </td></tr></table></td><td class=\"topt\" colspan=\"2\">$ <input type=\"text\" size=3 name=\"total\"> <input name=\"pay\" type=\"submit\" id=\"pay\" value=\"Pay\"></td></tr>";
	echo "</table>";
} else {
	echo "<center><br><br>There is no results to show.<br><br><br></center>";
}
?>
                    <INPUT TYPE=hidden name='username' ID='username' VALUE='<?php echo $username ?>'>
                    <INPUT TYPE=hidden name='usertype' ID='usertype' VALUE='<?php echo $usertype ?>'>
                    <INPUT TYPE=hidden name='c_id' ID='c_id' VALUE='<?php echo $c_id ?>'>
                    <INPUT TYPE=hidden name='page' ID='page' VALUE='<?php echo $page ?>'>
                    <INPUT TYPE=hidden name='calendar' ID='calendar' VALUE='<?php echo $d_from ?>'>
                    <INPUT TYPE=hidden name='calendar1' ID='calendar1' VALUE='<?php echo $d_to ?>'> 
<?php
print("</form>");
if($_REQUEST['pay'])
{
	for($z=0; $z<=$w; $z++)
	{	
		if($_REQUEST["$z"]){
			$p_id = $name["$z"];
			//mysql_query("UPDATE callscallshop SET paid='1' WHERE id_call='$p_id'");
			 execute("UPDATE callscallshop SET paid='1' WHERE id_call='$p_id'",1);
			echo "<meta HTTP-EQUIV=\"REFRESH\" content=\"0; url=callsshopcalls.php?username=$username&usertype=$usertype\">";	
		}
	}
}
echo "<table width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\" align=\"center\"><tr><td align=\"left\">".$n->show($op="{A}{F}{R}{P}{N}{L}",8,$url="username=$username&usertype=$usertype&c_id=$c_id&limit=$limit&calendar=$d_from&calendar1=$d_to")."</td><td align=\"right\">Show results per page:  </td><td align=\"right\" width=\"110\">";
?>
                <form action="" method="post" name="show_num">
                    <select name="limit">
                    	<option <?php if($limit==10){ echo "selected=\"selected\""; } ?>value="10">10</option>
                        <option <?php if($limit==25){ echo "selected=\"selected\""; } ?>value="25">25</option>
                        <option <?php if($limit==50){ echo "selected=\"selected\""; } ?>value="50">50</option>
                    </select>
                    <INPUT TYPE=hidden name='username' ID='username' VALUE='<?php echo $username ?>'>
                    <INPUT TYPE=hidden name='usertype' ID='usertype' VALUE='<?php echo $usertype ?>'>
                    <INPUT TYPE=hidden name='c_id' ID='c_id' VALUE='<?php echo $c_id ?>'>
                    <INPUT TYPE=hidden name='page' ID='page' VALUE='<?php echo $page ?>'>
                    <INPUT TYPE=hidden name='calendar' ID='calendar' VALUE='<?php echo $d_from ?>'>
                    <INPUT TYPE=hidden name='calendar1' ID='calendar1' VALUE='<?php echo $d_to ?>'>                    
                    <input name="show" type="submit" value="Show" />
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
