<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemGroupData */

$this->title = 'Update Item Group Data: ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Item Group Datas', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="item-group-data-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
