<?php

/* @var $this yii\web\View */

$this->title = 'Dashboard';
$this->params['breadcrumbs'][] = $this->title; 

$this->registerJsFile( 
'@web/plugins/morris-js/morris.min.js', 
    ['depends' => [\yii\web\JqueryAsset::className()]]
); 
$this->registerJsFile(  
	'@web/plugins/morris-js/raphael-js/raphael.min.js', 
		['depends' => [\yii\web\JqueryAsset::className()]]
); 
 
?>
<style>
.panel-eo {
    border-color: #f87232;
}  
</style>

<div class="site-index">  
	<!-- <div class="menuSideDashbaord aside-toggle">
		<i class="demo-pli-layout-grid"></i>
	</div>  -->
	<?php echo $this->render("//site/_dashbaord_side_bar_menu.php");?>
	<div class="row">
		<?= $this->render("//site/_dashbaord_show_process.php",[
			'waitingInvoiceToPay'=>$waitingInvoiceToPay,'allInvoiceToPay'=>$allInvoiceToPay,
			'leadConverted'=>$leadConverted,
			'allLead'=>$allLead,
			'projectInprogress' => $projectInprogress,
			'allProject' => $allProject,
			'taskCompleted' => $taskCompleted,
            'allTask' => $allTask,
		]);?>
	</div>
	<div class="row">
		<div class="col-md-9"> 
			<?= $this->render("//site/_dashbaord_show_overview.php",[
				'allInvoiceToPay' => $allInvoiceToPay,
				'invoice_overview_1' => $invoice_overview_1,
				'invoice_overview_2' => $invoice_overview_2,
				'invoice_overview_3' => $invoice_overview_3,
				'invoice_overview_4' => $invoice_overview_4,
				'allQuotation' => $allQuotation,
				'quotation_status_1' => $quotation_status_1,
				'quotation_status_2' => $quotation_status_2, 
				'quotation_status_4' => $quotation_status_4,
				'quotation_status_5' => $quotation_status_5,
				'quotation_status_6' => $quotation_status_6,
				'allProposal' => $allProposal,
				'proposal_status_1' => $proposal_status_1,
				'proposal_status_2' => $proposal_status_2, 
				'proposal_status_3' => $proposal_status_3,
				'proposal_status_4' => $proposal_status_4,
				'proposal_status_5' => $proposal_status_5,
				'proposal_status_6' => $proposal_status_6,
				'countInvoiceAmount_1' => $countInvoiceAmount_1,
				'countInvoiceAmount_2' => $countInvoiceAmount_2,
				'countInvoiceAmount_3' => $countInvoiceAmount_3,
			]);?>
		</div> 
		<div class="col-md-3">
			<div class="panel">
				<div class="panel-heading panel-eo"> 
					<h4 class="panel-title text-normal">STATISTICS by PROJECT STATUS</h4>
				</div> 
				<div class="panel-body">
					<div id="demo-morris-donut" class="morris-donut" style="height: 250px"></div>
				</div>
			</div>

			<div class="panel">
				<div class="panel-heading panel-eo"> 
					<h4 class="panel-title text-normal">LEADS OVERVIEW</h4>
				</div> 
				<div class="panel-body">
					<div id="demo-morris-donut-lead-overview" class="morris-donut" style="height: 250px"></div>
				</div>
			</div>
		</div>
	</div>
  
</div>
<?php
$script = <<<JS
	// START STATISTICS by PROJECT STATUS
	Morris.Donut({
        element: 'demo-morris-donut',
        data: [
            {label: 'Not Started', value: $status_1},
            {label: 'In Progress', value: $status_2},
			{label: 'On Hold', value: $status_3},
			{label: 'Cancelled', value: $status_4},
            {label: 'Finished', value: $status_5}, 
        ],
        colors: [
            '#2ab2a6',
            '#92c755',
			'#ffb80f',
			'#f45145',
			'#06b1fc'
        ],
        resize:true
	});
	// END STATISTICS by PROJECT STATUS

	// START LEADS OVERVIEW
	Morris.Donut({
        element: 'demo-morris-donut-lead-overview',
        data: [
            {label: 'New', value: $lead_customer_status_1},
            {label: 'Contacted', value: $lead_customer_status_2},
			{label: 'Qualified', value: $lead_customer_status_3},
			{label: 'Working', value: $lead_customer_status_4},
			{label: 'Proposal Sent', value: $lead_customer_status_5}, 
			{label: 'Customer', value: $lead_customer_status_6}, 
        ],
        colors: [ 
            '#718093',
			'#17c0eb',
			'#ff793f',
			'#079992',
			'#227093',
			'#44bd32'
        ],
        resize:true
	});
	// END LEADS OVERVIEW
	
JS;

$this->registerJs($script);

?>
