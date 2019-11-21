<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\LeaveInTheYearData */

$this->title = 'Update Leave In The Year Data: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Leave In The Year Datas', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="leave-in-the-year-data-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
