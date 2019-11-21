<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\CustomerInvoiceDataSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="customer-invoice-data-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'id_customer_invoice') ?>

    <?= $form->field($model, 'item') ?>

    <?= $form->field($model, 'description') ?>

    <?= $form->field($model, 'qty') ?>

    <?php // echo $form->field($model, 'rate') ?>

    <?php // echo $form->field($model, 'amount') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
