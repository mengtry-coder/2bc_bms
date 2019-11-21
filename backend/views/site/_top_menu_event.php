<?php

use yii\helpers\Html;
$class_id = Yii::$app->controller->action->id; 
 
?>
    <ul class="nav nav-tabs fa_style" style="border-bottom: none;">
        <li><?= Html::a('Event Detail', ['event-list/detail','id' => $id_event_list], ['class' => 'event-list']) ?></li>
        <li><?= Html::a('Event Document', ['event-list/event-document','id_event_list' => $id_event_list], ['class' => 'event-document']) ?></li>
        <li><?= Html::a('Participation', ['event-list/participation','id_event_list' => $id_event_list], ['class' => 'participation']) ?></li>
    </ul> 

<style media="screen">
 
a.<?=$class_id;?> {cursor: default; background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a:hover{background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a{background-color: #dbe3ec;transition: background-color,0.3s;}
</style>
