<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\MaritalStatus */

$this->title = 'Update Marital Status: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Marital Statuses', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="marital-status-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
