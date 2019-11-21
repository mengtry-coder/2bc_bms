<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\EmployeeProfile */

$this->title = 'Update Employee Profile: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Employee Profiles', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="employee-profile-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
