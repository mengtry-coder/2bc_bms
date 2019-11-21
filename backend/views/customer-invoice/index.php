<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use yii\grid\GridView;
use common\models\GlobalFunction;

$request = Yii::$app->request;
$id_customer_profile = $request->get('id_customer_profile',0);
if($id_customer_profile != 0){
    $smMenu = 1;
}else{
    $smMenu = 0;
}
$this->title = 'Invoices';
$this->params['breadcrumbs'][] = ['label' => 'Finance', 'url' => '#'];
$this->params['breadcrumbs'][] = $this->title;

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
                    <div class="col-md-4">
                        <div class="panel panel-success panel-colorful">
                            <div class="pad-all text-center">
                                <span class="text-3x text-thin"><?= '$'. number_format($all_outstanding,2) ?></span>
                                <p>Outstanding Invoices</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="panel panel-warning panel-colorful">
                            <div class="pad-all text-center">
                                <span class="text-3x text-thin"><?= '$'. number_format($all_over_due,2) ?></span>
                                <p>Past Due Invoices</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="panel panel-info panel-colorful">
                            <div class="pad-all text-center">
                                <span class="text-3x text-thin"><?= '$'. number_format($all_paid,2) ?></span>
                                <p>Paid Invoices</p>
                            </div>
                        </div>
                    </div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-md-3">
                      <label for="">This Month / Total</label>
                      
                        <h4><?= $month_status_1.' / '.$status_1?> PAID</h4>
                        <div class="progress progress-lg progress-striped">
                            <div style="width: <?= GlobalFunction::calculateProgress($month_status_1, $status_1).'%'; ?>" class="progress-bar progress-bar-info"><?= GlobalFunction::calculateProgress($month_status_1, $status_1).'%'; ?></div>
                        </div>
                    </div>
                    <div class="col-md-3">
                      <label for="">This Month / Total</label>
                      
                        <h4><?= $month_status_2.' / '.$status_2?> OVERDUE</h4>
                        <div class="progress progress-lg progress-striped">
                            <div style="width: <?= GlobalFunction::calculateProgress($month_status_2, $status_2).'%'; ?>" class="progress-bar progress-bar-warning"><?= GlobalFunction::calculateProgress($month_status_2, $status_2).'%'; ?></div>
                        </div>
                    </div>
                    <div class="col-md-3">
                      <label for="">This Month / Total</label>
                      
                        <h4><?= $month_status_3.' / '.$status_3?> PARTIALLY PAID</h4>
                        <div class="progress progress-lg progress-striped">
                            <div style="width: <?= GlobalFunction::calculateProgress($month_status_3, $status_3).'%'; ?>" class="progress-bar progress-bar-success"><?= GlobalFunction::calculateProgress($month_status_3, $status_3).'%'; ?></div>
                        </div>
                    </div>
                    <div class="col-md-3">
                      <label for="">This Month / Total</label>
                      
                        <h4><?= $month_status_4.' / '.$status_4?> UNPAID</h4>
                        <div class="progress progress-lg progress-striped">
                            <div style="width: <?= GlobalFunction::calculateProgress($month_status_4, $status_4).'%'; ?>" class="progress-bar progress-bar-mint"><?= GlobalFunction::calculateProgress($month_status_4, $status_4).'%'; ?></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    <div class="panel">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <?= $this->render('_search', ['model' => $searchModel]); ?>
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
                    'format' => 'raw',
                    'value' => function($model){
                        return "<a target='_blank' href='". URL::toRoute(['customer-invoice/view','id'=>$model->id])."' class='text-info'> ".$model->doc_id."</a>";
                    }
                ],
                [
                    'attribute' => 'date',
                    'format' => ['date', 'php:d-M, Y'],
                ],
                [
                    'attribute'=> 'id_customer',
                    'format' => 'raw',
                    'value' => function($model){
                        return "<a href='". URL::toRoute(['customer-profile/profile','id'=>$model->customer->id, 'smMenu'=>1])."' target='_blank' class='text-info'> ".$model->customer->customer_name . ' ('.$model->customer->company_name . ')'."</a>" ;
                    }
                ],

                [
                    'attribute'=> 'id_project',
                    'format' => 'raw',
                    'value' => function($model){
                        if(!empty($model->id_project)){
                            return "<a href='". URL::toRoute(['project/overview','id'=>$model->project->id])."' target='_blank' class='text-info'> ".$model->project->project_name."</a>" ;
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
                    'attribute'=> 'receive_amount',
                    'contentOptions' => ['class' => 'text-right'],
                    'headerOptions' => ['class' => 'text-right'],
                    'value' => function($model){
                        return '$'. $model->receive_amount;
                    }
                ],
                [
                    'attribute'=> 'balance_amount',
                    'contentOptions' => ['class' => 'text-right'],
                    'headerOptions' => ['class' => 'text-right'],
                    'value' => function($model){
                        return '$'. $model->balance_amount;
                    }
                ],
                [
                    'attribute' => 'due_date',
                    'format' => ['date', 'php:d-M, Y'],
                ],
                [
                    'attribute' => 'status',
                    'contentOptions' => ['class' => 'text-center'],
                    'headerOptions' => ['class' => 'text-center'],
                    'format' => 'raw',
                    'value' => function ($model) {
                        return '<div class="text-center"><span class="label '.$model->invoiceStatus->css_class.'">'.$model->invoiceStatus->name.'</span></div>';
                    },
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
                                    'data-title'=>'Project Overview',
                                    'class' => 'btn btn-xs btn-default',
                                ]);
                        },
                        'update' => function ($url, $model) {
                            return Html::button('<i class ="fa fa-pencil"></i>',
                            [
                                'value'=> $url,
                                'id'=> 'modalButtonUpdate',
                                'data-pjax'=>'0',
                                'data-title'=>'Update Invoice :' . $model->doc_id,
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
