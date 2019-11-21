<style>
.panel-eo {
    border-color: #f87232;
} 
</style>
<div class="panel"> 
    <div class="row">
        <div class="col-md-4">
            <div class="panel">
                <div class="panel-heading panel-eo"> 
                    <h4 class="panel-title text-normal">INVOICE OVERVIEW</h4> 
                </div>
                <div class="panel-body">  
                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-left">
                                <p class="text-primary text-md"><?=$invoice_overview_1;?> PAID</p> 
                            </div>
                            <div class="pull-right">
                            <p class="text-primary text-md"><?= number_format($invoice_overview_1 / max($allInvoiceToPay, 1) * 100,2);?>%</p> 
                            </div>
                        </div>
                    </div> 
                    <div class="progress progress-sm"><div style="width: <?= $invoice_overview_1 / max($allInvoiceToPay, 1) * 100;?>%;" class="progress-bar progress-bar-mint"></div></div>
                    <br>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-left">
                                <p class="text-primary text-md"><?=$invoice_overview_2;?> OVERDUE</p> 
                            </div>
                            <div class="pull-right">
                            <p class="text-primary text-md"><?= number_format($invoice_overview_2 / max($allInvoiceToPay, 1) * 100,2);?>%</p> 
                            </div>
                        </div>
                    </div>
                    <div class="progress progress-sm"><div style="width: <?= $invoice_overview_2 / max($allInvoiceToPay, 1) * 100;?>%;" class="progress-bar progress-bar-danger"></div></div>
                    <br>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-left">
                                <p class="text-primary text-md"><?=$invoice_overview_3?> PARTIALLY PAID</p> 
                            </div>
                            <div class="pull-right">
                            <p class="text-primary text-md"><?= number_format($invoice_overview_3 / max($allInvoiceToPay, 1) * 100,2);?>%</p> 
                            </div>
                        </div>
                    </div>
                    <div class="progress progress-sm"><div style="width: <?= $invoice_overview_3 / max($allInvoiceToPay, 1) * 100;?>%;" class="progress-bar progress-bar-info"></div></div>
                    <br>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-left">
                                <p class="text-primary text-md"><?=$invoice_overview_4?> UNPAID</p> 
                            </div>
                            <div class="pull-right">
                            <p class="text-primary text-md"><?= number_format($invoice_overview_4 / max($allInvoiceToPay, 1) * 100,2);?>%</p> 
                            </div>
                        </div>
                    </div>
                    <div class="progress progress-sm"><div style="width: <?= $invoice_overview_4 / max($allInvoiceToPay, 1) * 100;?>%;" class="progress-bar progress-bar-success"></div></div>
                  
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel">
                <div class="panel-heading panel-eo"> 
                    <h4 class="panel-title text-normal">QUOTATION OVERVIEW</h4>
                    </div>
                    <div class="panel-body">  
                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-left">
                                <p class="text-primary text-md"><?=$quotation_status_1;?> DRAFT</p> 
                            </div>
                            <div class="pull-right">
                            <p class="text-primary text-md"><?= number_format($quotation_status_1 / max($allQuotation, 1) * 100,2);?>%</p> 
                            </div>
                        </div>
                    </div> 
                    <div class="progress progress-sm"><div style="width: <?= $quotation_status_1 / max($allQuotation, 1) * 100;?>%;" class="progress-bar progress-bar-danger"></div></div>
                    <br>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-left">
                                <p class="text-primary text-md"><?=$quotation_status_2;?> SENT</p> 
                            </div>
                            <div class="pull-right">
                            <p class="text-primary text-md"><?= number_format($quotation_status_2 / max($allQuotation, 1) * 100,2);?>%</p> 
                            </div>
                        </div>
                    </div>
                    <div class="progress progress-sm"><div style="width: <?= $quotation_status_2 / max($allQuotation , 1)* 100;?>%;" class="progress-bar progress-bar-mint"></div></div>
                    <br>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-left">
                                <p class="text-primary text-md"><?=$quotation_status_4;?> EXPIRED</p> 
                            </div>
                            <div class="pull-right">
                            <p class="text-primary text-md"><?= number_format($quotation_status_4 / max($allQuotation, 1) * 100,2);?>%</p> 
                            </div>
                        </div>
                    </div>
                    <div class="progress progress-sm"><div style="width: <?= $quotation_status_4 / max($allQuotation, 1) * 100;?>%;" class="progress-bar progress-bar-info"></div></div>
                    <br>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-left">
                                <p class="text-primary text-md"><?=$quotation_status_5;?> DECLINED</p> 
                            </div>
                            <div class="pull-right">
                            <p class="text-primary text-md"><?= number_format($quotation_status_5 / max($allQuotation, 1) * 100,2);?>%</p> 
                            </div>
                        </div>
                    </div>
                    <div class="progress progress-sm"><div style="width: <?= $quotation_status_5 / max($allQuotation, 1) * 100;?>%;" class="progress-bar progress-bar-success"></div></div>
                    <br>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-left">
                                <p class="text-primary text-md"><?=$quotation_status_6;?> ACCEPTED</p> 
                            </div>
                            <div class="pull-right">
                            <p class="text-primary text-md"><?= number_format($quotation_status_6 / max($allQuotation, 1) * 100,2);?>%</p> 
                            </div>
                        </div>
                    </div>
                    <div class="progress progress-sm"><div style="width: <?= $quotation_status_6 / max($allQuotation, 1) * 100;?>%;" class="progress-bar progress-bar-primary"></div></div>
                    
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel">
                <div class="panel-heading panel-eo">
                    <h4 class="panel-title text-normal">PROPOSAL OVERVIEW</h4>
                </div>
                <div class="panel-body">  
                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-left">
                                <p class="text-primary text-md"><?=$proposal_status_1;?> DRAFT</p> 
                            </div>
                            <div class="pull-right">
                            <p class="text-primary text-md"><?= number_format($proposal_status_1 / max($allProposal, 1) * 100,2);?>%</p> 
                            </div>
                        </div>
                    </div> 
                    <div class="progress progress-sm"><div style="width: <?= $proposal_status_1 / max($allProposal, 1) * 100;?>%;" class="progress-bar progress-bar-danger"></div></div>
                    <br>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-left">
                                <p class="text-primary text-md"><?=$proposal_status_2;?> SENT</p> 
                            </div>
                            <div class="pull-right">
                            <p class="text-primary text-md"><?= number_format($proposal_status_2 / max($allProposal, 1) * 100,2);?>%</p> 
                            </div>
                        </div>
                    </div>
                    <div class="progress progress-sm"><div style="width: <?= $proposal_status_2 / max($allProposal, 1) * 100;?>%;" class="progress-bar progress-bar-mint"></div></div>
                    <br>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-left">
                                <p class="text-primary text-md"><?=$proposal_status_3;?> OPEN</p> 
                            </div>
                            <div class="pull-right">
                            <p class="text-primary text-md"><?= number_format($proposal_status_3 / max($allProposal, 1) * 100,2);?>%</p> 
                            </div>
                        </div>
                    </div>
                    <div class="progress progress-sm"><div style="width: <?= $proposal_status_3 / max($allProposal, 1) * 100;?>%;" class="progress-bar progress-bar-info"></div></div>
                    <br>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-left">
                                <p class="text-primary text-md"><?=$proposal_status_4;?> REVISED</p> 
                            </div>
                            <div class="pull-right">
                            <p class="text-primary text-md"><?= number_format($proposal_status_4 / max($allProposal, 1) * 100,2);?>%</p> 
                            </div>
                        </div>
                    </div>
                    <div class="progress progress-sm"><div style="width: <?= $proposal_status_4 / max($allProposal, 1) * 100;?>%;" class="progress-bar progress-bar-success"></div></div>
                    <br>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-left">
                                <p class="text-primary text-md"><?=$proposal_status_5;?> DECLINED</p> 
                            </div>
                            <div class="pull-right">
                            <p class="text-primary text-md"><?= number_format($proposal_status_5 / max($allProposal, 1) * 100,2);?>%</p> 
                            </div>
                        </div>
                    </div>
                    <div class="progress progress-sm"><div style="width: <?= $proposal_status_5 / max($allProposal, 1) * 100;?>%;" class="progress-bar progress-bar-primary"></div></div>
                    <br>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-left">
                                <p class="text-primary text-md"><?=$proposal_status_6;?> ACCEPTED</p> 
                            </div>
                            <div class="pull-right">
                            <p class="text-primary text-md"><?= number_format($proposal_status_6 / max($allProposal, 1) * 100,2);?>%</p> 
                            </div>
                        </div>
                    </div>
                    <div class="progress progress-sm"><div style="width: <?= $proposal_status_6 / max($allProposal, 1) * 100;?>%;" class="progress-bar progress-bar-warning"></div></div>

                </div>
            </div>
        </div>
    </div> 
    <hr style="margin-top: 0px; margin-bottom: 15px;">
    <div class="row">
        <div class="panel-body" style="padding: 0px 15px 0px 15px;">
            <div class="col-md-4">
                <div class="panel panel-mint panel-colorful media middle pad-all">
                    <div class="media-left">
                        <div class="pad-hor">
                            <i class="demo-pli-coin icon-3x"></i>
                        </div>
                    </div>
                    <div class="media-body">
                        <p class="text-2x mar-no text-semibold">$<?=number_format($countInvoiceAmount_3,2);?></p>
                        <p class="mar-no text-xs">PARTIALLY PAID INVOICES</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-mint panel-colorful media middle pad-all">
                    <div class="media-left">
                        <div class="pad-hor">
                            <i class="demo-pli-coin icon-3x"></i>
                        </div>
                    </div>
                    <div class="media-body">
                        <p class="text-2x mar-no text-semibold">$<?=number_format($countInvoiceAmount_2,2);?></p>
                        <p class="mar-no text-xs">OVERDUE INVOICES</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-mint panel-colorful media middle pad-all">
                    <div class="media-left">
                        <div class="pad-hor">
                            <i class="demo-pli-coin icon-3x"></i>
                        </div>
                    </div>
                    <div class="media-body">
                        <p class="text-2x mar-no text-semibold">$<?=number_format($countInvoiceAmount_1,2);?></p>
                        <p class="mar-no text-xs">PAID INVOICES</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>