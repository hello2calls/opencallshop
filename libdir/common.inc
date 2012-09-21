<?php

function dbconnect(){
        global $db_handle,$db_user,$db_host,$db_pass;
        global $message;
        $db_handle = mysql_pconnect($db_host,$db_user,$db_pass);

        if (!$db_handle) {
                $message = mysql_error();
                return 0;
        } else {
 
                return 1;
 
        }
}
function mysql_real_escape_array($t){
    global $db_handle;
        if (!$db_handle) {dbconnect();}    	
    return array_map("mysql_real_escape_string",$t);
} 

function execute($query, $error=0)
{
        global $message,$database;
        global $db_handle;
        if (!$db_handle) {dbconnect();}
	
        $AllData = mysql_db_query($database,$query);
        if (mysql_errno())
         {
               // print "<br> Error in query: $query <br> -->Error:".mysql_error()."<hr><a href=javascript:history.back()>Back</a>";
                exit;
                }
 
         return $AllData;
}


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
?>
