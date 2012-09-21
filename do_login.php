<?php
ob_start();
if(!$do_login) exit;

// declare post fields

$username = trim($_POST['username']);
$password = trim($_POST['password']);
$usertype= trim($_POST['usertype']);
$autologin = $_POST['autologin'];
include   dirname(__FILE__).'\libdir\database.php';
include dirname(__FILE__).'\libdir\common.inc';

switch($usertype)
	{
	    case 0:
	        $sql = "select * from clientsip where login='" . $username . "' and password='" . $password . "'";
			$new_case=2;
			$client_type=0;
            break;

		case 1:
            $sql = "select * from clientshearlink where login='" . $username . "' and password='" . $password . "'";
			$new_case=2;
			$client_type=1;
            break;

        case 2:
            $sql = "select * from clientse164 where login='" . $username . "' and password='" . $password . "'";
			$new_case=2;
			$client_type=2;
            break;

	   case 3:
            $sql = "select * from clientsshared where login='" . $username . "' and password='" . $password . "'";
			$new_case=1;
			$client_type=32;
            break;

        case 8:
            $sql = "select * from clientspin where login='" . $username . "' and password='" . $password . "'";
			$new_case=2;
			$client_type=8;
            break;

        case 9:
            $sql = "select * from clientscallshop where login='" . $username . "' and password='" . $password . "'";
			$new_case=1;
			$client_type=16;
            break;
        }
     //$query_result = mysql_query($sql, $con);

	 $query_result = execute($sql, 1);

if(mysql_num_rows($query_result) == 1)
{
	$data = mysql_fetch_array($query_result,MYSQL_ASSOC);
	//print '<pre>';
	$login_ok = true;
	$_SESSION['credit']=number_format($data["account_state"],2,'.','');
	$_SESSION['welcomeuser']=$data["login"];
	$_SESSION['id_callshop']=$data["id_client"];
	$_SESSION['username'] = $username;
	$_SESSION['password'] = $password;
	$_SESSION['usertype'] = $usertype;
	//$_SESSION['lang'] = "eng";
	$_SESSION['client_type'] = $client_type;
	// Autologin Requested?
	$sql1 = "select * from userloginstatus where id_client='".$data["id_client"]."'";
	//echo $sql1;
	$query_result1 = execute($sql1, 1);
	if(mysql_num_rows($query_result1) == 1)
	{
		$sql2 = "UPDATE userloginstatus SET user_status=1 WHERE id_client='".$data["id_client"]."'";
	}else{
		$sql2 = "INSERT INTO userloginstatus (id_client,user_status) VALUES ( '".$data["id_client"]."', 1 )";
	}
	//echo $sql2;
	$query_result2 = execute($sql2, 1);

	if($autologin == 1)
	{
		$password_hash = md5($password); // will result in a 32 characters hash

		setcookie ($cookie_name, 'usr='.$username.'&hash='.$password_hash, time() + $cookie_time);
	}
	///////Redirect after login based on client type//////
	if($_SESSION['client_type']==16){
		$url = "myhome.php";
		//echo '<script type="text/javascript">';
        //echo 'window.location.href="'.$url.'";';
        //echo '</script>';
		header("Location: myhome.php");		
		exit;
	}else{
		$url = "home.php";
		//echo '<script type="text/javascript">';
        //echo 'window.location.href="'.$url.'";';
        //echo '</script>';
		header("Location: home.php");
		//ob_end_clean();
		exit;
	}
}
else
{
	$login_error = true;
}

?>