<?php
include('topheader.php');
include('nnpclass.php');
$n = new npp;

$usertype=$_SESSION['usertype'];
$username=$_SESSION['username'];
if(isset($_POST["c_id"]))
{
	$_SESSION["c_id"]=$_POST["c_id"];
}

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


if($_POST['calendar']!=""){
	$d_from = $_POST['calendar'];
	$d_to = $_POST['calendar1'];
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
                <td width="25%" valign="top"><h4><?php echo PAY_HISTORY;?></h4></td>
<td valign="top"><img src="images/<?php echo $_SESSION["filter-theme_01"]; ?>" width="11" height="30" /></td>
                <td width="75%" valign="top" style="background-repeat:repeat-x" background="images/filter-theme_02.gif">
                    <form id="form1" name="form1" method="post" action="">                
                    <table width="100%" border="0" cellspacing="0" cellpadding="3">
                      <tr>
                        <td width="25%"><?php echo RESULT_FROM_DATE ; ?></td>
                        <td width="30%"><input type="text" id="calendar" name="calendar" size="15" value="<?php echo $d_from ?>" />
                                        <button id="trigger"><img src="images/date.png" /></button>
                                        <script type="text/javascript">//<![CDATA[
                                          Zapatec.Calendar.setup({
                                            firstDay          : 1,
                                            electric          : false,
                                            inputField        : "calendar",
                                            button            : "trigger",
                                            ifFormat          : "%Y-%m-%d",
                                            daFormat          : "%Y/%m/%d"
                                          });
                                        //]]></script></td>
                        <td width="9%"><?php echo TODATE ;?></td>
                        <td width="30%"><input type="text" id="calendar1" name="calendar1" size="15" value="<?php echo $d_to ?>" />
                                        <button id="trigger1"><img src="images/date.png" /></button>
                                        <script type="text/javascript">//<![CDATA[
                                          Zapatec.Calendar.setup({
                                            firstDay          : 1,
                                            electric          : false,
                                            inputField        : "calendar1",
                                            button            : "trigger1",
                                            ifFormat          : "%Y-%m-%d",
                                            daFormat          : "%Y/%m/%d"
                                          });
                                        //]]></script></td>
                            <INPUT TYPE=hidden name='username' ID='username' VALUE='<?php echo $username ?>'>
                            <INPUT TYPE=hidden name='usertype' ID='usertype' VALUE='<?php echo $usertype ?>'>
                            <INPUT TYPE=hidden name='c_id' ID='c_id' VALUE='<?php echo $c_id ?>'>
                      	<td width="6%"><input name="Go" type="submit" value="<?php echo GO ;?>" /></td>
                      </tr>
                    </table>
                    </form>
                  </td>
                <td valign="top"><img src="images/<?php echo $_SESSION["filter-theme_04"]; ?>" width="10" height="30" /></td>
              </tr>
            </table>
<?php
if($_REQUEST['calendar']=="" || $_REQUEST['calendar1']==""){
	$query = "SELECT * FROM payments WHERE client_type = ".$_SESSION['client_type']." AND id_client = ".$_SESSION['id_callshop']."";
	
	//$query = "SELECT * FROM payments WHERE client_type = 16 AND id_client = ".$_SESSION['id_callshop']."";
} else {
	$query = "SELECT * FROM payments WHERE client_type = ".$_SESSION['client_type']." AND id_client = ".$_SESSION['id_callshop']." AND (data between '".$d_from."' AND '".$d_to."' OR data between '".$d_from."' AND '".$d_to."')";
	
	//$query = "SELECT * FROM payments WHERE client_type = 16 AND id_client = ".$_SESSION['id_callshop']." AND (data between '".$d_from."' AND '".$d_to."' OR data between '".$d_from."' AND '".$d_to."')";
}

//$result = mysql_query($query);
$result = execute($query,1);

$totalRecords = mysql_num_rows($result);

$n->set($page,$limit,$totalRecords);

if($_REQUEST['calendar']=="" || $_REQUEST['calendar1']==""){

	$query2 = "SELECT money, data, description, actual_value , id_client FROM payments WHERE client_type = ".$_SESSION['client_type']." AND id_client = ".$_SESSION['id_callshop']." ORDER BY data DESC limit ".$n->sql()."";
	
	//$query2 = "SELECT money, data, description, actual_value , id_client FROM payments WHERE client_type = 16 AND id_client = ".$_SESSION['id_callshop']." ORDER BY data DESC limit ".$n->sql()."";

} else {
	$query2 = "SELECT money, data, description, actual_value , id_client FROM payments WHERE client_type = ".$_SESSION['client_type']." AND id_client = ".$_SESSION['id_callshop']." AND (data between '".$d_from."' AND '".$d_to."' OR data between '".$d_from."' AND '".$d_to."') ORDER BY data DESC limit ".$n->sql()."";
	
	//$query2 = "SELECT money, data, description, actual_value , id_client FROM payments WHERE client_type = 16 AND id_client = ".$_SESSION['id_callshop']." AND (data between '".$d_from."' AND '".$d_to."' OR data between '".$d_from."' AND '".$d_to."') ORDER BY data DESC limit ".$n->sql()."";
}


//$result2 = mysql_query($query2);
$result2 = execute($query2,1);

$r = $n->row();

if (mysql_num_rows($result2) > 0 )
{
	print("<form name=\"formID\" method=\"post\" action=\"unpaidcalls.php\">");
	print("<table width=\"95%\" align=\"center\" border=\"1\" cellspacing=\"0\" cellpadding=\"5\" style=\"border-collapse: collapse\">
	  <tr>
		<td class=\"topt\">".MONEY."</td>
	    <td class=\"topt\">".DATA."</td>
		<td class=\"topt\">".DESCRIPTION."</td>
		<td class=\"topt\">".ACTUAL_VALUE."</td>
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
		print("<tr class='".$row_class."'><td>$ ".$row["money"]."</td>");
		print("<td>".$row["data"]."</td>");
		if($row["description"]<>"")
			{
		print("<td>".$row["description"]."</td>");
			}else{
		print("<td><b>-xxx-</b></td>");
			}
		print("<td align=center>".$row["actual_value"]."</td></tr>");
		$row_counter++;
		$name[$w] = $row['id_call'];
		$w++;
	}

	//echo "<tr><td class=\"topt\" colspan=\"5\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\"><tr><td align=\"left\">".$n->show($op="{H}","","")."</td><td align=\"right\">".TOTAL_BILL."</td></tr></table></td><td class=\"topt\" colspan=\"2\">$ <input type=\"text\" size=3 name=\"total\"> <input name=\"pay\" type=\"submit\" id=\"pay\" value=\"".PAY."\"></td></tr>";
	echo "</table>";
} else {
	echo "<center><br><br>".NO_RESULTS."<br><br><br></center>";
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
echo "<table width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\" align=\"center\"><tr><td align=\"left\">".$n->show($op="{A}{F}{R}{P}{N}{L}",8,$url="username=$username&usertype=$usertype&c_id=$c_id&limit=$limit&calendar=$d_from&calendar1=$d_to")."</td><td align=\"right\">".RESULTS_PAGE." </td><td align=\"right\" width=\"110\">";
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
                    <input name="show" type="submit" value="<?php echo SHOW ;?>" />
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
