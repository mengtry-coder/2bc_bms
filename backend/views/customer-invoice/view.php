<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use common\models\GlobalFunction;

$base_url =  Yii::getAlias('@web');

$this->registerJsFile(
    '@web/js/sweetalert.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);
$this->title = $model->doc_id;
// $this->params['breadcrumbs'][] = ['label' => 'Sale', 'url' => '#'];
// $this->params['breadcrumbs'][] = ['label' => 'Invoices', 'url' => ['index']];
// $this->params['breadcrumbs'][] = $this->title;
// \yii\web\YiiAsset::register($this);
?>
<style type="text/css">
    #container .invoice-overall {
        min-width: 300px;
    }
    #container .invoice-overall td:nth-child(2) {
        text-align: right;
    }
    .readMoneytoLetter {
        font-style: italic;
    }
    #container .invoice-masthead {
        margin-bottom: 10px;
    }
    .new-section-sm {
        margin: 5px 0px;
    }
    #container .invoice-summary thead>tr>th {
        padding-top: 5px;
        padding-bottom: 5px;
    }
    .amount_due td {
        color: red !important;
        font-weight: bold;
    }
    #print-content a[href]:after { display:none; } 

    .modal-ml {
        width: 95% !important;
    }
    .watermark {
        margin-top: 168px;
        position: absolute;
        opacity: 0.25;
        background: transparent;
        width: 100%;
        text-align: center;
        z-index: 1;
        letter-spacing: 10px;
        font-size:150px;
        transform:rotate(300deg);
        -webkit-transform:rotate(333deg);
    }
    @media print 
    {
        @page {
          size: A4; /* DIN A4 standard, Europe */
          margin:0;
        }
        html, body {
            width: 210mm;
            /* height: 297mm; */
            height: 282mm;
            font-size: 11px;
            background: #FFF;
            overflow:visible;
        }
        #content-container {
            padding-top: 0px;
        }
    }
