<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\EmployeeReport */

$this->title = 'Update Employee Report: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Employee Reports', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="employee-report-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
