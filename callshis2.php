<?php
include('../admin/constant.php');
$refreshtime=REFRESHTIME;
include('topheader.php');

$usertype=$_SESSION['usertype'];
$username=$_SESSION['username'];

include('nnpclass.php');
$n = new npp;

if(isset($_REQUEST['limit'])){
	$limit = $_REQUEST['limit'];
} else {
	$limit = 10;
}
$page = $_GET['page'];



$c_id = $_REQUEST["c_id"];

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
                <td width="25%" valign="top"><h2><?php echo CALLHISTORY ;?>:</h2></td>
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
                      	<td width="6%"><input name="Go" type="submit" value="Go" /></td>
                      </tr>
                    </table>
                    </form>
                  </td>
                <td valign="top"><img src="<?php echo $_SESSION["filter-theme_04"]; ?>" width="10" height="30" /></td>
              </tr>
            </table>
<?php

if($_REQUEST['calendar']=="" || $_REQUEST['calendar1']==""){
	$query = "SELECT * FROM callscallshop c WHERE paid = 1 AND id_client = ".$_REQUEST["c_id"]."";
} else {
	$query = "SELECT * FROM callscallshop c WHERE paid = 1 AND id_client = ".$_REQUEST["c_id"]." AND (call_start between '".$d_from."' AND '".$d_to."' OR call_end between '".$d_from."' AND '".$d_to."')";
}
echo $query;die;
//$result = mysql_query($query);
$result = execute($query,1);
$totalRecords = mysql_num_rows($result);

$n->set($page,$limit,$totalRecords);



if($_REQUEST['calendar']=="" || $_REQUEST['calendar1']==""){
	$query2 = "SELECT * FROM callscallshop c WHERE paid = 1 AND id_client = ".$_REQUEST["c_id"]." ORDER BY call_end DESC limit ".$n->sql()."";
} else {
	$query2 = "SELECT * FROM callscallshop c WHERE paid = 1 AND id_client = ".$_REQUEST["c_id"]." AND (call_start between '".$d_from."' AND '".$d_to."' OR call_end between '".$d_from."' AND '".$d_to."') ORDER BY call_end DESC LIMIT ".$n->sql()."";
}
//$result2 = mysql_query($query2);
$result2 = execute($query2,1);


$r = $n->row();

if (mysql_num_rows($result2) > 0 )
{
	print("<table width=\"95%\" align=\"center\" border=\"1\" cellspacing=\"0\" cellpadding=\"5\" style=\"border-collapse: collapse\">
	  <tr>
    	<td class=\"topt\">".CALLED_NUMBER."</td>
	    <td class=\"topt\">".CALLER_ID."</td>
		<td class=\"topt\">".CALL_START."</td>
		<td class=\"topt\">".CALL_END."</td>
		<td class=\"topt\">".DURATION."</td>
		<td class=\"topt\">".TARIFF1."</td>	
		<td class=\"topt\">".COST."</td>		
		<td class=\"topt\">".PAID."</td>
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
		print("<tr class='".$row_class."'>");
		print("<td>".$row["called_number"]."</td>");
		print("<td>".$row["caller_id"]."</td>");
		print("<td>".$row["call_start"]."</td>");
		print("<td>".$row["call_end"]."</td>");
		print("<td>".ceil($row["duration"]/60)."</td>");
		print("<td>".$row["tariffdesc"]."</td>");
		print("<td>".$row["cost"]."</td>");
		print("<td align=center><img src=\"images/".$row["paid"].".png\" /></td></tr>");
		$row_counter++;
		$name[$w] = $rows['id_call'];
		$w++;
	}		
	echo "<tr><td class=\"topt\" colspan=\"8\">".$n->show($op="{H}","","")."</td></td></tr>";
	echo "</table>";
} else {
	echo "<center><br><br>".CALLS_CABINE."<br><br><br></center>";
}
?>
                    <INPUT TYPE=hidden name='username' ID='username' VALUE='<?php echo $username ?>'>
                    <INPUT TYPE=hidden name='usertype' ID='usertype' VALUE='<?php echo $usertype ?>'>
                    <INPUT TYPE=hidden name='c_id' ID='c_id' VALUE='<?php echo $c_id ?>'>
                    <INPUT TYPE=hidden name='page' ID='page' VALUE='<?php echo $page ?>'>
                    <INPUT TYPE=hidden name='page' ID='calendar' VALUE='<?php echo $d_from ?>'>
                    <INPUT TYPE=hidden name='page' ID='calendar1' VALUE='<?php echo $d_to ?>'> 
<?php
if($_REQUEST['pay'])
{
	for($z=0; $z<=$w; $z++)
	{	
		if($_REQUEST["$z"]){
		 	$p_id = $name["$z"];
			echo $p_id."<BR></br>";
			//mysql_query("UPDATE calls SET paid='1' WHERE id_call='$p_id'");
			//echo "<meta HTTP-EQUIV=\"REFRESH\" content=\"0; url=test.php\">";	
		}
	}
}

echo "<table width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\" align=\"center\"><tr><td>".$n->show($op="{A}{F}{R}{P}{N}{L}",8,$url="username=$username&usertype=$usertype&c_id=$c_id&limit=$limit&calendar=$d_from&calendar1=$d_to")."</td><td align=\"right\">".RESULTS_PAGE."</td><td align=\"right\" width=\"110\">";
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
                    <INPUT TYPE=hidden name='page' ID='calendar' VALUE='<?php echo $d_from ?>'>
                    <INPUT TYPE=hidden name='page' ID='calendar1' VALUE='<?php echo $d_to ?>'>                    
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

<?php
mysql_close();
?>