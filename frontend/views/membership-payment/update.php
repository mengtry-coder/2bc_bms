<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\MembershipPayment */

$this->title = 'Update Membership Payment: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Membership Payments', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="membership-payment-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
