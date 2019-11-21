<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\SupplierProfile */

$this->title = 'Update Supplier Profile: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Supplier Profiles', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="supplier-profile-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
