<?php 
use yii\helpers\Html;
$class_id = Yii::$app->controller->action->id; 

@$id_project = $_GET['id_project'];

?> 
    <ul class="nav nav-tabs fa_style" style="border-bottom: none;">
        <li><?= Html::a('Profile Overview', ['project/overview','id' => $id_project], ['class' => 'overview']) ?></li>
        <li><?= Html::a('Task', ['project/task','id_project' => $id_project], ['class' => 'task']) ?></li>
        <li><?= Html::a('Timesheet', ['project/timesheet','id_project' => $id_project], ['class' => 'timesheet']) ?></li>
        <li><?= Html::a('Sale', ['project/sale-invoice','id_project' => $id_project], ['class' => 'sale-invoice sale-payment sale-expense sale-quotation']) ?></li>
        <li><?= Html::a('Document', ['project/document','id_project' => $id_project], ['class' => 'document']) ?></li>
        <li><?= Html::a('Note', ['project/note','id_project' => $id_project], ['class' => 'note']) ?></li>
    </ul> 

<style media="screen">
 
a.<?=$class_id;?>{cursor: default; background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a:hover{background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a{background-color: #dbe3ec;transition: background-color,0.3s;}
</style>
