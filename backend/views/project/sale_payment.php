<?php

use yii\helpers\Html; 
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;

$class_id = Yii::$app->controller->action->id; 

$this->title = 'Sale';
$this->params['breadcrumbs'][] = ['label' => 'Project', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->project_name];
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
</style>
<div class="project-profile">
    <?= $this->render('//project/_top_tab'); ?>

    <div class="panel" style="border-top-left-radius: 0px;">
        <div class="panel-body">
        	<?= $this->render('//project/_top_header'); ?>
        	<p class="text-main text-bold">Project Invoices</p>
        <hr>
            <div class="row">
                <div class="col-md-2 col-sm-3">
                    <?= $this->render('//project/_sale_tab'); ?>
                </div>
                <div class="col-md-10 col-sm-9">
                <!-- End Customer Invoice Grid View -->
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
				                            
				                        </div>
				                        <div class='col-md-2' style='padding-top: 5px;'>
				                        </div>
				                        <div class='col-md-5' style='text-align: right;'>
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
                <!-- Customer Invoice Grid View -->
                </div>
            </div>
        </div>
    </div>



</div>

<?php 

$script = <<<JS

    $(document).on("click","#modalButton",function () {
        $("#modal").modal("show")
            .find("#modalContent")
            .load($(this).attr("value"));
    });

JS;

$this->registerJs($script);

?>
