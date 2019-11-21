<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\WorkingGroupSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Working Groups';
$this->params['breadcrumbs'][] = $this->title;
?>
<style type="text/css">
    .grid-view tr td:hover {
        cursor: pointer;
    }
</style>
<div class="working-group-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <div class="panel"> 
        <div class="panel-body">  
            <div class="row">
                <div class="col-md-12">
                    <div class="pull-right">
                        <button data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['working-group/create']) ?>">                            Add New <i class="fa fa-plus-square go-right"></i>
                        </button> 
                    </div>
                </div>
            </div>
            <br>
    
        <?php
            Modal::begin([
                'header' => ' <h4 class="modal-title">'.'Working Groups'.'</h4>',
                'id' => 'modal',
                'class' => 'modal fade',
                'size' => 'modal-md',
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
                'rowOptions'   => function ($model, $key, $index, $grid) {
                    return ['data-id' => $model->id, 'title'=>"Working Group Overview"];
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

                'name',
                [
                    'attribute' => 'status',
                    'contentOptions' => ['class' => 'text-center'],
                    'headerOptions' => ['class' => 'text-center'],
                    'format' => 'raw',
                    'value' => function ($model) {
                        if ($model->status == 1) {
                            return '<div class="text-center"><span class="label label-info">Active</span></div>';
                        } else {
                            return '<div class="text-center"><span class="label label-danger">Inactive</span></div>';
                        }
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

$base_url = Yii::getAlias('@web'); 
$userTypeRoles = URL::toRoute(['working-group/view']);

$script = <<<JS
var controller_id = "user-type";
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

$("td").click(function (e) {
    var id = $(this).closest("tr").data("id"); 
    var url = "$userTypeRoles" + '?id=' + id;
    if(e.target == this)
        location.href = url;
});

$(function () {
        $("[data-toggle='tooltip']").tooltip();
    });
JS;
$this->registerJs($script);
?>
