<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use backend\models\UploadedFile;
use kartik\select2\Select2;
use backend\models\User;
use backend\models\UserType;

$base_url =  Yii::getAlias('@web');

$current_user_id = Yii::$app->user->getId();
$user = User::findOne($current_user_id);
$user_type_id = $user->user_type_id;
if (!$model->isNewRecord) { 
    if ($current_user_id !=1) {
        $user_type = ArrayHelper::map(\backend\models\UserType::find()
        ->where(['status' =>1])
        ->andWhere(['id'=>$model->user_type_id])
        ->all(), 'id', 'user_type_name');
    }else{
        $user_type = ArrayHelper::map(\backend\models\UserType::find()
        ->where(['status' =>1])
        ->all(), 'id', 'user_type_name');
    }
}else{
    $user_type = ArrayHelper::map(\backend\models\UserType::find()
    ->where(['status' =>1])
    ->all(), 'id', 'user_type_name');
}

$validationUrl = ['user/validation'];
if (!$model->isNewRecord){
$validationUrl['id'] = $model->id;
}
$position = ArrayHelper::map(\backend\models\EmployeePosition::find()
    ->where(['status' => 1])
    ->all(), 'id', 'position_type');

// $employee_profile = ArrayHelper::map(\backend\models\EmployeeProfile::find()
//     ->where(['status' => 1])
//     ->all(), 'id', function($model){
//         return $model->id_prefix . ' ' . $model->first_name . ' ' . $model->last_name;
//     });

// $employee_profile = Yii::$app->db->createCommand("
//     SELECT id, CONCAT(id_prefix, ' ', first_name, ' ', last_name) as name
//     FROM employee_profile
//     WHERE id NOT IN (SELECT id_employee FROM user)
//     AND status = 1
// ")
$employee_profile = Yii::$app->db->createCommand("
    SELECT a.id, CONCAT(a.id_prefix, ' ', a.first_name, ' ', a.last_name) as name
    FROM employee_profile a
    WHERE NOT EXISTS
		(SELECT b.id_employee FROM user b where a.id = b.id_employee ) 
		and a.`status` = 1
")
->queryAll();

if(!$model->isNewRecord){
    $model_employee = \backend\models\EmployeeProfile::findOne($model->id_employee);
    $employee_name = $model_employee->id_prefix . ' ' . $model_employee->first_name . ' ' . $model_employee->last_name;
    array_push($employee_profile, ['id'=>$model->id_employee, 'name'=>$employee_name]);
}

$employee_profile = ArrayHelper::map($employee_profile, 'id', 'name');


?>
<style type="text/css">
    .img-xxl {
        width: 225px;
        height: 225px;
    }
    .img-xl {
        width: 155px;
        height: 155px;
    }
    .select2-container--open {
        z-index: 9999999
    }
</style>
<div class="user-form">

   <?php $form = ActiveForm::begin([
    'id' => $model->formName(),
    'enableAjaxValidation' => false,
    'enableClientValidation' => true,
    'options' => ['autocomplete' => 'off'],
    'validationUrl' => $validationUrl
]); ?>

    <div class="row"> 
                
        <div class="col-md-12">  
            <?= $form->field($model, 'username')->textInput(['maxlength' => true]) ?> 
        </div>
        <div class="col-md-12">  
            <?= $form->field($model, 'password')->passwordInput(['maxlength' => true])->label($model->isNewRecord?'Password':'New Password') ?>  
        </div>
        <div class="col-md-12">
            <?= $form->field($model, 'confirm_password')->passwordInput(['maxlength' => true]) ?>  
        </div>
    
        <div class="col-md-12"> 
            <?= 
                $form->field($model, 'id_employee')->widget(Select2::classname(), [
                    'data' => $employee_profile,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Select'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]);
            ?>   
        </div>
        <div class="col-md-12"> 
            <?= 
                $form->field($model, 'user_type_id')->widget(Select2::classname(), [
                    'data' => $user_type,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Select'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]);
            ?>   
        </div>
        <div class="col-sm-12">
            <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
            <?php if ($model->status != 1) { $model->status = 0;} ?>
            <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
        </div>
    </div>

    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>
<?php 
 
$script = <<< JS


JS;

$this->registerJS($script);
?>
