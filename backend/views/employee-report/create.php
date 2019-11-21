<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\EmployeeReport */

$this->title = 'Create Employee Report';
$this->params['breadcrumbs'][] = ['label' => 'Employee Reports', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="employee-report-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
