<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\BudgetSetUp */

$this->title = 'Create Budget Set Up';
$this->params['breadcrumbs'][] = ['label' => 'Budget Set Ups', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="budget-set-up-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
