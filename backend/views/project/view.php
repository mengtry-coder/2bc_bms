<?php

use yii\helpers\Html; 
use yii\widgets\DetailView;
use yii\helpers\Url;
$class_id = Yii::$app->controller->action->id; 
$base_url = Yii::getAlias('@web');
$this->title = 'Project Overview';
$this->params['breadcrumbs'][] = ['label' => 'Project', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->project_name];
$this->params['breadcrumbs'][] = $this->title;

$this->registerJsFile(
    '@web/plugins/easy-pie-chart/jquery.easypiechart.min.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

function calculateProgress($current, $all){
    if($all == 0){
        $all = 1;
    }
    $result = ($current / $all) * 100;
    if($result >= 100){
        $result = 100;
    }
    return number_format($result,2);
}

$date1 = new DateTime($model->start_date);
$date2 = new DateTime($model->deadline);
$current_date = new DateTime(date('Y-m-d'));

$total_date = $date1->diff($date2);
$current_date = $date1->diff($current_date);

$start_day = $current_date->days - $model->cut_off_day;
$end_day = $total_date->days - $model->cut_off_day;
if($start_day >= $end_day){
    $start_day = $end_day;
}

?>
<style type="text/css">
    .project-overview .panel-heading .panel-title{
        text-transform: uppercase;
    }
    .project-overview  .col-md-6{
        padding: 0px !important;
    }
    .project-overview .progress {
        margin-left: 7% !important;
        margin-right: 7% !important;
    }
    /*.project-overview .panel{
        border-radius: 0px;
        border-right: 1px solid gainsboro;
        border-bottom: 1px solid gainsboro;
    }*/
    .panel-title-inline {
        font-size: 16px;
    }
    .project-overview-left {
        border-right: 1px solid #f0f0f0f0;
        border-top: 1px solid #f0f0f0f0;
        margin-top: -20px;
        padding-top: 20px !important;
    }

    .project-overview-right {
        border-top: 1px solid #f0f0f0f0;
        margin-top: -20px;
        padding-top: 20px !important;
    }

    .hr-border-left {
        margin-right: -15px;
        margin-left: -15px;
        padding-top: 0px;
        padding-bottom: 0px;
    }
    .hr-border-right {
        margin-right: 0px;
        margin-left: 0px;
        padding-top: 0px;
        padding-bottom: 0px;
    }

</style>
<div class="employee-profile-profile">
    <ul class="nav nav-tabs fa_style" style="border-bottom: none;"> 
        <li><?= Html::a('Profile Overview', ['project/overview','id' => $model->id], ['class' => 'overview']) ?></li>
        <li><?= Html::a('Task', ['project/task','id_project' => $model->id], ['class' => 'task']) ?></li>
        <li><?= Html::a('Timesheet', ['project/timesheet','id_project' => $model->id], ['class' => 'timesheet']) ?></li>
        <li><?= Html::a('Sale', ['project/sale-invoice','id_project' => $model->id], ['class' => 'sale-invoice']) ?></li>
        <li><?= Html::a('Document', ['project/document','id_project' => $model->id], ['class' => 'document']) ?></li>
        <li><?= Html::a('Note', ['project/note','id_project' => $model->id], ['class' => 'note']) ?></li>
    </ul>

    <div class="panel">
        <div class="panel-body">
            <?= $this->render('//project/_top_header'); ?>
            <p class="text-main text-bold"><?= $this->title; ?></p>
            <hr class="new-section-sm bord-no">
            <div class="row project-overview">
                <div class="col-md-6 project-overview-left">
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">OVERVIEW</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <?= DetailView::widget([
                                        'model' => $model,
                                        'options' => [ 
                                            'class' => 'table table-bordered',
                                            'cellspacing'=>'0',
                                            'width'=>'100%', 
                                        ],
                                        'attributes' => [
                                            [
                                                'attribute' => 'customer.customer_name'
                                            ],
                                            [
                                                'attribute' => 'billingType.name',
                                                'label' => 'Billing Type'
                                            ],
                                            [
                                                'attribute' => function($model){
                                                    $total = \backend\models\CustomerInvoice::find()->select(['SUM(total_amount) as total_amount'])->where(['id_project'=>$model->id])->one();
                                                    return '$'. number_format($total->total_amount,2);
                                                },
                                                'label' => 'Invoices'
                                            ],
                                            [
                                                'attribute' => function($model){
                                                    $total = \backend\models\Expense::find()->select(['SUM(total_amount) as total_amount'])->where(['id_related_to'=>3, 'id_related_profile'=>$model->id])->one();
                                                    return '$'. number_format($total->total_amount,2);
                                                },
                                                'label' => 'Expenses'
                                            ],
                                            [
                                                'attribute' => 'projectStatus.name',
                                                'label' => 'Status'
                                            ],
                                            [
                                                'attribute' => 'start_date',
                                                'format' => ['date', 'php:d-M-Y'],
                                            ],
                                            [
                                                'attribute' => 'due_date',
                                                'format' => ['date', 'php:d-M-Y'],
                                            ],
                                            [
                                                'attribute' => 'deadline',
                                                'format' => ['date', 'php:d-M-Y'],
                                            ],

                                        ],
                                    ]) ?>
                                </div>
                            </div>
                            <div class="row">
                                <hr class="hr-border-left">
                                <div class="col-md-12">
                                    <h3 class="panel-title-inline"><i class="fa fa-tag"></i>Tags</h3>
                                    <?php 
                                        if(!empty($model_tag)){
                                            foreach ($model_tag as $key => $value) {
                                                echo '<button class="btn btn-default btn-rounded">'.$value->id_tag.'</button>&nbsp;&nbsp;&nbsp;';
                                            }
                                        }
                                    ?>
                                </div>
                            </div>
                            <div class="row">
                                <hr class="hr-border-left" style="margin-right: -10px !important;">
                                <div class="col-md-12">
                                    <h3 class="panel-title-inline">Members</h3>
                                    <ul class="list-group">
                                        <?php 
                                            if(!empty($model_member)){
                                                foreach ($model_member as $key => $value) {
                                                    $profile_image = $base_url."/".$value['img_url'];
                                        ?>
                                            <li class="list-group-item">
                                                <a target="_blank" class="btn-link" href="<?= URL::toRoute(['employee-profile/profile','id'=>$value['id']]) ?>">
                                                    <img src="<?= $profile_image ?>" class="img-circle img-xs" />
                                                    <?= $value['employee_name'] ?>
                                                </a>
                                            </li>  
                                        <?php
                                                }
                                            }
                                        ?>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 project-overview-right">

                    <div class="row">
                        <div class="col-md-6 col-sm-12 col-xs-12">
                            <h3 class="panel-title"><?= $complete_task.' / '.$all_task?> open tasks</h3>
                            <span style="margin-left: 7%;"><?= calculateProgress($complete_task, $all_task).'%'; ?></span>
                            <div class="progress">
                                <div style="width: <?= calculateProgress($complete_task, $all_task).'%'; ?>" class="progress-bar progress-bar-info"></div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12 col-xs-12">
                            <h3 class="panel-title"><?= $start_day.' / '. $end_day ?> days left</h3>
                            <span style="margin-left: 7%;"><?= calculateProgress($start_day, $end_day).'%'; ?></span>
                            <div class="progress">
                                <div style="width: <?= calculateProgress($start_day, $end_day).'%'; ?>" class="progress-bar progress-bar-info"></div>
                            </div>
                        </div>
                    </div>
                    <hr class="hr-border-right">
                    <div class="panel text-center">
                        <div class="panel-heading">
                            <div class="row">
                                <h3 class="panel-title">project progress</h3>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div id="project-progressing-pie" class="demo-pie pie-title-center" data-percent="<?= $model->is_calculate==0?$model->project_progress : calculateProgress(($complete_task), $all_task); ?>">
                                        <span class="pie-value text-thin text-2x"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="hr-border-right">
                    <div class="panel">
                        <div class="panel-heading">
                            <div class="row">
                                <h3 class="panel-title">Description</h3>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <p><?= empty($model->description)?'No description for this project':$model->description ?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style media="screen">
a.<?=$class_id;?>{cursor: default; background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a:hover{background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a{background-color: #dbe3ec;transition: background-color,0.3s;}
</style>

<?php 

$script = <<<JS
    
    $('#project-progressing-pie').easyPieChart({
        barColor :'#efb239',
        scaleColor: false,
        trackColor : 'rgba(0,0,0,.1)',
        lineWidth : 10,
        size : 200,
        onStep: function(from, to, percent) {
            $(this.el).find('.pie-value').text(parseFloat(percent).toFixed(2) + '%');
        }
    });

JS;

$this->registerJs($script);

?>