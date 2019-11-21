<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\FinanceOpeningBalance */

$this->title = 'Update Finance Opening Balance: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Finance Opening Balances', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="finance-opening-balance-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
