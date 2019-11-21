<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\ExpenseSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Journal Entry';
$this->params['breadcrumbs'][] = ['label' => 'Finance', 'url' => '#'];
$this->params['breadcrumbs'][] = $this->title;
?>
<style>
    .modal-lg{
        width: 90%;
    }
    .row-table {
        cursor: pointer;
    }
</style>
<div class="journal-entry-index">

    <div class="panel"> 
        <div class="panel-body">  
            <div class="row">
                <div class="col-md-12">
                <?= $this->render('_search', ['model' => $searchModel]); ?>
                </div>
            </div>
    
        <?php
            Modal::begin([
                'header' => '<h4 class="modal-title">'.$this->title.'</h4>',
                'id' => 'modal',
                'class' => 'modal fade',
                'size' => 'modal-custom-60',
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
                    return ['data-id' => $model->id, 'data-toggle'=>'tooltip', 'data-container'=>'body', 'class'=>'row-table','title'=>"File Overview"];
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
                    'attribute'=>'doc_id',
                ],
                [
                    'attribute' => 'date',
                    'format' => ['date', 'php:d-M, Y'],
                ],
                [
                    'attribute'=>'from_account',
                    'value' => function($model){
                        return $model->fromAccount->names;
                    }
                ],
                [
                    'attribute'=>'to_account',
                    'value' => function($model){
                        return $model->toAccount->names;
                    }
                ],
                [
                    'attribute'=> 'amount',
                    'contentOptions' => ['class' => 'text-right'],
                    'headerOptions' => ['class' => 'text-right'],
                    'value' => function($model){
                        return '$'. $model->amount;
                    }
                ],
                [
                    'attribute' => 'status',
                    'contentOptions' => ['class' => 'text-center'],
                    'headerOptions' => ['class' => 'text-center'],
                    'format' => 'raw',
                    'value' => function ($model) {
                        if ($model->status == 1) {
                            return '<div class="text-center"><span class="label label-info">Paid</span></div>';
                        } else {
                            return '<div class="text-center"><span class="label label-danger">Voided</span></div>';
                        }
                    },
                ],
                [
                    'class' => 'yii\grid\ActionColumn',
                    'header' => 'Actions',
                    'headerOptions' =>['class'=>'text-center','style'=>'text-decoration: none; color: #7a878e;outline: 0;'],
                    'contentOptions' => ['class' => 'text-center'],
                    'template' => '{update}',
                    'buttons' => [
                        
                        'update' => function ($url, $model) {
                            return Html::button('<i class ="fa fa-pencil"></i>',
                            [
                                'value'=> $url,
                                'data-title' => 'Update Opening Balance: ' . $model->doc_id,
                                'id'=> 'modalButtonUpdate',
                                'data-pjax'=>'0',
                                'class' => 'btn btn-xs btn-default',
                            ]);
                        },

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
        var controller_id = "finance-journal-entry";
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

        $(document).on("click","#modalButtonUpdate",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
            $("#modal").find(".modal-title").html($(this).data("title"));
        });

            $(function () {
            $("[data-toggle=\'tooltip\']").tooltip();
        });

    ');
$url = URL::toRoute(['finance-journal-entry/view']);
$script = <<<JS

    $("td").click(function (e) {
        var id = $(this).closest("tr").data("id"); 
        var url = "$url" + '?id=' + id;
        if(e.target == this)
            location.href = url;
    });

JS;
$this->registerJs($script);
?>
s