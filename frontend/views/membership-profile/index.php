<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;
use backend\models\UploadedFile;
$base_url = Yii::getAlias('@web/backend');
$this->title = 'Membership Profiles';
$this->params['breadcrumbs'][] = $this->title;
$membership_profile_detail = Yii::getAlias('@web/membership-profile/detail'); 
$membership_profile_update = Yii::getAlias('@web/membership-profile/update'); 

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

<div class="membership-profile-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
   
    <div class="panel"> 
        <div class="panel-body">  
            <div class="row">
                <div class="col-md-12">
                <?= $this->render('_search', ['model' => $searchModel]); ?>
                    
                </div>
            </div>
            <br>
    
        <?php
            Modal::begin([
                'header' => ' <h4 class="modal-title">'.'Membership Profiles'.'</h4>',
                'id' => 'modal',
                'class' => 'modal fade',
                'size' => 'modal-lg', 
                'options'=>[
                    'tabindex' => false
                ]
            ]);
            echo "<div id='modalContent'></div>";
            Modal::end();
        
        ?>
        <div class="table-responsive">
                <?= GridView::widget([
                'dataProvider' => $dataProvider,
                'rowOptions'   => function ($model, $key, $index, $grid) {
                    return ['data-id' => $model->id, 'class'=>'row-table'];
                },
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
                    'attribute' => 'logo',
                    'format' => 'html',  
                    'contentOptions' => ['class' => 'td_img'],  
                    'value' => function ($data) {
                        
                        if($data['img_url'] ==""){
                            $img_url_id = 1;
                        }else{
                            $img_url_id = $data['img_url'];
                        }
                        return Html::img(Yii::getAlias('@web').'/'. UploadedFile::find()->where(['id' => $img_url_id])->one()->filename,
                            ['width' => '40px','height' => '40px']);
                    },
                ],

                [
                    'attribute' => 'id_prefix',
                    'label' => 'Name',
                    'value' => function($model) { return $model->prefix->names  . " " . $model->first_name ." ". $model->last_name ;},
                ],  
            'company_name',
            //'passport_no',
            //'date_of_birth',
            //'place_of_birth',
            
            //'nationality',
            //'address',
            //'address_line_2',
            //'id_country',
            //'id_city',
            //'id_province',
            //'postal_code',
            //'marital_status',
            //'prefix_phone_code',
            //'phone_number',
            //'prefix_phone_code_line_2',
            //'phone_number_line_2',
            // 'email:email',
            //'website',
            //'contact_person',
            //'position',
            //'mot_licence_no',
            'year_of_establishment',
            'type_of_business',
            //'username',
            //'password',
            //'confirm_password',
            // 'description',
            //'created_date',
            //'created_by',
            //'updated_date',
            //'updated_by',
            //'status',
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
                    'template' => '{detail} {update} {delete}',
                    'buttons' => [
                        // 'detail' => function ($base_url, $model) {
                        //     return Html::button('<i class ="fa fa-folder-o"></i>',
                        //     [
                        //         'value'=> $base_url, 
                        //         'data-pjax'=>'0',
                        //         'class' => 'btn btn-xs btn-default',
                        //     ]);
                        // },
                        // 'detail' => function ($base_url, $model) {
                        //     return Html::button('<i class ="fa fa-folder-o"></i>',
                        //     [
                        //         'value'=> $base_url . '?update =' . $model->id , 
                        //         'data-pjax'=>'0',
                        //         'class' => 'btn btn-xs btn-default',
                        //     ]);
                        // },
                        
                        'detail' => function ($url, $model) {
                            return Html::a('<span class="demo-psi-folder"></span>', $url, [
                                'title' => Yii::t('app', 'Detail'),
                                'class' => 'btn btn-xs btn-default'
                            ]);
                        },

                        // 'view' => function ($url, $model) {
                        //         return Html::button('<i class ="fa fa-search"></i>',
                        //         [
                        //             'value'=> $url,
                        //             'id'=> 'modalButtonView',
                        //             'data-pjax'=>'0',
                        //             'class' => 'btn btn-xs btn-default',
                        //         ]);
                        // },
                        
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
        var controller_id = "membership-profile";
        $("#select_page_size").change(function(){
            var page_size = $("#select_page_size").val();
            var url = window.location.pathname;
            alert(url);
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
$script = <<<JS
$("td").click(function (e) {
    var id = $(this).closest("tr").data("id"); 
    var url = "$membership_profile_detail" + '?id=' + id;
    if(e.target == this)
        location.href = url;
});
JS;
$this->registerJs($script);
?>
