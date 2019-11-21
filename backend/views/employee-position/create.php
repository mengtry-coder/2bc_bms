<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\EmployeePosition */

$this->title = 'Create Employee Position';
$this->params['breadcrumbs'][] = ['label' => 'Employee Positions', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="employee-position-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
