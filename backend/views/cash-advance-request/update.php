<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CashAdvanceRequest */

$this->title = 'Update Cash Advance Request: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Cash Advance Requests', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="cash-advance-request-update">
    <?= $this->render('_form', [
        'model' => $model,
        'pay_type_name' => $pay_type_name,
        'is_approval' => $is_approval
    ]) ?>
</div>
