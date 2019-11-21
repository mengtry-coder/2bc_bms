<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\FinanceJournalEntry */

$this->title = 'Update Finance Journal Entry: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Finance Journal Entries', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="finance-journal-entry-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
