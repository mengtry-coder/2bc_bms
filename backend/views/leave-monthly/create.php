<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\LeaveMonthly */

$this->title = 'Create Leave Monthly';
$this->params['breadcrumbs'][] = ['label' => 'Leave Monthlies', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="leave-monthly-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
