<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm; 
?>
<style>
    .select2-selection.select2-selection--single{
        height: 30px !important;
    }
    .modal {
        overflow-x: hidden;
        overflow-y: auto;
    }
</style>
<div class="membership-type-form">
    <?php $form = ActiveForm::begin(); ?> 
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'membership_type')->textInput(['maxlength' => true]) ?>
            </div>
            <div class="col-md-6">
                <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
                <?php if ($model->status != 1) { $model->status = 0;} ?>
                <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
            </div> 
            <div class="col-md-12">
                <?= $form->field($model, 'description')->textarea(['rows' => '6']) ?>
            </div>
        </div> 
        <div class="text-right"> 
            <?= 
                Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']);
            ?>  
        </div>   
    <?php ActiveForm::end(); ?>
</div>

