<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

$base_url = Yii::getAlias('@web'); 
$user_position = Yii::$app->user->identity->id_position;
$user_id = Yii::$app->user->identity->id_employee; 

$position = ArrayHelper::map(\backend\models\EmployeePosition::find()
    ->where(['status' => 1]) 
    ->all(), 'id', 'position_type');

$billing_type = ArrayHelper::map(\backend\models\BillingType::find()
    ->all(), 'id', 'name'); 

$repeater = ArrayHelper::map(\backend\models\RepeaterType::find()
    ->all(), 'id', 'name'); 

$status = ArrayHelper::map(\backend\models\TaskStatus::find()
    ->all(), 'id', 'name'); 

$priority = ArrayHelper::map(\backend\models\Priority::find()
    ->all(), 'id', 'name'); 

$related_to = ArrayHelper::map(\backend\models\TaskRelatedTo::find()
    ->all(), 'id', 'name');  

$employee_list = ArrayHelper::map(\backend\models\EmployeeProfile::find()
    ->where(['status' => 1]) 
    // ->andWhere(['id_position' => 1])
    ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;}); 

$date_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="demo-pli-calendar-4"></i></span> {input} </div>{error}{hint}';

$dollar_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="fa fa-dollar"></i></span> {input} </div>{error}{hint}';

$time_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="demo-pli-clock"></i></span> {input} </div>{error}{hint}';

