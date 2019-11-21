<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\StandardOperationProcedureSetUpSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$id_position = @$_GET['id_position'];

$this->registerJsFile(
    '@web/plugins/ckeditor/ckeditor.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

$this->title = 'Standard Operation Procedures';
$this->params['breadcrumbs'][] = $this->title;
?>
<style>
.panel-eo {
    border-color: #f87232;
}
.fullscreen{
overflow: scroll;
}
</style> 
<div class="standard-operation-procedure-set-up-index">

    <?php
        Modal::begin([
            'header' => ' <h4 class="modal-title">'.'Standard Operation Procedures'.'</h4>',
            'id' => 'modal',
            'class' => 'modal fade',
            'size' => 'modal-md',
        ]);
        echo "<div id='modalContent'></div>";
        Modal::end();
    
    ?>

    <div class="row">
        <div class="col-md-3"> 

            <div class="panel"> 
                <div class="panel-heading panel-eo">
                    <h3 class="panel-title" style="font-weight: 500;">

                        <div class="row">
                            <div class="col-md-12">
                                <div class="pull-right">
                                    <button data-target="#demo-default-modal" data-toggle="modal" class="btn btn-xs btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['standard-operation-procedure-set-up/create']) ?>">                            Add New <i class="fa fa-plus-square go-right"></i>
                                    </button> 
                                </div>
                            </div>
                        </div>

                    </h3>
                </div>
                <div class="panel-body"> 
                    <div class="list-group"> 
                        <a class="list-group-item emNavActiveOnAction_invoice" href="<?= Url::toRoute('sale-report/invoice?smMenu=1') ?>">Invoices</a>
                        <!-- <a class="list-group-item emNavActiveOnAction_item" href="<?= Url::toRoute('sale-report/item?smMenu=1') ?>">Items</a> -->
                        <!-- <a class="list-group-item emNavActiveOnAction_payment-recieve" href="<?= Url::toRoute('sale-report/payment-recieve?smMenu=1') ?>">Payments Received</a> -->
                        <!-- <a class="list-group-item emNavActiveOnAction_credit-note" href="<?= Url::toRoute('sale-report/credit-note?smMenu=1') ?>">Credit Notes</a> -->
                        <a class="list-group-item emNavActiveOnAction_proposal" href="<?= Url::toRoute('sale-report/proposal?smMenu=1') ?>">Proposals</a>
                        <a class="list-group-item emNavActiveOnAction_quotation" href="<?= Url::toRoute('sale-report/quotation?smMenu=1') ?>">Quotations</a>
                        <!-- <a class="list-group-item emNavActiveOnAction_customer" href="<?= Url::toRoute('sale-report/customer?smMenu=1') ?>">Customers</a> -->
                    </div> 
                </div>
            </div>

        </div>
        <div class="col-md-9">
            <div class="panel">
                <div class="panel-heading panel-eo">
                    <h3 class="panel-title" style="font-weight: 500;">Content</h3>
                </div>
                <div class="panel-body"> 
                    Content Here
                </div>
            </div>
        </div>
    </div>
</div>

<?php
$this->registerJs('
        var controller_id = "standard-operation-procedure-set-up";
        $("#select_page_size").change(function(){
            var page_size = $("#select_page_size").val();
            var url = window.location.pathname;
                window.location.replace(url+"?r="+controller_id+"/index&page_size="+page_size);
        });


        $(document).on("click","#modalButton",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
        });

        $(document).on("click","#modalButtonView",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
        });

        $(document).on("click","#modalButtonUpdate",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
        });

    ');

$sop_detail = URL::toRoute(['standard-operation-procedure-set-up/sop-setup']);
$script = <<<JS

    $("td").click(function (e) {
        var id = $(this).closest("tr").data("id"); 
        var url = "$sop_detail" + '?id_position=' + id;
        if(e.target == this)
            location.href = url;
    });

    $(function () {
        $("[data-toggle='tooltip']").tooltip();
    });

JS;
$this->registerJs($script);
?>
    
