<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\ContractNote */

$this->title = 'Create Contract Note';
$this->params['breadcrumbs'][] = ['label' => 'Contract Notes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="contract-note-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
