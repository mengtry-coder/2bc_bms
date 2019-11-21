<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;

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
    #container .invoice-total {
        min-width: 600px;
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
        padding-top: 10px;
        padding-bottom: 10px;
    }
    #print-content a[href]:after { display:none; } 

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
    <div class="row" id="print-content">
        <div class="col-md-4 no-print">
            <div class="panel">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel-heading">
                            <h4 style="padding: 10px;" class="h4 text-uppercase text-primary">Payment for Invoice: <?= "<a target='_blank' href='". URL::toRoute(['customer-invoice/view','id'=>$model_invoice->id])."' class='text-info'> ".$model_invoice->doc_id."</a>" ?> </h4>
                        </div>
                        <div class="panel-body">
                             <?= $this->render('payment_view', [
                                'model' => $model,
                                'model_invoice' => $model_invoice,
                                'chart_of_account_bank_amount' => $chart_of_account_bank_amount
                            ]) ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-8">
            <div class="panel">
                <div class="panel-body">
                    <?= $model->status == 0 ? '<div class="watermark">VOIDED</div>':'' ?>
                    <div class="invoice-masthead">
                        <div style="white-space:nowrap">
                            <?= (new \common\models\GlobalFunction)->OfficialDocumentHeader()?>
                        </div>
                        <div style="padding-top: 15px;">
                            <div class="pull-right no-print">
                                <div class="btn-group dropdown" style="z-index: 100;">
                                    <button class="btn btn-mint btn-active-mint btn-labeled dropdown-toggle dropdown-toggle-icon" data-toggle="dropdown" type="button">
                                        <i class="btn-label demo-pli-dot-vertical"></i> Option
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li><a href="javascript:window.print()">Print</a></li>
                                        <!-- <li><a href="#">View PDF</a></li>
                                        <li><a href="#">Download</a></li> -->

                                        <?php if($model->status == 1){ ?>
                                        <li class="divider"></li>
                                        <li><a class="button-void" data-value="<?= yii\helpers\Url::to(['customer-payment/void', 'id' => $model->doc_id]); ?>" title="VOID" data-confirm="Are you sure want to void this file?" data-method="post">Void</a></li>
                                        <?php } ?>
                                    </ul>
                                </div>
                            </div>
                            <h3 class="h1 text-uppercase text-center text-thin mar-no text-primary">Payment Receipt</h3>
                        </div>
                    </div>

                    <div class="invoice-bill row">
                        <div class="col-sm-6 col-xs-9 text-xs-center">
                            <strong class="text-main" style="font-size: 16px;"><?= $model_customer->customer_name . ' ('.$model_customer->company_name . ')' ?></strong><br>
                            <address>
                                <?= $model_customer->billing_address ?>
                           </address>
                        </div>
                        <div class="col-sm-6 col-xs-3 text-xs-center">
                            <div class="text-right no-print">
                                <strong>Payment #<?= $model->doc_id ?></strong>
                                <!-- <a href="javascript:window.print()" class="btn btn-info"><i class="demo-pli-printer icon-lg"></i></a> -->
                            </div>
                        </div>
                    </div>
                    <hr class="new-section-xs bord-no">

                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <ul class="list-group bord-no">
                                <li class="list-group-item">Payment Date <strong class="pull-right"><?= date_format(date_create($model->date),'F d, Y') ?></strong></li>
                                <li class="list-group-item">Payment Method <strong class="pull-right"><?= $model->paymentMethod->names ?></strong></li>
                            </ul>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <div class="panel panel-primary panel-colorful">
                                <div class="pad-all text-center">
                                    <p class="text-1x">Total Amount</p>
                                    <span class="text-2x text-thin">$ <?= number_format($model->receive_amount,2) ?></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <h4>Payment For</h4>
                            <table class="table table-condensed">
                                <thead>
                                    <tr>
                                        <th>Invoice #</th>
                                        <th>Invoice Date</th>
                                        <th>Invoice Amount</th>
                                        <th>Payment Amount</th>
                                        <th style="color: #f22314;">Amount Due</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><?= $model_invoice->doc_id ?></td>
                                        <td><?= date_format(date_create($model_invoice->date),'F d, Y') ?></td>
                                        <td>$<?= $model_invoice->total_amount ?></td>
                                        <td>$<?= $model_invoice->receive_amount ?></td>
                                        <td class="text-danger">$<?= $model_invoice->balance_amount ?></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                
                </div>
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
