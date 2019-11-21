<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\BudgetSetupValue */

$this->title = 'Update Budget Setup Value: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Budget Setup Values', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="budget-setup-value-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
