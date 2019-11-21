<?php

use yii\helpers\Html;
use backend\models\EmployeeProfile;
use backend\models\TaskRelatedTo;
use backend\models\Custom;

use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use yii\helpers\Url;

$userid  = Yii::$app->user->getId();
$command = Yii::$app->db->createCommand("select * from user where id = $userid");
$userData = $command->queryOne();

$controllerName = Yii::$app->controller->id;
$actionName = Yii::$app->controller->action->id;
$string = str_replace("-", " ", $actionName);
$this->title = 'Employee'." ".$string;
$this->params['breadcrumbs'][] = $this->title;

$date_range = ['today' => 'Today', 'week' => 'This Week', 'month'=> 'This Month', 'year'=>'This Year', 'custom'=>'Custom'];

$today = date('Y-m-d');

$monday = strtotime("last monday");
$monday = date('w', $monday)==date('w') ? $monday+7*86400 : $monday;
$sunday = strtotime(date("Y-m-d",$monday)." +6 days");
$week_start = date("Y-m-d",$monday);
$week_end = date("Y-m-d",$sunday);

$day = date('Y-m-d');
$month_start = date('Y-m-01');
$month_end = date("Y-m-t", strtotime($day));

$year_start = date('Y-m-d', strtotime('01/01'));
$year_end = date('Y-m-d', strtotime('12/31'));
$customer = ArrayHelper::map(\backend\models\CustomerProfile::find()
    ->all(), 'id', function($model)
    {
        return $model->customer_name . ' ('.$model->company_name . ')';
    });

$employee = ArrayHelper::map(\backend\models\EmployeeProfile::find()
    ->all(), 'id', function($model)
    {
        return $model->first_name . ' '.$model->last_name;
    });
$taskRelate = ArrayHelper::map(\backend\models\TaskRelatedTo::find()
    ->all(), 'id', function($model)
    {
        return $model->name;
    });
$taskStatus = ArrayHelper::map(\backend\models\taskStatus::find()
    ->all(), 'id', function($model)
    {
        return $model->name;
    });

