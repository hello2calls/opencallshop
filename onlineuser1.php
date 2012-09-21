<?php
ob_start();
include   dirname(__FILE__).'\libdir\database.php';
include dirname(__FILE__).'\libdir\common.inc';

/*switch($usertype)
	{
	    case 0:
	        $sql = "select * from clientsip where login='" . $username . "' and password='" . $password . "'";
			$new_case=2;
            break;

		case 1:
            $sql = "select * from clientshearlink where login='" . $username . "' and password='" . $password . "'";
			$new_case=2;
            break;

        case 2:
            $sql = "select * from clientse164 where login='" . $username . "' and password='" . $password . "'";
			$new_case=2;
            break;

        case 8:
            $sql = "select * from clientspin where login='" . $username . "' and password='" . $password . "'";
			$new_case=2;
            break;

        case 9:
            $sql = "select * from clientscallshop where login='" . $username . "' and password='" . $password . "'";
			$new_case=1;
            break;
        }
		*/

        //$query_result = mysql_query($sql, $con);
/*
$db = 'voipswitch';
$sql = "SHOW TABLES FROM voipswitch";
$query_result = execute($sql, 1);	
 $a = mysql_num_rows($query_result);
 echo "=====";

$tables = array();

while($row = mysql_fetch_array($query_result)) {
    $tables[] = "$row[0]";
}
print_r($tables);



$sql1 = "CREATE TABLE `userloginstatus` (
`id` INT( 10 ) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`id_client` INT( 10 ) NOT NULL ,
`user_status` INT( 10 ) NOT NULL
)";
$query_result = execute($sql1, 1);

$sql2 = "INSERT INTO `userloginstatus` ( `id_client`, `user_status`) VALUES ( 50, 1 )";

$query_result2 = execute($sql2, 1);



$sql = "UPDATE userloginstatus SET user_status=0 WHERE id_client='".$_SESSION['id_callshop']."'";
$query_result = execute($sql, 1);	
 $a = mysql_num_rows($query_result);
 echo $a;
 $data = mysql_fetch_array($query_result,MYSQL_ASSOC);
 print_r($data);



       //$sql = ("ALTER TABLE userloginstatus ".
                "ADD COLUMN newColumnName VARCHAR(100) ".
                "AFTER user_status;");
    $result = mysql_query($query)*/ 
 //$today = date("d M y h:i A");
 //echo $today;
$sql ="SELECT * FROM callscallshop";
$result = execute($sql, 1);	
$fields = mysql_num_fields($result);
$rows   = mysql_num_rows($result);
$table  = mysql_field_table($result, 0);
echo "Your '" . $table . "' table has " . $fields . " fields and " . $rows . " record(s)\n";
echo "The table has the following fields:\n";
for ($i=0; $i < $fields; $i++) {
    $type  = mysql_field_type($result, $i);
    $name  = mysql_field_name($result, $i);
    $len   = mysql_field_len($result, $i);
    $flags = mysql_field_flags($result, $i);
    echo $type . " " . $name . " " . $len . " " . $flags . "\n";
}
mysql_free_result($result);
?>