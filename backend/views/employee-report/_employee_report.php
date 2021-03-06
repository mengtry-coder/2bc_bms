<?php

use yii\helpers\Html;
use backend\models\EmployeeProfile;
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

$employee = ArrayHelper::map(\backend\models\EmployeeProfile::find()
    ->all(), 'id', function($model)
    {
        return $model->first_name . ' '.$model->last_name;
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
.field-employeereport-id_customer, .field-employeereport-id_employee,.field-employeereport-status{
    margin-top: 10px;
}
@media print 
    {
        @page {
          size: A4; /* DIN A4 standard, Europe */
          margin:0;
        }
        html, body {
            width: 210mm;
            /* height: 297mm; */
            height: 282mm;
            font-size: 11px;
            background: #FFF;
            overflow:visible;
            color: black !important;
        }
        
        #content-container {
            padding-top: 0px;
        }
    }
#print-content {
    color: black !important;
}
#print-content a[href]:after { display:none; } 
.fullscreen{
    overflow: scroll;
}
</style>
<div class="marital-status-form report">

    <?php $form = ActiveForm::begin([
        'action' => ['report','smMenu'=>1],
        'method' => 'post',
        'id' => 'idEmpReort',
    ]); ?>
    <div class="row no-print">
        <div class="col-md-12">
            <div class="panel panel-body" style="padding: 8px 20px 2px;">
                <div class="row">
                    <div class="col-md-4">
                        <div class="row">
                            <div class="col-md-4">
                                <?= $form->field($model, 'date_range')->dropDownList($date_range, ['prompt'=>'Join Date Range', 'style'=>'margin-top: 10px;'])->label(false) ?>
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
                        <?php
                          $status = [1=>'Active', 2=>"Inactive",3=>'Is Deleted'];
                          ?>
                        <?= $form->field($model, 'status')->widget(Select2::classname(), [
                            'data' => $status,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Status'],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ])->label(false); ?>
                    </div>

                    <div class="col-md-4"> 
                        <div class="text-right" style="padding: 10px;">  
                            <button type="button" id="btn_excel" class="btn btn-info btn-rounded">
                                <i class="fa fa-file-excel-o" style="font-size: large;"></i>
                            </button> 
                            <!-- <button type="button" id="btn_pdf" class="btn btn-danger btn-rounded">
                                <i class="fa fa-file-pdf-o" style="font-size: large;"></i>
                            </button> -->
                            <div hidden="hidden">
                                <?php
                                    $is_print = 0; 
                                ?>
                                <input type="text" name="is_print" id="is_print" hidden="hidden" value = "<?=$is_print?>">
                            </div> 
                            <button type="button" id="btn_print" class="btn btn-warning btn-rounded">
                                <i class="fa fa-print" style="font-size: large;"></i>
                            </button> 
                            <button type="submit" class="btn btn-success btn-rounded" id="btn_search"> Search <i class="fa fa-search go-right"></i>
                            </button>  
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php ActiveForm::end(); ?>

    <div class="row">
        <div class="col-md-2 col-sm-3 no-print">
            <?= $this->render("//employee-report/_employee_report_menu");?>
        </div>
        <div class="col-md-10 col-sm-9">
            <div class="panel">
                <div class="panel-heading panel-eo no-print">
                    <div class="panel-control">
                        <button class="btn btn-default" data-panel="fullscreen">
                            <i class="icon-max demo-psi-maximize-3"></i>
                            <i class="icon-min demo-psi-minimize-3"></i>
                        </button>
                    </div>
                    <h3 class="panel-title" style="font-weight: 500; text-transform: capitalize;"><?=$this->title;?></h3>
                </div>

                <div class="panel-body" id="print-content">
                <!-- <div class="text-2x text-center">Craig's Design and Landscaping Services</div> -->
                <div class="text-2x text-center text-uppercase">Employee Report</div>
                <?php
                if($employeeList == "" || count($employeeList) <= 0){
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
                                <th class="text-center">Employee</th>
                                <th class="text-center">Position</th>
                                <th class="text-center">Department</th>
                                <th class="text-center">Email</th>
                                <th class="text-center">Phone Number</th>
                                <th class="text-center">DOB</th>
                                <th class="text-center">Join Date</th>
                                <th class="text-center">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                          <?php
                              $i = 0;
                              $status_1 = $status_2 = $status_3 = $status_4 = $status_5 = 0;
                              foreach ($employeeList as $n) {
                                $i=$i+1;
                                $id_employee = $n['id'];
                                $employee_name = $n['first_name'] ." ". $n['last_name'];
                                $status = $n['status'];
                                if($status ==1){
                                  $status_1 = $status_1 + 1;
                                }elseif ($status == 2) {
                                  $status_2 = $status_2 + 1;
                                }
                                $id_employee = $n['id'];
                           ?>
                        <tr>
                           <td class="text-center"><?=$i; ?></td>
                           <td class="text-center"><?=$employee_name; ?></td>
                           <td class="text-center">
                             <?=\backend\models\EmployeePosition::findOne($n['id_position'])->position_type;?>
                           </td>
                           <td class="text-center">

                             <?php
                             $id_department = \backend\models\EmployeePosition::findOne($n['id_position'])->id_department;
                             echo \backend\models\Department::findOne($id_department)->name;?>
                           </td>
                           <td class="text-center"><?=$n['email']; ?></td>
                           <td class="text-center"><?=$n['phone_number']; ?></td>
                           <td class="text-center"><?=$n['date_of_birth']; ?></td>
                           <td class="text-center"><?=$n['join_date']; ?></td>
                           <td class="text-center">
                             <?=$n['status'] = 1 ? "Active" : "Inactive";  ?>
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
                        </tr>
                        </tr>
                        <tr>
                          <td class="text-center">Active: </td>
                          <td class="text-center"><strong><?=$status_1; ?></strong></td>
                        </tr>
                        <tr>
                          <td class="text-center">Inactive: </td>
                          <td class="text-center"><strong><?=$status_2; ?></strong></td>
                        </tr>
                        <tr style="background: #f87231bd;color: #fff;font-weight: bold;">
                          <td class="text-center">Total: </td>
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
    // start check submit type
    $('#btn_search').on('click',function(){
        $('input[name=is_print]').val(1);
        $('#idEmpReort').submit();
        return false;
    });

    $('#btn_excel').on('click',function(){
        $('input[name=is_print]').val(2);
        $('#idEmpReort').submit(); 
        return false;  
    });

    $('#btn_pdf').on('click',function(){
        $('input[name=is_print]').val(3);
        $('#idEmpReort').submit();
        return false;
    });
    // end check submit type
    $('#btn_print').click(function(){
        window.print();
    });
JS;

$this->registerJs($script);

?>
