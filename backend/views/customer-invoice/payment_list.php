<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\CustomerInvoiceSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$request = Yii::$app->request; 
$id_customer_profile = $request->get('id_customer_profile',0);
if($id_customer_profile != 0){
    $smMenu = 1;
}else{
    $smMenu = 0;
}
$this->title = 'Payments';
$this->params['breadcrumbs'][] = ['label' => 'Sale', 'url' => '#'];
$this->params['breadcrumbs'][] = $this->title;

function calculateProgress($current, $all){
    if($all == 0){
        $all = 1;
    }
    $result = ($current / $all) * 100;
    return number_format($result,2);
}
?>
<style type="text/css">
    .modal-ml {
        width: 95% !important;
    }
    .progress-bar {
        font-weight: bold;
    }
</style>
<div class="customer-invoice-index">


    <div class="panel">
        <div class="panel-body">

            <?php
                Modal::begin([
                    'header' => ' <h4 class="modal-title">'.'Customer Invoices'.'</h4>',
                    'id' => 'modal',
                    'class' => 'modal fade',
                    'size' => 'modal-ml',
                ]);
                echo "<div id='modalContent'></div>";
                Modal::end();

            ?>

            <div class="table-responsive">
                <?= GridView::widget([
                'dataProvider' => $dataProvider,
                'tableOptions' => [ 
                    'class' => 'table table-striped table-hover',
                    'cellspacing'=>'0',
                    'width'=>'100%', 
                    ],
                'layout'=>"
                    {items}
                        <div class='col-md-5 '>
                            <label class='form-inline'>
                                Show ".
                            Html::dropDownList('page_size',
                            $page_size,
                            Yii::$app->params['page_size'],
                            array('class' => 'form-control', 'id' => 'select_page_size'))."
                            </label>
                        </div>
                        <div class='col-md-2' style='padding-top: 5px;'>
                            {summary}
                        </div>
                        <div class='col-md-5' style='text-align: right;'>
                            {pager}
                        </div>
                        ",
                'pager' => [
                    'firstPageLabel' => 'First',
                    'lastPageLabel' => 'Last',
                    'maxButtonCount' => 5,
                ],
                
                //'filterModel' => $searchModel,
        
                'columns' => [
                ['class' => 'yii\grid\SerialColumn'],

                [
                    'attribute'=>'doc_id',
                    'header' => 'Payment #',
                    'format' => 'raw',
                    'value' => function($model){
                        return "<a target='_blank' href='". URL::toRoute(['customer-invoice/view-payment','id'=>$model->id])."' class='text-info'> ".$model->doc_id."</a>";
                    }
                ],
                [
                    'attribute'=>'id_customer_invoice',
                    'header' => 'Invoice #',
                    'format' => 'raw',
                    'value' => function($model){
                        return "<a target='_blank' href='". URL::toRoute(['customer-invoice/view','id'=>$model->customerInvoice->id])."' class='text-info'> ".$model->customerInvoice->doc_id."</a>";
                    }
                ],
                [
                    'attribute'=> 'id_customer',
                    'header' => 'Customer',
                    'format' => 'raw',
                    'value' => function($model){
                        return "<a href='". URL::toRoute(['customer-profile/profile','id'=>$model->customerInvoice->customer->id, 'smMenu'=>1])."' target='_blank' class='text-info'> ".$model->customerInvoice->customer->customer_name . ' ('.$model->customerInvoice->customer->company_name . ')'."</a>" ;
                    }
                ],

                [
                    'attribute'=> 'id_project',
                    'header' => 'Project',
                    'format' => 'raw',
                    'value' => function($model){
                        if(!empty($model->customerInvoice->id_project)){
                            return "<a href='". URL::toRoute(['project/overview','id'=>$model->customerInvoice->project->id])."' target='_blank' class='text-info'> ".$model->customerInvoice->project->project_name."</a>" ;
                        }
                    }
                ],
                [
                    'attribute'=> 'receive_amount',
                    'contentOptions' => ['class' => 'text-right'],
                    'headerOptions' => ['class' => 'text-right'],
                    'value' => function($model){
                        return '$'. $model->receive_amount;
                    }
                ],
                [
                    'attribute' => 'date',
                    'format' => ['date', 'php:d-M, Y'],
                ],
                
                ],
            ]); ?>
                                
            </div>
        </div>
    </div>
</div>

<?php
$this->registerJs('
        var controller_id = "customer-invoice";
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

?>
