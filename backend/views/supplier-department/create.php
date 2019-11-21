<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\SupplierDepartment */

$this->title = 'Create Supplier Department';
$this->params['breadcrumbs'][] = ['label' => 'Supplier Departments', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="supplier-department-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
