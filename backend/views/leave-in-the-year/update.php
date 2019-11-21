<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\LeaveInTheYear */

$this->title = 'Update Leave In The Year: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Leave In The Years', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="leave-in-the-year-update">
    <?= $this->render('_form', [
        'model' => $model,
        'model_item' => $model_item
    ]) ?>
</div>
