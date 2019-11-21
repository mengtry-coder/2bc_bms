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
$this->params['breadcrumbs'][] = ['label' => 'Finance', 'url' => '#'];
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
            <div class="row">
                <div class="col-md-12">
                        <?= $this->render('_search', ['model' => $searchModel]); ?>
                </div> 
            </div>

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
                        return "<a target='_blank' href='". URL::toRoute(['customer-payment/view','id'=>$model->id,'doc_id'=>$model->customerInvoice->doc_id])."' class='text-info'> ".$model->doc_id."</a>";
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
                    'attribute' => 'date',
                    'format' => ['date', 'php:d-M, Y'],
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
                    'attribute' => 'status',
                    'contentOptions' => ['class' => 'text-center'],
                    'headerOptions' => ['class' => 'text-center'],
                    'format' => 'raw',
                    'value' => function($model){
                        if($model->status == 0){
                            return '<div class="text-center"><span class="label label-danger">VOIDED</span></div>';
                        }else{
                            return '<div class="text-center"><span class="label label-info">PAID</span></div>';
                        }
                    }
                ]
                
                ],
            ]); ?>
                                
            </div>
        </div>
    </div>
</div>

<?php
$this->registerJs('
        
        var id_customer_profile = "'.$id_customer_profile.'"; 
        var smMenu = "'.$smMenu.'"; 
        var controller_id = "customer-invoice";
        $("#select_page_size").change(function(){
            var page_size = $("#select_page_size").val();
            var url = window.location.pathname;
            window.location.replace(url+"?r="+controller_id+"/index&id_customer_profile="+id_customer_profile+"&smMenu="+smMenu+"&page_size="+page_size);
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
