<?php
use yii\helpers\Html;
$class_id = Yii::$app->controller->action->id;
@$id_proposal = $_GET['id_proposal'];

?>
    <ul class="nav nav-tabs fa_style" style="border-bottom: none;">
      <li><?= Html::a('Proposal Overview', ['proposal/overview','id' => $id_proposal], ['class' => 'overview']) ?></li>
      <li><?= Html::a('Note', ['proposal/note','id_proposal' => $id_proposal], ['class' => 'note']) ?></li>
    </ul>

<style media="screen">

a.<?=$class_id;?>{cursor: default; background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a:hover{background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a{background-color: #dbe3ec;transition: background-color,0.3s;}
</style>
