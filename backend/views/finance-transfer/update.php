<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\FinanceTransfer */

$this->title = 'Update Finance Transfer: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Finance Transfers', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="finance-transfer-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
