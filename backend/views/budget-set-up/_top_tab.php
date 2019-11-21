<?php
use yii\helpers\Html;
$class_id = Yii::$app->controller->action->id;

@$budget_setup_id = $_GET['id'];

?>
    <ul class="nav nav-tabs fa_style" style="border-bottom: none;">
        <li><?= Html::a('Buget Setup Overview', ['budget-set-up/view'], ['class' => 'view']) ?></li>
    </ul>

<style media="screen">

a.<?=$class_id;?>{cursor: default; background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a:hover{background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a{background-color: #dbe3ec;transition: background-color,0.3s;}
</style>
