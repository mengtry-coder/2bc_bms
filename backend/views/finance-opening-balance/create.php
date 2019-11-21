<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\FinanceOpeningBalance */

$this->title = 'Create Finance Opening Balance';
$this->params['breadcrumbs'][] = ['label' => 'Finance Opening Balances', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="finance-opening-balance-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
