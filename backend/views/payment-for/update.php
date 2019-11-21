<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\PaymentFor */

$this->title = 'Update Payment For: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Payment Fors', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="payment-for-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
