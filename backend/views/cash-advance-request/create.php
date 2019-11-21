<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CashAdvanceRequest */

$this->title = 'Create Cash Advance Request';
$this->params['breadcrumbs'][] = ['label' => 'Cash Advance Requests', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cash-advance-request-create">
    <?= $this->render('_form', [
        'model' => $model,
        'pay_type_name' => $pay_type_name,
        'is_approval' => $is_approval
    ]) ?>
</div>
