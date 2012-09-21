<?php
include('topheader.php');

function secondMinute($seconds){

    /// get minutes
    $minResult = floor($seconds/60);
    
    /// if minutes is between 0-9, add a "0" --> 00-09
    if($minResult < 10){$minResult = 0 . $minResult;}
    
    /// get sec
    $secResult = round(($seconds/60 - $minResult)*60);
    
    /// if secondes is between 0-9, add a "0" --> 00-09
    if($secResult < 10){$secResult = 0 . $secResult;}
    
    /// return result
    //echo $minResult,":",$secResult;
	$result = "".$minResult.":".$secResult."";
	return $result;
}

if(isset($_GET["id_client"]))
{
	$_SESSION["c_id"]=$_GET["id_client"];
}
include('nnpclass.php');
$n = new npp;

if(isset($_REQUEST['limit'])){
	$limit = $_REQUEST['limit'];
} else {
	$limit = 10;
}
$page = $_GET['page'];
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
                <td width="25%" valign="top"><h2><?php echo CALLHISTORY ;?></h2></td>
                <td valign="top"><img src="images/<?php echo $_SESSION['filter-theme_01']; ?>" width="11" height="30" /></td>
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
                <td valign="top"><img src="images/<?php echo $_SESSION['filter-theme_04']; ?>" width="10" height="30" /></td>
              </tr>
            </table>
<?php

////By default page will show Today's call records///////
if($_REQUEST['calendar']=="" || $_REQUEST['calendar1']=="")
	{
	$d_from = date("Y-m-d");
	$d_to = date("Y-m-d");
	}

$query = "Select * from calls WHERE client_type = ".$_SESSION['client_type']." AND id_client = ".$_SESSION['id_callshop']." AND (call_start between '".$d_from."' AND '".$d_to."' OR call_end between '".$d_from."' AND '".$d_to."')";

$result = execute($query,1);
$totalRecords = mysql_num_rows($result);

$n->set($page,$limit,$totalRecords);

$query2 = "Select * from calls WHERE client_type = ".$_SESSION['client_type']." AND id_client = ".$_SESSION['id_callshop']." AND (call_start between '".$d_from."' AND '".$d_to."' OR call_end between '".$d_from."' AND '".$d_to."') ORDER BY call_end DESC LIMIT ".$n->sql()."";

$query3 = "SELECT sum( cost ) FROM calls WHERE id_client = ".$_SESSION["id_callshop"]." AND (call_start between '".$d_from."' AND '".$d_to."' OR call_end between '".$d_from."' AND '".$d_to."')";

$query4 = "SELECT sum( duration ) FROM calls WHERE id_client = ".$_SESSION["id_callshop"]." AND (call_start between '".$d_from."' AND '".$d_to."' OR call_end between '".$d_from."' AND '".$d_to."')";

$result = execute($query,1);
$totalRecords = mysql_num_rows($result);

$n->set($page,$limit,$totalRecords);

//$result2 = mysql_query($query2);
$result2 = execute($query2,1);

$result3 = mysql_query($query3);
$row3 = mysql_fetch_array($result3);
$totalcost = $row3['sum( cost )'];

$result4 = mysql_query($query4);
$row4 = mysql_fetch_array($result4);
$totalduration1 = $row4['sum( duration )'];
//$totalduration = ceil($totalduration1/(60*60));
$totalduration = secondMinute($totalduration1);

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
		print("<td>".secondMinute($row["duration"])."</td>");	
		print("<td>".$row["tariffdesc"]."</td>");
		print("<td>".$row["cost"]."</td></tr>");
		//print("<td align=center><img src=\"images/".$row["paid"].".png\" /></td></tr>");
		$row_counter++;
		$name[$w] = $rows['id_call'];
		$w++;
	}	
	echo "<tr><td class=\"topt\" colspan=\"3\">".$n->show($op="{H}","","")."</td>
				<td align=\"right\" class=\"topt\" colspan=\"2\">".TOTAL_DUR."".$totalduration."</td></td>
				<td align=\"right\" class=\"topt\" colspan=\"2\">".TOTAL_COST."".$totalcost."</td></td></tr>";
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

echo "<table width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\" align=\"center\"><tr><td>".$n->show($op="{A}{F}{R}{P}{N}{L}",8,$url="c_id=$c_id&limit=$limit&calendar=$d_from&calendar1=$d_to")."</td><td align=\"right\">".RESULTS_PAGE."</td><td align=\"right\" width=\"110\">";
?>
                <form action="" method="post" name="show_num">
                    <select name="limit">
                    	<option <?php if($limit==10){ echo "selected=\"selected\""; } ?>value="10">10</option>
                        <option <?php if($limit==25){ echo "selected=\"selected\""; } ?>value="25">25</option>
                        <option <?php if($limit==50){ echo "selected=\"selected\""; } ?>value="50">50</option>
                    </select>
                    <INPUT TYPE=hidden name='usertype' ID='usertype' VALUE='<?php echo $usertype ?>'>
                    <INPUT TYPE=hidden name='c_id' ID='c_id' VALUE='<?php echo $c_id ?>'>
                    <INPUT TYPE=hidden name='page' ID='page' VALUE='<?php echo $page ?>'>
                    <INPUT TYPE=hidden name='page' ID='calendar' VALUE='<?php echo $d_from ?>'>
                    <INPUT TYPE=hidden name='page' ID='calendar1' VALUE='<?php echo $d_to ?>'>            
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

<?php
mysql_close();
?>