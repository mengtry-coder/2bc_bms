<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

$email_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="demo-pli-mail"></i></span> {input} </div>{error}{hint}';

$phone_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="fa fa-mobile"></i></span> {input} </div>{error}{hint}';

?>

<div class="department-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-12">

        <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'phone_number', ['template'=> $phone_template])->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'email', ['template'=>$email_template])->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

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
