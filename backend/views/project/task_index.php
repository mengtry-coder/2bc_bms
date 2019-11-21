<?php

use yii\helpers\Html; 
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;
use common\models\GlobalFunction;

$class_id = Yii::$app->controller->action->id; 

$this->title = 'Task';
$this->params['breadcrumbs'][] = ['label' => 'Project', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->project_name];
$this->params['breadcrumbs'][] = $this->title;


?>
<style type="text/css">
    .panel-title-inline {
        font-size: 16px;
    }
    .modal-ml{
        width: 95% !important;
    }

    .top_summary_report {
        padding-top: 5px;
        margin-bottom: -10px;
    }

    .media-body span {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        max-width: 100px;
    }
</style>
<div class="employee-profile-profile">
    <?= $this->render('//project/_top_tab'); ?>

    <div class="panel" style="border-top-left-radius: 0px;">
        <div class="panel-body">
            <?= $this->render('//project/_top_header'); ?>
            <p class="text-main text-bold"><?= $this->title; ?></p>
            <hr>
            <div class="row task-overview">

                <div class="col-md-5r col-sm-5r">
                    <div class="panel panel-bordered-mint">
                        <div class="panel-body"> 
                            <p class="text-mint text-md text-semibold">NOT STARTED <span class="pull-right"><?=$month_status_1;?> / <?=$status_1;?></span></p>
                            <div class="progress progress-md"><div style="width: <?= GlobalFunction::calculateProgress($month_status_1, $status_1); ?>%;" class="progress-bar progress-bar-mint"></div></div>
                            <p class="text-mint text-sm top_summary_report">This Month</p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-5r col-sm-5r">
                    <div class="panel panel-bordered-mint">
                        <div class="panel-body"> 
                            <p class="text-success text-md text-semibold">IN PROGRESS <span class="pull-right"><?=$month_status_2;?> / <?=$status_2;?> </span></p>
                            <div class="progress progress-md"><div style="width: <?= GlobalFunction::calculateProgress($month_status_2, $status_2); ?>%;" class="progress-bar progress-bar-success"></div></div>
                            <p class="text-success text-sm top_summary_report">This Month</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-5r col-sm-5r">
                    <div class="panel panel-bordered-mint">
                        <div class="panel-body"> 
                            <p class="text-warning text-md text-semibold">TESTING <span class="pull-right"><?=$month_status_3;?> / <?=$status_3;?> </span></p>
                            <div class="progress progress-md"><div style="width: <?= GlobalFunction::calculateProgress($month_status_3, $status_3); ?>%;" class="progress-bar progress-bar-warning"></div></div>
                            <p class="text-warning text-sm top_summary_report">This Month</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-5r col-sm-5r">
                    <div class="panel panel-bordered-mint">
                        <div class="panel-body"> 
                            <p class="text-danger text-md text-semibold">AWAITING FEEDBACK <span class="pull-right"><?=$month_status_4;?> / <?=$status_4;?> </span></p>
                            <div class="progress progress-md"><div style="width: <?= GlobalFunction::calculateProgress($month_status_4, $status_4); ?>%;" class="progress-bar progress-bar-danger"></div></div>
                            <p class="text-danger text-sm top_summary_report">This Month</p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-5r col-sm-5r">
                    <div class="panel panel-bordered-mint">
                        <div class="panel-body"> 
                            <p class="text-info text-md text-semibold">COMPLETE <span class="pull-right"><?=$month_status_5;?> / <?=$status_5;?> </span></p>
                            <div class="progress progress-md"><div style="width: <?= GlobalFunction::calculateProgress($month_status_5, $status_5); ?>%;" class="progress-bar progress-bar-info"></div></div>
                            <p class="text-info text-sm top_summary_report">This Month</p>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-md-12">
                <?= $this->render('_search_task', ['model' => $searchModel]); ?>
                    
                </div>
            </div>
            <br>
                
                <?php
                    Modal::begin([
                        'header' => ' <h4 class="modal-title">'.'Tasks'.'</h4>',
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
                                'header' => 'Member',
                                'format' => 'raw',
                                'contentOptions' => ['class' => 'text-center'],
                                'headerOptions' => ['class' => 'text-center'],
                                'value' => function($model){
                                    $id = $model->id;
                                    $model_member = Yii::$app->db->createCommand("
                                        SELECT b.id, CONCAT(b.id_prefix, ' ', b.first_name, ' ', b.last_name) as employee_name , COALESCE(c.filename, (select filename from uploaded_file where id =1)) as img_url
                                        FROM task_member as a
                                        INNER JOIN employee_profile as b on a.id_employee = b.id
                                        LEFT JOIN uploaded_file as c on c.id = b.img_url
                                        WHERE a.id_task  = :id_task
                                    ")->bindParam(':id_task', $id)->queryAll();
                                    if(!empty($model_member)){
                                        $data_img = '';
                                        foreach ($model_member as $key => $value) {
                                            $data_img = $data_img . Html::img(Yii::getAlias('@web') .'/'.$value['img_url'],['width' => '32px','height' => '32px', 'class'=>'bord-all img-xs img-circle', 'data-toggle'=>'tooltip', 'data-container'=>'body', 'title'=>$value['employee_name']],[]);
                                        }
                                        return $data_img;
                                    }
                                    return 'N/A';
                                }
                            ],
                            [
                                'attribute' => 'task_name',
                                'format' => 'raw',
                                // 'value' => function($model){
                                //     return '<span id="modalButtonView" class="text-info text-link" value="'.Url::to(['task/view', 'id' => $model->id]).'">'.$model->task_name . "</span>";
                                // }
                                'value' => function($model){
                                    return "<a target='_blank' href='". Url::toRoute(['task/view', 'id' => $model->id, 'smMenu'=>1])."' class='text-info text-link'> ".$model->task_name."</a>";
                                }
                            ],
                            [
                                'attribute' => 'start_date',
                                'format' => ['date', 'php:d-M-Y'],
                            ],
                            [
                                'attribute' => 'deadline',
                                'format' => ['date', 'php:d-M-Y'],
                            ],
                            [
                                'attribute' => 'id_priority',
                                'contentOptions' => ['class' => 'text-center'],
                                'headerOptions' => ['class' => 'text-center'],
                                'format' => 'raw',
                                'value' => function ($model) {
                                    return '<div class="text-center"><span class="label '.$model->taskPriority->css_class.'">'.$model->taskPriority->name.'</span></div>';
                                },
                            ],
                            [
                                'attribute' => 'status',
                                'contentOptions' => ['class' => 'text-center'],
                                'headerOptions' => ['class' => 'text-center'],
                                'format' => 'raw',
                                'value' => function ($model) {
                                    return '<div class="text-center"><span class="label '.$model->taskStatus->css_class.'">'.$model->taskStatus->name.'</span></div>';
                                },
                            ],

                        [
                            'class' => 'yii\grid\ActionColumn',
                            'header' => 'Actions',
                            'headerOptions' =>['class'=>'text-center','style'=>'text-decoration: none; color: #7a878e;outline: 0;'],
                            'contentOptions' => ['class' => 'text-center'],
                            'template' => '{copy} {update} {delete}',
                            'buttons' => [
                                'copy' => function ($url, $model) {
                                    $url = Url::to(['task/copy', 'id' => $model->id]);
                                    return Html::button('<i class ="fa fa-files-o"></i>',
                                    [
                                        'value'=> $url,
                                        'id'=> 'modalButtonInvoice',
                                        'data-pjax'=>'0',
                                        'data-title'=>'Copy Task',
                                        'class' => 'btn btn-xs btn-default',
                                    ]);
                                },
                                'update' => function ($url, $model) {
                                    $url = Url::to(['task/update', 'id' => $model->id]);
                                    return Html::button('<i class ="fa fa-pencil"></i>',
                                    [
                                        'value'=> $url,
                                        'id'=> 'modalButtonInvoice',
                                        'data-pjax'=>'0',
                                        'data-title'=>'Update Task',
                                        'class' => 'btn btn-xs btn-default',
                                    ]);
                                },
                                'delete' => function ($url, $model) {
                                    $url = Url::to(['task/delete', 'id' => $model->id]);
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

<style media="screen">
a.<?=$class_id;?>{cursor: default; background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a:hover{background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a{background-color: #dbe3ec;transition: background-color,0.3s;}
</style>

<?php
$this->registerJs('
        var controller_id = "project";
        $("#select_page_size").change(function(){
            var page_size = $("#select_page_size").val();
            var url = window.location.pathname;
            window.location.replace(url+"?r="+controller_id+"/index&id_project='.$id_project.'&page_size="+page_size);
        });

        $(document).on("click","#modalButton, #modalButtonView, #modalButtonUpdate",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
            var title = $(this).data("title");
            $("#modal").find(".modal-title").html(title);
        });

        $(function () {
            $("[data-toggle=\'tooltip\']").tooltip();
        });

    ');
?>
