<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Contract */

$this->title = 'Update Contract: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Contracts', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="contract-update">
    <?= $this->render('_form', [
        'model' => $model,
        'model_item' => $model_item
    ]) ?>
</div>
