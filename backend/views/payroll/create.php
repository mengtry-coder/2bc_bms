<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Payroll */

$this->title = 'Create Payroll';
$this->params['breadcrumbs'][] = ['label' => 'Payrolls', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="payroll-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
