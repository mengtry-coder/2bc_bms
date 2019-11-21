<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\FinanceTransfer */

$this->title = 'Create Finance Transfer';
$this->params['breadcrumbs'][] = ['label' => 'Finance Transfers', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="finance-transfer-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
