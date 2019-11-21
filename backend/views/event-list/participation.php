<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use backend\models\EventList; 
use backend\models\MembershipEvent; 

$base_url = Yii::getAlias('@web');
@$id_event_list = $_GET['id_event_list']; 
$membership_profile_url = Url::toRoute(['membership-profile']); 
$this->title = 'Participation'; 
 
$eventListData = EventList::findOne($id_event_list); 
$event_list_url = Url::toRoute(['event-list/index']);  

$membershipEvent = MembershipEvent::find('id')
->where(['id_event_list' => $id_event_list]) 
->all(); 
$membershipEventCount = count($membershipEvent); 
$this->params['breadcrumbs'][] = ['label' => 'Event List', 'url' => $event_list_url];
$this->params['breadcrumbs'][] = ['label' => $eventListData->event_name];
$this->params['breadcrumbs'][] = ['label' => 'Participation'];
// echo "<pre>"; 
// print_r($dataProvider);
//  exit();
?>
<style>
    .modal-lg{
        width: 90%;
    }
</style>
<div class="event-list-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <?php 
        require_once(__DIR__ . '/../site/_top_menu_event.php');
    ?>
    <div class="panel" style="border-top-left-radius: 0px;">  
        <div class="panel-body">  
            <p class="text-main text-bold">Participation</p>
            <hr> 
            <div class="row">
                <div class="col-md-12">
                    <div class="pull-right">
                        <?php
                        if($membershipEventCount >= 1){ 
                        ?>
                        <button onclick="window.location.href='<?=$base_url?>/event-list/export-csv?id_event_list=<?=$id_event_list?>'" class="btn btn-info btn-rounded" id="btn_export_csv">                          
                            Export CSV <i class="demo-psi-file-csv go-right"></i>
                        </button> 
                        <?php
                        }
                        ?>
                        <?php
                        if($eventListData->authorized == 1){
                        ?>
                        <!-- <button data-target="#demo-default-modal" data-toggle="modal" class="btn btn-success btn-rounded" id="modalButtonAddNewParticipation" value="<?= Url::toRoute(['event-list/create-new-participation','id_event_list'=>$id_event_list]) ?>">                          
                            Add New Participation <i class="demo-psi-add-user go-right"></i>
                        </button>  -->
                        <?php
                        }
                        ?>
                        <button data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['event-list/create-participation','id_event_list'=>$id_event_list]) ?>">                          
                            Add Existing Participation <i class="fa fa-plus-square go-right"></i>
                        </button> 
                    </div>
                </div>
            </div> 
            <br>
    
        <?php
            Modal::begin([
                'header' => ' <h4 class="modal-title">'.'Participation'.'</h4>',
                'id' => 'modal',
                'options' => ['data-backdrop' => 'static'], 
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
                    'attribute' => 'register_date', 
                    'contentOptions' => ['class' => 'text-center'],
                    'headerOptions' => ['class' => 'text-center'],
                ],
                // 'id',
                [
                    'attribute' => 'id_membership_profile',
                    'label' => 'Participation Name',
                    // 'value' => function($model) { return $model->membershipProfile->first_name  . " " . $model->membershipProfile->last_name;}
                    'value'=>'membershipProfile.username',
                ],  
                [
                    'attribute' => 'id_membership_profile',
                    'label' => 'Company', 
                    'format' => 'raw',
                    'value'=>function ($data) { 
                        $base_url = Yii::getAlias('@web');
                        if($data->membershipProfile['membership_type'] == 1){
                            $membership_profile_url = $base_url."/membership-profile/detail";
                        }else{
                            $membership_profile_url = $base_url."/membership-profile/subscriber-detail";
                        } 
                        return Html::a(Html::encode($data->membershipProfile['company_name']),$membership_profile_url.'?id='.$data->membershipProfile['id'],['style' => 'color:#3c6382','target'=>'_blank']);
                    },
                ],  
                // 'id',
                // 'id_event_list',
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
                // 'email:email',
                //'description',
                //'created_date',
                //'created_by',
                //'updated_date',
                //'updated_by',
                // [
                //     'attribute' => 'status',
                //     'contentOptions' => ['class' => 'text-center'],
                //     'headerOptions' => ['class' => 'text-center'],
                //     'format' => 'raw',
                //     'value' => function ($model) {
                //         if ($model->status == 1) {
                //             return '<div class="text-center"><span class="label label-info">Upcoming</span></div>';
                //         } else {
                //             return '<div class="text-center"><span class="label label-danger">Expired</span></div>';
                //         }
                //     },
                // ],

                [
                    'class' => 'yii\grid\ActionColumn',
                    'header' => 'Actions',
                    'headerOptions' =>['class'=>'text-center','style'=>'text-decoration: none; color: #7a878e;outline: 0;'],
                    'contentOptions' => ['class' => 'text-center'],
                    'template' => '{view-participation} {update-participation} {delete-participation}',
                    'buttons' => [
                        'view-participation' => function ($url, $model) {
                                return Html::button('<i class ="fa fa-search"></i>',
                                [
                                    'value'=> $url,
                                    'id'=> 'modalButtonView',
                                    'data-pjax'=>'0',
                                    'class' => 'btn btn-xs btn-default '.$url.'',
                                ]);
                        },
                        'update-participation' => function ($url, $model) {
                            return Html::button('<i class ="fa fa-pencil"></i>',
                            [
                                'value'=> $url.'&id_event_list='.$_GET['id_event_list'],
                                'id'=> 'modalButtonUpdate',
                                'data-pjax'=>'0',
                                'class' => 'btn btn-xs btn-default',
                            ]);
                        },
                        'delete-participation' => function ($url, $model) {
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
    var controller_id = "event-list";
    $("#select_page_size").change(function(){
        var page_size = $("#select_page_size").val();
        var url = window.location.pathname;
            window.location.replace(url+"?r="+controller_id+"/index&id_event_list='.$id_event_list.'&page_size="+page_size); 
    });


    $(document).on("click","#modalButtonAddNewParticipation",function () {
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
');
?>
