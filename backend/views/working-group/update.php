<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\WorkingGroup */

$this->title = 'Update Working Group: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Working Groups', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="working-group-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
