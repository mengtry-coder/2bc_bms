<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Proposal */

$this->title = 'Update Proposal: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Proposals', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="proposal-update">
    <?= $this->render('_form', [
        'model' => $model,
        'model_item' => $model_item
    ]) ?>
</div>
