<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemGroupType */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="item-group-type-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row"> 
        <div class="col-md-12">
            
            <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

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