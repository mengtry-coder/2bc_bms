<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CustomerInvoice */

$this->title = 'Update Customer Invoice: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Customer Invoices', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="customer-invoice-update">
    <?= $this->render('_form', [
        'model' => $model,
        'model_item' => $model_item,
        'model_customer' => $model_customer,
        'project_id' => 0,
    ]) ?>
</div>
