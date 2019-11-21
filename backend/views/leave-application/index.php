<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use yii\grid\GridView;
use common\models\GlobalFunction;

$this->title = 'Leave Applications';
$this->params['breadcrumbs'][] = ['label' => 'Human Resource', 'url' => '#'];
$this->params['breadcrumbs'][] = $this->title;
?>
<style>
    .top_summary_report {
        padding-top: 5px;
        margin-bottom: -10px;
    }
</style>
<div class="leave-application-index">
    <div class="row">
        <div class="col-md-3 col-xs-6">
            <div class="panel panel-bordered-mint">
                <div class="panel-body"> 
                    <p class="text-mint text-md text-semibold">TOTAL LEAVE <span class="pull-right"> <?= $allLeave; ?></span></p>
                    <div class="progress progress-md"><div style="width: 100%" class="progress-bar progress-bar-mint"></div></div>
                    <p class="text-mint text-sm top_summary_report">Total all leave</p>
                </div>
            </div>
        </div>
        
        <div class="col-md-3 col-xs-6">
            <div class="panel panel-bordered-mint">
                <div class="panel-body"> 
                    <p class="text-warning text-md text-semibold">PENDING <span class="pull-right"><?=$allLeavePending;?> / <?= $allLeave; ?> </span></p>
                    <div class="progress progress-md"><div style="width: <?= GlobalFunction::calculateProgress($allLeavePending, $allLeave); ?>%;" class="progress-bar progress-bar-warning"></div></div>
                    <p class="text-warning text-sm top_summary_report">Total all leave pending</p>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-xs-6">
            <div class="panel panel-bordered-mint">
                <div class="panel-body"> 
                    <p class="text-success text-md text-semibold">APPROVALED <span class="pull-right"><?=$allLeaveApproval;?> / <?= $allLeave; ?> </span></p>
                    <div class="progress progress-md"><div style="width: <?= GlobalFunction::calculateProgress($allLeaveApproval, $allLeave); ?>%;" class="progress-bar progress-bar-success"></div></div>
                    <p class="text-success text-sm top_summary_report">Total all leave approvaled</p>
                </div>
            </div>
        </div> 

        <div class="col-md-3 col-xs-6">
            <div class="panel panel-bordered-mint">
                <div class="panel-body"> 
                    <p class="text-danger text-md text-semibold">REJECTED <span class="pull-right"><?=$allLeaveRejected;?> / <?= $allLeave; ?> </span></p>
                    <div class="progress progress-md"><div style="width: <?= GlobalFunction::calculateProgress($allLeaveRejected, $allLeave); ?>%;" class="progress-bar progress-bar-danger"></div></div>
                    <p class="text-danger text-sm top_summary_report">Total all leave rejected</p>
                </div>
            </div>
        </div>  
    </div>
    
    <div class="panel">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <?php echo $this->render('_search', ['model' => $searchModel]); ?>
                </div>
            </div> 
        <?php
            Modal::begin([
                'header' => ' <h4 class="modal-title">'.'Leave Applications'.'</h4>',
                'id' => 'modal',
                'class' => 'modal fade',
                'size' => 'modal-custom-80',
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

                            // 'id',
              [
                  'attribute'=> 'id_employee',
                  'value' => function($model){
                      return $model->employee->id_prefix .''.$model->employee->first_name . ' '.$model->employee->last_name;
                  }
              ],
              'leave_reason',
            'start_date',
            'end_date',

            [
                'attribute' => 'Leave Type',
                'contentOptions' => ['class' => 'text-center'],
                'headerOptions' => ['class' => 'text-center'],
                'format' => 'raw',
                'value' => function ($model) {
                    return '<div class="text-center" style="background:'.$model->leaveTypeName->css_style.'; color: #000">'.$model->leaveTypeName->names.'</span></div>';
                },
            ],
            //'reject_reason',
            [
                'attribute' => 'Is Half Day',
                'contentOptions' => ['class' => 'text-center'],
                'headerOptions' => ['class' => 'text-center'],
                'format' => 'raw',
                'value' => function ($model) {
                  if($model->is_half_day == 1){
                    return 'Half Day';
                  }else {
                    return 'Full Day';
                  }
                },
            ],
            [
                'attribute'=> 'id_approver',
                'value' => function($model){
                    if(!empty($model->approver)){
                        return $model->approver->id_prefix .''.$model->approver->first_name . ' '.$model->approver->last_name;
                    }else{
                        return "None";
                    }
                    
                }
            ],
            [
                'attribute' => 'Status',
                'contentOptions' => ['class' => 'text-center'],
                'headerOptions' => ['class' => 'text-center'],
                'format' => 'raw',
                'value' => function ($model) {
                    return '<div class="text-center"><span class="label '.$model->leaveStatus->css.'">'.$model->leaveStatus->approve_status_name.'</span></div>';
                },
            ],
            // 'created_by',
            //'created_date',
            //'updated_by',
            //'updated_date',

                [
                    'class' => 'yii\grid\ActionColumn',
                    'header' => 'Actions',
                    'headerOptions' =>['class'=>'text-center','style'=>'text-decoration: none; color: #7a878e;outline: 0;'],
                    'contentOptions' => ['class' => 'text-center'],
                    'template' => '{update} {delete}',
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
                            return Html::button('<i class ="fa fa-pencil"></i>',
                            [
                                'value'=> $url,
                                'id'=> 'modalButtonUpdate',
                                'data-pjax'=>'0',
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
        var controller_id = "leave-application";
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
