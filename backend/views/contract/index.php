<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use yii\grid\GridView;
$base_url = Yii::getAlias('@web'); 
$contract = URL::toRoute(['contract/overview']);
$this->title = 'Contracts';
$this->params['breadcrumbs'][] = $this->title;

$this->registerJsFile(
    '@web/plugins/ckeditor/ckeditor.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

?>
<style>
    .modal-lg{
        width: 90%;
    }
    .row-table {
        cursor: pointer;
    }
    #container .table td{
        vertical-align: middle;
    }
    .td_img{
        padding: 5px !important;
    }  
</style>
<div class="contract-index"> 
    <div class="panel">
        <div class="panel-body">
            <div class="row">
              <div class="col-md-12">
                  <?= $this->render('_search', ['model' => $searchModel]); ?>
              </div>
            </div>  
        <?php
            Modal::begin([
                'header' => ' <h4 class="modal-title">'.'Contracts'.'</h4>',
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
                    'rowOptions'   => function ($model, $key, $index, $grid) {
                        return ['data-id' => $model->id, 'class'=>'row-table'];
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
                'columns' => [
                ['class' => 'yii\grid\SerialColumn'], 
                 
                [
                    'attribute'=> 'id_customer',
                    'format' => 'raw',
                    'value' => function($model){
                        return "<a href='". URL::toRoute(['customer-profile/profile','id'=>$model->customer->id, 'smMenu'=>1])."' target='_blank' class='text-info'> ".$model->customer->customer_name . ' ('.$model->customer->company_name . ')'."</a>" ; 
                    }
                ],
                [
                    'attribute'=> 'id_contract_type',
                    'value' => function($model){
                        return $model->contractType->name;
                    }
                ],
                [
                    'attribute' => 'start_date',
                    'format' => ['date', 'php:d-M, Y'],
                ],
                [
                    'attribute' => 'end_date',
                    'format' => ['date', 'php:d-M, Y'],
                ],
                // [
                //     'attribute' => 'status',
                //     'contentOptions' => ['class' => 'text-center'],
                //     'headerOptions' => ['class' => 'text-center'],
                //     'format' => 'raw',
                //     'value' => function ($model) {
                //         if ($model->status == 1) {
                //             return '<div class="text-center"><span class="label label-info">Active</span></div>';
                //         } else {
                //             return '<div class="text-center"><span class="label label-danger">Inactive</span></div>';
                //         }
                //     },
                // ],
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

$script = <<<JS
var controller_id = "contract";
$("#select_page_size").change(function(){
    var page_size = $("#select_page_size").val();
    var url = window.location.pathname;
        window.location.replace(url+"?r="+controller_id+"/index&page_size="+page_size);
});


$(document).on("click","#modalButtonImport",function () {
    $("#modal").modal("show")
        .find("#modalContent")
        .load($(this).attr("value"));
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
    var url = "$contract" + '?id=' + id +'&smMenu=1';
    if(e.target == this)
        location.href = url;
});
JS;
$this->registerJs($script);

?>