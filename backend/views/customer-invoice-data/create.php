<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CustomerInvoiceData */

$this->title = 'Create Customer Invoice Data';
$this->params['breadcrumbs'][] = ['label' => 'Customer Invoice Datas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="customer-invoice-data-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
