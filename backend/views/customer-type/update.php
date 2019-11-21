<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CustomerType */

$this->title = 'Update Customer Type: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Customer Types', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="customer-type-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
