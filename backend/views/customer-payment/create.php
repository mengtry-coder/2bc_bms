<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CustomerPayment */

$this->title = 'Create Customer Payment';
$this->params['breadcrumbs'][] = ['label' => 'Customer Payments', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="customer-payment-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
