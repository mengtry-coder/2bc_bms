<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\BudgetSetupValue */

$this->title = 'Create Budget Setup Value';
$this->params['breadcrumbs'][] = ['label' => 'Budget Setup Values', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="budget-setup-value-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
