<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\FinanceChartOfAccount */

$this->title = 'Update Finance Chart Of Account: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Finance Chart Of Accounts', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="finance-chart-of-account-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
