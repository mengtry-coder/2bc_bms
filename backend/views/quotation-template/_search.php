<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\QuotationTemplateSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="quotation-template-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'main_logo') ?>

    <?= $form->field($model, 'name') ?>

    <?= $form->field($model, 'essential') ?>

    <?= $form->field($model, 'main_features') ?>

    <?php // echo $form->field($model, 'support') ?>

    <?php // echo $form->field($model, 'hosting') ?>

    <?php // echo $form->field($model, 'description') ?>

    <?php // echo $form->field($model, 'inclusive_benefit') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'updated_by') ?>

    <?php // echo $form->field($model, 'updated_date') ?>

    <?php // echo $form->field($model, 'created_by') ?>

    <?php // echo $form->field($model, 'created_date') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
