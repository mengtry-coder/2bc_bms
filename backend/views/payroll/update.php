<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Payroll */

$this->title = 'Update Payroll: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Payrolls', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="payroll-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
