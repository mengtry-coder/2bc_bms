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

$this->title = 'Sale Quotation';
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
                        	<div class="row">
				                <div class="col-md-12">
				                    <div class="pull-right">
				                        <button data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButtonInvoice" value="<?= Url::toRoute(['quotation/create']) ?>">                            Add New <i class="fa fa-plus-square go-right"></i>
				                        </button>
				                    </div>
				                </div>
				            </div>
				            <br>

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
				                    'attribute'=>'code',
				                    'format' => 'raw',
				                    'value' => function($model){
				                        return "<a target='_blank' href='". URL::toRoute(['quotation/overview?id='.$model->id])."' class='text-info'> ".$model->code."</a>";
				                    }
				                ],
					            // 'name',
					            [
					                'attribute'=> 'Customer',
					                'format' => 'raw',
					                'value' => function($model){
					                    return "<a href='". URL::toRoute(['customer-profile/profile','id'=>$model->customer->id, 'smMenu'=>1])."' target='_blank' class='text-info'> ".$model->customer->customer_name . ' ('.$model->customer->company_name . ')'."</a>" ;
					                }
					            ],
					            'total',
					            [
					                'attribute' => 'date',
					                'format' => ['date', 'php:d-M, Y'],
					            ],
					            [
					                'attribute' => 'open_till',
					                'format' => ['date', 'php:d-M, Y'],
					            ],
					            //'currency',
					            //'discount_type',
					            //'allow_comment',

					            [
					                'attribute' => 'is_converted_from_proposal',
					                'contentOptions' => ['class' => 'text-center'],
					                'headerOptions' => ['class' => 'text-center'],
					                'format' => 'raw',
					                'value' => function ($model) {
					                    if ($model->is_converted_from_proposal == 1) {
					                        return '<div class="text-center"><span class="label label-info">Yes</span></div>';
					                    } else {
					                        return '<div class="text-center"><span class="label label-danger">No</span></div>';
					                    }
					                },
					            ],
					            [
					                'attribute' => 'status',
					                'contentOptions' => ['class' => 'text-center'],
					                'headerOptions' => ['class' => 'text-center'],
					                'format' => 'raw',
					                'value' => function ($model) {
					                    return '<div class="text-center"><span class="label '.$model->quotationStatus->css_class.'">'.$model->quotationStatus->name.'</span></div>';
					                },
					            ],
					            [
				                    'class' => 'yii\grid\ActionColumn',
				                    'header' => 'Actions',
				                    'headerOptions' =>['class'=>'text-center','style'=>'text-decoration: none; color: #7a878e;outline: 0;'],
				                    'contentOptions' => ['class' => 'text-center'],
				                    'template' => ' {update} {delete}',
				                    'buttons' => [
				                        'view' => function ($url, $model) {
				                                return Html::button('<i class ="fa fa-search"></i>',
				                                [
				                                    'value'=> $url,
				                                    'id'=> 'modalButtonView',
				                                    'data-pjax'=>'0',
				                                    'class' => 'btn btn-xs btn-default',
				                                ]);
				                        },
				                        'update' => function ($url, $model) {
				                        	$url = Url::to(['quotation/update', 'id' => $model->id]);
				                            return Html::button('<i class ="fa fa-pencil"></i>',
				                            [
				                                'value'=> $url,
				                                'id'=> 'modalButtonInvoice',
				                                'data-pjax'=>'0',
				                                'data-title' => 'Update Quotation',
				                                'class' => 'btn btn-xs btn-default',
				                            ]);
				                        },
				                        'delete' => function ($url, $model) {
				                        	$url = Url::to(['quotation/delete', 'id' => $model->id]);
				                            return Html::a('<span class="fa fa-trash"></span>', $url, [
				                                'title' => Yii::t('app', 'lead-delete'),
				                                'class' => 'btn btn-xs btn-default',
				                                'data' => [
				                                    'confirm' => 'Are you sure want to delete it?',
				                                    'method' => 'post',
				                                ],
				                            ]);
				                        }

				                    ],

				                ],
				                
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
        var title = $(this).data("title");
        $("#modal").find(".modal-title").html(title);
    });

JS;

$this->registerJs($script);

?>
