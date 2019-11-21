<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\SupplierDepartment */

$this->title = 'Update Supplier Department: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Supplier Departments', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="supplier-department-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
