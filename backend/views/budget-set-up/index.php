<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use yii\grid\GridView;
use backend\models\BudgetSetUp;
use backend\models\BudgetSetUpData;
use backend\models\Quotation;

$base_url = Yii::getAlias('@web');

function calculateProgress($current, $all){
    if($all == 0){
        $all = 1;
    }
    $result = ($current / $all) * 100;
    return number_format($result,2);
}
$this->registerJsFile(
    '@web/plugins/easy-pie-chart/jquery.easypiechart.min.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

$this->title = 'Budget Set Ups';
$this->params['breadcrumbs'][] = $this->title;
?>


<style type="text/css">
    /* improve visual readability for IE8 and below */
    .custom_odd_even tr{
        background: #fff;
    }
    /*  Define the background color for all the ODD table columns  */
    .custom_odd_even tr td:nth-child(odd){ 
        background: #fff;
    }
    /*  Define the background color for all the EVEN table columns  */
    .custom_odd_even tr td:nth-child(even){
        background: #24476a0a;
    }
    .modal-lg {
        width: 95%;
    }
    .budget-set-up-index .panel-heading .panel-title{
        text-transform: uppercase;
    }
    .budget-set-up-index .progress {
        margin-left: 7% !important;
        margin-right: 7% !important;
    }
    .grid-view tr td:hover {
        cursor: pointer;
    }
</style> 
<div class="budget-set-up-index">
    
    <?php 
        $model_budget = BudgetSetUp::find()->where(['year'=>date('Y')])->all();
        $model_budget = empty($model_budget) ? [] : $model_budget;

    ?>

    <div class="panel">
        <div class="panel-body">

            <div class="panel">
    
                <!--Panel heading-->
                <div class="panel-heading">
                    <div class="pull-right">
                        <button class="btn btn-primary btn-labeled collapsed" data-panel="minmax" data-target="#panel-collapse-e240" data-toggle="collapse" aria-expanded="false"><i class="btn-label demo-pli-dot-vertical"></i> Summary</button>
                    </div>
                    <h4 class="pad-btm bord-btm"><i class="demo-pli-male-female icon-fw v-middle"></i> Actual / Budget <?= date('Y'); ?></h4>
                </div>
    
                <!--Panel body-->
                <div class="collapse" id="panel-collapse-e240" aria-expanded="false" style="height: 0px;">
                    <div id="demo-acc-faq" class="panel-group panel-group-trans panel-group-condensed accordion">
                        
                        <?php 
                            $i =0;
                            foreach ($model_budget as $key => $value) { 
                                $i++;
                                $budget_id = $value->id;
                                $employee_id = $value->id_employee;

                                $budget_data = Yii::$app->db->createCommand("
                                    SELECT 
                                        a.monthly,
                                        b.`name` AS month_name ,
                                        ( SELECT COALESCE(SUM(grand_total) , 0) FROM quotation WHERE `status` = 6 AND assigned = c.id_employee AND MONTH(close_sale_date) = a.id_month) AS actual,
                                        ( (SELECT COALESCE(SUM(grand_total) , 0) FROM quotation WHERE `status` = 6 AND assigned = c.id_employee AND MONTH(close_sale_date) = a.id_month) - a.monthly) as result 
                                    FROM budget_set_up_data AS a 
                                    INNER JOIN month_list AS b ON a.id_month = b.id 
                                    INNER JOIN budget_set_up AS c ON c.id = a.id_budget_set_up 
                                    WHERE a.id_budget_set_up = :id_budget_set_up")
                                ->bindParam(':id_budget_set_up', $budget_id)->queryAll();

                                $model_member = Yii::$app->db->createCommand("
                                    SELECT COALESCE(c.filename, (select filename from uploaded_file where id =1)) as img_url
                                    FROM employee_profile as b
                                    LEFT JOIN uploaded_file as c on c.id = b.img_url
                                    WHERE b.id  = :id_employee
                                ")->bindParam(':id_employee', $employee_id)->queryScalar();

                                $last_close_sale = \backend\models\Quotation::find()->where(['assigned'=>$employee_id])->orderBy(['close_sale_date'=>SORT_DESC])->one();
                                $close_sale_date = empty($last_close_sale) ? '' : $last_close_sale->close_sale_date;

                                // $profile_image = str_replace($_SERVER['DOCUMENT_ROOT'], '', $model_member);
                                $profile_image = $base_url ."/". $model_member;

                        ?>
                        <div class="panel">
                            <div class="panel-heading">
                                <p class="panel-title">
                                    <a href="#demo-acc-faq-<?= $value->id ?>" data-parent="#demo-acc-faq" data-toggle="collapse" class="collapsed">
                                        <i class="demo-pli-dot-vertical"></i>
                                        <span class="pad-lft"></span>
                                        <img src="<?= $profile_image ?>" class="img-circle img-xs" onError="this.onerror=null;this.src='<?= $base_url.'/backend/uploads/empty-avatar.png' ?>';"/> 
                                        <span class="pad-lft"></span>
                                        <p class="text-primary text-semibold" style="padding-left: 75px; margin-top: -31px;">
                                            <?= $value->employee->id_prefix  . " " . $value->employee->first_name ." ". $value->employee->last_name; ?>
                                            <span class="text-normal text-sm" style="font-style: italic;"><?= empty($close_sale_date)?'':" | Lastest sale at ". date_format(date_create($close_sale_date),'F d, Y'); ?> </span>
                                        </p>
                                        <p class="text-muted text-sm" style="padding-left: 75px; margin-top: -10px;"><?= $value->employee->position->position_type ?></p>
                                    </a>
                                </p>
                                <div class="pad-btm"></div>
                            </div>
                            <div class="panel-collapse collapse <?= $i == 1?'in':'' ?>" id="demo-acc-faq-<?= $value->id ?>">
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered custom_odd_even">
                                            <thead>
                                                <tr>
                                                    <th class="text-center">#</th>
                                                    <?php 
                                                        foreach ($budget_data as $b_data) {
                                                            echo "<td class='text-right'>".$b_data['month_name']."</td>";
                                                        }
                                                    ?>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="text-center">Actual</td>
                                                    <?php 
                                                        foreach ($budget_data as $b_data) {
                                                            echo "<td class='text-right text-semibold'>$ ".number_format($b_data['actual'], 2)."</td>";
                                                        }
                                                    ?>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">Budget</td>
                                                    <?php 
                                                        foreach ($budget_data as $b_data) {
                                                            echo "<td class='text-right text-semibold'>$ ".number_format($b_data['monthly'], 2)."</td>";
                                                        }
                                                    ?>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">Under/Over</td>
                                                    <?php 
                                                        foreach ($budget_data as $b_data) {
                                                            $text_style = '';
                                                            $icon_style = '';
                                                            if($b_data['result'] > 0){
                                                                $text_style = 'text-info';
                                                                $icon_style = 'pci-chevron chevron-up pull-left';
                                                            }else if($b_data['result'] < 0){
                                                                $text_style = 'text-danger';
                                                                $icon_style = 'pci-chevron chevron-down pull-left';
                                                            }

                                                            echo "<td class='text-right ".$text_style." text-semibold'><i class='".$icon_style."'></i>$ ".number_format($b_data['result'], 2)."</td>";
                                                        }
                                                    ?>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php } ?>
                        
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6 bord-rgt">
                    <div class="panel text-center">
                        <div class="panel-heading">
                            <div class="row">
                                <h3 class="panel-title">this month progress</h3>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <ul class="list-group text-left pad-ver">
                                        <li class="list-group-item">
                                            <div class="pull-right"><h5 class="text-semibold"><?= "$". number_format($monthly_actual, 2); ?></h5></div>
                                            <h5 class="text-semibold">Actual</h5>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="pull-right"><h5 class="text-semibold"><?= "$".number_format($monthly_plan, 2); ?></h5></div>
                                            <h5 class="text-semibold">Budget</h5>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-6">
                                    <div id="this_month-progressing-pie" class="demo-pie pie-title-center" data-percent="<?= calculateProgress($monthly_actual, $monthly_plan).'%'; ?>">
                                        <span class="pie-value text-thin text-2x"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="panel text-center">
                        <div class="panel-heading">
                            <div class="row">
                                <h3 class="panel-title">this year progress</h3>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <ul class="list-group text-left pad-ver">
                                        <li class="list-group-item">
                                            <div class="pull-right"><h5 class="text-semibold"><?= "$".number_format($yearly_actual, 2); ?></h5></div>
                                            <h5 class="text-semibold">Actual</h5>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="pull-right"><h5 class="text-semibold"><?= "$".number_format($yearly_plan, 2); ?></h5></div>
                                            <h5 class="text-semibold">Budget</h5>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-6">
                                    <div id="this_year-progressing-pie" class="demo-pie pie-title-center" data-percent="<?= calculateProgress($yearly_actual, $yearly_plan).'%'; ?>">
                                        <span class="pie-value text-thin text-2x"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="new-section-xs">

            <div class="row">
                <div class="col-md-12">
                    <div class="pull-right">
                        <?php echo $this->render('_search', ['model' => $searchModel]); ?>
                    </div>
                </div>
            </div>
            <br>

        <?php
            Modal::begin([
                'header' => ' <h4 class="modal-title">'.'Budget Set Ups'.'</h4>',
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
                        return ['data-id' => $model->id, 'class'=>'row-table', 'data-toggle'=>"tooltip", 'data-placement'=>"top", 'title'=>"Budget Overview"];
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
            [
                'attribute' => 'id_employee',
                'label' => 'Employee',
                'value' => function($model) { return $model->employee->id_prefix  . " " . $model->employee->first_name ." ". $model->employee->last_name ;},
            ],
            // 'id_position',
            // 'id_department',
            [
                'attribute'=> 'year',
                'contentOptions' => ['class' => 'text-center'],
                'headerOptions' => ['class' => 'text-center'],
                'value' => function($model){
                  return $model->year;

                }
            ],
            [
                'attribute'=> 'budget_value',
                'contentOptions' => ['class' => 'text-center'],
                'headerOptions' => ['class' => 'text-center'],
                'value' => function($model){
                  return $model->unit_type." ". number_format($model->budget_value, 2);

                }
            ],
            [
                'attribute'=> 'actual',
                'contentOptions' => ['class' => 'text-center'],
                'headerOptions' => ['class' => 'text-center'],
                'value' => function($model){
                    return $model->unit_type." ". number_format($model->actual, 2);
                }
            ],
            [
                'attribute'=> 'under_or_over',
                'contentOptions' => ['class' => 'text-center'],
                'headerOptions' => ['class' => 'text-center'],
                'value' => function($model){
                    // return $model->unit_type." ". number_format($model->under_or_over, 2);
                    return $model->unit_type." ". number_format($model->actual - $model->budget_value, 2);
                }
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
            //'created_by',
            //'created_date',
            //'updated_by',
            //'updated_date',

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
        var controller_id = "budget-set-up";
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

<?php

$project = URL::toRoute(['budget-set-up/view']);
$script = <<<JS

$(".grid-view td").click(function (e) {
    var id = $(this).closest("tr").data("id");

    var url = "$project" + '?id=' + id;
    if(e.target == this)
        location.href = url;
});

// $(function () {
//     $("[data-toggle='tooltip']").tooltip();
// });

    $('#this_month-progressing-pie').easyPieChart({
        barColor :'#efb239',
        scaleColor: false,
        trackColor : 'rgba(0,0,0,.1)',
        lineWidth : 10,
        size : 150,
        onStep: function(from, to, percent) {
            $(this.el).find('.pie-value').text(parseFloat(percent).toFixed(2) + '%');
        }
    });

    $('#this_year-progressing-pie').easyPieChart({
        barColor :'#02A9F4',
        scaleColor: false,
        trackColor : 'rgba(0,0,0,.1)',
        lineWidth : 10,
        size : 150,
        onStep: function(from, to, percent) {
            $(this.el).find('.pie-value').text(parseFloat(percent).toFixed(2) + '%');
        }
    });


JS;
$this->registerJs($script);
?>
