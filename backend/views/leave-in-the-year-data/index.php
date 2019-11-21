<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\LeaveInTheYearDataSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Leave In The Year Datas';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="leave-in-the-year-data-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <div class="panel">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="pull-right">
                        <button data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['leave-in-the-year-data/create']) ?>">                            Add New <i class="fa fa-plus-square go-right"></i>
                        </button>
                    </div>
                </div>
            </div>
            <br>

        <?php
            Modal::begin([
                'header' => ' <h4 class="modal-title">'.'Leave In The Year Datas'.'</h4>',
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
                    'attribute'=> 'id_year_list',
                    'value' => function($model){
                        return $model->yearList->name;
                    }
                ],
            [
                'attribute'=> 'id_month_list',
                'value' => function($model){
                    return $model->monthList->name;
                }
            ],
            [
                'attribute'=> 'id_leave_type',
                'value' => function($model){
                    return $model->leaveType->names;
                }
            ],

            'leave_type_value',
            //'created_date',
            //'created_by',
            //'updated_date',
            //'updated_by',

                [
                    'class' => 'yii\grid\ActionColumn',
                    'header' => 'Actions',
                    'headerOptions' =>['class'=>'text-center','style'=>'text-decoration: none; color: #7a878e;outline: 0;'],
                    'contentOptions' => ['class' => 'text-center'],
                    'template' => '{view} {update} {delete}',
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
        var controller_id = "leave-in-the-year-data";
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
