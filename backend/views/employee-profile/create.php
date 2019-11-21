<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\EmployeeProfile */

$this->title = 'Create Employee Profile';
$this->params['breadcrumbs'][] = ['label' => 'Employee Profiles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="employee-profile-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
