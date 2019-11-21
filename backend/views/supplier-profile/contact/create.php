<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Arrayhelper;
use kartik\select2\Select2;

use backend\components\InputTemplate;

$position = ArrayHelper::map(\backend\models\SupplierPosition::find()->where(['status'=>1])->orderBy(['name'=>SORT_ASC])->all(), 'id', 'name');
$department = ArrayHelper::map(\backend\models\SupplierDepartment::find()->where(['status'=>1, 'id'=>$model->department_id])->orderBy(['name'=>SORT_ASC])->all(), 'id', 'name');
$gender = ['1' => 'Male', '0' => 'Female'];
$prefix = ArrayHelper::map(\backend\models\DataOptionPrefix::find()
    ->where(['status' => 1])
    ->all(), 'names', 'names');

$date_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="fa fa-calendar"></i></span> {input} </div>{error}{hint}';


$base_url = Yii::getAlias('@web'); 
?>
<style type="text/css">
    .select2-container--default .select2-selection--single {
        border-radius:0 0.25rem 0.25rem 0 !important;
    }
</style>
<div class="customer-profile-contact-form">

    <?php 
        $form = ActiveForm::begin([
            'id' => $model->formName(),
            'enableAjaxValidation' => false,
            'enableClientValidation' => true,
            // 'options' => ['autocomplete' => 'off'],
        ]); ?>
    <div class="row"> 
        <div class="col-md-6">
            <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?> 
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'prefix')->widget(Select2::classname(), [
                    'data' => $prefix,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'addon' => [
                        'prepend' => [
                            'content' => '<i class="demo-pli-male-female"></i> '
                        ]
                    ],
                ]);
            ?> 
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'gender_id')->widget(Select2::classname(), [
                    'data' => $gender,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'addon' => [
                        'prepend' => [
                            'content' => '<i class="demo-pli-male-female"></i> '
                        ]
                    ],
                ]);
            ?> 
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <?= $form->field($model, 'date_of_birth', ['template' => $date_template])->textInput(['readonly' => true, 'style'=>'background: #fff !important;']) ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'credit_note')->textInput(['value' => $model->isNewRecord ? 0 : $model->credit_note, 'type'=>'number', 'step'=>1]) ?> 
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'mobile')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?> 
        </div>
    </div>
    <div class="row">
        <div class="col-md-3"> 
            <?= $form->field($model, 'position_id')->widget(Select2::classname(), [
                    'data' => $position,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => [
                        'placeholder' => 'Select',
                    ],
                    'pluginOptions' => [
                        'allowClear' => true
                    ]
                ]);
            ?> 
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'department_id')->widget(Select2::classname(), [
                    'data' => $model->isNewRecord ? [] : $department,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => [
                        'placeholder' => 'Select',
                    ],
                    'pluginOptions' => [
                        'allowClear' => true
                    ]
                ]);
            ?> 
        </div>
        <div class="col-md-6">               
            <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
            <?php if ($model->status != 1) { $model->status = 0;} ?>
            <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <?= $form->field($model, 'description')->textarea(['rows' => '4']) ?>
        </div>
    </div>  

    <div class="text-right"> 
        <?= Html::submitButton('<i class="btn-label fa fa-floppy-o"></i> Save', ['class' => 'btn btn-success btn-labeled btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>

<?php 

$script = <<<JS

    var base_url = "$base_url";

    $('#supplierprofilecontact-date_of_birth').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
        todayBtn: "linked",
    });
    
    $("#supplierprofilecontact-position_id").change(function(){
        var id = $(this).val();

        $.ajax({
            url: base_url+'/supplier-profile/dependent',
            type: 'post',
            data: {
                id: id,
                action: 'get_department'
            },
            success: function(response){
                var data = JSON.parse(response);
                var str = '';
                $.each(data,function(key,value){
                    str = str + '<option value="'+value.id+'">'+value.name+'</option>';
                });
                $('#supplierprofilecontact-department_id').html(str);
            }
        });

    }); 

JS;
$this->registerJs($script);

?>
