<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\PaymentStatus */

$this->title = 'Create Payment Status';
$this->params['breadcrumbs'][] = ['label' => 'Payment Statuses', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="payment-status-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
