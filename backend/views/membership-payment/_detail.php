<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\MembershipProfile */
$class_id = Yii::$app->controller->id; 
$this->title = 'Membership Payment';
$this->params['breadcrumbs'][] = ['label' => 'Membership Payment', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Payment';
?>
<div class="membership-payment-detail">
    <ul class="nav nav-tabs fa_style" style="border-bottom: none;">
        <li><?= Html::a('Profle', ['membership-profile/detail','id' => $model->id], ['class' => 'membership-profile']) ?></li>
        <li><?= Html::a('Payment', ['membership-payment/detail','id' => $model->id], ['class' => 'membership-payment']) ?></li>
        <li><?= Html::a('Event', ['event-list/index', 'transport' => $model->id], ['class' => 'transport-cancellation-policy']) ?></li>
        <li><?= Html::a('Contact List', ['transport-staff/index', 'transport'=> $model->id], ['class' => 'transport-staff']) ?></li>
    </ul>

    <div class="panel" style="border-top-left-radius: 0px;">
        <div class="panel-body">
        <p class="text-main text-bold">Membership Payment</p>
        <hr>
            <?= $this->render('_form_detail', [
                'model' => $model,
            ]) ?>
        </div>
    </div>
</div>

<style media="screen">
a.<?=$class_id;?>{cursor: default; background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a:hover{background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a{background-color: #dbe3ec;transition: background-color,0.3s;}
</style>