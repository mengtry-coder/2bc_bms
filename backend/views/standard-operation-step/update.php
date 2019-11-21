<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\StandardOperationStep */

$this->title = 'Update Standard Operation Step: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Standard Operation Steps', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="standard-operation-step-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
