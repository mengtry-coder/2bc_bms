<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\FinanceChartOfAccount */

$this->title = 'Create Finance Chart Of Account';
$this->params['breadcrumbs'][] = ['label' => 'Finance Chart Of Accounts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="finance-chart-of-account-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
