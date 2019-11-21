<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\PayrollRequest */

$this->title = 'Update Payroll Request: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Payroll Requests', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="payroll-request-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
