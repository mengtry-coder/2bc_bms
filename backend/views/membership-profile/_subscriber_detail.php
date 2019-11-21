<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\MembershipProfile */
$class_id = Yii::$app->controller->id; 
@$id_membership_profile = $_GET['id'];

$this->title = 'Subscriber Profile';
$this->params['breadcrumbs'][] = ['label' => 'Subscriber', 'url' => ['subscriber']];
$this->params['breadcrumbs'][] = ['label' => $model->company_name];
$this->params['breadcrumbs'][] = 'Profile';
?>
<div class="membership-profile-subscriber-detail">
    <ul class="nav nav-tabs fa_style" style="border-bottom: none;">
        <li><?= Html::a('Profle', ['membership-profile/subscriber-detail','id' => $model->id], ['class' => 'membership-profile']) ?></li>
        <li><?= Html::a('Payment', ['membership-payment/subscriber','id_membership_profile' => $model->id], ['class' => 'membership-payment']) ?></li>
        <li><?= Html::a('Event', ['membership-event/subscriber', 'id_membership_profile' => $model->id], ['class' => 'membership-event']) ?></li>
        <li><?= Html::a('Document', ['membership-document/subscriber', 'id_membership_profile'=> $model->id], ['class' => 'membership-document']) ?></li>
    </ul>

    <div class="panel" style="border-top-left-radius: 0px;">
        <div class="panel-body">
        <p class="text-main text-bold">Subscriber Profile</p>
        <hr>
            <?= $this->render('_form', [
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