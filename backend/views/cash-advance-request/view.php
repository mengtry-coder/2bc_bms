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
                            <h4 style="padding: 10px;" class="h4 text-uppercase text-primary">Cash Advance #<?= $model->doc_id ?> </h4>
                        </div>
                        <div class="panel-body">
                             <?= $this->render('_form_view', [
                                'model' => $model,
                                'pay_type_name' => $pay_type_name
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
                                        <li><a href="#">View PDF</a></li>
                                        <li><a href="#">Download</a></li>

                                        <?php if($model->status == 1){ ?>
                                        <li class="divider"></li>
                                        <li><a class="button-void" data-value="<?= yii\helpers\Url::to(['cash-advance-request/void', 'id' => $model->doc_id]); ?>" title="VOID" data-confirm="Are you sure want to void this file?" data-method="post">Void</a></li>
                                        <?php } ?>
                                    </ul>
                                </div>
                            </div>
                            <h3 class="h1 text-uppercase text-center text-thin mar-no text-primary">Cash Advance Request</h3>
                        </div>
                    </div>
                    
                    <div class="invoice-bill row">
                        <div class="col-sm-6 col-xs-9 text-xs-center">
                            <strong class="text-main" style="font-size: 16px;"><?= $model->employee->id_prefix . ' '. $model->employee->first_name . ' ' . $model->employee->last_name; ?></strong><br>
                            <span>Join Date: <?= empty($model->employee->join_date) ? '--,--' : $model->employee->join_date ?></span><br>
                            <span>Position: <?= $model->employee->position->position_type ?></span><br>
                            <span>Contact: <a href="tel:<?= $model->employee->phone_number ?> " class='text-info'><?= $model->employee->phone_number ?></a></span><br>
                            <address>
                                Address: <?= $model->employee->address ?>
                           </address>
                        </div>
                        <div class="col-sm-6 col-xs-3 text-xs-center">
                            <div class="text-right">
                                <strong>Request No. #<?= $model->doc_id ?></strong>
                            </div>
                        </div>
                    </div>
                    <hr class="new-section-xs bord-no">

                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <ul class="list-group bord-no">
                                <li class="list-group-item">Payment Date <strong class="pull-right"><?= date_format(date_create($model->date),'F d, Y') ?></strong></li>
                                <li class="list-group-item">Payback Type <strong class="pull-right"><?= $model->payment->name ?></strong></li>
                            </ul>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <div class="panel panel-primary panel-colorful">
                                <div class="pad-all text-center">
                                    <p class="text-1x">Total Amount</p>
                                    <span class="text-2x text-thin">$ <?= number_format($model->amount,2) ?></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <h4>Deduct For</h4>
                            <table class="table table-condensed">
                                <thead>
                                    <tr>
                                        <th>Payroll #</th>
                                        <th>Payroll Date</th>
                                        <th>Payroll Amount</th>
                                        <th>Deduct Amount</th>
                                        <th style="color: #f22314;">Amount Due</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        
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

$script = <<<JS

    var base_url = "$base_url";

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
