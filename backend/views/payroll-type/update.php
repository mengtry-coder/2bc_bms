<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\PayrollType */

$this->title = 'Update Payroll Type: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Payroll Types', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="payroll-type-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
