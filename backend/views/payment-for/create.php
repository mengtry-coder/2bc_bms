<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\PaymentFor */

$this->title = 'Create Payment For';
$this->params['breadcrumbs'][] = ['label' => 'Payment Fors', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="payment-for-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
