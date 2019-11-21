<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;

$base_url = Yii::getAlias('@web'); 
$employee_profile = URL::toRoute(['lead-profile/profile']);

$this->title = 'Lead Profiles';
$this->params['breadcrumbs'][] = $this->title;
$flash_msg_not_save = Yii::$app->session->getFlash('error_import');
echo $flash_msg_not_save ;
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
    .title-error-inPanel{
        font-weight: normal;
        padding: 0 20px 0 20px;
        font-size: 22px;
        line-height: 59px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        color: #f45145;
    }
</style>
<div class="lead-profile-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <div class="panel"> 
        <div class="panel-body"> 
             <div class="row">
                <div class="col-md-12">
                    <?= $this->render('_search', ['model' => $searchModel]); ?>
                </div>
            </div>
        <?php
            Modal::begin([
                'header' => ' <h4 class="modal-title">'.'Lead Profiles'.'</h4>',
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
                
                //'filterModel' => $searchModel,
        
                'columns' => [
                ['class' => 'yii\grid\SerialColumn'], 
                // [
                //     'label'=>'Company Name',
                //     'attribute'=>'company_name',
                //     'format' => 'raw',
                //     'value'=>function ($value) {
                //     return Html::a($value["company_name"],['lead-profile/update/?id='.$value["id"]]);
    
                //     },
                // ],

                'lead_name',
                'company_name',
                'phone_number',
                'email_address:email',
                [
                    'attribute' => 'created_date',
                    'format' => ['date', 'php:d-M, Y'],
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
                            return '<div class="text-center"><span class="label label-danger">Inactive</span></div>';
                        }
                    },
                ],
                //'latitute',
                //'longitute',
                //'address',
                //'id_country',
                //'id_city',
                //'group_names',
                //'billing_address',
                //'id_billing_city',
                //'id_billing_country',
                //'shipping_address',
                //'id_shipping_city',
                //'id_shipping_country',
                //'status',
                //'created_by',
                //'created_date',
                //'img_url:url',
                //'updated_date',
                //'updated_by',

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
var controller_id = "lead-profile";
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
    var url = "$employee_profile" + '?id=' + id +'&smMenu=1';
    if(e.target == this)
        location.href = url;
});
JS;
$this->registerJs($script);

?>