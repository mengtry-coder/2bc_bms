<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\PayrollType */

$this->title = 'Create Payroll Type';
$this->params['breadcrumbs'][] = ['label' => 'Payroll Types', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="payroll-type-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
