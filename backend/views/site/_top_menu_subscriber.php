<?php

use yii\helpers\Html;
$class_id = Yii::$app->controller->id; 
?>
    <ul class="nav nav-tabs fa_style" style="border-bottom: none;">
        <li><?= Html::a('Profle', ['membership-profile/subscriber-detail','id' => $id_membership_profile], ['class' => 'membership-profile']) ?></li>
        <li><?= Html::a('Payment', ['membership-payment/subscriber','id_membership_profile' => $id_membership_profile], ['class' => 'membership-payment']) ?></li>
        <li><?= Html::a('Event', ['membership-event/subscriber', 'id_membership_profile' => $id_membership_profile], ['class' => 'membership-event']) ?></li>
        <li><?= Html::a('Document', ['membership-document/subscriber', 'id_membership_profile'=> $id_membership_profile], ['class' => 'membership-document']) ?></li>
    </ul> 

<style media="screen">
 
a.<?=$class_id;?>{cursor: default; background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a:hover{background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a{background-color: #dbe3ec;transition: background-color,0.3s;}
</style>
