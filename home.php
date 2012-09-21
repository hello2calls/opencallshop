<?php
include('topheader.php');
?>
  <tr>
     <td><table border="0" cellspacing="0" cellpadding="0" class="tablebg">
      <tr>        
        <td id="dashboard">
			<strong><?php echo YOUR_BAL ;?> $ <?php echo $_SESSION['credit'];?></strong>
			<br/><br/>
			<div class="dashboardbg">
				<a href="javascript:void(0);" onclick="OpenLink('payhistory');" title="Payment History">
				<span class="dashboardtxt">
					<img src="images/payment.gif" alt="Payment History"  title="Payment History">
					<?php echo PAYMENTSHISTORY ;?>
				</span></a>
			</div>
			<div class="dashboardbg">
				<a href="javascript:void(0);" onclick="OpenLink('dtariff');" title="Tariff">
					<span class="dashboardtxt">
						<img src="images/tariff.gif" alt="Tariff" title="Tariff"><?php echo TARIFF ;?>
					</span>
				</a>
			</div>
			<div class="dashboardbg">
				<a href="javascript:void(0);" onclick="OpenLink('callshistory');" title="Calls History">
					<span class="dashboardtxt">
						<img src="images/callhistory.gif" alt="Calls History" title="Calls History"><?php echo CALLHISTORY ;?>
					</span>
				</a>
			</div>
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
