<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;
use backend\models\UploadedFile;
/* @var $this yii\web\View */
/* @var $searchModel backend\models\UserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Users';
$this->params['breadcrumbs'][] = $this->title;
?>
<style>
.modal-lg {
    width: 90%;
}

.row-table {
    cursor: pointer;
}

#container .table td {
    vertical-align: middle;
}

.td_img {
    padding: 5px !important;
}
</style>
<div class="user-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <div class="panel">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <?php echo $this->render('_search', ['model' => $searchModel]); ?>
                </div>
            </div>
            <br>

            <?php
            Modal::begin([
                'header' => ' <h4 class="modal-title">'.'Users'.'</h4>',
                'id' => 'modal',
                'class' => 'modal fade',
                'size' => 'modal-md',
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
                    'attribute' => 'Profile',
                    'format' => 'html',   
                    'contentOptions' => ['class' => 'text-center'],
                    'headerOptions' => ['class' => 'text-center text-muted'],
                    'value' => function ($data) { 
                        if($data->employee->img_url == ""){
                            $img_url_id = 1;
                        }else{
                            $img_url_id = $data->employee->img_url;
                        } 
                            $img_id = $img_url_id;
                            $command = Yii::$app->db->createCommand("select id from uploaded_file where id = :id");
                            $command->bindParam(':id', $img_id);
                            $my_id = $command->queryOne();
                            if ($my_id == '') {
                                $my_id = 1;
                            }
                            if($img_id == ''){
                                $img_id = 1;
                                $my_id = $img_id;
                            }  
                            $img_url = UploadedFile::find()->where(['id' => $my_id])->one()->filename;
                          
                            $img_url = Yii::getAlias('@web') ."/". $img_url;
                            return Html::img($img_url,['width' => '40px','height' => '40px', 'class'=>'img-xs img-circle'],[]);
                    },
                ], 
                [
                    'attribute' => 'id_employee',
                    'format' => 'raw',
                    'value' => function($model){
                        return "<a href='". URL::toRoute(['employee-profile/profile','id'=>$model->id_employee, 'smMenu'=>1])."' target='_blank' class='text-info'> ".$model->employee->id_prefix . ' '.$model->employee->first_name . ' '. $model->employee->last_name."</a>" ; 
                    }
                ],
                [
                    'attribute' => 'id_department',
                    'headerOptions' => ['class' => 'text-muted'],
                    'label' => 'Department',
                    'value' => 'employee.department.name'
                ],
                [
                    'attribute' => 'id_position',
                    'label' => 'Position',
                    'value' => 'employee.position.position_type'
                ],
                'username',
                [
                    'attribute' => 'user_type_id',
                    'value' => 'userType.user_type_name'
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
        var controller_id = "user";
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