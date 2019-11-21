<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

$leave_status = ArrayHelper::map(\backend\models\LeaveStatus::find()
    ->all(), 'id', function($model){return $model->approve_status_name;});
$employee_list = ArrayHelper::map(\backend\models\EmployeeProfile::find()
->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;});

$date_range = ['today' => 'Today', 'week' => 'This Week', 'month'=> 'This Month', 'year'=>'This Year', 'custom'=>'Custom'];

$date_type = ['start_date' => 'Start Date', 'due_date' => 'Due Date', 'deadline'=> 'Deadline', 'created_date'=>'Created Date'];

$search_content = "Supplier Name, Company Name, Phone Number, Email";

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

$date_template = '{label}</br><div class="input-group" style="margin-top: -7px;">
            <span class="input-group-addon"><i class="demo-pli-calendar-4"></i></span> {input} </div>{error}{hint}';

?>
<style type="text/css">
    .select2-container { 
        z-index: 1;
    }
</style>
<div class="leave-application-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?> 
    <div class="row">
        <div class="col-md-9">
            <div class="row">
                <div class="col-md-2">
                    <?= $form->field($model, 'date_range')->dropDownList($date_range, ['prompt'=>'Select Range', 'style'=>'margin-top: 10px;'])->label(false) ?>
                </div>
                <div class="col-md-5">
                    <div class="row">
                        <div class="col-md-6">
                            <?= $form->field($model, 'start_date', ['template'=>$date_template])->textInput(['class'=>'form-control pull-right', 'style'=>'background: #fff;', 'placeholder'=>'From Date', 'readonly'=>true])->label(false) ?>
                        </div>
                        <div class="col-md-6">
                            <?= $form->field($model, 'end_date', ['template'=>$date_template])->textInput(['class'=>'form-control pull-right', 'style'=>'background: #fff;', 'placeholder'=>'To Date', 'readonly'=>true])->label(false) ?>
                        </div>
                    </div>
                </div> 
                <div class="col-md-3" style="margin-top: 10px;">
                    <?= $form->field($model, 'id_employee')->widget(Select2::classname(), [
                            'data' => $employee_list,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Select Employee'],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ])->label(false);
                    ?>
                </div>
                <div class="col-md-2" style="margin-top: 10px;">
                    <?php 
                        echo $form->field($model, 'id_leave_status')->widget(Select2::classname(), [
                            'data' => $leave_status,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Status'],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ])->label(false); 
                    ?> 
                </div>
            </div> 
        </div>
        <div class="col-md-3" style="margin-top:10px;">
            <div class="pull-right">
                <button class="btn btn-success btn-rounded" style="margin-left: 5px;">
                    Search <i class="fa fa-search go-right"></i>
                </button>
                <button type="button" data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['leave-application/create']) ?>">                            Add New <i class="fa fa-plus-square go-right"></i>
                </button>
            </div>
        </div>
    </div> 

    <?php ActiveForm::end(); ?>

</div>
<?php

$script = <<<JS

    $('#leaveapplicationsearch-start_date, #leaveapplicationsearch-end_date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
    });

    $("#leaveapplicationsearch-start_date").change(function(){

        $('#leaveapplicationsearch-end_date').datepicker('setStartDate', $(this).val());

        if(Date.parse($(this).val()) > Date.parse($('#leaveapplicationsearch-end_date').val())){
            $('#leaveapplicationsearch-end_date').datepicker('setDate', $(this).val());
        }

    });

    $("#leaveapplicationsearch-start_date,#leaveapplicationsearch-end_date").change(function(){
        $('#leaveapplicationsearch-date_range').val('custom').trigger('change');
    });

    $("#leaveapplicationsearch-date_range").change(function(){
        var name = $(this).val();

        if(name == 'today'){
            $("#leaveapplicationsearch-start_date").val("$today");
            $("#leaveapplicationsearch-end_date").val("$today");
        }else if(name == 'week'){
            $("#leaveapplicationsearch-start_date").val("$week_start");
            $("#leaveapplicationsearch-end_date").val("$week_end");
        }else if(name == 'month'){
            $("#leaveapplicationsearch-start_date").val("$month_start");
            $("#leaveapplicationsearch-end_date").val("$month_end");
        }else if(name == 'year'){
            $("#leaveapplicationsearch-start_date").val("$year_start");
            $("#leaveapplicationsearch-end_date").val("$year_end");
        }
    });

    $('.popover_content').popover();

JS;

$this->registerJs($script);

?>