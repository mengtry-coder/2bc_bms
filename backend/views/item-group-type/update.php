<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemGroupType */

$this->title = 'Update Item Group Type: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Item Group Types', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="item-group-type-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