?>
<style>
.panel-eo {
    border-color: #f87232;
}
.breadcrumb>.active{
    text-transform: capitalize;
}
#id-employee-container{
    margin-top: 10px;
}
.field-employeereport-id_related_to, .field-employeereport-id_employee, .field-employeereport-status{
    margin-top: 10px;
}
.fullscreen{
    overflow: scroll;
}
</style>
<div class="marital-status-form report">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-body" style="padding: 8px 20px 2px;">
                <div class="row">
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-4">
                                <?= $form->field($model, 'date_range')->dropDownList($date_range, ['prompt'=>'Select Range', 'style'=>'margin-top: 10px;'])->label(false) ?>
                            </div>
                            <div class="col-md-4">
                                <?= $form->field($model, 'from_date')->textInput(['class'=>'form-control pull-right', 'style'=>'background: #fff;', 'placeholder'=>'From Date*', 'readonly'=>true])->label(false) ?>
                            </div>
                            <div class="col-md-4">
                                <?= $form->field($model, 'to_date')->textInput(['class'=>'form-control pull-right', 'style'=>'background: #fff;', 'placeholder'=>'To Date*', 'readonly'=>true])->label(false) ?>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-2">
                        <?= $form->field($model, 'id_employee')->widget(Select2::classname(), [
                            'data' => $employee,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Employee'],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ])->label(false); ?>
                    </div>

                    <div class="col-md-2">
                        <?= $form->field($model, 'id_related_to')->widget(Select2::classname(), [
                            'data' => $taskRelate,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Related To'],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ])->label(false); ?>
                    </div>
                    <div class="col-md-2">
                        <?= $form->field($model, 'status')->widget(Select2::classname(), [
                            'data' => $taskStatus,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Status'],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ])->label(false); ?>
                    </div>

                    <div class="col-md-1">
                        <div class="text-right" style="padding: 10px;">
                            <?= Html::submitButton('Search', ['class' => 'btn btn-success btn-rounded']) ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php ActiveForm::end(); ?>

    <div class="row">
        <div class="col-md-2 col-sm-3">
            <?= $this->render("//employee-report/_employee_report_menu");?>
        </div>
        <div class="col-md-10 col-sm-9">
            <div class="panel">
                <div class="panel-heading panel-eo">
                    <div class="panel-control">
                        <button class="btn btn-default" data-panel="fullscreen">
                            <i class="icon-max demo-psi-maximize-3"></i>
                            <i class="icon-min demo-psi-minimize-3"></i>
                        </button>
                    </div>
                    <h3 class="panel-title" style="font-weight: 500; text-transform: capitalize;"><?=$this->title;?></h3>
                </div>

                <div class="panel-body">
                <!-- <div class="text-2x text-center">Craig's Design and Landscaping Services</div> -->
                <div class="text-2x text-center text-uppercase">Employee Tasks Report</div>
                <?php
                if($taskList == "" || count($taskList) <= 0){
                     if($model->from_date !=""){
                         echo '<div class="text-lg text-center">From '.$model->from_date.' To '.$model->to_date.'</div>';
                         echo "<br><div class='text-lg text-center' style='color: #f87233;'>This report does not contain any data.</div>";
                     }else{
                         echo "<br><div class='text-lg text-center text-info'>Please, Complete <span class='text-danger'>required*</span> field(s) to search.</div>";
                     }

                 }else{

                 ?>
                 <div class="text-lg text-center">From <?= $model->from_date;?> To <?= $model->to_date;?></div>
                <br>
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <th class="text-center">#</th>
                                <th>Task Name</th>
                                <th>Related To</th>
                                <th>Relate detail</th>
                                <th>Assign To</th>
                                <th class="text-center">Start Date</th>
                                <th class="text-center">Due Date</th>
                                <th class="text-center">Deadline</th>
                                <th class="text-center">Repeat every </th>
                                <th>Priority</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                          <?php

                              $i = 0;
                              $status_1 = $status_2 = $status_3 = $status_4 = $status_5 = 0;
                              foreach ($taskList as $n) {
                                $i = $i + 1;
                                $id_task = $n['id'];
                                $status = $n['status'];
                                if($status ==1){
                                  $status_1 = $status_1 + 1;
                                }elseif ($status == 2) {
                                  $status_2 = $status_2 + 1;
                                }elseif ($status == 3) {
                                  $status_3 = $status_3 + 1;
                                }elseif ($status == 4) {
                                  $status_4 = $status_4 + 1;
                                }elseif ($status == 5) {
                                  $status_5 = $status_5 + 1;
                                }elseif ($status == 6) {
                                  $status_6 = $status_6 + 1;
                                }elseif ($status == 7) {
                                  $status_7 = $status_7 + 1;
                                }elseif ($status == 8) {
                                  $status_8 = $status_8 + 1;
                                }else{
                                  $status_9 = $status_9 + 1;
                                }

                           ?>
                        <tr>
                           <td class="text-center"><?=$i; ?></td>
                           <td class="text-center"><?=$n['task_name']; ?></td>
                           <td class="text-center">
                             <?=\backend\models\TaskRelatedTo::findOne($n['id_related_to'])->name;?>
                           </td>
                           <td class="text-center">
                             <?php
                                  if ($n['id_related_to'] == 1) {
                                    echo \backend\models\Project::findOne($n['id_related_profile'])->project_name;
                                  }
                              ?>
                           </td>
                           <td >
                             <?php
                                  if ($model->id_employee == "") {
                                    $mysql = "select CONCAT(a.first_name,' ', a.last_name ) as name
                                    from employee_profile a left join task_member b on a.id = b.id_employee where b.id_task = $id_task;";
                                    $task_member = Yii::$app->db->createCommand("
                                    $mysql
                                    ")->queryAll();
                                  }else{
                                    $task_member = Yii::$app->db->createCommand("
                                    select CONCAT(a.first_name,' ', a.last_name) as name
                                    from employee_profile a where a.id = $model->id_employee;
                                    ")->queryAll();
                                  }
                                  foreach ($task_member as $m) {
                                    echo $m['name'].",<br/>";
                                  }
                              ?>
                           </td>
                           <td class="text-center"><?=$n['start_date']; ?></td>
                           <td class="text-center"><?=$n['due_date']; ?></td>
                           <td class="text-center"><?=$n['deadline']; ?></td>

                           <td class="text-center"><?php
                           echo \backend\models\RepeaterType::findOne($n['id_repeater'])->name;?>
                           </td>
                           <td>
                             <?=\backend\models\Priority::findOne($n['id_priority'])->name;?>
                           </td>
                           <td>
                             <?=\backend\models\TaskStatus::findOne($n['status'])->name;?>
                           </td>
                        </tr>
                      <?php };?>

                        </tbody>
                    </table>
                    <hr/>
                    <div class="row">
                      <div class="col-md-6"></div>
                    <div class="col-md-6">
                      <div class="text-2x text-center text-uppercase" style="background: #7a878e;color: #fff;">Report Summary</div><br/>

                      <table class="table table-condensed">
                        <tr style="background: #f3f3f3;">
                          <th class="text-center">Title</th>
                          <th class="text-center">Description</th>
                          <th class="text-center">Title</th>
                          <th class="text-center">Description</th>
                        </tr>
                        </tr>
                        <tr>
                          <td class="text-center">None: </td>
                          <td class="text-center"><strong><?=$status_1; ?></strong></td>
                          <td class="text-center">Day: </td>
                          <td class="text-center"><strong><?=$status_2; ?></strong></td>
                        </tr>
                        <tr>
                          <td class="text-center">Week: </td>
                          <td class="text-center"><strong><?=$status_3; ?></strong></td>
                          <td class="text-center">Month: </td>
                          <td class="text-center"><strong><?=$status_4; ?></strong></td>
                        </tr>
                        <tr>
                          <td class="text-center">2 Weeks: </td>
                          <td class="text-center"><strong><?=$status_5; ?></strong></td>
                          <td class="text-center">1 Month: </td>
                          <td class="text-center"><strong><?=$status_5; ?></strong></td>
                        </tr>
                        <tr>
                          <td class="text-center">2 Months: </td>
                          <td class="text-center"><strong><?=$status_5; ?></strong></td>
                          <td class="text-center">3 Months: </td>
                          <td class="text-center"><strong><?=$status_5; ?></strong></td>
                        </tr>
                        <tr>
                          <td class="text-center">6 Months: </td>
                          <td class="text-center"><strong><?=$status_5; ?></strong></td>
                          <td class="text-center">2 Years: </td>
                          <td class="text-center"><strong><?=$status_5; ?></strong></td>
                        </tr>
                        <tr style="background: #f87231bd;color: #fff;font-weight: bold;">
                          <td class="text-right"  colspan="3">Task Total: </td>
                          <td class="text-center"><strong><?=$i; ?></strong></td>
                        </tr>
                      </table>
                    </div>

                  </div>
                  <?php
                  $timezone = date("D M j Y G:i:s");
                  echo "<div class='text-sm text-left'>".$userData['first_name']." ".$userData['last_name'].", ". $timezone."</div>";
                  }?>

                </div>
            </div>
        </div>
    </div>
</div>

<?php
$script = <<<JS

    $('#employeereport-from_date, #employeereport-to_date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
    });

    $("#employeereport-from_date").change(function(){

        $('#employeereport-to_date').datepicker('setStartDate', $(this).val());

        if(Date.parse($(this).val()) > Date.parse($('#employeereport-to_date').val())){
            $('#employeereport-to_date').datepicker('setDate', $(this).val());
        }

    });

    $("#employeereport-from_date,#employeereport-to_date").change(function(){
        $('#employeereport-date_range').val('custom').trigger('change');
    });

    $("#employeereport-date_range").change(function(){
        var name = $(this).val();

        if(name == 'today'){
            $("#employeereport-from_date").val("$today");
            $("#employeereport-to_date").val("$today");
        }else if(name == 'week'){
            $("#employeereport-from_date").val("$week_start");
            $("#employeereport-to_date").val("$week_end");
        }else if(name == 'month'){
            $("#employeereport-from_date").val("$month_start");
            $("#employeereport-to_date").val("$month_end");
        }else if(name == 'year'){
            $("#employeereport-from_date").val("$year_start");
            $("#employeereport-to_date").val("$year_end");
        }
    });

    $('.popover_content').popover();

JS;

$this->registerJs($script);

?>
