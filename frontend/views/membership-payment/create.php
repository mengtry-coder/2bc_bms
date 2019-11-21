<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\MembershipPayment */

$this->title = 'Create Membership Payment';
$this->params['breadcrumbs'][] = ['label' => 'Membership Payments', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="membership-payment-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
