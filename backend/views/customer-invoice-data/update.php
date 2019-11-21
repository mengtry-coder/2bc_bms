<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CustomerInvoiceData */

$this->title = 'Update Customer Invoice Data: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Customer Invoice Datas', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="customer-invoice-data-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
