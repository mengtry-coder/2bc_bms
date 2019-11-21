<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\SopGoalSetupSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'K.P.I Goal Setups';
$this->params['breadcrumbs'][] = $this->title;
?>
<style>
    .grid-view tr td:hover {
        cursor: pointer;
    }
</style>
<div class="sop-goal-setup-index">

    
    <div class="panel"> 
        <div class="panel-body">  
            <div class="row">
                    <div class="col-md-11">
                        <?= $this->render('_search', ['model' => $searchModel]); ?> 
                    </div>
                <div class="col-md-1">
                    <div class="pull-right">

                        <button data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['sop-goal-setup/create']) ?>">                            Add New <i class="fa fa-plus-square go-right"></i>
                        </button> 
                    </div>
                </div>
            </div>
            <br>
    
        <?php
            Modal::begin([
                'header' => ' <h4 class="modal-title">'.'K.P.I Goal Setups'.'</h4>',
                'id' => 'modal',
                'class' => 'modal fade',
                'size' => 'modal-custom-95',
            ]);
            echo "<div id='modalContent'></div>";
            Modal::end();
        
        ?>
        <div class="table-responsive">
                <?= GridView::widget([
                'dataProvider' => $dataProvider,
                'rowOptions'   => function ($model) {
                    return ['data-id' => $model->id, 'class'=>'row-table', 'data-toggle'=>"tooltip", 'data-placement'=>"top", 'title'=>"Goal Overview"];
                },
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
                    'attribute'=> 'year',
                    'contentOptions' => ['class' => 'text-center'],
                    'headerOptions' => ['class' => 'text-center'],
                    'value' => function($model){
                        return $model->id_year;
                    }
                ],
                [
                    'attribute' => 'id_position',
                    'value' => function($model){
                        return $model->position->position_type;
                    }
                ],
                [
                    'attribute' => 'id_employee',
                    'value' => function($model){
                        return $model->employee->id_prefix  . " " . $model->employee->first_name ." ". $model->employee->last_name ;
                    }
                ],
                [
                    'attribute' => 'id_sop_step',
                    'value' => function($model){
                        return $model->sopStep->name;
                    }
                ],
                [
                    'attribute' => 'id_sop_step_list',
                    'value' => function($model){
                        if(!empty($model->sopStepList)){
                            return $model->sopStepList->name;
                        }else{
                            return $model->id_sop_step_list;
                        }
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
        var controller_id = "sop-goal-setup";
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

$url = URL::toRoute(['sop-goal-setup/view']);
$script = <<<JS

    $("td").click(function (e) {
        var id = $(this).closest("tr").data("id"); 
        var url = "$url" + '?id=' + id;
        if(e.target == this)
            location.href = url;
    });

    // $(function () {
    //     $("[data-toggle='tooltip']").tooltip();
    // });

JS;
$this->registerJs($script);
?>

