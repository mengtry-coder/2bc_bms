<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;

$this->title = 'Contact List';
$this->params['breadcrumbs'][] = ['label' => 'Contact', 'url' => ['#']];
$this->params['breadcrumbs'][] = ['label' => 'Supplier', 'url' => ['index']];
$this->params['breadcrumbs'][] = $model->supplier_name;
$this->params['breadcrumbs'][] = $this->title;
?>
<style type="text/css">
    .row-table {
        cursor: pointer;
    }
</style>
<div class="supplier-profile-index">

    <div class="row">
        <!-- <div class="col-md-3 col-sm-4">
            <?= $this->render('//supplier-profile/left_menu'); ?>
        </div> -->
        <div class="col-md-12 col-sm-12">

            <div class="panel"> 
                <div class="panel-body">  
                    <div class="row">
                        <div class="col-md-12">
                            <?= $this->render('//supplier-profile/contact/search', ['model' => $searchModel]); ?>
                        </div>
                    </div>
                    <br>
            
                <?php
                    Modal::begin([
                        'header' => ' <h4 class="modal-title">'.'Contact restaurant Profiles'.'</h4>',
                        'id' => 'modal',
                        'class' => 'modal fade',
                        'size' => 'modal-custom-md',
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
            
                    'columns' => [
                    ['class' => 'yii\grid\SerialColumn'],

                    	[
                            'attribute' => 'name',
                            'value' => function ($model) {
                                return $model->name;
                            },
                        ],
                        [
                            'attribute' => 'position_id',
                            'value' => function ($model) {
                                return $model->position->name;
                            },
                        ],
                        [
                            'attribute' => 'department_id',
                            'value' => function ($model) {
                                return $model->department->name;
                            },
                        ],                        
                        [
                            'attribute' => 'mobile',
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
                        'headerOptions' =>['class'=>'text-center','style'=>'max-width: 60px; color: #7a878e;outline: 0;'],
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
                                $url = Url::to(['supplier-profile/update-contact', 'id' => $model->id]);
                                return Html::button('<i class ="fa fa-pencil"></i>',
                                [
                                    'value'=> $url,
                                    'id'=> 'modalButtonUpdate',
                                    'data-pjax'=>'0',
                                    'class' => 'btn btn-xs btn-default',
                                ]);
                            },
                            'delete' => function ($url, $model) {
                                $url = Url::to(['supplier-profile/delete-contact', 'id' => $model->id]);
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
    </div>
</div>

<?php

$profile_id = Yii::$app->request->get('id');

$script = <<<JS

    var pagination = $(".pagination").height();
    var extra_height = 0;
    if (isNaN(pagination)) {
        extra_height = 18;
    }
    extra_height = parseFloat(extra_height);
    
    var table_height = $(window).height() - 320 + extra_height;
    $(".fixedHeader").css({"height": table_height});

    var controller_id = "supplier-profile";
    var profile_id = "$profile_id";
    $("#select_page_size").change(function(){
        var page_size = $("#select_page_size").val();
        var url = window.location.pathname;
            window.location.replace(url+"?r="+controller_id+"/contact&id="+profile_id+"&smMenu=1&page_size="+page_size);
    });

    $(document).on("click","#modalButton",function () {
        $("#modal").modal("show")
            .find("#modalContent")
            .load($(this).attr("value"));
        $("#modal").find(".modal-title").html($(this).data("title"));
    });

    $(document).on("click","#modalButtonUpdate",function () {
        $("#modal").modal("show")
            .find("#modalContent")
            .load($(this).attr("value"));
        $("#modal").find(".modal-title").html($(this).data("title"));
    });

JS;

$this->registerJs($script);

?>
