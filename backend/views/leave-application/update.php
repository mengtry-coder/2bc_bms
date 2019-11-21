<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\LeaveApplication */

$this->title = 'Update Leave Application: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Leave Applications', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="leave-application-update">
    <?= $this->render('_form', [
        'model' => $model,
        'is_approval' => $is_approval
    ]) ?>
</div>
