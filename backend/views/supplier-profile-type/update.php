<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\SupplierProfileType */

$this->title = 'Update Supplier Profile Type: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Supplier Profile Types', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="supplier-profile-type-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
