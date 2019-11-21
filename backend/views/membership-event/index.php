<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;
use backend\models\MembershipProfile;

@$id_membership_profile = $_GET['id_membership_profile'];
$hname = MembershipProfile::findOne($id_membership_profile);
$this->title = 'Membership Event';
$membership_url = Url::toRoute(['membership-profile/index']); 
$this->params['breadcrumbs'][] = ['label' => 'Membership', 'url' => $membership_url];
$this->params['breadcrumbs'][] = ['label' => $hname->company_name];
$this->params['breadcrumbs'][] = 'Event'; 
?>
<style>
    .modal-lg{
        width: 90%;
    }
</style>
<div class="membership-event-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <?php 
        require_once(__DIR__ . '/../site/_top_menu_membership.php');
    ?>
    <div class="panel" style="border-top-left-radius: 0px;">  
        <div class="panel-body">  
            <p class="text-main text-bold">Membership Event</p>
            <hr>
            <div class="row">
                <div class="col-md-12">
                    <div class="pull-right">
                        <button data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['membership-event/create','id_membership_profile'=>$id_membership_profile]) ?>">                          
                            Add New <i class="fa fa-plus-square go-right"></i>
                        </button> 
                    </div>
                </div>
            </div>
            <br>
    
        <?php
            Modal::begin([
                'header' => ' <h4 class="modal-title">'.'Membership Events'.'</h4>',
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
                    'attribute' => 'from_date',
                    'label' => 'Valid Date',
                    'value' => function($model) { return date('Y-m-d',strtotime($model->from_date))  . " To " . date('Y-m-d',strtotime($model->to_date));},
                    'contentOptions' => ['class' => 'text-center'],
                    'headerOptions' => ['class' => 'text-center'],
                ], 
                [
                    'attribute' => 'id_event_list',
                    'value'=>'eventList.event_name',
                ],
                // 'number_of_audient',
                'address',
                //'address_line_2',
                //'id_country',
                //'id_city',
                //'id_province',
                //'postal_code',
                //'prefix_phone_code',
                //'phone_number',
                //'prefix_phone_code_line_2',
                //'phone_number_line_2',
                'email:email',
                //'description',
                //'created_date',
                //'created_by',
                //'updated_date',
                //'updated_by',
                [
                    'attribute' => 'amount',
                    'format' => ['currency', '$'],
                    'contentOptions' => ['class' => 'text-right'],
                    'headerOptions' => ['class' => 'text-right'],
                ],
                [
                    'attribute' => 'status',
                    'contentOptions' => ['class' => 'text-center'],
                    'headerOptions' => ['class' => 'text-center'],
                    'format' => 'raw',
                    'value' => function ($model) {
                        if ($model->status == 1) {
                            return '<div class="text-center"><span class="label label-info">Upcoming</span></div>';
                        } else {
                            return '<div class="text-center"><span class="label label-danger">Expired</span></div>';
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
                        // 'delete' => function ($url, $model) {
                        //     return Html::a('<span class="fa fa-trash"></span>', $url, [
                        //         'title' => Yii::t('app', 'lead-delete'),
                        //         'class' => 'btn btn-xs btn-default',
                        //         'data' => [
                        //             'confirm' => 'Are you sure want to delete it?',
                        //             'method' => 'post',
                        //         ],
                        //     ]);
                        // }

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
        var controller_id = "membership-event";
        $("#select_page_size").change(function(){
            var page_size = $("#select_page_size").val();
            var url = window.location.pathname;
                window.location.replace(url+"?r="+controller_id+"/index&id_membership_profile='.$id_membership_profile.'&page_size="+page_size); 
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
