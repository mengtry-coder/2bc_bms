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
$this->title = "Opening Balance No. #".$model->doc_id;
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
                <?= $model->status == 0 ? '<div class="watermark">VOIDED</div>':'' ?>
                <div style="white-space:nowrap">
                    <?= (new \common\models\GlobalFunction)->OfficialDocumentHeader()?>
                </div>
                <div style="padding-top: 15px;">
                    <div class="btn-group dropdown pull-right no-print" style="z-index: 100;">
                        <button class="btn btn-mint btn-active-mint btn-labeled dropdown-toggle dropdown-toggle-icon" data-toggle="dropdown" type="button">
                            <i class="btn-label demo-pli-dot-vertical"></i> Option
                        </button>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li><a href="#" value="<?= Url::to(['finance-opening-balance/update', 'id' => $model->id]); ?>" data-title="Update Opening Balance : <?= $model->doc_id ?>"  id='modalButton'>Update Opening Balance</a></li>
                            <li><a href="javascript:window.print()">Print</a></li>
                            <!-- <li><a href="#">View PDF</a></li>
                            <li><a href="#">Download</a></li> -->

                            <?php if($model->status <> 0){ ?>
                            <li class="divider"></li>
                            <li><a class="button-void" data-value="<?= yii\helpers\Url::to(['finance-opening-balance/void', 'id' => $model->doc_id]); ?>" title="VOID" data-confirm="Are you sure want to void this file?" data-method="post">Void</a></li>
                            <?php } ?>
                        </ul>
                    </div>
                    <h3 class="h1 text-uppercase text-center text-thin mar-no text-primary">Opening Balance</h3>
                </div>
            </div>

            <div class="invoice-bill row">
                <div class="col-sm-6 col-xs-6 text-xs-center">
                    <strong class="text-main text-uppercase" style="font-size: 16px;">Dposit TO account </strong><br>
                    <span class="text-main text-semibold" style="font-size: 14px;"><?= $model->account->names ?></span>
                </div>
                <div class="col-sm-6 col-xs-6 text-xs-center">
                    <table class="invoice-details">
                        <tbody>
                            <tr>
                                <td class="text-main text-bold">Document Number #</td>
                                <td class="text-right text-info text-bold"><?= $model->doc_id ?></td>
                            </tr>
                            <tr>
                                <td class="text-main text-bold">Transaction Date</td>
                                <td class="text-right"><?= date_format(date_create($model->date),'F d, Y') ?></td>
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
                                <th class="text-uppercase text-left">Chart of Account</th>
                                <th class="text-uppercase" style="width: 30%">Description</th>
                                <th class="text-right text-uppercase" style="width: 15%">Credit</th>
                                <th class="text-right text-uppercase" style="width: 15%">Debit</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <strong><?= $model->account->accountType->names; ?></strong>
                                    <span><?= $model->account->number_code .' | '. $model->account->names ?></span>
                                </td>
                                <td><small><?= $model->description; ?></small></td>
                                <td></td>
                                <td class="text-right">$<?= $model->amount; ?></td>
                            </tr>
                            <tr>
                                <?php $model_equity = \backend\models\ChartAccount::findOne(273); ?>
                                <td>
                                    <strong><?= $model_equity->accountType->names; ?></strong>
                                    <span><?= $model_equity->number_code .' | '. $model_equity->names ?></span>
                                </td>
                                <td><small><?= $model->description; ?></small></td>
                                <td class="text-right">$<?= $model->amount; ?></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <div class="clearfix">
                <!-- <table class="table invoice-total"> -->
                <table class="invoice-overall invoice-details">
                    <tbody>
                        <tr>
                            <td><strong class="text-primary">TOTAL :</strong></td>
                            <td class="text-bold h4">$<?= $model->amount ?></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="readMoneytoLetter"><?= (new \common\models\GlobalFunction)->readMoneytoLetter($model->amount); ?></td>
                        </tr>
                    </tbody>
                </table>
            </div>

    
            <hr class="new-section-sm bord-no">
    
            <div class="well well-sm">
                <p class="text-bold text-main text-uppercase">Notes &amp; Information</p>
                <p><?= nl2br(\backend\models\CompanyProfile::findOne(1)->info_opening_balance) ?></p>
            </div>

        </div>
    </div>


<?php 
Modal::begin([
'header' => ' <h4 class="modal-title">'.'Invoice Payment : #'.$model->doc_id.'</h4>',
'id' => 'modal',
'class' => 'modal fade',
'size' => 'modal-custom-60',
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