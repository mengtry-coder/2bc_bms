<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\ExpenseSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Expenses';
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
<div class="expense-index">

    <div class="panel"> 
        <div class="panel-body">  
            <div class="row">
                <div class="col-md-12">
                <?= $this->render('_search', ['model' => $searchModel]); ?>
                </div>
            </div>
    
        <?php
            Modal::begin([
                'header' => ' <h4 class="modal-title">'.'Expenses'.'</h4>',
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
                    'format' => 'raw',
                    'value' => function($model) {
                        if($model->is_bill == 1){
                            return "<span class='text-info' data-placement='left' title='Allow as bill' 'data-container'='body' data-toggle='tooltip'> $model->doc_id </span>";
                        }
                        return $model->doc_id;
                    }
                ],
                [
                    'attribute' => 'date',
                    'format' => ['date', 'php:d-M, Y'],
                ],
                [
                    'attribute'=> 'id_related_profile',
                    'format' => 'raw',
                    'value' => function($model){
                        if($model->id_related_to == 1){
                            return $model->expenseProfile->supplier_name . ' ('.$model->expenseProfile->company_name . ')';
                        }else if($model->id_related_to == 2){
                            return "<a href='". URL::toRoute(['customer-profile/profile','id'=>$model->expenseProfile->id, 'smMenu'=>1])."' target='_blank' class='text-info'> ".$model->expenseProfile->customer_name . ' ('.$model->expenseProfile->company_name . ')'."</a>" ;
                        }else if($model->id_related_to == 3){
                            return "<a href='". URL::toRoute(['project/overview','id'=>$model->expenseProfile->id])."' target='_blank' class='text-info'> ".$model->expenseProfile->project_name."</a>" ;
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
                    'attribute'=> 'paid_amount',
                    'contentOptions' => ['class' => 'text-right'],
                    'headerOptions' => ['class' => 'text-right'],
                    'value' => function($model){
                        return '$'. $model->paid_amount;
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
                    'attribute' => 'status',
                    'contentOptions' => ['class' => 'text-center'],
                    'headerOptions' => ['class' => 'text-center'],
                    'format' => 'raw',
                    'value' => function ($model) {
                        return '<div class="text-center"><span class="label '.$model->expenseStatus->css_class.'">'.$model->expenseStatus->name.'</span></div>';
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
                            if($model->type_id == 1){
                                $url = Url::to(['expense/update', 'id' => $model->id]);
                                $data_title = 'Update Expense : ' . $model->doc_id;
                            } else{
                                $url = Url::to(['expense/update-pay-bill', 'id' => $model->id]);
                                $data_title = 'Update Pay Bill : ' . $model->doc_id;
                            }
                            return Html::button('<i class ="fa fa-pencil"></i>',
                            [
                                'value'=> $url,
                                'data-title' => $data_title,
                                'id'=> 'modalButtonUpdate',
                                'data-pjax'=>'0',
                                'class' => 'btn btn-xs btn-default',
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
        var controller_id = "expense";
        $("#select_page_size").change(function(){
            var page_size = $("#select_page_size").val();
            var url = window.location.pathname;
                window.location.replace(url+"?r="+controller_id+"/index&page_size="+page_size);
        });


        $(document).on("click","#modalButton, #modalButtonUpdate",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
            $("#modal").find(".modal-title").html($(this).data("title"));
        });

        $(function () {
            $("[data-toggle=\'tooltip\']").tooltip();
        });

    ');
$url = URL::toRoute(['expense/view']);
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
