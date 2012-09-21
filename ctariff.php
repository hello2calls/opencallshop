<?php
include('topheader.php');
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
            <td><div class="warning"><img src="images/warning_red.png" alt="" />CallShop operators can edit sell rates from the VSR System, sell rates is the tariff assigned to the GK/Clients under this callshop username.</div>
            <table width="95%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="25%" valign="top"><h2 class="c" style="margin-top: 8px; margin-left: 20px; width: 110px;">Selling Tariff:</h2></td>
                <td width="75%" valign="top"><form action="?id_client=<?php echo $_GET["id_client"];?>" method="post" style="margin-top: 8px;">Search&nbsp
				<input type="text" name="search" size="30"/>&nbsp;<input type="submit" name="searchbtn" value="Go"/></form></td>
              </tr>
            </table>
			
<?php
$id_client = str_replace("client","",base64_decode($_REQUEST['id_client']));

if(isset($_POST["searchbtn"])){
$query = "SELECT * FROM tariffs WHERE id_tariff IN (SELECT id_tariff FROM clientse164 c WHERE id_client = '".$id_client."') and (prefix like '%".$_POST["search"]."%' or description like '%".$_POST["search"]."%')";
}
else{
$query = "SELECT * FROM tariffs WHERE id_tariff IN (SELECT id_tariff FROM clientse164 c WHERE id_client = '".$id_client."')";
}

//$result = mysql_query($query);
$result = execute($query,1);
$totalRecords = mysql_num_rows($result);

$n->set($page,$limit,$totalRecords);
if(isset($_POST["searchbtn"])){
$query2 = "SELECT * FROM tariffs WHERE id_tariff IN (SELECT id_tariff FROM clientse164 c WHERE id_client = '".$id_client."') and (prefix like '%".$_POST["search"]."%' or description like '%".$_POST["search"]."%') LIMIT ".$n->sql()."";
}
else{
$query2 = "SELECT * FROM tariffs WHERE id_tariff IN (SELECT id_tariff FROM clientse164 c WHERE id_client = '".$id_client."') LIMIT ".$n->sql()."";
}
$result2 = mysql_query($query2);
//print_r($result2);
$result2 = execute($query2,1);

$r = $n->row();

if (mysql_num_rows($result2) > 0 )
{
	print("<form id=\"formID\">");
	print("<table width=\"95%\" align=\"center\" border=\"1\" cellspacing=\"0\" cellpadding=\"5\" style=\"border-collapse: collapse\">
	  <tr>
    	<td class=\"topt\">".COUNTRY_PRE."</td>
	    <td class=\"topt\">".COUNTRY_NAME."</td>
		<td class=\"topt\">".TARIFF1."</td>
	  </tr>");
    $row_counter = 0;	 
	while ($row = mysql_fetch_array($result2)) {
		$r++;
		 if ( $row_counter % 2 == 0)
        {
	        $row_class = "even_row";
        } else {
            $row_class = "odd_row";
        }
		print("<tr><td>".$row["prefix"]."</td>");
		print("<td>".$row["description"]."</td>");
		print("<td>$ ".$row["voice_rate"]."</td></tr>");
		$row_counter++;
	}		
	echo "<tr><td class=\"topt\" colspan=\"9\">".$n->show($op="{H}","","")."</td></tr>";
	echo "</table>";
} else {
	echo "<center><br><br>".NO_RESULTS."<br><br><br></center>";
}
?>
                    <INPUT TYPE=hidden name='username' ID='username' VALUE='<?php echo $username ?>'>
                    <INPUT TYPE=hidden name='usertype' ID='usertype' VALUE='<?php echo $usertype ?>'>
                    <INPUT TYPE=hidden name='c_id' ID='c_id' VALUE='<?php echo $c_id ?>'>
                    <INPUT TYPE=hidden name='page' ID='page' VALUE='<?php echo $page ?>'>
                    <INPUT TYPE=hidden name='page' ID='calendar' VALUE='<?php echo $d_from ?>'>
                    <INPUT TYPE=hidden name='page' ID='calendar1' VALUE='<?php echo $d_to ?>'> 
<?php
print("</form>");
echo "<table width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\" align=\"center\"><tr><td align=\"left\">".$n->show($op="{A}{F}{R}{P}{N}{L}",8,$url="username=$username&usertype=$usertype&c_id=$c_id&limit=$limit&calendar=$d_from&calendar1=$d_to")."</td><td align=\"right\">".RESULTS_PAGE."</td><td align=\"right\" width=\"110\">";
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
                    <input name="show" type="submit" value="<?php echo SHOW ;?>"/>
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