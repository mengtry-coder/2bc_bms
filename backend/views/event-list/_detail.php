<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\MembershipProfile */
$class_id = Yii::$app->controller->id; 
@$id_event_list = $_GET['id'];

$this->title = 'Event Details';
$this->params['breadcrumbs'][] = ['label' => 'Event List', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->event_name];
$this->params['breadcrumbs'][] = 'Detail';
?>
<div class="event-list-detail">
    <ul class="nav nav-tabs fa_style" style="border-bottom: none;">
        <li><?= Html::a('Event Detail', ['event-list/detail','id' => $model->id], ['class' => 'event-list']) ?></li>
        <li><?= Html::a('Event Document', ['event-list/event-document','id_event_list' => $model->id], ['class' => 'event-document']) ?></li>
        <li><?= Html::a('Participation', ['event-list/participation','id_event_list' => $model->id], ['class' => 'participation']) ?></li>
    </ul>

    <div class="panel" style="border-top-left-radius: 0px;">
        <div class="panel-body">
        <p class="text-main text-bold">Event Details</p>
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