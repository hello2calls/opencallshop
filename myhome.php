<?php
@session_start();
include('./admin/constant.php');
$refreshtime=REFRESHTIME;
include('topheader.php');
?>
<script type="text/javascript">
var tctr0,tctr1,tctr2,tctr3,tctr4,tctr5,tctr6,tctr7;
function dcountup(startingdate, baseunit,tctr){
//	this.currentTime=new Date('<?= date('F d, Y H:i:s') ?>')
	this.currentTime=new Date()
	this.startingdate=new Date(startingdate)
	this.timesup=false
	this.baseunit=baseunit
	this.start(tctr)
}

dcountup.prototype.oncountup=function(){} //default action for "oncountup"
dcountup.prototype.cleartimeo=function(){}
dcountup.prototype.start=function(tctr){
	var thisobj=this
	this.currentTime.setSeconds(this.currentTime.getSeconds()+1)
	var timediff=(this.currentTime-this.startingdate)/1000 //difference btw target date and current date, in seconds
	
	var oneMinute=60 //minute unit in seconds
	var oneHour=60*60 //hour unit in seconds
	var oneDay=60*60*24 //day unit in seconds
	
	var dayfield=Math.floor(timediff/oneDay)
	var hourfield=Math.floor((timediff-dayfield*oneDay)/oneHour)
	var minutefield=Math.floor((timediff-dayfield*oneDay-hourfield*oneHour)/oneMinute)
	var secondfield=Math.floor((timediff-dayfield*oneDay-hourfield*oneHour-minutefield*oneMinute))
	
	if (this.baseunit=="hours"){ //if base unit is hours, set "hourfield" to be topmost level
		hourfield=dayfield*24+hourfield
		dayfield="n/a"
	}
	else if (this.baseunit=="minutes"){ //if base unit is minutes, set "minutefield" to be topmost level
		minutefield=dayfield*24*60+hourfield*60+minutefield
		dayfield=hourfield="n/a"
	}
	else if (this.baseunit=="seconds"){ //if base unit is seconds, set "secondfield" to be topmost level
		var secondfield=timediff
		dayfield=hourfield=minutefield="n/a"
	}
	var result={days: dayfield, hours:hourfield, minutes:minutefield, seconds:secondfield}	

	this.oncountup(result,tctr);								


	if(tctr=="0"){
	tctr0=setTimeout(function(){thisobj.start(tctr)}, 1000) //update results every second
	}	
	if(tctr=="1"){
	tctr1=setTimeout(function(){thisobj.start(tctr)}, 1000) //update results every second
	}	
	if(tctr=="2"){
	tctr2=setTimeout(function(){thisobj.start(tctr)}, 1000) //update results every second
	}	
	if(tctr=="3"){
	tctr3=setTimeout(function(){thisobj.start(tctr)}, 1000) //update results every second
	}	
	if(tctr=="4"){
	tctr4=setTimeout(function(){thisobj.start(tctr)}, 1000) //update results every second
	}	
	if(tctr=="5"){
	tctr5=setTimeout(function(){thisobj.start(tctr)}, 1000) //update results every second
	}
	if(tctr=="6"){
	tctr6=setTimeout(function(){thisobj.start(tctr)}, 1000) //update results every second
	}
	if(tctr=="7"){
	tctr7=setTimeout(function(){thisobj.start(tctr)}, 1000) //update results every second
	}	
}
</script>
<?php
@session_start();
include dirname(__FILE__).'\libdir\database.php';
if (count ($_POST) > 0 && $_POST['sum'] >0)
{
	$sum = $_POST['sum'];
	$query2 = "SELECT *  FROM callscallshop c WHERE paid=0 and id_client=".$_POST['id']." ";
	$result2 = execute($query2);

	while( ($row = mysql_fetch_array($result2)) && $sum > 0)
	{
		$sum = $sum - $row['cost'];
		$p_id = $row['id_call'];
		mysql_query("UPDATE callscallshop SET paid='1' WHERE id_call='$p_id'");
		execute("UPDATE callscallshop SET paid='1' WHERE id_call='$p_id'",1);
	}
}

/*$te_live = "select * from callshopusers cs left join clientse164 cl on cs.id_client=cl.id_client
left join callshopcurrentcalls_list c cl.login=c.ani where cs.id_callshop='".$_SESSION['id_callshop']."'";
*/
$update='<script type="text/javascript">
function checklivedata()
{
  var xmlHttp = getXMLHttp();
 
  xmlHttp.onreadystatechange = function()
  {
    if(xmlHttp.readyState == 4)
    {
	clearTimeout(tctr0);clearTimeout(tctr1);clearTimeout(tctr2);clearTimeout(tctr3);
	clearTimeout(tctr4);clearTimeout(tctr5);clearTimeout(tctr6);clearTimeout(tctr7);
      document.getElementById(\'output\').innerHTML=xmlHttp.responseText;			
			for(var ctrs=0;ctrs<8;ctrs++)
			{
				if(document.getElementById("startdate"+ctrs))
				{					
					var obj="princewedding"+ctrs;					
//					console.log(document.getElementById("startdate"+ctrs).value)
					obj=new dcountup(document.getElementById("startdate"+ctrs).value, "days",ctrs);
					var result="result"+ctrs;
					obj.oncountup=function(result,ctrs){								
						document.getElementById("cpcontainer"+ctrs).innerHTML="<span class=\'dcountstyle\'>"+result[\'hours\']+":"+result[\'minutes\']+":"+result[\'seconds\']+"</span>";
					}

				}
			}
	}		
  }	

  xmlHttp.open("GET", "./callsshopcalls1.php", true);
  xmlHttp.send(null);
 // setTimeout("checklivedata()","3000");
 setTimeout("checklivedata()",'.$refreshtime.');
}';
$update.='window.onload=function(){
checklivedata();}';
$update.='</script>';
echo $update;
?>
	<tr><td id="output" valign="top"><img src="images/ajax-loader.gif" border="0" style="margin:50px; 100px"/></td></tr>
	<tr>
		<td><?php include('footer.php');?></td>
	</tr>
</table>
</body>
</html>
