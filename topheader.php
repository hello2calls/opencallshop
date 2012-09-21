<?php
@session_start();
ob_start();
include('./admin/pagetitle.php');
include('./admin/logoname.php');

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
require('./lang/english.php');
}else{
require('./lang/arb.php');
}
include dirname(__FILE__).'\libdir\database.php';
include dirname(__FILE__).'\libdir\common.inc';
include('islogin.php');

$username = $_SESSION["username"];
$usertype = $_SESSION["usertype"];

if($_SESSION['client_type']==16){
	$home = "myhome.php";
}else{
	$home = "home.php";
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
	<title><?php echo ENG_PAGE_TITLE ;?></title>
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
	<title><?php echo ARB_PAGE_TITLE ;?></title>
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

function OpenLinknew(filename,id_client) {
	
	form_obj = window.document.getElementById("frmProcessLogin");
	
	if (filename == "index") {
	    filename += ".php";
	} else {
 		filename += ".php?id_client=" + id_client;
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

function PopupCenter(pageURL, title,w,h) {
var left = (screen.width/2)-(w/2);
var top = (screen.height/2)-(h/2);
var targetWin = window.open (pageURL, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
}
function getXMLHttp()
{
  var xmlHttp

  try
  {
    //Firefox, Opera 8.0+, Safari
    xmlHttp = new XMLHttpRequest();
  }
  catch(e)
  {
    //Internet Explorer
    try
    {
      xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
    }
    catch(e)
    {
      try
      {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
      }
      catch(e)
      {
        alert("Your browser does not support AJAX!")
        return false;
      }
    }
  }
  return xmlHttp;
}

</script>
</head>
<body>
	<?php	$ip=$_SERVER['REMOTE_ADDR'];?>
	<?php echo "<div class='ipaddress'>IP Address= $ip</div>";?>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center"> 
<table width="95%">
<tr>
<td class="left"><img src="admin/image_files/<?php echo LOGO_NAME ;?>" border="0"/>
</td>
<td class="right" style='vertical-align:top;'>
	<form action="" method="post" name="frmlang"/><input type="hidden" id="changelang" name="changelang" value="<?php echo $_SESSION['lang'];?>"/>
		<a href="javascript:void(0);" onclick="switchlang('eng')" id='usa'>&nbsp;</a> <a href="javascript:void(0);" onclick="switchlang('arb')" id='arabic'>&nbsp;</a>
	</form>
	<div>
		<img src="images/help.png" width="16" height="16" border="0" alt=""><label onClick="OpenLink('support');" style="cursor:pointer;"><?php echo SUPPORT ;?></LABEL>
	</div>
	<div>
		<a class='teamviewer' href="http://www.teamviewer.com/download/TeamViewer_Setup_ru.exe">Assistance program</a>
	</div>
<!--
	<table width="220">
		<tr>
			<td><img src="images/font.png" width="16" height="16" border="0" alt=""></td>
			<td><?php echo CHANGE_LANG ;?></td>
			<td>
			</td>
		</tr>
		<tr>
		  <td></td>
		</tr>
		<tr>
		</tr>
		<tr>
			<td align="left" colspan='3'>
			</td>
		</tr>
	</table>
-->
</td>
</tr>
</table>       
    </td>
  </tr>
  <tr>
    <td>
    
    <table width="100%" height="46" cellspacing="0" cellpadding="0" border="0">
      <tbody><tr>
        <td><img border="0" src="images/<?php echo $_SESSION["theme_02"];?>"></td>
        <td width="100%" background="images/site-theme_03.gif">
        
		<table width="100%" cellspacing="0" cellpadding="3" border="0">
          <tbody><tr>
            <td><img width="16" height="16" src="images/user.png"></td>
            <td ><p class="topt"><?php echo WELCOME ;?></p></td>
            <td class="topdata"><a href=<?php echo $home; ?>><?php echo $_SESSION["welcomeuser"];?></a></td>
            
			<td><img width="16" height="16" src="images/money.png"></td>
            <td><p class="topt"><?php echo CREDIT ;?></p></td>
            <td class="topdata">$<?php echo $_SESSION['credit'];?></td>
            
			<td><img width="16" height="16" src="images/cart.png"></td>
            <td ><p class="topt"><label style="cursor: pointer;" onclick="OpenLink('dtariff');"><?php echo TARIFF ;?></label></p></td>
			
			<td><img width="16" height="16" src="images/cart.png"></td>
            <td ><p class="topt"><label style="cursor: pointer;" onclick="OpenLink('payhistory');"><?php echo PAYMENTSHISTORY ;?></label></p></td>
			
			<td><img width="16" height="16" src="images/time.png"></td>
            <td ><p class="topt"><?php echo TIME;?></p></td>
            <td class="topdata"><span id="timecontainer"></span><script type="text/javascript">new showLocalTime("timecontainer", "server-php", 0, "short")</script></td>
            
			<td><label style="cursor: pointer;" onclick="OpenLink('index');"><img width="16" height="16" src="images/lock.png"></label></td>            
			<td ><p class="topt"><a href="logout.php"><?php echo LOGOUT ;?></a></p></td>
          </tr>
        </tbody></table><form action="" method="POST" id="frmProcessLogin"><input type="hidden" value="khalid" id="username" name="username"><input type="hidden" value="9" id="usertype" name="usertype"></form>       
        </td>
        <td><img border="0" src="images/<?php echo $_SESSION["theme_05"];?>"></td>
      </tr>
    </tbody></table>
		
    </td>
  </tr>
