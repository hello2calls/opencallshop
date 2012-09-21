<?php
include('../admin/constant.php');
$refreshtime=REFRESHTIME;
include('topheader.php');
$usertype=$_SESSION['usertype'];
$username=$_SESSION['username'];
?>
  <tr>
     <td><table border="0" cellspacing="0" cellpadding="0" class="tablebg">
      <tr>
      
        <td width="100%" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="10">
          <tr>
            <td>
<?php
print("<center>");
// Get current username and password
$username = $_REQUEST["username"];
$usertype = $_REQUEST["usertype"];
print("<form ID='frmProcessLogin' METHOD=POST ACTION=\"\">");
print("<INPUT TYPE=hidden name='username' ID='username' VALUE='" . $username . "'>");
print("<INPUT TYPE=hidden name='usertype' ID='usertype' VALUE='" . $usertype . "'>");
$curr_date = getdate();

print("</BR>");
print("<LABEL onClick=\"OpenLink('calls');\" style='font-family:verdana;font-size:11px;cursor:hand;'><u>Calls</u> | </LABEL>");
print("<LABEL onClick=\"OpenLink('recharges');\" style='font-family:verdana;font-size:11px;cursor:hand;'><u>Recharges</u> | </LABEL>");
print("<LABEL onClick=\"OpenLink('searchcalls');\" style='font-family:verdana;font-size:11px;cursor:hand;'><u>Search Calls</u> | </LABEL>");
print("<LABEL onClick=\"OpenLink('index');\" style='font-family:verdana;font-size:11px;cursor:hand;'> <u>Log out</u></LABEL>");
print("</BR>");
print("</BR>");
print("<TABLE cellpadding=0 cellspacing=0 style='font-family:verdana; font-size:10px;'>");
print("<tr>");
print("<td>Start Date</td>");
print("<td><INPUT TYPE=text name='startdate' ID='startdate' style='font-family:verdana; font-size:10px;' VALUE='" . $curr_date['year'] . "-" . $curr_date['mon'] . "-" . $curr_date['mday']  . "'> yyyy/mm/dd</td>");
print("</tr>");
print("<tr>");
print("<td>End Date</td>");
print("<td><INPUT TYPE=text name='enddate' ID='enddate' style='font-family:verdana; font-size:10px;' VALUE='" . $curr_date['year'] . "-" . $curr_date['mon'] . "-" . $curr_date['mday']  . "'> yyyy/mm/dd</td>");
print("</tr>");
print("<tr>");
print("<td colspan=2 align=center><INPUT TYPE=BUTTON ID=btnSubmit style='font-family:verdana; font-size:10px;' VALUE='Get Calls' onClick='SubmitSearchCalls();'></td>");
print("</TR>");
print("</TABLE>");
print("</form>");
print("</BR>");
print("<LABEL onClick=\"OpenLink('calls');\" style='font-family:verdana;font-size:11px;cursor:hand;'><u>Calls</u> | </LABEL>");
print("<LABEL onClick=\"OpenLink('recharges');\" style='font-family:verdana;font-size:11px;cursor:hand;'><u>Recharges</u> | </LABEL>");
print("<LABEL onClick=\"OpenLink('searchcalls');\" style='font-family:verdana;font-size:11px;cursor:hand;'><u>Search Calls</u> | </LABEL>");
print("<LABEL onClick=\"OpenLink('index');\" style='font-family:verdana;font-size:11px;cursor:hand;'><u>Log out</u></LABEL>");
?>
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