<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

$department = ArrayHelper::map(\backend\models\SupplierDepartment::find()
    ->where(['status' => 1])
    ->all(), 'id', 'name');
?>

<div class="supplier-position-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row"> 
        <div class="col-md-12">
            
            <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <?= 
                $form->field($model, 'department_id')->widget(Select2::classname(), [
                    'data' => $department,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]);
            ?> 
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
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
