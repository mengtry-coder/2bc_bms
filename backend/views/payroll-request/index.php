<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;

$this->registerJsFile(
    '@web/js/sweetalert.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

$this->title = 'Payroll Requests';
$this->params['breadcrumbs'][] = ['label' => 'Human Resource', 'url' => '#'];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="payroll-request-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <div class="panel"> 
        <div class="panel-body">  
            <div class="row">
                <div class="col-md-12">
                    <div class="pull-right">
                        <button data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['payroll-request/create']) ?>">                            Add New <i class="fa fa-plus-square go-right"></i>
                        </button> 
                    </div>
                </div>
            </div>
            <br>
    
        <?php
            Modal::begin([
                'header' => ' <h4 class="modal-title">'.'Payroll Requests'.'</h4>',
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
                'rowOptions'   => function ($model) {
                    return ['data-id' => $model->id, 'class'=>'row-table', 'data-toggle'=>"tooltip", 'data-placement'=>"top", 'title'=>"View Payroll Request"];
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
        
                'columns' => [
                    ['class' => 'yii\grid\SerialColumn'],

                    [
                        'attribute' => 'date',
                        'format' => ['date', 'php:d-M, Y'],
                    ],
                    [
                        'attribute' => 'id_month',
                        'value' => function($model){
                            return $model->month->name .', ' . $model->year->name;
                        }
                    ],
                    [
                        'attribute' => 'grand_total_total_net_pay_amount',
                        'value' => function($model){
                            return "$".$model->grand_total_total_net_pay_amount;
                        }
                    ],
                    [
                        'attribute' => 'id_prepared_by',
                        'format' => 'raw',
                        'value' => function($model){
                            // return "<a href='". URL::toRoute(['employee-profile/update','id'=>$model->employee->id])."' target='_blank' class='text-info'> ".$model->employee->id_prefix . ' '. $model->employee->first_name . ' ' . $model->employee->last_name."</a>" ;
                            return $model->employee->id_prefix . ' '. $model->employee->first_name . ' ' . $model->employee->last_name;
                        }
                    ],
                    [
                        'attribute' => 'status',
                        'contentOptions' => ['class' => 'text-center'],
                        'headerOptions' => ['class' => 'text-center'],
                        'format' => 'raw',
                        'value' => function ($model) {
                            if($model->status == 0){
                                return '<div class="text-center"><span class="label label label-danger">Rejected</span></div>';
                            }else{
                                return '<div class="text-center"><span class="label '.$model->payrollRequestStatus->css_class.'">'.$model->payrollRequestStatus->name.'</span></div>';
                            }
                        },
                    ],

                    [
                        'class' => 'yii\grid\ActionColumn',
                        'header' => 'Actions',
                        'headerOptions' =>['class'=>'text-center','style'=>'text-decoration: none; color: #7a878e;outline: 0;'],
                        'contentOptions' => ['class' => 'text-center'],
                        'template' => '{submit} {update}',
                        'buttons' => [
                            'submit' => function ($url, $model) {
                                if($model->status == 3){
                                    return Html::button('<i class ="demo-pli-paper-plane"></i>',
                                    [
                                        'value'=> $url,
                                        'id'=> 'submit_payroll',
                                        'class' => 'submit_payroll btn btn-xs btn-info',
                                        'title' => 'Submit Payroll',
                                        'data' => [
                                            'value' => yii\helpers\Url::to(['payroll-request/submit', 'id' => $model->id]),
                                            'confirm' => 'Are you sure want to submit this payroll request?',
                                            'method' => 'post',
                                            'toggle' => 'tooltip',
                                            'placement' => 'left',
                                        ]
                                    ]);
                                }
                                
                            },
                            'update' => function ($url, $model) {
                                if($model->status == 3){
                                return Html::button('<i class ="fa fa-pencil"></i>',
                                    [
                                        'value'=> $url,
                                        'id'=> 'modalButtonUpdate',
                                        'data-pjax'=>'0',
                                        'class' => 'btn btn-xs btn-default',
                                    ]);
                                }
                            },
                            'delete' => function ($url, $model) {
                                // if($model->status == 3){
                                    return Html::a('<span class="fa fa-trash"></span>', $url, [
                                        'title' => Yii::t('app', 'lead-delete'),
                                        'class' => 'btn btn-xs btn-default',
                                        'data' => [
                                            'confirm' => 'Are you sure want to delete it?',
                                            'method' => 'post',
                                        ],
                                    ]);
                                // }
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
        var controller_id = "payroll-request";
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

$url = URL::toRoute(['payroll-request/view']);
$script = <<<JS

    $("td").click(function (e) {
        var id = $(this).closest("tr").data("id"); 
        var url = "$url" + '?id=' + id + '&smMenu=1';
        if(e.target == this)
            location.href = url;
    });

    // $(function () {
    //     $("[data-toggle='tooltip']").tooltip();
    // });

    yii.confirm = function (message, okCallback, cancelCallback) {
        var val = $(this).data('value');
        
        if($(this).hasClass('submit_payroll')){
            swal({
                text: "Are you sure you want to submit this payroll request?",
                icon: "warning",
                buttons: true,
                buttons: [
                    'No',
                    'Yes'
                ],
                dangerMode: false
            }).then(function(isConfirm) {
                if (isConfirm) {
                    $.post(val); // <--- submit form programmatically
                    $('#overlay').css({'display':'block','z-index':'9999'});
                }
            });
        }
    };

JS;
$this->registerJs($script);

?>
