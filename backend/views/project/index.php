<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;
use common\models\GlobalFunction;
use backend\models\Task;

$this->title = 'Project';
$this->params['breadcrumbs'][] = $this->title;

$request = Yii::$app->request;
$id_employee_profile = $request->get('id_employee_profile',0);
$id_customer_profile = $request->get('id_customer_profile',0);
if($id_employee_profile != 0 || $id_customer_profile != 0){
    $smMenu = 1;
}else{
    $smMenu = 0;
} 

function calculateProgress($current, $all){
    if($all == 0){
        $all = 1;
    }
    $result = ($current / $all) * 100;
    if($result >= 100){
        $result = 100;
    }
    return number_format($result,2);
}
?>
<style>
    .modal-ml{
        width: 60%;
    }


    .grid-view tr td:hover {
        cursor: pointer;
    }
    .top_summary_report {
        padding-top: 5px;
        margin-bottom: -10px;
    }
    
</style>
<div class="project-index">
    <!-- <div class='row' style='margin-top: 49px;'> -->
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
                    <p class="text-success text-md text-semibold">IN PROGRESS <span class="pull-right"><?=$month_status_2;?> / <?=$status_2;?></span></p>
                    <div class="progress progress-md"><div style="width: <?= GlobalFunction::calculateProgress($month_status_2, $status_2); ?>%;" class="progress-bar progress-bar-success"></div></div>
                    <p class="text-success text-sm top_summary_report">This Month</p>
                </div>
            </div>
        </div>

        <div class="col-md-5r col-sm-5r">
            <div class="panel panel-bordered-mint">
                <div class="panel-body"> 
                    <p class="text-warning text-md text-semibold">ON HOLD <span class="pull-right"><?=$month_status_3;?> / <?=$status_3;?></span></p>
                    <div class="progress progress-md"><div style="width: <?= GlobalFunction::calculateProgress($month_status_3, $status_3); ?>%;" class="progress-bar progress-bar-warning"></div></div>
                    <p class="text-warning text-sm top_summary_report">This Month</p>
                </div>
            </div>
        </div>

        <div class="col-md-5r col-sm-5r">
            <div class="panel panel-bordered-mint">
                <div class="panel-body"> 
                    <p class="text-danger text-md text-semibold">CANCELLED <span class="pull-right"><?=$month_status_4;?> / <?=$status_4;?> </span></p>
                    <div class="progress progress-md"><div style="width: <?= GlobalFunction::calculateProgress($month_status_4, $status_4); ?>%;" class="progress-bar progress-bar-danger"></div></div>
                    <p class="text-danger text-sm top_summary_report">This Month</p>
                </div>
            </div>
        </div>
        
        <div class="col-md-5r col-sm-5r">
            <div class="panel panel-bordered-mint">
                <div class="panel-body"> 
                    <p class="text-info text-md text-semibold">FINISHED <span class="pull-right"><?=$month_status_5;?> / <?=$status_5;?> </span></p>
                    <div class="progress progress-md"><div style="width: <?= GlobalFunction::calculateProgress($month_status_5, $status_5); ?>%;" class="progress-bar progress-bar-info"></div></div>
                    <p class="text-info text-sm top_summary_report">This Month</p>
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
        <?php
            Modal::begin([
                'header' => ' <h4 class="modal-title">'.'Projects'.'</h4>',
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
                'rowOptions'   => function ($model) {
                    return ['data-id' => $model->id, 'data-toggle'=>'tooltip', 'data-container'=>'body', 'class'=>'row-table','title'=>"Project Overview"];
                },
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
                            FROM project_member as a
                            INNER JOIN employee_profile as b on a.id_employee = b.id
                            LEFT JOIN uploaded_file as c on c.id = b.img_url
                            WHERE a.id_project  = :id_project
                        ")->bindParam(':id_project', $id)->queryAll();
                        if(!empty($model_member)){
                            foreach ($model_member as $key => $value) {
                                return Html::img(Yii::getAlias('@web') .'/'.$value['img_url'],['width' => '32px','height' => '32px', 'class'=>'bord-all img-xs img-circle', 'data-toggle'=>'tooltip', 'data-container'=>'body', 'title'=>$value['employee_name']],[]);
                            }
                        }
                        return 'N/A';
                    }
                ],
                'project_name',
                [
                    'attribute'=> 'id_customer',
                    'value' => function($model){
                        return $model->customer->customer_name . ' ('.$model->customer->company_name . ')';
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
                    'attribute'=> 'project_progress',
                    'format' => 'raw',
                    'value' => function($model){
                        $all_task = Task::find()->where(['id_related_to'=>1])->andWhere(['id_related_profile'=>$model->id])->count();
                        $complete_task = Task::find()->where(['status'=>5])->andWhere(['id_related_to'=>1])->andWhere(['id_related_profile'=>$model->id])->count();
                        $progress =  $model->is_calculate==0?$model->project_progress : calculateProgress(($complete_task), $all_task);
                        return "<div class='text-primary text-semibold'>$progress %</div>";
                    }
                ],
                [
                    'header' => 'Invoices',
                    'contentOptions' => ['class' => 'text-right'],
                    'headerOptions' => ['class' => 'text-right'],
                    'value' => function($model){
                        $total = \backend\models\CustomerInvoice::find()->select(['SUM(total_amount) as total_amount'])->where(['id_project'=>$model->id])->one();
                        return '$'. number_format($total->total_amount,2);
                    }
                ],
                [
                    'header' => 'Expenses',
                    'contentOptions' => ['class' => 'text-right'],
                    'headerOptions' => ['class' => 'text-right'],
                    'value' => function($model){
                        $total = \backend\models\Expense::find()->select(['SUM(total_amount) as total_amount'])->where(['id_related_to'=>3, 'id_related_profile'=>$model->id])->one();
                        return '$'. number_format($total->total_amount,2);
                    }
                ],
                [
                    'attribute' => 'id_priority',
                    'contentOptions' => ['class' => 'text-center'],
                    'headerOptions' => ['class' => 'text-center'],
                    'format' => 'raw',
                    'value' => function ($model) {
                        return '<div class="text-center"><span class="label '.$model->projectPriority->css_class.'">'.$model->projectPriority->name.'</span></div>';
                    },
                ],
                [
                    'attribute' => 'status',
                    'contentOptions' => ['class' => 'text-center'],
                    'headerOptions' => ['class' => 'text-center'],
                    'format' => 'raw',
                    'value' => function ($model) {
                        return '<div class="text-center"><span class="label '.$model->projectStatus->css_class.'">'.$model->projectStatus->name.'</span></div>';
                    },
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
                                'data-title'=>'Update Project',
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
        var id_employee_profile = "'.$id_employee_profile.'"; 
        var id_customer_profile = "'.$id_customer_profile.'"; 
        
        var controller_id = "project";
        $("#select_page_size").change(function(){
            var page_size = $("#select_page_size").val();
            var url = window.location.pathname;
                if(id_employee_profile !=0){
                    window.location.replace(url+"?r="+controller_id+"/index&id_employee_profile="+id_employee_profile+"&smMenu=1&page_size="+page_size);
                } else if(id_customer_profile !=0){
                    window.location.replace(url+"?r="+controller_id+"/index&id_customer_profile="+id_customer_profile+"&smMenu=1&page_size="+page_size);
                }else{
                    window.location.replace(url+"?r="+controller_id+"/index&page_size="+page_size);
                }
        });

        $(document).on("click","#modalButton, #modalButtonView, #modalButtonUpdate",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
            var title = $(this).data("title");
            $("#modal").find(".modal-title").html(title);
        });

    ');

$project = URL::toRoute(['project/overview']);
$script = <<<JS

    $("td").click(function (e) {
        var id = $(this).closest("tr").data("id"); 
        // var url = "$project" + '?id=' + id + '&id_employee_profile=' + $id_employee_profile+ '&id_customer_profile=' + $id_customer_profile+'&smMenu='+$smMenu;
        var url = "$project" + '?id=' + id;
        if(e.target == this)
            location.href = url;
    });

    $(function () {
        $("[data-toggle='tooltip']").tooltip();
    });

JS;
$this->registerJs($script);
?>
