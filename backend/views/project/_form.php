<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

$billing_type = ArrayHelper::map(\backend\models\BillingType::find()
    ->all(), 'id', 'name'); 

$status = ArrayHelper::map(\backend\models\ProjectStatus::find()
    ->all(), 'id', 'name'); 

$priority = ArrayHelper::map(\backend\models\Priority::find()
    ->all(), 'id', 'name'); 

$customer = ArrayHelper::map(\backend\models\CustomerProfile::find()
    ->all(), 'id', function($model){return $model->customer_name . ' ('.$model->company_name . ')';}); 

$employee_list = ArrayHelper::map(\backend\models\EmployeeProfile::find()
    ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;}); 

$date_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="demo-pli-calendar-4"></i></span> {input} </div>{error}{hint}';

$dollar_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="fa fa-dollar"></i></span> {input} </div>{error}{hint}';

$time_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="demo-pli-clock"></i></span> {input} </div>{error}{hint}';


$cut_off_day_tip = "Cut off day refer to exclusive number of the working day.<br> eg: Sunday, Public Holiday,…";
?>
<style type="text/css"> 
    .project-form .popover {
        min-width: 300px;
        z-index: 999999;
    }
    .row_line {
        padding-bottom: 15px;
    }
    .form-control-static {
        border: 1px solid rgba(0, 0, 0, 0.07);
        padding-left: 5px;
    }
</style>

<div class="project-form">

    <?php 

    $validationUrl = ['project/validation'];
    if (!$model->isNewRecord){
        $validationUrl['id'] = $model->id;
    }

    $form = ActiveForm::begin([
        'id' => $model->formName(),
        'enableAjaxValidation' => true,
        'enableClientValidation' => false,
        'options' => ['autocomplete' => 'off'],
        'validationUrl' => $validationUrl
    ]); 
    ?>
    <div class="row"> 
        <div class="col-md-12">
            <?= $form->field($model, 'project_name')->textInput(['maxlength' => true]) ?>
        </div>
    </div>

    <div class="row"> 
        <div class="col-md-12">
            <?= $form->field($model, 'id_customer')->widget(Select2::classname(), [
                    'data' => $customer,
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
        <div class="col-md-12">
            <?= $form->field($model, 'is_calculate')->checkbox(); ?>
        </div> 
    </div>

    <div class="row"> 
        <div class="col-md-12">
            <label for="project-range">Progress <span id="project-progress"><?=$model->isNewRecord?0:$model->project_progress?>%</span></label>
            <input type="hidden" name="project_range" id="project-progress-value">
            <input type="range" class="custom-range" min="0" max="100" value="<?=$model->isNewRecord?0:$model->project_progress?>" id="project-range" <?= $model->is_calculate == 1?'disabled':''; ?>>
            <div class="line15"></div>
        </div>
    </div>

    <div class="row"> 
        <div class="col-md-6">
            <?= $form->field($model, 'estimated_hour', ['template'=>$time_template])->textInput(['type' => 'number']) ?>
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
            <?= $form->field($model, 'start_date', ['template'=>$date_template])->textInput(['readonly' => true, 'style'=>'background: #fff !important;']) ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'due_date', ['template'=>$date_template])->textInput(['readonly' => true, 'style'=>'background: #fff !important;']) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <?= $form->field($model, 'deadline', ['template'=>$date_template])->textInput(['readonly' => true, 'style'=>'background: #fff !important;']) ?>
        </div>
        <div class="col-md-2">
            <?= $form->field($model, 'cut_off_day')->textInput(['type' => 'number', 'value'=>$model->isNewRecord?0:$model->cut_off_day])->label('Cut Off Day <a href="#" class="popover_content" data-html="true" data-original-title="Exclude Off Day" data-content="'.$cut_off_day_tip.'" data-placement="right" data-trigger="hover"><i class="fa fa-question-circle" aria-hidden="true"></i></a>')
            ?>
        </div>
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
    </div>

    <div class="row">
        <div class="col-md-12">
            <?php 
                if(!$model->isNewRecord){
                    $tag_arr = \backend\models\ProjectTag::find()
                        ->select('id_tag')
                        ->where(['id_project'=>$model->id])
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

                $data_tag = ArrayHelper::map(\backend\models\ProjectTag::find()->all(), 'id_tag', 'id_tag'); 

                     
            ?>
            <label>Tag</label>
            <?= Select2::widget([
                    'name' => 'tag[]',
                    'value'=>$row_tag,
                    'data' => $data_tag,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Select', 'multiple' => true, 'id'=>'project_tag'],
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
        <div class="col-md-12">
            <?php 
                if(!$model->isNewRecord){
                    $member_arr = \backend\models\ProjectMember::find()
                        ->select('id_employee')
                        ->where(['id_project'=>$model->id])
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
            <?= $form->field($model, 'description')->textArea(['rows' => 4]) ?>
        </div>
    </div>


    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>

<?php 

$script = <<<JS

    $(document).on('change','input[type=number]',function(){
        if($(this).val() == '' || $(this).val() < 0){
            $(this).val(0);
        }
    });

    //~~~~~~~~~~~~~~~Date Picker~~~~~~~~~~~~~~~~~~~

    $("#project-start_date").change(function(){

        $('#project-deadline').datepicker('setStartDate', $(this).val());

        if(Date.parse($(this).val()) > Date.parse($('#project-deadline').val())){
            $('#project-deadline').datepicker('setDate', $(this).val());
        }

    });

    //~~~~~~~~~~~~~~~End Date Picker~~~~~~~~~~~~~~~

    $('#project-due_date, #project-start_date, #project-deadline').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
    });


    $("#project-range").change(function(){
        var value = $(this).val();
        $("#project-progress").text(parseFloat(value).toFixed(2) + '%');
        $("#project-progress-value").val(parseFloat(value).toFixed(2));
    });


    $("#project-is_calculate").change(function(){
        if ($(this).is(':checked')) {
            $("#project-range").attr('disabled', true);
        } else{
            $("#project-range").attr('disabled', false);
        }
    });

    $('.popover_content').popover();

    $(document).on('change', '#checkbox_list', function() {
        var id = $(this).data('id');
        if ($(this).is(':checked')) {
            $("#is_under_kpi").val(1);
        }else{
            $("#is_under_kpi").val(0);
        }
    });

JS;

$this->registerJs($script);

?>