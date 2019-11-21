<?php

use yii\helpers\Html; 
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;
use backend\models\UploadedFile;
$base_url = Yii::getAlias('@web'); 

$class_id = Yii::$app->controller->action->id; 

$this->title = 'Timesheet';
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
    .panel-title-inline {
        font-size: 16px;
    }
    .modal-ml{
        width: 80% !important;
    }

    .col-xs-5r,
    .col-sm-5r,
    .col-md-5r,
    .col-lg-5r {
        position: relative;
        min-height: 1px;
        padding-right: 10px;
        padding-left: 10px;
    }

    .col-xs-5r {
        width: 20%;
        float: left;
    }

    @media (min-width: 768px) {
        .col-sm-5r {
            width: 20%;
            float: left;
        }
    }

    @media (min-width: 992px) {
        .col-md-5r {
            width: 20%;
            float: left;
        }
    }

    @media (min-width: 1200px) {
        .col-lg-5r {
            width: 20%;
            float: left;
        }
    }
    .grid-view tbody td{
        vertical-align: middle !important;
    }
</style>
<div class="timesheet-overview-profile">
    <?= $this->render('//project/_top_tab'); ?>

    <div class="panel" style="border-top-left-radius: 0px;">
        <div class="panel-body">
            <?= $this->render('//project/_top_header'); ?>
            <p class="text-main text-bold"><?= $this->title; ?></p>
            <hr>
                <div class="row timesheet-overview">

                    <div class="panel"> 
                        <div class="panel-body">  
                             <div class="row">
                                <div class="col-md-12">
                                <?= $this->render('_timesheet_search', ['model' => $searchModel]); ?>
                                    
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
                                        'attribute' => 'id_task',
                                        'value' => 'task.task_name'
                                    ],
                                    'note',
                                    [
                                        'attribute' => 'start_time',
                                        'value' => function($model){
                                            return date("d-M-Y", strtotime($model->start_date)) .' '. $model->start_time;
                                        }
                                    ],
                                    [
                                        'attribute' => 'end_time',
                                        'value' => function($model){
                                            return date("d-M-Y", strtotime($model->end_date)) .' '. $model->end_time;
                                        }
                                    ],
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
                                                $url = Url::to(['project-timesheet/update', 'id' => $model->id, 'type'=>1, 'source_id'=>$_GET['id_project']]);
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
                                                $url = Url::to(['project-timesheet/delete', 'id' => $model->id]);
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
