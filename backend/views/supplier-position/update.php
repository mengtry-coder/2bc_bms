<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\SupplierPosition */

$this->title = 'Update Supplier Position: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Supplier Positions', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="supplier-position-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
