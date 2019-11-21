<?php
use yii\helpers\Html;
$class_id = Yii::$app->controller->action->id;
@$id_quotation= $_GET['id_quotation'];

?>
    <ul class="nav nav-tabs fa_style" style="border-bottom: none;">
      <li><?= Html::a('Proposal Overview', ['quotation/overview','id' => $id_quotation], ['class' => 'overview']) ?></li>
      <li><?= Html::a('Note', ['quotation/note','id_quotation' => $id_quotation], ['class' => 'note']) ?></li>
    </ul>

<style media="screen">

a.<?=$class_id;?>{cursor: default; background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a:hover{background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a{background-color: #dbe3ec;transition: background-color,0.3s;}
</style>
