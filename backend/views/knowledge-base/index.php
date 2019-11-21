<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\KnowledgeBaseSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$request = Yii::$app->request;
$id_employee_profile = $request->get('id_employee_profile',0); 
if($id_employee_profile != 0){
    $smMenu = 1;
}else{
    $smMenu = 0;
} 
$this->title = 'Knowledge Bases';
$this->params['breadcrumbs'][] = $this->title;
?>
<style type="text/css">
      .modal-lg {
      width: 95%;
      }
      </style>
      <style>
          .modal-ml{
              width: 60%;
          }

          .col-xs-5r,
          .col-sm-5r,
          .col-md-5r,
          .col-lg-5r {
              position: relative;
              min-height: 1px;
              padding-right: 10px;
              padding-left: 10px;
          }

          .col-xs-5r {
              width: 20%;
              float: left;
          }

          @media (min-width: 768px) {
              .col-sm-5r {
                  width: 20%;
                  float: left;
              }
          }

          @media (min-width: 992px) {
              .col-md-5r {
                  width: 20%;
                  float: left;
              }
          }

          @media (min-width: 1200px) {
              .col-lg-5r {
                  width: 20%;
                  float: left;
              }
          }

          .grid-view tr td:hover {
              cursor: pointer;
          }

      </style>
<div class="knowledge-base-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <div class="panel">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="pull-right">
                        <button data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['knowledge-base/create']) ?>">                            Add New <i class="fa fa-plus-square go-right"></i>
                        </button>
                    </div>
                </div>
            </div>
            <br>

        <?php
            Modal::begin([
                'header' => ' <h4 class="modal-title">'.'Knowledge Bases'.'</h4>',
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
                      return ['data-id' => $model->id, 'class'=>'row-table', 'data-toggle'=>"tooltip", 'data-placement'=>"top", 'title'=>"Article Overview"];
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

                            // 'id',
            'name',
            // 'slug',
            [
                'attribute' => 'internal_article',
                'contentOptions' => ['class' => 'text-center'],
                'headerOptions' => ['class' => 'text-center'],
                'format' => 'raw',
                'value' => function ($model) {
                    if ($model->internal_article == 1) {
                        return '<div class="text-center"><span class="label label-info">Yes</span></div>';
                    } else {
                        return '<div class="text-center"><span class="label label-danger">No</span></div>';
                    }
                },
            ],
            [
                'attribute' => 'disabled',
                'contentOptions' => ['class' => 'text-center'],
                'headerOptions' => ['class' => 'text-center'],
                'format' => 'raw',
                'value' => function ($model) {
                    if ($model->disabled == 1) {
                        return '<div class="text-center"><span class="label label-info">Yes</span></div>';
                    } else {
                        return '<div class="text-center"><span class="label label-danger">No</span></div>';
                    }
                },
            ],
            //'discription:ntext',
            'created_date',
            //'created_by',
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
$this->registerJs('
        var id_employee_profile = "'.$id_employee_profile.'"; 
        var controller_id = "knowledge-base";
        $("#select_page_size").change(function(){
            var page_size = $("#select_page_size").val();
            var url = window.location.pathname;
            if(id_employee_profile !=0){
                window.location.replace(url+"?r="+controller_id+"/index&id_employee_profile="+id_employee_profile+"&smMenu=1&page_size="+page_size);
            }else{
                window.location.replace(url+"?r="+controller_id+"/index&page_size="+page_size);
            }
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

<?php

$project = URL::toRoute(['knowledge-base/article']);
$script = <<<JS

$("td").click(function (e) {
    var id = $(this).closest("tr").data("id");

    var url = "$project" + '?id=' + id;
    if(e.target == this)
        location.href = url;
});

$(function () {
    $("[data-toggle='tooltip']").tooltip();
});

JS;
$this->registerJs($script);
?>
