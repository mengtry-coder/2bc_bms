<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;

$position = ArrayHelper::map(\backend\models\EmployeePosition::find()
    ->where(['status' => 1])
    ->all(), 'id', 'position_type');
$employee_profile = ArrayHelper::map(\backend\models\EmployeeProfile::find()
    ->where(['status' => 1])
    ->all(), 'id', function($model){
        return $model->id_prefix . ' ' . $model->first_name . ' ' . $model->last_name;
    }); 
$user_type = ArrayHelper::map(\backend\models\UserType::find()
    ->where(['status' =>1])
    ->all(), 'id', 'user_type_name');
?>

<style type="text/css">
    .select2-container { 
        z-index: 1;
    }
</style>

<div class="employee-profile-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <div class="col-md-2" style="margin-top: 23px;">
        <?= $form->field($model, 'globalSearch')->textInput(['placeholder' => 'Email'])->label(false) ?>
    </div> 
  
    <div class="col-md-2" style="margin-top: 23px;">
        <?= $form->field($model, 'id_employee')->widget(Select2::classname(), [
                'data' => $employee_profile,
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'options' => ['placeholder' => 'Employee'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false);
        ?>
    </div>
    <div class="col-md-2" style="margin-top: 23px;">
        <?= $form->field($model, 'id_position')->widget(Select2::classname(), [
                'data' => $position,
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'options' => ['placeholder' => 'Position'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false);
        ?>
    </div>
    <div class="col-md-2" style="margin-top: 23px;">
        <?= $form->field($model, 'user_type_id')->widget(Select2::classname(), [
                'data' => $user_type,
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'options' => ['placeholder' => 'User Type'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false);
        ?>
    </div>
    <div class="col-md-2" style="margin-top: 23px;">
    <?= $form->field($model, 'status')->widget(Select2::classname(), [
                'data' => (["1" => "Active","0" => "Inactive"]),
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'options' => ['placeholder' => 'Status'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false);
        ?>
    </div>


    <div class="form-group">
        <?= Html::submitButton('Search <i class="fa fa-search go-right"></i>', ['class' => 'btn btn-success btn-rounded margin-top-23']) ?>
        <div class="pull-right" style="margin-top: 23px;">
            <button type="button" data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['user/create']) ?>">                            Add New <i class="fa fa-plus-square go-right"></i>
            </button> 
        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<style>
.margin-top-23{
    margin-top: 23px;
}
</style>