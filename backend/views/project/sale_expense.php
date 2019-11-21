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
                <?= $this->render('_search_expense', ['model' => $searchModel]); ?>
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
				                ],
				                [
				                    'attribute' => 'date',
				                    'format' => ['date', 'php:d-M, Y'],
				                ],
				                [
				                    'attribute'=> 'id_related_to',
				                    'value'=> 'relatedTo.name'
				                ],
				                [
				                    'attribute'=> 'id_related_profile',
				                    'format' => 'raw',
				                    'value' => function($model){
				                        if($model->id_related_to == 1){
				                            return $model->expenseProfile->supplier_name . ' ('.$model->expenseProfile->company_name . ')';
				                        }else if($model->id_related_to == 2){
				                            return "<a href='". URL::toRoute(['customer-profile/profile','id'=>$model->expenseProfile->id, 'smMenu'=>1])."' target='_blank' class='text-info'> ".$model->expenseProfile->customer_name . ' ('.$model->expenseProfile->company_name . ')'."</a>" ;
				                        }else if($model->id_related_to == 3){
				                            return "<a href='". URL::toRoute(['project/overview','id'=>$model->expenseProfile->id])."' target='_blank' class='text-info'> ".$model->expenseProfile->project_name."</a>" ;
				                        }
				                    }
				                ],

				                [
				                    'attribute'=> 'total_amount',
				                    'contentOptions' => ['class' => 'text-right'],
				                    'headerOptions' => ['class' => 'text-right'],
				                    'value' => function($model){
				                        return '$'. $model->total_amount;
				                    }
				                ],
				                [
				                    'class' => 'yii\grid\ActionColumn',
				                    'header' => 'Actions',
				                    'headerOptions' =>['class'=>'text-center','style'=>'text-decoration: none; color: #7a878e;outline: 0;'],
				                    'contentOptions' => ['class' => 'text-center'],
				                    'template' => '{update}',
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
				                        	$url = Url::to(['expense/update', 'id' => $model->id]);
				                            return Html::button('<i class ="fa fa-pencil"></i>',
				                            [
				                                'value'=> $url,
				                                'id'=> 'modalButtonUpdate',
				                                'data-pjax'=>'0',
				                                'data-title'=>'Update Expense',
				                                'class' => 'btn btn-xs btn-default',
				                            ]);
				                        },
				                        'delete' => function ($url, $model) {
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

    $(document).on("click","#modalButtonUpdate",function () {
        $("#modal").modal("show")
            .find("#modalContent")
            .load($(this).attr("value"));
        var title = $(this).data("title");
        $("#modal").find(".modal-title").html(title);
    });

JS;

$this->registerJs($script);

?>
