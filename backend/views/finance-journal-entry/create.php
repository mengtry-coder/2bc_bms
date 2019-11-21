<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\FinanceJournalEntry */

$this->title = 'Create Finance Journal Entry';
$this->params['breadcrumbs'][] = ['label' => 'Finance Journal Entries', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="finance-journal-entry-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
