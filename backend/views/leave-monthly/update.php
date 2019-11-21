<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\LeaveMonthly */

$this->title = 'Update Leave Monthly: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Leave Monthlies', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="leave-monthly-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