</style>    

    <div class="panel" id="print-content">
        <div class="panel-body">
            <div class="invoice-masthead">
                <?= $model->status == 5 ? '<div class="watermark">VOIDED</div>':'' ?>
                <div style="white-space:nowrap">
                    <?= (new \common\models\GlobalFunction)->OfficialDocumentHeader()?>
                </div>
                <div style="padding-top: 15px;">
                    <div class="btn-group dropdown pull-right no-print" style="z-index: 100;">
                        <button class="btn btn-mint btn-active-mint btn-labeled dropdown-toggle dropdown-toggle-icon" data-toggle="dropdown" type="button">
                            <i class="btn-label demo-pli-dot-vertical"></i> Option
                        </button>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li><a href="#" value="<?= Url::to(['customer-invoice/update', 'id' => $model->id]); ?>" data-title="Update Invoice : <?= $model->doc_id ?>"  id='modalButton'>Update Invoice</a></li>
                            <li><a href="javascript:window.print()">Print</a></li>
                            <!-- <li><a href="#">View PDF</a></li>
                            <li><a href="#">Download</a></li> -->

                            <?php if($model->status <> 5 && $model->receive_amount == 0){ ?>
                            <li class="divider"></li>
                            <li><a class="button-void" data-value="<?= yii\helpers\Url::to(['customer-invoice/void', 'id' => $model->doc_id]); ?>" title="VOID" data-confirm="Are you sure want to void this file?" data-method="post">Void</a></li>
                            <?php } ?>
                        </ul>
                    </div>
                    <h3 class="h1 text-uppercase text-center text-thin mar-no text-primary">INVOICE</h3>
                </div>
            </div>

            <div class="invoice-bill row">
                <div class="col-sm-6 col-xs-6 text-xs-center">
                    <strong class="text-main" style="font-size: 16px;"><?= $model_customer->customer_name . ' ('.$model_customer->company_name . ')' ?></strong><br>
                    <address>
                        <?= $model_customer->billing_address ?>
                   </address>
                </div>
                <div class="col-sm-6 col-xs-6 text-xs-center">
                    <table class="invoice-details">
                        <tbody>
                            <tr>
                                <td class="text-main text-bold">Invoice #</td>
                                <td class="text-right text-info text-bold"><?= $model->doc_id ?></td>
                            </tr>
                            <tr>
                                <td class="text-main text-bold">Status</td>
                                <td class="text-right"><span class="label <?= $model->invoiceStatus->css_class ?>"><?= $model->invoiceStatus->name ?></span></td>
                            </tr>
                            <tr>
                                <td class="text-main text-bold">Billing Date</td>
                                <td class="text-right"><?= date_format(date_create($model->date),'F d, Y') ?></td>
                            </tr>
                            <tr>
                                <td class="text-main text-bold">Due Date</td>
                                <td class="text-right"><?= date_format(date_create($model->due_date),'F d, Y') ?></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        
            <hr class="new-section-sm bord-no">
    
            <div class="row">
                <div class="col-lg-12 table-responsive">
                    <table class="table table-bordered invoice-summary">
                        <thead>
                            <tr class="bg-trans-dark">
                                <th class="text-uppercase">Description</th>
                                <th class="min-col text-center text-uppercase">Qty</th>
                                <th class="min-col text-center text-uppercase">Discount</th>
                                <th class="min-col text-right text-uppercase">Rate</th>
                                <th class="min-col text-right text-uppercase">Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                                $i = 0;
                                foreach ($model_item as $key => $value) {
                                    $i++;
                            ?>
                            <tr>
                                <td>
                                    <strong><?= $value->item_name; ?></strong>
                                    <small><?= $value->description; ?></small>
                                </td>
                                <td class="text-center"><?= $value->qty; ?></td>
                                <?php 
                                    if($value->discount_amount > 0){
                                        if($value->discount_type == 1){
                                            $discount = $value->discount_amount.'%';
                                        }else{
                                            $discount = '$'.$value->discount_amount;
                                        }
                                    }else{
                                        $discount = '--,--';
                                    }
                                ?>
                                <td class="text-center"><?= $discount ?></td>
                                <td class="text-right">$<?= $value->rate; ?></td>
                                <td class="text-right">$<?= $value->amount; ?></td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
    
            <div class="clearfix">
                <!-- <table class="table invoice-total"> -->
                <table class="invoice-overall invoice-details">
                    <tbody>
                        <tr>
                            <td><strong class="text-primary">Sub Total :</strong></td>
                            <td>$<?= $model->sub_total ?></td>
                        </tr>
                        <tr>
                            <td><strong class="text-primary">Discount (-):</strong></td>
                            <td><?= $model->discount_amount>0?'$'.$model->discount_amount : '--,--'; ?></td>
                        </tr>
                        <tr>
                            <td><strong class="text-primary">TAX (+):</strong></td>
                            <td><?= $model->tax_amount>0?'$'.$model->tax_amount : '--,--'; ?></td>
                        </tr>
                        <tr>
                            <td><strong class="text-primary">TOTAL :</strong></td>
                            <td class="text-bold h4">$<?= $model->total_amount ?></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="readMoneytoLetter"><?= (new \common\models\GlobalFunction)->readMoneytoLetter($model->total_amount); ?></td>
                        </tr>
                        <tr class="amount_due">
                            <td><strong class="text-primary">Amount Due :</strong></td>
                            <td>$<?= $model->balance_amount ?></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <?php if($model->balance_amount > 0 && $model->status <> 5){ ?>
            <div class="row no-print">
                <br>
                <div class="col-md-4 col-md-offset-8">
                    <div class="input-group mar-btm">
                         <span class="input-group-addon"><i class="fa fa-dollar"></i></span>
                        <input type="number" readonly style="background: #fff;" value="<?= $model->balance_amount; ?>" id="invoice_amount" max="<?= $model->balance_amount; ?>" min=0 step=0.01 class="form-control">
                        <span class="input-group-btn">
                            <button class="btn btn-primary" id="invoice_payment" value="<?= Url::toRoute(['customer-payment/payment','id'=>$model->id]) ?>" type="button">CONFIRM PAYMENT</button>
                        </span>
                    </div>
                </div>
            </div>   
            <?php } ?> 
    
            <hr class="new-section-sm bord-no">
    
            <div class="well well-sm">
                <p class="text-bold text-main text-uppercase">Notes &amp; Information</p>
                <p><?= nl2br($model->term_condition) ?></p>
                <p><?= nl2br(\backend\models\CompanyProfile::findOne(1)->info_invoice) ?></p>
            </div>
            <div class="transaction-detail">
                <?php if($model->receive_amount > 0){ ?>

                    <h4>Transactions</h4>
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <th>Payment #</th>
                                <th>Payment Method</th>
                                <th>Date</th>
                                <th>Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($model_payment as $key => $value) { ?>
                            <tr>
                                <td><?= "<a target='_blank' href='". URL::toRoute(['customer-payment/view','id'=>$value->id, 'doc_id'=>$model->doc_id])."' class='btn-link'> ".$value->doc_id."</a>"; ?></td>
                                <td><?= $value->paymentMethod->names ?></td>
                                <td><?= date_format(date_create($value->date),'F d, Y') ?></td>
                                <td>$<?= $value->receive_amount ?></td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>

                <?php }else{ ?>
                    <h4>No payments found for this invoice</h4>
                <?php } ?>
            </div>

        </div>
    </div>
    
<?php 
Modal::begin([
'header' => ' <h4 class="modal-title">'.'Invoice Payment : #'.$model->doc_id.'</h4>',
'id' => 'modal',
'class' => 'modal fade',
'size' => 'modal-ml',
]);
echo "<div id='modalContent'></div>";
Modal::end();

$script = <<<JS

    var base_url = "$base_url";

    $(document).on("click","#modalButton",function () {
        $("#modal").modal("show")
            .find("#modalContent")
            .load($(this).attr("value"));
        var title = $(this).data("title");
        $("#modal").find(".modal-title").html(title);
    });

    $("#print_content").click(function(){
        var printContents = document.getElementById("page-content").innerHTML;
        var originalContents = document.body.innerHTML;

        document.body.innerHTML = printContents;

        window.print();

        document.body.innerHTML = originalContents;
    });

    $(document).on("click","#invoice_payment",function () {
        $("#modal").modal("show")
            .find("#modalContent")
            .load($(this).attr("value"));
    });

    $(document).on('change','input[type=number]',function(){
        if($(this).val() == '' || $(this).val() < 0){
            $(this).val(0);
        }
    });

    yii.confirm = function (message, okCallback, cancelCallback) {
        var val = $(this).data('value');
        
        if($(this).hasClass('button-void')){
            swal({
                text: "Are you sure you want to void this transaction?",
                icon: "warning",
                buttons: true,
                buttons: [
                    'No',
                    'Yes'
                ],
                dangerMode: false
            }).then(function(isConfirm) {
                if (isConfirm) {
                    $.post(val); // <--- submit form programmatically
                    $('#overlay').css({'display':'block','z-index':'9999'});
                }
            });
        }
    };

JS;

$this->registerJs($script);

?>
