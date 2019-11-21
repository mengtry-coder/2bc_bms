<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;
use common\models\GlobalFunction;

$this->title = 'Task';
$this->params['breadcrumbs'][] = $this->title;

$request = Yii::$app->request;
$id_employee_profile = $request->get('id_employee_profile',0);
$id_customer_profile = $request->get('id_customer_profile',0);
$id_lead_profile = $request->get('id_lead_profile',0);
$id_contract = $request->get('id_contract',0);
?>
<style>
    .modal-xl{
        width: 60%;
    }

    .media-body span {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        max-width: 100px;
    }
    .text-link:hover {
        text-decoration: underline;
        cursor: pointer;
    }
    .modal-lg {
        width: 95% !important;
    }
    .top_summary_report {
        padding-top: 5px;
        margin-bottom: -10px;
    }
</style> 

<div class="task-index"> 
    <div class="row">
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


    <div class="panel taskArea"> 
        <div class="panel-body">  
             <div class="row">
                <div class="col-md-12">
                <?= $this->render('_search', ['model' => $searchModel]); ?>
                    
                </div>
            </div> 
    
        <?php
            Modal::begin([
                'header' => ' <h4 class="modal-title">'.'Tasks'.'</h4>',
                'id' => 'modal',
                'class' => 'modal fade',
                'size' => 'modal-lg',
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
                            if($model->is_related_kpi == 1){
                                return $model->task_name;
                            }else{
                                return "<a target='_blank' href='". Url::toRoute(['task/view', 'id' => $model->id, 'smMenu'=>1])."' class='text-info text-link'> ".$model->task_name."</a>";
                            }
                        }
                    ],
                    [
                        'attribute' => 'start_date',
                        'format' => ['date', 'php:d-M, Y'],
                    ],
                    [
                        'attribute' => 'deadline',
                        'format' => ['date', 'php:d-M, Y'],
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
                                'id'=> 'modalButtonUpdate',
                                'data-pjax'=>'0',
                                'data-title'=>'Copy Task',
                                'class' => 'btn btn-xs btn-default',
                            ]);
                        },
                        'update' => function ($url, $model) {
                            return Html::button('<i class ="fa fa-pencil"></i>',
                            [
                                'value'=> $url,
                                'id'=> 'modalButtonUpdate',
                                'data-pjax'=>'0',
                                'data-title'=>'Update Task',
                                'class' => 'btn btn-xs btn-default modalButtonUpdate',
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

    
    <div class="milestoneArea" style="display: none;">
        <?= $this->render('//standard-operation/index.php', [
            'model' => $sop_model,
            'standardOperationStep' => $standardOperationStep,
            ]); 
        ?> 
    </div> 

</div>

<?php
$this->registerJs('
        var id_employee_profile = "'.$id_employee_profile.'";
        var id_customer_profile = "'.$id_customer_profile.'";
        var id_lead_profile = "'.$id_lead_profile.'"; 
        var id_contract = "'.$id_contract.'"; 
        var controller_id = "task";
        $("#select_page_size").change(function(){
            var page_size = $("#select_page_size").val();
            var url = window.location.pathname;
                if(id_employee_profile !=0){
                    window.location.replace(url+"?r="+controller_id+"/index&id_employee_profile="+id_employee_profile+"&smMenu=1&page_size="+page_size);
                }else if(id_lead_profile !=0){
                    window.location.replace(url+"?r="+controller_id+"/index&id_lead_profile="+id_lead_profile+"&smMenu=1&page_size="+page_size);
                }else if(id_customer_profile !=0){
                    window.location.replace(url+"?r="+controller_id+"/index&id_customer_profile="+id_customer_profile+"&smMenu=1&page_size="+page_size);
                }else if(id_contract !=0){
                    window.location.replace(url+"?r="+controller_id+"/index&id_contract="+id_contract+"&smMenu=1&page_size="+page_size);
                }else{
                    window.location.replace(url+"?r="+controller_id+"/index&page_size="+page_size);
                }
        });
        
        $(document).on("click","#modalButton,#modalButtonKPI, #modalButtonView, #modalButtonUpdate, .modalButtonUpdate",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
            var title = $(this).data("title");
            $("#modal").find(".modal-title").html(title);
        });

        $(document).on("click","#modalButtonView",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
            var title = $(this).data("title");
            $("#modal").find(".modal-title").html(title);
            $(".modal-dialog").removeClass("modal-ml").addClass("modal-lg");
        });

        $(function () {
            $("[data-toggle=\'tooltip\']").tooltip();
        }); 

        $("#switch_to_milestone").click(function(){
            localStorage.setItem("id_switchTO",2); 
            location.reload();
        });
        $("#switch_to_task").click(function(){
            localStorage.setItem("id_switchTO",1);
            location.reload(); 
        });

        var id_switchTO = localStorage.getItem("id_switchTO",id_switchTO);
        if(id_switchTO == 1){
            $(".milestoneArea").css("display", "none");
            $(".taskArea").css("display", "block");
        }
        if(id_switchTO == 2){
            $(".milestoneArea").css("display", "block");
            $(".taskArea").css("display", "none");
        } 
        
    ');
?>
