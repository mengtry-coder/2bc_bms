<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\StandardOperation */

$this->title = 'Update Standard Operation: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Standard Operations', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="standard-operation-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
