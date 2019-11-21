<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

$base_url = Yii::getAlias('@web'); 
$user_position = Yii::$app->user->identity->id_position;
$user_id = Yii::$app->user->identity->id_employee; 

$priority = ArrayHelper::map(\backend\models\Priority::find()
    ->all(), 'id', 'name'); 

$related_to = ArrayHelper::map(\backend\models\TaskRelatedTo::find()
    ->all(), 'id', 'name'); 


if(Yii::$app->user->identity->id != 1){
    $employee_list = ArrayHelper::map(\backend\models\EmployeeProfile::find()->where(['id' => $user_id])
    ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;}); 
    $sopStep = ArrayHelper::map(\backend\models\StandardOperationStep::find()
    ->where(['status'=>1])
    ->andWhere(['id_employee_possition'=>$user_position])
    ->all(), 'id', 'name');
}else{
    $employee_list = ArrayHelper::map(\backend\models\EmployeeProfile::find()
        ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;}); 
    $sopStep = [];
}

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
}
$related_to_profile = ArrayHelper::map($response, 'id', 'profile_name'); 
 

?>
<style type="text/css">
    .row_line {
        padding-bottom: 15px;
    }
</style>
<div class="standardoperation-form">

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
    <div class="col-md-6">
        <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
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

<div class="row">
    <div class="col-md-6">
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
    </div>

    <div class="col-md-6">
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'assign_to')->widget(Select2::classname(), [
                        'data' => $employee_list,
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
                <?= $form->field($model, 'id_standard_operation_step')->widget(Select2::classname(), [
                        'data' => $sopStep,
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
    </div>
   
</div>
 
    <?= $form->field($model, 'description')->textArea(['rows' => 5]) ?>

    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>

<?php 
 
$script = <<<JS
     
    var base_url = "$base_url";

    $(document).on('change','input[type=number]',function(){
        if($(this).val() == '' || $(this).val() < 0){
            $(this).val(0);
        }
    });

    //~~~~~~~~~~~~~~~Date Picker~~~~~~~~~~~~~~~~~~~

    $('#standardoperation-due_date, #standardoperation-start_date, #standardoperation-deadline').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
        todayHighlight: true
    }); 

    //~~~~~~~~~~~~~~~End Date Picker~~~~~~~~~~~~~~~

    $("#standardoperation-id_related_to").change(function(){
        var text = $(this).select2('data')[0]['text'];
        $(".field-standardoperation-id_related_profile label").text(text);
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
                $('#standardoperation-id_related_profile').html(str);
            }
        });

    });

    $("#standardoperation-assign_to").change(function(){  
        var assign_to = $(this).val(); 
        $.ajax({
            url: base_url+'/standard-operation/dependent',
            type: 'post',
            data: {
                assign_to: assign_to,
                action: 'get_sop_step'
            },
            success: function(response){
                var data = JSON.parse(response);

                var str = "";
                $.each(data,function(key,value){
                    str = str + '<option value="'+value.id+'">'+value.sop_step_name+'</option>';
                });
                $('#standardoperation-id_standard_operation_step').html(str);
            }
        });

    });

    $("#standardoperation-id_related_profile").change(function(){
        var id = $(this).val();
        var id_related = $("#standardoperation-id_related_to").val();

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

                $('#standardoperation-start_date').datepicker('setStartDate', data['start_date']);
                $('#standardoperation-due_date').datepicker('setStartDate', data['start_date']);
            }
        });

    }); 

JS;

$this->registerJs($script);

?>
