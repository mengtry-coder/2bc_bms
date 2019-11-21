<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\ProposalSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$this->title = 'Proposals';
$this->params['breadcrumbs'][] = $this->title;
function calculateProgress($current, $all){
    if($all == 0){
        $all = 1;
    }
    $result = ($current / $all) * 100;
    return number_format($result,2);
}
?>
<div class="proposal-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <div class="panel">

        <div class="panel-body">
            <div class="row">
                <div class="col-md-4">
                    <div class="panel panel-success panel-colorful">
                        <div class="pad-all text-center">
                            <span class="text-3x text-thin"><?=$on_processing;?></span>
                            <p>On processing</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-warning panel-colorful">
                        <div class="pad-all text-center">
                            <span class="text-3x text-thin"><?=$declined; ?></span>
                            <p>Declined</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-info panel-colorful">
                        <div class="pad-all text-center">
                            <span class="text-3x text-thin"><?=$accepted;?></span>
                            <p>Accepted</p>
                        </div>
                    </div>
                </div>
            </div>
            <hr/>
            <div class="row">
                <div class="col-md-2">
                  <label for="">This Month / Total</label>

                    <h4><?= $month_status_1.' / '.$status_1?> DRAFT</h4>
                    <div class="progress progress-lg progress-striped">
                        <div style="width: <?= calculateProgress($month_status_1, $status_1).'%'; ?>" class="progress-bar progress-bar-info"><?= calculateProgress($month_status_1, $status_1).'%'; ?></div>
                    </div>
                </div>
                <div class="col-md-2">
                  <label for="">This Month / Total</label>

                    <h4><?= $month_status_2.' / '.$status_2?> SENT</h4>
                    <div class="progress progress-lg progress-striped">
                        <div style="width: <?= calculateProgress($month_status_2, $status_2).'%'; ?>" class="progress-bar progress-bar-warning"><?= calculateProgress($month_status_2, $status_2).'%'; ?></div>
                    </div>
                </div>
                <div class="col-md-2">
                  <label for="">This Month / Total</label>

                    <h4><?= $month_status_3.' / '.$status_3?> OPEN</h4>
                    <div class="progress progress-lg progress-striped">
                        <div style="width: <?= calculateProgress($month_status_3, $status_3).'%'; ?>" class="progress-bar progress-bar-success"><?= calculateProgress($month_status_3, $status_3).'%'; ?></div>
                    </div>
                </div>
                <div class="col-md-2">
                  <label for="">This Month / Total</label>

                    <h4><?= $month_status_4.' / '.$status_4?> REVISED</h4>
                    <div class="progress progress-lg progress-striped">
                        <div style="width: <?= calculateProgress($month_status_4, $status_4).'%'; ?>" class="progress-bar progress-bar-mint"><?= calculateProgress($month_status_4, $status_4).'%'; ?></div>
                    </div>
                </div>
                <div class="col-md-2">
                  <label for="">This Month / Total</label>

                    <h4><?= $month_status_5.' / '.$status_5?> DECLENED</h4>
                    <div class="progress progress-lg progress-striped">
                        <div style="width: <?= calculateProgress($month_status_5, $status_5).'%'; ?>" class="progress-bar progress-bar-mint"><?= calculateProgress($month_status_5, $status_5).'%'; ?></div>
                    </div>
                </div>
                <div class="col-md-2">
                  <label for="">This Month / Total</label>

                    <h4><?= $month_status_6.' / '.$status_6?> ACCEPTED</h4>
                    <div class="progress progress-lg progress-striped">
                        <div style="width: <?= calculateProgress($month_status_6, $status_6).'%'; ?>" class="progress-bar progress-bar-mint"><?= calculateProgress($month_status_6, $status_6).'%'; ?></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ==========end summary=============== -->
    <div class="panel">
        <div class="panel-body">
          <div class="row">
              <div class="col-md-12">
                  <?= $this->render('_search', ['model' => $searchModel]); ?>
              </div>
          </div>  
        <?php
            Modal::begin([
                'header' => ' <h4 class="modal-title">'.'Proposals'.'</h4>',
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

            // 'code',
            [
                'attribute'=>'code',
                'format' => 'raw',
                'value' => function($model){
                    return "<a target='_blank' href='". URL::toRoute(['proposal/overview?id='.$model->id])."' class='text-info'> ".$model->code."</a>";
                }
            ],
            'name',
            [
                'attribute'=> 'Related',
                'format' => 'raw',
                'value' => function($model){
                    return "<a href='". URL::toRoute(['customer-profile/profile','id'=>$model->customer->id, 'smMenu'=>1])."' target='_blank' class='text-info'> ".$model->customer->customer_name . ' ('.$model->customer->company_name . ')'."</a>" ;
                }
            ],
            'total',
            [
                'attribute' => 'date',
                'format' => ['date', 'php:d-M, Y'],
            ],
            [
                'attribute' => 'open_till',
                'format' => ['date', 'php:d-M, Y'],
            ],
            'created_date',
            //'currency',
            //'discount_type',
            //'allow_comment',
            [
                'attribute' => 'status',
                'contentOptions' => ['class' => 'text-center'],
                'headerOptions' => ['class' => 'text-center'],
                'format' => 'raw',
                'value' => function ($model) {
                    return '<div class="text-center"><span class="label '.$model->proposalStatus->css_class.'">'.$model->proposalStatus->name.'</span></div>';
                },
            ],
            //'assigned',
            //'to',
            //'address',
            //'city',
            //'country',
            //'zin_code',
            //'email:email',
            //'phone',

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
        var controller_id = "proposal";
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
