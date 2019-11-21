<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use yii\grid\GridView;
use backend\models\SopGoalSetup;
use backend\models\SopGoalSetupData;
use common\models\GlobalFunction;

$this->registerJsFile(
    '@web/plugins/easy-pie-chart/jquery.easypiechart.min.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

$this->title = "Goal for ".$model->employee->id_prefix  . " " . $model->employee->first_name ." ". $model->employee->last_name ;
$this->params['breadcrumbs'][] = ['label' => 'S.O.P Goal Setups', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
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
    .panel-title {
        text-transform: uppercase;
    }
</style>
<?php 
$id = $model->id;
$id_employee = $model->id_employee;
$id_sop_step_list = $model->id_sop_step_list;

$goal_data = Yii::$app->db->createCommand("
    SELECT c.`name` as month_name, a.monthly,
        (
            SELECT COUNT(standard_operation_check_list.id)
            FROM standard_operation_check_list
            INNER JOIN standard_operation on standard_operation.id = standard_operation_check_list.id_standard_operation
            WHERE standard_operation_check_list.is_done = 1
            AND standard_operation_check_list.id_standard_operation_step_list = b.id_sop_step_list
            AND standard_operation.assign_to = b.id_employee
            AND MONTH(standard_operation_check_list.done_date) = c.id
        ) as actual
    FROM sop_goal_setup_data as a
    INNER JOIN sop_goal_setup as b on a.id_sop_set_up = b.id
    INNER JOIN month_list as c on c.id = a.id_month
    WHERE b.id = :id
    AND b.id_employee = :id_employee
    ")->bindParam(':id', $id)->bindParam(':id_employee', $id_employee)->queryAll();

$current_month = date('m');
$current_year = date('Y');

$data_by_month = SopGoalSetupData::find()->where(['id_month'=>$current_month])->one();
$monthly_actual = 0;
$monthly_plan = 0;

if(!empty($data_by_month)){
    $monthly_plan = $data_by_month->monthly;
}

$monthly_actual = Yii::$app->db->createCommand("
    SELECT COUNT(standard_operation_check_list.id)
    FROM standard_operation_check_list
    INNER JOIN standard_operation on standard_operation.id = standard_operation_check_list.id_standard_operation
    WHERE standard_operation_check_list.is_done = 1
    AND standard_operation_check_list.id_standard_operation_step_list = :id_sop_step_list
    AND standard_operation.assign_to = :id_employee
    AND MONTH(standard_operation_check_list.done_date) = :current_month
    ")
    ->bindParam(':id_sop_step_list', $id_sop_step_list)
    ->bindParam(':id_employee', $id_employee)
    ->bindParam(':current_month', $current_month)->queryScalar();

$yearly_actual = Yii::$app->db->createCommand("
    SELECT COUNT(standard_operation_check_list.id)
    FROM standard_operation_check_list
    INNER JOIN standard_operation on standard_operation.id = standard_operation_check_list.id_standard_operation
    WHERE standard_operation_check_list.is_done = 1
    AND standard_operation_check_list.id_standard_operation_step_list = :id_sop_step_list
    AND standard_operation.assign_to = :id_employee
    AND YEAR(standard_operation_check_list.done_date) = :current_year
    ")
    ->bindParam(':id_sop_step_list', $id_sop_step_list)
    ->bindParam(':id_employee', $id_employee)
    ->bindParam(':current_year', $current_year)->queryScalar();

$yearly_plan = $model->quarter_1 + $model->quarter_2 + $model->quarter_3 + $model->quarter_4;
?>
<div class="sop-goal-setup-view">
    <div class="row">
        <div class="panel">
            <div class="panel-body">
                <div class="panel">
                    <div class="panel-heading">
                        <h4 class="pad-btm bord-btm"><i class="demo-pli-male-female icon-fw v-middle"></i> Goal Achievement | <?= date('Y') .' | '. $model->sopStepList->name;   ?></h4>
                    </div>
                    <!--Panel body-->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-bordered custom_odd_even">
                                <thead>
                                    <tr>
                                        <th class="text-center">#</th>
                                        <?php 
                                            foreach ($goal_data as $b_data) {
                                                echo "<td class='text-right'>".$b_data['month_name']."</td>";
                                            }
                                        ?>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center">Actual</td>
                                        <?php 
                                            foreach ($goal_data as $b_data) {
                                                echo "<td class='text-right text-semibold'>".$b_data['actual']."</td>";
                                            }
                                        ?>
                                    </tr>
                                    <tr>
                                        <td class="text-center">Goal</td>
                                        <?php 
                                            foreach ($goal_data as $b_data) {
                                                echo "<td class='text-right text-semibold'>".$b_data['monthly']."</td>";
                                            }
                                        ?>
                                    </tr>
                                    <tr>
                                        <td class="text-center">Under/Over</td>
                                        <?php 
                                            foreach ($goal_data as $b_data) {

                                                $result = $b_data['actual'] - $b_data['monthly'];
                                                $text_style = '';
                                                $icon_style = '';
                                                if($result > 0){
                                                    $text_style = 'text-info';
                                                    $icon_style = 'pci-chevron chevron-up pull-left';
                                                }else if($result < 0){
                                                    $text_style = 'text-danger';
                                                    $icon_style = 'pci-chevron chevron-down pull-left';
                                                }

                                                echo "<td class='text-right ".$text_style." text-semibold'><i class='".$icon_style."'></i>".$result."</td>";
                                            }
                                        ?>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
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
                                    <div class="pull-right"><h5 class="text-semibold"><?= $monthly_actual; ?></h5></div>
                                    <h5 class="text-semibold">Actual</h5>
                                </li>
                                <li class="list-group-item">
                                    <div class="pull-right"><h5 class="text-semibold"><?= $monthly_plan; ?></h5></div>
                                    <h5 class="text-semibold">Goal</h5>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <div id="this_month-progressing-pie" class="demo-pie pie-title-center" data-percent="<?= GlobalFunction::calculateProgress($monthly_actual, $monthly_plan).'%'; ?>">
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
                                    <div class="pull-right"><h5 class="text-semibold"><?= $yearly_actual; ?></h5></div>
                                    <h5 class="text-semibold">Actual</h5>
                                </li>
                                <li class="list-group-item">
                                    <div class="pull-right"><h5 class="text-semibold"><?= $yearly_plan; ?></h5></div>
                                    <h5 class="text-semibold">Goal</h5>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <div id="this_year-progressing-pie" class="demo-pie pie-title-center" data-percent="<?= GlobalFunction::calculateProgress($yearly_actual, $yearly_plan).'%'; ?>">
                                <span class="pie-value text-thin text-2x"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr class="new-section-xs">

</div>    

<?php

$script = <<<JS


    $('#this_month-progressing-pie').easyPieChart({
        barColor :'#efb239',
        scaleColor: false,
        trackColor : 'rgba(0,0,0,.1)',
        lineWidth : 10,
        size : 150,
        onStep: function(from, to, percent) {
            $(this.el).find('.pie-value').text(parseFloat(percent).toFixed(2) + '%');
            // $(this.el).find('.pie-value').text(Math.round(percent) + '%');
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