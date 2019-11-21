<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CustomerPayment */

$this->title = 'Update Customer Payment: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Customer Payments', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="customer-payment-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