$related_to_profile = [];
$response = [];
if($model->id_related_to == 1){ //Project
    $response = Yii::$app->db->createCommand("
        SELECT id, project_name as profile_name
        FROM project
    ")->queryAll();
} else if($model->id_related_to == 2){ //Invoice
    $response = Yii::$app->db->createCommand("
        SELECT a.id, CONCAT(b.customer_name, ' (', b.company_name,')') as profile_name
        FROM customer_invoice as a
        INNER JOIN customer_profile as b on a.id_customer = b.id
    ")->queryAll();
} else if($model->id_related_to == 3){ //Customer
    $response = Yii::$app->db->createCommand("
        SELECT id, CONCAT(customer_name, ' (', company_name,')') as profile_name
        FROM customer_profile
    ")->queryAll();
    // $related_to_profile = ArrayHelper::map($response, 'id', 'profile_name'); 
} else if($model->id_related_to == 4){ //Expense
    $response = Yii::$app->db->createCommand("
        SELECT id, 
            (CASE
                WHEN id_related_to = 1 THEN (SELECT CONCAT(supplier_name, ' (', company_name,')') FROM supplier_profile WHERE id = id_related_profile)
                WHEN id_related_to = 2 THEN (SELECT CONCAT(customer_name, ' (', company_name,')') FROM customer_profile WHERE id = id_related_profile)
                WHEN id_related_to = 3 THEN (SELECT project_name FROM project WHERE id = id_related_profile)
            END) as profile_name
        FROM expense
    ")->queryAll();
} else if($model->id_related_to == 5){ //Contract
    $response = Yii::$app->db->createCommand("
        SELECT id, subject as profile_name
        FROM contract
    ")->queryAll();
} else if($model->id_related_to == 6){ //Lead
    $response = Yii::$app->db->createCommand("
        SELECT id, CONCAT(lead_name, ' (', company_name,')') as profile_name
        FROM lead_profile
        WHERE customer_status <> 6 
    ")->queryAll();
} else if($model->id_related_to == 7){ //Proposal
    $response = Yii::$app->db->createCommand("
        SELECT id, name as profile_name
        FROM proposal
    ")->queryAll();

}else if($model->id_related_to == 8){ //Other activity
    $response = Yii::$app->db->createCommand("
        SELECT '8' as id, 'Other activity' as profile_name
        FROM proposal
    ")->queryAll();
}
$related_to_profile = ArrayHelper::map($response, 'id', 'profile_name'); 

if($model->isNewRecord){
    if($type == 1){
        $response = Yii::$app->db->createCommand("
            SELECT id, project_name as profile_name
            FROM project
        ")->queryAll();
        $related_to_profile = ArrayHelper::map($response, 'id', 'profile_name'); 
    }else{
        $related_to_profile = [];
    }
}

if(Yii::$app->user->identity->id != 1){
    $employee_list = ArrayHelper::map(\backend\models\EmployeeProfile::find()->where(['id' => $user_id])
    ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;}); 
    $sopStep = ArrayHelper::map(\backend\models\StandardOperationStep::find()
    ->where(['status'=>1])
    ->andWhere(['id_employee_position'=>$user_position])
    ->all(), 'id', 'name');
}else{
    $employee_list = ArrayHelper::map(\backend\models\EmployeeProfile::find()
        ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;}); 
    $sopStep = [];
}

?>
<style type="text/css">
    .row_line {
        padding-bottom: 15px;
    }
    .select2-container--open {
        z-index: 9999999 !important;
    }
</style>
<div class="task-form">

    <?php 

    $validationUrl = ['task/validation'];
    if (!$model->isNewRecord){
        $validationUrl['id'] = $model->id;
    }

    $form = ActiveForm::begin([
        'id' => $model->formName(),
        'enableAjaxValidation' => false,
        'enableClientValidation' => true,
        'options' => ['autocomplete' => 'off'],
        'validationUrl' => $validationUrl
    ]); 
    ?>
    <div class="row"> 
        <div class="col-md-4"> 
            <div class="panel panel-bordered panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">Task Overview</h3>
                </div>
                <div class="panel-body" style="margin-bottom: -20px;">

                    <div class="row"> 
                        <div class="col-md-12">
                            <?= $form->field($model, 'task_name')->textInput(['maxlength' => true]) ?>
                        </div>
                    </div>

                    <div class="row"> 
                        <div class="col-md-6"> 
                            <?= $form->field($model, 'id_related_to')->widget(Select2::classname(), [
                                    'data' => $related_to,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg',
                                    'options' => ['placeholder' => 'Select'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ]);
                            ?>  
                        </div>
                        <div class="col-md-6">
                            <?= $form->field($model, 'id_related_profile')->widget(Select2::classname(), [
                                    'data' => $related_to_profile,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg',
                                    'options' => ['placeholder' => 'Select'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ]);
                            ?>  
                        </div>
                    </div>

                    <div class="row hide">
                        <div class="col-md-6">
                            <?= $form->field($model, 'id_billing_type')->widget(Select2::classname(), [
                                    'data' => $billing_type,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg',
                                    'options' => ['placeholder' => 'Select'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ]);
                            ?>  
                        </div>
                        <div class="col-md-6">
                            <?= $form->field($model, 'rate', ['template'=>$dollar_template])->textInput(['type' => 'number']) ?>
                        </div>
                    </div>  

                    <div class="row">
                        
                        <div class="col-md-6">
                            <?= $form->field($model, 'id_priority')->widget(Select2::classname(), [
                                    'data' => $priority,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg',
                                    'options' => ['placeholder' => 'Select'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ]);
                            ?>
                        </div> 
                        <div class="col-md-6">
                            <?= $form->field($model, 'status')->widget(Select2::classname(), [
                                    'data' => $status,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg',
                                    'options' => ['placeholder' => 'Select'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ]);
                            ?>  
                        </div>  
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <?= $form->field($model, 'id_employee_position')->widget(Select2::classname(), [
                                    'data' => $position,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg',
                                    'options' => ['placeholder' => 'Select'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ]);
                            ?> 
                        </div>
                        <div class="col-md-6"> 
                            <label>Is Related K.P.I</label>
                            <div class="input-group">
                                <div class="input-group-addon"> 
                                    <input class="magic-checkbox is_related_kpi" <?= $model->is_related_kpi == 1 ?"checked":'' ?> value="1" name="is_related_kpi[]" type="checkbox" data-id="1" id="is_related_kpi" <?= $model->isNewrecord ? "" : "disabled" ?> >
                                    <label for="is_related_kpi" class="is_related_kpi" data-id="1"></label>
                                    <input type="hidden" name="is_related_kpis[]" value="<?= $model->is_related_kpi ?>" data-id="1" id="is_related_kpis">
                                </div>
                                <input type="text" name="kpi_status" placeholder="<?= $model->is_related_kpi == 1 ?"Related K.P.I": "Not Related K.P.I"?>" value="" class="form-control kpi_status" data-id="1" id="kpi_status_1" readonly/>
                            </div>
                        </div> 
                    </div> 
                    <div class="row class_kpi_status">
                        <div class="col-md-12">
                            <?= $form->field($model, 'kpi_status')->widget(Select2::classname(), [
                                    'data' => $sopStep,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg',
                                    'options' => ['placeholder' => 'Select'],
                                    'pluginOptions' => [
                                        'allowClear' => false
                                    ],
                                ]);
                            ?> 
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <?php 
                                if(!$model->isNewRecord){
                                    $member_arr = \backend\models\TaskMember::find()
                                        ->select('id_employee')
                                        ->where(['id_task'=>$model->id])
                                        ->asArray()
                                        ->all();
                                    $row = [];
                                    if(!empty($member_arr)){
                                        foreach($member_arr as $d){
                                            $row[]=$d['id_employee'];
                                        }
                                    }
                                }else{
                                    $row = [];
                                }
                                     
                            ?>
                            <label>Assign To</label>
                            <?= Select2::widget([
                                    'name' => 'assign_to[]',
                                    'data' => $employee_list,
                                    'value'=>$row,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg',
                                    'options' => ['placeholder' => ' Assign To', 'multiple' => true, 'id'=>'id_assign_to'],
                                    'pluginOptions' => [
                                        'allowClear' => false
                                    ],
                                ]);
                            ?>
                            <div class="line15"></div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-12">
                            <?php 
                                if(!$model->isNewRecord){
                                    $tag_arr = \backend\models\TaskTag::find()
                                        ->select('id_tag')
                                        ->where(['id_task'=>$model->id])
                                        ->asArray()
                                        ->all();
                                    $row_tag = [];
                                    if(!empty($tag_arr)){
                                        foreach($tag_arr as $d){
                                            $row_tag[]=$d['id_tag'];
                                        }
                                    }
                                }else{
                                    $row_tag = [];
                                }
                                     
                            ?>
                            <label>Tag</label>
                            <?= Select2::widget([
                                    'name' => 'tag[]',
                                    'value'=>$row_tag,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg',
                                    'options' => ['placeholder' => 'Select', 'multiple' => true, 'id'=>'task_tag'],
                                    'pluginOptions' => [
                                        'tags' => true,
                                        'tokenSeparators' => [',', ' '],
                                        'maximumInputLength' => 20,
                                        'allowClear' => true
                                    ],
                                ]);
                            ?>  
                            <div class="line15"></div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <?= $form->field($model, 'start_date', ['template'=>$date_template])->textInput(['readonly' => true, 'style'=>'background: #fff !important;']) ?>
                        </div>
                        <div class="col-md-4">
                            <?= $form->field($model, 'due_date', ['template'=>$date_template])->textInput(['readonly' => true, 'style'=>'background: #fff !important;']) ?>
                        </div>
                        <div class="col-md-4"> 
                            <?= $form->field($model, 'deadline', ['template'=>$date_template])->textInput(['readonly' => true, 'style'=>'background: #fff !important;']) ?> 
                        </div>
                    </div>

                    <div class="row <?= $model->isNewRecord?'':'hide' ?>">
                        <div class="col-md-12">
                            <?php $model->isNewRecord ? $model->id_assign_type = 1: $model->id_assign_type = $model->id_assign_type;?>
                            <?php if ($model->id_assign_type != 1) { $model->id_assign_type = 0;} ?>
                            <?= $form->field($model, 'id_assign_type')->radioList([1 => 'Individual', 0 => 'Group'])->label('Assign Type'); ?>  
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="panel panel-bordered panel-mint taskWrap">
                <div class="panel-heading">
                    <div class="panel-control">
                        <button type="button" class="btn btn-icon btn-sm btn-circle btn-primary action_button" id="add_more"><i class="fa fa-plus"></i></button>
                    </div>
                    <h3 class="panel-title">Check List</h3>
                </div>
                <div class="panel-body" style="margin-bottom: -20px;">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="progress progress-lg">
                                <div style="width: 0%;" id="check_list_progress" class="progress-bar progress-bar-info">0%</div>
                            </div>
                            <input type="hidden" name="task_progress">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="calculate_item">
                                <?php 
                                    if(!empty($model_item)){
                                    $i = 0;
                                    foreach ($model_item as $key => $value) {
                                        $i++;
                                ?>
                                <div class="row row_line" data-id="<?= $i ?>" id="row_line_<?= $i ?>">
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <input class="magic-checkbox checklist_box" <?= $value->status == 1 ?"checked":'' ?> value="1" name="checklist_box[]" type="checkbox" data-id="<?= $i ?>" id="checkbox_list_<?= $i ?>">
                                                <label for="checkbox_list_<?= $i ?>" class="checklist_box" data-id="<?= $i ?>"></label>
                                                <input type="hidden" name="check_list_status[]" value="<?= $value->status ?>" data-id="<?= $i ?>" id="check_list_status_<?= $i ?>">
                                            </div>
                                            <input type="text" name="description[]" placeholder="Description…" value="<?= $value->description ?>" class="form-control description" data-id="<?= $i ?>" id="description_<?= $i ?>" required/>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div id="demo-dp-range">
                                            <div class="input-daterange input-group timepicker">
                                                <input type="text" class="form-control start_time" value="<?= $value->from_time ?>" name="start_time[]" id="start_time_<?= $i ?>" />
                                                <span class="input-group-addon">to</span>
                                                <input type="text" class="form-control end_time" value="<?= $value->to_time ?>" name="end_time[]" id="end_time_<?= $i ?>" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-1 text-right">
                                        <?php if($i == 1){ ?>
                                        <button type="button" class="btn btn-info btn-sm btn-icon btn-circle"><i class="demo-psi-gear"></i></button>
                                        <?php }else{ ?>
                                        <button type='button' class='btn btn-danger btn-sm btn-icon btn-circle btn_remove action_button' id='remove_row_<?= $i ?>' data-id="<?= $i ?>"><i class='fa fa-minus'></i></button>
                                        <?php } ?>
                                    </div>
                                </div>
                                <?php }}else{ ?>
                                <div class="row row_line" data-id=1 id="row_line_1">
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <input class="magic-checkbox checklist_box" value="1" name="checklist_box[]" type="checkbox" data-id=1 id="checkbox_list_1">
                                                <label for="checkbox_list_1" class="checklist_box" data-id=1></label>
                                                <input type="hidden" name="check_list_status[]" value="0" data-id=1 id="check_list_status_1">
                                            </div>
                                            <input type="text" name="description[]" placeholder="Description…" class="form-control description" data-id=1 id="description_1"/>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div id="demo-dp-range">
                                            <div class="input-daterange input-group timepicker">
                                                <input type="text" class="form-control start_time" name="start_time[]" id="start_time_1" />
                                                <span class="input-group-addon">to</span>
                                                <input type="text" class="form-control end_time" name="end_time[]" id="end_time_1" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-1 text-right">
                                        <button type="button" class="btn btn-info btn-sm btn-icon btn-circle"><i class="demo-psi-gear"></i></button>
                                    </div>
                                </div>

                                <?php } ?>
                            </div>
                        </div>
                    </div>

                </div>
            </div> 
            <?php
                if(!$model->isNewrecord){
                    if($model->is_related_kpi == 1){
                        $this->render("//task/_form_view_kpi.php",[
                            'model' => $model,
                            'model_item' => $model_item,
                        ]); 
                    } 
                }else{ 
            ?>
                <div class="panel panel-bordered panel-mint kpiWrap">
                    <div class="panel-heading">
                        <h3 class="panel-title">K.P.I Milestone</h3>
                    </div> 
                    <div class="panel-body" style="margin-bottom: -20px;">
                        <div class="row">
                            <div class="col-md-12">  
                                <div class="text-danger text-normal pad-btm">Milestone will be generated after saved.</div> 
                            </div>
                        </div>
                    </div>
                </div> 
            <?php
                }
            ?>   
        </div>
        <div class="col-md-12">
            <?= $form->field($model, 'description')->textArea(['rows' => 5]) ?>
        </div>
    </div> 
    
    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>

<?php 

if(!$model->isNewRecord){
    $type = 0;
    $source_id = 0;
}
$project_start_date = '';
if($type == 1){
    $project = \backend\models\Project::findOne(['id'=>$source_id]);
    $project_start_date = $project->start_date;
}

$script = <<<JS

//========= start check is related to kpi or milestone

    $(document).on('change', '#is_related_kpi', function() {
        var id = $(this).data('id');
        if ($(this).is(':checked')) {
            $("#is_related_kpi").val(1);
            $("#kpi_status_1").val("K.P.I Status");
            $("#description_1").prop('required',false);
            $(".taskWrap").css("display", "none");
            $(".kpiWrap").css("display", "block"); 
            $(".class_kpi_status").css("display", "block");
        }else{
            $("#is_related_kpi").val(0);
            $("#kpi_status_1").val("Not Related K.P.I");
            $("#description_1").prop('required',true);
            $(".kpiWrap").css("display", "none");
            $(".class_kpi_status").css("display", "none");
            $(".taskWrap").css("display", "block");
        }
    }); 
    if ($("#is_related_kpi").is(':checked')) { 
        $(".taskWrap").css("display", "none");
        $(".kpiWrap").css("display", "block"); 
        $(".class_kpi_status").css("display", "block");
        $("#description_1").prop('required',false);
    }else{ 
        $(".kpiWrap").css("display", "none");
        $(".taskWrap").css("display", "block");
        $(".class_kpi_status").css("display", "none"); 
        $("#description_1").prop('required',true);
    }

    $("#task-id_employee_position").change(function(){  
        var id_employee_position = $(this).val(); 
        $.ajax({
            url: base_url+'/standard-operation/dependent',
            type: 'post',
            data: {
                id_employee_position: id_employee_position,
                action: 'get_sop_step'
            },
            success: function(response){


                var data = JSON.parse(response);
                console.log(data);
                var str = "";
                $.each(data['sop_step'],function(key,value){
                    str = str + '<option value="'+value.id+'">'+value.sop_step_name+'</option>';
                });
                $('#task-kpi_status').html(str);
                var str = "<option val=''></option>";
                $.each(data['employee'],function(key,value){
                    str = str + '<option value="'+value.id+'">'+value.name+'</option>';
                }); 

                $('#id_assign_to').html(str);
            }
        });

    }); 


//========= end check is related to kpi or milestone

    var type = $type;
    var source_id = $source_id;
    if(type == 1){
        $("#task-id_related_to").val(1).trigger("change");
        $("#task-id_related_profile").val(source_id).trigger("change");
    }

    var base_url = "$base_url";

    $(document).on('change','input[type=number]',function(){
        if($(this).val() == '' || $(this).val() < 0){
            $(this).val(0);
        }
    });

    //~~~~~~~~~~~~~~~Date Picker~~~~~~~~~~~~~~~~~~~

    $('#task-due_date, #task-start_date, #task-deadline').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
        todayHighlight: true
    });

    $("#task-start_date").change(function(){

        $('#task-due_date').datepicker('setStartDate', $(this).val());
        $('#task-deadline').datepicker('setStartDate', $(this).val());

        if(Date.parse($(this).val()) > Date.parse($('#task-due_date').val())){
            $('#task-due_date').datepicker('setDate', $(this).val());
        }

        if(Date.parse($(this).val()) > Date.parse($('#task-deadline').val())){
            $('#task-deadline').datepicker('setDate', $(this).val());
        }

    });


    if(Date.parse($("#task-start_date").val()) > 0){
        $('#task-due_date').datepicker('setStartDate', $("#task-start_date").val());
        $('#task-deadline').datepicker('setStartDate', $("#task-start_date").val());
    }


    if(type == 1){
        $('#task-start_date').datepicker('setStartDate', "$project_start_date");
        $('#task-due_date').datepicker('setStartDate', "$project_start_date");
    }

    //~~~~~~~~~~~~~~~End Date Picker~~~~~~~~~~~~~~~

    $("#task-id_related_to").change(function(){
        var text = $(this).select2('data')[0]['text'];
        $(".field-task-id_related_profile label").text(text);
        var id = $(this).val();

        $.ajax({
            url: base_url+'/task/dependent',
            type: 'post',
            data: {
                id: id,
                action: 'get_profile'
            },
            success: function(response){
                var data = JSON.parse(response);

                var str = "";
                $.each(data,function(key,value){
                    str = str + '<option value="'+value.id+'">'+value.profile_name+'</option>';
                });
                $('#task-id_related_profile').html(str);
            }
        });

    });

    $("#task-id_related_profile").change(function(){
        var id = $(this).val();
        var id_related = $("#task-id_related_to").val();

        $.ajax({
            url: base_url+'/task/dependent',
            type: 'post',
            data: {
                id: id,
                id_related: id_related,
                action: 'get_profile_detail'
            },
            success: function(response){
                var data = JSON.parse(response);

                $('#task-start_date').datepicker('setStartDate', data['start_date']);
                $('#task-due_date').datepicker('setStartDate', data['start_date']);
            }
        });

    });

    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ CheckList ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
            $('.timepicker input').timepicker({
            timeFormat: 'h:mm p',
            // minTime: '8',
            // maxTime: '17',
            dynamic: true,
        });
        
        checkListProgress();

        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Item Row ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

            var data_i = $(document).find('.description[data-id]:last').attr('data-id'); 
            var i = parseInt(data_i);
            var index = 1;

            $('#add_more').unbind('click');
            $('#add_more').bind('click', function (e){
                e.preventDefault();

                var item = $('.description[data-id='+i+']').val();
                if(item ==''){
                    // swal("Information", "Description can not blank!", "warning");
                    $('.description[data-id='+i+']').focus();
                    return false;
                }

                i++;
                index++;

                var previous_start_time = $(".start_time:last").val();
                var previous_end_time = $(".end_time:last").val();

                var string = "<div class='row row_line' data-id="+i+" id='row_line_"+i+"'>" +
                                "<div class='col-md-8'>" +
                                    "<div class='input-group'>" +
                                        "<div class='input-group-addon'>" +
                                            "<input class='magic-checkbox checklist_box' name='checklist_box[]' value=1 type='checkbox' data-id="+i+" id='checkbox_list_"+i+"'> " +
                                            "<label for='checkbox_list_"+i+"' class='checklist_box'></label>" +
                                            "<input type='hidden' name='check_list_status[]' data-id="+i+" id='check_list_status_"+i+"'>" +
                                        "</div>"+
                                        "<input type='text' name='description[]' placeholder='Description…' class='form-control description' data-id="+i+" id='description_"+i+"' required/>" +
                                    "</div>" +
                                "</div>" +
                                "<div class='col-md-3'>" +
                                    "<div id='demo-dp-range'>" +
                                        "<div class='input-daterange input-group timepicker'>" +
                                            "<input type='text' class='form-control start_time' name='start_time[]' value='"+previous_start_time+"' id='start_time_"+i+"' />" +
                                            "<span class='input-group-addon'>to</span>" +
                                            "<input type='text' class='form-control end_time' name='end_time[]' value='"+previous_end_time+"' id='end_time_"+i+"' />" +
                                        "</div>" +
                                    "</div>" +
                                "</div>" +
                                "<div class='col-md-1 text-right'>" +
                                    "<button type='button' class='btn btn-danger btn-sm btn-icon btn-circle btn_remove action_button' id='remove_row_"+i+"' data-id="+i+">" +
                                        "<i class='fa fa-minus'></i>" +
                                    "</button>" +
                                "</div>" +
                            "</div>" 
                            ;

                $('.calculate_item').append(string);
                $('.description[data-id='+i+']').focus();

                checkListProgress();
                
                $('.timepicker input').timepicker({
                    timeFormat: 'h:mm p',
                    // minTime: '8',
                    // maxTime: '17',
                    dynamic: true,
                });

            });

        $(document).on('click', '.btn_remove', function() {

            var current_id = $(this).attr('data-id'); 

            i--;
            var id = $(this).attr('data-id'); 
            $('#row_line_'+ id).remove();

            checkListProgress();
            
        });

        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ End Item ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


        function checkListProgress(){

            var numberOfChecked = $('.checklist_box:checkbox:checked').length;
            var totalCheckboxes = $('.checklist_box:checkbox').length;
            if(totalCheckboxes == 0){
                totalCheckboxes = 1;
            }
            var percentage = (numberOfChecked / totalCheckboxes ) * 100;
            percentage = parseFloat(percentage).toFixed(2);

            $("#check_list_progress").text(percentage +"%");
            $("#check_list_progress").css("width", percentage+"%");

            $(".checklist_box").change(function(){
                var numberOfChecked = $('.checklist_box:checkbox:checked').length;
                var totalCheckboxes = $('.checklist_box:checkbox').length;
                if(totalCheckboxes == 0){
                    totalCheckboxes = 1;
                }
                var percentage = (numberOfChecked / totalCheckboxes ) * 100;
                percentage = parseFloat(percentage).toFixed(2);

                $("#check_list_progress").text(percentage +"%");
                $("#task_progress").val(percentage);
                $("#check_list_progress").css("width", percentage+"%");
                
                var id = $(this).data('id');
                if($(this).is(':checked')){
                    $("#check_list_status_"+id).val(1);
                }else{
                    $("#check_list_status_"+id).val(0);
                }

            });
        }

    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ END CheckList ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

JS;

$this->registerJs($script);

?>
