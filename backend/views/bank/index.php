<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\bootstrap\Modal;
use yii\helpers\Url;

$this->title = 'Bank';
$this->params['breadcrumbs'][] = ['label' => 'Finance', 'url' => '#'];
$this->params['breadcrumbs'][] = $this->title;
?>
<?php

    Modal::begin([
        'header' => $this->title,
        'id' => 'modal',
        'size' => 'modal-md',
    ]);
    echo "<div id='modalContent'></div>";
    Modal::end();
?>
<div class="bank-index">

    <div class="panel">
        <div class="panel-body">
            <div class="row">
                <?= $this->render('_search',['model'=> $searchModel]); ?>
                <br>

                <?= GridView::widget([
                    'dataProvider' => $dataProvider,
                    'tableOptions' => [ 
                        'class' => 'table table-striped table-hover',
                        'cellspacing'=>'0',
                        'width'=>'100%', 
                    ],
                    'layout'=>"
                        {items}
                            <div class='col-md-5 col-xs-7 '>
                                <label class='form-inline'>
                                    Show ".
                                Html::dropDownList('page_size',
                                $page_size,
                                Yii::$app->params['page_size'],
                                array('class' => 'form-control', 'id' => 'select_page_size'))."
                                </label>
                            </div>
                            <div class='col-md-2 col-xs-3' style='padding-top: 5px;'>
                                {summary}
                            </div>
                            <div class='col-md-5 col-xs-3' style='text-align: right;'>
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

                        'bank_name',
                        [
                            'label' => 'Account Type',
                            'value' => 'accountType.names',
                            // 'headerOptions' => ['style'=>'font-weight:lighter;']
                        ],
                        'account_name',
                        'account_number',
                        [
                            'attribute' => 'default',
                            'contentOptions' => ['class' => 'text-center'],
                            'headerOptions' => ['class' => 'text-center'],
                            'format' => 'raw',
                            'value' => function ($model) {
                                if ($model->default == 1) {
                                    return '<div class="text-center"><span class="label label-info">Default</span></div>';
                                } else {
                                    return '<div class="text-center"><span class="label label-warning">None</span></div>';
                                }
                            },
                        ],
                        
                        [
                            'attribute' => 'status',
                            'contentOptions' => ['class' => 'text-center'],
                            'headerOptions' => ['class' => 'text-center'],
                            'format' => 'raw',
                            'value' => function ($model) {
                                if ($model->status == 1) {
                                    return '<div class="text-center"><span class="label label-info">Active</span></div>';
                                } else {
                                    return '<div class="text-center"><span class="label label-warning">Inactive</span></div>';
                                }
                            },
                        ],
                        [
                            'class' => 'yii\grid\ActionColumn',
                            'header' => 'Actions',
                            'headerOptions' =>['class'=>'text-center','style'=>'width:120px;'],
                            'contentOptions' => ['class' => 'text-center'],
                            'template' => ' {update} {delete}',
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
                                            'confirm' => 'Are you sure want to delete ' .$model->bank_name.' ?',
                                            'method' => 'post',
                                        ],
                                    ]);
                                }

                            ],


                        ],
                    ],
                ]); 
            ?>
            </div>
        </div>
    </div>
</div>


<?php
    $this->registerJs('
        var controller_id = "bank";
        $("#select_page_size").change(function(){
            var page_size = $("#select_page_size").val();
            var url = window.location.pathname;
            window.location.replace(url+"?r="+controller_id+"/index&page_size="+page_size);
        });

        $(".modal-dialog").removeClass("modal-xl").addClass("modal-md");

        $(document).on("click","#modalButton",function () {
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
