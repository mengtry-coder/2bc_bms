<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

?>
<div class="row">
    <div class="col-md-12">
        <div class="bank-form">

            <?php $form = ActiveForm::begin([
                'id' => 'form_area',
                'enableAjaxValidation' => false,
                'enableClientValidation' => true,
            ]); ?>

            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'bank_name')->textInput() ?>
                </div>
                <div class="col-md-6">

                    <?= $form->field($model, 'account_type')->dropDownList
                    (
                        \yii\helpers\ArrayHelper::map(\backend\models\BankAccountType::find()->all(), 'id', 'names'),['prompt' => 'Select Account Type']);
                    ?>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'account_name')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="col-md-6">
                    <?= $form->field($model, 'account_number')->textInput(['maxlength' => true]) ?>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'bank_address')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6">
                            <?= $form->field($model, 'swift_code')->textInput(['maxlength' => true]) ?>
                        </div>
                        <div class="col-md-6">
                            <?php $model->isNewRecord ? $model->default = 0: $model->default = $model->default;?>
                            <?php if ($model->default != 1) { $model->default = 0;} ?>
                            <?= $form->field($model, 'default')->radioList(['1' => 'Set as default', '0' => 'None']) ?>        
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
                    <?php if ($model->status != 1) { $model->status = 0;} ?>
                    <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <?= $form->field($model, 'remark')->textArea(['rows'=>5]) ?>
                </div>
            </div>

            <div class="form-group pull-right">
                <?= Html::submitButton('Save', ['class' => 'btn btn-primary cus-button']) ?>
            </div>

            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>
