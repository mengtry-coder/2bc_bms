<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

$base_url = Yii::getAlias('@web'); 

$department = ArrayHelper::map(\backend\models\Department::find()
    ->all(), 'id', 'name');

$position = ArrayHelper::map(\backend\models\EmployeePosition::find()
    ->where(['id_department' => $model->department])
    ->all(), 'id', 'position_type');

$request = Yii::$app->request;
$id_employee_profile = $request->get('id_employee_profile',0);
$id_customer_profile = $request->get('id_customer_profile',0);
$id_lead_profile = $request->get('id_lead_profile',0);
$id_contract = $request->get('id_contract',0);
if($id_employee_profile !=0 || $id_customer_profile !=0 || $id_contract !=0 || $id_lead_profile !=0){
    $smMenu = 1;
}else{
    $smMenu = 0;
}

$date_range = ['today' => 'Today', 'week' => 'This Week', 'month'=> 'This Month', 'year'=>'This Year', 'custom'=>'Custom'];

$date_type = ['start_date' => 'Start Date', 'due_date' => 'Due Date', 'deadline'=> 'Deadline', 'created_date'=>'Created Date'];

$search_content = "Task Name";

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
<style>
    /*Search Form Button*/
button:focus {
    box-shadow: none !important;
    outline: none !important;
}
.search-button{
    display: block;
    width: 95px;
    padding: 4px;
    border: 1px solid #333;
    border-radius: 2px;
}
.button-hover-search{
    background: #337ab7;
    border: 1px solid #337ab7;
    color: #fff;
    display: inline-block;
}
.button-hover-add_new{
    background: #ef6200;
    border: 1px solid #ef6200;
    color: #fff;
    display: inline-block;
}
.button-hover-search:hover{
    background: #3c6d98;
    border: 1px solid #3c6d98;
    color: #fff;
}
.button-hover-add_new:hover{
    background: #f17f2f;
    border: 1px solid #f17f2f;
    color: #fff;
}
.search-button .search-main-button{
    background: transparent;
    padding: 5px;
    color: #333;
    border: 1px solid;
    cursor: pointer;
    font-size: 13px;
    border-radius: 0px 5px 0px 0px;
    width: 100% !important;
}
.search-button .fa {
    font-size: 1em;
    line-height: 20px;
}

/*End Search Form Button*/
</style>
<div class="task-search">
    <?php $form = ActiveForm::begin([
        'action' => ['index','id_employee_profile'=>$id_employee_profile,'id_customer_profile'=>$id_customer_profile,'id_lead_profile'=>$id_lead_profile,'id_contract'=>$id_contract,'smMenu'=>$smMenu],
        'method' => 'get',
    ]); ?>

    <div class="row">
        <div class="col-md-8">
            <div class="row">
            <div class="col-md-2">
                    <?= $form->field($model, 'date_type')->dropDownList($date_type, ['prompt'=>'Select Type', 'style'=>'margin-top: 10px;'])->label(false) ?>
                </div>
                <div class="col-md-2">
                    <?= $form->field($model, 'date_range')->dropDownList($date_range, ['prompt'=>'Select Range', 'style'=>'margin-top: 10px;'])->label(false) ?>
                </div>
                <div class="col-md-5">
                    <div class="row">
                        <div class="col-md-6">
                            <?= $form->field($model, 'from_date', ['template'=>$date_template])->textInput(['class'=>'form-control pull-right', 'style'=>'background: #fff;', 'placeholder'=>'From Date', 'readonly'=>true])->label(false) ?>
                        </div>
                        <div class="col-md-6">
                            <?= $form->field($model, 'to_date', ['template'=>$date_template])->textInput(['class'=>'form-control pull-right', 'style'=>'background: #fff;', 'placeholder'=>'To Date', 'readonly'=>true])->label(false) ?>
                        </div>
                    </div>
                </div> 
                <div class="col-md-3">
                    <?= $form->field($model, 'globalSearch')->textInput(['class'=>'form-control pull-right popover_content',  "data-html"=>true, "data-original-title"=>"Filter likes:", 'data-content'=>$search_content, "data-placement"=>"bottom", "data-trigger"=>"hover", 'style'=>'margin-top: -1px;', 'placeholder'=>'Search...'])->label(false) ?>
                </div>
            </div> 
        </div>
        <div class="col-md-4" style="margin-top: 10px;">
            <div class="pull-right">
                <button class="btn btn-success btn-rounded" style="margin-left: 5px;">
                    Search <i class="fa fa-search go-right"></i>
                </button>
                <button class="btn btn-mint btn-rounded" style="margin-left: 5px;" id="switch_to_milestone">
                Switch to milestone
                <i class="fa fa-history go-right"></i>
                </button> 
                <button type="button" data-title="New Task" data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['create', 'source_id'=>0,'type'=>0]) ?>"> Add New <i class="fa fa-plus-square go-right"></i>
                </button> 
            </div>
        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<?php 

$base_url = Yii::getAlias('@web'); 

$script = <<<JS

$('#tasksearch-from_date, #tasksearch-to_date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
    });

    $("#tasksearch-from_date").change(function(){

        $('#tasksearch-to_date').datepicker('setStartDate', $(this).val());

        if(Date.parse($(this).val()) > Date.parse($('#tasksearch-to_date').val())){
            $('#tasksearch-to_date').datepicker('setDate', $(this).val());
        }

    });

    $("#tasksearch-from_date,#tasksearch-to_date").change(function(){
        $('#tasksearch-date_range').val('custom').trigger('change');
    });

    $("#tasksearch-date_range").change(function(){
        var name = $(this).val();

        if(name == 'today'){
            $("#tasksearch-from_date").val("$today");
            $("#tasksearch-to_date").val("$today");
        }else if(name == 'week'){
            $("#tasksearch-from_date").val("$week_start");
            $("#tasksearch-to_date").val("$week_end");
        }else if(name == 'month'){
            $("#tasksearch-from_date").val("$month_start");
            $("#tasksearch-to_date").val("$month_end");
        }else if(name == 'year'){
            $("#tasksearch-from_date").val("$year_start");
            $("#tasksearch-to_date").val("$year_end");
        }
    });

    $('.popover_content').popover();

    var base_url = "$base_url";

    $("#tasksearch-department").change(function(){
        var id = $(this).val();

        $.ajax({
            url: base_url+'/task/dependent',
            type: 'post',
            data: {
                id: id,
                action: 'get_position'
            },
            success: function(response){
                var data = JSON.parse(response);

                var str = "<option>Select Position</option>";
                $.each(data,function(key,value){
                    str = str + '<option value="'+value.id+'">'+value.position_type+'</option>';
                });
                $('#tasksearch-position').html(str);
            }
        });

    });

JS;

$this->registerJs($script);
?>