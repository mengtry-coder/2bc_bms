<?php
use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;
use backend\models\UploadedFile;
use backend\models\MembershipEvent;
$base_url = Yii::getAlias('@web');

$this->title = 'Event Lists';
$this->params['breadcrumbs'][] = $this->title;
$event_list_url = URL::toRoute(['event-list/detail']);
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
<div class="event-list-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <div class="panel"> 
        <div class="panel-body">  
            <div class="row">
                <div class="col-md-12">
                    <div class="pull-right">
                        <button data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['event-list/create']) ?>">                            Add New <i class="fa fa-plus-square go-right"></i>
                        </button> 
                    </div>
                </div>
            </div>
            <br>
    
        <?php
            Modal::begin([
                'header' => ' <h4 class="modal-title">'.'Event Lists'.'</h4>',
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
                    'attribute' => 'Image',
                    'format' => 'html',  
                    'contentOptions' => ['class' => 'td_img'],  
                    'value' => function ($data) {
                        
                        if($data['img_url'] ==""){
                            $img_url_id = 1;
                        }else{
                            $img_url_id = $data['img_url'];
                        }
                        return Html::img(Yii::getAlias('@web').'/'. UploadedFile::find()->where(['id' => $img_url_id])->one()->filename,
                            ['width' => '40px','height'=>'40px']);
                    },
                ],
                [
                    'attribute' => 'from_date',
                    'label' => 'Date Period',
                    'value' => function($model) { return $model->from_date  . " To " . $model->to_date ;},
                    'contentOptions' => ['class' => 'text-center'],
                    'headerOptions' => ['class' => 'text-center'],
                ],
                // 'img_url:url',
                'event_name',
                // 'number_of_audient',
                [
                    'attribute' => 'numParticipatoin',
                    'label' => 'No.Pax',
                    'value' => function($model) 
                    { 
                        $countParticipation = Yii::$app->db->createCommand("
                            SELECT sum(membership_event.number_of_audient) as number_of_audient
                            FROM membership_event 
                            WHERE membership_event.id_event_list = $model->id
                        ")->queryOne(); 
                        return $countParticipation['number_of_audient'];
                    },
                    'contentOptions' => ['class' => 'text-right'],
                    'headerOptions' => ['class' => 'text-right'],
                ],
                // 'address',
                [
                    'attribute' => 'fee_for_membership',
                    'format' => ['currency', '$'],
                    'label' => 'Membership',
                    'contentOptions' => ['class' => 'text-right'],
                    'headerOptions' => ['class' => 'text-right'],
                ],
                [
                    'attribute' => 'fee_for_subscriber',
                    'format' => ['currency', '$'],
                    'label' => 'Subscriber',
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
                            return '<div class="text-center"><span class="label label-info">Active</span></div>';
                        } else {
                            return '<div class="text-center"><span class="label label-danger">Inactive</span></div>';
                        }
                    },
                ],

            //'address_line_2',
            //'id_country',
            //'id_city',
            //'id_province',
            //'postal_code',
            //'prefix_phone_code',
            //'phone_number',
            //'prefix_phone_code_line_2',
            //'phone_number_line_2',
            //'email:email',
            // 'description',
            //'created_date',
            //'created_by',
            //'updated_date',
            //'updated_by',
            //'status',
            //'from_date',
            //'to_date',

                [
                    'class' => 'yii\grid\ActionColumn',
                    'header' => 'Actions',
                    'headerOptions' =>['class'=>'text-center','style'=>'text-decoration: none; color: #7a878e;outline: 0;'],
                    'contentOptions' => ['class' => 'text-center'],
                    'template' => '{detail} {update} {delete}',
                    'buttons' => [
                        'detail' => function ($url, $model) {
                            return Html::a('<span class="demo-psi-folder"></span>', $url, [
                                'title' => Yii::t('app', 'Detail'),
                                'class' => 'btn btn-xs btn-default'
                            ]);
                        },

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
        var controller_id = "event-list";
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
$script = <<<JS
$("td").click(function (e) {
    var id = $(this).closest("tr").data("id"); 
    var url = "$event_list_url" + '?id=' + id;
    if(e.target == this)
        location.href = url;
});
JS;
$this->registerJs($script);
?>
