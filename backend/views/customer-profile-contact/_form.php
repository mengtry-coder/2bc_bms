<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm; 
$request = Yii::$app->request; 
$id_customer_profile = $request->get('id_customer_profile',0);
// echo $id_customer_profile;
?>

<div class="customer-profile-contact-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row"> 
        <div class="col-md-6"> 
            <?= $form->field($model, 'contact_name')->textInput(['maxlength' => true]) ?> 

            <?= $form->field($model, 'phone')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'tel')->textInput(['maxlength' => true]) ?>

        </div>
        <div class="col-md-6"> 
            <?= $form->field($model, 'position')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'department')->textInput(['maxlength' => true]) ?> 

            <?= $form->field($model, 'email_address')->textInput(['maxlength' => true]) ?>
            
            <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
            <?php if ($model->status != 1) { $model->status = 0;} ?>
            <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <?= $form->field($model, 'note')->textarea(['rows' => '4']) ?>
            <?= $form->field($model, 'id_customer')->hiddenInput(['value'=>$id_customer_profile])->label(false)?>
        </div>
    </div>  
    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>
