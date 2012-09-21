<?php
@session_start();

$prelang = $_SESSION['lang'];

if(isset($_POST['changelang']))
{
	$_SESSION['lang']=$_POST['changelang'];
}
else
{
	$_SESSION['lang']=$prelang;
	//$_SESSION['lang']='eng';
}
if($_SESSION['lang']=='eng')
{
$_SESSION["theme_02"]="site-theme_02.gif";
$_SESSION["theme_05"]="site-theme_05.gif";
$_SESSION["theme_11"]="site-theme_11.gif";
$_SESSION["theme_14"]="site-theme_14.gif";
$_SESSION["dir"]='dir="ltr" lang="en"';
$_SESSION["filter-theme_01"]="filter-theme_01.gif";
$_SESSION["filter-theme_04"]="filter-theme_04.gif";
?>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">
	
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hosted CallShop System</title>
	<link href="style.css" rel="stylesheet" type="text/css" />
<?php
}
else
{
$_SESSION["theme_02"]="site-theme_05.gif";
$_SESSION["theme_05"]="site-theme_02.gif";
$_SESSION["theme_11"]="site-theme_14.gif";
$_SESSION["theme_14"]="site-theme_11.gif";
$_SESSION["filter-theme_01"]="filter-theme_04.gif";
$_SESSION["filter-theme_04"]="filter-theme_01.gif";
?>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ar" lang="ar" dir="rtl">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>استضافت مراكز الاتصالات النظام : عربي</title>
	<link href="style-rtl.css" rel="stylesheet" type="text/css" />
<?php
}
?>
<link rel="stylesheet" href="themes/system.css" />
<script type="text/javascript" src="src/utils.js"></script>
<script type="text/javascript" src="src/calendar.js"></script>
<script type="text/javascript" src="src/calendar-setup.js"></script>
<script type="text/javascript" src="lang/calendar-en.js"></script>
<script type=text/javascript language=javascript>


function switchlang(lang)
{
	document.getElementById('changelang').value=lang;
	document.frmlang.submit();
}
function OpenLink(filename) {
	form_obj = window.document.getElementById("frmProcessLogin");
	
	if (filename == "index") {
	    filename += ".php";
	} else {
 		filename += ".php";
	}
	
	form_obj.action = filename;
	form_obj.submit();
}

function GotoPage(pageno) {
    form_obj = window.document.getElementById("frmProcessLogin");
    form_obj.action = "calls.php?pg_no=" + pageno;
    form_obj.submit();
}

function ChangePageSize() {
    form_obj = window.document.getElementById("frmProcessLogin");
    window.document.getElementById("page_size").value = window.document.getElementById("pg_size").value;
    form_obj.action = "calls.php?pg_no=1";
    form_obj.submit();
}

var weekdaystxt=["???", "?????", "??????", "??????", "????", "????", "???"]

function showLocalTime(container, servermode, offsetMinutes, displayversion){
if (!document.getElementById || !document.getElementById(container)) return
this.container=document.getElementById(container)
this.displayversion=displayversion
var servertimestring=(servermode=="server-php")? '<? print date("F d, Y H:i:s", time()) ?>' : (servermode=="server-ssi")? '<!--#config timefmt="%B %d, %Y %H:%M:%S"--><!--#echo var="DATE_LOCAL" -->' : '<%= Now() %>'
this.localtime=this.serverdate=new Date(servertimestring)
this.localtime.setTime(this.serverdate.getTime()+offsetMinutes*60*1000) //add user offset to server time
this.updateTime()
this.updateContainer()
}

showLocalTime.prototype.updateTime=function(){
var thisobj=this
this.localtime.setSeconds(this.localtime.getSeconds()+1)
setTimeout(function(){thisobj.updateTime()}, 2000) //update time every second
}

showLocalTime.prototype.updateContainer=function(){
var thisobj=this
if (this.displayversion=="long")
this.container.innerHTML=this.localtime.toLocaleString()
else if (this.displayversion=="timer"){
var hour=this.localtime.getHours()
var minutes=this.localtime.getMinutes()
var seconds=this.localtime.getSeconds()
var ampm=(hour>=12)? "PM" : "AM"
var dayofweek=weekdaystxt[this.localtime.getDay()]
this.container.innerHTML=formatField(hour, 1)+":"+formatField(minutes)+":"+formatField(seconds)
}
else{
var hour=this.localtime.getHours()
var minutes=this.localtime.getMinutes()
var seconds=this.localtime.getSeconds()
var ampm=(hour>=12)? "PM" : "AM"
var dayofweek=weekdaystxt[this.localtime.getDay()]
this.container.innerHTML=formatField(hour, 1)+":"+formatField(minutes)+":"+formatField(seconds)+" "+ampm
}
setTimeout(function(){thisobj.updateContainer()}, 1000) //update container every second
}

function formatField(num, isHour){
if (typeof isHour!="undefined"){ //if this is the hour field
var hour=(num>12)? num-12 : num
return (hour==0)? 12 : hour
}
return (num<=9)? "0"+num : num//if this is minute or sec field
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function dcountup(startingdate, baseunit){
	this.currentTime=new Date('<?= date('F d, Y H:i:s') ?>')
	this.startingdate=new Date(startingdate)
	this.timesup=false
	this.baseunit=baseunit
	this.start()
}

dcountup.prototype.oncountup=function(){} //default action for "oncountup"
dcountup.prototype.start=function(){
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
	this.oncountup(result)
	setTimeout(function(){thisobj.start()}, 2000) //update results every second
}



var chked = false;
var totalbill=0;
function check(field) {
  if (!chked) { 
    // if checkboxes are not checked then check them
	var totalbill=0;
    for (i = 0; i < field.length; i++) 
    { // loop through the array of checkboxes & check them
      field[i].checked = true;
	  totalbill=parseFloat(totalbill+parseFloat(field[i].value));
    }

	if( typeof field.length === "undefined" )
	{
      field.checked = true;
	  totalbill=parseFloat(totalbill+parseFloat(field.value));
	}	

    chked = true;
	tts = window.document.getElementById("summary");
	tts = tts.innerHTML

	totalbill=parseFloat(Math.round(totalbill*100)/100).toFixed(2);
	totalbill=parseFloat(Math.round(tts*100)/100).toFixed(2);
	document.formID.total.value=totalbill;
    //return "Uncheck All";  
    // change the button label
  } else {
    for (i = 0; i < field.length; i++) 
    { 
      // loop through the array of checkboxes & uncheck them
      field[i].checked = false;
    }

	if( typeof field.length === "undefined" )
	{
      field.checked = false;
	}	

    chked = false;document.formID.total.value='';
    //return "Check All";  
    // change the button label
  }
}

function calculate()
{
	var elems = document.forms['formID'].elements;
	var total = 0;

	for(var i=0;i<elems.length;i++)
	{
		if (elems[i].checked)
		{
			total += +(elems[i].value);
		}
	}

	if( typeof elems.length === "undefined" )
		total = elems.value
	var total=Math.round(total*100)/100
	elems['total'].value = total; 
	console.log(total)
}




</script>

<?php
if($_SESSION['lang']=='eng')
{
require('./lang/english.php');
}else{
require('./lang/arb.php');
}
include dirname(__FILE__).'\libdir\database.php';
include dirname(__FILE__).'\libdir\common.inc';
include('islogin.php');

$username = $_SESSION["username"];
$usertype = $_SESSION["usertype"];

?>
