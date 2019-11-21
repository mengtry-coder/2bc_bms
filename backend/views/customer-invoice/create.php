<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CustomerInvoice */

$this->title = 'Create Customer Invoice';
$this->params['breadcrumbs'][] = ['label' => 'Customer Invoices', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="customer-invoice-create">
    <?= $this->render('_form', [
        'model' => $model,
        'project_id' => $project_id,
    ]) ?>
</div>
