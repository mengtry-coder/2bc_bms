<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\PayrollRequest */

$this->title = 'Create Payroll Request';
$this->params['breadcrumbs'][] = ['label' => 'Payroll Requests', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="payroll-request-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
