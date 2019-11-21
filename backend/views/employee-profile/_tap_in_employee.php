<?php
use yii\helpers\Html;
$class_id = Yii::$app->controller->action->id;

?>
    <ul class="nav nav-tabs fa_style" style="border-bottom: none;">
        <li><?= Html::a('Profile', ['employee-profile/profile','id' => $id_employee_profile], ['class' => 'profile']) ?></li>
        <li><?= Html::a('Project', ['employee-profile/project'], ['class' => 'project']) ?></li>
        <li><?= Html::a('Task', ['employee-profile/task'], ['class' => 'task']) ?></li>
        <li><?= Html::a('Document', ['employee-profile/document'], ['class' => 'document']) ?></li>
    </ul>

<style media="screen">

a.<?=$class_id;?>{cursor: default; background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a:hover{background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a{background-color: #dbe3ec;transition: background-color,0.3s;}
</style>
